unit SBLstV2f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, SBLstV3u;

type
  TSBLstV2fForm = class(TForm)
    gbFilterInf: TGroupBox;
    meFilterInf: TMemo;
    gbLayoutInf: TGroupBox;
    edFileReport: TEdit;
    sbtSelectFile: TSpeedButton;
    gbReportName: TGroupBox;
    sbtAccept: TSpeedButton;
    sbtCancel: TSpeedButton;
    cbReportName: TComboBox;
    OpenDialog: TOpenDialog;
    sbtDelete: TSpeedButton;
    procedure sbtCancelClick(Sender: TObject);
    procedure sbtAcceptClick(Sender: TObject);
    procedure cbReportNameSelect(Sender: TObject);
    procedure sbtSelectFileClick(Sender: TObject);
    procedure sbtDeleteClick(Sender: TObject);
  private
    { Private declarations }
    FFileName: String;
    FFilter: TFilterInf;
    FRegName: String;
    procedure CheckFileReport;
    function GetFileReport: String;
    function GetReportName: String;
    procedure SetFileReport(const Value: String);
    procedure SetReportName(const Value: String);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetFilter(const AFilter: TFilterInf);
    procedure Clear;
    procedure EnumConfig(const AFileName: String);
    property FileReport: String read GetFileReport write SetFileReport;
    property ReportName: String read GetReportName write SetReportName;
    property RegName: String read FRegName write FRegName;
  end;

var
  SBLstV2fForm: TSBLstV2fForm;

implementation

{$R *.dfm}

{ TSBLstV2fForm }

procedure TSBLstV2fForm.CheckFileReport;
begin
  if not FileExists(edFileReport.Text) then
    raise Exception.Create('Arquivo de relatório inválido'); 
end;

procedure TSBLstV2fForm.SetFilter(const AFilter: TFilterInf);
begin
  FFilter.Assign(AFilter);
  meFilterInf.Text := FFilter.ToString;
end;

procedure TSBLstV2fForm.sbtCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TSBLstV2fForm.sbtAcceptClick(Sender: TObject);
var
  lReportInf: TReportInf;
begin
  CheckFileReport;
  lReportInf.ReportName := ReportName;
  lReportInf.FileReport := FileReport;
  lReportInf.RegName := FRegName;
  SaveReport(FFileName, lReportInf, FFilter);
  ModalResult:=mrOk;
end;

function TSBLstV2fForm.GetFileReport: String;
begin
  Result := edFileReport.Text;
end;

function TSBLstV2fForm.GetReportName: String;
begin
  Result := cbReportName.Text;
end;

procedure TSBLstV2fForm.SetFileReport(const Value: String);
begin
  edFileReport.Text := Value;
end;

procedure TSBLstV2fForm.SetReportName(const Value: String);
begin
  cbReportName.Text := Value;
end;

procedure TSBLstV2fForm.Clear;
begin
  meFilterInf.Clear;
  FFilter.Clear;
  ReportName := '';
  FileReport := '';
end;

procedure TSBLstV2fForm.EnumConfig(const AFileName: String);
begin
  FFileName := AFileName;
  EnumReportConfig(AFileName, cbReportName.Items);
end;

constructor TSBLstV2fForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFilter := TFilterInf.Create;
end;

destructor TSBLstV2fForm.Destroy;
begin
  FFilter.Free;
  inherited Destroy;
end;

procedure TSBLstV2fForm.cbReportNameSelect(Sender: TObject);
var
  lReportInf: TReportInf;
begin
  lReportInf.ReportName := cbReportName.Text;
  LoadReport(FFileName, lReportInf, FFilter);

  cbReportName.Text := lReportInf.ReportName;
  edFileReport.Text := lReportInf.FileReport;
  meFilterInf.Text := FFilter.ToString;
end;

procedure TSBLstV2fForm.sbtSelectFileClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    edFileReport.Text := OpenDialog.FileName;
end;

procedure TSBLstV2fForm.sbtDeleteClick(Sender: TObject);
var
  lReportInf: TReportInf;
  lMsg: String;
begin
  lMsg := 'Tente certeza que deseja excluir o relatório ' + ReportName + '?';
  if MessageBox(Handle, PChar(lMsg), 'Atenção', MB_YESNO) = mrYes then
  begin
    lReportInf.ReportName := ReportName;
    lReportInf.FileReport := FileReport;
    lReportInf.RegName := FRegName;
    EraseReportConfig(FFileName, lReportInf);
    // recarregar as configurações
    cbReportName.Clear;
    EnumConfig(FFileName);
  end;
end;

end.
