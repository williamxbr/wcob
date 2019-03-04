unit uDBFreeBoleto;

interface

uses uFreeBoleto, DB, Controls, Classes, SysUtils;

type

  TDBFreeBoleto = class(TComponent)
  private
    FDataLink: TDataLink;
    FFieldVencimento: TDate;
    FFieldCedente: TCedente;
    FFieldSacado: TSacado;
    FFieldMoeda: char;
    FFieldValor: Currency;
    FFieldNossoNumero: string;
    FFieldDataDocumento: TDate;
    FFieldDocumento: string;
    FFieldEspecie: string;
    FFieldEspecieDoc: string;
    FFieldAceite: string;
    FFieldCarteira: string;
    FFieldLocalPagamento: string;
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
  public
    FFreeBoleto: TFreeBoleto;
    procedure Preparar;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property fieldCedente: TCedente read FFieldCedente write FFieldCedente;
    property fieldSacado: TSacado read FFieldSacado write FFieldSacado;
    property fieldVencimento: TDate read FFieldVencimento write FFieldVencimento;
    property fieldMoeda: char read FFieldMoeda write FFieldMoeda default '9';
    property fieldValor: Currency read FFieldValor write FFieldValor;
    property fieldNossoNumero: string read FFieldNossoNumero write FFieldNossoNumero;
    {Dados Opcionais}
    property fieldLocalPagamento: string read FFieldLocalPagamento write FFieldLocalPagamento;
    property fieldDataDocumento: TDate read FFieldDataDocumento write FFieldDataDocumento; // Opcional
    property fieldDocumento: string read FFieldDocumento write FFieldDocumento; // Opcional
    property fieldEspecie: string read FFieldEspecie write FFieldEspecie; // Opcional
    property fieldEspecieDoc: string read FFieldEspecieDoc write FFieldEspecieDoc; // Opcional
    property fieldAceite: string read FFieldAceite write FFieldAceite; // Opcional
    property fieldCarteira: string read FFieldCarteira write FFieldCarteira; // Obrigatorio no caso do Itau
  end;

procedure Register;

implementation

constructor TDBFreeBoleto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataLink:= TDataLink.create;
  FFreeBoleto:=TFreeBoleto.create(self);
  FFieldCedente := TCedente.create;
  FFieldSacado := TSacado.create;
  FFieldMoeda := '9';
end;

destructor TDBFreeBoleto.Destroy;
begin
  FDataLink.free;
  FFieldCedente.free;
  FFieldSacado.free;
  inherited;
end;

procedure TDBFreeBoleto.Preparar;
begin
  if not assigned(DataSource) then
  begin
    raise Exception.Create('DataSource não definido!');
  end;
  if not assigned(DataSource.DataSet) then
  begin
    raise Exception.Create('DataSet não definido!');
  end;
  if not not DataSource.DataSet.active then
  begin
    raise Exception.Create('DataSet não está ativo!');
  end;
  inherited;
end;

function TDBFreeBoleto.GetDataSource:TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBFreeBoleto.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

procedure Register;
begin
  RegisterComponents('FreeBoleto', [TDBFreeBoleto]);
end;

end.
