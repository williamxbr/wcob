unit uFreeReport;

interface

uses Classes, Forms, DB, FR_Class, FR_DBSet, FR_View, FR_E_TNPDF, FR_DESGN, 
     FR_E_CSV, FR_E_HTM, FR_E_RTF, FR_E_TXT;

Type  TTipoExportacao   = (TNaoExporta, TExportaPDF, TExportaCSV, TExportaHTM, TExportaRTF, TExportaTXT);

Type
 TFreeReport = class
 Private
   FArquivo   : String;
   procedure SetFArquivo(const Value : String);
 public
   property Arquivo   : String   read FArquivo   write SetFArquivo;
   constructor Create(AOwner: TComponent);
   destructor Destroy;
   procedure Desenhar;
   procedure Visualiza;
   procedure ExportaPDF;
   procedure ExportaCSV;
   procedure ExportaHTM;
   procedure ExportaRTF;
   procedure ExportaTXT;
   procedure plAdicionaVariavel(Campo, Valor : String);
 protected
   Desenho      : TfrDesigner;
   Relatorio    : TfrReport;
   Visualizador : TfrView;
 end;

 TfrMyDBDataset = class(TfrDBDataSet)
 public
  constructor Create(AOwner: TComponent); override;
 end;


 implementation

uses SysUtils;

constructor TFreeReport.Create(AOwner: TComponent);
begin
  Relatorio    := TfrReport.Create(AOwner);
  Desenho      := TfrDesigner.Create(AOwner);
  Visualizador := TfrView.Create;
  FArquivo     := '';
end;

destructor TFreeReport.Destroy;
begin
   FreeAndNil(Relatorio);
   FreeAndNil(Desenho);
   FreeAndNil(Visualizador);
end;

procedure TFreeReport.ExportaCSV;
Var
  i : Byte;
  StrFile : String;
begin
  StrFile := ChangeFileExt(FArquivo,'.csv');
  Relatorio.LoadFromFile(FArquivo);
  Relatorio.PrepareReport;
  For i:=0 to frFiltersCount-1 do
      if lowercase(ExtractFileExt(frFilters[i].FilterExt))='.csv' then
         Relatorio.ExportTo(frFilters[i].ClassRef,StrFile);
end;

procedure TFreeReport.ExportaHTM;
Var
  i : Byte;
  StrFile : String;
begin
  StrFile := ChangeFileExt(FArquivo,'.htm');
  Relatorio.LoadFromFile(FArquivo);
  Relatorio.PrepareReport;
  For i:=0 to frFiltersCount-1 do
      if lowercase(ExtractFileExt(frFilters[i].FilterExt))='.htm' then
         Relatorio.ExportTo(frFilters[i].ClassRef,StrFile);
end;

procedure TFreeReport.ExportaPDF;
Var
  i : byte;
  StrFile : String;
begin
  StrFile := ChangeFileExt(FArquivo,'.pdf');
  Relatorio.LoadFromFile(FArquivo);
  Relatorio.PrepareReport;
  For i:=0 to frFiltersCount-1 do
      if lowercase(ExtractFileExt(frFilters[i].FilterExt))='.pdf' then
         Relatorio.ExportTo(frFilters[i].ClassRef,StrFile);
end;

procedure TFreeReport.ExportaRTF;
Var
  i : Byte;
  StrFile : String;
begin
  StrFile := ChangeFileExt(FArquivo,'.rtf');
  Relatorio.LoadFromFile(FArquivo);
  Relatorio.PrepareReport;
  For i:=0 to frFiltersCount-1 do
      if lowercase(ExtractFileExt(frFilters[i].FilterExt))='.rtf' then
         Relatorio.ExportTo(frFilters[i].ClassRef,StrFile);
end;

procedure TFreeReport.ExportaTXT;
Var
  i : Byte;
  StrFile : String;
begin
  StrFile := ChangeFileExt(FArquivo,'.txt');
  Relatorio.LoadFromFile(FArquivo);
  Relatorio.PrepareReport;
  For i:=0 to frFiltersCount-1 do
      if lowercase(ExtractFileExt(frFilters[i].FilterExt))='.txt' then
         Relatorio.ExportTo(frFilters[i].ClassRef,StrFile);
end;

procedure TFreeReport.SetFArquivo(const Value: String);
begin
  FArquivo := Value;
end;

procedure TFreeReport.Visualiza;
begin
  Relatorio.LoadFromFile(FArquivo);
  Relatorio.ShowReport;
end;

procedure TFreeReport.Desenhar;
begin
  If   Trim(FArquivo) <> '' Then
       Relatorio.LoadFromFile(FArquivo);
  Relatorio.DesignReport;
end;


procedure TFreeReport.plAdicionaVariavel(Campo, Valor : String);
begin
  frVariables[Campo] := Valor;
end;

constructor TfrMyDBDataset.Create(AOwner: TComponent);
begin
 // TODO -cMM: TFreeReportDataset.Create default body inserted
 inherited;
end;

end.
