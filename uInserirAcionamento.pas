unit uInserirAcionamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, DBCtrls, Mask, Buttons, Grids,
  ucLayAcionamento,
  ucLayMOTIVOS_ACIONAMENTOS,
  ucLayCobranca,
  uclayTelefones, Parametros,
  DBGrids, dbcgrids, ADODB;

type
  TfrmInserirAcionamento = class(TForm)
    pnTop: TPanel;
    pnCabecalho: TPanel;
    Label1: TLabel;
    gbAcionamento: TGroupBox;
    pnTopAcionamento: TPanel;
    sbInserirAcionamento: TSpeedButton;
    mmAcionamento: TMemo;
    cbMotivos: TComboBox;
    cbTelefones: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sbInserirAcionamentoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbMotivosClick(Sender: TObject);
  private
    FAcionamento : TACIONAMENTO;
    FSMotivos_Acionamentos : TSimplesMOTIVOS_ACIONAMENTOS;
    FSCobranca : TSimplesCOBRANCA;
    FSTelefones : TSimplesTELEFONES;
    cChamado : LongInt;
    cCobranca : LongInt;
    procedure CentralizarForm;
    procedure CarregarMotivos;
    procedure plAbrirTabelas;
    procedure plFecharTabelas;
    procedure plCarregarTelefones;
  public
    { Public declarations }
  end;

  procedure CallInserirAcionamento(Cobranca, Chamado : LongInt);

implementation
{$R *.dfm}

procedure CallInserirAcionamento(Cobranca, Chamado : LongInt);
var
  frmInserirAcionamento: TfrmInserirAcionamento;
Begin
  frmInserirAcionamento := TfrmInserirAcionamento.Create(Application);
  Try
    If   Cobranca > 0 Then
         Begin
           frmInserirAcionamento.cCobranca := Cobranca;
           frmInserirAcionamento.cChamado := Chamado;
           frmInserirAcionamento.plCarregarTelefones;
         End;
    frmInserirAcionamento.ShowModal;
  Finally
    frmInserirAcionamento.Free;
  End;
End;

procedure TfrmInserirAcionamento.FormCreate(Sender: TObject);
begin
  plAbrirTabelas;
  CentralizarForm;
  CarregarMotivos;
end;

procedure TfrmInserirAcionamento.sbInserirAcionamentoClick(Sender: TObject);
Var
  IdTelefone : LongInt;
  ADOCommand : TADOCommand;
begin
  IdTelefone := 0;
  FSCobranca.COBRANCA := cCobranca;
  FSCobranca.CarregaSQL;
  FSTelefones.CODIGO_DEVEDOR := FSCobranca.DEVEDOR;
  FSTelefones.CarregaSQL;
  While Not FSTelefones.Eof Do
  Begin
    If    Trim(FSTelefones.NUMERO_TELEFONE) = cbTelefones.Text Then
          Begin
            IdTelefone := FSTelefones.ITEM_TELEFONE;
            Break;
          End;
    FSTelefones.Next;
  End;
  //FAcionamento.Carrega(False);
  ADOCommand:=TADOCommand.Create(nil);
  Try
    if   MessageDlg('Tem Certeza Que deseja Inserir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         Begin
//           mexer aqui para aumentar o desempenho
//           FAcionamento.Insert;
//           FAcionamento.IDDEVEDOR        := FSCobranca.DEVEDOR;
//           FAcionamento.IDCHAMADO        := cChamado;
//           FAcionamento.COBRANCA         := cCobranca;
//           FAcionamento.IDTELEFONE       := IdTelefone;
//           FAcionamento.DATA_ACIONAMENTO := Now;
//           FAcionamento.HISTORICO        := mmAcionamento.Lines.Text;
//           FAcionamento.Post;

           ADOCommand.Connection := TUniqueParametros.GetParametros.Conexao;
           ADOCommand.Parameters.Clear;
           ADOCommand.CommandText:='INSERT INTO ACIONAMENTO (IDDEVEDOR, IDCHAMADO, COBRANCA, IDTELEFONE, DATA_ACIONAMENTO, HISTORICO, USUARIO_INCLUSAO, DATA_INCLUSAO) VALUES (:IDDEVEDOR, :IDCHAMADO, :COBRANCA, :IDTELEFONE, :DATA_ACIONAMENTO, :HISTORICO, :USUARIO_INCLUSAO, :DATA_INCLUSAO)';
           ADOCommand.ParamCheck:=False;
           ADOCommand.Parameters.ParamByName('IDDEVEDOR').Value        := FSCobranca.DEVEDOR;
           ADOCommand.Parameters.ParamByName('IDCHAMADO').Value        := cChamado;
           ADOCommand.Parameters.ParamByName('COBRANCA').Value         := cCobranca;
           ADOCommand.Parameters.ParamByName('IDTELEFONE').Value       := IdTelefone;
           ADOCommand.Parameters.ParamByName('DATA_ACIONAMENTO').Value := Now;
           ADOCommand.Parameters.ParamByName('HISTORICO').Value        := mmAcionamento.Lines.Text;
           ADOCommand.Parameters.ParamByName('USUARIO_INCLUSAO').Value := TUniqueParametros.GetParametros.Usuario;
           ADOCommand.Parameters.ParamByName('DATA_INCLUSAO').Value    := Now;
           ADOCommand.Execute;
         End;
    mmAcionamento.Lines.Clear;
  Except
    On E: Exception Do
       Begin
         //FAcionamento.Cancel;
         ADOCommand.Cancel;
         ShowMessage(E.Message);
       End;
  End;
    ADOCommand.Free;
end;

procedure TfrmInserirAcionamento.CentralizarForm;
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

procedure TfrmInserirAcionamento.CarregarMotivos;
begin
  FSMotivos_Acionamentos.CarregaSQL;
  While Not FSMotivos_Acionamentos.Eof Do
    Begin
      cbMotivos.Items.Add(FSMotivos_Acionamentos.DESCRICAO);
      FSMotivos_Acionamentos.Next;
    End;
end;

procedure TfrmInserirAcionamento.plAbrirTabelas;
begin
  FAcionamento := TACIONAMENTO.Create(Self);
  FSMotivos_Acionamentos := TSimplesMOTIVOS_ACIONAMENTOS.Create(Self);
  FSCobranca := TSimplesCOBRANCA.Create(Self);
  FSTelefones := TSimplesTELEFONES.Create(Self);
end;

procedure TfrmInserirAcionamento.plFecharTabelas;
begin
  FAcionamento.Free;
  FSMotivos_Acionamentos.Free;
  FSCobranca.Free;
  FSTelefones.Free;
end;

procedure TfrmInserirAcionamento.FormDestroy(Sender: TObject);
begin
  plFecharTabelas;
end;

procedure TfrmInserirAcionamento.plCarregarTelefones;
begin
  FSCobranca.COBRANCA := cCobranca;
  FSCobranca.CarregaSQL;
  FSTelefones.CODIGO_DEVEDOR := FSCobranca.DEVEDOR;
  FSTelefones.CarregaSQL;
  FSTelefones.First;
  While Not FSTelefones.Eof Do
  Begin
    cbTelefones.Items.Add(FSTelefones.NUMERO_TELEFONE);
    FSTelefones.Next;
  End;
end;

procedure TfrmInserirAcionamento.cbMotivosClick(Sender: TObject);
begin
  mmAcionamento.Lines.Add(cbMotivos.Text);
end;

end.
