unit uNewDevedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFrmNewDevedor = class(TForm)
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

  procedure CadastraNewDevedor;

implementation

{$R *.dfm}

procedure CadastraNewDevedor;
var
  FrmNewDevedor : TFrmNewDevedor;
begin
  FrmNewDevedor := TFrmNewDevedor.Create(Application);
  try
     FrmNewDevedor.ShowModal;
  finally
     FreeAndNil(FrmNewDevedor);
  end;
end;


{ TForm3 }

procedure TFrmNewDevedor.plAbrirTabelas;
begin

end;

procedure TFrmNewDevedor.plFecharTabelas;
begin

end;

end.
