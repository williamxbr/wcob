unit uLayMemAcordo;

interface

uses DB, Classes, DBClient, StdCtrls;

Type

 TMemAcordo = class(TClientDataSet)
 private
  procedure CriarCampos;
  function GetCREDOR_CIDADE: string;
  function GetACORDO: Integer;
  function GetCREDOR_CNPJ: string;
  function GetCREDOR_ENDERECO: string;
  function GetPARCELA: Integer;
  function GetCREDOR_NOME: string;
  function GetDEVEDOR_CEP: string;
  function GetDEVEDOR_CIDADE: string;
  function GetDEVEDOR_CODIGO_ALTERNATIVO: string;
  function GetDEVEDOR_CPF: string;
  function GetDEVEDOR_ENDERECO: string;
  function GetDEVEDOR_ESTADO: string;
  function GetCREDOR_ESTADO: string;
  function GetDEVEDOR_FONE: string;
  function GetDEVEDOR_RG: string;
  function GetDEVEDOR_NOME: string;
  function GetDIVIDAS: string;
  function GetEXTENSO_VALOR_TOTAL: string;
  function GetVALOR_CORRIGIDO: Double;
  function GetVALOR_DIVIDA: Double;
  procedure SetCREDOR_CIDADE(const Value: string);
  procedure SetACORDO(const Value: Integer);
  procedure SetCREDOR_CNPJ(const Value: string);
  procedure SetCREDOR_ENDERECO(const Value: string);
  procedure SetPARCELA(const Value: Integer);
  procedure SetCREDOR_NOME(const Value: string);
  procedure SetDEVEDOR_CEP(const Value: string);
  procedure SetDEVEDOR_CIDADE(const Value: string);
  procedure SetDEVEDOR_CODIGO_ALTERNATIVO(const Value: string);
  procedure SetDEVEDOR_CPF(const Value: string);
  procedure SetDEVEDOR_ENDERECO(const Value: string);
  procedure SetDEVEDOR_ESTADO(const Value: string);
  procedure SetCREDOR_ESTADO(const Value: string);
  procedure SetDEVEDOR_FONE(const Value: string);
  procedure SetDEVEDOR_RG(const Value: string);
  procedure SetDEVEDOR_NOME(const Value: string);
  procedure SetDIVIDAS(const Value: string);
  procedure SetEXTENSO_VALOR_TOTAL(const Value: string);
  procedure SetVALOR_CORRIGIDO(const Value: Double);
  procedure SetVALOR_DIVIDA(const Value: Double);
 public
  constructor Create(AOwner: TComponent); override;
  property CREDOR_CIDADE   : string read GetCREDOR_CIDADE write SetCREDOR_CIDADE;
  property ACORDO          : Integer read GetACORDO write SetACORDO;
  property CREDOR_CNPJ     : string read GetCREDOR_CNPJ write SetCREDOR_CNPJ;
  property CREDOR_ENDERECO : string read GetCREDOR_ENDERECO write SetCREDOR_ENDERECO;
  property PARCELA         : Integer read GetPARCELA write SetPARCELA;
  property CREDOR_NOME     : string read GetCREDOR_NOME write SetCREDOR_NOME;
  property DEVEDOR_CEP     : string read GetDEVEDOR_CEP write SetDEVEDOR_CEP;
  property DEVEDOR_CIDADE  : string read GetDEVEDOR_CIDADE write SetDEVEDOR_CIDADE;
  property DEVEDOR_CODIGO_ALTERNATIVO : string read GetDEVEDOR_CODIGO_ALTERNATIVO write SetDEVEDOR_CODIGO_ALTERNATIVO;
  property DEVEDOR_CPF      : string read GetDEVEDOR_CPF write SetDEVEDOR_CPF;
  property DEVEDOR_ENDERECO : string read GetDEVEDOR_ENDERECO write SetDEVEDOR_ENDERECO;
  property DEVEDOR_ESTADO   : string read GetDEVEDOR_ESTADO write SetDEVEDOR_ESTADO;
  property CREDOR_ESTADO    : string read GetCREDOR_ESTADO write SetCREDOR_ESTADO;
  property DEVEDOR_FONE: string read GetDEVEDOR_FONE write SetDEVEDOR_FONE;
  property DEVEDOR_RG: string read GetDEVEDOR_RG write SetDEVEDOR_RG;
  property DEVEDOR_NOME: string read GetDEVEDOR_NOME write SetDEVEDOR_NOME;
  property DIVIDAS: string read GetDIVIDAS write SetDIVIDAS;
  property EXTENSO_VALOR_TOTAL: string read GetEXTENSO_VALOR_TOTAL write SetEXTENSO_VALOR_TOTAL;
  property VALOR_CORRIGIDO: Double read GetVALOR_CORRIGIDO write SetVALOR_CORRIGIDO;
  property VALOR_DIVIDA: Double read GetVALOR_DIVIDA write SetVALOR_DIVIDA;
 end;

 TMemParcelas = class(TClientDataSet)
 private
  procedure CriarCampos;
  function  GetACORDO: Integer;
  function GetDATA_PAGAMENTO: TDateTime;
  function  GetDOCUMENTO: string;
  function  GetPARCELAS: string;
  function  GetVALOR_PARCELAS: Double;
  procedure SetACORDO(const Value: Integer);
  procedure SetDATA_PAGAMENTO(const Value: TDateTime);
  procedure SetDOCUMENTO(const Value: string);
  procedure SetPARCELAS(const Value: string);
  procedure SetVALOR_PARCELAS(const Value: Double);
 public
  constructor Create(AOwner: TComponent); override;
  property ACORDO: Integer read GetACORDO write SetACORDO;
  property DATA_PAGAMENTO: TDateTime read GetDATA_PAGAMENTO write
      SetDATA_PAGAMENTO;
  property DOCUMENTO: string read GetDOCUMENTO write SetDOCUMENTO;
  property PARCELAS: string read GetPARCELAS write SetPARCELAS;
  property VALOR_PARCELAS: Double read GetVALOR_PARCELAS write SetVALOR_PARCELAS;
 end;

implementation

resourcestring
 FLD_CREDOR_CIDADE = 'CREDOR_CIDADE';
 FLD_ACORDO = 'ACORDO';
 FLD_CREDOR_CNPJ = 'CREDOR_CNPJ';
 FLD_CREDOR_ENDERECO = 'CREDOR_ENDERECO';
 FLD_CREDOR_ESTADO = 'CREDOR_ESTADO';

 FLD_PARCELA = 'PARCELA';
 FLD_CREDOR_NOME = 'CREDOR_NOME';
 FLD_DEVEDOR_CEP = 'DEVEDOR_CEP';
 FLD_DEVEDOR_CIDADE = 'DEVEDOR_CIDADE';
 FLD_DEVEDOR_CODIGO_ALTERNATIVO = 'DEVEDOR_CODIGO_ALTERNATIVO';
 FLD_DEVEDOR_CPF = 'DEVEDOR_CPF';
 FLD_DEVEDOR_ENDERECO = 'DEVEDOR_ENDERECO';
 FLD_DEVEDOR_ESTADO = 'DEVEDOR_ESTADO';
 FLD_DEVEDOR_FONE = 'DEVEDOR_FONE';
 FLD_DEVEDOR_RG = 'DEVEDOR_RG';
 FLD_DEVEDOR_NOME = 'DEVEDOR_NOME';
 FLD_DIVIDAS = 'DIVIDAS';
 FLD_EXTENSO_VALOR_TOTAL = 'EXTENSO_VALOR_TOTAL';
 FLD_VALOR_CORRIGIDO = 'VALOR_CORRIGIDO';
 FLD_VALOR_DIVIDA = 'VALOR_DIVIDA';

 FLD_DATA_PAGAMENTO = 'DATA_PAGAMENTO';
 FLD_DOCUMENTO      = 'DOCUMENTO';
 FLD_PARCELAS       = 'PARCELAS';
 FLD_VALOR_PARCELAS = 'VALOR_PARCELAS';


constructor TMemAcordo.Create(AOwner: TComponent);
begin
 Name := 'cdsACORDO';
 inherited;
 CriarCampos;
end;

procedure TMemAcordo.CriarCampos;
begin
  StoreDefs := True;
  With FieldDefs do
  Begin
    Add(FLD_CREDOR_CIDADE             , ftString,20);
    Add(FLD_ACORDO                    , ftInteger);
    Add(FLD_CREDOR_CNPJ               , ftString,20);
    Add(FLD_CREDOR_ENDERECO           , ftString,60);
    Add(FLD_CREDOR_ESTADO             , ftString, 2);
    Add(FLD_PARCELA                   , ftInteger);
    Add(FLD_CREDOR_NOME               , ftString,60);
    Add(FLD_DEVEDOR_CEP               , ftString,10);
    Add(FLD_DEVEDOR_CIDADE            , ftString, 50);
    Add(FLD_DEVEDOR_CODIGO_ALTERNATIVO, ftString, 10);
    Add(FLD_DEVEDOR_CPF               , ftString, 20);
    Add(FLD_DEVEDOR_ENDERECO          , ftString, 60);
    Add(FLD_DEVEDOR_ESTADO            , ftString, 2);
    Add(FLD_DEVEDOR_FONE              , ftString, 20);
    Add(FLD_DEVEDOR_RG                , ftString, 20);
    Add(FLD_DEVEDOR_NOME              , ftString, 60);
    Add(FLD_DIVIDAS                   , ftString, 999);
    Add(FLD_EXTENSO_VALOR_TOTAL       , ftString, 255);
    Add(FLD_VALOR_CORRIGIDO           , ftFloat);
    Add(FLD_VALOR_DIVIDA              , ftFloat);
  End;
  CreateDataSet;
  StoreDefs := False;
  Active    := True;
end;

function TMemAcordo.GetCREDOR_CIDADE: string;
begin
  Result := FieldByName(FLD_CREDOR_CIDADE).AsString;
end;

function TMemAcordo.GetACORDO: Integer;
begin
  Result := FieldByName(FLD_ACORDO).AsInteger;
end;

function TMemAcordo.GetCREDOR_CNPJ: string;
begin
  Result := FieldByName(FLD_CREDOR_CNPJ).AsString;
end;

function TMemAcordo.GetCREDOR_ENDERECO: string;
begin
  Result := FieldByName(FLD_CREDOR_ENDERECO).AsString;
end;

function TMemAcordo.GetPARCELA: Integer;
begin
  Result := FieldByName(FLD_PARCELA).AsInteger;
end;

function TMemAcordo.GetCREDOR_NOME: string;
begin
  Result := FieldByName(FLD_CREDOR_NOME).AsString;
end;

function TMemAcordo.GetDEVEDOR_CEP: string;
begin
  Result := FieldByName(FLD_DEVEDOR_CEP).AsString;
end;

function TMemAcordo.GetDEVEDOR_CIDADE: string;
begin
  Result := FieldByName(FLD_DEVEDOR_CIDADE).AsString;
end;

function TMemAcordo.GetDEVEDOR_CODIGO_ALTERNATIVO: string;
begin
  Result := FieldByName(FLD_DEVEDOR_CODIGO_ALTERNATIVO).AsString;
end;

function TMemAcordo.GetDEVEDOR_CPF: string;
begin
  Result := FieldByName(FLD_DEVEDOR_CPF).AsString;
end;

function TMemAcordo.GetDEVEDOR_ENDERECO: string;
begin
  Result := FieldByName(FLD_DEVEDOR_ENDERECO).AsString;
end;

function TMemAcordo.GetDEVEDOR_ESTADO: string;
begin
  Result := FieldByName(FLD_DEVEDOR_ESTADO).AsString;
end;

function TMemAcordo.GetCREDOR_ESTADO: string;
begin
  Result := FieldByName(FLD_CREDOR_ESTADO).AsString;
end;

function TMemAcordo.GetDEVEDOR_FONE: string;
begin
  Result := FieldByName(FLD_DEVEDOR_FONE).AsString;
end;

function TMemAcordo.GetDEVEDOR_RG: string;
begin
  Result := FieldByName(FLD_DEVEDOR_RG).AsString;
end;

function TMemAcordo.GetDEVEDOR_NOME: string;
begin
  Result := FieldByName(FLD_DEVEDOR_NOME).AsString;
end;

function TMemAcordo.GetDIVIDAS: string;
begin
  Result := FieldByName(FLD_DIVIDAS).AsString;
end;

function TMemAcordo.GetEXTENSO_VALOR_TOTAL: string;
begin
  Result :=  FieldByName(FLD_EXTENSO_VALOR_TOTAL).AsString;
end;

function TMemAcordo.GetVALOR_CORRIGIDO: Double;
begin
  Result := FieldByName(FLD_VALOR_CORRIGIDO).AsFloat;
end;

function TMemAcordo.GetVALOR_DIVIDA: Double;
begin
  Result := FieldByName(FLD_VALOR_DIVIDA).AsFloat;
end;

procedure TMemAcordo.SetCREDOR_CIDADE(const Value: string);
begin
  FieldByName(FLD_CREDOR_CIDADE).AsString := Value;
end;

procedure TMemAcordo.SetACORDO(const Value: Integer);
begin
  FieldByName(FLD_ACORDO).AsInteger := Value;
end;

procedure TMemAcordo.SetCREDOR_CNPJ(const Value: string);
begin
  FieldByName(FLD_CREDOR_CNPJ).AsString := Value;
end;

procedure TMemAcordo.SetCREDOR_ENDERECO(const Value: string);
begin
  FieldByName(FLD_CREDOR_ENDERECO).AsString := Value;
end;

procedure TMemAcordo.SetPARCELA(const Value: Integer);
begin
  FieldByName(FLD_PARCELA).AsInteger := Value;
end;

procedure TMemAcordo.SetCREDOR_NOME(const Value: string);
begin
  FieldByName(FLD_CREDOR_NOME).AsString := Value;
end;

procedure TMemAcordo.SetDEVEDOR_CEP(const Value: string);
begin
  FieldByName(FLD_DEVEDOR_CEP).AsString := Value;
end;

procedure TMemAcordo.SetDEVEDOR_CIDADE(const Value: string);
begin
  FieldByName(FLD_DEVEDOR_CIDADE).AsString := Value;
end;

procedure TMemAcordo.SetDEVEDOR_CODIGO_ALTERNATIVO(const Value: string);
begin
  FieldByName(FLD_DEVEDOR_CODIGO_ALTERNATIVO).AsString := Value;
end;

procedure TMemAcordo.SetDEVEDOR_CPF(const Value: string);
begin
  FieldByName(FLD_DEVEDOR_CPF).AsString := Value;
end;

procedure TMemAcordo.SetDEVEDOR_ENDERECO(const Value: string);
begin
  FieldByName(FLD_DEVEDOR_ENDERECO).AsString := Value;
end;

procedure TMemAcordo.SetDEVEDOR_ESTADO(const Value: string);
begin
  FieldByName(FLD_DEVEDOR_ESTADO).AsString := Value;
end;

procedure TMemAcordo.SetCREDOR_ESTADO(const Value: string);
begin
  FieldByName(FLD_CREDOR_ESTADO).AsString := Value;
end;

procedure TMemAcordo.SetDEVEDOR_FONE(const Value: string);
begin
  FieldByName(FLD_DEVEDOR_FONE).AsString := Value;
end;

procedure TMemAcordo.SetDEVEDOR_RG(const Value: string);
begin
  FieldByName(FLD_DEVEDOR_RG).AsString := Value;
end;

procedure TMemAcordo.SetDEVEDOR_NOME(const Value: string);
begin
  FieldByName(FLD_DEVEDOR_NOME).AsString := Value;
end;

procedure TMemAcordo.SetDIVIDAS(const Value: string);
begin
  FieldByName(FLD_DIVIDAS).AsString := Value;
end;

procedure TMemAcordo.SetEXTENSO_VALOR_TOTAL(const Value: string);
begin
  FieldByName(FLD_EXTENSO_VALOR_TOTAL).AsString := Value;
end;

procedure TMemAcordo.SetVALOR_CORRIGIDO(const Value: Double);
begin
  FieldByName(FLD_VALOR_CORRIGIDO).AsFloat := Value;
end;

procedure TMemAcordo.SetVALOR_DIVIDA(const Value: Double);
begin
  FieldByName(FLD_VALOR_DIVIDA).AsFloat := Value;
end;

constructor TMemParcelas.Create(AOwner: TComponent);
begin
 Name := 'cdsPARCELAS';
 inherited;
 CriarCampos;
end;

procedure TMemParcelas.CriarCampos;
begin
  StoreDefs := True;
  With FieldDefs do
  Begin
    Add(FLD_ACORDO         , ftInteger);
    Add(FLD_DATA_PAGAMENTO , ftDate);
    Add(FLD_DOCUMENTO      , ftString,15);
    Add(FLD_PARCELAS       , ftString,20);
    Add(FLD_VALOR_PARCELAS , ftFloat);
  End;
  CreateDataSet;
  IndexFieldNames := FLD_DATA_PAGAMENTO;
  StoreDefs := False;
  Active    := True;
end;

function TMemParcelas.GetACORDO: Integer;
begin
  Result := FieldByName(FLD_ACORDO).AsInteger;
end;

function TMemParcelas.GetDATA_PAGAMENTO: TDateTime;
begin
  Result := FieldByName(FLD_DATA_PAGAMENTO).AsFloat;
end;

function TMemParcelas.GetDOCUMENTO: string;
begin
  Result := FieldByName(FLD_DOCUMENTO).AsString;
end;

function TMemParcelas.GetPARCELAS: string;
begin
  Result := FieldByName(FLD_PARCELAS).AsString;
end;

function TMemParcelas.GetVALOR_PARCELAS: Double;
begin
  Result := FieldByName(FLD_VALOR_PARCELAS).AsFloat;
end;

procedure TMemParcelas.SetACORDO(const Value: Integer);
begin
  FieldByName(FLD_ACORDO).AsFloat := Value;
end;

procedure TMemParcelas.SetDATA_PAGAMENTO(const Value: TDateTime);
begin
  FieldByName(FLD_DATA_PAGAMENTO).AsFloat := Value;
end;

procedure TMemParcelas.SetDOCUMENTO(const Value: string);
begin
  FieldByName(FLD_DOCUMENTO).AsString := Value;
end;

procedure TMemParcelas.SetPARCELAS(const Value: string);
begin
  FieldByName(FLD_PARCELAS).AsString := Value;
end;

procedure TMemParcelas.SetVALOR_PARCELAS(const Value: Double);
begin
  FieldByName(FLD_VALOR_PARCELAS).AsFloat := Value;
end;


end.
