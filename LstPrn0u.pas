unit LstPrn0u;

interface

uses ComCtrls, Classes, Forms, Graphics,
     QuickRpt, QrCtrls, QrPrntr, Printers, SBLstv2u,
     OtMemTbl, db, ppEndUsr, ppReport, ppDBPipe,
     ppTypes, GenFunc, SBRBPrvw,
     BB_Lang;

type
  TPrintOrientation = (poVertical, poHorizont);

  TOnBeforeCreateMemTable = procedure (const AMemTable: TOtkbmMemTable) of object;

  PTColumnInfo = ^TColumnInfo;
  TColumnInfo = packed record
    Alignment: TAlignment;
    Size: LongInt;
    Width, Height : LongInt;
  end;

  TCustomPrintListView = class
  private
    FListView: TListView;
    FListViewSmartTabularView: TListViewSmartTabularView;
    FlQrlbTitulo: TQRLabel;
    FlQRBandHeader: TQRBand;
    FlQRBandDetail: TQRBand;

    FIndex: Integer;
    FFormReport: TForm;
    FQuickRep: TQuickRep;
    FlstLines : TStringList;
    FPrintOrientation: TPrintOrientation;
    FListColumnInfo: TList;
    FTitle: String;
    FSubTitle: String;
    FLinhaAtual, FColunaAtual : LongInt;
    FListDetail : TList;
{Eduardo - Inicio - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
    FImpLinhasHorizontais: Boolean;
{Eduardo - Fim - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}    
    //impressao
    procedure CalcSizeofColumns;
    procedure CreateReport;
    procedure BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure FreeListColumnInfo;
    function GetColumnInfo(const AColumn: LongInt): PTColumnInfo;
    procedure MountHeaderColumns;
    procedure MountLines;
    Procedure AddValues;
    procedure NeedData(Sender: TObject; var MoreData: Boolean);
    procedure PrepareReport;
    function GetFont: TFont;
    procedure SetFont(const Value: TFont);
  public
    constructor Create(const AListView: TListView; const ATabularView: TListViewSmartTabularView); virtual;
    destructor Destroy; override;
    procedure PrintListView(const ColIni: Integer; const Title, SubTitle: String);
    property PrintOrientation: TPrintOrientation read FPrintOrientation write FPrintOrientation;
    property Font: TFont read GetFont write SetFont;
{Eduardo - Inicio - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
    property ImpLinhasHorizontais : Boolean read FImpLinhasHorizontais write FImpLinhasHorizontais;
{Eduardo - Fim - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
  end;

  TCustomPrintLVRB = class
  private
    FVerificaChecked : Boolean;
    FSumEnabled: Boolean;
    FListView: TListView;
    FListViewSmartTabularView: TListViewSmartTabularView;
    FPipeName: String;
    FtbCampo  : TOtkbmMemTable;
    dsCampo  : TDataSource;
    ppDesigner: TppDesigner;
    ppReport: TppReport;
    ppDBPipe: TppDBPipeline;
    FListObjects: TList;
    FOnBeforeCreateMemTable: TOnBeforeCreateMemTable;
    procedure PrepareReport;
    procedure CriaTBReport;
    procedure DestroiTBReport;
    procedure AddFields(const tbCampo: TOtkbmMemTable);
    procedure ShowReport;
    procedure FreeObjects;
  protected
    procedure SetListDataSet(const AList: TStrings);
    procedure CreateMemTable(const ATable: TOtkbmMemTable);
    procedure MountReport(const ATable: TOtkbmMemTable);
    property SumEnabled: Boolean read FSumEnabled write FSumEnabled;
    property VerificaChecked: Boolean read FVerificaChecked write FVerificaChecked;

  public
    constructor Create(const AListView: TListView; const AListViewSmartTabularView: TListViewSmartTabularView;
                       const ASumEnabled: Boolean; const AVerificaChecked : Boolean;const PipeName: String = 'Tabela'; const CreateTables: Boolean = True); virtual;
    destructor Destroy; override;
    procedure PrintLVRB;
    procedure DirectPrintLVRB(const APath: String; const Parameters: TStringList; const TemplateFile: String = '';
                              const Action: Byte = 0; const AProc: TApplyFilterEvent = nil;
                              const AProc2: TAskForFilterEvent = nil;
                              const pShowDialogPrinter:Boolean = True);
    property OnBeforeCreateMemTable: TOnBeforeCreateMemTable read FOnBeforeCreateMemTable write FOnBeforeCreateMemTable; 
  end;

implementation

uses SysUtils, SBLstv0u,
     ppChrt,
     raIDE,
     ppCTDsgn;

function RetornaFormatado(const Text: String; const Alignment: TAlignment; const Size: LongInt) : String;
Const
  S = '                                                 ';
begin
  case Alignment of
    taLeftJustify: Result := Text + Copy(S,1, Size - length(Text));
    taRightJustify: Result := Copy(S, 1, Size - length(Text)) + Text;
    taCenter: begin
                Result := Copy(S, 1, (Size - length(Text)) div 2) + Text + Copy(S, 1, (Size - length(Text)) div 2);
                if Length(Result) < Size then
                  Result := Result + ' ';
              end;
  else
    Result := '';
  end;
end;

{ TCustomPrintListView }

procedure TCustomPrintListView.BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  FIndex := 0;
end;

constructor TCustomPrintListView.Create(const AListView: TListView; const ATabularView: TListViewSmartTabularView);
begin
  inherited Create;
  FListView := AListView;
  FListViewSmartTabularView := ATabularView;

  //cria o form que recebe o report
  FFormReport := TForm.Create(Application);
  FFormReport.Top := 100;
  FFormReport.Left := 0;
  FFormReport.Width := 784;
  FFormReport.Height := 400;
  FFormReport.Visible := False;

  FQuickRep := nil;
  FlstLines  := TStringList.Create;
  FListColumnInfo := TList.Create;

  FLinhaAtual := 0;
  FColunaAtual := 0;
  FListDetail := TList.Create;
end;

destructor TCustomPrintListView.Destroy;
begin
  FreeListColumnInfo;
  FListColumnInfo.Free;
  FFormReport.Free;
  FlstLines.Free;
  FListDetail.Free; //Nao precisa dar o free nos objetos por serem parent do relatorio
  inherited Destroy;
end;

function TCustomPrintListView.GetFont: TFont;
begin
  Result := FFormReport.Font;
end;

Procedure TCustomPrintListView.AddValues;
var
  Index : Integer;
  lColumns : PTColumnInfo;
  FQrlbDet : TQrLabel;
begin
  FlstLines.Clear;
  FLinhaAtual  := 5;
  FColunaAtual := 0;

  lColumns := GetColumnInfo(FIndex);
  For Index := 0 To FListView.Columns.Count -1 do
  begin
    FQrlbDet:=FListDetail.Items[index];
    if FQrlbDet <> nil then begin
       if Index = 0 then
          FQrlbDet.Caption := Trim(RetornaFormatado(FListView.Items.Item[FIndex].Caption, lColumns^.Alignment, lColumns^.Size))
       else FQrlbDet.Caption := Trim(RetornaFormatado(FListView.Items.Item[FIndex].SubItems[Index -1], lColumns^.Alignment, lColumns^.Size));
       if FListViewSmartTabularView.CorRelatorio then
          if clNone <> FListViewSmartTabularView.VisualColumns[Index].Color[FIndex] then
             FQrlbDet.Font.Color := FListViewSmartTabularView.VisualColumns[Index].Color[FIndex]
          else FQrlbDet.Font.Color := FListView.Font.Color;
    end;
  end;
end;

procedure TCustomPrintListView.NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := (FIndex < FListView.Items.Count);
  if MoreData then
  begin
    AddValues;
    FQuickRep.QRPrinter.Progress := (FIndex * 100) div FListView.Items.Count;
  end
  else
    FQuickRep.QRPrinter.Progress := 100;
  Inc(FIndex);
end;

procedure TCustomPrintListView.PrepareReport;
begin
  CreateReport;
  CalcSizeofColumns;
  MountHeaderColumns;
  MountLines;
end;

procedure TCustomPrintListView.PrintListView(const ColIni: Integer; const Title, SubTitle: String);
begin
  FTitle := Title;
  FSubTitle := SubTitle;
  PrepareReport;
  FQuickRep.Preview;
end;

procedure TCustomPrintListView.SetFont(const Value: TFont);
begin
  FFormReport.Font := Value;
end;

Procedure TCustomPrintListView.CreateReport;
var
  lQrlbCabecalho: TQRLabel;
  lQRSysDataEmissao: TQRSysData;
  lQRSysDataPagina: TQRSysData;
begin
  FQuickRep := TQuickRep.CreateNew(FFormReport);
  FQuickRep.PrintIfEmpty := True;
  FQuickRep.ShowProgress := True;
  FQuickRep.BeforePrint := BeforePrint;
  FQuickRep.OnNeedData := NeedData;
  FQuickRep.Left := 0;
  FQuickRep.Top  := 0;
  FQuickRep.Width  := Screen.Width;
  FQuickRep.Height := Screen.Height;
  FQuickRep.Font := FFormReport.Font;
  case FPrintOrientation of
    poVertical: begin
                  FQuickRep.Page.Orientation := poPortrait;
                  FQuickRep.PrinterSettings.Orientation := poPortrait;
                end;
    poHorizont: begin
                  FQuickRep.Page.Orientation := poLandscape;
                  FQuickRep.PrinterSettings.Orientation := poLandscape;
                end;
  end;
  FQuickRep.PrinterSettings.PaperSize := A4;

  { Header page }
  FlQRBandHeader := TQRBand.Create(FQuickRep);
  FlQRBandHeader.BandType := rbPageHeader;
  FlQRBandHeader.Top := 38;
  FlQRBandHeader.Left := 38;
  FlQRBandHeader.Parent := FQuickRep;
  FlQRBandHeader.ParentFont:=True;

  { Title of the report }
  lQrlbCabecalho := TQRLabel.Create(FlQRBandHeader);
  lQrlbCabecalho.Caption := FTitle;
  lQrlbCabecalho.ParentFont:=True;
  lQrlbCabecalho.Font.Style := [fsBold];
  lQrlbCabecalho.Top := 0;
  lQrlbCabecalho.Left := 0;
  lQrlbCabecalho.Parent := FlQRBandHeader;

  { SubTitle of the report }
  FlQrlbTitulo := TQRLabel.Create(FlQRBandHeader);
  FlQrlbTitulo.Caption := FSubTitle;
  FlQrlbTitulo.ParentFont:=True;
  FlQrlbTitulo.Font.Style := [fsBold];
  FlQrlbTitulo.Top := lQrlbCabecalho.Height + 10;
  FlQrlbTitulo.Left := 0;
  FlQrlbTitulo.Parent := FlQRBandHeader;

  lQRSysDataPagina:= TQRSysData.Create(FlQRBandHeader);
  lQRSysDataPagina.Data := qrsPageNumber;
  lQRSysDataPagina.ParentFont:=True;
  lQRSysDataPagina.Font.Style := [fsBold];
  lQRSysDataPagina.Top := 0;
  lQRSysDataPagina.Left := FlQRBandHeader.Width - FQuickRep.TextWidth(lQRSysDataPagina.Font, 'Pág. XXXXXX');
  lQRSysDataPagina.Text:= 'Pág. ';
  lQRSysDataPagina.Parent := FlQRBandHeader;

  lQRSysDataEmissao:= TQRSysData.Create(FlQRBandHeader);
  lQRSysDataEmissao.Data := qrsDateTime;
  lQRSysDataEmissao.ParentFont:=True;
  lQRSysDataEmissao.Font.Style := [fsBold];
  lQRSysDataEmissao.Top := 0;
  lQRSysDataEmissao.Left := lQRSysDataPagina.Left - FQuickRep.TextWidth(lQRSysDataEmissao.Font, 'Emissão : MMM' + ShortDateFormat + 'M' + LongTimeFormat);
  lQRSysDataEmissao.Text := 'Emissão : ';
  lQRSysDataEmissao.Parent := FlQRBandHeader;

  { Detail }
  FlQRBandDetail := TQRBand.Create(FQuickRep);
  FlQRBandDetail.BandType := rbDetail;
  FlQRBandDetail.Top := FlQRBandHeader.Top + FlQRBandHeader.Height;
  FlQRBandDetail.Left := FlQRBandHeader.Left;
  FlQRBandDetail.Height := 17;
  FlQRBandDetail.Width := FlQRBandHeader.Width;
  FlQRBandDetail.Parent := FQuickRep;
end;

procedure TCustomPrintListView.MountLines;
var
  Index : Integer;
  lColumns : PTColumnInfo;
  FQrlbDet : TQRLabel;
begin
  FlstLines.Clear;
  FLinhaAtual  := 5;
  FColunaAtual := 0;
{Eduardo - Inicio - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
  FlQRBandDetail.Frame.DrawBottom:= FImpLinhasHorizontais; //imprimir linhas horizontais entre as linhas de texto
{Eduardo - Fim - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
  for Index := 0 to FListView.Columns.Count -1 do
  begin
    lColumns := GetColumnInfo(Index);
    FQrlbDet:= TQRLabel.Create(FlQRBandDetail);
    FQrlbDet.Parent := FlQRBandDetail;
    FQrlbDet.ParentFont:=True;
    FQrlbDet.AutoStretch := False;

    if Index = 0 then
       FQrlbDet.Caption := RetornaFormatado(FListView.Items.Item[FIndex].Caption, lColumns^.Alignment, lColumns^.Size)
    else FQrlbDet.Caption := RetornaFormatado(FListView.Items.Item[FIndex].SubItems[Index -1], lColumns^.Alignment, lColumns^.Size);

    FQrlbDet.AutoSize := false;
    FQrlbDet.Width  := lColumns.Width;
    FQrlbDet.Height := lColumns.Height;
    FQrlbDet.AlignToBand := False;
    FQrlbDet.Left := FColunaAtual;
    FQrlbDet.Top := FLinhaAtual;
    FQrlbDet.Name := 'LabelDetalhe'+inttostr(Index);
    FQrlbDet.WordWrap := False;
    FQrlbDet.Alignment := lColumns^.Alignment;
    //FQrlbDet.Color:=ClAqua;
    FQrlbDet.visible :=true;
    FColunaAtual:=FColunaAtual+FQrlbDet.Width+10;
    if FColunaAtual > FlQRBandDetail.Width then begin
       FColunaAtual:=0;
       FLinhaAtual:=FLinhaAtual+FlQrlbTitulo.Height + 5;
       FQrlbDet.Left := FColunaAtual;
       FColunaAtual:=FQrlbDet.Width+10;
       FQrlbDet.Top := FLinhaAtual;
    end;
    FListDetail.Add(FQrlbDet);
  end;
  FlQRBandDetail.Height:=FLinhaAtual+FlQrlbTitulo.Height+2;
end;

procedure TCustomPrintListView.MountHeaderColumns;
var
  i: Integer;
  lColumns: PTColumnInfo;
  lQrlbHeaderColumn : TQRLabel;

begin
  FLinhaAtual:=FlQrlbTitulo.Top + FlQrlbTitulo.Height + 5;
  FColunaAtual:=0;
  for i := 0 to FListView.Columns.Count -1 do
  begin
    lColumns := GetColumnInfo(i);
    lQrlbHeaderColumn := TQRLabel.Create(FlQRBandHeader);
    lQrlbHeaderColumn.Parent := FlQRBandHeader;
    lQrlbHeaderColumn.ParentFont:=True;
    lQrlbHeaderColumn.AutoStretch := False;
    lQrlbHeaderColumn.Caption := FListView.Columns.Items[i].Caption;
    lQrlbHeaderColumn.AutoSize := false;
    lQrlbHeaderColumn.Width  := lColumns.Width;
    lQrlbHeaderColumn.Height := lColumns.Height;
    lQrlbHeaderColumn.AlignToBand := False;
    lQrlbHeaderColumn.Left := FColunaAtual;
    lQrlbHeaderColumn.Top := FLinhaAtual;
    lQrlbHeaderColumn.WordWrap := False;
    lQrlbHeaderColumn.Alignment := lColumns^.Alignment;
    //lQrlbHeaderColumn.Color:=ClLime;
    lQrlbHeaderColumn.visible :=true;
    FColunaAtual:=FColunaAtual+lQrlbHeaderColumn.Width+10;
    if FColunaAtual > FlQRBandHeader.Width then begin
       FColunaAtual:=0;
       FLinhaAtual:=FLinhaAtual+FlQrlbTitulo.Height + 5;
       lQrlbHeaderColumn.Left := FColunaAtual;
       FColunaAtual:=lQrlbHeaderColumn.Width+10;
       lQrlbHeaderColumn.Top := FLinhaAtual;
    end;
  end;
  FlQRBandHeader.Height:=FLinhaAtual+FlQrlbTitulo.Height+2;
  FlQRBandHeader.Frame.DrawBottom := True;
end;

procedure TCustomPrintListView.FreeListColumnInfo;
var
  i: LongInt;
begin
  try
    for i := 0 to FListColumnInfo.Count -1 do
      Dispose(FListColumnInfo[i]);
  finally
    FListColumnInfo.Clear;
  end;
end;

function TCustomPrintListView.GetColumnInfo(const AColumn: Integer): PTColumnInfo;
var
  i: Integer;
  P: ^TColumnInfo;
begin
  for i := FListColumnInfo.Count to AColumn do
  begin
    New(P);
    P^.Alignment := taLeftJustify;
    P^.Size := 0;
    FListColumnInfo.Add(P);
  end;
  Result := FListColumnInfo[AColumn];
end;

procedure TCustomPrintListView.CalcSizeofColumns;
{ definir o tamanho maximo de cada coluna }
var
  i, j: Integer;
  MaxItems, MaxColumns: Integer;
  lColumns: PTColumnInfo;
begin
  MaxItems := FListView.Items.Count -1;
  MaxColumns := FListView.Columns.Count -1;
  for j := 0 to MaxColumns do
  begin
    lColumns := GetColumnInfo(j);
    lColumns.Alignment := FListView.Columns.Items[j].Alignment;
    lColumns.Size   := Length(FListView.Columns.Items[j].Caption);
    lColumns.Width  := FListView.Canvas.TextWidth(FListView.Columns.Items[j].Caption)+3;
    lColumns.Height := FListView.Canvas.TextHeight(FListView.Columns.Items[j].Caption);
    if j = 0 then
    begin
      for i := 0 to MaxItems do
      begin
        if lColumns.Size < Length(FListView.Items.Item[i].Caption) then
           lColumns.Size := Length(FListView.Items.Item[i].Caption);
        if lColumns.Width < FListView.Canvas.TextWidth(FListView.Items.Item[i].Caption) then
           lColumns.Width  := FListView.Canvas.TextWidth(FListView.Items.Item[i].Caption)+3;
        if lColumns.Height < FListView.Canvas.TextHeight(FListView.Items.Item[i].Caption) then
           lColumns.Height  := FListView.Canvas.TextHeight(FListView.Items.Item[i].Caption);
      end;
    end
    else
      for i := 0 to MaxItems do
      begin
        if lColumns.Size < Length(FListView.Items.Item[i].SubItems[j -1]) then
           lColumns.Size := Length(FListView.Items.Item[i].SubItems[j -1]);
        if lColumns.Width < FListView.Canvas.TextWidth(FListView.Items.Item[i].SubItems[j -1]) then
           lColumns.Width  := FListView.Canvas.TextWidth(FListView.Items.Item[i].SubItems[j -1])+3;
        if lColumns.Height < FListView.Canvas.TextHeight(FListView.Items.Item[i].SubItems[j -1]) then
           lColumns.Height  := FListView.Canvas.TextHeight(FListView.Items.Item[i].SubItems[j -1]);
      end;
  end;
end;


//Luciano Inicio 29/10/01

{ TCustomPrintLVRB }

constructor TCustomPrintLVRB.Create(const AListView: TListView;
  const AListViewSmartTabularView: TListViewSmartTabularView;
  const ASumEnabled: Boolean;
  const AVerificaChecked : Boolean;
  const PipeName: String = 'Tabela';
  const CreateTables: Boolean = True);
begin
  inherited Create;
  FListView := AListView;
  FListViewSmartTabularView := AListViewSmartTabularView;
  FPipename := Pipename;
  if CreateTables then
  begin
    CriaTBReport;
    AddFields(FtbCampo);
  end;
  FSumEnabled := ASumEnabled;
  FVerificaChecked := AVerificaChecked;
  FListObjects := TList.Create;
  FOnBeforeCreateMemTable := nil;
end;

destructor TCustomPrintLVRB.Destroy;
begin
  DestroiTBReport;
  FreeObjects;
  FListObjects.Free;
  inherited;
end;

procedure TCustomPrintLVRB.MountReport(const ATable: TOtkbmMemTable);
var
  i, j: Integer;
  MaxItems, MaxColumns: Integer;
  lName: String;
begin
  if FSumEnabled then
    MaxItems := FListView.Items.Count -2
  else MaxItems := FListView.Items.Count -1;
  MaxColumns := FListView.Columns.Count -1;
  with ATable do
  begin
    Close;
    DisableControls;

    try
      Open;
      for i := 0 to MaxItems do
      begin
        if  (not FVerificaChecked)
        or (FListView.Items.Item[i].Checked) then
            begin
              Append;
              for j := 0 to MaxColumns do
              begin
                lName := FListView.Columns.Items[j].Caption;
                if Trim(lName) = '' then
                  lName := FListViewSmartTabularView.VisualColumns[j].Name;
                if   j = 0 then
                   begin
                     case FListViewSmartTabularView.VisualColumns[j].SumMode of
                       smNotSum:
                         begin
                           case FListViewSmartTabularView.VisualColumns[j].ColumnType of
                             ctString,
                             ctDate: FieldByName(lName).AsString:= FListView.Items.Item[i].Caption;
                             ctInteger: FieldByName(lName).AsInteger:= IntegerOf(FListView.Items.Item[i].Caption);
                             ctFloat: FieldByName(lName).AsFloat:= floatof(FListView.Items.Item[i].Caption);
                           end;
                         end;
                       smInteger: FieldByName(lName).AsInteger:= IntegerOf(FListView.Items.Item[i].Caption);
                       smFloat: FieldByName(lName).AsFloat:= floatof(FListView.Items.Item[i].Caption);
                     end;
                   end
                else
                   begin
                     case FListViewSmartTabularView.VisualColumns[j].SumMode of
                       smNotSum:
                         begin
                            case FListViewSmartTabularView.VisualColumns[j].ColumnType of
                             ctString,
                             ctDate: FieldByName(lName).AsString:= FListView.Items.Item[i].SubItems[j -1];
                             ctInteger: FieldByName(lName).AsInteger:= IntegerOf(FListView.Items.Item[i].SubItems[j -1]);
                             ctFloat: FieldByName(lName).AsFloat:= floatof(FListView.Items.Item[i].SubItems[j -1]);
                           end;
                         end;
                       smInteger: FieldByName(lName).AsInteger:= IntegerOf(FListView.Items.Item[i].SubItems[j -1]);
                       smFloat: FieldByName(lName).AsFloat:= floatof(FListView.Items.Item[i].SubItems[j -1]);
                     end;

                   end;
              end;
              Post;
            end;
      end;
    finally
       EnableControls;
    end;
  end;
end;

procedure TCustomPrintLVRB.PrepareReport;
begin
  MountReport(FtbCampo);
end;

procedure TCustomPrintLVRB.CriaTBReport;
begin
  FTBCampo:= TOtkbmMemTable.Create(FListView);
  FTBCampo.Active:= False;

  DSCampo:= TDataSource.Create(FListView);
  DSCampo.AutoEdit:= True;
  DSCampo.DataSet:= FTBCampo;
  DSCampo.Enabled:= True;

  ppDBPipe:= TppDBPipeline.Create(FListView);
  ppDBPipe.AutoCreateFields:= True;
  ppDBPipe.CloseDataSource:= True;
  ppDBPipe.DataSource:= dsCampo;
  ppDBPipe.Name := FPipeName;

  ppReport:= TppReport.Create(FListView);
  ppReport.AutoStop := False;
  ppReport.DataPipeline := ppDBPipe;
  ppReport.NoDataBehaviors := [ndBlankReport];
  ppReport.PrinterSetup.BinName := 'Default';
  ppReport.PrinterSetup.DocumentName := 'Report';
  ppReport.PrinterSetup.PaperName := 'A4 (210 x 297 mm)';
  ppReport.PrinterSetup.PrinterName := 'Default';
  ppReport.Template.SaveTo := stFile;
  ppReport.Template.Format := ftASCII;
  ppReport.DeviceType := dtScreen;
//  ppReport.Language := lgPortugueseBrazil;
  case GetCurrentLanguage of
    vlDefault,
    vlPortugues: ppReport.Language := lgPortugueseBrazil;
    vlEspanhol: ppReport.Language := lgSpanish;
  end;

  ppDesigner:= TppDesigner.Create(FListView);
  ppDesigner.AllowDataSettingsChange := True;
  ppDesigner.Caption := 'SGT - Report Builder';
  ppDesigner.DataSettings.DatabaseName := 'DBApp';
  ppDesigner.DataSettings.SessionType := 'BDESession';
  ppDesigner.DataSettings.AllowEditSQL := True;
  ppDesigner.DataSettings.UseDataDictionary := True;
  ppDesigner.Position := poScreenCenter;
  ppDesigner.Report := ppReport;
  ppDesigner.IniStorageType := 'IniFile';
  ppDesigner.IniStorageName := '($WINSYS)\RBuilder.ini';
end;

procedure TCustomPrintLVRB.DestroiTBReport;
begin
  ppDesigner.Free;
  ppReport.Free;
  ppDBPipe.Free;
  DSCampo.Free;
  FTBCampo.Free;
end;

procedure TCustomPrintLVRB.ShowReport;
begin
  ppDesigner.ShowModal;
end;

procedure TCustomPrintLVRB.PrintLVRB;
begin
  PrepareReport;
  ShowReport;
end;

procedure TCustomPrintLVRB.DirectPrintLVRB(const APath: String; const Parameters: TStringList; const TemplateFile: String = ''; const Action: Byte = 0; const AProc: TApplyFilterEvent = nil; const AProc2: TAskForFilterEvent = nil; const pShowDialogPrinter:Boolean = True);
begin
  PrepareReport;

  TfrmSBRBPreview.Execute(APath, ppDBPipe, CFGNametoCFGReport(FListViewSmartTabularView.Path + FListView.Name + IntToStr(FListView.Tag)), TemplateFile, Parameters, Action, AProc, AProc2, pShowDialogPrinter);
end;

procedure TCustomPrintLVRB.SetListDataSet(const AList: TStrings);
var
  iDataSet: Longint;
  lDataSource: TDataSource;
  lPipeLine: TppDBPipeline;
begin
  for iDataSet := 0 to AList.Count -1 do
  begin
    lDataSource := TDataSource.Create(FListView);
    lDataSource.DataSet := TDataSet(AList.Objects[iDataSet]);

    lPipeLine := TppDBPipeline.Create(FListView);
    lPipeLine.AutoCreateFields:= True;
    lPipeLine.CloseDataSource:= False; // nao fechar automaticamente
    lPipeLine.DataSource := lDataSource;
    lPipeLine.Name := 'EXT' + TDataSet(AList.Objects[iDataSet]).Name;

    if Trim(AList[iDataSet]) <> '' then
    begin
      TOtkbmMemTable(AList.Objects[iDataSet]).MasterSource := dsCampo;
      TOtkbmMemTable(AList.Objects[iDataSet]).MasterFields := AList[iDataSet];
    end;

    FListObjects.Add(lPipeLine);
    FListObjects.Add(lDataSource);
  end;
end;

procedure TCustomPrintLVRB.FreeObjects;
var
  i: Longint;
begin
  try
    for i := 0 to FListObjects.Count -1 do
      TObject(FListObjects[i]).Free;
  finally
    FListObjects.Clear;
  end;
end;

procedure TCustomPrintLVRB.AddFields(const tbCampo: TOtkbmMemTable);
var
  i: Integer;
  MaxColumns: Integer;
  lName: String;
begin
  MaxColumns := FListView.Columns.Count -1;
  with TBCampo do
  begin
    Close;
    MasterSource:=nil;
    // Define data fields.
    with TBCampo.FieldDefs do
    begin
      Clear;
      for i := 0 to MaxColumns do
      begin
        // validar nome vazio
        lName := FListView.Columns.Items[i].Caption;
        if Trim(lName) = '' then
          lName := FListViewSmartTabularView.VisualColumns[i].Name;
        case FListViewSmartTabularView.VisualColumns[i].SumMode of
          smNotSum:
            case FListViewSmartTabularView.VisualColumns[i].ColumnType of
              ctString: Add(lName, ftString, 255, false);
              ctDate: Add(lName, ftString, 30, false);
              ctInteger: Add(lName, ftInteger, 0, false);
              ctFloat: Add(lName, ftFloat, 0, false);
            end;
          smInteger: Add(lName, ftInteger, 0, false);
          smFloat: Add(lName, ftFloat, 0, false);
        end;
      end;
    end;

    if Assigned(FOnBeforeCreateMemTable) then
      FOnBeforeCreateMemTable(TBCampo);
      
    CreateTable;
  end;
end;

procedure TCustomPrintLVRB.CreateMemTable(const ATable: TOtkbmMemTable);
begin
  ATable.EmptyTable;
  ATable.Close;
  ATable.FieldDefs.Clear;
  AddFields(ATable);
end;

end.
