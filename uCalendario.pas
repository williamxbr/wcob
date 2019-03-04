unit uCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFrmCalendario = class(TForm)
    mCalendario: TMonthCalendar;
    dtEscolha: TDateTimePicker;
    btAdiciona: TBitBtn;
    BitBtn5: TBitBtn;
    procedure mCalendarioClick(Sender: TObject);
    procedure btAdicionaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function flRetornarData : TDateTime;


implementation

{$R *.dfm}

function flRetornarData : TDateTime;
var
  FrmCalendario: TFrmCalendario;
Begin
  FrmCalendario := TFrmCalendario.Create(Application);
  Try
    FrmCalendario.ShowModal;
    Result := FrmCalendario.dtEscolha.DateTime;
  Finally
    FrmCalendario.Free;
  End;
End;

procedure TFrmCalendario.mCalendarioClick(Sender: TObject);
begin
  dtEscolha.Date := mCalendario.Date;
end;

procedure TFrmCalendario.btAdicionaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCalendario.FormCreate(Sender: TObject);
begin
  mCalendario.Date := Date;
  dtEscolha.Date   := Date;
  dtEscolha.Time   := Time; 
end;

procedure TFrmCalendario.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

end.
