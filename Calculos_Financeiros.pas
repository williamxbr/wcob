unit Calculos_Financeiros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, WinSkinData, ComCtrls, dfsStatusBar, dxCore, dxButton,
  StdCtrls, BmsXPForm, Mask, ToolEdit, CurrEdit, ActnList, SUIButton,
  QRCtrls, QuickRpt, Menus, XiPanel, CJVLinkLabel, ProCtrls, RxCalc,
  Buttons;

type
  TForm1 = class(TForm)
    TELA: TNotebook;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DiasC: TLabel;
    DescontoC: TLabel;
    ValorC: TLabel;
    Label13: TLabel;
    DiasS: TLabel;
    Label15: TLabel;
    DescontoS: TLabel;
    Label17: TLabel;
    ValorS: TLabel;
    ActionList1: TActionList;
    Dias: TAction;
    CalcDescontoS: TAction;
    CalcDescontoC: TAction;
    Label11: TLabel;
    GroupBox6: TGroupBox;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    VencimentoJ: TMaskEdit;
    PagamentoJ: TMaskEdit;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    JDiasC: TLabel;
    JDescontoC: TLabel;
    JvalorC: TLabel;
    GroupBox9: TGroupBox;
    Label25: TLabel;
    JDiasS: TLabel;
    Label27: TLabel;
    JDescontoS: TLabel;
    Label29: TLabel;
    JValorS: TLabel;
    JurosS: TAction;
    JurosC: TAction;
    DiasJ: TAction;
    Pop: TPopupMenu;
    ImprimirDescontoGeral1: TMenuItem;
    ImprimirDescontoSimples1: TMenuItem;
    ImprimirDescontoComposto1: TMenuItem;
    TaxaD: TEdit;
    Label10: TLabel;
    Memo: TRichEdit;
    TaxaJ: TEdit;
    Label22: TLabel;
    PopJ: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PrintDialog1: TPrintDialog;
    Label24: TLabel;
    GroupBox10: TGroupBox;
    Label26: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    TaxaP: TEdit;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    LPrestacaoC: TLabel;
    LJurosC: TLabel;
    LValorC: TLabel;
    Label23: TLabel;
    Prestacao: TEdit;
    PopP: TPopupMenu;
    MenuItem6: TMenuItem;
    Label28: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure DiasExecute(Sender: TObject);
    procedure dxButton4Click(Sender: TObject);
    procedure CalcDescontoSExecute(Sender: TObject);
    procedure CalcDescontoCExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JurosSExecute(Sender: TObject);
    procedure JurosCExecute(Sender: TObject);
    procedure DiasJExecute(Sender: TObject);
    procedure dxButton5Click(Sender: TObject);
    procedure PagamentoJExit(Sender: TObject);
    procedure dxButton6Click(Sender: TObject);
    procedure dxButton7Click(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure dxButton1Click(Sender: TObject);
    procedure dxButton2Click(Sender: TObject);
    procedure dxButton8Click(Sender: TObject);
    procedure ImprimirDescontoGeral1Click(Sender: TObject);
    procedure ValorDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dxButton3Click(Sender: TObject);
    procedure dxButton9Click(Sender: TObject);
    procedure ImprimirDescontoSimples1Click(Sender: TObject);
    procedure ImprimirDescontoComposto1Click(Sender: TObject);
    procedure dxButton11Click(Sender: TObject);
    procedure dxButton12Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure dxButton10Click(Sender: TObject);
    procedure ValorJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxButton13Click(Sender: TObject);
    procedure dxButton17Click(Sender: TObject);
    procedure dxButton14Click(Sender: TObject);
    procedure VoltaClick(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure dxButton15Click(Sender: TObject);
    procedure PrestacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
  function EliminaFormatacao(sTexto:String):String;
  function elevado(a,b: real): real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Math, DateUtils;

{$R *.dfm}

procedure TForm1.DiasExecute(Sender: TObject);
begin
DiasC.Caption:=(floattostr(strtodate(maskedit1.Text) - strtodate(maskedit2.Text)));
DiasS.Caption:=DiasC.Caption;
end;

procedure TForm1.dxButton4Click(Sender: TObject);
begin
if (valorD.Text = 'R$ 0,00') or (taxaD.Text = '') or (maskedit1.Text = '  /  /    ') or (maskedit2.Text = '  /  /    ') then begin
   showmessage('Preencha todos os campos');
   valorD.SetFocus;
   exit;
end;begin
DiasExecute(self);
CalcDescontoSExecute(self);
CalcDescontoCExecute(self);
end;end;

procedure TForm1.CalcDescontoSExecute(Sender: TObject);
Var
Total, Taxa, Dia, Valor : Real;
Dias : String;
begin
Valor := strtofloat(EliminaFormatacao(ValorD.Text));
Taxa := strtofloat(EliminaFormatacao(taxaD.Text))/100;
Dias := floattostr(strtofloat(diasc.Caption)/30);
Dia := strtofloat(dias);
Total := Valor * Taxa * Dia;
DescontoS.Caption := formatFloat('R$ ###,##0.00', total);
Valors.Caption:=formatFloat('R$ ###,##0.00', Valor - Total)
end;

function TForm1.EliminaFormatacao(sTexto:String):String;
var
iPos : Integer;
iTamanho : Integer;
sTextoSemFormato : String;
sCaractere : String;
sCaracMascaras : String;
begin
Result := sTexto;
if sTexto = ''  then
   begin
   Exit;
   end;
sTextoSemFormato := '';
sCaracMascaras := '.R$%';
iTamanho := Length(sTexto);
for iPos := 1 to iTamanho do
    begin
    sCaractere := Copy(sTexto,iPos,1);
    if Pos(sCaractere,sCaracMascaras) = 0 then
       begin
       sTextoSemFormato := sTextoSemFormato + sCaractere;
       end;
    end;
Result := sTextoSemFormato;
end;

procedure TForm1.CalcDescontoCExecute(Sender: TObject);
Var
N, i,  Total, Taxa, Valor : Real;
Retorno, Tempo: String;
V_Retorno : Extended;
begin
Valor := strtofloat(EliminaFormatacao(ValorD.Text));
Taxa  := strtofloat(EliminaFormatacao(taxaD.Text));
i:= 1 + ( taxa / 100 );

Tempo := floattostr(strtofloat(diasc.Caption)/30);

N := strtofloat( tempo );

//V_Retorno := Power( i , N );
V_Retorno := elevado( i , N );

Total := valor /  V_Retorno ;

DescontoC.Caption := formatFloat('R$ ###,##0.00', Valor - Total );

ValorC.Caption:=formatFloat('R$ ###,##0.00', valor + (total - valor))
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;

if Tela.ActivePage = 'Acrescimo' then
   if key = vk_F2 then dxbutton5click(self);
if Tela.ActivePage = 'Acrescimo' then
   if key = vk_F3 then dxbutton6click(self);
if Tela.ActivePage = 'Acrescimo' then
   if key = vk_F4 then dxbutton12click(self);
if Tela.ActivePage = 'Acrescimo' then
   if key = vk_F5 then dxbutton11click(self);

if Tela.ActivePage = 'Desconto' then
   if key = vk_F4 then dxbutton3click(self);
if Tela.ActivePage = 'Desconto' then
   if key = vk_F2 then dxbutton4click(self);
if Tela.ActivePage = 'Desconto' then
   if key = vk_F3 then dxbutton7click(self);
if Tela.ActivePage = 'Desconto' then
   if key = vk_F5 then dxbutton8click(self);

if key = vk_F4 then Tela.ActivePage:='Inicial';

if Tela.ActivePage = 'Relatorio' then
   if key = vk_F7 then dxbutton9click(self);
if Tela.ActivePage = 'Relatorio' then
   if key = vk_F5 then dxbutton10click(self);

if Tela.ActivePage = 'Prestacao' then
   if key = vk_F2 then dxbutton13click(self);
if Tela.ActivePage = 'Prestacao' then
   if key = vk_F3 then dxbutton14click(self);
if Tela.ActivePage = 'Prestacao' then
   if key = vk_F4 then voltaclick(self);
if Tela.ActivePage = 'Prestacao' then
   if key = vk_F5 then dxbutton15click(self);
end;

procedure TForm1.JurosSExecute(Sender: TObject);
Var
Total, Taxa, Dia, Valor : Real;
Dias : String;
begin
Valor := strtofloat(EliminaFormatacao(ValorJ.Text));
Taxa := strtofloat(EliminaFormatacao(taxaJ.Text))/100;
Dias := floattostr(strtofloat(Jdiasc.Caption)/30);
Dia := strtofloat(dias);
Total := Valor * Taxa * Dia;
JDescontoS.Caption := formatFloat('R$ ###,##0.00', total);
JValors.Caption:=formatFloat('R$ ###,##0.00', Valor + Total);
end;

procedure TForm1.JurosCExecute(Sender: TObject);
Var
N, i,  Total, Taxa, Valor : Real;
Retorno, Tempo: String;
V_Retorno : Extended;
begin
Valor := strtofloat(EliminaFormatacao(ValorJ.Text));
Taxa  := strtofloat(EliminaFormatacao(taxaJ.Text));
i:= 1 + ( taxa / 100 );

Tempo := floattostr(strtofloat(Jdiasc.Caption)/30);

N := strtofloat( tempo );

//V_Retorno := Power( i , n );
V_Retorno := elevado( i , n );

Total := valor *  V_Retorno ;

JDescontoC.Caption := formatFloat('R$ ###,##0.00', total - valor );

JValorC.Caption:=formatFloat('R$ ###,##0.00', valor + (total - valor))
end;

procedure TForm1.DiasJExecute(Sender: TObject);
begin
JDiasC.Caption:=(floattostr(strtodate(PagamentoJ.Text) - strtodate(VencimentoJ.Text)));
JDiasS.Caption:=JDiasC.Caption;
end;

procedure TForm1.dxButton5Click(Sender: TObject);
begin
if (valorj.Text = 'R$ 0,00') or (taxaj.Text = '') or (vencimentoj.Text = '  /  /    ') or (pagamentoj.Text = '  /  /    ') then begin
   showmessage('Preencha todos os campos');
   valorj.SetFocus;
   exit;
end;begin
DiasJExecute(self);
JurosSExecute(self);
JurosCExecute(self);
end;end;

procedure TForm1.PagamentoJExit(Sender: TObject);
begin
if (vencimentoj.Text <> '  /  /    ') and (pagamentoj.Text <> '  /  /    ') then
   DiasJExecute(self);
end;

procedure TForm1.dxButton6Click(Sender: TObject);
begin
Valorj.Value:=0;
taxaj.Clear;
vencimentoj.Clear;
pagamentoj.Clear;
Jdiasc.Caption:='';
jdescontoc.Caption:='';
jvalorc.Caption:='';
jdiass.Caption:='';
jdescontos.Caption:='';
jvalors.Caption:='';
valorj.SetFocus;
end;

procedure TForm1.dxButton7Click(Sender: TObject);
begin
ValorD.Value:=0;
taxaD.Clear;
maskedit1.Clear;
maskedit2.Clear;
diasc.Caption:='';
descontoc.Caption:='';
valorc.Caption:='';
diass.Caption:='';
descontos.Caption:='';
valors.Caption:='';
valorD.SetFocus;
end;

procedure TForm1.MaskEdit2Exit(Sender: TObject);
begin
if (maskedit1.Text <> '  /  /    ') and (maskedit2.Text <> '  /  /    ') then
   DiasExecute(self);
end;

procedure TForm1.dxButton1Click(Sender: TObject);
begin
tela.ActivePage:='Desconto';
end;

procedure TForm1.dxButton2Click(Sender: TObject);
begin
tela.ActivePage:='Acrescimo';
end;

procedure TForm1.dxButton8Click(Sender: TObject);
begin
if (valorD.Text = 'R$ 0,00') or (taxaD.Text = '') or (maskedit1.Text = '  /  /    ') or (maskedit2.Text = '  /  /    ') then begin
   showmessage('Preencha todos os campos');
   valorD.SetFocus;
   exit;
end;begin
pop.Popup(form1.Left + 283 , dxbutton8.ClientOrigin.Y + 24);
end;end;

procedure TForm1.ImprimirDescontoGeral1Click(Sender: TObject);
Var Soma : real;
begin
memo.Clear;
memo.Lines.Add('');
memo.Lines.Add('                    CÁLCULO DE DESCONTO');
soma:=strtofloat(valord.Text);
memo.Lines.Add('');
memo.Lines.Add('  Dados para Cálculo');
memo.Lines.Add('');
memo.Lines.Add('  Valor Original:     ' + formatFloat('R$ ###,##0.00', soma));
memo.Lines.Add('  Taxa:               ' + taxad.Text + ' %');
memo.Lines.Add('  Data de Vencimento: ' + maskedit1.Text);
memo.Lines.Add('  Data de Pagamento:  ' + maskedit2.Text);
memo.Lines.Add('  Dias  Antecipados:  ' + diasc.Caption);
memo.Lines.Add('');
memo.Lines.Add('  Resultados');
memo.Lines.Add('');
memo.Lines.Add('  Desconto Simples');
memo.Lines.Add('  Desconto:           ' + descontos.Caption);
memo.Lines.Add('  Valor Atual:        ' + valors.Caption);
memo.Lines.Add('');
memo.Lines.Add('  Desconto Composto');
memo.Lines.Add('  Desconto:           ' + descontoc.Caption);
memo.Lines.Add('  Valor Atual:        ' + valorc.Caption);
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('  Departamento    :   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Funcionário:   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Gerente:       __________________________________');
LTela.Caption:='1';
Tela.ActivePage:='Relatorio';
xipanel1.SetFocus;
end;

procedure TForm1.ValorDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_UP then
PostMessage(Handle, WM_NEXTDLGCTL, 9, 0)
ELSE
if Key = VK_DOWN then
PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Tela.ActivePage:='Inicial';

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
groupbox1.SetFocus;
end;

procedure TForm1.dxButton3Click(Sender: TObject);
begin
dxbutton7click(self);
Tela.ActivePage:='Inicial';
end;

procedure TForm1.dxButton9Click(Sender: TObject);
begin
if lTela.Caption = '1' then
   tela.ActivePage:='Desconto';
if lTela.Caption = '2' then
   tela.ActivePage:='Acrescimo';
if lTela.Caption = '3' then
   tela.ActivePage:='Prestacao';
end;

procedure TForm1.ImprimirDescontoSimples1Click(Sender: TObject);
Var Soma : real;
begin
memo.Clear;
memo.Lines.Add('');
memo.Lines.Add('                    CÁLCULO DE DESCONTO');
soma:=strtofloat(valord.Text);
memo.Lines.Add('');
memo.Lines.Add('  Dados para Cálculo');
memo.Lines.Add('');
memo.Lines.Add('  Valor Original:     ' + formatFloat('R$ ###,##0.00', soma));
memo.Lines.Add('  Taxa:               ' + taxad.Text + ' %');
memo.Lines.Add('  Data de Vencimento: ' + maskedit1.Text);
memo.Lines.Add('  Data de Pagamento:  ' + maskedit2.Text);
memo.Lines.Add('  Dias  Antecipados:  ' + diasc.Caption);
memo.Lines.Add('');
memo.Lines.Add('  Resultado');
memo.Lines.Add('');
memo.Lines.Add('  Desconto Simples');
memo.Lines.Add('  Desconto:           ' + descontos.Caption);
memo.Lines.Add('  Valor Atual:        ' + valors.Caption);
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('  Departamento    :   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Funcionário:   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Gerente:       __________________________________');
LTela.Caption:='1';
Tela.ActivePage:='Relatorio';
xipanel1.SetFocus;
end;

procedure TForm1.ImprimirDescontoComposto1Click(Sender: TObject);
Var Soma : real;
begin
memo.Clear;
memo.Lines.Add('');
memo.Lines.Add('                    CÁLCULO DE DESCONTO');
soma:=strtofloat(valord.Text);
memo.Lines.Add('');
memo.Lines.Add('  Dados para Cálculo');
memo.Lines.Add('');
memo.Lines.Add('  Valor Original:     ' + formatFloat('R$ ###,##0.00', soma));
memo.Lines.Add('  Taxa:               ' + taxad.Text + ' %');
memo.Lines.Add('  Data de Vencimento: ' + maskedit1.Text);
memo.Lines.Add('  Data de Pagamento:  ' + maskedit2.Text);
memo.Lines.Add('  Dias  Antecipados:  ' + diasc.Caption);
memo.Lines.Add('');
memo.Lines.Add('  Resultados');
memo.Lines.Add('');
memo.Lines.Add('  Desconto Composto');
memo.Lines.Add('  Desconto:           ' + descontoc.Caption);
memo.Lines.Add('  Valor Atual:        ' + valorc.Caption);
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('  Departamento    :   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Funcionário:   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Gerente:       __________________________________');
LTela.Caption:='1';
Tela.ActivePage:='Relatorio';
xipanel1.SetFocus;
end;

procedure TForm1.dxButton11Click(Sender: TObject);
begin
if (valorJ.Text = 'R$ 0,00') or (taxaJ.Text = '') or (vencimentoj.Text = '  /  /    ') or (pagamentoj.Text = '  /  /    ') then begin
   showmessage('Preencha todos os campos');
   valorJ.SetFocus;
   exit;
end;begin
popJ.Popup(form1.Left + 283 , dxbutton11.ClientOrigin.Y + 24);
end;
end;

procedure TForm1.dxButton12Click(Sender: TObject);
begin
dxbutton6click(self);
Tela.ActivePage:='Inicial';
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
Var Soma : real;
begin
memo.Clear;
memo.Lines.Add('');
memo.Lines.Add('                    CÁLCULO DE JURO');
soma:=strtofloat(valorJ.Text);
memo.Lines.Add('');
memo.Lines.Add('  Dados para Cálculo');
memo.Lines.Add('');
memo.Lines.Add('  Valor Original:     ' + formatFloat('R$ ###,##0.00', soma));
memo.Lines.Add('  Taxa:               ' + taxaJ.Text + ' %');
memo.Lines.Add('  Data de Vencimento: ' + vencimentoj.Text);
memo.Lines.Add('  Data de Pagamento:  ' + pagamentoj.Text);
memo.Lines.Add('  Dias  Antecipados:  ' + Jdiasc.Caption);
memo.Lines.Add('');
memo.Lines.Add('  Resultados');
memo.Lines.Add('');
memo.Lines.Add('  Juro Simples');
memo.Lines.Add('  Desconto:           ' + Jdescontos.Caption);
memo.Lines.Add('  Valor Atual:        ' + Jvalors.Caption);
memo.Lines.Add('');
memo.Lines.Add('  Juro Composto');
memo.Lines.Add('  Desconto:           ' + Jdescontoc.Caption);
memo.Lines.Add('  Valor Atual:        ' + Jvalorc.Caption);
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('  Departamento    :   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Funcionário:   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Gerente:       __________________________________');
LTela.Caption:='2';
Tela.ActivePage:='Relatorio';
xipanel1.SetFocus;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
Var Soma : real;
begin
memo.Clear;
memo.Lines.Add('');
memo.Lines.Add('                    CÁLCULO DE JURO');
soma:=strtofloat(valorJ.Text);
memo.Lines.Add('');
memo.Lines.Add('  Dados para Cálculo');
memo.Lines.Add('');
memo.Lines.Add('  Valor Original:     ' + formatFloat('R$ ###,##0.00', soma));
memo.Lines.Add('  Taxa:               ' + taxaJ.Text + ' %');
memo.Lines.Add('  Data de Vencimento: ' + vencimentoj.Text);
memo.Lines.Add('  Data de Pagamento:  ' + pagamentoj.Text);
memo.Lines.Add('  Dias  Antecipados:  ' + Jdiasc.Caption);
memo.Lines.Add('');
memo.Lines.Add('  Resultados');
memo.Lines.Add('');
memo.Lines.Add('  Juro Simples');
memo.Lines.Add('  Desconto:           ' + Jdescontos.Caption);
memo.Lines.Add('  Valor Atual:        ' + Jvalors.Caption);
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('  Departamento    :   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Funcionário:   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Gerente:       __________________________________');
LTela.Caption:='2';
Tela.ActivePage:='Relatorio';
xipanel1.SetFocus;

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
Var Soma : real;
begin
memo.Clear;
memo.Lines.Add('');
memo.Lines.Add('                    CÁLCULO DE JURO');
soma:=strtofloat(valorJ.Text);
memo.Lines.Add('');
memo.Lines.Add('  Dados para Cálculo');
memo.Lines.Add('');
memo.Lines.Add('  Valor Original:     ' + formatFloat('R$ ###,##0.00', soma));
memo.Lines.Add('  Taxa:               ' + taxaJ.Text + ' %');
memo.Lines.Add('  Data de Vencimento: ' + vencimentoj.Text);
memo.Lines.Add('  Data de Pagamento:  ' + pagamentoj.Text);
memo.Lines.Add('  Dias  Antecipados:  ' + Jdiasc.Caption);
memo.Lines.Add('');
memo.Lines.Add('  Resultados');
memo.Lines.Add('');
memo.Lines.Add('  Juro Composto');
memo.Lines.Add('  Desconto:           ' + Jdescontoc.Caption);
memo.Lines.Add('  Valor Atual:        ' + Jvalorc.Caption);
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('  Departamento    :   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Funcionário:   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Gerente:       __________________________________');
LTela.Caption:='2';
Tela.ActivePage:='Relatorio';
xipanel1.SetFocus;

end;

procedure TForm1.dxButton10Click(Sender: TObject);
begin
if (printdialog1.execute)then
memo.print(text);
end;

procedure TForm1.ValorJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_UP then
PostMessage(Handle, WM_NEXTDLGCTL, 9, 0)
ELSE
if Key = VK_DOWN then
PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TForm1.dxButton13Click(Sender: TObject);
Var
Prest, R1, R2, Total, i, n, Valor : Extended;
begin
Valor := strtofloat(EliminaFormatacao(ValorP.Text));

n := strtofloat(Prestacao.Text);

i  := (strtofloat(taxaP.Text) / 100) + 1;

R1 := (Power( i , n ) - 1) ;

R2:= (i - 1) * (power ( i , n ));

Total:= R1 / R2;

Prest := valor / Total;

LJurosC.Caption := formatFloat('R$ ###,##0.00', (Prest * n) - valor);

LValorC.Caption:=formatFloat('R$ ###,##0.00', Prest * n);

LPrestacaoC.Caption:=formatFloat('R$ ###,##0.00', Prest);
end;

procedure TForm1.dxButton17Click(Sender: TObject);
begin
ValorP.Value:=0;
taxaP.Clear;
Prestacao.Clear;
LPrestacaoC.Caption:='';
LJurosC.Caption:='';
LValorC.Caption:='';
tela.ActivePage:='Prestacao';
valorP.SetFocus;
end;

procedure TForm1.dxButton14Click(Sender: TObject);
begin
ValorP.Value:=0;
taxaP.Clear;
Prestacao.Clear;
LPrestacaoC.Caption:='';
LJurosC.Caption:='';
LValorC.Caption:='';
valorP.SetFocus;
end;

procedure TForm1.VoltaClick(Sender: TObject);
begin
ValorP.Value:=0;
taxaP.Clear;
Prestacao.Clear;
LPrestacaoC.Caption:='';
LJurosC.Caption:='';
LValorC.Caption:='';
Tela.ActivePage:='Inicial';
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
Var Soma : real;
begin
memo.Clear;
memo.Lines.Add('');
memo.Lines.Add('                    CÁLCULO DE PRESTAÇÕES');
soma:=strtofloat(valorP.Text);
memo.Lines.Add('');
memo.Lines.Add('  Dados para Cálculo');
memo.Lines.Add('');
memo.Lines.Add('  Valor Original:     ' + formatFloat('R$ ###,##0.00', soma));
memo.Lines.Add('  Taxa:               ' + taxaP.Text + ' %');
memo.Lines.Add('  Qtde de Prestações: ' + Prestacao.Text);
memo.Lines.Add('');
memo.Lines.Add('  Resultados');
memo.Lines.Add('');
memo.Lines.Add('  Prestação:          ' + LPrestacaoC.Caption);
memo.Lines.Add('  Juros a Pagar:      ' + LJurosC.Caption);
memo.Lines.Add('  Valor Final:        ' + LValorC.Caption);
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('');
memo.Lines.Add('  Departamento    :   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Funcionário:   __________________________________');
memo.Lines.Add('');
memo.Lines.Add('  Ass. Gerente:       __________________________________');
LTela.Caption:='3';
Tela.ActivePage:='Relatorio';
xipanel1.SetFocus;

end;

procedure TForm1.dxButton15Click(Sender: TObject);
begin
if (valorP.Text = 'R$ 0,00') or (taxaP.Text = '') or (prestacao.Text = ' ') then begin
   showmessage('Preencha todos os campos');
   valorP.SetFocus;
   exit;
end;begin
popP.Popup(form1.Left + 283 , dxbutton15.ClientOrigin.Y + 24);
end;
end;


function TForm1.elevado(a,b: real): real;
begin
      elevado := exp(b *ln(a) );
end;

procedure TForm1.PrestacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_UP then
PostMessage(Handle, WM_NEXTDLGCTL, 9, 0)
ELSE
if Key = VK_DOWN then
PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
calc.Execute;
end;

end.
