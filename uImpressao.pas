unit MyImprime;

{
Unit para facilitar impressão direta com o TCanvas.
Todas as variáveis, procedimentos e funções começam
com as letras "MP".
É criado um objeto com o nome MPPrinter para controle
da impressão, com procedimentos privados (acessados
somente por esta unit.
As Procedures e funções declaradas logo abaixo de
TMyPrinter poderão ser "chamadas" por outras units.

Para usar esta unit, esta deverá ser inicializada:
MPInicializa('FontePadrão',TamanhoPadrão)
e finalizada:
MPFinaliza;

Unit escrita em Delphi 6.0
Walter de Freitas Peixoto
walterpeixoto@yahoo.com.br
}

interface

uses Printers, Graphics, Classes, SysUtils;

type TMyPrinter = class(TObject)
  private
    MPFonteName: string; // nome da fonte
    MPFonteSize: integer; // tamanho da fonte
    MPMarginTop: integer; // Margem superior da folha - em linhas conf. altura padrão
    MPMarginLeft: integer; // margem esquerda da página
    MPMarginBotton: integer; // Margem inferior da folha - em linhas conf. altura padrão
    MPEstilo: TFontStyles; // estilo da fonte
    MPLinha: integer; // linha a ser impressa
    MPColuna: integer; // coluna a ser impressa
    MPTamanho: integer; // largura padrão de fonte - 'A' p/ contagem de caracter
    MPAltura: integer; // Altura padrão de Fonte = "A"
    MPAlignment: TAlignment; // alinhamento de impressão
    MPIfHeaderAll: boolean; // se imprimir cabeçalho em todas as páginas
    MPHeaderFont: array of TFont; // para cabeçalho
    MPHeaderString: array of string; // para cabeçalho
    MPHeaderAlign: array of TAlignment; // para cabeçalho
    MPHeaderQtLine: integer; // Qtde linha no cabeçalho
    // MPPage: integer; // nº página
    MPPageHeader: boolean; // se já imprimiu cabeçalho
    procedure MPImprimeHeader; // imprime cabeçalho
    function MPCentra(vTexto: string): integer;
  end;

procedure MPInicializa(kFonte: string; kSize: integer; kEstilo: TFontStyles = []; kPen: integer = 5);
procedure MPFinaliza;
procedure MPSetFonte(kFonte: string);
procedure MPSetFontStyle(kEstilo: TFontStyles);
procedure MPSetMarginLeft(kMarg: Integer);
procedure MPSetMarginTop(kMarg: integer);
procedure MPSetMarginBotton(kFooter: integer);
procedure MPNewPage;
procedure MPReset;
function MPReplicate(kString: string; kNum: integer): string;
procedure MPImprime(kInc: integer; kCol: integer; kTexto: string; kTam: integer = 0; kAlign: TAlignment = taLeftJustify);
function MPGetHeaderAll: boolean;
procedure MPSetHeaderAll(kValue: boolean);
procedure MPHeaderAdd(kString: string; kAlign: TAlignment = taLeftJustify; kFontSize: integer = 0; kFontStyle: TFontStyles = []);

var
  MPPrinter: TMyPrinter;

implementation

procedure MPInicializa(kFonte: string; kSize: integer; kEstilo: TFontStyles = []; kPen: integer = 5);
begin
  // inicializa MPPrinter
  MPPrinter := TMyPrinter.Create;

  MPPrinter.MPIfHeaderAll := False;
  MPPrinter.MPPageHeader := False;

  // fixa/estabelece valores para variáveis de impressão
  MPPrinter.MPFonteName := kFonte;
  MPPrinter.MPFonteSize := kSize;
  MPPrinter.MPEstilo := kEstilo;

  // configura documento para impressão
  Printer.Orientation := poPortrait;
  Printer.BeginDoc;
  Printer.Canvas.Pen.Width := kPen;
  Printer.Canvas.Font.Name := MPPrinter.MPFonteName;
  Printer.Canvas.Font.Size := MPPrinter.MPFonteSize;
  Printer.Canvas.Font.Style := MPPrinter.MPEstilo;

  MPPrinter.MPMarginTop := 0;
  MPPrinter.MPMarginBotton := 10;
  MPPrinter.MPTamanho := Printer.Canvas.TextWidth('A');
  MPPrinter.MPAltura := Printer.Canvas.TextHeight('A') + 5;
  MPPrinter.MPMarginLeft := 10 + (0 * MPPrinter.MPTamanho);
  MPPrinter.MPLinha := 10 + (MPPrinter.MPMarginTop * MPPrinter.MPAltura);
  MPPrinter.MPColuna := 10 + (MPPrinter.MPMarginLeft * MPPrinter.MPTamanho);

  MPPrinter.MPAlignment := taLeftJustify;

  // cabeçalho
  MPPrinter.MPHeaderQtLine := 0;
end;

procedure MPFinaliza;
var kX: integer;
begin
  Printer.EndDoc;
  if MPPrinter.MPHeaderQtLine > 0 then
    for kX := 0 to MPPrinter.MPHeaderQtLine - 1 do
      MPPrinter.MPHeaderFont[kX].Free;
  MPPrinter.Free;
end;

procedure MPSetFonte(kFonte: string);
begin
  Printer.Canvas.Font.Name := kFonte;
end;

procedure MPSetFontStyle(kEstilo: TFontStyles);
begin
  Printer.Canvas.Font.Style := kEstilo;
end;

procedure MPSetMarginLeft(kMarg: Integer);
begin
  MPPrinter.MPMarginLeft := 10 + (kMarg * MPPrinter.MPTamanho);
end;

procedure MPSetMarginTop(kMarg: integer);
begin
  MPPrinter.MPMarginTop := 10 + (kMarg * MPPrinter.MPAltura);
  if MPPrinter.MPLinha < MPPrinter.MPMarginTop then
    MPPrinter.MPLinha := MPPrinter.MPMarginTop - Printer.Canvas.Font.Height + 5;
end;

procedure MPSetMarginBotton(kFooter: integer);
begin
  MPPrinter.MPMarginBotton := 10 + (kFooter * MPPrinter.MPAltura);
end;

procedure MPNewPage;
begin
  Printer.NewPage;
  MPPrinter.MPLinha := 10 + (MPPrinter.MPMarginTop * MPPrinter.MPAltura);
  if MPPrinter.MPIfHeaderAll then
    MPPrinter.MPImprimeHeader;
end;

procedure MPReset;
begin
  // valores padrões para Fonte
  Printer.Canvas.Font.Name := MPPrinter.MPFonteName;
  Printer.Canvas.Font.Size := MPPrinter.MPFonteSize;
  Printer.Canvas.Font.Style := MPPrinter.MPEstilo;
end;

function MPReplicate(kString: string; kNum: integer): string;
var x: integer;
begin
  // repete uma string de acordo com o tamanho padrão de largura
  // e não do nº de caracteres de kString
  x := kNum * MPPrinter.MPTamanho;
  result := '';
  while x > Printer.Canvas.TextWidth(result) do
    result := result + kString;
end;

// :::::::::::::::::::::::
procedure MPImprime(kInc: integer; kCol: integer; kTexto: string; kTam: integer = 0; kAlign: TAlignment = taLeftJustify);
begin
  // Se ainda não foi impresso o cabeçalho, faz agora
  if not MPPrinter.MPPageHeader then 
  begin
    MPPrinter.MPImprimeHeader;
    MPPrinter.MPPageHeader := true;
  end;
  // se avançar para próxima linha - kInc incrementa nº linhas
  if kInc > 0 then
    MPPrinter.MPLinha := MPPrinter.MPLinha - (Printer.Canvas.Font.Height * kInc) + (5 * kInc);
  // se posição atingiu o rodapé da página - nova página
  if MPPrinter.MPLinha > (Printer.PageHeight - MPPrinter.MPMarginBotton) then
  begin
    // nova página
    Printer.NewPage;
    MPPrinter.MPLinha := 10 + (MPPrinter.MPMarginTop * MPPrinter.MPAltura);
    // -> imprime cabeçalho - se imprimir em todas as páginas
    if MPPrinter.MPIfHeaderAll then
      MPPrinter.MPImprimeHeader;
  end;
  // altera o tamanho da fonte se kTam diferente de zero
  if kTam <> 0 then
    Printer.Canvas.Font.Size := kTam;

  // verifica valor de kCol - Se negativo, imprime da direita p/ esquerda
  // alinhando uma coluna à direita... (kCol assume kCol - Tamanho string)
  if kCol < 0 then
  begin
    kCol := MPPrinter.MPMarginLeft + (MPPrinter.MPTamanho * (kCol * -1));
    MPPrinter.MPColuna := kCol - Printer.Canvas.TextWidth(kTexto);
  end
  else
  begin
    // estabelece posição para a coluna de acordo com a margem
    MPPrinter.MPAlignment := kAlign;
    if (MPPrinter.MPAlignment = taLeftJustify) then
      MPPrinter.MPColuna := MPPrinter.MPMarginLeft + (MPPrinter.MPTamanho * kCol)
    else if (MPPrinter.MPAlignment = taRightJustify) then
      // if kCol <> 0 assume margem à direita ref a kCol caracteres
      MPPrinter.MPColuna := (Printer.PageWidth - 10 - Printer.Canvas.TextWidth(kTexto)) - (kCol * MPPrinter.MPTamanho)
    else if (MPPrinter.MPAlignment = taCenter) then
      MPPrinter.MPColuna := MPPrinter.MPCentra(kTexto);
  end;

  // envia resultado para composição de página para impressão
  Printer.Canvas.TextOut(MPPrinter.MPColuna, MPPrinter.MPLinha, kTexto);
end;

function MPGetHeaderAll: boolean;
begin
  Result := MPPrinter.MPIfHeaderAll;
end;

procedure MPSetHeaderAll(kValue: boolean);
begin
  MPPrinter.MPIfHeaderAll := kValue;
end;

procedure MPHeaderAdd(kString: string; kAlign: TAlignment = taLeftJustify; kFontSize: integer = 0; kFontStyle: TFontStyles = []);
begin
  MPPrinter.MPHeaderQtLine := MPPrinter.MPHeaderQtLine + 1;

  // altera tamanho de vetores de cabeçalho
  SetLength(MPPrinter.MPHeaderFont, MPPrinter.MPHeaderQtLine);
  SetLength(MPPrinter.MPHeaderString, MPPrinter.MPHeaderQTLine);
  SetLength(MPPrinter.MPHeaderAlign, MPPrinter.MPHeaderQtLine);

  MPPrinter.MPHeaderString[MPPrinter.MPHeaderQtLine - 1] := kString;
  MPPrinter.MPHeaderAlign[MPPrinter.MPHeaderQtLine - 1] := kAlign;
  MPPrinter.MPHeaderFont[MPPrinter.MPHeaderQtLine - 1] := TFont.Create;
  (MPPrinter.MPHeaderFont[MPPrinter.MPHeaderQtLine - 1] as TFont).Name := MPPrinter.MPFonteName;
  if kFontSize <> 0 then
    (MPPrinter.MPHeaderFont[MPPrinter.MPHeaderQtLine - 1] as TFont).Size := kFontSize
  else
    (MPPrinter.MPHeaderFont[MPPrinter.MPHeaderQtLine - 1] as TFont).Size := MPPrinter.MPFonteSize;
  if kFontStyle <> [] then
    (MPPrinter.MPHeaderFont[MPPrinter.MPHeaderQtLine - 1] as TFont).Style := kFontStyle
  else
    (MPPrinter.MPHeaderFont[MPPrinter.MPHeaderQtLine - 1] as TFont).Style := MPPrinter.MPEstilo;
end;

{ TMyPrinter }

function TMyPrinter.MPCentra(vTexto: string): integer;
var vEsq: integer;
  vPos: Real;
  sPos: string;
begin
  vPos := (Printer.Canvas.TextWidth(vTexto) - MPPrinter.MPMarginLeft) / 2;
  vPos := (Printer.PageWidth / 2) - vPos;
  sPos := FormatFloat('#####0', vPos);
  vEsq := StrToInt(sPos);
  result := vEsq;
end;

procedure TMyPrinter.MPImprimeHeader;
var kX: integer;
  kTexto: string;
  kAlign: TAlignment;
  kOldEstilo: TFontStyles;
  kOldSize: Integer;
  kOldAlin: TAlignment;
begin
  if MPPrinter.MPHeaderQtLine > 0 then
  begin
    kOldEstilo := Printer.Canvas.Font.Style;
    kOldSize := Printer.Canvas.Font.Size;
    kOldAlin := MPPrinter.MPAlignment;
    MPPrinter.MPLinha := 10 + (MPPrinter.MPMarginTop * MPPrinter.MPAltura);
    for kX := 0 to MPPrinter.MPHeaderQtLine - 1 do
    begin
      kTexto := MPPrinter.MPHeaderString[kX];
      kAlign := MPPrinter.MPHeaderAlign[kX];
      Printer.Canvas.Font.Size := (MPPrinter.MPHeaderFont[kX] as TFont).Size;
      Printer.Canvas.Font.Style := (MPPrinter.MPHeaderFont[kX] as TFont).Style;

      // justifica cabeçalho
      if (kAlign = taLeftJustify) then
        MPPrinter.MPColuna := MPPrinter.MPMarginLeft
      else if (kAlign = taRightJustify) then
        MPPrinter.MPColuna := (Printer.PageWidth - 10 - Printer.Canvas.TextWidth(kTexto))
      else if (kAlign = taCenter) then
        MPPrinter.MPColuna := MPPrinter.MPcentra(kTexto);

      // envia dados para página de impressão e avança para próxima linha
      Printer.Canvas.TextOut(MPPrinter.MPColuna, MPPrinter.MPLinha, kTexto);
      MPPrinter.MPLinha := MPPrinter.MPLinha - Printer.Canvas.Font.Height + 5;
    end;
    // retorna configuração de Printer para impressão do corpo
    Printer.Canvas.Font.Style := kOldEstilo;
    Printer.Canvas.Font.Size := kOldSize;
    MPPrinter.MPAlignment := kOldAlin;
  end;
end;

end.
// final da Unit MyImprime

