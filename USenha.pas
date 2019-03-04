unit USenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, Buttons, jpeg, ComCtrls, DB, DBTables;

type
  TfmSenha = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Image2: TImage;
    MaskEdit1: TMaskEdit;
    SB_OK: TSpeedButton;
    SB_Cancel: TSpeedButton;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    QSenha: TQuery;
    Image3: TImage;
    Timer1: TTimer;
    QSenhaLogin: TStringField;
    QSenhaSenha: TStringField;
    QSenhaNomeUser: TStringField;
    procedure SB_CancelClick(Sender: TObject);
    procedure SB_OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSenha: TfmSenha;

implementation

uses UDM, UAbertura;

{$R *.dfm}

procedure TfmSenha.SB_CancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfmSenha.SB_OKClick(Sender: TObject);
begin
    if (Edit1.Text = '') or (MaskEdit1.Text = '') then
      begin
        ShowMessage('Os campos USUÁRIO e SENHA, não podem ficar vazios');
        Edit1.SetFocus;
      end
      else
      begin
        QSenha.Active := false;
        QSenha.ParamByName('usuario').Text:=edit1.Text;
        {QSenha.SQL.Clear;
        QSenha.SQL.Add('Select * from usuario');
        QSenha.SQL.add('Where nomeuser = '+'edit1.Text'+'');}
        QSenha.Active := true;
        if (QSenhaSenha.Value = MaskEdit1.Text) and (QSenhaLogin.Value = Edit1.Text) then
          begin
//              Application.CreateForm(TfmAbertura, fmAbertura);
              fmAbertura.ShowModal;
              close;
//              fmAbertura.Free;
          end
          else
          begin
              ShowMessage('USUÁRIO OU SENHA NÃO CONFEREM.');
           //   Edit1.Clear;
              MaskEdit1.Clear;
              MaskEdit1.SetFocus;

          end;

      end;


end;

procedure TfmSenha.FormShow(Sender: TObject);
begin
    SB_OK.Enabled := false;

    if (TimeTostr(now) > '00:00:00') and (TimetoStr(now) < '12:00:00')then
        label1.Caption := 'BOM DIA'
    else
    if (TimeTostr(now) > '11:59:59') and (TimetoStr(now) < '18:00:00')then
        label1.Caption := 'BOA TARDE'
    else
    if (TimeTostr(now) > '17:59:59') and (TimetoStr(now) < '23:59:59')then
        label1.Caption := 'BOA NOITE';
end;

procedure TfmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action:= caFree;
end;

procedure TfmSenha.Edit1Change(Sender: TObject);
begin
    if (edit1.Text = '') or (MaskEdit1.Text = '') then
      SB_OK.Enabled := false
    else
      SB_OK.Enabled := true;
end;

procedure TfmSenha.MaskEdit1Change(Sender: TObject);
begin
     if (edit1.Text = '') or (MaskEdit1.Text = '') then
      SB_OK.Enabled := false
    else
      SB_OK.Enabled := true;



    
end;

procedure TfmSenha.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[1].text := TimetoStr(time);
end;

procedure TfmSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
      SB_OK.Click;
end;

end.
