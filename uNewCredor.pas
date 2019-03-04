unit uNewCredor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFrmNewCredor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
  private
    { Private declarations }
    procedure plFecharTabelas;
    procedure plAbrirTabelas;
  public
    { Public declarations }
  end;

  procedure CadastraNewCredor;

implementation

{$R *.dfm}

procedure CadastraNewCredor;
var
  FrmNewCredor : TFrmNewCredor;
begin
  FrmNewCredor := FrmNewCredor.Create(Application);
  try
     FrmNewCredor.ShowModal;
  finally
     FreeAndNil(FrmNewCredor);
  end;

end;



{ TForm2 }

procedure TFrmNewCredor.plAbrirTabelas;
begin

end;

procedure TFrmNewCredor.plFecharTabelas;
begin

end;

end.
