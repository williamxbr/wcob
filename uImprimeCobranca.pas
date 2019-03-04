unit uImprimeCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    edCredor: TEdit;
    edNomeCredor: TEdit;
    sbBusca: TSpeedButton;
    procedure sbBuscaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
Uses
  uPesquisa,
  uDados;

{$R *.dfm}

procedure TForm1.sbBuscaClick(Sender: TObject);
Var
  FConsulta : TFrmPesquisa;
begin
  FConsulta := TFrmPesquisa.Create(Application);
  Try
    FConsulta.Tabela := 'CREDOR';
    FConsulta.DefineCampos(['CODIGO_CREDOR','NOME_CREDOR']);
    FConsulta.CampoCondicao := 'NOME_CREDOR';
    If   FConsulta.Execute Then
         Begin
           edCredor.Text     := FConsulta.Consulta.FieldByName('CODIGO_DEVEDOR').AsVariant;
           edNomeCredor.Text := FConsulta.Consulta.FieldByName('NOME_DEVEDOR').AsVariant;
         End;
  Finally
    FConsulta.Free;
  End;
end;

end.
