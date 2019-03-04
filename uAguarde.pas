{$IMPORTEDDATA ON}
unit uAguarde;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Gauges, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  Menus,
  cxProgressBar, cxButtons, cxImage, cxLabel, cxGroupBox,
  GifImg, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFSBWait = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    Gauge1: TcxProgressBar;
    Timer1: TTimer;
    cxLabel1: TcxLabel;
    Image1: TImage;
    procedure cxButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    fCancelou : Boolean;
    fConfirmarCancelamento : Boolean;
    fMsgConfCancelamento   : String;
  public
    { Public declarations }
  end;

  type
    TCancelWaitCallBack = procedure of object;

  procedure SetaProcedureCancelamento(Cancelamento: TCancelWaitCallBack);

  procedure ShowWait(Msg: String);
  procedure MensWait(Msg: String);
  procedure TitleWait(Title: String);
  procedure FormStyleWait(Style: TFormStyle);
  procedure HideWait;
  procedure HabilitaCancelamentoWait;
  function  CancelouWait : Boolean;
  procedure GaugeWait(pProgress: Double);
  procedure SuspendeWait;
  procedure ReativaWait;
  procedure ConfirmaCancelamentoWait(csMsgConfCancelamento:String);

implementation

{$R *.DFM}

var
  FSBWait: TFSBWait;
  FCancelamento: TCancelWaitCallBack;

procedure SetaProcedureCancelamento(Cancelamento: TCancelWaitCallBack);
begin
  FCancelamento := Cancelamento;
end;

procedure ShowWait(Msg: String);
var
  GIF : TGIFImage;
begin
  Screen.Cursor:=crHourGlass;
  if   FSBWait = Nil then
       begin
         FSBWait:=TFSBWait.Create(Application);
       end;
  if FileExists(ExtractFilePath(ParamStr(0)) + '\carrega.gif') then
  begin
      GIF := TGIFImage.Create;
      GIF.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\carrega.gif');
      GIF.AnimationSpeed := 1000;
      GIF.Animate := True;
      GIF.Transparent := True;
  end;
  FSBWait.Height := 42;
  FSBWait.Image1.Picture.Assign(GIF);
  FSBWait.cxLabel1.Caption := Msg;
  FSBWait.fCancelou              := False;
  FSBWait.fConfirmarCancelamento := False;
  FSBWait.fMsgConfCancelamento   := 'Deseja cancelar o processo?';
  FSBWait.Show;
  FSBWait.Update;
  Sleep(1000);
end;

procedure MensWait(Msg: String);
begin
  if FSBWait <> nil then
  begin
    FSBWait.Gauge1.Properties.Text := Msg;
    Application.ProcessMessages;
  end;
end;

procedure TitleWait(Title: String);
begin
  if FSBWait <> nil then
  begin
    FSBWait.Caption := Title;
    FSBWait.Update;
  end;
end;

procedure FormStyleWait(Style: TFormStyle);
begin
  if FSBWait <> nil then
  begin
    FSBWait.FormStyle := Style;
    FSBWait.Update;
  end;
end;

procedure HideWait;
begin
  Screen.Cursor:=crDefault;
  FSBWait.Free;
  FSBWait:=Nil;
end;

procedure HabilitaCancelamentoWait;
begin
  FSBWait.cxButton1.Visible := True;
  Application.ProcessMessages;
end;

function CancelouWait : Boolean;
begin
  Application.ProcessMessages;
  if  FSBWait <> nil Then
      Result:= FSBWait.fCancelou
  else
      Result:= False;
end;

procedure GaugeWait(pProgress: Double);
begin
  If   FSBWait <> nil Then
       Begin
         If   ((pProgress = 0) And FSBWait.Gauge1.Visible)
         Or   ((pProgress > 0) And (Not FSBWait.Gauge1.Visible)) Then
              Begin
                FSBWait.Gauge1.Visible:= pProgress > 0;
                FSBWait.Gauge1.Update;
              End;
         FSBWait.Gauge1.Position:= pProgress;
         Application.ProcessMessages;
       End;
end;

procedure SuspendeWait;
begin
  If   FSBWait <> nil Then
       FSBWait.Hide;
end;

procedure ReativaWait;
begin
  If   FSBWait <> nil Then
       FSBWait.Show;
end;

procedure ConfirmaCancelamentoWait(csMsgConfCancelamento:String);
begin
  FSBWait.fConfirmarCancelamento:= True;
  If   csMsgConfCancelamento <> '' Then
       FSBWait.fMsgConfCancelamento:= csMsgConfCancelamento;
end;

procedure TFSBWait.cxButton1Click(Sender: TObject);
var lbCancelar : Boolean;
begin
  If   fConfirmarCancelamento Then
       Begin
         SuspendeWait;
         lbCancelar:= MessageDlg(fMsgConfCancelamento, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
         ReativaWait;
       End
  Else
       lbCancelar:= True;

  If   lbCancelar Then
       Begin
         fCancelou:= True;
         If   Assigned(FCancelamento) Then
              FCancelamento;
       End;
end;

procedure TFSBWait.Timer1Timer(Sender: TObject);
begin
  Application.ProcessMessages;
end;

initialization
  FSBWait:=Nil;
end.

