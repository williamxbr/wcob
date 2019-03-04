(*******************************************************************)
(* FreeBOLETO                                                      *)
(*******************************************************************)
(* Autor original: Carlos H. Cantu                                 *)
(*                                                                 *)
(* LICENÇA                                                         *)
(*                                                                 *)
(*    1. O FreeBoleto pode ser distribuído e utilizado livremente  *)
(*       com qualquer tipo de projeto, comercial ou não.           *)
(*    2. Componentes derivados do código do FreeBoleto não podem   *)
(*       ser vendidos e devem manter os créditos originais, e devem*)
(*       estar compatíveis com essa licença.                       *)
(*    3. Qualquer alteração ou melhoria no código do FreeBoleto    *)
(*       deve ser enviada ao autor para ser avaliada e, se         *)
(*       possível, incorporada ao código oficial do componente.    *)
(*    4. A inclusão do suporte de novos bancos ao FreeBoleto deve  *)
(*       ser notificada ao autor, enviando juntamente o código da  *)
(*       unit do banco em questão. A criação de uma nova unit de   *)
(*       suporte a um novo banco deverá ser feita em conjunto com  *)
(*       a criação dos testes unitários (DUNITs) necessários para  *)
(*       garantir o correto funcionamento das rotinas.             *)
(*    5. O autor não se responsabiliza por qualquer dano ou        *)
(*       qualquer outro tipo de problema originado pela utilização *)
(*       desse componente, se isentando de qualquer                *)
(*       responsabilidade sobre a utilização do mesmo.             *)
(*                                                                 *)
(* Mais informações sobre a licença e utilização estão no arquivo  *)
(* Leiame.html, que deve ser distribuído com todas as versões      *)
(* componente.                                                     *)
(*                                                                 *)
(*******************************************************************)
unit uFreeBoletoImage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Menus, uFreeBoleto,
  ExtDlgs, ActnList, ComCtrls, ToolWin, ImgList;

type
  TFreeBoletoImagem = class;

  TfrmFreeBoletoImg = class(TForm)
    ScrollBox1: TScrollBox;
    BMPBoleto: TImage;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Salvar1: TMenuItem;
    SaveImg: TSavePictureDialog;
    CopiarparaoClipboard1: TMenuItem;
    PrinterSetup: TPrinterSetupDialog;
    ConfigurarImpressora1: TMenuItem;
    N1: TMenuItem;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    tbImprimir: TToolButton;
    tbPrintSetup: TToolButton;
    tbSaveImage: TToolButton;
    tbCopyImg: TToolButton;
    ActionList1: TActionList;
    ActionImprimir: TAction;
    ActionConfigurarImpressora: TAction;
    ActionSalvarImagem: TAction;
    ActionCopiar: TAction;
    tbAnterior: TToolButton;
    tbProximo: TToolButton;
    ActionAnterior: TAction;
    ActionProxima: TAction;
    PrintDlg: TPrintDialog;
    ToolButton1: TToolButton;
    ActionFecharJanela: TAction;
    TrackBar1: TTrackBar;
    TrackTimer: TTimer;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure FormResize(Sender: TObject);
    procedure ActionImprimirExecute(Sender: TObject);
    procedure ActionConfigurarImpressoraExecute(Sender: TObject);
    procedure ActionSalvarImagemExecute(Sender: TObject);
    procedure ActionCopiarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionAnteriorExecute(Sender: TObject);
    procedure ActionProximaExecute(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure ActionFecharJanelaExecute(Sender: TObject);
    procedure TrackTimerTimer(Sender: TObject);
  private
    BoletoImagem: TFreeBoletoImagem;
    OriginalBitMap: TPicture;
    LastTrackMove: TDateTime;
    procedure BltTBitmapAsDib(DestDc: hdc; x, y, Width, Height: integer; bm: TBitmap);
  public
    procedure PrintBoleto;
  end;

  TFreeBoletoImagem = class(TComponent)
  private
    fForm: TfrmFreeBoletoImg;
    fListaBoletos: TFreeBoletoList;
    fBoletoIndex: Integer;
    fDestruirBoletos: Boolean;
    fTrackBarDelay: integer;
    procedure DesenhaBoleto;
    function Define2de5: string;
    procedure GetImagem;
    procedure UpdateImagem;
    procedure SetBoletoAtual(Bol: TFreeBoleto);
    function GetBoletoAtual: TFreeBoleto;
    procedure SetBoletoIndex(indice: integer);
    function GetBoletoIndex: Integer;
    procedure SetDestruirBoletos(destruir: boolean);
  public
    constructor Create(AOwner: TComponent; Destruir: boolean = true); overload;
    destructor Destroy; override;
    procedure ShowPreview;
    procedure SaveBoletoImagem(Arquivo: string; Indice: integer);
    property ListaBoletos: TFreeBoletoList read fListaBoletos write fListaBoletos;
    property BoletoAtual: TFreeBoleto read GetBoletoAtual write SetBoletoAtual;
    property BoletoIndex: Integer read GetBoletoIndex write SetBoletoIndex;
  published
    property DestruirBoletos: boolean read fDestruirBoletos write SetDestruirBoletos stored True default True;
    property TrackBarDelay: Integer read fTrackBarDelay write fTrackBarDelay default 600;
  end;

procedure Register;

implementation

{$R *.dfm}

uses
  Printers, clipbrd, jpeg, DateUtils;

procedure TfrmFreeBoletoImg.PrintBoleto;
var
  I, Start, Stop: Integer;
begin
  PrintDlg.Options := [poPageNums, poSelection];
  PrintDlg.FromPage := 1;
  PrintDlg.MinPage := 1;
  PrintDlg.ToPage := BoletoImagem.ListaBoletos.count;
  PrintDlg.MaxPage := BoletoImagem.ListaBoletos.count;
  if PrintDlg.Execute then
  begin
    with PrintDlg do
    begin
      if PrintRange = prAllPages then
      begin
        Start := MinPage - 1;
        Stop := MaxPage - 1;
      end
      else
        if PrintRange = prSelection then
        begin
          Start := BoletoImagem.BoletoIndex;
          Stop := Start;
        end
        else
        begin
          Start := FromPage - 1;
          Stop := ToPage - 1;
        end;
    end;
    with Printer do
    begin
      Printer.Orientation := poPortrait;
      BeginDoc;
      try
        for I := Start to Stop do
        begin
          BoletoImagem.BoletoIndex := i;
          BoletoImagem.UpdateImagem;
          BltTBitmapAsDib(Printer.Canvas.Handle, 0, 0, Printer.PageWidth, Printer.PageHeight, BMPBoleto.Picture.Bitmap);
          if I <> Stop then NewPage;
        end;
      finally
        EndDoc;
      end;
    end;
  end;
end;

procedure TFreeBoletoImagem.DesenhaBoleto;

  procedure DesenhaBloco(Boleto: TFreeBoleto; Canvas: TCanvas; Desloc: Integer);
  var
    Traco1, Traco2: string;
    I: Integer;
  begin
    with Boleto, Canvas do
    begin
      Font.Size := 15;
      Font.Style := [fsBold];
      TextOut(7, 5 + Desloc, DadosGerados.NomeDoBanco);
      TextOut(146, 5 + Desloc, DadosGerados.CodigoBancoComDigito);
      Font.Size := 10;
      TextOut(10, 44 + Desloc, LocalPagamento);
      TextOut(6, 73 + Desloc, Cedente.Nome);
      TextOut(600, 42 + Desloc, FormatDateTime('dd/mm/yyyy', Vencimento));
      TextOut(546, 73 + Desloc, DadosGerados.AgencCodigoCedente);
      TextOut(546, 102 + Desloc, DadosGerados.NumeroBancario);
      TextOut(546, 132 + Desloc, Format('%m', [Valor]));
      if DataDocumento <> 0 then
        TextOut(10, 103 + Desloc, FormatDateTime('dd/mm/yyyy', DataDocumento));
      TextOut(122, 103 + Desloc, Documento);
      TextOut(246, 103 + Desloc, EspecieDoc);
      TextOut(348, 103 + Desloc, Aceite);
      TextOut(120, 132 + Desloc, Carteira);
      for I := 0 to Instrucoes.Count - 1 do
        TextOut(6, 163 + Desloc + I * 13, Instrucoes[I]);
      TextOut(197, 132 + Desloc, Especie);
      //Sacado
      TextOut(60, 237 + Desloc, sacado.nome + '     ' + Sacado.CNPJ_CPF);
      TextOut(60, 249 + Desloc, sacado.endereco);
      TextOut(60, 261 + Desloc, sacado.Bairro);
      if sacado.Cep <> '' then
        Traco1 := ' - '
      else
        Traco1 := '';
      if sacado.Cidade <> '' then
        Traco2 := ' - '
      else
        Traco2 := '';
      TextOut(60, 273 + Desloc, sacado.Cep + Traco1 + sacado.Cidade + Traco2 + sacado.estado);
    end;
    GetImagem;
  end;

begin
  FForm.BMPBoleto.picture.Assign(FForm.OriginalBitMap);
  with FForm.BMPBoleto.Canvas do
  begin
    Pen.Color := clBlack;
    Brush.Style := bsClear;
    Font.Name := 'Arial';
  end;
  BoletoAtual.Preparar;
  DesenhaBloco(BoletoAtual, FForm.BMPBoleto.Canvas, 0);
  DesenhaBloco(BoletoAtual, FForm.BMPBoleto.Canvas, 348);
  DesenhaBloco(BoletoAtual, FForm.BMPBoleto.Canvas, 699);

  with FForm.BMPBoleto.Canvas do
  begin
    Font.Name := 'Arial';
    Font.Size := 12;
    Font.Style := [fsBold];
    TextOut(220, 708, BoletoAtual.DadosGerados.LinhaDigitavel);
  end;
end;

procedure TFreeBoletoImagem.ShowPreview;
begin
  if ListaBoletos.count = 0 then
    raise exception.create('Não há boletos na lista!');
  FForm := TfrmFreeBoletoImg.create(nil);
  try
    fBoletoIndex := 0;
    FForm.BoletoImagem := self;
    UpdateImagem;
    FForm.TrackTimer.Interval := TrackBarDelay;
    FForm.TrackBar1.Max := ListaBoletos.count;
    FForm.TrackBar1.Position := fBoletoIndex;
    FForm.showModal;
  finally
    FreeAndNil(FForm);
  end;
end;

// As 2 funcoes responsaveis por gerar a imagem do codigo de barras foram retiradas
// dos componentes DelphiBoleto - (c) Genilton Barbosa

function TFreeBoletoImagem.Define2de5: string;
{Traduz dígitos do código de barras para valores de 0 e 1, formando um código do tipo Intercalado 2 de 5}
var
  CodigoAuxiliar: string;
  Codigo, Start: string;
  Stop: string;
  T2de5: array[0..9] of string;
  Codifi: string;
  I: integer;

begin
  Result := 'Erro';
  Start := '0000';
  Stop := '100';
  T2de5[0] := '00110';
  T2de5[1] := '10001';
  T2de5[2] := '01001';
  T2de5[3] := '11000';
  T2de5[4] := '00101';
  T2de5[5] := '10100';
  T2de5[6] := '01100';
  T2de5[7] := '00011';
  T2de5[8] := '10010';
  T2de5[9] := '01010';

  { Digitos }

  Codigo := BoletoAtual.dadosgerados.CodigoBarras;
  for I := 1 to length(Codigo) do
  begin
    if pos(Codigo[I], '0123456789') <> 0 then
      Codifi := Codifi + T2de5[StrToInt(Codigo[I])]
    else
      Exit;
  end;

  {Se houver um número ímpar de dígitos no Código, acrescentar um ZERO no início}
  if odd(length(Codigo)) then
    Codifi := T2de5[0] + Codifi;

  {Intercalar números - O primeiro com o segundo, o terceiro com o quarto, etc...}
  I := 1;
  CodigoAuxiliar := '';
  while I <= (length(Codifi) - 9) do
  begin
    CodigoAuxiliar := CodigoAuxiliar + Codifi[I] + Codifi[I + 5] + Codifi[I + 1] + Codifi[I + 6] + Codifi[I + 2] + Codifi[I + 7] + Codifi[I + 3] + Codifi[I + 8] + Codifi[I + 4] + Codifi[I + 9];
    I := I + 10;
  end;

  { Acrescentar caracteres Start e Stop }
  Result := Start + CodigoAuxiliar + Stop;
end;

// Retirado do DelphiBoleto - (c) Genilton Barbosa

procedure TFreeBoletoImagem.GetImagem;
const
  CorBarra = clBlack;
  CorEspaco = clWhite;
  LarguraBarraFina = 1;
  LarguraBarraGrossa = 3;
  AlturaBarra = 50;
var
  X: integer;
  Col: integer;
  Lar: integer;
  CodigoAuxiliar: string;
  ImgBarras: TImage;
begin
  CodigoAuxiliar := Define2de5;
  ImgBarras := TImage.Create(nil);
  try
    ImgBarras.Height := AlturaBarra;
    ImgBarras.Width := 0;
    for X := 1 to Length(CodigoAuxiliar) do
      case CodigoAuxiliar[X] of
        '0': ImgBarras.Width := ImgBarras.Width + LarguraBarraFina;
        '1': ImgBarras.Width := ImgBarras.Width + LarguraBarraGrossa;
      end;

    Col := 0;

    if CodigoAuxiliar <> 'Erro' then
    begin
      for X := 1 to length(CodigoAuxiliar) do
      begin
        {Desenha barra}
        with ImgBarras.Canvas do
        begin
          if Odd(X) then
            Pen.Color := CorBarra
          else
            Pen.Color := CorEspaco;

          if CodigoAuxiliar[X] = '0' then
          begin
            for Lar := 1 to LarguraBarraFina do
            begin
              MoveTo(Col, 0);
              LineTo(Col, AlturaBarra);
              Col := Col + 1;
            end;
          end
          else
          begin
            for Lar := 1 to LarguraBarraGrossa do
            begin
              MoveTo(Col, 0);
              LineTo(Col, AlturaBarra);
              Col := Col + 1;
            end;
          end;
        end;
      end;
    end
    else
      ImgBarras.Canvas.TextOut(0, 0, 'Erro');

    //Copia a barra para o boleto
    FForm.BMPBoleto.Canvas.CopyRect(Rect(16, 1000, 16 + ImgBarras.Width, 1000 + ImgBarras.Height),
      ImgBarras.Canvas, Rect(0, 0, ImgBarras.width, ImgBarras.height));
  finally
    ImgBarras.Free;
  end;
end;

procedure TFreeBoletoImagem.SaveBoletoImagem(Arquivo: string; Indice: integer);
var
  JPeg: TJpegImage;
begin
  if Arquivo = '' then
    raise Exception.create('Especifique o arquivo para gravação!');
  FForm := TfrmFreeBoletoImg.create(nil);
  try
    FForm.BoletoImagem := Self;
    BoletoIndex := Indice;
    DesenhaBoleto;
    Jpeg := TJPegImage.create;
    with JPeg do
    try
      CompressionQuality := 75;
      Assign(FForm.BMPBoleto.Picture.Bitmap);
      Compress;
      SaveToFile(Arquivo);
    finally
      Jpeg.free;
    end;
  finally
    FreeAndNil(FForm);
  end;
end;

procedure TfrmFreeBoletoImg.FormResize(Sender: TObject);
begin
  if ScrollBox1.ClientWidth > BMPBoleto.Width then
    with BMPBoleto do
    begin
      Left := (ScrollBox1.ClientWidth - BMPBoleto.Width) div 2
    end;
end;

procedure Register;
begin
  RegisterComponents('FreeBoleto', [TFreeBoletoImagem]);
end;

procedure TfrmFreeBoletoImg.ActionImprimirExecute(Sender: TObject);
begin
  PrintBoleto;
end;

procedure TfrmFreeBoletoImg.ActionConfigurarImpressoraExecute(
  Sender: TObject);
begin
  PrinterSetup.execute;
end;

procedure TfrmFreeBoletoImg.ActionSalvarImagemExecute(Sender: TObject);
var
  JPeg: TJpegImage;
begin
  if not SaveImg.Execute then
    exit;
  Jpeg := TJPegImage.create;
  with JPeg do
  try
    CompressionQuality := 75;
    Assign(BMPBoleto.Picture.Bitmap);
    Compress;
    SaveToFile(SaveImg.filename);
  finally
    Jpeg.free;
  end;
end;

procedure TfrmFreeBoletoImg.ActionCopiarExecute(Sender: TObject);
var
  MyFormat: Word;
  AData: Thandle;
  APalette: Hpalette;
begin
  BMPBoleto.Picture.SaveToClipboardFormat(MyFormat, AData, APalette);
  ClipBoard.SetAsHandle(MyFormat, AData);
end;

constructor TFreeBoletoImagem.Create(AOwner: TComponent; Destruir: boolean = true);
begin
  inherited Create(AOwner);
  fDestruirBoletos := Destruir;
  fTrackBarDelay := 600;
  fListaBoletos := TFreeBoletoList.create(fDestruirBoletos);
  fBoletoIndex := -1;
end;

destructor TFreeBoletoImagem.Destroy;
begin
  fListaBoletos.free;
  inherited;
end;

procedure TfrmFreeBoletoImg.FormCreate(Sender: TObject);
begin
  OriginalBitMap := TPicture.Create;
  OriginalBitMap.Assign(BMPBoleto.picture);
end;

procedure TfrmFreeBoletoImg.FormDestroy(Sender: TObject);
begin
  OriginalBitMap.Free;
end;

procedure TFreeBoletoImagem.UpdateImagem;
begin
  DesenhaBoleto;
  FForm.ActionAnterior.Enabled := (BoletoIndex > 0);
  FForm.ActionProxima.Enabled := (BoletoIndex < (ListaBoletos.count - 1));
end;

procedure TfrmFreeBoletoImg.ActionAnteriorExecute(Sender: TObject);
begin
  with BoletoImagem do
  begin
    if (ListaBoletos.count <> 0) and (fBoletoIndex > 0) then
      TrackBar1.Position := fBoletoIndex; //Sincroniza TrackBar
    UpdateImagem;
  end;
end;

procedure TfrmFreeBoletoImg.ActionProximaExecute(Sender: TObject);
begin
  with BoletoImagem do
  begin
    if (ListaBoletos.count <> 0) and (fBoletoIndex < (ListaBoletos.count - 1)) then
      TrackBar1.Position := fBoletoIndex + 2; //Sincroniza TrackBar
    UpdateImagem;
  end;
end;

function TFreeBoletoImagem.GetBoletoAtual: TFreeBoleto;
begin
  if ListaBoletos.count <> 0 then
    Result := ListaBoletos[fBoletoIndex]
  else
    Result := nil;
end;

procedure TFreeBoletoImagem.SetBoletoAtual(Bol: TFreeBoleto);
begin
  if ListaBoletos.count <> 0 then
    ListaBoletos[fBoletoIndex] := Bol
  else
    raise exception.create('Não há boletos na lista!');
end;

procedure TFreeBoletoImagem.SetBoletoIndex(indice: integer);
begin
  if ListaBoletos.Count < indice then
    raise exception.create('Índice fora da faixa!');
  fBoletoIndex := indice;
end;

function TFreeBoletoImagem.GetBoletoIndex: Integer;
begin
  if ListaBoletos.Count = 0 then
    Result := -1
  else
    Result := fBoletoIndex;
end;

procedure TfrmFreeBoletoImg.TrackBar1Change(Sender: TObject);
begin
  if MilliSecondsBetween(Now, LastTrackMove) > TrackTimer.Interval then
    TrackTimerTimer(TrackTimer)
  else
  begin
    TrackTimer.Enabled := false;
    TrackTimer.Enabled := true;
  end;
  LastTrackMove := Now;
  BoletoImagem.BoletoIndex := TrackBar1.Position - 1;
end;

procedure TfrmFreeBoletoImg.ActionFecharJanelaExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmFreeBoletoImg.TrackTimerTimer(Sender: TObject);
begin
  BoletoImagem.UpdateImagem;
end;

procedure TFreeBoletoImagem.SetDestruirBoletos(destruir: boolean);
begin
  fListaBoletos.free;
  fDestruirBoletos := Destruir;
  fListaBoletos := TFreeBoletoList.create(fDestruirBoletos);
end;

procedure TfrmFreeBoletoImg.BltTBitmapAsDib(DestDc: hdc; x, y, Width, Height: integer; bm: TBitmap);
type
  PPalEntriesArray = ^TPalEntriesArray; {for palette re-construction}
  TPalEntriesArray = array[0..0] of TPaletteEntry;
var
  OriginalWidth: LongInt; {width of BM}
  dc: hdc; {screen dc}
  IsPaletteDevice: bool; {if the device uses palettes}
  IsDestPaletteDevice: bool; {if the device uses palettes}
  BitmapInfoSize: integer; {sizeof the bitmapinfoheader}
  lpBitmapInfo: PBitmapInfo; {the bitmap info header}
  hBm: hBitmap; {handle to the bitmap}
  hPal: hPalette; {handle to the palette}
  OldPal: hPalette; {temp palette}
  hBits: THandle; {handle to the DIB bits}
  pBits: pointer; {pointer to the DIB bits}
  lPPalEntriesArray: PPalEntriesArray; {palette entry array}
  NumPalEntries: integer; {number of palette entries}
  i: integer; {looping variable}
begin
{If range checking is on - lets turn it off for now}
{we will remember if range checking was on by defining}
{a define called CKRANGE if range checking is on.}
{We do this to access array members past the arrays}
{defined index range without causing a range check}
{error at runtime. To satisfy the compiler, we must}
{also access the indexes with a variable. ie: if we}
{have an array defined as a: array[0..0] of byte,}
{and an integer i, we can now access a[3] by setting}
{i := 3; and then accessing a[i] without error}
//{$IFOPT R+}
// {$DEFINE CKRANGE}
// {$R-}
//{$ENDIF}

 {Save the original width of the bitmap}
  OriginalWidth := bm.Width;

 {Get the screen's dc to use since memory dc's are not reliable}
  dc := GetDc(0);

 {Are we a palette device?}
  IsPaletteDevice := GetDeviceCaps(dc, RASTERCAPS) and RC_PALETTE = RC_PALETTE;

 {Give back the screen dc}
 {dc := } ReleaseDc(0, dc);

 {Allocate the BitmapInfo structure}
  if IsPaletteDevice then
    BitmapInfoSize := sizeof(TBitmapInfo) + (sizeof(TRGBQUAD) * 255)
  else
    BitmapInfoSize := sizeof(TBitmapInfo);

  GetMem(lpBitmapInfo, BitmapInfoSize);

 {Zero out the BitmapInfo structure}
  FillChar(lpBitmapInfo^, BitmapInfoSize, #0);

 {Fill in the BitmapInfo structure}
  lpBitmapInfo^.bmiHeader.biSize := sizeof(TBitmapInfoHeader);
  lpBitmapInfo^.bmiHeader.biWidth := OriginalWidth;
  lpBitmapInfo^.bmiHeader.biHeight := bm.Height;
  lpBitmapInfo^.bmiHeader.biPlanes := 1;

  if IsPaletteDevice then
    lpBitmapInfo^.bmiHeader.biBitCount := 8
  else
    lpBitmapInfo^.bmiHeader.biBitCount := 24;
  lpBitmapInfo^.bmiHeader.biCompression := BI_RGB;
  lpBitmapInfo^.bmiHeader.biSizeImage := ((lpBitmapInfo^.bmiHeader.biWidth *
    longint(lpBitmapInfo^.bmiHeader.biBitCount)) div 8) *
    lpBitmapInfo^.bmiHeader.biHeight;
  lpBitmapInfo^.bmiHeader.biXPelsPerMeter := 0;
  lpBitmapInfo^.bmiHeader.biYPelsPerMeter := 0;

  if IsPaletteDevice then
  begin
    lpBitmapInfo^.bmiHeader.biClrUsed := 256;
    lpBitmapInfo^.bmiHeader.biClrImportant := 256;
  end
  else
  begin
    lpBitmapInfo^.bmiHeader.biClrUsed := 0;
    lpBitmapInfo^.bmiHeader.biClrImportant := 0;
  end;

 {Take ownership of the bitmap handle and palette}
  hBm := bm.ReleaseHandle;
  hPal := bm.ReleasePalette;

 {Get the screen's dc to use since memory dc's are not reliable}
  dc := GetDc(0);

  if IsPaletteDevice then
  begin
   {If we are using a palette, it must be}
   {selected into the dc during the conversion}
    //OldPal := SelectPalette(dc, hPal, TRUE);
   {Realize the palette}
    RealizePalette(dc);
  end;

 {Tell GetDiBits to fill in the rest of the bitmap info structure}
  GetDiBits(dc, hBm, 0, lpBitmapInfo^.bmiHeader.biHeight, nil, TBitmapInfo(lpBitmapInfo^), DIB_RGB_COLORS);

 {Allocate memory for the Bits}
  hBits := GlobalAlloc(GMEM_MOVEABLE, lpBitmapInfo^.bmiHeader.biSizeImage);
  pBits := GlobalLock(hBits);

 {Get the bits}

  GetDiBits(dc, hBm, 0, lpBitmapInfo^.bmiHeader.biHeight, pBits, TBitmapInfo(lpBitmapInfo^), DIB_RGB_COLORS);

  if IsPaletteDevice then
  begin
   {Lets fix up the color table for buggy video drivers}
    GetMem(lPPalEntriesArray, sizeof(TPaletteEntry) * 256);
{$IFDEF VER100}
    NumPalEntries := GetPaletteEntries(hPal, 0, 256, lPPalEntriesArray^);
{$ELSE}
    NumPalEntries := GetSystemPaletteEntries(dc, 0, 256, lPPalEntriesArray^);
{$ENDIF}
    for i := 0 to (NumPalEntries - 1) do
    begin
      lpBitmapInfo^.bmiColors[i].rgbRed :=
        lPPalEntriesArray^[i].peRed;
      lpBitmapInfo^.bmiColors[i].rgbGreen :=
        lPPalEntriesArray^[i].peGreen;
      lpBitmapInfo^.bmiColors[i].rgbBlue :=
        lPPalEntriesArray^[i].peBlue;
    end;
    FreeMem(lPPalEntriesArray, sizeof(TPaletteEntry) * 256);
  end;

  oldPal := hPal;
  if IsPaletteDevice then
  begin
   {Select the old palette back in}
    SelectPalette(dc, OldPal, TRUE);
   {Realize the old palette}
    RealizePalette(dc);
  end;

 {Give back the screen dc}
  {dc := } ReleaseDc(0, dc);
 {Is the Dest dc a palette device?}
  IsDestPaletteDevice := GetDeviceCaps(DestDc, RASTERCAPS) and RC_PALETTE = RC_PALETTE;
  if IsPaletteDevice then
  begin
   {If we are using a palette, it must be}
   {selected into the dc during the conversion}
    OldPal := SelectPalette(DestDc, hPal, TRUE);
   {Realize the palette}
    RealizePalette(DestDc);
  end;

 {Do the blt}
  StretchDiBits(DestDc, x, y, Width, Height, 0, 0, OriginalWidth, lpBitmapInfo^.bmiHeader.biHeight, pBits, lpBitmapInfo^, DIB_RGB_COLORS, SrcCopy);

  if IsDestPaletteDevice then
  begin
   {Select the old palette back in}
    SelectPalette(DestDc, OldPal, TRUE);
   {Realize the old palette}
    RealizePalette(DestDc);
  end;

 {De-Allocate the Dib Bits}
  GlobalUnLock(hBits);
  GlobalFree(hBits);
 {De-Allocate the BitmapInfo}
  FreeMem(lpBitmapInfo, BitmapInfoSize);
 {Set the ownership of the bimap handles back to the bitmap}
  bm.Handle := hBm;
  bm.Palette := hPal;

  {Turn range checking back on if it was on when we started}
//{$IFDEF CKRANGE}
// {$UNDEF CKRANGE}
// {$R+}
//{$ENDIF}
end;

end.

