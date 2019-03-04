unit uPropostas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TFrmProposta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    DateTimePicker1: TDateTimePicker;
    cbDia: TComboBox;
    stCobranca: TStaticText;
    stValorDivida: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    StaticText1: TStaticText;
    Label7: TLabel;
    btnSair: TBitBtn;
    btnGrava: TBitBtn;
    Label8: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure plProposta(cCobranca : Integer; cValor : Double);

var
  FrmProposta: TFrmProposta;

implementation

{$R *.dfm}

procedure plProposta(cCobranca : Integer; cValor : Double);
var
  FrmProposta: TFrmProposta;
Begin
  FrmProposta := TFrmProposta.Create(Application);
  Try
    FrmProposta.ShowModal;
  Finally
    FreeAndNil(FrmProposta);
  End;
End;

end.
