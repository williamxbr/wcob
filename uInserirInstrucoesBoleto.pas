unit uInserirInstrucoesBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, DBCtrls, Mask, Buttons, Grids,
  DBGrids, dbcgrids;

type
  TfrmInserirInstrucoesBoleto = class(TForm)
    pnTop: TPanel;
    pnCabecalho: TPanel;
    Label1: TLabel;
    gbAcionamento: TGroupBox;
    pnTopAcionamento: TPanel;
    mmInstrucoes: TMemo;
    btnIncluir: TButton;
    procedure btnIncluirClick(Sender: TObject);
  private
    procedure CentralizarForm;
  public
    { Public declarations }
  end;


  function InserirInstrucoes : String;

implementation

{$R *.dfm}

function InserirInstrucoes : String;
var
  frmInserirInstrucoesBoleto: TfrmInserirInstrucoesBoleto;
Begin
  frmInserirInstrucoesBoleto := TfrmInserirInstrucoesBoleto.Create(Application);
  Try
    frmInserirInstrucoesBoleto.ShowModal;
    Result := frmInserirInstrucoesBoleto.mmInstrucoes.Lines.Text;
  Finally
    frmInserirInstrucoesBoleto.Free;
  End;
End;

procedure TfrmInserirInstrucoesBoleto.CentralizarForm;
var
  r   : TRect;
  osv : TOSVersionInfo;
begin
  osv.dwOSVersionInfoSize := sizeof(osv);
  GetVersionEx(osv);
  if    osv.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
        begin
          SystemParametersInfo(SPI_GETWORKAREA, 0, @r, 0);
          Left := ((r.right - r.left) - Width) div 2;
          Top := ((r.bottom - r.top) - Height) div 2;
        end
  else  begin
          Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
          Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
        end;
end;
procedure TfrmInserirInstrucoesBoleto.btnIncluirClick(Sender: TObject);
begin
  Close;
end;

end.
