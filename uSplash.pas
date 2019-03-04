unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, dxGDIPlusClasses;

type
  TfrmSplash = class(TForm)
    Label1: TLabel;
    Image2: TImage;
    lblMensagem: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    TFinaliza : Boolean;
  public
    { Public declarations }
    procedure Contar;
    procedure Mensagem(Msg : String);
    property Finaliza : Boolean read TFinaliza;
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

{ TfrmSplash }

procedure TfrmSplash.Contar;
begin
end;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  TFinaliza := False;
end;

procedure TfrmSplash.Mensagem(Msg: String);
begin
  lblMensagem.Caption := Msg;
  Update;
  Application.ProcessMessages;
end;

end.
