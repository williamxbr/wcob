unit U_Usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, DBTables, ExtCtrls;

type
  TFUsuarios = class(TForm)
    DBNavigator1: TDBNavigator;
    Table1: TTable;
    DataSource1: TDataSource;
    Table1STATUS: TStringField;
    Table1DT_INC: TDateField;
    Table1DT_ALT: TDateField;
    Table1NOME: TStringField;
    Table1LOGIN: TStringField;
    Table1SENHA: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Table1ID: TAutoIncField;
    DBCheckBox1: TDBCheckBox;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1AfterEdit(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuarios: TFUsuarios;

implementation

{$R *.dfm}

procedure TFUsuarios.FormActivate(Sender: TObject);
begin
 Table1.Open;
end;

procedure TFUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Table1.Close;
end;

procedure TFUsuarios.Table1AfterInsert(DataSet: TDataSet);
begin
  Table1.FieldByName('DT_INC').AsDateTime:= date;
end;

procedure TFUsuarios.Table1AfterEdit(DataSet: TDataSet);
begin
  Table1.FieldByName('DT_ALT').AsDateTime:= date;
end;

procedure TFUsuarios.Button1Click(Sender: TObject);
begin
Close;
end;

end.
