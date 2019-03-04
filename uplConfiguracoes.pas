unit uplConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFrmPlConfiguracoes = class(TForm)
    gbOpcoes: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cbCredor: TCheckBox;
    cbData: TCheckBox;
    dtInicio: TDateTimePicker;
    dtFinal: TDateTimePicker;
    cbDevedor: TCheckBox;
    edCredor: TEdit;
    btnBuscaCredor: TButton;
    edDevedor: TEdit;
    btnBuscaDevedor: TButton;
    cbCobrador: TCheckBox;
    edCobrador: TEdit;
    btnCobrador: TButton;
    procedure cbDataClick(Sender: TObject);
    procedure cbDevedorClick(Sender: TObject);
    procedure btnBuscaCredorClick(Sender: TObject);
    procedure cbCobradorClick(Sender: TObject);
    procedure btnCobradorClick(Sender: TObject);
    procedure btnBuscaDevedorClick(Sender: TObject);
    procedure cbCredorClick(Sender: TObject);
  private
    function PesquisarCobrador: Integer;
    function PesquisarCredor: Integer;
    function PesquisarDevedor: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
Uses
  uPesquisa;


{$R *.dfm}

procedure TFrmPlConfiguracoes.cbDataClick(Sender: TObject);
begin
  dtInicio.Enabled := cbData.Checked;
  dtFinal.Enabled  := cbData.Checked;
end;

procedure TFrmPlConfiguracoes.cbDevedorClick(Sender: TObject);
begin
  edDevedor.Enabled       := cbDevedor.Checked;
  btnBuscaDevedor.Enabled := cbDevedor.Checked;
end;

procedure TFrmPlConfiguracoes.btnBuscaCredorClick(Sender: TObject);
begin
  edCredor.Text := IntToStr(PesquisarCredor);
end;

function TFrmPlConfiguracoes.PesquisarCobrador: Integer;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'COBRADOR';
    FConsulta.DefineCampos(['IDCOBRADOR','NOME_COBRADOR']);
    FConsulta.CampoCondicao := 'NOME_COBRADOR';
    If   FConsulta.Execute Then
         Result := FConsulta.Consulta.FieldByName('IDCOBRADOR').AsInteger;
  Finally
    FConsulta.Free;
  End;
end;

function TFrmPlConfiguracoes.PesquisarCredor: Integer;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'CREDOR';
    FConsulta.DefineCampos(['CODIGO_CREDOR','NOME_CREDOR']);
    FConsulta.CampoCondicao := 'NOME_CREDOR';
    If   FConsulta.Execute Then
         Result := FConsulta.Consulta.FieldByName('CODIGO_CREDOR').AsInteger;
  Finally
    FConsulta.Free;
  End;
end;

procedure TFrmPlConfiguracoes.cbCobradorClick(Sender: TObject);
begin
  edCobrador.Enabled  := cbCobrador.Checked;
  btnCobrador.Enabled := cbCobrador.Checked;
end;

function TFrmPlConfiguracoes.PesquisarDevedor: Integer;
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'DEVEDOR';
    FConsulta.DefineCampos(['CODIGO_DEVEDOR','NOME_DEVEDOR']);
    FConsulta.CampoCondicao := 'NOME_DEVEDOR';
    If   FConsulta.Execute Then
         Result := FConsulta.Consulta.FieldByName('CODIGO_DEVEDOR').AsInteger;
  Finally
    FConsulta.Free;
  End;
end;

procedure TFrmPlConfiguracoes.btnCobradorClick(Sender: TObject);
begin
  edCobrador.Text := IntToStr(PesquisarCobrador);
end;

procedure TFrmPlConfiguracoes.btnBuscaDevedorClick(Sender: TObject);
begin
  edDevedor.Text := IntToStr(PesquisarDevedor);
end;

procedure TFrmPlConfiguracoes.cbCredorClick(Sender: TObject);
begin
  edCredor.Enabled       := cbCredor.Checked;
  btnBuscaCredor.Enabled := cbCredor.Checked;
end;

end.
