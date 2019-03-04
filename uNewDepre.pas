unit uNewDepre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ucLayDepre,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FDepre : TDEPRE;
    procedure AbrirTabela;
  public
    { Public declarations }
  end;

  procedure ChamaNovaDepre;


implementation

{$R *.dfm}

procedure ChamaNovaDepre;
var
  Form2: TForm2;
Begin
  Form2 := TForm2.Create(Application);
  Try
    Form2.ShowModal;
  Finally
    Form2.Free;
  End;
End;


{ TForm2 }

procedure TForm2.AbrirTabela;
begin
  FDepre := TDEPRE.Create(Self);
  FDepre.Carrega(False);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  AbrirTabela;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  FDepre.Insert;
  FDepre.ANO := StrToInt(Edit1.Text);
  FDepre.MES := StrToInt(Edit2.Text);
  FDepre.INDICE := StrToFloat(Edit3.Text);
  FDepre.Post;
end;

end.
