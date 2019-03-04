unit SBLstV0u;

interface

uses Classes, Sysutils, Graphics;

const
  FieldSeparator = #9;

type
  TOrderType = (otAsc, otDesc);
  TSumMode = (smNotSum, smInteger, smFloat);
  TEditMode = (emNone, emInteger, emFloat, emText, emData, emTime, emList);
  TColumnType = (ctString, ctInteger, ctFloat, ctDate);

  TGenericTabularView = class;
  TStringListEx = class;

  TTabularViewColumnEvent = procedure (const PData: Pointer) of Object;
  TOnGetListValuesEvent = procedure (const List: TStrings) of Object;

  TTabularViewColumn = class
  private
    FSumMode: TSumMode;
    FWidth: Integer;
    FSaveWidth: Integer;
    FVisualIndex: Integer;
    FonDblClick: TTabularViewColumnEvent;
    FListColor: TList;
    FEditMode: TEditMode;
    FOnGetListValues: TOnGetListValuesEvent;
    FColumnType: TColumnType;
    FStartCaption: String;
    FIndex: Longint;
    FCanColInvisible : Boolean;
    function GetData(const i: Integer): Pointer;
    function GetColor(const line: Integer): TColor;
    procedure SetColor(const line: Integer; const Value: TColor);
    function GetColorPoint(const line: Integer): PColor;
    procedure FreeListColor;
    procedure SetWidth(const Value: Integer);
  protected
    FOwner: TGenericTabularView;
    FCaption: String;
    FAlignment: TAlignment;
    FOrderType: TOrderType;
    FMask: String;
    FVisible: Boolean;
    FLines: TStringListEx;
    FName: String;
    FLarguraFixa : Boolean;
  public
    constructor Create(Owner: TGenericTabularView);
    destructor Destroy; override;
    procedure DoDblClick(const Line: Integer);
    procedure AddItem(const Value: String; const PData: Pointer);
    procedure Clear;
    property Caption: String read FCaption write FCaption;
    property StartCaption: String read FStartCaption write FStartCaption;
    property Alignment: TAlignment read FAlignment write FAlignment;
    property OrderType: TOrderType read FOrderType write FOrderType;
    property Mask: String read FMask write FMask;
    property Visible: Boolean read FVisible write FVisible;
    property Lines: TStringListEx read FLines;
    property Data[const i: Integer]: Pointer read GetData;
    property SumMode: TSumMode read FSumMode write FSumMode;
    property Width: Integer read FWidth write SetWidth;
    property SaveWidth: Integer read FSaveWidth write FSaveWidth;
    property VisualIndex: Integer read FVisualIndex write FVisualIndex;
    property onDblClick: TTabularViewColumnEvent read FonDblClick write FonDblClick;
    property Name: String read FName write FName;
    property Index: Longint read FIndex write FIndex; // indice de insercao da coluna

    property Color[const line: Integer]: TColor read GetColor write SetColor;

    property EditMode: TEditMode read FEditMode write FEditMode;
    property OnGetListValues: TOnGetListValuesEvent read FOnGetListValues write FOnGetListValues;
    property ColumnType: TColumnType read FColumnType write FColumnType;
    property CanColInvisible : Boolean read FCanColInvisible Write FCanColInvisible;
    property LarguraFixa : Boolean read FLarguraFixa write FLarguraFixa;
  end;

  TGetColumnValueEvent = procedure (const Column: TTabularViewColumn; var Value: String) of object;
  TGetDataEvent = procedure (var Data: Pointer) of object;

  TGenericTabularView = class
  private
    FParameters: TStringList;
    function GetChecked(const ALine: Integer): Boolean;
    procedure SetChecked(const ALine: Integer; const Value: Boolean);
    function GetIconIndex(const ALine: Integer): Longint;
    procedure SetIconIndex(const ALine: Integer; const Value: Longint);
  protected
    FCheckedList: TList;
    FColumnsList,
    FDataList: TList;
    FOriginalColumnList: TList;
    FOnGetColumnValue: TGetColumnValueEvent;
    FOnGetData: TGetDataEvent;
    //***************** Icones ******************************
    FListIcons: TList;
    //*******************************************************
    function GetColumns(Index: Integer): TTabularViewColumn;
    function GetColumnsCount: Integer;
  protected
    procedure InternalExecute; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    function AddColumn(const Caption: String; const Alignment: TAlignment;
                       const OrderType: TOrderType; const Mask: String;
                       const Visible: Boolean; const SumMode: TSumMode;
                       const OnDblClick: TTabularViewColumnEvent;
                       const AColumnType: TColumnType = ctString;
{ Arnoldo - Início - 22/06/2005 - Tecnologia}
                       const pColInvisible : boolean=True): TTabularViewColumn;
{ Arnoldo - Fim - 22/06/2005 - Tecnologia}
    function AddColumnEx(const Name, Caption: String; const Alignment: TAlignment;
                       const OrderType: TOrderType; const Mask: String;
                       const Visible: Boolean; const SumMode: TSumMode;
                       const OnDblClick: TTabularViewColumnEvent;
{ Arnoldo - Início - 22/06/2005 - Tecnologia}
                       const AColumnType: TColumnType = ctString;
                       const pColInvisible : boolean=True): TTabularViewColumn;
{ Arnoldo - Fim - 22/06/2005 - Tecnologia}
    procedure ClearColumns; virtual;
    procedure AddLine;
    procedure ClearLines;
    function LinesCount: Integer;
    function BuscaArgumento(LinhaInicio,LinhaFim : Integer;Colunas : Array of word;Argumentos:array of String;Parte:Boolean):Integer;
    function BuscaColunaArgumento(const Argumento: String): Integer;
    property Columns[Index: Integer]: TTabularViewColumn read GetColumns;
    property ColumnsCount: Integer read GetColumnsCount;
    property OnGetColumnValue: TGetColumnValueEvent read FOnGetColumnValue write FOnGetColumnValue;
    property OnGetData: TGetDataEvent read FOnGetData write FOnGetData;
    property Checked[const ALine: Integer]: Boolean read GetChecked write SetChecked;
    property Parameters: TStringList read FParameters;
    property IconIndex[const ALine: Longint]: Longint read GetIconIndex write SetIconIndex;
  end;

  TStringListEx = class(TStringList)
  private
    FOwner: TGenericTabularView;
  public
    function Add(const S: string): Integer; override;
    procedure SetOwner(const AOwner: TGenericTabularView);
  end;

  EInvalidColumn = class(Exception);
  ESmartListView = class(Exception);

implementation

{ TTabularViewColumn }

procedure TTabularViewColumn.AddItem(const Value: String; const PData: Pointer);
begin
  FLines.AddObject(Value, PData);
end;

procedure TTabularViewColumn.Clear;
begin
  FLines.Clear;
  FreeListColor;
end;

constructor TTabularViewColumn.Create(Owner: TGenericTabularView);
begin
  inherited Create;
  FOwner:=Owner;
  FLines:=TStringListEx.Create;
  FListColor := TList.Create;
  FColumnType := ctString; 
end;

destructor TTabularViewColumn.Destroy;
begin
  FreeListColor;
  FListColor.Free;
  FLines.Free;
  inherited Destroy;
end;

procedure TTabularViewColumn.DoDblClick(const Line: Integer);
begin
  FonDblClick(Data[Line]);
end;

procedure TTabularViewColumn.FreeListColor;
var
  i: Integer;
begin
  try
    for i := 0 to FListColor.Count -1 do
      Dispose(FListColor[i]);
  finally
    FListColor.Clear;
  end;
end;

function TTabularViewColumn.GetColor(const line: Integer): TColor;
begin
  Result := GetColorPoint(line)^;
end;

function TTabularViewColumn.GetColorPoint(const line: Integer): PColor;
var
  i: Integer;
  P: PColor;
begin
  for i := FListColor.Count to line do
  begin
    New(P);
    P^ := clNone;
    FListColor.Add(P);
  end;
  Result := FListColor[line];
end;

function TTabularViewColumn.GetData(const i: Integer): Pointer;
begin
  if i < FLines.Count then
    Result := FLines.Objects[i]
  else
    Result := nil;
end;

procedure TTabularViewColumn.SetColor(const line: Integer;
  const Value: TColor);
begin
  GetColorPoint(line)^ := Value;
end;

procedure TTabularViewColumn.SetWidth(const Value: Integer);
begin
  if FSaveWidth <> 0 then
    FWidth := FSaveWidth
  else FWidth := Value;
end;

{ TGenericTabularView }

function TGenericTabularView.BuscaColunaArgumento(const Argumento: String): Integer;
var
  Achou : Boolean;
begin
  Result := 0;
  Achou := False;
  while not achou
  and  (Result < FOriginalColumnList.Count) do
       begin
         if   Trim(Argumento) = Trim(Columns[result].FCaption) then
              achou := True
         else
              inc(Result);
       end;
  if   not achou then
       Result := -1;
end;

function TGenericTabularView.BuscaArgumento(LinhaInicio,LinhaFim : Integer;Colunas : Array of word;Argumentos : Array of String;Parte:Boolean):Integer;
var
  Qtd,
  ix1,
  ix2,
  ix3 : Integer;
  AchouTodos,
  AchouUm : Boolean;
begin
  if   high(Colunas) = High(Argumentos) then
       begin
         if   LinhaFim > TTabularViewColumn(FColumnsList[Colunas[0]]).Lines.Count - 1 then
              ix3 := TTabularViewColumn(FColumnsList[Colunas[0]]).Lines.Count - 1
         else
              ix3 := LinhaFim;
         ix2 := LinhaInicio;
         AchouTodos := False;
         while (ix2 <= ix3)
         and  (not AchouTodos) do
              begin
//                AchouUm := False;
                ix1 := 0;
                Qtd := 0;
                while (ix1 <= High(Colunas)) do
                     begin
                       if  Parte then
                           AchouUm := Pos(Trim(Argumentos[ix1]),TTabularViewColumn(FColumnsList[Colunas[ix1]]).Lines.Strings[ix2]) > 0
                       else
                           AchouUm := Trim(Argumentos[ix1]) =  Trim(TTabularViewColumn(FColumnsList[Colunas[ix1]]).Lines.Strings[ix2]);
                       if   AchouUm then
                            Inc(Qtd);
                       inc(Ix1);
                     end;
                if   Qtd = high(Colunas) + 1 then
                     AchouTodos := True
                else
                     inc(Ix2)
              end;
         if   AchouTodos Then
              Result := Ix2
         else
              Result := -1;
       end
  else
       Result := -1;
end;

function TGenericTabularView.AddColumn(const Caption: String; const Alignment: TAlignment;
                                       const OrderType: TOrderType; const Mask: String;
                                       const Visible: Boolean; const SumMode: TSumMode;
                                       const OnDblClick: TTabularViewColumnEvent;
{ Arnoldo - Início - 22/06/2005 - Tecnologia}
                                       const AColumnType: TColumnType = ctString;
                                       const pColInvisible : boolean=True): TTabularViewColumn;
{ Arnoldo - Fim - 22/06/2005 - Tecnologia}
begin
  Result:=TTabularViewColumn.Create(Self);
  Result.FCaption:=Caption;
  Result.StartCaption := Caption;
  Result.FAlignment:=Alignment;
  Result.FOrderType:=OrderType;
  Result.FMask:=Mask;
  Result.Visible:=Visible;
  Result.SumMode := SumMode;
  Result.onDblClick := OnDblClick;
//  Result.Name := 'C'+ IntToStr(FOriginalColumnList.Count);
  Result.Name := Trim(Caption);
  Result.ColumnType := AColumnType;
  Result.Index := FColumnsList.Add(Result); // guardar a ordem de insercao da coluna
{ Arnoldo - Início - 22/06/2005 - Tecnologia}
  Result.CanColInvisible := pColInvisible;
{ Arnoldo - Fim - 22/06/2005 - Tecnologia}
  FOriginalColumnList.Add(Result);
  if FOriginalColumnList.Count = 1 then { primeira coluna }
    Result.Lines.SetOwner(Self);
end;

procedure TGenericTabularView.AddLine;
var i: Integer;
    Value: String;
    Data: Pointer;
begin
  for i:=0 to FColumnsList.Count - 1 do
      begin
        Data:=Nil;
        Value:='';
        if   Assigned(FOnGetColumnValue) then
             FOnGetColumnValue(TTabularViewColumn(FColumnsList[i]), Value);
        TTabularViewColumn(FColumnsList[i]).Lines.Add(Value);
      end;
  if   Assigned(FOnGetData) then
       begin
         FOnGetData(Data);
         FDataList.Add(Data);
       end;
end;

procedure TGenericTabularView.ClearColumns;
var i: Integer;
begin
  for i:=0 to FColumnsList.Count - 1 do
      try
        TTabularViewColumn(FColumnsList[i]).Free;
      except
      end;
  FColumnsList.Clear;
  FOriginalColumnList.Clear;
end;

procedure TGenericTabularView.ClearLines;
var i: Integer;
begin
  for i:=0 to FColumnsList.Count - 1 do
      TTabularViewColumn(FColumnsList[i]).Lines.Clear;
  FDataList.Clear;
  FListIcons.Clear;
end;

constructor TGenericTabularView.Create;
begin
  inherited Create;
  FColumnsList:=TList.Create;
  FParameters := TStringList.Create;
  FOriginalColumnList:=TList.Create;
  FDataList:=TList.Create;
  FOnGetColumnValue:=Nil;
  FListIcons := TList.Create;
end;

destructor TGenericTabularView.Destroy;
begin
  ClearColumns;
  FParameters.Free;
  FColumnsList.Free;
  FOriginalColumnList.Free;
  FDataList.Free;
  FListIcons.Free;
  inherited Destroy;
end;

function TGenericTabularView.GetColumns(Index: Integer): TTabularViewColumn;
begin
  Result:=TTabularViewColumn(FColumnsList[Index]);
end;

function TGenericTabularView.GetColumnsCount: Integer;
begin
  Result:=FColumnsList.Count;
end;

procedure TGenericTabularView.InternalExecute;
begin
  // Implementar este método na classe descendente....
end;

function TGenericTabularView.LinesCount: Integer;
begin
  Result:=0;
  if   FColumnsList.Count > 0 then
       Result:=TTabularViewColumn(FOriginalColumnList[0]).Lines.Count;
end;

function TGenericTabularView.AddColumnEx(const Name, Caption: String;
  const Alignment: TAlignment; const OrderType: TOrderType;
  const Mask: String; const Visible: Boolean; const SumMode: TSumMode;
{ Arnoldo - Início - 22/06/2005 - Tecnologia}
  const OnDblClick: TTabularViewColumnEvent;
  const AColumnType: TColumnType = ctString;
  const pColInvisible : boolean=True): TTabularViewColumn;
{ Arnoldo - Fim - 22/06/2005 - Tecnologia}
begin
{ Arnoldo - Início - 22/06/2005 - Tecnologia}
  Result := AddColumn(Caption, Alignment, OrderType, Mask, Visible, SumMode, OnDblClick, AColumnType, pColInvisible);
{ Arnoldo - Fim - 22/06/2005 - Tecnologia}
  if IsValidIdent(Name) then
    Result.Name := Name
  else raise Exception.CreateFmt('Nome da coluna invalido (%s)', [Name]);
end;

function TGenericTabularView.GetChecked(const ALine: Integer): Boolean;
begin
  if ALine < FCheckedList.Count then
    Result := Boolean(FCheckedList[ALine])
  else Result := False;
end;

procedure TGenericTabularView.SetChecked(const ALine: Integer; const Value: Boolean);
var
  i: Integer;
begin
  for i := FCheckedList.Count to ALine do
    FCheckedList.Add(Pointer(False));
  FCheckedList[ALine] := Pointer(Value);
end;

function TGenericTabularView.GetIconIndex(const ALine: Integer): Longint;
begin
  if FListIcons.Count > ALine then
    Result := Longint(FListIcons[ALine])
  else Result := -1;
end;

procedure TGenericTabularView.SetIconIndex(const ALine: Integer; const Value: Longint);
var
  i: Longint;
begin
  for i := FListIcons.Count to ALine do
    FListIcons.Add(Pointer(-1));
  FListIcons[ALine] := Pointer(Value);
end;

{ TStringListEx }

function TStringListEx.Add(const S: string): Integer;
begin
  Result := inherited Add(S);
  if FOwner <> nil then { verificar se esta setando /1 ou /0 para setar a coluna como checada }
  begin
    if (S <> '')
    and (S[1] = '/') then
    begin
      FOwner.Checked[Result] := (S = '/1');
      Strings[Result] := '';
    end;
  end;
end;

procedure TStringListEx.SetOwner(const AOwner: TGenericTabularView);
begin
  FOwner := AOwner;
end;

end.
