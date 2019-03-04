{$IMPORTEDDATA ON}
{ BNF para o avaliador de expressões
  ----------------------------------
  Expressao ::= Termo | + Termo | - Termo
  Termo     ::= Funcao | * Funcao | / Funcao | % Funcao
  Funcao    ::= Fator | Fator ^ NUM
  Fator     ::= ID | Numero | ( Expressao ) | E
  Numero    ::= Sinal NUM Decimal
  Sinal     ::= + | - | E
  Decimal   ::= , NUM | E

  Onde: E - Vazio
        ID - Identificador
        NUM - Número Inteiro
}
unit SBMathEx;

interface

uses Classes, SysUtils, SBList;

type
  TTokenType = (ttId, ttNum, ttSymbol, ttUnknow);

  TGetVariableValue = procedure (Variable: String; var Value: Extended) of object;

  TAnalisadorLexico = class
  protected
    FError,
    FScript: TStringList;
    FLine,
    FCol: Integer;//Cardinal;
    FToken: String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init;
    function GetNextToken: TTokenType; virtual;
    function GetCaracters(Ch: Char): String;
    function EOF: Boolean;
    function CurrentLine: Integer;
    property Token: String read FToken;
    property Script: TStringList read FScript;
    property Error: TStringList read FError;
  end;

  TVariableItem = class(TKeyListItem)
  private
    FVarName: String;
    FValue: Extended;
  protected
    procedure AssignTo(const KeyListItem: TKeyListItem); override;
    function CompareWith(const KeyListItem: TKeyListItem): Integer; override;
  public
    property VarName: String read FVarName write FVarName;
    property Value: Extended read FValue write FValue;
  end;

  TMathExpression = class(TAnalisadorLexico)
  protected
    FTokenType: TTokenType;
    FOnGetVariableValue: TGetVariableValue;
    FVariableList: TKeyList;
    procedure Level2(var Valor: Extended);
    procedure Level3(var Valor: Extended);
    procedure Level4(var Valor: Extended);
    procedure Level5(var Valor: Extended);
    procedure Level6(var Valor: Extended);
    procedure Arith(Op: Char; var Oper1, Oper2: Extended);
    procedure Unary(Op: Char; var Oper1: Extended);
    procedure Primitive(var Oper1: Extended);
    function AddVariable(const VarName: String): Extended;
  public
    constructor Create;
    destructor Destroy; override;
    function GetNextToken: TTokenType; override;
    function Evaluate: Extended;
    property OnGetVariableValue: TGetVariableValue read FOnGetVariableValue write FOnGetVariableValue;
  end;

const
  MaxSymbols = 10;
  ReservedSymbols: array [1..MaxSymbols] of Char = (',','(', ')','+','-','*','/','%','^','.');
  SetOfSymbols: set of Char = [',','(', ')','+','-','*','/','%','^','.'];
  DefaultDelimiter = ' ';
  DescTokenType: array [TTokenType] of String = ('Identificador', 'Numero', 'Símbolo', 'Desconhecido');

implementation

// TAnalisadorLexico
constructor TAnalisadorLexico.Create;
begin
  inherited Create;
  FLine:=0;
  FCol:=1;
  FScript:=TStringList.Create;
  FError:=TStringList.Create;
end;

destructor TAnalisadorLexico.Destroy;
begin
  FScript.Free;
  FError.Free;
  inherited Destroy;
end;

procedure TAnalisadorLexico.Init;
begin
  FLine:=0;
  FCol:=1;
  FToken:='';
  FError.Clear;
end;

function TAnalisadorLexico.GetNextToken: TTokenType;
var Reconhecido, Erro: Boolean;
    TryType: TTokenType;
    CharAnterior: Char;
begin
  Result:=ttUnknow;
  TryType:=ttUnknow;
  Erro:=False;
  try
    CharAnterior:=#0;
    FToken:='';
    Reconhecido:=False;
    while not Reconhecido
    and   (FLine < FScript.Count) do
          begin
            if   FCol > Length(FScript[FLine]) then
                 begin
                   if   (FToken <> '') then
                        Exit;

                   FCol:=1;
                   inc(FLine);
                   while (FLine < FScript.Count)
                   and   (FCol > Length(FScript[FLine])) do
                         inc(FLine);
                   if   (FLine >= FScript.Count) then
                        begin
                          TryType:=ttUnknow;
                          Exit;
                        end;
                 end;

            if   CharAnterior = #0 then
                 case Upcase(FScript[FLine][FCol]) of
                 'A'..'Z', '_': TryType:=ttId;
                 '0'..'9': TryType:=ttNum;
                 end;

            if   Upcase(FScript[FLine][FCol]) in ['A'..'Z', '_', '0'..'9', '[', ']'] then
                 begin
                   if   not Erro
                   and  (Upcase(FScript[FLine][FCol]) in ['A'..'Z', '_', '[', ']'])
                   and  (TryType = ttNum) then
                        begin
                          Erro:=True;
                        end;

                   FToken:=FToken + Upcase(FScript[FLine][FCol]);
                   CharAnterior:=Upcase(FScript[FLine][FCol]);
                 end
            else
                 if   (FScript[FLine][FCol] in SetOfSymbols) then
                      begin
                        Reconhecido:=True;
                        if   (CharAnterior = #0) then
                               begin
                                 TryType:=ttSymbol;
                                 FToken:=FToken + Upcase(FScript[FLine][FCol]);
                                 CharAnterior:=Upcase(FScript[FLine][FCol]);
                               end
                          else
                               dec(FCol);
                      end
                 else
                      begin
                        Reconhecido:=(CharAnterior <> #0) and (Upcase(FScript[FLine][FCol]) = DefaultDelimiter);
                      end;
            inc(FCol);
          end;
  finally
    Result:=TryType;
    if   not Erro then
         FToken:=Trim(FToken)
    else
         begin
           Result:=ttUnknow;
           FError.Add('Erro: Número inválido. ' + FToken + ' -> ' + FScript[FLine]);
         end;
  end;
end;

function TAnalisadorLexico.GetCaracters(Ch: Char): String;
begin
  try
    while (FLine < FScript.Count) do
          begin
            if   FCol > Length(FScript[FLine]) then
                 begin
                   FCol:=1;
                   inc(FLine);
                   while (FLine < FScript.Count)
                   and   (FCol > Length(FScript[FLine])) do
                         inc(FLine);
                   if   (FLine >= FScript.Count) then
                        Exit;
                 end;

            if   (FScript[FLine][FCol] = Ch) then
                 begin
                   Exit;
                 end;
            Result:=Result + FScript[FLine][FCol];
            inc(FCol);
          end;
  finally
  end;
end;

function TAnalisadorLexico.EOF: Boolean;
begin
  if   FScript.Count > 0 then
       begin
         if   (FLine = FScript.Count - 1) then
              Result:=(FCol > Length(FScript[FScript.Count-1]))
         else
              Result:=(FLine >= FScript.Count);
       end
  else
       Result:=True;
end;

function TAnalisadorLexico.CurrentLine: Integer;
begin
  Result:=FLine;
end;

// TVariableItem
procedure TVariableItem.AssignTo(const KeyListItem: TKeyListItem);
begin
  inherited AssignTo(KeyListItem);
  TVariableItem(KeyListItem).FVarName:=FVarName;
  TVariableItem(KeyListItem).FValue:=FValue;
end;

function TVariableItem.CompareWith(const KeyListItem: TKeyListItem): Integer;
begin
  Result:=CompareText(FVarName, TVariableItem(KeyListItem).FVarName);
end;

// TMathExpression
constructor TMathExpression.Create;
begin
  inherited Create;
  FVariableList:=TKeyList.Create(TVariableItem);
end;

destructor TMathExpression.Destroy;
begin
  FVariableList.Free;
  inherited Destroy;
end;

procedure TMathExpression.Level2(var Valor: Extended);
var Aux: Extended;
    Op: Char;
begin
  Level3(Valor);
  while (FTokenType = ttSymbol)
  and   (FToken[1] in ['+','-']) do
        begin
          Op:=FToken[1];
          GetNextToken;
          Level3(Aux);
          Arith(Op, Valor, Aux);
        end
end;

procedure TMathExpression.Level3(var Valor: Extended);
var Aux: Extended;
    Op: Char;
begin
  Level4(Valor);
  while (FTokenType = ttSymbol)
  and   (FToken[1] in ['*', '/', '%']) do
        begin
          Op:=FToken[1];
          GetNextToken;
          Level4(Aux);
          Arith(Op, Valor, Aux);
        end
end;

procedure TMathExpression.Level4(var Valor: Extended);
var Aux: Extended;
    Op: Char;
begin
  Level5(Valor);
  if   (FTokenType = ttSymbol)
  and  (FToken = '^') then
       begin
         Op:=FToken[1];
         GetNextToken;
         Level5(Aux);
         Arith(Op, Valor, Aux);
       end
end;

procedure TMathExpression.Level5(var Valor: Extended);
var Op: Char;
begin
  Op:=#0;
  if   (FTokenType = ttSymbol)
  and  (FToken[1] in ['+', '-']) then
       begin
         Op:=FToken[1];
         GetNextToken;
       end;
  Level6(Valor);
  if   Op <> #0 then
       Unary(Op, Valor);
end;

procedure TMathExpression.Level6(var Valor: Extended);
begin
  if   (FTokenType = ttSymbol)
  and  (FToken = '(') then
       begin
         GetNextToken;
         Level2(Valor);
         if   (FToken <> ')') then
              raise Exception.Create('Você esqueceu de fechar os parênteses.');
         GetNextToken;
       end
  else
       Primitive(Valor);
end;

function TMathExpression.AddVariable(const VarName: String): Extended;
var AuxVar: TVariableItem;
begin
  AuxVar:=TVariableItem.Create;
  AuxVar.FVarName:=VarName;
  FVariableList.Find(AuxVar);
  if   FVariableList.Ok_List then
       begin
         Result:=AuxVar.FValue;
         AuxVar.Free;
       end
  else
       begin
         AuxVar.FValue:=0;
         if   Assigned(FOnGetVariableValue) then
              FOnGetVariableValue(VarName, AuxVar.FValue);
         Result:=AuxVar.FValue;
         FVariableList.Add(AuxVar);
       end
end;

procedure TMathExpression.Primitive(var Oper1: Extended);
var Aux: String;
begin
  if   FTokenType = ttNum then
       begin
         Aux:=FToken;
         GetNextToken;
         if   (FTokenType = ttSymbol)
         and  (FToken = DecimalSeparator) then
              begin
                GetNextToken;
                if   FTokenType = ttNum then
                     begin
                       Oper1:=StrToFloat(Aux + DecimalSeparator + FToken);
                       GetNextToken;
                     end
                else
                     Oper1:=StrToFloat(Aux);
              end
         else
              Oper1:=StrToFloat(Aux);
       end
  else
       if   FTokenType = ttID then
            begin
              Oper1:=AddVariable(FToken);
              GetNextToken;
            end
       else
            raise Exception.Create('Número esperado.');
end;

procedure TMathExpression.Arith(Op: Char; var Oper1, Oper2: Extended);
var Aux: Extended;
    i: Integer;
begin
  case OP of
  '+': Oper1:=Oper1 + Oper2;
  '-': Oper1:=Oper1 - Oper2;
  '*': Oper1:=Oper1 * Oper2;
  '/': if Oper2 <> 0 then
         Oper1:=Oper1 / Oper2
       else Oper1 := 0;	
  '%': Oper1:=Trunc(Oper1) mod Trunc(Oper2);
  '^': begin
         Aux:=Oper1;
         if   Oper2 = 0 then
              Oper1:=1
         else
              for i:=Trunc(Oper2) - 1 downto 1 do
                  Oper1:=Oper1 * Aux;
       end;
  end;
end;

procedure TMathExpression.Unary(Op: Char; var Oper1: Extended);
begin
  if   Op = '-' then
       Oper1:=-Oper1;
end;

function TMathExpression.GetNextToken: TTokenType;
begin
  FTokenType := inherited GetNextToken;
  Result := FTokenType;
end;

function TMathExpression.Evaluate: Extended;
begin
  FVariableList.Clear;
  Result:=0;
  Init;
  GetNextToken;
  Level2(Result);
end;

end.
