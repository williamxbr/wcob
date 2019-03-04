unit SBLstV1u;

interface

uses ComCtrls, Controls, SysUtils, {Registry,} Windows, SBLstV0u, SBLstV0f,
     Classes, Dialogs, GenFunc, SBMathEx, SBLstV2f, SBLstv3u, LstFil1u;

type
  TListViewTabularView = class;
  TCalcColumn = class;

  TBuildViewEvent = procedure (Sender: TListViewTabularView) of object;
  TAddLinesProgressEvent  = procedure (const Position, Max: Integer) of object;
  TSwapProc = procedure (const Order: TOrderType) of object;

  TListViewTabularView = class(TGenericTabularView)
  private
    FBeforeSwapProc: TSwapProc;
    FAfertSwapProc: TSwapProc;
//    FFixColumns: Integer;
{begin Arnoldo - 25/07/2001}
    FCorRelatorio : Boolean;
{End Arnoldo - 25/07/2001}
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
    FLarguraFixa : Boolean;
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
//    FFixColumn: Integer;
    FList: TList;
    FPath: String;
    FImpMode: Integer;
{Eduardo - Inicio - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
    FImpLinhasHorizontais: Boolean;
{Eduardo - Fim - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
    //****************** Colunas Calculadas *****************
    FCurrentLine: Integer;
    FMathExpression: TMathExpression;
    FCalcColumns: TList;
    FCalcColumnLoaded: Boolean;
    //*******************************************************
    FColumnConf: TFSBColumnConf;
    FUpdating: Boolean;
    procedure ConfigureCalcCols(Sender: TObject);
    procedure SalveAs(Sender: TObject);
    procedure LoadFrom(Sender: TObject);
    procedure DeleteConf(Sender: TObject);
    procedure FreeCalcColumns;
    function  DisplayConfigurations: Boolean;
    function  OriginalNameofRegisterKey: String;
    procedure UpdateColumnSize;

  protected
    FViewActive: Boolean;
    FActualSort: Integer;
    FListView: TListView;
    FOnBuildView: TBuildViewEvent;
    FOnAddLinesProgress: TAddLinesProgressEvent;
    FStartIndex,
    FUltimaPosicao : Integer;
    FRegNameSave: String;
    FListViewFilter: TAbstractCustomListViewFilter;
    procedure AddListViewColumns;
    procedure LoadCalcColumnsConfiguration;
    procedure AddListViewLines; virtual;
    procedure AddListViewCalcLines;
    Procedure AdicionaItems(const Start, Last: Integer);
    procedure SaveColumnConfiguration;
    procedure LoadColumnConfiguration;
    procedure DoOriginalClick(Sender: TObject);
    function NameofRegisterKey: String; virtual;
    function ValidateColumnConfiguration: Boolean;
    procedure GetDataValue(Variable: String; var Value: Extended);
    procedure InternalExecute; override;
    function CFGFileName: String;
    function CFGFileNameCalc: String;
    procedure MarkDelete(const ALine: Longint);
  public
    constructor Create(ListView: TListView; const AListViewFilter: TAbstractCustomListViewFilter); virtual;
    destructor Destroy; override;
    procedure UpdateLine(const Line: Integer);
    Procedure ExecuteAdicionaLinha;
    procedure ConfigureView;
    procedure ClearColumns; override;
    procedure DoColumnClick(Column: TListColumn);
    function Retorna_Caption_Coluna_List_View(Posicao_X : Longint; // posicao X da linha do list view
                  var Coluna:Longint; //coluna onde esta o caption que retorna
                  Sender: TObject):string;  // sender do listview
    function Locate(const Argument: String; const AColumn: Integer): Integer;
    procedure SetPath(const APath: String);
    property OnBuildView: TBuildViewEvent read FOnBuildView write FOnBuildView;
    property OnAddLinesProgress: TAddLinesProgressEvent read FOnAddLinesProgress write FOnAddLinesProgress;
    property BeforeSwapProc: TSwapProc read FBeforeSwapProc write FBeforeSwapProc; // Utilizada nas Rotinas de Tela para Trocar os Valores
    property AfertSwapProc: TSwapProc read FAfertSwapProc write FAfertSwapProc; // Utilizada nas Rotinas de Tela para Trocar os Valores
    property UltimaPosicao : Integer read FUltimaPosicao write FUltimaPosicao;
    property StartIndex : Integer read FStartIndex write FStartIndex;
//    property FixColumns: Integer read FFixColumns write FFixColumns;
//    property FixColumn: Integer read FFixColumn write FFixColumn;
    property List: TList read FList write FList;
    property ImpMode: Integer read FImpMode write FImpMode;
{Eduardo - Inicio - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
    property ImpLinhasHorizontais: Boolean read FImpLinhasHorizontais write FImpLinhasHorizontais;
{Eduardo - Fim - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
    property Updating: Boolean read FUpdating write FUpdating;
    property ViewActive: Boolean read FViewActive;
{begin Arnoldo - 25/07/2001}
    property CorRelatorio : Boolean read FCorRelatorio write FCorRelatorio;
{End Arnoldo - 25/07/2001}
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
    property LarguraFixaColuna : Boolean read FLarguraFixa Write FLarguraFixa;
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
    property Path: String read FPath;
  end;

  TCalcColumn = class
  private
    FExpression: String;
    FColumn: TTabularViewColumn;
  public
    property Expression: String read FExpression write FExpression;
    property Column: TTabularViewColumn read FColumn write FColumn;
  end;


  ECalcColumnError = class(Exception);

implementation

uses FileCtrl, IniFiles, SBLstv1f;

resourcestring
  PROGRAMERRORNOEQUALCOLUMNS = 'Erro, configuração não parece ser válida';

const
  RegistryKey: String = 'Software\Operacional Textil\TabularView\';
  STRColumnAux = 'CFG';
//  STRFixColumns = 'FixColumnsCount';
  STRImpMode = 'ImpMode';
  STRLarguraFixa = 'LarguraFixa';
  CFGDIR = 'CFGDIR\';
  STR_CFGFileName = 'smrtlst.cfg';
  STR_CFGFileCOL = 'smrtcol.cfg';
  CFGEXT = '.cfg';

{ TListViewTabularView }

procedure TListViewTabularView.AddListViewColumns;
var
  i: Integer;
begin
  FUpdating := True;
  FListView.Columns.Clear;
  for i:=0 to FColumnsList.Count - 1 do
      if   Columns[i].Visible then
      begin
        with FListView.Columns.Add do
        begin
          Caption:=Columns[i].Caption;
          Alignment:=Columns[i].Alignment;
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
          if   FLarguraFixa then
               Width := Columns[i].SaveWidth
          else
          if   trim(Columns[i].Caption) = '' then
               width := 22
          else
               Width:=FListView.Canvas.TextWidth(Columns[i].Caption) + 15;
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
          Columns[i].Width := Width;
          Columns[i].VisualIndex := Index;
          Columns[i].LarguraFixa := FLarguraFixa;

          Tag:=Integer(FColumnsList[i]);
        end;
      end
      else
      begin
        Columns[i].Width := 0;
        Columns[i].VisualIndex := -1;
      end;
// edu - se não tiver nenhuma coluna visivel causa um AV e não tem como voltar a alteração
  if FListView.Columns.Count = 0 then
  begin
    Columns[0].Visible := True;
    with FListView.Columns.Add do
    begin
      Caption:=Columns[0].Caption;
      Alignment:=Columns[0].Alignment;
      Width := 22;
      Columns[0].Width := Width;
      Columns[0].VisualIndex := Index;
      Tag:=Integer(FColumnsList[0]);
    end;
  end;
// edu - se não tiver nenhuma coluna visivel causa um AV e não tem como voltar a alteração 
  FUpdating := False;
end;

function TListViewTabularView.Retorna_Caption_Coluna_List_View(Posicao_X : Longint; // posicao X da linha do list view
                                                      var Coluna:Longint; //coluna onde esta o caption que retorna
                                                      Sender: TObject):string;  // sender do listview
var
  Col,
  Soma : longint;
Begin
  Coluna := 0;
  if  Sender <> nil Then
      Begin
        Col := 0;
        Soma := 0;
        while TListView(Sender).Columns[Col].Width + Soma < Posicao_X Do
             begin
               Soma := Soma + TListView(Sender).Columns[Col].Width;
               Inc(Col);
             end;
        Coluna := Col;
        Result  := TListView(Sender).Columns[Col].Caption;
      End
  Else
      Result := '';
End;

function TListViewTabularView.Locate(const Argument: String; const AColumn: Integer): Integer;
var
  Achou : Boolean;
begin
  Result := -1;
  Achou := False;
  While  (FStartIndex < FListView.Items.Count)
  and    not Achou do
  begin
    if   AColumn = 0 then
         achou := pos(Argument, FListView.Items[FStartIndex].Caption) > 0
    else
         achou := pos(Argument, FListView.Items[FStartIndex].SubItems.Strings[AColumn -1]) > 0;
    inc(FStartIndex);
  end;
  if achou then
  begin
    Dec(FStartIndex);
    Result := FStartIndex;
    FListView.Selected := FListView.Items[StartIndex];
    FListView.ItemFocused := FListView.Items[StartIndex];
    FListView.ItemFocused.MakeVisible(False);
  end;
end;

Procedure TListViewTabularView.ExecuteAdicionaLinha;
begin
  AdicionaItems(LinesCount-1, LinesCount-1);
end;

Procedure TListViewTabularView.AdicionaItems(const Start, Last: Integer);
var
  Col, ColWidth: Integer;
  Item: TListItem;
  lValue: String;
  i: Integer;
  lColumns: TTabularViewColumn;
  FOldChange: TLVChangeEvent;
begin
  FOldChange := FListView.OnChange;
  try
    FListView.OnChange := nil;
    Item := nil;
    for i := Start to Last do
    begin
      // chama evento para colocar uma progress bar
      if   Assigned(FOnAddLinesProgress) then
           FOnAddLinesProgress(i, LinesCount - 1);
      // Adiciona linha
      for Col := 0 to FListView.Columns.Count - 1 do
      begin
        lColumns := TTabularViewColumn(FListView.Columns[Col].Tag);
        if i < lColumns.Lines.Count then
          lValue := lColumns.Lines[i]
        else
          lValue := '';
        ColWidth := FListView.StringWidth(lValue) + 15;
        if Col = 0 then
        begin
          Item := FListView.Items.Add;
//          Item.ImageIndex := -1;
          Item.ImageIndex := IconIndex[i];
          Item.Caption := lValue;
          if i < FCheckedList.Count then
            Item.Checked := Boolean(FCheckedList[i]);
          if FListView.Checkboxes then
            Inc(ColWidth, 32)
          else
            Inc(ColWidth, 16);
        end
        else
          Item.SubItems.Add(lValue);
        // Dimensiona a coluna
        if (ColWidth > lColumns.Width) then
          lColumns.Width := ColWidth
        else
          if (FListView.StringWidth(FListView.Columns[Col].Caption) > lColumns.Width) then
            lColumns.Width := FListView.StringWidth(FListView.Columns[Col].Caption);
{ Arnoldo - Início - 01/2008 - Tecnologia}
        if   FLarguraFixa then
             lColumns.Width := Columns[Col].SaveWidth;
{ Arnoldo - Fim - 01/2008 - Tecnologia}
      end;
      Item.Data := Pointer(i);
    end;
  finally
    FListView.OnChange := FOldChange;
  end;
end;

procedure TListViewTabularView.UpdateColumnSize;
{ atualizar o tamanho das colunas depois de ter adicionados todos os itens }
var
  i: Integer;
begin
  for i := 0 to FListView.Columns.Count -1 do
    if TTabularViewColumn(FListView.Columns[i].Tag).Width > FListView.StringWidth(FListView.Columns[i].Caption) then
      FListView.Columns[i].Width := TTabularViewColumn(FListView.Columns[i].Tag).Width
    else FListView.Columns[i].Width := FListView.StringWidth(FListView.Columns[i].Caption);
end;

Procedure TListViewTabularView.AddListViewLines;
begin
  FUpdating := True;
  FListView.Items.Clear;
// edu - prealocar os items
  FListView.AllocBy := LinesCount;
// edu - prealocar os items
  AdicionaItems(0, LinesCount -1);
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
  if   not FLarguraFixa then
       UpdateColumnSize;
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
  FUpdating := False;
end;
{ // leitura do Registro
procedure TListViewTabularView.SaveColumnConfiguration;
var Reg: TRegistry;
    i: Integer;
    SL: TStringList;
begin
  Reg:=TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    Reg.OpenKey(RegistryKey + NameofRegisterKey, True);
    // Exclui as colunas anteriores
    SL:=TStringList.Create;
    try
      Reg.GetValueNames(SL);
      for i:=0 to SL.Count - 1 do
          Reg.DeleteValue(SL[i]);
    finally
      SL.Free;
    end;
    // Adiciona os valores
    for i:=0 to FColumnsList.Count - 1 do
      Reg.WriteBool(Columns[i].Caption, Columns[i].Visible);
    Reg.CloseKey;
    Reg.DeleteKey(RegistryKey + NameofRegisterKey + STRColumnAux);
    if Reg.OpenKey(RegistryKey + NameofRegisterKey + STRColumnAux, True) then
      Reg.WriteInteger(STRFixColumns, FFixColumns);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;
}
{ // leitura do Registro
procedure TListViewTabularView.LoadColumnConfiguration;
var Reg: TRegistry;
    i, j: Integer;
    SL: TStringList;
    TmpList: TList;
begin
  Reg:=TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if   Reg.KeyExists(RegistryKey + NameofRegisterKey) then
         begin
           Reg.OpenKey(RegistryKey + NameofRegisterKey, False);

           SL:=TStringList.Create;
           TmpList:=TList.Create;
           try
             for i:=0 to FColumnsList.Count - 1 do
                 begin
                   TmpList.Add(FColumnsList[i]);
                   Columns[i].Visible := True;
                 end;

             Reg.GetValueNames(SL);
             for i:=0 to SL.Count - 1 do
                 begin
                   // Procura a coluna na lista temporária de colunas...
                   j:=0;
                   while (j < TmpList.Count)
                   and   (CompareText(TTabularViewColumn(TmpList[j]).Caption, SL[i]) <> 0) do
                         inc(j);
                   // Reorganiza as colunas
                   if   (j < TmpList.Count) then
                        begin
                          FColumnsList[i]:=TmpList[j];
                          Columns[i].Visible := Reg.ReadBool(SL[i]);
                          TmpList.Delete(j);
                        end;
                 end;
             Reg.CloseKey;
             if Reg.OpenKey(RegistryKey + NameofRegisterKey + STRColumnAux, false) then
             begin
               FFixColumns := Reg.ReadInteger(STRFixColumns);
               FFixColumn := FFixColumns;
             end;
           finally
             Sl.Free;
             TmpList.Free;
           end;
        end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;}

procedure TListViewTabularView.ConfigureView;
var
  i: Integer;
begin
  if FViewActive then
  begin
    FColumnConf:=TFSBColumnConf.Create(Nil);
    try
      FColumnConf.OnOriginalClick:=DoOriginalClick;
//      FColumnConf.FixColumns := FFixColumns;
      FColumnConf.Font := FListView.Font;
      FColumnConf.List := FList;
      FColumnConf.ImpMode := FImpMode;
      FColumnConf.sbtColCalc.OnClick := ConfigureCalcCols;
      FColumnConf.sbtSaveas.OnClick := SalveAs;
      FColumnConf.sbtLoadas.OnClick := LoadFrom;
      FColumnConf.sbtDelete.OnClick := DeleteConf;
{begin Arnoldo - 25/07/2001}
      FColumnConf.CorRelatorio := FCorRelatorio;
{End Arnoldo - 25/07/2001}
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
      FColumnConf.LarguraFixa := FLarguraFixa;
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
      // Preenche a lista com as colunas
      FColumnConf.clbColumns.Items.Clear;
      for i:=0 to FColumnsList.Count - 1 do
          begin
            FColumnConf.clbColumns.Items.AddObject(Columns[i].Caption, FColumnsList[i]);
            FColumnConf.clbColumns.Checked[FColumnConf.clbColumns.Items.Count - 1]:=Columns[i].Visible;
{ Arnoldo - Início - 22/06/2005 - Tecnologia}
            FColumnConf.clbColumns.ItemEnabled[FColumnConf.clbColumns.Items.Count - 1] := Columns[i].CanColInvisible;
{ Arnoldo - Fim - 22/06/2005 - Tecnologia}
            if Columns[i].Visible then
               Begin
                 Columns[i].SaveWidth := FListView.Columns[Columns[i].VisualIndex].Width;
                 Columns[i].LarguraFixa :=  FLarguraFixa;
               End;
          end;
      FColumnConf.ShowModal;
      if   FColumnConf.ModalResult = mrOK then
           begin
             // Reorganiza os dados
             for i:=0 to FColumnConf.clbColumns.Items.Count - 1 do
                 begin
                   FColumnsList[i]:=FColumnConf.clbColumns.Items.Objects[i];
                   TTabularViewColumn(FColumnsList[i]).Visible:=FColumnConf.clbColumns.Checked[i];
                   TTabularViewColumn(FColumnsList[i]).Caption:=FColumnConf.clbColumns.Items[i];
                   TTabularViewColumn(FColumnsList[i]).Width := Columns[i].SaveWidth;
                   Columns[i].Width := Columns[i].SaveWidth;
                 end;
             // Monta novamente a consulta
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
             FLarguraFixa := FColumnConf.LarguraFixa;
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
             Self.FListView.Font := FColumnConf.Font;
             FListView.Items.BeginUpdate;
             AddListViewColumns;
             AddListViewLines;
             FListView.Items.EndUpdate;
//             FFixColumns := FColumnConf.FixColumns;
//             FFixColumn := FFixColumns;
{begin Arnoldo - 25/07/2001}
             FCorRelatorio := FColumnConf.CorRelatorio;
{End Arnoldo - 25/07/2001}

             FImpMode := FColumnConf.ImpMode;
             SaveColumnConfiguration;
           end
    finally
      FColumnConf.Free;
    end;
  end;
end;

constructor TListViewTabularView.Create(ListView: TListView; const AListViewFilter: TAbstractCustomListViewFilter);
begin
  inherited Create;
  FStartIndex := 0;
  FUltimaPosicao := 0;
  FViewActive:=False;
  FListView:=ListView;
  FOnBuildView:=Nil;
  FOnAddLinesProgress:=Nil;
  FBeforeSwapProc := nil;
  FAfertSwapProc := nil;
//  FFixColumns := 0;
//  FFixColumn := 0;
  FCurrentLine := 0;
  FMathExpression := TMathExpression.Create;
  FMathExpression.OnGetVariableValue := GetDataValue;
  FCalcColumns := TList.Create;
  FCalcColumnLoaded := False;
  FCheckedList := TList.Create;
  FListViewFilter := AListViewFilter;
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
  FLarguraFixa := False;
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
{Eduardo - Inicio - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
  FImpLinhasHorizontais:= False;
{Eduardo - Fim - 12/05/06 - Imprimir linhas horizontais entre as linhas de texto}
end;

destructor TListViewTabularView.Destroy;
begin
  FCheckedList.Free;
  FMathExpression.Free;
  inherited Destroy;
  FCalcColumns.Free;
end;

procedure TListViewTabularView.InternalExecute;
begin
  inherited;
  FListView.Items.BeginUpdate;
  FListView.Columns.BeginUpdate;
  if   Assigned(FOnBuildView) then
       FOnBuildView(Self);
  if not FCalcColumnLoaded then
    LoadCalcColumnsConfiguration;
  if ValidateColumnConfiguration then
    LoadColumnConfiguration;
  AddListViewCalcLines; { gerar a totalizacao das colunas calculadas }
  AddListViewColumns;
  AddListViewLines;
  FViewActive:=True;
  FListView.Columns.EndUpdate;
  FListView.Items.EndUpdate;
end;

procedure TListViewTabularView.DoColumnClick(Column: TListColumn);
begin
  if   Assigned(FBeforeSwapProc) then
       FBeforeSwapProc(TTabularViewColumn(Column.Tag).OrderType);

  FListView.CustomSort(@CustomSortProc, Integer(Column));

  if   Assigned(FAfertSwapProc) then
       FAfertSwapProc(TTabularViewColumn(Column.Tag).OrderType);
       
  if   TTabularViewColumn(Column.Tag).OrderType = otDesc then
       TTabularViewColumn(Column.Tag).OrderType:=otAsc
  else
       TTabularViewColumn(Column.Tag).OrderType:=otDesc;
end;

procedure TListViewTabularView.DoOriginalClick(Sender: TObject);
var i: Integer;
    FColumnConf: TFSBColumnConf;
begin
  for i:=0 to FColumnsList.Count - 1 do
      FColumnsList[i]:=FOriginalColumnList[i];
  // Tenta pegar o form
  FColumnConf:=TFSBColumnConf(TControl(Sender).Parent.Parent);
  // Preenche a lista com as colunas
  FColumnConf.clbColumns.Items.Clear;
  for i:=0 to FColumnsList.Count - 1 do
      begin
        FColumnConf.clbColumns.Items.AddObject(Columns[i].StartCaption, FColumnsList[i]);
//        FColumnConf.clbColumns.Items.AddObject(Columns[i].Caption, FColumnsList[i]);
//        FColumnConf.clbColumns.Items.AddObject(Columns[i].Name, FColumnsList[i]);
        FColumnConf.clbColumns.Checked[FColumnConf.clbColumns.Items.Count - 1]:=Columns[i].Visible;
      end;
end;

function TListViewTabularView.NameofRegisterKey: String;
begin
  Result := OriginalNameofRegisterKey;
end;

(*
procedure TListViewTabularView.ValidateColumnConfiguration;
{ remover as entradas invalidas no registro para le corretamente a configuracao das colunas }
var Reg: TRegistry;
    i, j: Integer;
    SL: TStringList;
begin
  Reg:=TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if Reg.KeyExists(RegistryKey + NameofRegisterKey) then
    begin
      Reg.OpenKey(RegistryKey + NameofRegisterKey, False);

      SL := TStringList.Create;
      try
        Reg.GetValueNames(SL);
        for i:=0 to SL.Count - 1 do
        begin
          // Procura a coluna na lista temporária de colunas...
          j:=0;
          while (j < FColumnsList.Count)
          and   (CompareText(TTabularViewColumn(FColumnsList[j]).Caption, SL[i]) <> 0) do
                inc(j);
          if (j = FColumnsList.Count) then
            Reg.DeleteValue(SL[i]);
        end;
      finally
        Sl.Free;
      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;
*)
procedure TListViewTabularView.SetPath(const APath: String);
begin
  FPath := APath;
  if (Length(FPath) = 0)
  or (APath[Length(FPath)] <> '\') then
     FPath := FPath + '\'; 
  FPath := FPath + CFGDIR;
  if not ForceDirectories(FPath) then
    raise Exception.CreateFmt('Não possível criar (%s)', [FPath]);
end;

procedure TListViewTabularView.LoadColumnConfiguration;
var
  IniFile: TMemIniFile;
  i, j: Integer;
  SL: TStringList;
  TmpList: TList;
  Section: String;
  lTmp: String;
begin
  IniFile := TMemIniFile.Create(FPath + CFGFileName);
  try
    Section := NameofRegisterKey;
    if IniFile.SectionExists(Section) then
    begin
      SL:=TStringList.Create;
      TmpList:=TList.Create;
      try
        for i:=0 to FColumnsList.Count - 1 do
        begin
          TmpList.Add(FColumnsList[i]);
          Columns[i].Visible := True;
        end;
//        FFixColumns := IniFile.ReadInteger(Section, STRFixColumns, 0);
        FImpMode := IniFile.ReadInteger(Section+ STRColumnAux, STRImpMode, 0);
//        FFixColumn := FFixColumns;
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
        FLarguraFixa := IniFile.ReadBool(Section+ STRColumnAux, STRLarguraFixa, False);
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
        IniFile.ReadSection(Section, SL);
        if SL.Count > FColumnsList.Count then { quando adicionado nova coluna ignorar configuracao }
          SL.Clear;
        for i:=0 to SL.Count - 1 do
            begin
              // Procura a coluna na lista temporária de colunas...
              j:=0;
              while (j < TmpList.Count)
              and   (CompareText(TTabularViewColumn(TmpList[j]).Name, SL[i]) <> 0) do
                    inc(j);
              // Reorganiza as colunas
              if   (j < TmpList.Count) then
                   begin
                     FColumnsList[i]:=TmpList[j];
                     lTmp := IniFile.ReadString(Section, SL[i], TTabularViewColumn(TmpList[j]).Caption);
                     Columns[i].Caption := Copy(lTmp, 1, Pos(';', lTmp) - 1);
                     Columns[i].Visible := Copy(lTmp, Pos(';', lTmp)+1, 1) = '1';
                     Delete(lTmp, 1, Pos(';', lTmp) + 1);
                     lTmp := Copy(lTmp, 2, Length(lTmp) - 1);
                     if (lTmp <> '')
                     And (FLarguraFixa) then
                       try
                         Columns[i].SaveWidth := StrToInt(lTmp);
                       except
                         Columns[i].SaveWidth := 0;
                       end;
                     Columns[i].LarguraFixa := FLarguraFixa;
                     TmpList.Delete(j);
                   end
            end;
        { colocar todas as colunas novas no fim da lista de colunas em ordem de adicao }
        for i := TmpList.Count -1 downto 0 do
          FColumnsList[FColumnsList.Count - (TmpList.Count - i)] := TmpList[i];

      finally
        SL.Free;
        TmpList.Free;
      end;
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TListViewTabularView.SaveColumnConfiguration;
var
  IniFile: TMemIniFile;
  i: Integer;
  Section: String;
  lTmp: String;
begin
  IniFile := TMemIniFile.Create(FPath + CFGFileName);
  try
    Section := NameofRegisterKey;
    IniFile.EraseSection(Section);
    for i := 0 to FColumnsList.Count -1 do
    begin
      lTmp := Trim(TTabularViewColumn(FColumnsList[i]).Caption)+';'+
              InttoStr(Integer(TTabularViewColumn(FColumnsList[i]).Visible)) + ';';
              if TTabularViewColumn(FColumnsList[i]).VisualIndex <> -1 then
                lTmp :=  lTmp + InttoStr(FListView.Columns[TTabularViewColumn(FColumnsList[i]).VisualIndex].Width)
              else lTmp :=  lTmp + '50';
      IniFile.WriteString(Section, TTabularViewColumn(FColumnsList[i]).Name, lTmp);
    end;

    Section := Section + STRColumnAux;
//    IniFile.WriteInteger(Section, STRFixColumns, FFixColumns);
    IniFile.WriteInteger(Section, STRImpMode, FImpMode);
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
    IniFile.WriteBool(Section, STRLarguraFixa, FLarguraFixa);
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
    IniFile.UpdateFile;
  finally
    IniFile.Free;
  end;
end;

function TListViewTabularView.ValidateColumnConfiguration: Boolean;
var
  IniFile: TMemIniFile;
  i, j: Integer;
  SL: TStringList;
  SLDelete: TStringList;
  Changed: Boolean;
begin
  Result := True;
  Changed := False;
  IniFile := TMemIniFile.Create(FPath + CFGFileName);
  try
    SL := TStringList.Create;
    SLDelete := TStringList.Create;
    try
      IniFile.ReadSection(NameofRegisterKey, SL);
      for i:=0 to SL.Count - 1 do
      begin
          // Procura a coluna na lista temporária de colunas...
          j:=0;
          while (j < FColumnsList.Count)
          and   (CompareText(TTabularViewColumn(FColumnsList[j]).Name, SL[i]) <> 0) do
                inc(j);
          if (j = FColumnsList.Count) then
          begin
            SLDelete.Add(SL[i]);
//            IniFile.DeleteKey(NameofRegisterKey, SL[i]);
//            Changed := True;
          end;
      end;
      { IMPLEMENTACAO DEIXA A VALIDACAO MAIS LENTA,
        MAS E NECESSARIO PARA GARANTIR QUE NAO HAJA
        DUAS CONFIGURACOES COM O MESMO NOME, ASSIM UMA SEMPRE ELIMINA A OUTRA
      }
      if (SL.Count <> 0)
      and ((SL.Count - FCalcColumns.Count) = SLDelete.Count) then
      begin
        Result := False;
        //MessageBox(FListView.Handle, PChar(PROGRAMERRORNOEQUALCOLUMNS), nil, MB_OK);
      end
      else
      for i := 0 to SLDelete.Count -1 do
      begin
        IniFile.DeleteKey(NameofRegisterKey, SLDelete[i]);
        Changed := True;
      end;
    finally
      SLDelete.Free;
      Sl.Free;
    end;
    if Changed then
      IniFile.UpdateFile;
  finally
    IniFile.Free;
  end;
end;

procedure TListViewTabularView.ConfigureCalcCols(Sender: TObject);
var
  F: TfrmCalcColumns;
  i: Integer;
  StrType: String;
begin
  F := TfrmCalcColumns.Create(nil);
  try
    F.SetFileName(CFGFileNameCalc);
    for i := 0 to FOriginalColumnList.Count -1 do
    begin
      case TTabularViewColumn(FOriginalColumnList[i]).SumMode of
        smNotSum: StrType := '';
        smInteger: StrType := ' - Inteiro';
        smFloat: StrType := ' - Real';
      end;
      F.lbColumn.Items.Add('C' + InttoStr(i) + ' - ' + TTabularViewColumn(FOriginalColumnList[i]).Caption + StrType);
    end;
    F.ConfigureColumns(FPath, OriginalNameofRegisterKey);
  finally
    F.Free;
  end;
end;

procedure TListViewTabularView.LoadCalcColumnsConfiguration;
var
  IniFile: TMemIniFile;
  SL: TStringList;
  SLSum: TStringList;
  i: Integer;
  lCalcCol: TCalcColumn;
  lSumSection: String;
begin
  FreeCalcColumns;
  IniFile := TMemIniFile.Create(FPath + CFGFileNameCalc);
  SL := TStringList.Create;
  SLSum := TStringList.Create;
  try
    lSumSection := SumCalcColumnSection(OriginalNameofRegisterKey);
    IniFile.ReadSection(OriginalNameofRegisterKey, SL);
    IniFile.ReadSection(lSumSection, SLSum);
    for i := 0 to SL.Count -1 do
    begin
      if SLSum.IndexOf(SL[i]) = -1 then
        AddColumn(SL[i], taRightJustify, otAsc, '-|12#|@,@@', True, smFloat, nil)
      else
        if IniFile.ReadString(lSumSection, SL[i], '0') = '1' then
          AddColumn(SL[i], taRightJustify, otAsc, '-|12#|@,@@', True, smFloat, nil)
        else
          AddColumn(SL[i], taRightJustify, otAsc, '-|12#|@,@@', True, smNotSum, nil);
      lCalcCol := TCalcColumn.Create;
      lCalcCol.Expression := IniFile.ReadString(OriginalNameofRegisterKey, SL[i], '');
      lCalcCol.Column := TTabularViewColumn(FOriginalColumnList[FOriginalColumnList.Count -1]);
      lCalcCol.Column.ColumnType := ctFloat;
      FCalcColumns.Add(lCalcCol);
    end;
  finally
    IniFile.Free;
    SL.Free;
    SLSum.Free;
    FCalcColumnLoaded := True;
  end;
end;

procedure TListViewTabularView.AddListViewCalcLines;
var
  i, j: Integer;
begin
  for j := 0 to FCalcColumns.Count -1 do
  begin
    FMathExpression.Script.Clear;
    FMathExpression.Script.Add(TCalcColumn(FCalcColumns[j]).Expression);
    TCalcColumn(FCalcColumns[j]).Column.Lines.Clear;
    for i := 0 to LinesCount -1 do
    begin
      FCurrentLine := i;
      try
        TCalcColumn(FCalcColumns[j]).Column.Lines.Add(FormatFloat('0,0.00', FMathExpression.Evaluate));
      except
        TCalcColumn(FCalcColumns[j]).Column.Lines.Add('Erro');
      end;
    end;
  end;
end;

procedure TListViewTabularView.GetDataValue(Variable: String; var Value: Extended);
var
  Index: Integer;
begin
  if Copy(Variable, 1, 1) = 'C' then
  begin
    Delete(Variable, 1, 1);
    try
      Index := StrToInt(Variable);
    except
      Index := -1;
    end;
    try
      Value := floatof(TTabularViewColumn(FOriginalColumnList[Index]).Lines[FCurrentLine])
    except
      raise ECalcColumnError.Create('Valor invalido');
    end;
  end
  else
    raise ECalcColumnError.CreateFmt('Coluna (%s) não existe', [Variable]);
end;

procedure TListViewTabularView.FreeCalcColumns;
var
  I: Integer;
begin
  try
    for i := 0 to FCalcColumns.Count -1 do
      TObject(FCalcColumns[i]).Free;
  finally
    FCalcColumns.Clear;
  end;
end;

procedure TListViewTabularView.LoadFrom(Sender: TObject);
begin
  //**************** Ler as Configuracoes com outra identificacao ***********
  { montar consulta a todas as configuracoes do listview atual }
  if DisplayConfigurations then
  begin
    LoadColumnConfiguration;
    FColumnConf.Close;
    AddListViewCalcLines;
    AddListViewColumns;
    AddListViewLines;
  end;
end;

procedure TListViewTabularView.SalveAs(Sender: TObject);
begin
  //**************** Salvar as Configuracoes com outro identificacao ***********
  FRegNameSave := InputBox('Nome da Configuracao', 'Nome', FRegNameSave);
end;

procedure TListViewTabularView.DeleteConf(Sender: TObject);
var
  lOldRegName: String;
  lIniFile: TMemIniFile;
begin
  lOldRegName := FRegNameSave;
  if DisplayConfigurations then
  begin
    // apagar a configuracao
    lIniFile := TMemIniFile.Create(FPath + CFGFileName);
    try
      lIniFile.EraseSection(NameofRegisterKey);
      lIniFile.UpdateFile;
    finally
      lIniFile.Free;
    end;
    FRegNameSave := lOldRegName;
  end;
end;

function TListViewTabularView.DisplayConfigurations: Boolean;
var
  F: TEnumCFG;
begin
  F := TEnumCFG.CreateNew(nil);
  F.LoadCFG(FPath + CFGFileName, FListView.Name + IntToStr(FListView.Tag), FRegNameSave);
  Result := F.ShowModal = mrOk;
  if Result then
    FRegNameSave := F.CFGNane;
  F.Free;
end;

procedure TListViewTabularView.ClearColumns;
begin
  inherited ClearColumns;
  FreeCalcColumns;
  FCalcColumnLoaded := False;
end;

procedure TListViewTabularView.UpdateLine(const Line: Integer);
var
  Item: TListItem;
  Col, ColWidth: Integer;
  lColumns: TTabularViewColumn;
  i, j: Integer;
  lValue: String;
begin
  i := 0;
  j := 0;
  while j < FListView.Items.Count do
  begin
    if Longint(FListView.Items.Item[j].Data) = Line then
    begin
      i := j;
      j := FListView.Items.Count;
    end;
    inc(j);
  end;
  Item := FListView.Items[i];
  Item.SubItems.Clear;
  Item.ImageIndex := IconIndex[Line];

  // Adiciona linha
  for Col := 0 to FListView.Columns.Count - 1 do
  begin
    lColumns := TTabularViewColumn(FListView.Columns[Col].Tag);
    if i < lColumns.Lines.Count then
      lValue := lColumns.Lines[Line]
    else
      lValue := '';
    ColWidth := FListView.StringWidth(lValue) + 15;
    if Col = 0 then
    begin
      if  (lValue <> '')
      and (lValue[1] = '/') then
      begin
        Item.Caption := '';
        Item.Checked := lValue = '/1';
      end
      else
        Item.Caption := lValue;
      if Line < FCheckedList.Count then
        Item.Checked := Boolean(FCheckedList[Line]);
    end
    else
      Item.SubItems.Add(lValue);
    // Dimensiona a coluna
    if (ColWidth > lColumns.Width) then
      lColumns.Width := ColWidth
    else
      if (FListView.StringWidth(FListView.Columns[Col].Caption) > lColumns.Width) then
        lColumns.Width := FListView.StringWidth(FListView.Columns[Col].Caption);
{Arnoldo - Início - 01/2008 - Tecnologia}
     if   FLarguraFixa then
          lColumns.Width := Columns[Col].SaveWidth;
{Arnoldo - Fim - 01/2008 - Tecnologia}
  end;

  // atualizar o tamanho das colunas
  UpdateColumnSize;
end;

function TListViewTabularView.OriginalNameofRegisterKey: String;
begin
  Result := FListView.Name + IntToStr(FListView.Tag);
end;

function TListViewTabularView.CFGFileName: String;
begin
  if FListView.Name = '' then
    Result := STR_CFGFileName
  else Result := FListView.Name + InttoStr(FListView.Tag) + CFGEXT;
end;

function TListViewTabularView.CFGFileNameCalc: String;
begin
  if FListView.Name = '' then
    Result := STR_CFGFileCOL
  else Result := 'C' + FListView.Name + InttoStr(FListView.Tag) + CFGEXT;
end;

procedure TListViewTabularView.MarkDelete(const ALine: Integer);
var
  iColumn: Longint;
begin
  for iColumn := 0 to ColumnsCount -1 do
    Columns[iColumn].Lines.Delete(ALine);
  if ALine < FCheckedList.Count then
    FCheckedList.Delete(ALine);
  if ALine < FDataList.Count then
    FDataList.Delete(ALine);
  if ALine < FListIcons.Count then
    FListIcons.Delete(ALine);
end;

end.
