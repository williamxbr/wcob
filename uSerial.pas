unit uSerial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uCodifica,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    cbEmpresa: TComboBox;
    cbVersao: TComboBox;
    dtValidade: TDateTimePicker;
    Edit1: TEdit;
    Panel2: TPanel;
    Btn_Gera_Ressoma: TBitBtn;
    btnSair: TBitBtn;
    Edit2: TEdit;
    cbUsuarios: TComboBox;
    lblEmpresa: TLabel;
    lblVersao: TLabel;
    lblUsuarios: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Btn_Gera_RessomaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DateUtils;

{$R *.dfm}

procedure TForm1.Btn_Gera_RessomaClick(Sender: TObject);
Var
  Ano, Mes, Dia : String;
begin
  Ano := Format('%.4d',[YearOf(dtValidade.DateTime)]);
  Mes := Format('%.2d',[MonthOf(dtValidade.DateTime)]);
  Dia := Format('%.2d',[DayOf(dtValidade.DateTime)]);
  Edit1.Text := Criptografar(cbEmpresa.Text +
                             cbVersao.Text +
                             cbUsuarios.Text +
                             Ano +
                             Mes +
                             Dia);
  Edit2.Text := Decriptografar(Edit1.Text);
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
