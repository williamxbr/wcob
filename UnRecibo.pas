unit UnRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, DB, DBClient;

type
  TFrmRecibo = class(TForm)
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    Label11: TLabel;
    Edit10: TEdit;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    MaskEdit1: TMaskEdit;
    Memo1: TMemo;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Edit6: TEdit;
    Edit11: TEdit;
    Label14: TLabel;
    Edit12: TEdit;
    CDS: TClientDataSet;
    CDSN_RECIBO: TIntegerField;
    CDSVALOR: TStringField;
    CDSRECEBE: TStringField;
    CDSENDERECO: TStringField;
    CDSCIDADE: TStringField;
    CDSREFERENTE: TBlobField;
    CDSNOME_REM: TStringField;
    CDSENDERECO_REM: TStringField;
    CDSCIDADE_REM: TStringField;
    CDSDATA: TDateField;
    CDSDOC_REM: TStringField;
    CDSDT_EXTENSO: TStringField;
    CDSVLR_EXTENSO: TStringField;
    CDSN_AGENCIA: TStringField;
    CDSN_CONTA: TStringField;
    CDSN_CHEQUE: TStringField;
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function ValorPorExtenso (valor: real): string;
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    procedure ProcessaMsg(var Msg: TMsg; var handled: Boolean) ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRecibo: TFrmRecibo;
  busca_dt_extenso : string ;
  busca_vl_extenso : string ;

implementation

uses UnGeraRecibo, MaskUtils;

{$R *.dfm}

procedure TFrmRecibo.Edit2Exit(Sender: TObject);
begin
     busca_vl_extenso := valorporExtenso(strtofloat(edit2.text));
     edit2.text := FormatFloat('##,###,##0.00',strtofloat(edit2.text)) ;
end;

procedure TFrmRecibo.Edit1Exit(Sender: TObject);
begin
    Edit1.text := formatfloat('000000',strtofloat(edit1.text)) ;
end;

procedure TFrmRecibo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       Action := caFree ;
end;

procedure TFrmRecibo.BitBtn3Click(Sender: TObject);
var
    texto : TMemoryStream ;
begin
    texto := TMemoryStream.create ;
    Memo1.Lines.SaveToStream(texto) ;

      if MaskEdit1.Text = '  /  /    ' then
      begin
         ShowMessage('Campo Data: Obrigatório');
         maskedit1.SetFocus ;
         abort
      end;

      CDS.Append ;
      CDS.Fieldbyname('n_recibo').AsInteger := strtoint(Edit1.text);
      CDS.Fieldbyname('valor').AsString := Edit2.text ;
      CDS.Fieldbyname('recebe').AsString := edit3.text ;
      CDS.Fieldbyname('endereco').AsString := edit4.text ;
      CDS.Fieldbyname('cidade').AsString := edit5.text ;
      TBlobField(CDS.Fieldbyname('referente')).loadfromstream(texto) ;
      CDS.Fieldbyname('nome_rem').AsString := edit7.text ;
      CDS.Fieldbyname('endereco_rem').AsString := edit8.text ;
      CDS.Fieldbyname('cidade_rem').AsString := edit9.text ;
      CDS.Fieldbyname('data').AsDateTime := StrToDate(MaskEdit1.text);
      CDS.Fieldbyname('doc_rem').AsString := edit10.text ;
      CDS.FieldByName('dt_extenso').AsString := busca_dt_extenso ;
      CDS.FieldByName('vlr_extenso').AsString := busca_vl_extenso ;
      CDS.FieldByName('n_agencia').AsString := edit6.Text ;
      CDS.FieldByName('n_conta').AsString := edit11.text ;
      CDS.FieldByName('n_Cheque').AsString := edit12.text ;
      CDS.Post;
      application.createform(TFrmGeraRecibo,FrmGeraRecibo) ;
      FrmGeraRecibo.RLReport1.preview()
   end;

procedure TFrmRecibo.ProcessaMsg(var Msg: TMsg; var handled: Boolean);
begin
     if Msg.message = WM_KEYDOWN then
     begin
        if Msg.wParam = VK_Down then
           Msg.wParam := VK_Tab;
        if Msg.wParam = VK_UP then
        begin
          Msg.wParam := VK_CLEAR;
          Screen.ActiveForm.Perform(WM_NextDlgCtl,1,0);
        end;
      end;
      if Msg.wParam = VK_Return then
        Msg.wParam := VK_Tab;
    end;

procedure TFrmRecibo.FormShow(Sender: TObject);
begin
       Application.OnMessage := ProcessaMsg ;
end;

procedure TFrmRecibo.MaskEdit1Exit(Sender: TObject);
begin
      busca_dt_extenso :=formatdatetime('dd',Date)+
        ' de ' + formatdatetime('mmmm',Date)+
        ' de ' + formatdatetime('yyyy',Date);
end;

 
function TFrmRecibo.ValorPorExtenso(valor: real): string;
var
 Centavos, Centena, Milhar, Milhao, Texto, msg: string;

const
  Unidades: array[1..9] of string = ('Um', 'Dois', 'Três', 'Quatro', 'Cinco',
                                    'Seis', 'Sete', 'Oito', 'Nove');
  Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze',
                               'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
  Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta',
                                   'Cinqüenta', 'Sessenta', 'Setenta',
                                   'Oitenta', 'Noventa');
  Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos',
                                    'Quatrocentos', 'Quinhentos', 'Seiscentos',
                                    'Setecentos', 'Oitocentos', 'Novecentos');

function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
    if Expressao then
      Result:=CasoVerdadeiro
    else
      Result:=CasoFalso;
  end;

  function MiniExtenso (trio: string): string;
  var
    Unidade, Dezena, Centena: string;
  begin
    Unidade:='';
    Dezena:='';
    Centena:='';

    if (trio[2]='1') and (trio[3]<>'0') then
    begin
      Unidade:=Dez[strtoint(trio[3])];
      Dezena:='';
    end
    else
    begin
      if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
      if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
    end;

    if (trio[1]='1') and (Unidade='') and (Dezena='') then
      Centena:='Cem'
    else
      if trio[1]<>'0' then
        Centena:=Centenas[strtoint(trio[1])]
      else
        Centena:='';
        Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
            + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;

  end;//fim da função MiniExtenso

begin
  if (valor>999999.99) or (valor<0) then
  begin
    msg:='O valor está fora do intervalo permitido.';
    msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
    msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
    showmessage(msg);
    Result:='';
    exit;
  end;

  if valor=0 then
  begin
    Result:='';
    Exit;
  end;

  Texto:=formatfloat('000000.00',valor);
  Milhar:=MiniExtenso(Copy(Texto,1,3));
  Centena:=MiniExtenso(Copy(Texto,4,3));
  Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
  Result:=Milhar;

  if Milhar<>'' then
    if copy(texto,4,3)='000' then
    Result:=Result+' Mil Reais'
    else
    Result:=Result+' Mil, e ';// o "e" do if abaixo foi substituido por este

 {if (((copy(texto,4,2)='00') and (Milhar<>'')
    and (copy(texto,6,1)<>'0')) or (centavos=''))
    and (Centena<>'') then
      Result:=Result+' e ';}

  if (Milhar+Centena <>'') then Result:=Result+Centena;

  if (Milhar='') and (copy(texto,4,3)='001') then
    Result:=Result+' Real'

  else
    if (copy(texto,4,3)<>'000') then
      Result:=Result+' Reais';

    if Centavos='' then
    begin
      Result:=Result+'.';
      Exit;
    end
    else
    begin
      if Milhar+Centena='' then
        Result:=Centavos
      else
        Result:=Result+', e '+Centavos;

    if (copy(texto,8,2)='01') and (Centavos<>'') then
      Result:=Result+' Centavo.'
    else
    Result:=Result+' Centavos.';
  end;

end;


procedure TFrmRecibo.BitBtn2Click(Sender: TObject);
var
i : Integer;
begin
      for i := 0 to ComponentCount -1 do
      if Components[i] is TEdit then
      begin
       TEdit(Components[i]).Text := '';
      end;
    MaskEdit1.Clear ;
    Memo1.Clear ; 
    edit1.SetFocus ;
end;


procedure TFrmRecibo.BitBtn1Click(Sender: TObject);
begin
     Application.Terminate ; 
end;

end.
