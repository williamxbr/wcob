unit SBLstV3u;

interface

uses Classes, SBLstV0u, ComCtrls, Math;

type
  TReportInf = packed record
    ReportName: String;
    FileReport: String;
    RegName: String;
  end;

// alteracao para salvar o filtro
  TCondition = (cAnd, cOr);
  TOperand = (opEqual, opLess, opGreater, opLessEqual, opGreaterEqual, opDifferent, opStartWith, opFound);
  { operadores logicos normais,
    mais os operadores:
    * opStartWith - procurar se o valor existe no inicio da palavra
    * opFound - procurar se o valor for encontrado no palavra
  }

  TOnGetColumnNameEvent = procedure(const AColumn: Longint; var AColumnName: String) of object;

  TFilterInf = class;
  
  TFilterInformation = class
  private
    FColumn: Longint; // indice interno da coluna
    FOrder: TOrderType; // ordem de ordenacao da coluna
    FValue: String; // valor utilizado no Filtro
    FCondition: TCondition; // condição do filtro obrigatorio ou nao
    FOperand: TOperand;
    FOwner: TFilterInf;
  public
    constructor Create(AOwner: TFilterInf); virtual;
    function ToString: String;
    procedure Assign(const AFilterInf: TFilterInformation);
    property Column: Longint read FColumn write FColumn;
    property Order: TOrderType read FOrder write FOrder;
    property Value: String read FValue write FValue;
    property Condition: TCondition read FCondition write FCondition;
    property Operand: TOperand read FOperand write FOperand;
  end;

  TFilterInf = class
  private
    FList: TList;
    FSumValues: Boolean;
    FOnGetColumnName: TOnGetColumnNameEvent;
    FCancel: Boolean;
    function GetFilter(const iFilter: Integer): TFilterInformation;
    function GetFilterCount: Longint;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Clear;
    procedure AddFilter(const AFilter: TFilterInformation);
    procedure Assign(const AFilter: TFilterInf);
    function ToString: String;
    function GetColumnName(const AColumn: Longint): String; 
    property SumValues: Boolean read FSumValues write FSumValues;
    property Filter[const iFilter: Longint]: TFilterInformation read GetFilter;
    property FilterCount: Longint read GetFilterCount;
    property OnGetColumnName: TOnGetColumnNameEvent read FOnGetColumnName write FOnGetColumnName;
    property Cancel: Boolean read FCancel write FCancel;
  end;

const
  STR_Operand: array[TOperand] of String = ('=','<','>','<=','>=','<>','Inicia','«');
  STR_CONDITION: array[TCondition] of String = ('E', 'OU');

procedure EnumReportConfig(const FileName: String; const AList: TStrings);
procedure SaveReport(const AFileName: String; const AReportInf: TReportInf; const AFilter: TFilterInf);
procedure LoadReport(const AFileName: String; var AReportInf: TReportInf; const AFilter: TFilterInf);
function CustomSortProc(Item1, Item2: TListItem; Column: TListColumn): integer; stdcall;
procedure EraseReportConfig(const FileName: String; const AReportInf: TReportInf);

implementation

uses IniFiles, GenFunc, SysUtils, Windows;

const
  ID_REPORTNAME = 'ReportName';
  ID_REPORTFILE = 'ReportFile';
  ID_REGNAME = 'RegName';
  ID_FILTERCOUNT = 'FilterCount';
  ID_FILTERCOLUMN = 'FilterColumn';
  ID_FILTERORDER = 'FilterOrder';
  ID_FILTERVALUE = 'FilterValue';
  ID_FILTERCONDITION = 'FilterCondition';
  ID_FILTEROPERAND = 'FilterOperand';

procedure EnumReportConfig(const FileName: String; const AList: TStrings);
var
  IniFile: TMemIniFile;
  SL: TStringList;
  i: Integer;
  S: String;
begin
  SL := TStringList.Create;
  try
    IniFile := TMemIniFile.Create(FileName);
    try
      IniFile.ReadSections(SL);
      for i := 0 to SL.Count -1 do
      begin
        S := IniFile.ReadString(SL[i], ID_REPORTNAME, '');
        AList.Add(S);
      end;
    finally
      IniFile.Free;
    end;
  finally
    SL.Free;
  end;
end;

procedure EraseReportConfig(const FileName: String; const AReportInf: TReportInf);
var
  IniFile: TMemIniFile;
begin
  IniFile := TMemIniFile.Create(FileName);
  try
    IniFile.EraseSection(ReportNametoReportSection(AReportInf.ReportName));
    IniFile.UpdateFile;
  finally
    IniFile.Free;
  end;
end;

procedure SaveReport(const AFileName: String; const AReportInf: TReportInf; const AFilter: TFilterInf);
var
  lIniFile: TMemIniFile;
  lSection: String;
  iFilter: Longint;
begin
  lIniFile := TMemIniFile.Create(AFileName);
  try
    lSection := ReportNametoReportSection(AReportInf.ReportName);
    lIniFile.EraseSection(lSection);

    lIniFile.WriteString(lSection, ID_REPORTNAME, AReportInf.ReportName);
    lIniFile.WriteString(lSection, ID_REPORTFILE, AReportInf.FileReport);
    lIniFile.WriteString(lSection, ID_REGNAME, AReportInf.RegName);
    lIniFile.WriteInteger(lSection, ID_FILTERCOUNT, AFilter.FilterCount);
    for iFilter := 0 to AFilter.FilterCount -1 do
    begin
      lIniFile.WriteInteger(lSection, ID_FILTERCOLUMN + InttoStr(iFilter), AFilter.Filter[iFilter].Column);
      lIniFile.WriteInteger(lSection, ID_FILTERORDER + InttoStr(iFilter), Integer(AFilter.Filter[iFilter].Order));
      lIniFile.WriteString(lSection, ID_FILTERVALUE + InttoStr(iFilter), AFilter.Filter[iFilter].Value);
      lIniFile.WriteInteger(lSection, ID_FILTERCONDITION + InttoStr(iFilter), Integer(AFilter.Filter[iFilter].Condition));
      lIniFile.WriteInteger(lSection, ID_FILTEROPERAND + InttoStr(iFilter), Integer(AFilter.Filter[iFilter].Operand));
    end;
    lIniFile.UpdateFile;
  finally
    lIniFile.Free;
  end;
end;

procedure LoadReport(const AFileName: String; var AReportInf: TReportInf; const AFilter: TFilterInf);
var
  lIniFile: TMemIniFile;
  lSection: String;
  iFilter: Longint;
  lFilterCount: Longint;
  lFilterInf: TFilterInformation;
begin
  AFilter.Clear;
  lIniFile := TMemIniFile.Create(AFileName);
  try
    lSection := ReportNametoReportSection(AReportInf.ReportName);
    AReportInf.ReportName := lIniFile.ReadString(lSection, ID_REPORTNAME, '');
    AReportInf.FileReport := lIniFile.ReadString(lSection, ID_REPORTFILE, '');
    AReportInf.RegName := lIniFile.ReadString(lSection, ID_REGNAME, '');
    lFilterCount := lIniFile.ReadInteger(lSection, ID_FILTERCOUNT, 0);
    for iFilter := 0 to lFilterCount -1 do
    begin
      lFilterInf := TFilterInformation.Create(AFilter);
      lFilterInf.Column := lIniFile.ReadInteger(lSection, ID_FILTERCOLUMN + InttoStr(iFilter), 0);
      lFilterInf.Order := TOrderType(lIniFile.ReadInteger(lSection, ID_FILTERORDER + InttoStr(iFilter), 0));
      lFilterInf.Value := lIniFile.ReadString(lSection, ID_FILTERVALUE + InttoStr(iFilter), '');
      lFilterInf.Condition := TCondition(lIniFile.ReadInteger(lSection, ID_FILTERCONDITION + InttoStr(iFilter), 0));
      lFilterInf.Operand := TOperand(lIniFile.ReadInteger(lSection, ID_FILTEROPERAND + InttoStr(iFilter), 0));

      AFilter.AddFilter(lFilterInf);
    end;
  finally
    lIniFile.Free;
  end;
end;

// funcao para ordenacao dos valores
function CustomSortProc(Item1, Item2: TListItem; Column: TListColumn): integer; stdcall;

  function IsDate(S: String): Boolean;
  begin
    try
      if   pos('/',s) > 0 then
           begin
             StrToDate(S);
             Result:=True;
           end
      else
           Result:=False;
    except
      Result:=False;
    end;
  end;

  function IsDateTime(S: String): Boolean;
  begin
    try
      if   pos('/',s) > 0 then
           begin
             StrToDateTime(S);
             Result:=True;
           end
      else
           Result:=False;
    except
      Result:=False;
    end;
  end;

const
  lDate1: TDateTime = 0;
  lDate2: TDateTime = 0;
  
var S1, S2: String;
begin
  // Pega as respectivas string
  if   Column.Index = 0 then
       begin
         S1:=Item1.Caption;
         S2:=Item2.Caption;
       end
  else
       begin
         S1:=Item1.SubItems[Column.Index - 1];
         S2:=Item2.SubItems[Column.Index - 1];
       end;
  // Faz a comparação
  if   IsDate(S1) and (TTabularViewColumn(Column.Tag).ColumnType <> ctDate) then
       Result := DelphiDateTimeToSGTDate(StrToDate(S1)) - DelphiDateTimeToSGTDate(StrToDate(S2))
  else
  case TTabularViewColumn(Column.Tag).ColumnType of
    ctString: Result := lstrcmp(PChar(S1), PChar(S2));
    ctInteger: Result := Integerof(S1) - Integerof(S2);
    ctFloat: begin
               if floatof(S1) < floatof(S2) then
                 Result := -1
               else
               if floatof(S1) = floatof(S2) then
                  Result := 0
               else Result := 1;
             end;
    ctDate:
      begin
        try
          lDate1 := Strtodatetime(S1); // ordenar por data vazia, considerar zero
        except
          lDate1 := 0;
        end;
        try
          lDate2 := Strtodatetime(S2); // ordenar por data vazia, considerar zero
        except
          lDate2 := 0;
        end;
        try
          Result := CompareValue(lDate1, lDate2);
          // ignorando os decimais nao ordena por hora
//          Result := Trunc(lDate1 - lDate2));
        except
          Result := 0;
        end;
      end;
  else
    Result := 0;
  end;
  // Verifica se é ascendente ou descendente
  if   TTabularViewColumn(Column.Tag).OrderType = otDesc then
       Result:=-Result;
end;

{ TFilterInf }

procedure TFilterInf.AddFilter(const AFilter: TFilterInformation);
begin
  FList.Add(AFilter);
end;

procedure TFilterInf.Assign(const AFilter: TFilterInf);
var
  iFilter: Longint;
  lFilter: TFilterInformation;
begin
  Clear;
  FSumValues := AFilter.SumValues;
  for iFilter := 0 to AFilter.FilterCount -1 do
  begin
    lFilter := TFilterInformation.Create(AFilter);
    lFilter.Assign(AFilter.Filter[iFilter]);

    AddFilter(lFilter);
  end;
end;

procedure TFilterInf.Clear;
begin
  ClearObjectList(FList);
end;

constructor TFilterInf.Create;
begin
  inherited Create;
  FList := TList.Create;
  FCancel := False;
end;

destructor TFilterInf.Destroy;
begin
  ClearObjectList(FList);
  FList.Free;
  inherited Destroy;
end;

function TFilterInf.GetColumnName(const AColumn: Integer): String;
var
  lColumnName: String;
begin
  if Assigned(FOnGetColumnName) then
    FOnGetColumnName(AColumn, lColumnName)
  else lColumnName := 'Coluna ' + InttoStr(AColumn);
  Result := lColumnName;
end;

function TFilterInf.GetFilter(const iFilter: Integer): TFilterInformation;
begin
  Result := TFilterInformation(FList[iFilter]);
end;

function TFilterInf.GetFilterCount: Longint;
begin
  Result := FList.Count;
end;

function TFilterInf.ToString: String;
var
  iFilter: Longint;
begin
  Result := '';
  for iFilter := 0 to FilterCount -1 do
    Result := Result + Filter[iFilter].ToString + #13#10;
end;

{ TFilterInformation }

procedure TFilterInformation.Assign(const AFilterInf: TFilterInformation);
begin
  FColumn := AFilterInf.Column;
  FOrder := AFilterInf.Order;
  FValue := AFilterInf.Value;
  FCondition := AFilterInf.Condition;
  FOperand := AFilterInf.Operand;
end;

constructor TFilterInformation.Create(AOwner: TFilterInf);
begin
  inherited Create;
  FOwner := AOwner;
end;

function TFilterInformation.ToString: String;
begin
  Result := FOwner.GetColumnName(FColumn) + STR_Operand[FOperand] + FValue;
end;

end.
