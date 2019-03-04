unit uMostraSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uCodifica,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOTable1ID: TAutoIncField;
    ADOTable1USUARIO: TWideStringField;
    ADOTable1NOME: TWideStringField;
    ADOTable1TIPO_USUARIO: TBooleanField;
    ADOTable1ENDERECO_IP: TWideStringField;
    ADOTable1NOME_COMPUTADOR: TWideStringField;
    ADOTable1USUARIO_REDE: TWideStringField;
    ADOTable1USUARIO_LOGADO: TBooleanField;
    ADOTable1SENHA1: TWideStringField;
    ADOTable1SENHA: TWideStringField;
    ADOTable1USUARIO_INCLUSAO: TWideStringField;
    ADOTable1USUARIO_ALTERACAO: TWideStringField;
    ADOTable1DATA_INCLUSAO: TDateTimeField;
    ADOTable1DATA_ALTERACAO: TDateTimeField;
    procedure ADOTable1SENHA1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ADOTable1SENHA1GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := Decriptografar(ADOTable1SENHA.Value);
end;

end.
