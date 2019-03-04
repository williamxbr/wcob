{ Nao se espantem ao olhar as gambiarras feitas neste fonte, devido ao ter nascido de junção de fontes feitos sem controle
  e da devida implementação de diversas funcionalidades sem planejamento saiu isto
}
unit SmtLstvw;

interface

uses                                 
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  ComCtrls, Commctrl, StdCtrls, NumericEdit,
  SBLstv0u, SBLstv1u, SBLstv2u, LstFil0u, uAguarde,
  GenFunc, SBLstV3u,
  SBLstv4f,
  Menus;

type
//  TSmartListMainColumn = class;
  TOnGetPathEvent = procedure(var APath: String) of object;
  TOnAfterEditEvent = procedure(const X, Y: Integer) of object;
  TOnGetFindColumn = procedure(var AColumn: Longint) of object;
  TOnCheckEvent = procedure(const AItem: TListItem) of object; 

  TActionType = (taPreviewReport, taDirectPrinter, taSendMail);
  //taPreviewReport - Visualizar relatório na tela antes de imprimir
  //taDirectPrinter - Envia direto para a impressora sem visualizar na tela
  //taSendMail      - Envia email

  TSmartListView = class(TListView)
  private
    { Private declarations }
    FTabularView: TListViewSmartTabularView;
    FCustomListViewFilter: TCustomListViewFilter;
    FEnableFilter: Boolean;
    FEnableSort: Boolean;
//    FShowMainColumns: Boolean;
//    FMainColumnList: TList;
//    FHeaderControl: THeaderControl;
//    FIndexSubColumns: Integer;
//    FResizing: Boolean;
//    FScrollPos: Integer;
    FImageList: TImageList;
//    FIndexFixColumnImage: Integer;
    FIndexEditImage: Integer;
    FOnGetPath: TOnGetPathEvent;
    FEnablePaintCells: Boolean;
    FArgument: String;
    FFindColumn: Integer;
    //***** Edit Controls ****
    FComboBox: TComboBox;
    FEditInteger: TIntegerEdit;
    FEditFloat: TFloatEdit2;
    FEditText: TEdit;
    FDataTimeEdit: TDateTimePicker;
    FXEdit, FYEdit: Integer;
    FEdited: Boolean;
    FLastIndex: Integer;
    FOnAfterEdit: TOnAfterEditEvent;
    //************************
    FEnableSum: Boolean;
    FOnGetFindColumn: TOnGetFindColumn;
    FOnPasteProgress: TAddLinesProgressEvent;
    FOnCheck: TOnCheckEvent;
    FListDataSet: TStrings;
    // alteracao impressao de relatorio
    FLoading: Boolean;
    FPopup: TPopupMenu;
    FMostrarMenuConfig: Boolean;
{ Arnoldo - Início - 07/11/2005 - Tecnologia}
    FAfterFilter : TNotifyEvent;
{ Arnoldo - Fim - 07/11/2005 - Tecnologia}
    procedure LoadAll(Sender : TObject);
    procedure BeforeSwap(const Order: TOrderType);
    procedure AfterSwap(const Order: TOrderType);
    function GetAdjustColumns(const Column: Integer): TTabularViewColumn;
    function GetRegisterName: String;
    procedure SetRegisterName(const Value: String);
    function GetFixColumns: Integer;
    procedure SetFixColumns(const Value: Integer);
//    procedure ResetAllColumns;
//    function GetMainColumn(const Column: Integer): TSmartListMainColumn;
//    procedure FreeMainColumns;
    function GetShowMainColumns: Boolean;
    procedure SetShowMainColumns(const Value: Boolean);
//    procedure UpdateHeaderPosition;
//    procedure DisplayMainColumns;
//    procedure HeaderControlSectionTrack(HeaderControl: THeaderControl; Section: THeaderSection; Width: Integer; State: TSectionTrackState);
//    function CalcSizeofColumns(const Start, Last: Integer): Integer;
//    procedure UpdateSizeofMainColumn(const AColumn: Integer);
//    procedure UpdateMainHeaderSize;
//    procedure StartLast(var Start, Last: Integer);
    function GetAdjustColumnsByName(const ColumnName: String): TTabularViewColumn;
    procedure CreateImage;
//    procedure SetImagetoFixColumns(const AIndexFixColumnImage: Integer);
//    function EnumMainColumnPos: TList;
    function ColumnofXPos(const X: Integer): TTabularViewColumn;
    procedure DrawPaintItem(const First, Last: Integer); { desenha as celulas com um determinada cor }
    //******** localizar items **************
    procedure DoLocateItem; { continuar a procura }
    procedure DoNewLocate;
    //******** Edicao de Items **************
    procedure CreateEditControls;
    procedure FreeEditControls;
    procedure HideEditControls(Sender: TObject);
    procedure DisplayEditControls(const ARect: TRect; const AEditMode: TEditMode; const Value: String);
    procedure UpdateValue;
    procedure CancelEditControls(Sender: TObject; var Key: Word; Shift: TShiftState);
    function GetItemIndex(const Item: Integer): Integer; { nova procura }
    procedure DoEdit(x, y: Integer);
    procedure SetEnableSum(const Value: Boolean);
    procedure SaveCheckBoxState;
    function GetCorListView: Boolean;
    procedure SetCorListView(const Value: Boolean);
    procedure CompError(const AValue: Boolean);
    // modificacao para salvar filtro
    procedure ApplyFilterSettings;
    procedure SetMostrarMenuConfig(const Value: Boolean);
    procedure CreatePopupMenu;
    procedure DoConfigure(Sender: TObject);
  protected
    { Protected declarations }
    procedure ColClick(Column: TListColumn); override;
    procedure ColRightClick(Column: TListColumn; Point: TPoint); override;
    procedure CreateWnd; override;
    procedure Change(Item: TListItem; Change: Integer); override;
    procedure DblClick; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
//    Procedure DoBeginColumnResize( columnindex, columnwidth: Integer ); virtual;
//    Procedure DoEndColumnResize( columnindex, columnwidth: Integer ); virtual;
//    Procedure DoColumnResize( columnindex, columnwidth: Integer ); virtual;
//    function FindColumnIndex( pHeader: pNMHdr ): Integer;
//    function FindColumnWidth(pHeader: pNMHdr): Integer;
//    procedure ListViewResize(var Msg: TMessage); message WM_SIZE;
//    procedure ListViewMoving(var Msg: TMessage); message WM_MOVE;
//    procedure ListViewScroll(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure Loaded; override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure WMNotify( Var msg: TWMNotify ); message WM_NOTIFY;
    procedure WMPAINT(var msg: TWMPAINT); message WM_PAINT;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
{Mike 18.11.04 - Fim - Nettalco - Considerar o ColumnType}
    procedure NextFixColumn;
    procedure PrevFixColumn;
    procedure Execute;
    procedure UpdateLine(const Line: Integer);
    procedure ConfigureView;
    procedure ShowWaitForm(Animacao: TCommonAVI; Msg: String);
    procedure HideWaitForm;
//    procedure AddMainColumn(const Caption: String; const SubColumns: Integer);
    procedure Clear; override;
//    procedure ClearMainColumns;
    procedure PasteToClipBoard;
    function IndexofColumnName(const AColumnName: String): Integer;
    property AdjustColumns[const Column: Integer]: TTabularViewColumn read GetAdjustColumns;
    property AdjustColumnsByName[const ColumnName: String]: TTabularViewColumn read GetAdjustColumnsByName;
    property TabularView: TListViewSmartTabularView read FTabularView;
//    property MainColumn[const Column: Integer]: TSmartListMainColumn read GetMainColumn;
    property ItemIndex[const Item: Integer]: Integer read GetItemIndex;
    procedure SetFocus; override;
    procedure DeleteEx(const AVisualLine: Longint);
    procedure ClearDataSet;
    procedure Paint_a_Line(const Line: Integer; const AColor : TColor);
// ROOSEVELT - INICIO - 13.08.2002
    property CustomListViewFilter: TCustomListViewFilter read FCustomListViewFilter;
  published
    { Published declarations }
    property RegisterName: String read GetRegisterName write SetRegisterName;
    property FixColumns: Integer read GetFixColumns write SetFixColumns default 0;
    property EnableSort: Boolean read FEnableSort write FEnableSort;
    property EnableFilter: Boolean read FEnableFilter write FEnableFilter;
    property EnableSum: Boolean read FEnableSum write SetEnableSum;
    property ShowMainColumns: Boolean read GetShowMainColumns write SetShowMainColumns;
    property OnGetPath: TOnGetPathEvent read FOnGetPath write FOnGetPath;
    property EnablePaintCells: Boolean read FEnablePaintCells write FEnablePaintCells;
    property OnAfterEdit: TOnAfterEditEvent read FOnAfterEdit write FOnAfterEdit;
    property CorListView : Boolean read GetCorListView write SetCorListView;
    property MostrarMenuConfig: Boolean read FMostrarMenuConfig write SetMostrarMenuConfig default false; 
    property OnGetFindColumn: TOnGetFindColumn read FOnGetFindColumn write FOnGetFindColumn;
    property OnPasteProgress: TAddLinesProgressEvent read FOnPasteProgress write FOnPasteProgress;
    property OnCheck: TOnCheckEvent read FOnCheck write FOnCheck;
{ Arnoldo - Início - 07/11/2005 - Tecnologia}
    property OnAfterFilter : TNotifyEvent Read FAfterFilter Write FAfterFilter;
{ Arnoldo - Fim - 07/11/2005 - Tecnologia}
  end;

(*  TSmartListMainColumn = class
  private
    FCaption: String;
    FOwner: THeaderSection;
    FIndexFirstSubColumn: Integer;
    FIndexLastSubColumn: Integer;
    FWidth: Integer;
    procedure SetCaption(const Value: String);
    procedure SetWidth(const Value: Integer);
  protected
    function GetOwner: THeaderSection;
    procedure SetOwner(const AOwner: THeaderSection);
    property IndexFirstSubColumn: Integer read FIndexFirstSubColumn write FIndexFirstSubColumn;
    property IndexLastSubColumn: Integer read FIndexLastSubColumn write FIndexLastSubColumn;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Caption: String read FCaption write SetCaption;
    property Width: Integer read FWidth write SetWidth;
  end;*)

procedure Register;

implementation

{$R SmrtLst.res}

uses FileCtrl, SBLstv1f, ClipBrd, DB, Types;

type
  THackTabularView = class(TListViewSmartTabularView);

resourcestring
  STR_LoadAll = 'Recarregando os Items...';
  STR_COLUMNNEEDVISIBLE = 'A columa (%s) precisa estar visível';
  STR_WARNING = 'Atenção';
  PROGRAMERRORNOCOLUMNS = 'Erro de programa, não foi adicionado colunas';
  STR_MEMTABLENIL = 'Erro de programa, memtable = nil';
  STR_CONFIGURATION = 'Configurar';
  STR_PRINT = 'Imprimir';

procedure Register;
begin
  RegisterComponents('OtControls', [TSmartListView]);
end;

{ TSmartListView }

procedure TSmartListView.AfterSwap(const Order: TOrderType);
begin
  if FEnableSum then
    FCustomListViewFilter.AddSumLine;
end;

procedure TSmartListView.BeforeSwap(const Order: TOrderType);
begin
  FCustomListViewFilter.RemoveSumLine;
end;

procedure TSmartListView.NextFixColumn;
begin
{  if FTabularView.FixColumn < Self.Columns.Count then
  begin
    Self.Items.BeginUpdate;
    FTabularView.VisualColumns[FTabularView.FixColumn].SaveWidth := Self.Columns[FTabularView.FixColumn].Width;
    Self.Columns[FTabularView.FixColumn].Width := 0;
    FTabularView.VisualColumns[FTabularView.FixColumn].Width := 0;
//    UpdateSizeofMainColumn(FTabularView.FixColumn);
    FTabularView.FixColumn := FTabularView.FixColumn + 1;
    Self.Items.EndUpdate;
  end;}
end;

procedure TSmartListView.PrevFixColumn;
begin
{  if (FTabularView.FixColumn < Self.Columns.Count + 1)
  and (FTabularView.FixColumn > FTabularView.FixColumns) then
  begin
    Self.Items.BeginUpdate;
    FTabularView.FixColumn := FTabularView.FixColumn -1;
    Self.Columns[FTabularView.FixColumn].Width := FTabularView.VisualColumns[FTabularView.FixColumn].SaveWidth;
    FTabularView.VisualColumns[FTabularView.FixColumn].Width := FTabularView.VisualColumns[FTabularView.FixColumn].SaveWidth;
//    UpdateSizeofMainColumn(FTabularView.FixColumn);
    Self.Items.EndUpdate;
  end;}
end;

procedure TSmartListView.LoadAll(Sender: TObject);
begin
  ShowWait(STR_LoadAll);
  THackTabularView(FTabularView).InternalExecute;
  HideWait;
end;

{Luciano - Fim - 26/10/01}

constructor TSmartListView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FCustomListViewFilter := TCustomListViewFilter.Create(Self);
  FTabularView := TListViewSmartTabularView.Create(Self, FCustomListViewFilter);
  FTabularView.BeforeSwapProc := BeforeSwap;
  FTabularView.AfertSwapProc := AfterSwap;

  FCustomListViewFilter.SmartTabularView := FTabularView;
  FCustomListViewFilter.CarregaTodosItens := LoadAll;

  FEnableFilter := True;
  FEnableSort := True;

//  FMainColumnList := TList.Create;
//  FIndexSubColumns := 0;
//  FScrollPos := Left;
  FEnablePaintCells := True;
  FTabularView.CorRelatorio:= False;
  CreateEditControls;
  FLastIndex := -1;
  FEnableSum := True;
  FListDataSet := TStringList.Create;
  FPopup := nil;
end;

destructor TSmartListView.Destroy;
begin
  FreeEditControls;
//  FreeMainColumns;
//  FMainColumnList.Free;
  FCustomListViewFilter.Free;
  FTabularView.Free;

  FListDataSet.Clear; // a liberacao dos dataset fica a cargo do programador
  FListDataSet.Free;

  // liberar as informações de email

  inherited Destroy;
end;

procedure TSmartListView.Execute;
begin
  FLoading := True; // não executar os eventos
  try
    if FTabularView.ColumnsCount = 0 then
      raise ESmartListView.Create(PROGRAMERRORNOCOLUMNS);
    FCustomListViewFilter.RemoveSumLine;
    THackTabularView(FTabularView).InternalExecute;
    FCustomListViewFilter.Grouped := False;
    if FEnableSum then
      FCustomListViewFilter.AddSumLine;
  //  UpdateMainHeaderSize;
  finally
    FLoading := False;
  end;
end;

function TSmartListView.GetAdjustColumns(const Column: Integer): TTabularViewColumn;
begin
  Result := FTabularView.AdjustColumns[Column];
end;

procedure TSmartListView.ConfigureView;
begin
  if FTabularView.ViewActive then
  begin
    SaveCheckBoxState;
    if FXEdit < Columns.Count then
      Columns[FXEdit].ImageIndex := FLastIndex;
    FXEdit := 0;
    FLastIndex := -1;

//    SetImagetoFixColumns(-1);

    FCustomListViewFilter.RemoveSumLine;

{    if FShowMainColumns then
      FTabularView.List := EnumMainColumnPos;}

    FTabularView.ConfigureView;

//    ResetAllColumns;

//    SetImagetoFixColumns(FIndexFixColumnImage);

    if FEnableSum then
      FCustomListViewFilter.AddSumLine;

//    UpdateMainHeaderSize;
{    if FShowMainColumns then
      FHeaderControl.Font := Font;}
    Canvas.Font := Font;
{    FTabularView.List.Free;
    FTabularView.List := nil;}
    FCustomListViewFilter.Grouped := False;
  end;
end;

function TSmartListView.GetRegisterName: String;
begin
  Result := FTabularView.RegNameSave;
end;

procedure TSmartListView.SetRegisterName(const Value: String);
begin
  FTabularView.RegNameSave := Value;
end;

function TSmartListView.GetFixColumns: Integer;
begin
//  Result := FTabularView.FixColumns;
  Result := 0;
end;

procedure TSmartListView.SetFixColumns(const Value: Integer);
begin
{  SetImagetoFixColumns(-1);
  ResetAllColumns;
  FTabularView.FixColumns := Value;
  SetImagetoFixColumns(FIndexFixColumnImage);}
  CompError(Value > 0);  
end;

procedure TSmartListView.ColRightClick(Column: TListColumn; Point: TPoint);
begin
  inherited ColRightClick(Column, Point);
  if FCustomListViewFilter.PadraoAtivo then
  begin
    FCustomListViewFilter.IndexSumLine := -1;
    Execute;
    FCustomListViewFilter.PadraoAtivo := False;
  end
  else
  if FEnableFilter then
    FCustomListViewFilter.Filter(ColumnofXPos(Point.X).VisualIndex, Self, FTabularView.LinesCount);
end;

procedure TSmartListView.ColClick(Column: TListColumn);
begin
  if FCustomListViewFilter.PadraoAtivo then
  begin
    FCustomListViewFilter.IndexSumLine := -1;
    THackTabularView(FTabularView).InternalExecute;
    FCustomListViewFilter.PadraoAtivo := False;
  end
  else
  if FEnableSort then
    FTabularView.DoColumnClick(Column);
  inherited ColClick(Column);
end;

(*procedure TSmartListView.DoEndColumnResize( columnindex, columnwidth: Integer );
var
  lTabCol: TTabularViewColumn;
begin
  { atualizar o tamanho da list visual }
  lTabCol := FTabularView.VisualColumns[columnindex];
  if lTabCol <> nil then
    lTabCol.Width := columnwidth;
{  if FShowMainColumns then
    UpdateSizeofMainColumn(columnindex);}
end;*)

(*function TSmartListView.FindColumnIndex(pHeader: pNMHdr): Integer; 
var
  hwndHeader: HWND;
  iteminfo: THdItem;
  itemindex: Integer;
  buf: array [0..128] of Char;
begin
  Result := -1;
  hwndHeader := pHeader^.hwndFrom;
  itemindex := pHDNotify( pHeader )^.Item;
  FillChar( iteminfo, sizeof( iteminfo ), 0);
  iteminfo.Mask := HDI_TEXT;
  iteminfo.pszText := buf;
  iteminfo.cchTextMax := sizeof(buf)-1;
  Header_GetItem( hwndHeader, itemindex, iteminfo );
  if CompareStr( Columns[itemindex].Caption, iteminfo.pszText ) = 0 then
    Result := itemindex
  else
  begin
    for itemindex := 0 to Columns.count-1 do
     if CompareStr( Columns[itemindex].Caption, iteminfo.pszText ) = 0 then
     begin
       Result := itemindex;
       Break;
     end;
  end;
end;
*)
(*
function TSmartListView.FindColumnWidth(pHeader: pNMHdr): Integer;
begin
  Result := -1;
  if Assigned( PHDNotify( pHeader )^.pItem )
  and ((PHDNotify( pHeader )^.pItem^.mask and HDI_WIDTH) <> 0 ) then
    Result := PHDNotify( pHeader )^.pItem^.cxy;
end;
*)

(*procedure TSmartListView.ResetAllColumns;
var
  i: Integer;
begin
  for i := FTabularView.FixColumns to FTabularView.FixColumn -1 do
    Self.Columns[i].Width := TTabularViewColumn(Self.Columns[i].Tag).Width;
end;*)

procedure TSmartListView.HideWaitForm;
begin
  HideWait;
end;

procedure TSmartListView.ShowWaitForm(Animacao: TCommonAVI; Msg: String);
begin
  ShowWait(Msg);
end;

{function TSmartListView.GetMainColumn(const Column: Integer): TSmartListMainColumn;
begin
  Result := TSmartListMainColumn(FMainColumnList[Column]);
end;}

{procedure TSmartListView.FreeMainColumns;
var
  i: Integer;
begin
  try
    for i := 0 to FMainColumnList.Count -1 do
      TObject(FMainColumnList[i]).Free;
  finally
    FMainColumnList.Clear;
  end;
end;}

{procedure TSmartListView.AddMainColumn(const Caption: String; const SubColumns: Integer);
var
  MainCol: TSmartListMainColumn;
begin
  MainCol := TSmartListMainColumn.Create;
  MainCol.Caption := Caption;
  MainCol.IndexFirstSubColumn := FIndexSubColumns;
  MainCol.IndexLastSubColumn := FIndexSubColumns + SubColumns - 1;
  MainCol.Width := CalcSizeofColumns(MainCol.IndexFirstSubColumn, MainCol.IndexLastSubColumn);
  FIndexSubColumns := FIndexSubColumns + SubColumns;

  if FShowMainColumns then
    with FHeaderControl.Sections.Add do
    begin
      Text := Caption;
      MainCol.SetOwner(FHeaderControl.Sections[Index]);
    end;
  FMainColumnList.Add(MainCol);
end;}

function TSmartListView.GetShowMainColumns: Boolean;
begin
//  Result := FShowMainColumns;
  Result := False;
end;

procedure TSmartListView.SetShowMainColumns(const Value: Boolean);
begin
  CompError(Value);
{  FShowMainColumns := Value;
  if FShowMainColumns then
  begin
    FHeaderControl := THeaderControl.Create(Self);
    FHeaderControl.Parent := Self.Parent;
    FHeaderControl.Align := alNone;
    FHeaderControl.Style := hsFlat;
    FHeaderControl.OnSectionTrack := HeaderControlSectionTrack;
    UpdateHeaderPosition;
    DisplayMainColumns;
  end
  else
  begin
    FHeaderControl.Free;
    FHeaderControl := nil;
  end;}
end;

{procedure TSmartListView.UpdateHeaderPosition;
begin
  if not FResizing then
  begin
    FResizing := True;
    FHeaderControl.Top := Top - FHeaderControl.Height;
    FHeaderControl.Width := ClientWidth - Left - FScrollPos;
    FHeaderControl.Left := Left + FScrollPos;
    if FHeaderControl.Top < 0 then
    begin
      Self.Height := Self.Height - FHeaderControl.Height;
      Self.Top := Self.Top + FHeaderControl.Height;
      FHeaderControl.Top := 0;
    end;
    FResizing := False;
  end;
end;}

{procedure TSmartListView.ListViewResize(var Msg: TMessage);
begin
  inherited;
  if FShowMainColumns then
    UpdateHeaderPosition;
end;}

{procedure TSmartListView.ListViewMoving(var Msg: TMessage);
begin
  inherited;
  if FShowMainColumns then
    UpdateHeaderPosition;
end;}

{procedure TSmartListView.DisplayMainColumns;
var
  i: Integer;
  hSection: THeaderSection;
begin
  for i := 0 to FMainColumnList.Count -1 do
  begin
    hSection := FHeaderControl.Sections.Add;
    hSection.Text := MainColumn[i].Caption;
    MainColumn[i].SetOwner(hSection);
    hSection.Width := MainColumn[i].Width;
  end;
end;}

{procedure TSmartListView.StartLast(var Start, Last: Integer);
var
  i: Integer;
begin
  i := Start;
  while i <= Last do
  begin
    if FTabularView.AdjustColumns[i].Visible then
    begin
      Start := i;
      i := Last;
    end;
    inc(i);
  end;
  i := Last;
  while i >= Start do
  begin
    if FTabularView.AdjustColumns[i].Visible then
    begin
      Last := i;
      i := Start;
    end;
    dec(i);
  end;
end;}

{function TSmartListView.CalcSizeofColumns(const Start, Last: Integer): Integer;
var
  i: Integer;
  Max: Integer;
begin
  Result := 0;
  Max := Last;
  if Max >= Columns.Count then
    Max := Columns.Count -1;
  for i := Start to Max do
    Result := Result + FTabularView.AdjustColumns[i].Width;
end;}

{procedure TSmartListView.ListViewScroll(var Msg: TWMHScroll);
begin
  inherited;
  FScrollPos := -GetScrollPos(Handle, SB_HORZ);
  if FShowMainColumns then
  begin
    FHeaderControl.Width := BoundsRect.Right - FHeaderControl.Left;
    FHeaderControl.Left := FScrollPos;
  end;
end;}

{procedure TSmartListView.UpdateSizeofMainColumn(const AColumn: Integer);
var
  i: Integer;
begin
  i := 0;
  while i < FMainColumnList.Count do
  begin
    if  (MainColumn[i].IndexFirstSubColumn <= AColumn)
    and (MainColumn[i].IndexLastSubColumn >= AColumn) then
      MainColumn[i].Width := CalcSizeofColumns(MainColumn[i].IndexFirstSubColumn, MainColumn[i].IndexLastSubColumn);
    inc(i);
  end;
end;}

{procedure TSmartListView.UpdateMainHeaderSize;
var
  i: Integer;
begin
  for i := 0 to FMainColumnList.Count -1 do
    TSmartListMainColumn(FMainColumnList[i]).Width := CalcSizeofColumns(TSmartListMainColumn(FMainColumnList[i]).IndexFirstSubColumn,
                                                                        TSmartListMainColumn(FMainColumnList[i]).IndexLastSubColumn);
end;}

function TSmartListView.GetAdjustColumnsByName(const ColumnName: String): TTabularViewColumn;
var
  i: Integer;
begin
  i := IndexofColumnName(ColumnName);
  if i <> -1 then
    Result := AdjustColumns[i]
  else

     raise EInvalidColumn.CreateFmt('Coluna (%s) não existe', [ColumnName]);
end;

function TSmartListView.IndexofColumnName(const AColumnName: String): Integer;
var
  i: Integer;
begin
  Result := -1;
  i := 0;
  while i < FTabularView.ColumnsCount do
  begin
    if CompareText(AColumnName, FTabularView.AdjustColumns[i].Name) = 0 then
    begin
      Result := i;
      i := FTabularView.ColumnsCount;
    end;
    inc(i);
  end;  
end;

procedure TSmartListView.CreateImage;
var
  lBitMap: TBitmap;
begin
  lBitMap := TBitmap.Create;
  try
    if SmallImages = nil then
    begin
      FImageList := TImageList.Create(Self);
      SmallImages := FImageList;
    end;
{    lBitMap.LoadFromResourceName(HInstance, 'FIXCOLUMN');
    FIndexFixColumnImage := SmallImages.Add(lBitMap, nil);}
    lBitMap.LoadFromResourceName(HInstance, 'EDIT');
    FIndexEditImage := SmallImages.Add(lBitMap, nil);
  finally
    lBitMap.Free;
  end;
end;

(*procedure TSmartListView.SetImagetoFixColumns(const AIndexFixColumnImage: Integer);
var
  i: Integer;
begin
  for i := 0 to FTabularView.FixColumns -1 do
    Columns[i].ImageIndex := AIndexFixColumnImage;
end;*)

procedure TSmartListView.Loaded;
var
  lPath: String;
begin
  inherited Loaded;
  CreateImage;
  lPath := '';
  Canvas.Font := Font;
  if Assigned(FOnGetPath) then
  begin
     FOnGetPath(lPath);
     if DirectoryExists(lPath) then
       FTabularView.SetPath(lPath);
  end
  else
  begin
    if not(csDesigning in Self.ComponentState) then
    begin
      MessageBox(Handle, 'Evento de Busca de Caminho nao implementado (OnGetPath)', 'Erro', MB_OK or MB_ICONERROR);
      Free;
    end;
  end;
end;

{function TSmartListView.EnumMainColumnPos: TList;
var
  lList: TList;
  i: Integer;
begin
  lList := TList.Create;
  try
    lList.Clear;
    for i := 0 to FMainColumnList.Count -1 do
      lList.Add(Pointer(MainColumn[i].IndexLastSubColumn));
  finally
    Result := lList;
  end;
end;}

procedure TSmartListView.Clear;
var
  i: Integer;
begin
  Items.BeginUpdate;
  try
    FCustomListViewFilter.RemoveSumLine;
    for i := 0 to FTabularView.ColumnsCount -1 do
      FTabularView.Columns[i].Clear;
    FTabularView.ClearLines;
    inherited Clear;
  finally
    Items.EndUpdate;
  end;
end;

procedure TSmartListView.WMNotify(var msg: TWMNotify);
begin
  inherited;
  case msg.NMHdr^.code of
    HDN_DIVIDERDBLCLICK:
      begin
        if FEnablePaintCells then
          Invalidate;
      end;
{    HDN_ENDTRACK:
      DoEndColumnResize( FindColumnIndex( msg.NMHdr ),
                         FindColumnWidth( msg.NMHdr ));}
{    HDN_BEGINTRACK:
      DoBeginColumnResize( FindColumnIndex( msg.NMHdr ),
                           FindColumnWidth( msg.NMHdr ));}
{    HDN_TRACK:
      DoColumnResize( FindColumnIndex( msg.NMHdr ),
                      FindColumnWidth( msg.NMHdr ));}
  end;
end;

procedure TSmartListView.CreateWnd;
var
  wnd: HWND;
begin
  inherited CreateWnd;
  wnd:= GetWindow( handle, GW_CHILD );
  SetWindowLong( wnd, GWL_STYLE, GetWindowLong( wnd, GWL_STYLE ) and not HDS_FULLDRAG);
end;

procedure TSmartListView.DblClick;
var
  i: Integer;
  lColumn: TTabularViewColumn;
  pt: TPoint;
  pRect: ^TRect;
  lvItem: TListItem;
begin
  inherited DblClick;
  //***************************************
  // executar o evento associado a coluna
  //***************************************
  if Columns.Count > 0 then
  begin
    New(pRect);
    try
      ZeroMemory(@pRect^, Sizeof(TRect));
      i := 1;
      { encontrar a coluna em que foi clicado }
      pt := ScreenToClient(mouse.CursorPos);
      if pt.x < Columns[0].Width then
        lColumn := TTabularViewColumn(Columns[i - 1].Tag)
      else
      begin
        while (pt.x > pRect.Right)
        and (i < Columns.Count) do
        begin
          ListView_GetSubItemRect(Self.Handle, 1, i, LVIR_BOUNDS, @pRect^);
          inc(i);
        end;
        lColumn := TTabularViewColumn(Columns[i - 1].Tag);
      end;
      if  Assigned(lColumn.onDblClick) then
      begin
        { encontrar a linha a ser executado o evento }
        i := 0;
        lvItem := GetItemAt(10, pt.y);
        if lvItem = nil then { procurar pela posicao y }
        begin
          ZeroMemory(@pRect^, Sizeof(TRect));
          if Items.Count > 0 then
          begin
            while (pt.y > pRect.Bottom)
            and (i < Items.Count) do
            begin
              ListView_GetSubItemRect(Self.Handle, i, lColumn.VisualIndex, LVIR_BOUNDS, @pRect^);
              inc(i);
            end;
            lvItem := Items[i - 1];
          end;
        end;

        if lvItem <> nil then
          lColumn.DoDblClick(Integer(lvItem.Data));
      end;
    finally
      Dispose(pRect);
    end;
  end;
  if Selected <> nil then
    DoEdit(ColumnofXPos(ScreentoClient(Mouse.CursorPos).x).VisualIndex, Selected.Index);
end;

function TSmartListView.ColumnofXPos(const X: Integer): TTabularViewColumn;
var
  i: Integer;
  pRect: ^TRect;
begin
  New(pRect);
  try
    ZeroMemory(@pRect^, Sizeof(TRect));
    i := 1;
    if X < Columns[0].Width then
      Result := TTabularViewColumn(Columns[i - 1].Tag)
    else
    begin
      while (X > pRect.Right)
      and (i < Columns.Count) do
      begin
        ListView_GetSubItemRect(Self.Handle, 1, i, LVIR_BOUNDS, @pRect^);
        inc(i);
      end;
      if i <= Columns.Count then
        Result := TTabularViewColumn(Columns[i - 1].Tag)
      else
        Result := nil;
    end;
  finally
    Dispose(pRect);
  end;
end;

(*procedure TSmartListView.HeaderControlSectionTrack(HeaderControl: THeaderControl; Section: THeaderSection;
                                                   Width: Integer; State: TSectionTrackState);
var
  SizeCol: Integer;
  i: Integer;
  Start, Last: Integer;

begin
  case State of
    tsTrackEnd: begin { atualizar a largura dos sub colunas so quando terminar de redimensionar a principal }
                  Start := MainColumn[Section.Index].IndexFirstSubColumn;
                  Last := MainColumn[Section.Index].IndexLastSubColumn;
                  StartLast(Start, Last);
                  SizeCol := Round((Section.Width - (2 * (Last - Start))) / (Last - Start + 1));
                  for i := Start to Last do
                  begin
                    Self.Columns[FTabularView.Columns[i].VisualIndex].Width := SizeCol;
                    FTabularView.Columns[i].Width := SizeCol;
                  end;
                  MainColumn[Section.Index].Width := Section.Width;
                end;
  end;
end;*)

const pRect: TRect = ();

procedure TSmartListView.DrawPaintItem(const First, Last: Integer);
var
  i, j, lindex: Integer;
  Dif: Integer;
  lDrawFocus: Boolean;
begin
  //****************** pintar as celulas ********************
  for i := First to Last do
  begin
    lDrawFocus := False;
    lindex := GetItemIndex(i); { indice real do item na lista de valores }
    if  (Columns[0].Width <> 0)
    and (TTabularViewColumn(Columns[0].Tag).Color[lindex] <> clNone) then
    begin
      pRect := Items[i].DisplayRect(drSelectBounds);
      if Checkboxes then
      begin
        pRect.Left := pRect.Left + 20;
        pRect.Right := pRect.Left + Columns[0].Width - 20;
      end
      else
      begin
        pRect.Left := pRect.Left + 5;
        pRect.Right := pRect.Left + Columns[0].Width - 5;
      end;
      if SmallImages <> nil then
        pRect.Left := pRect.Left + SmallImages.Width - 1;
      Dif := pRect.Left + 15;
      Canvas.Brush.Color := TTabularViewColumn(Columns[0].Tag).Color[lindex];
{ Estefam 09.07.04 Inicio Netalco manter a linha o grid}
      pRect.Left:=pRect.Left + 1;
      pRect.Bottom :=pRect.Bottom - 1;
{ Estefam 09.07.04 Final  Netalco }
      Canvas.TextRect(pRect, Dif, pRect.Top, Items[i].Caption);
      lDrawFocus := True;
    end;
    for j := 0 to Items[i].SubItems.Count -1 do
    begin
      if (Columns[j + 1].Width <> 0)
      and (TTabularViewColumn(Columns[j + 1].Tag).Color[lindex] <> clNone) then
      begin
        Canvas.Brush.Color := TTabularViewColumn(Columns[j + 1].Tag).Color[lindex];
        ListView_GetSubItemRect(Handle, i, j + 1, LVIR_BOUNDS, @pRect);
        case Columns[j + 1].Alignment of
          taLeftJustify: Dif := pRect.Left + 6;
          taRightJustify: Dif := pRect.Right - (Canvas.TextWidth(Items[i].SubItems[j])) - 6;
          taCenter: Dif := ((pRect.Left + pRect.Right) div 2) - Canvas.TextWidth(Items[i].SubItems[j]) div 2;
        else
          Dif := 0;
        end;
{ Estefam 09.07.04 Inicio Netalco manter a linha o grid}        
        pRect.Left:=pRect.Left + 1;
        pRect.Bottom :=pRect.Bottom - 1;
{ Estefam 09.07.04 Final  Netalco }        
        Canvas.TextRect(pRect, Dif, pRect.Top, Items[i].SubItems[j]);
        lDrawFocus := True;
      end;
    end;
    if Items[i].Focused then
    begin
      if lDrawFocus then
      begin
        pRect := Items[i].DisplayRect(drSelectBounds);
        Canvas.Brush.Color := clWhite;
        Canvas.DrawFocusRect(pRect);
      end;
    end;
  end;
end;

procedure TSmartListView.WMPAINT(var msg: TWMPAINT);

  function Menor(const A, B: Integer): Integer;
  begin
    if A < B then
      Result := A
    else
      Result := B;
  end;
  
begin
  inherited;

//  if (TopItem <> nil)
  if {and} (FEnablePaintCells)
  and not FTabularView.Updating
  and not FCustomListViewFilter.Grouped then
  if (TopItem <> nil) then
    DrawPaintItem(TopItem.Index, Menor(Items.Count -1, TopItem.Index + Self.VisibleRowCount + 2))
  else
    DrawPaintItem(0, Menor(Items.Count -1, Self.VisibleRowCount + 2))
end;

procedure TSmartListView.DoLocateItem;
begin
  if Selected <> nil then
    FTabularView.StartIndex := Selected.Index + 1
  else FTabularView.StartIndex := 0;

  if FArgument = '' then
    DoNewLocate
  else
    FTabularView.Locate(FArgument, FFindColumn);
end;

procedure TSmartListView.DoNewLocate;
var
  F: TArgumentInput;
begin
  F := TArgumentInput.CreateNew(Self);
  try
    F.AddColumns(Columns);
    F.Argument := FArgument;
    F.Column := FFindColumn;
    if F.ShowModal = mrOk then
    begin
      FArgument := F.Argument;
      FFindColumn := F.Column;
      if FArgument <> '' then
        DoLocateItem;
    end;
  finally
    F.Free;
  end;
end;

procedure TSmartListView.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited KeyUp(Key, Shift);
  case Key of
    VK_F3: DoLocateItem;
    Ord('F'), Ord('f'): if ssCtrl in Shift then
                          DoNewLocate;
    VK_LEFT: begin
               Columns[FXEdit].ImageIndex := FLastIndex;
               dec(FXEdit);
               if FXEdit < 0 then
                 FXEdit := 0;
               FLastIndex := Columns[FXEdit].ImageIndex;
               Columns[FXEdit].ImageIndex := FIndexEditImage;
             end;
    VK_RIGHT: begin
               Columns[FXEdit].ImageIndex := FLastIndex;
               inc(FXEdit);
               if FXEdit >= Columns.Count then
                 FXEdit := Columns.Count -1;
               FLastIndex := Columns[FXEdit].ImageIndex;
               Columns[FXEdit].ImageIndex := FIndexEditImage;
              end;
    VK_RETURN: begin
                 if Selected <> nil then
                   DoEdit(FXEdit, Selected.Index);
               end;
    VK_F7: begin
             if Assigned(FOnGetFindColumn) then
             begin
               FOnGetFindColumn(FFindColumn);
               if (FFindColumn < FTabularView.ColumnsCount) then
                 if FTabularView.AdjustColumns[FFindColumn].Visible then
                 begin
                   FFindColumn := FTabularView.AdjustColumns[FFindColumn].VisualIndex;
                   FArgument := '';
                   DoLocateItem;
                 end
                 else MessageBox(Handle, PChar(Format(STR_COLUMNNEEDVISIBLE, [FTabularView.AdjustColumns[FFindColumn].Caption])), PChar(STR_WARNING), MB_OK + MB_ICONWARNING);
             end;
           end;
  end;
end;

function TSmartListView.GetItemIndex(const Item: Integer): Integer;
begin
  if Item < Items.Count then
    Result := Integer(Items[Item].Data)
  else Result := -1;
end;

procedure TSmartListView.CreateEditControls;
begin
  FComboBox := TComboBox.Create(nil);
  FComboBox.Style := csDropDownList;
  FComboBox.OnExit := HideEditControls;
  FComboBox.OnKeyUp := CancelEditControls;
  FComboBox.Ctl3D := False;

  FEditInteger := TIntegerEdit.Create(nil);
  FEditInteger.OnExit := HideEditControls;
  FEditInteger.OnKeyUp := CancelEditControls;
  FEditInteger.Ctl3D := False;

  FEditFloat := TFloatEdit2.Create(nil);
  FEditFloat.OnExit := HideEditControls;
  FEditFloat.OnKeyUp := CancelEditControls;
  FEditFloat.Ctl3D := False;

  FEditText := TEdit.Create(nil);
  FEditText.OnExit := HideEditControls;
  FEditText.OnKeyUp := CancelEditControls;
  FEditText.Ctl3D := False;

  FDataTimeEdit := TDateTimePicker.Create(nil);
  FDataTimeEdit.OnExit := HideEditControls;
  FDataTimeEdit.OnKeyUp := CancelEditControls;
end;

procedure TSmartListView.DisplayEditControls(const ARect: TRect; const AEditMode: TEditMode; const Value: String);
begin
  case AEditMode of
    emNone:;
    emInteger: begin
                 FEditInteger.Parent := Self;
                 FEditInteger.BoundsRect := ARect;
                 FEditInteger.Show;
                 FEditInteger.SetFocus;
                 FEditInteger.IntegerNumber := Integerof(Value);
               end;
    emFloat: begin
               FEditFloat.Parent := Self;
               FEditFloat.BoundsRect := ARect; 
               FEditFloat.Show;
               FEditFloat.SetFocus;
               FEditFloat.FloatNumber := floatof(Value);
             end;
    emText: begin
              FEditText.Parent := Self;
              FEditText.BoundsRect := ARect;
              FEditText.Show;
              FEditText.SetFocus;
              FEditText.Text := Value;
            end;
    emData: begin
              FDataTimeEdit.Parent := Self;
              FDataTimeEdit.Kind := dtkDate;
              FDataTimeEdit.BoundsRect := ARect;
              FDataTimeEdit.Show;
              FDataTimeEdit.SetFocus;
              FDataTimeEdit.Date := StrToDate(Value);
            end;
    emTime: begin
              FDataTimeEdit.Parent := Self;
              FDataTimeEdit.Kind := dtkTime;
              FDataTimeEdit.BoundsRect := ARect;
              FDataTimeEdit.Show;
              FDataTimeEdit.SetFocus;
              FDataTimeEdit.Time := StrToTime(Value);
            end;
    emList: begin
              FComboBox.Parent := Self;
              FComboBox.BoundsRect := ARect;
              FComboBox.Show;
              FComboBox.SetFocus;
            end;
  end;
  FEdited := True;
end;

procedure TSmartListView.FreeEditControls;
begin
  FComboBox.Free;
  FEditInteger.Free;
  FEditFloat.Free;
  FEditText.Free;
  FDataTimeEdit.Free;
end;

procedure TSmartListView.HideEditControls(Sender: TObject);
begin
  if FEdited then
  begin
    UpdateValue;
    if Assigned(FonAfterEdit) then
      FonAfterEdit(FXEdit, GetItemIndex(FYEdit));
  end;
  TControl(Sender).Hide;
  TControl(Sender).Top := -TControl(Sender).Height;
  SetFocus;
end;

procedure TSmartListView.DoEdit(x, y: Integer);
var
  pRect: TRect;
  lValue: String;
begin
  if not ReadOnly
  and not FCustomListViewFilter.Grouped
  and (FCustomListViewFilter.IndexSumLine <> y) then
  begin
    FXEdit := x;
    FYEdit := y;

    ListView_GetSubItemRect(Handle, y, x, 0, @pRect);
    if x = 0 then
      pRect.Right := pRect.Left + Columns[0].Width;
    lValue := TTabularViewColumn(Columns[x].Tag).Lines[GetItemIndex(FYEdit)];
    DisplayEditControls(pRect, TTabularViewColumn(Columns[x].Tag).EditMode, lValue);
    if TTabularViewColumn(Columns[x].Tag).EditMode = emList then { ser for um combo executar uma rotina de carga dos items }
    begin
      FComboBox.Items.Clear;
      if Assigned(TTabularViewColumn(Columns[x].Tag).onGetListValues) then
        TTabularViewColumn(Columns[x].Tag).onGetListValues(FComboBox.Items)
      else FComboBox.Items.Add(lValue);
      FComboBox.ItemIndex := FComboBox.Items.IndexOf(lValue);
    end;
  end;
end;

procedure TSmartListView.UpdateValue;
var
  lIndex: Integer;
begin
  lIndex := GetItemIndex(FYEdit);
  case TTabularViewColumn(Columns[FXEdit].Tag).EditMode of
    emNone:;
    emInteger: TTabularViewColumn(Columns[FXEdit].Tag).Lines[lIndex] := FEditInteger.Text;
    emFloat: TTabularViewColumn(Columns[FXEdit].Tag).Lines[lIndex] := FEditFloat.Text;
    emText: TTabularViewColumn(Columns[FXEdit].Tag).Lines[lIndex] := FEditText.Text;
    emData: TTabularViewColumn(Columns[FXEdit].Tag).Lines[lIndex] := DateToStr(FDataTimeEdit.Date);
    emTime: TTabularViewColumn(Columns[FXEdit].Tag).Lines[lIndex] := TimeToStr(FDataTimeEdit.Time);
    emList: TTabularViewColumn(Columns[FXEdit].Tag).Lines[lIndex] := FComboBox.Text;
  end;
  if FXEdit = 0 then
    Items[FYEdit].Caption := TTabularViewColumn(Columns[FXEdit].Tag).Lines[lIndex]
  else
    Items[FYEdit].SubItems[FXEdit -1] := TTabularViewColumn(Columns[FXEdit].Tag).Lines[lIndex];
end;

procedure TSmartListView.CancelEditControls(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: begin
                 FEdited := False;
                 TControl(Sender).Parent.SetFocus;
               end;
    VK_RETURN: TControl(Sender).Parent.SetFocus;
  end;
end;

procedure TSmartListView.UpdateLine(const Line: Integer);
begin
  FTabularView.UpdateLine(Line);
end;

procedure TSmartListView.SetEnableSum(const Value: Boolean);
begin
  FEnableSum := Value;
  FCustomListViewFilter.EnableSum := FEnableSum;
end;

procedure TSmartListView.SaveCheckBoxState;
var
  i: Integer;
begin
  for i := 0 to Self.Items.Count -1 do
    FTabularView.Checked[Longint(Self.Items[i].Data)] := Self.Items[i].Checked;
end;

function TSmartListView.GetCorListView: Boolean;
begin
  Result := FTabularView.CorRelatorio;
end;

procedure TSmartListView.SetCorListView(const Value: Boolean);
begin
  FTabularView.CorRelatorio := Value;
end;

procedure TSmartListView.PasteToClipBoard;
const
  TABULATION_CHAR = #9;
  CR_CHAR = #13;
var
  AClipboard: TClipboard;
  lStr: String;
  lRow, lCol: Longint;
  lItem: TListItem;
  lPChar: PChar;
  lSize: Cardinal;
  Max: Longint;
begin
  lSize := (Items.Count * Columns.Count * 50);
  lPChar := StrAlloc(lSize);
  try
    FillChar(lPChar^, lSize, #0);

{Mike 31.07.03 - Inicio - Douat - Exportar o cabeçalho também}
    For  lCol := 0 To Columns.Count - 1 do
         Begin
           lStr := Trim(Columns.Items[lCol].Caption) + TABULATION_CHAR;
           StrLCat(lPChar, PChar(lStr), lSize);
         End;
    StrLCat(lPChar, CR_CHAR, lSize);
{Mike 31.07.03 - Fim - Douat - Exportar o cabeçalho também}

    Max := Items.Count -1;
    for lRow := 0 to Max do
    begin
      lItem := Items.Item[lRow];
      lStr := Trim(lItem.Caption) + TABULATION_CHAR;
      StrLCat(lPChar, PChar(lStr), lSize);
      for lCol := 0 to lItem.SubItems.Count -1 do
      begin
        lStr := Trim(lItem.SubItems[lCol]) + TABULATION_CHAR;
        StrLCat(lPChar, PChar(lStr), lSize);
      end;
      StrLCat(lPChar, CR_CHAR, lSize);
      
      if Assigned(FOnPasteProgress) then
        FOnPasteProgress(lRow, Max);
    end;

    AClipboard := Clipboard;
    AClipboard.Clear;
    AClipboard.SetTextBuf(lPChar);
  finally
    StrDispose(lPChar);
  end;
end;

{procedure TSmartListView.ClearMainColumns;
begin
  if FShowMainColumns then
  begin
    FreeMainColumns;
    FHeaderControl.Sections.Clear;
    FIndexSubColumns := 0;
  end;
end;}

procedure TSmartListView.SetFocus;
begin
  if not FCustomListViewFilter.FilterActive then
    inherited SetFocus
  else FCustomListViewFilter.SetFocus;
end;

{ TSmartListMainColumn }

(*constructor TSmartListMainColumn.Create;
begin
  inherited Create;
  FIndexFirstSubColumn := -1;
  FIndexLastSubColumn := -1;
end;

destructor TSmartListMainColumn.Destroy;
begin
  inherited Destroy;
end;

function TSmartListMainColumn.GetOwner: THeaderSection;
begin
  Result := FOwner;
end;

procedure TSmartListMainColumn.SetCaption(const Value: String);
begin
  FCaption := Value;
end;

procedure TSmartListMainColumn.SetOwner(const AOwner: THeaderSection);
begin
  FOwner := AOwner;
end;

procedure TSmartListMainColumn.SetWidth(const Value: Integer);
begin
  FWidth := Value;
  if FOwner <> nil then
    FOwner.Width := FWidth;
end;*)

procedure TSmartListView.DeleteEx(const AVisualLine: Integer);

  procedure UpdateItemIndex(const AIndex: Longint);
  var
    iItem: Longint;
    lItem: TListItem;
  begin
    for iItem := 0 to Self.Items.Count -1 do
    begin
      lItem := Self.Items.Item[iItem];
      if Longint(lItem.Data) > AIndex then
        lItem.Data := Pointer(Longint(lItem.Data) - 1)
    end;
  end;

var
  lMax: Longint;
begin
  if FEnableSum then
    lMax := Self.Items.Count -1
  else lMax := Self.Items.Count;
  if AVisualLine < lMax then
  begin
    Self.Items.BeginUpdate;
    try
      FCustomListViewFilter.RemoveSumLine;
      THackTabularView(FTabularView).MarkDelete(ItemIndex[AVisualLine]);
      UpdateItemIndex(ItemIndex[AVisualLine]);
      Delete(Items[AVisualLine]);
      if FEnableSum then
        FCustomListViewFilter.AddSumLine;
    finally
      Self.Items.EndUpdate;
    end;
  end;
end;

procedure TSmartListView.CompError(const AValue: Boolean);
begin
  if AValue
  and (csDesigning in ComponentState) then
    MessageBox(Handle, 'Mantido para compatibilidade', 'Atenção', MB_OK);
end;

procedure TSmartListView.Change(Item: TListItem; Change: Integer);
begin
  inherited Change(Item, Change);
  if not FLoading and not FTabularView.Updating and Checkboxes and Assigned(FOnCheck) and (Change = LVIF_STATE) then
    if Item.Checked <> FTabularView.Checked[ItemIndex[Item.Index]] then
    begin
      FTabularView.Checked[ItemIndex[Item.Index]] := Item.Checked;
      FOnCheck(Item);
    end;
end;

procedure TSmartListView.ClearDataSet;
begin
  FListDataSet.Clear;
end;

procedure TSmartListView.ApplyFilterSettings;
begin
  //aplicar a configuracao das colunas
  Execute;
  //aplicar a configuracao dos filtros
  // nao sera aplicado o somatorio
  CustomListViewFilter.ApplyFilter;
end;


procedure TSmartListView.SetMostrarMenuConfig(const Value: Boolean);
begin
  FMostrarMenuConfig := Value;
  if FMostrarMenuConfig then
    CreatePopupMenu
  else FreeAndNil(FPopup);
end;

procedure TSmartListView.CreatePopupMenu;
var
  Item: TMenuItem;
begin
  FPopup := TPopupMenu.Create(Self);

  Item := TMenuItem.Create(FPopup);
  Item.Caption := STR_CONFIGURATION;
  Item.OnClick := DoConfigure;
  FPopup.Items.Add(Item);

  Item := TMenuItem.Create(FPopup);
  Item.Caption := STR_PRINT;
  FPopup.Items.Add(Item);
end;

procedure TSmartListView.DoConfigure(Sender: TObject);
begin
  ConfigureView;
end;


procedure TSmartListView.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbRight)
  and FMostrarMenuConfig then
  begin
    P.X := X;
    P.Y := Y;
    P := ClientToScreen(P);
    FPopup.Popup(P.X, P.Y);
  end;
end;

procedure TSmartListView.Paint_a_Line(const Line: Integer;
  const AColor: TColor);
var
  i : Integer;
begin
  for i := 0 to FTabularView.ColumnsCount -1 do
     AdjustColumns[i].Color[Line] := AColor;
end;

end.
