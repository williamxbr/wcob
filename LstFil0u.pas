unit LstFil0u;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, forms, uAguarde,
  SBLstv0u,
  SBLstv2u,
  SBLstv3u,
  GenFunc,
  CommCtrl,
  LstFil1u,
  SBLstV4f;

const
  Num_Operadores = 8;
  Operadores : Array[1..Num_Operadores] of String = ('=','<','>','<=','>=','<>','Inicia','«');
  STR_NONE = '-nenhuma-';

type
  TCarregaTodosItens = TNotifyEvent;

  TSumLineVar = class
  private
    FList: TList;
    FTypes: TList;
    procedure CheckTypeCol(const ACol: Integer; const SumMode: TSumMode);
    function GetValueFloat(const ACol: Integer): Double;
    function GetValueInt(const ACol: Integer): Integer;
    procedure SetValueFloat(const ACol: Integer; const Value: Double);
    procedure SetValueInt(const ACol, Value: Integer);
    procedure FreeVariables;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Clear;
    procedure AddSumVar(const SumMode: TSumMode);
    property ValueInt[const ACol: Integer]: Integer read GetValueInt write SetValueInt;
    property ValueFloat[const ACol: Integer]: Double read GetValueFloat write SetValueFloat;
  end;

  TCustomListViewFilter = class;

// ROOSEVELT - INICIO - 13.08.2002

  TOrderColumn = (ocDesc, ocAsc);

  TOrderColsListView = class
  private
    FOwner: TCustomListViewFilter;
{    FTop: Byte;
    FIndice: array[0..2] of Integer;
    FOrdem: array[0..2] of Integer;}

    FFilterInf: TFilterInf;
  public
    constructor Create(Owner: TCustomListViewFilter);
    destructor Destroy; override; 
    procedure AddOrder(const IndexCol: Integer; const OrderColumn: TOrderColumn);
    procedure Clear;
    procedure DoSort;
  end;
// ROOSEVELT - FIM - 13.08.2002

  TCustomListViewFilter = class(TAbstractCustomListViewFilter)
  private
    Coluna : Integer;
// ROOSEVELT - INICIO - 13.08.2002
    FOrderColsListView: TOrderColsListView;
// ROOSEVELT - FIM - 13.08.2002
{ Arnoldo - Início - 18/10/2005 - Tecnologia}
    FListFilteredItems : TStringList;
{ Arnoldo - Fim - 18/10/2005 - Tecnologia}
    FListView : TListView;
    ComboFiltro : TComboBox;
    Lista : TStringList;
    FCarregaTodosItens : TCarregaTodosItens;
    FSmartTabularView: TListViewSmartTabularView;
    FIndexBySumLine: Integer;
    FGrouped: Boolean;
    FLinesCount: Integer;
    FSumLineVar: TSumLineVar;
    FSumAll: Boolean;
    FPadraoAtivo: Boolean;
    FEnableSum: Boolean;

    // guardar as somas dos valores filtrados
    FStrings: TStrings;
    Procedure ComboExit(Sender : TObject);
    Procedure ComboClick(Sender : TObject);
    Procedure Filtro_Cond;
//    procedure DoSort;
//    Procedure Filtro_Padrao;
    procedure EnumDifValues(const AColumn: Integer);
    procedure DoSumColumns(const Start, Last: LongInt);
    procedure DoGroupValues(const AColumn: Integer);
    procedure AddtoListView(const ACol: Integer; const Value: String);
    function GetFilterActive: Boolean;
    procedure SortByFilter;
    procedure GetColumnName(const AColumn: Longint; var AColumnName: String);
  public
    Constructor Create(const AListView: TListView);
    Destructor  Destroy; override;
    Procedure Filter(const AColuna: Integer; const Pai: TWinControl; const LinesCount: Integer);
    procedure RemoveSumLine;
    procedure AddSumLine;
    procedure SetFocus;
    procedure ApplyFilter;
{ Gueda I - 10.10.2006 - Renaux - Agrupar os valores de uma coluna automaticamente }
    procedure AgrupaColuna(const AColumn: Integer);
{ Gueda F - 10.10.2006 - Renaux - Agrupar os valores de uma coluna automaticamente }
    function GetRealColumnIndex(const AVisualIndex: Longint): Longint; override;
    property CarregaTodosItens : TCarregaTodosItens read FCarregaTodosItens write FCarregaTodosItens;
    property SmartTabularView: TListViewSmartTabularView read FSmartTabularView write FSmartTabularView;
    property IndexSumLine: Integer read FIndexBySumLine write FIndexBySumLine;
    property Grouped: Boolean read FGrouped write FGrouped;
    property PadraoAtivo: Boolean read FPadraoAtivo write FPadraoAtivo;
    property EnableSum: Boolean read FEnableSum write FEnableSum;
    property FilterActive: Boolean read GetFilterActive;
    property OrderColsListView: TOrderColsListView read FOrderColsListView;
  end;

var
  Indice1 : Integer;
  Indice : Array[1..3] of Record
                            Numero : Integer;
                            Ordem : Integer;
                          end;

implementation

{ Arnoldo - Início - 07/11/2005 - Tecnologia}
Uses SmtLstVw;
{ Arnoldo - Fim - 07/11/2005 - Tecnologia}

resourcestring
  STR_Group = 'Agrupando Valores...';
  STR_SumValues = 'Gerando Totalizações...';
  STR_COLUMNNEEDVISIBLE = 'A columa (%s) precisa estar visível para efetuar a ordenação';

type
  TFilterLineInfo = class
  private
    FLine: Longint;
    FArgument: String;
    FSubItens: TStrings;
    function GetSubItens: TStrings;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Line: Longint read FLine write FLine; // linha de insercao dos totais
    property Argument: String read FArgument write FArgument; // argumento da linha
    property SubItens: TStrings read GetSubItens; // itens da linha de total
  end;

// ROOSEVELT - INICIO - 13.08.2002
//const
//  FConstListView: TListView = nil;
// ROOSEVELT - FIM - 13.08.2002

(*function CustomSortProc(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
var
  Argumento1,
  Argumento2 : String;

  function Eh_data(linha:String):boolean;
  var
    ix1 : Integer;
  begin
    ix1 := pos('/',Linha);
    if   (length(trim(linha)) = 10)
    and  (ix1 > 0) then
         begin
           delete(linha,ix1,1);
           result := pos('/',Linha) > 0;
         end
    else
         Result := false;
  end;

begin
  if   Indice1 = 0 then
       begin
           Argumento1 := TListItem(Item1).Caption;
           Argumento2 := TListItem(Item2).Caption;
       end
  else
       begin
           Argumento1 := TListItem(Item1).SubItems.Strings[Indice1-1];
           Argumento2 := TListItem(Item2).SubItems.Strings[Indice1-1];
       end;
  if   Eh_data(Argumento1) then
       try
         Argumento1 := FormatDateTime('yyyymmdd',Strtodatetime(Argumento1));
         Argumento2 := FormatDateTime('yyyymmdd',Strtodatetime(Argumento2));
       except
       end;

// ROOSEVELT - INICIO - 13.08.2002
  case TTabularViewColumn(TSmartListView(Item1.ListView).CustomListViewFilter.FConstListView.Columns[Indice1].Tag).ColumnType of
// ROOSEVELT - FIM - 13.08.2002
    ctString: Result := lstrcmp(PChar(Argumento1), PChar(Argumento2));
    ctInteger: Result := Integerof(Argumento1) - Integerof(Argumento2);
    ctFloat:
      begin
        if floatof(Argumento1) < floatof(Argumento2) then
          Result := -1
        else
        if floatof(Argumento1) = floatof(Argumento2) then
           Result := 0
        else Result := 1;
      end;
    ctDate: Result := lstrcmp(PChar(Argumento1), PChar(Argumento2));
  else
    Result := 0;
  end;

  if   ParamSort = 0 then
    Result := -Result;
{       Result := -lstrcmp(PChar(Argumento1),
                     PChar(Argumento2))
  else
       Result := lstrcmp(PChar(Argumento1),
                     PChar(Argumento2));}
end;*)



// ROOSEVELT - INICIO - 13.08.2002
//  TOrderColsListView

constructor TOrderColsListView.Create(Owner: TCustomListViewFilter);
begin
  inherited Create;
  FOwner := Owner;
  FFilterInf := TFilterInf.Create;
  Clear;
end;

procedure TOrderColsListView.AddOrder(const IndexCol: Integer; const OrderColumn: TOrderColumn);
var
  lFilter: TFilterInformation;
begin
{  if FTop = 3 then
     raise Exception.Create('Você pode configurar no máximo 3 colunas!');
  FIndice[FTop] := IndexCol;
  FOrdem[FTop] := Byte(OrderColumn);
  Inc(FTop);}
  lFilter := TFilterInformation.Create(FFilterInf);
  lFilter.Column := IndexCol;
  case OrderColumn of
    ocDesc: lFilter.Order := otDesc;
    ocAsc: lFilter.Order := otAsc;
  end;

  FFilterInf.AddFilter(lFilter);
end;

procedure TOrderColsListView.Clear;
begin
{  FillChar(FIndice, SizeOf(FIndice), -1);
  FillChar(FOrdem, SizeOf(FOrdem), -1);
  FTop := 0;}
  FFilterInf.Clear;
end;

procedure TOrderColsListView.DoSort;
{var
  Aux: Boolean;}
begin
{  FillChar(Indice, SizeOf(Indice), -1);

  Indice[1].Numero := Findice[0];
  Indice[2].Numero := Findice[1];
  Indice[3].Numero := Findice[2];
  Indice[1].Ordem := Byte(FOrdem[0]);
  Indice[2].Ordem := Byte(FOrdem[1]);
  Indice[3].Ordem := Byte(FOrdem[2]);}

  FOwner.FFilterInf.Assign(FFilterInf);
  
  FOwner.RemoveSumLine;
//  FOwner.DoSort;
  FOwner.SortByFilter;
  if FOwner.EnableSum then
     FOwner.AddSumLine;
end;

// ROOSEVELT - FIM - 13.08.2002

constructor TCustomListViewFilter.Create;
begin
  Lista := TStringList.Create;
  ComboFiltro := TComboBox.Create(nil);
  FIndexBySumLine := -1;
  FListView := AListView;
  FGrouped := False;
  FSumLineVar := TSumLineVar.Create;
  FSumAll := True;
  FPadraoAtivo := False;
  FEnableSum := True;
// ROOSEVELT - INICIO - 13.08.2002
  FOrderColsListView := TOrderColsListView.Create(Self);
// ROOSEVELT - FIM - 13.08.2002
  // alteracao salvar filtro
  FFilterInf := TFilterInf.Create;
  FFilterInf.OnGetColumnName := GetColumnName;
end;

destructor TCustomListViewFilter.Destroy;
begin
// ROOSEVELT - INICIO - 13.08.2002
  FOrderColsListView.Free;
// ROOSEVELT - FIM - 13.08.2002
  FSumLineVar.Free;
  FreeAndNil(Lista);
  FreeandNil(ComboFiltro);
  // alteracao salvar filtro
  FFilterInf.Free;
end;

Procedure TCustomListViewFilter.Filter(const AColuna: Integer; const Pai : TWinControl; const LinesCount: Integer);
var
  Item_ListView  : String;
  index, Max: Integer;
  pRect: ^TRect;
begin
  Coluna := AColuna;
  New(pRect);
  try
    ZeroMemory(@pRect^, Sizeof(TRect));
    ListView_GetSubItemRect(FListView.Handle, 1, AColuna, LVIR_BOUNDS, @pRect^);
    if AColuna = 0 then
      pRect^.Right := FListView.Columns[AColuna].Width;
    ComboFiltro.Width := pRect^.Right - pRect^.Left;
    ComboFiltro.Height := pRect^.Bottom - pRect^.Top;
    ComboFiltro.Left := pRect^.Left;
  finally
    Dispose(pRect);
  end;
  ComboFiltro.Parent := Pai;
  ComboFiltro.Show;
  ComboFiltro.Top := 0;
  ComboFiltro.Cursor := crArrow;
  Lista.Clear;
  Lista.Sorted := True;
  ComboFiltro.Items.Clear;
  Max := FListView.Items.Count -1;
  if FIndexBySumLine <> -1 then
    Dec(Max);
  for  index := 0 to Max do
       begin
         if   Coluna = 0 then
              Item_ListView := FListView.Items[index].Caption
         Else
              Item_ListView := FListView.Items[index].SubItems[Coluna -1];
         if   trim(Item_ListView) > '' Then
              Lista.Add(Item_ListView);
       end;
  ComboFiltro.Sorted := False;
  ComboFiltro.Items.Add('todos');
  ComboFiltro.Items.Add('padrão');
  ComboFiltro.Items.Add('agrupar');
  ComboFiltro.Items.AddStrings(Lista);
{  for  index := 0 to Lista.Count -1 do
       ComboFiltro.Items.Add(Lista.Strings[index]);}
  Lista.Clear;
  Lista.Sorted := False;
  ComboFiltro.DroppedDown := True;
  ComboFiltro.OnChange := ComboClick;
  ComboFiltro.OnExit := ComboExit;
  ComboFiltro.SetFocus;
  FLinesCount := LinesCount;
end;

Procedure TCustomListViewFilter.ComboExit(Sender : TObject);
begin
  ComboFiltro.Hide;
  ComboFiltro.Top := -ComboFiltro.Height;
end;

Procedure TCustomListViewFilter.ComboClick(Sender : TObject);
var
  index : Integer;
  Item_ListView : String;
begin
  RemoveSumLine;
  if (ComboFiltro <> nil) and
     (not ComboFiltro.DroppedDown) then
    begin
      FListView.Items.BeginUpdate;
      index := 0;
     if (ComboFiltro.Text <> 'todos') and
        (ComboFiltro.Text <> 'padrão') and
        (ComboFiltro.Text <> 'agrupar') then
     begin
       While (index <= FListView.Items.Count -1) do
       begin
         if Coluna = 0 then
           Item_ListView := FListView.Items[index].Caption
         Else
           Item_ListView := FListView.Items[index].SubItems[Coluna -1];
         if (Item_ListView <> ComboFiltro.Text) then
           FListView.Items.Item[index].Delete
         Else
           Inc(index);
       end;
     end;
      if   (ComboFiltro.Text = 'todos')
      and  Assigned(FCarregaTodosItens) then
      begin
        FCarregaTodosItens(nil);
        FGrouped := False;
      end
      else
           begin
             if   ComboFiltro.Text = 'padrão' then
                  Filtro_Cond
             Else
               if ComboFiltro.Text = 'agrupar' then
                 DoGroupValues(Coluna)
           end;
      FListView.Items.EndUpdate;
      ComboFiltro.Hide;
      ComboFiltro.Top := -ComboFiltro.Height;
      FSumAll := True;
      if (ComboFiltro.Text <> 'padrão') then
      begin
        RemoveSumLine;
        if FEnableSum then
          DoSumColumns(0, FListView.Items.Count -1);
      end;
{ Arnoldo - Início - 07/11/2005 - Tecnologia}
      if  Assigned(TSmartListView(FListView).OnAfterFilter) then
          TSmartListView(FListView).OnAfterFilter(FListView);
{ Arnoldo - Fim - 07/11/2005 - Tecnologia}
    end;
end;


Procedure TCustomListViewFilter.Filtro_Cond;
var
  F: TfrmFilter;
begin
  F := TfrmFilter.Create(FListView);
  try
    F.SetListViewFilter(FListView, Self);
    F.SetListViewSmartTabularView(FSmartTabularView);
    F.Filter := FFilterInf;
    if F.ShowModal = mrOk then
    begin
      FFilterInf.Assign(F.Filter);
      ApplyFilter;
    end;
  finally
    F.Free;
  end;
end;

(*procedure TCustomListViewFilter.DoSort;
var
  Index: Integer;
  Column: TListColumn;
begin
  for index := 3 downto 1 do
    begin
      if Indice[index].Numero > -1 then
        begin
          Indice1 := Indice[index].Numero;
          // a primeira implementacao foi feita da forma contraria a api do listview
          if Indice[index].Ordem = 0 then
            FSmartTabularView.VisualColumns[Indice1].OrderType := otDesc
          else FSmartTabularView.VisualColumns[Indice1].OrderType := otAsc;

          Column := FListView.Column[FSmartTabularView.VisualColumns[Indice1].VisualIndex];
          FListView.CustomSort(@CustomSortProc, Integer(Column));
        end;
    end;
end;*)

procedure TCustomListViewFilter.DoSumColumns(const Start, Last: LongInt);

  procedure SumIntegerValues(const ACol: Integer);
  var
    lTotal: Integer;
    lAux: Integer;
    i: Integer;
  begin
    lTotal := 0;
    for i := Start to Last do
    begin
      if ACol = 0 then
        lAux := Integerof(FListView.Items[i].Caption)
      else
        lAux := Integerof(FListView.Items[i].SubItems[ACol -1]);
      lTotal := lTotal + lAux;
    end;
    AddtoListView(ACol, NumericFmt(SmartTabularView.VisualColumns[ACol].Mask, lTotal));
    FSumLineVar.SetValueInt(ACol, FSumLineVar.GetValueInt(ACol) + lTotal);
  end;

  procedure SumFloatValues(const ACol: Integer);
  var
    lTotal: Double;
    lAux: Double;
    i: Integer;
  begin
    lTotal := 0.0;
    for i := Start to Last do
    begin
      if ACol = 0 then
        lAux := floatof(FListView.Items[i].Caption)
      else
        lAux := floatof(FListView.Items[i].SubItems[ACol -1]);
      lTotal := lTotal + lAux;
    end;
    AddtoListView(ACol, NumericFmt(SmartTabularView.VisualColumns[ACol].Mask, lTotal));
    FSumLineVar.SetValueFloat(ACol, FSumLineVar.GetValueFloat(ACol) + lTotal);
  end;

var
  i: Integer;
begin
  if FSumAll then
  begin
    FSumLineVar.Clear;
    for i := 0 to FListView.Columns.Count -1 do
      FSumLineVar.AddSumVar(FSmartTabularView.VisualColumns[i].SumMode);
    FSumAll := False;
  end;
  for i := 0 to FListView.Columns.Count -1 do
  begin
    try
      case FSmartTabularView.VisualColumns[i].SumMode of
        smNotSum: AddtoListView(I, ''); { nothing }
        smInteger: SumIntegerValues(i);
        smFloat: SumFloatValues(i);
      end;
    except
      AddtoListView(I, 'Erro'); 
    end;
  end;
end;

procedure TCustomListViewFilter.AddSumLine;
begin
{Mike 30.03.05 - Início - Não mostrar mais o wait quando faz a totalização}
  //ShowWait(aviFindFile, STR_SumValues);
{Mike 30.03.05 - Fim - Não mostrar mais o wait quando faz a totalização}
  try
    FSumAll := True;
    RemoveSumLine;
    DoSumColumns(0, FListView.Items.Count -1);
  finally
{Mike 30.03.05 - Início - Não mostrar mais o wait quando faz a totalização}
    //HideWait;
{Mike 30.03.05 - Fim - Não mostrar mais o wait quando faz a totalização}
  end;
end;

procedure TCustomListViewFilter.RemoveSumLine;
begin
  if FIndexBySumLine <> -1 then
    if FIndexBySumLine < FListView.Items.Count then
      FListView.Items.Delete(FIndexBySumLine);
  FIndexBySumLine := -1;
end;

procedure TCustomListViewFilter.AddtoListView(const ACol: Integer; const Value: String);
var
  i: Integer;
begin
  if FStrings = nil then
  begin
    if FIndexBySumLine = -1 then
      FIndexBySumLine := FListView.Items.Add.Index;
    case ACol of
      0: FListView.Items[FIndexBySumLine].Caption := Value;
    else
      for i := FListView.Items[FIndexBySumLine].SubItems.Count to ACol -1 do
        FListView.Items[FIndexBySumLine].SubItems.Add('');
      FListView.Items[FIndexBySumLine].SubItems[ACol -1] := Value;
    end;
    if  TTabularViewColumn(FListView.Columns[ACol].Tag).LarguraFixa then
        Begin
          FListView.Columns[ACol].Width := TTabularViewColumn(FListView.Columns[ACol].Tag).SaveWidth;
          TTabularViewColumn(FListView.Columns[ACol].Tag).Width := TTabularViewColumn(FListView.Columns[ACol].Tag).SaveWidth;
        end
    else
    if FListView.StringWidth(Value) + 15 > FListView.Columns[ACol].Width then
    begin
      FListView.Columns[ACol].Width := FListView.StringWidth(Value) + 15;
      TTabularViewColumn(FListView.Columns[ACol].Tag).Width := FListView.Columns[ACol].Width;
    end;
    FListView.Items[FIndexBySumLine].ImageIndex := -1;
    FListView.Items[FIndexBySumLine].Data := Pointer(FIndexBySumLine);
  end
  else
  begin
    for i := ACol to FStrings.Count do
      FStrings.Add('');
    FStrings[ACol] := Value;
  end;
end;

procedure TCustomListViewFilter.DoGroupValues(const AColumn: Integer);
var
  lSumLineVar: TSumLineVar;

  procedure AddCol;
  var
    i: Integer;
  begin
    lSumLineVar.Clear;
    for i := 0 to FListView.Columns.Count -1 do
      lSumLineVar.AddSumVar(FSmartTabularView.VisualColumns[i].SumMode);
  end;

  procedure DoSumBandValues(const ini, fim: Integer);
  
    procedure SumIntegerValues(const ACol: Integer);
    var
      lTotal: Integer;
      lAux: Integer;
      i: Integer;
      Max: Integer;
    begin
      lTotal := 0;
      Max := fim;
      for i := ini to Max do
      begin
        if ACol = 0 then
          lAux := Integerof(FListView.Items[i].Caption)
        else
          lAux := Integerof(FListView.Items[i].SubItems[ACol -1]);
        lTotal := lTotal + lAux;
      end;
      lSumLineVar.ValueInt[ACol] := lTotal;
    end;

    procedure SumFloatValues(const ACol: Integer);
    var
      lTotal: Double;
      lAux: Double;
      i: Integer;
      Max: Integer;
    begin
      lTotal := 0.0;
      Max := fim;
      for i := ini to Max do
      begin
        if ACol = 0 then
          lAux := floatof(FListView.Items[i].Caption)
        else
          lAux := floatof(FListView.Items[i].SubItems[ACol -1]);
        lTotal := lTotal + lAux;
      end;
      lSumLineVar.ValueFloat[ACol] := lTotal;
    end;

  var
    i: Integer;
  begin
    { Somar os Valores }
    for i := 0 to FListView.Columns.Count -1 do
    begin
      case FSmartTabularView.VisualColumns[i].SumMode of
        smInteger: SumIntegerValues(i);
        smFloat: SumFloatValues(i);
      end;
    end;
  end;

  function Positionof(const ACol: Integer; const Value: String): Integer;
  var
    i: Integer;
    lAux: String;
  begin
    Result := -1;
    i := 0;
    while i < FListView.Items.Count do
    begin
      if ACol = 0 then
        lAux := FListView.Items[i].Caption
      else
        lAux := FListView.Items[i].SubItems[ACol -1];
      if (CompareText(lAux, Value) = 0) then
      begin
        Result := i;
        i := FListView.Items.Count;
      end;
      inc(i);
    end;
  end;

  function Lastof(const ACol, Aini: Integer; const Value: String): Integer;
  var
    i: Integer;
    lAux: String;
  begin
    Result := -1;
    i := AIni;
    while i < FListView.Items.Count do
    begin
      if ACol = 0 then
        lAux := FListView.Items[i].Caption
      else
        lAux := FListView.Items[i].SubItems[ACol -1];
      if (CompareText(lAux, Value) <> 0) then
      begin
        Result := i -1;
        i := FListView.Items.Count;
      end;
      inc(i);
    end;
    if  (Result = -1)
    and (i = FListView.Items.Count) then
      Result := FListView.Items.Count -1;
  end;

  procedure RemoveValueofList(const ini, fim: Integer);
  var
    i: Integer;
  begin
    for i := ini to fim do
      FListView.Items.Delete(ini);
  end;               

  procedure WriteinColumn(const ACol, ARow: Integer; const Value: String);
  begin
    if ACol = 0 then
      FListView.Items[ARow].Caption := Value
    else
      FListView.Items[ARow].SubItems[ACol -1] := Value;
  end;

var
  i, j,
  ini, fim: Integer;
  Column: TListColumn;
begin
  lSumLineVar := TSumLineVar.Create;
  ShowWait(STR_Group);
  try
    EnumDifValues(AColumn);
    Indice1 := AColumn;
    Column := FListView.Column[AColumn];
    FListView.CustomSort(@CustomSortProc, Integer(Column));
    for i := 0 to Lista.Count -1 do
    begin
      ini := Positionof(AColumn, Lista[i]);
      fim := Lastof(AColumn, ini, Lista[i]);;
      AddCol;
      DoSumBandValues(ini, fim);
      RemoveValueofList(ini + 1, fim);
      for j := 0 to FListView.Columns.Count -1 do
        case TTabularViewColumn(FListView.Columns[j].Tag).SumMode of
          smInteger: WriteinColumn(j, ini, NumericFmt(TTabularViewColumn(FListView.Columns[j].Tag).Mask, lSumLineVar.ValueInt[j]));
          smFloat: WriteinColumn(j, ini, NumericFmt(TTabularViewColumn(FListView.Columns[j].Tag).Mask, lSumLineVar.ValueFloat[j]));
        end;
    end;
  finally
    HideWait;
    lSumLineVar.Free;
    FGrouped := True;
  end;
end;

procedure TCustomListViewFilter.EnumDifValues(const AColumn: Integer);
var
  i, Max: Integer;
  lTmp: String;
begin
  Lista.Clear;
  Lista.Sorted := True;
  Max := FListView.Items.Count -1;
  if FIndexBySumLine <> -1 then
    Dec(Max);
  for  i := 0 to Max do
       begin
         if   Coluna = 0 then
              lTmp := FListView.Items[i].Caption
         Else
              lTmp := FListView.Items[i].SubItems[Coluna -1];
         if   trim(lTmp) > '' Then
              Lista.Add(lTmp);
       end;
end;

{ TSumLineVar }

procedure TSumLineVar.AddSumVar(const SumMode: TSumMode);
var
  P: Pointer;
begin
  P := nil;
  FTypes.Add(Pointer(SumMode));
  case SumMode of
    smNotSum: begin
                GetMem(P, Sizeof(Byte));
                Byte(P^) := 0;
              end;
    smInteger: begin
                 GetMem(P, Sizeof(Longint));
                 LongInt(P^) := 0;
               end;
    smFloat: begin
               GetMem(P, Sizeof(Double));
               Double(P^) := 0;
             end;
  end;
  FList.Add(P);
end;

procedure TSumLineVar.CheckTypeCol(const ACol: Integer; const SumMode: TSumMode);
begin
  if (ACol > FTypes.Count)
  or (TSumMode(FTypes[ACol]) <> SumMode) then
    raise Exception.Create('Invalid Type');
end;

procedure TSumLineVar.Clear;
begin
  FreeVariables;
end;

constructor TSumLineVar.Create;
begin
  inherited Create;
  FList := TList.Create;
  FTypes := TList.Create;
end;

destructor TSumLineVar.Destroy;
begin
  FreeVariables;
  FList.Free;
  FTypes.Free;
  inherited Destroy;
end;

procedure TSumLineVar.FreeVariables;
var
  i: Integer;
begin
  try
    for i := 0 to FList.Count -1 do
      FreeMem(FList[i]);
  finally
    FList.Clear;
    FTypes.Clear;
  end;
end;

function TSumLineVar.GetValueFloat(const ACol: Integer): Double;
begin
  CheckTypeCol(ACol, smFloat);
  Result := Double(FList[ACol]^);
end;

function TSumLineVar.GetValueInt(const ACol: Integer): Integer;
begin
  CheckTypeCol(ACol, smInteger);
  Result := LongInt(FList[ACol]^);
end;

procedure TSumLineVar.SetValueFloat(const ACol: Integer; const Value: Double);
begin
  CheckTypeCol(ACol, smFloat);
  Double(FList[ACol]^) := Value;
end;

procedure TSumLineVar.SetValueInt(const ACol, Value: Integer);
begin
  CheckTypeCol(ACol, smInteger);
  LongInt(FList[ACol]^) := Value;
end;

function TCustomListViewFilter.GetFilterActive: Boolean;
begin
  Result := ComboFiltro.Showing;
end;

procedure TCustomListViewFilter.SetFocus;
begin
  ComboFiltro.SetFocus;
end;

procedure TCustomListViewFilter.ApplyFilter;

  function CompareItem(const AItem1, AItem2: String; const AColumnType: TColumnType): Integer;
  const
    lDate1: TDateTime = 0;
    lDate2: TDateTime = 0;

  begin
    case AColumnType of
      ctString: Result := CompareText(AItem1, AItem2);
      ctInteger: Result := Integerof(AItem1) - Integerof(AItem2);
      ctFloat: begin
                 if floatof(AItem1) < floatof(AItem2) then
                   Result := -1
                 else
                 if floatof(AItem1) = floatof(AItem2) then
                    Result := 0
                 else Result := 1;
               end;
      ctDate:
      begin
        try
          lDate1 := Strtodatetime(AItem1); // ordenar por data vazia, considerar zero
        except
          lDate1 := 0;
        end;
        try
          lDate2 := Strtodatetime(AItem2); // ordenar por data vazia, considerar zero
        except
          lDate2 := 0;
        end;
        try
          Result := Trunc(lDate1 - lDate2);
        except
          Result := 0;
        end;
      end;
    else
      Result := 0;
    end;
  end;

  function Evaluate(const AIndex: Longint): Boolean;
  var
    lValid: Boolean;
    iFilter: Longint;
    lFilterInformation: TFilterInformation;
    lItemText: String;

    function TestItem: Boolean;
    begin
      case lFilterInformation.Operand of
        opEqual:
          Result := CompareItem(lItemText, lFilterInformation.Value, FSmartTabularView.AdjustColumns[lFilterInformation.Column].ColumnType) = 0;
        opLess:
          Result := CompareItem(lItemText, lFilterInformation.Value, FSmartTabularView.AdjustColumns[lFilterInformation.Column].ColumnType) < 0;
        opGreater:
          Result := CompareItem(lItemText, lFilterInformation.Value, FSmartTabularView.AdjustColumns[lFilterInformation.Column].ColumnType) > 0;
        opLessEqual:
          Result := CompareItem(lItemText, lFilterInformation.Value, FSmartTabularView.AdjustColumns[lFilterInformation.Column].ColumnType) <= 0;
        opGreaterEqual:
          Result := CompareItem(lItemText, lFilterInformation.Value, FSmartTabularView.AdjustColumns[lFilterInformation.Column].ColumnType) >= 0;
        opDifferent:
          Result := CompareItem(lItemText, lFilterInformation.Value, FSmartTabularView.AdjustColumns[lFilterInformation.Column].ColumnType) <> 0;
        opStartWith:
          Result := (Copy(lItemText, 1, Length(lFilterInformation.Value)) = Uppercase(lFilterInformation.Value));
        opFound:
          Result := Pos(Uppercase(lFilterInformation.Value), lItemText) > 0;
      else
        Result := False;
      end;
    end;

  begin
    if FFilterInf.FilterCount > 0 then
      lValid := FFilterInf.Filter[0].Condition = cAnd
    else lValid := False;
    for iFilter := 0 to FFilterInf.FilterCount -1 do
    begin
      lFilterInformation := FFilterInf.Filter[iFilter];
      if FSmartTabularView.AdjustColumns[lFilterInformation.Column].VisualIndex = 0 then
        lItemText := Trim(Uppercase(FListView.Items[AIndex].Caption))
      else lItemText := Trim(Uppercase(FListView.Items[AIndex].SubItems[FSmartTabularView.AdjustColumns[lFilterInformation.Column].VisualIndex -1]));
      case lFilterInformation.Condition of
        cAnd: lValid := lValid and TestItem;
        cOr: lValid := lValid or TestItem;
      end;
    end;
    Result := lValid;
  end;

  procedure SumByLevel;

    procedure AddTotalSumLine;
    var
      iColumn: Longint;
    begin
      for iColumn := 0 to FListView.Columns.Count -1 do
      begin
        case TTabularViewColumn(FListView.Columns[iColumn].Tag).SumMode of
          smNotSum: AddtoListView(iColumn, '');
          smInteger: AddtoListView(iColumn, NumericFmt(TTabularViewColumn(FListView.Columns[iColumn].Tag).Mask, FSumLineVar.GetValueInt(iColumn)));
          smFloat: AddtoListView(iColumn, NumericFmt(TTabularViewColumn(FListView.Columns[iColumn].Tag).Mask, FSumLineVar.GetValueFloat(iColumn)));
        end;
      end;
      FListView.Items[FIndexBySumLine].Caption := ' Total Geral';
      FIndexBySumLine := -1;
    end;

  var
    iFilter: Longint;
    iColumnVisual: Longint;
    lStart, lEnd: Longint;
    lTextIni: String;
    lText: String;
    lColumnType: TColumnType;
    lList: TStringList;
    lItem: TFilterLineInfo;


    procedure AddBreak;
    begin
      // somente inserir as linhas dos totais no final
      // criar uma estrutura para esta funcionalidade
      lItem := TFilterLineInfo.Create;
      lItem.Line := lEnd;
      lItem.Argument := ' Total-';
      if iColumnVisual = 0 then
         lItem.Argument := lItem.Argument + FListView.Items.Item[lStart].Caption
      else lItem.Argument := lItem.Argument + FListView.Items.Item[lStart].SubItems[iColumnVisual -1];
      FStrings := lItem.SubItens;
      try
//      FIndexBySumLine := FListView.Items.Insert(lEnd).Index;
        DoSumColumns(lStart, lEnd -1);
//      FListView.Items[FIndexBySumLine].Caption := ' Total-' + lTextIni;
//        lStart := lEnd + 1;
        lStart := lEnd; // nao tem mais as linhas de somatorio das outras colunas
//      FIndexBySumLine := -1;
      finally
        lList.AddObject(Format('%.10d', [lItem.Line]), lItem);
        FStrings := nil;
      end;
    end;

    procedure AddSubSumLines;
    var
      iLine: Longint;
      iCol: Longint;
    begin
      FStrings := nil;
      for iLine := lList.Count -1 downto 0 do
      begin
        lItem := TFilterLineInfo(lList.Objects[iLine]);
        FIndexBySumLine := FListView.Items.Insert(lItem.Line).Index;
        for iCol := 0 to lItem.SubItens.Count -1 do
          AddtoListView(iCol, lItem.SubItens[iCol]);
        FListView.Items[FIndexBySumLine].Caption := lItem.Argument;
      end;
    end;

  begin
    lList := TStringList.Create;
    try
      lList.Duplicates := dupAccept;
      lList.Clear;
      
      for iFilter := FFilterInf.FilterCount -1 downto 0 do
      begin
        FSumAll := True; // manter o somatorio de todos os itens
        // somar todas as quebras desta condicao do filtro a adicionar uma linha de total
        lStart := 0;
        lEnd := 0;
        iColumnVisual := FSmartTabularView.AdjustColumns[FFilterInf.Filter[iFilter].Column].VisualIndex;
        lColumnType := FSmartTabularView.AdjustColumns[FFilterInf.Filter[iFilter].Column].ColumnType;
        while lEnd < FListView.Items.Count do
        begin
          if iColumnVisual = 0 then
            lTextIni := FListView.Items.Item[lStart].Caption
          else lTextIni := FListView.Items.Item[lStart].SubItems[iColumnVisual -1];
          if iColumnVisual = 0 then
            lText := FListView.Items.Item[lEnd].Caption
          else lText := FListView.Items.Item[lEnd].SubItems[iColumnVisual -1];
          // aqui
          if CompareItem(lTextIni, lText, lColumnType) <> 0 then
            AddBreak;
          Inc(lEnd);
        end;
        // adicionar a quebra da ultima coluna
        AddBreak;
      end;

      // adicionar as linhas de total
      lList.Sort;
      AddSubSumLines;
      
      // adicionar uma linha com o total geral
      FIndexBySumLine := FListView.Items.Add.Index;
      AddTotalSumLine;

      // setar status de agrupado e filtro ativo
      FGrouped := True;
      FPadraoAtivo := True;
    finally
      ClearObjectStringList(lList);
      lList.Free;
    end;
  end;

var
  index: Longint;
  lOldChange: TLVChangeEvent;
begin
  lOldChange := FListView.OnChange;
  FListView.OnChange := nil;
  RemoveSumLine; // estar e validar
  ShowWait('Aguarde, Concluíndo Filtro Padrão!');
  try
    FListView.Items.BeginUpdate;
    // filtrar as colunas pelos filtros
    try
      index := 0;
      While index < FListView.Items.Count do
      begin
        if Evaluate(index) then // se o item é valido nao excluir
          Inc(index)
        else FListView.Items.Delete(index);
      end;

      // fazer a ordenacao das colunas
      SortByFilter;

      // definir se houve agrupamento de valores
      FGrouped := FListView.Items.Count <> FLinesCount;

      // fazer somatorio por niveis
      if FFilterInf.SumValues then
        SumByLevel;
    finally
      FListView.Items.EndUpdate;
    end;
  finally
    HideWait;
    FListView.OnChange := lOldChange;
  end;
end;

procedure TCustomListViewFilter.SortByFilter;
var
  iFilter: Integer;
  Column: TListColumn;
  lName: String;
begin
  for iFilter := FFilterInf.FilterCount -1 downto 0 do
  begin
    Indice1 := FSmartTabularView.AdjustColumns[FFilterInf.Filter[iFilter].Column].VisualIndex;
    if Indice1 = -1 then
    begin
      GetColumnName(FFilterInf.Filter[iFilter].Column, lName);
      raise ESmartListView.CreateFmt(STR_COLUMNNEEDVISIBLE, [lName]);
    end;
    FSmartTabularView.AdjustColumns[FFilterInf.Filter[iFilter].Column].OrderType := FFilterInf.Filter[iFilter].Order;
    Column := FListView.Column[Indice1];
    FListView.CustomSort(@CustomSortProc, Integer(Column));
  end;
end;

{ TFilterLineInfo }

constructor TFilterLineInfo.Create;
begin
  inherited Create;
  FSubItens := TStringList.Create;
end;

destructor TFilterLineInfo.Destroy;
begin
  FSubItens.Free;
  inherited Destroy;
end;

function TFilterLineInfo.GetSubItens: TStrings;
begin
  Result := FSubItens;
end;

procedure TCustomListViewFilter.GetColumnName(const AColumn: Integer;
  var AColumnName: String);
begin
  if AColumn < FSmartTabularView.ColumnsCount then
    AColumnName := FSmartTabularView.AdjustColumns[AColumn].Caption
  else AColumnName := 'Coluna ' + InttoStr(AColumn);
end;

function TCustomListViewFilter.GetRealColumnIndex(
  const AVisualIndex: Integer): Longint;
begin
  Result := FSmartTabularView.VisualColumns[AVisualIndex].Index;
end;

destructor TOrderColsListView.DEstroy;
begin
  FFilterInf.Free;
  inherited Destroy;
end;
{ Gueda I - 10.10.2006 - Renaux - Agrupar os valores de uma coluna automaticamente }
procedure TCustomListViewFilter.AgrupaColuna(const AColumn: Integer);
begin
  Coluna:= AColumn;
  RemoveSumLine;
  DoGroupValues(AColumn);
end;
{ Gueda F - 10.10.2006 - Renaux - Agrupar os valores de uma coluna automaticamente }
end.
