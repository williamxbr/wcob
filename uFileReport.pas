unit uFileReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
  TFrmFileReport = class(TForm)
    pnRodape: TPanel;
    tv: TTreeView;
    btnOK: TBitBtn;
    procedure btnOKClick(Sender: TObject);
  private
    procedure ProcessDirectory(const APath: String);
    { Private declarations }
  public
    { Public declarations }
  end;

  TReportInfoMode = (rimDirect, rimFilter);

  TReportInfo = class
  private
    FFileName: String;
    FMode: TReportInfoMode;
  public
    constructor Create; virtual;
    property FileName: String read FFileName write FFileName;
    property Mode: TReportInfoMode read FMode write FMode;
  end;




  function SelectFile(cCaminho : String) : String;

implementation

{$R *.dfm}

Function SelectFile(cCaminho : String) : String;
var
  FrmFileReport: TFrmFileReport;
Begin
  FrmFileReport := TFrmFileReport.Create(Application);
  Try
    FrmFileReport.ProcessDirectory(cCaminho);
    FrmFileReport.ShowModal;
    Result := TReportInfo(FrmFileReport.tv.Selected.Data).FileName;
  Finally
    FreeAndNil(FrmFileReport);
  End;
End;

procedure TFrmFileReport.ProcessDirectory(const APath: String);
const
  Reports = 'Relatórios';
  ALLDIR = '*.*';
  ALLREPORT = '*.FRF';

  procedure LoadSubItems(const ANode: TTreeNode; const APath: String; const AMask: String);
  var
    lSearchRec: TSearchRec;
    lError: Longint;
    lNode: TTreeNode;
    lReportInfo: TReportInfo;
  begin
    lError := FindFirst(APath + AMask, faAnyFile, lSearchRec);
    try
      while lError = 0 do
      begin
        if (lSearchRec.Name <> '.')
        and (lSearchRec.Name <> '..')then
        begin
          if (lSearchRec.Attr and faDirectory = faDirectory) then
          begin
            lNode := tv.Items.AddChild(ANode, lSearchRec.Name);
            lNode.ImageIndex := 0;
            lNode.SelectedIndex := 0;
            LoadSubItems(lNode, APath + lSearchRec.Name + '\', ALLREPORT);
            LoadSubItems(lNode, APath + lSearchRec.Name + '\', ALLDIR);
          end
          else
          begin
            if CompareText(AMask, ALLREPORT) = 0 then { nao aceito somente para teste }
            begin
              lNode := tv.Items.AddChild(ANode, lSearchRec.Name);
              lNode.ImageIndex := 1;
              lNode.SelectedIndex := 1;

              lReportInfo := TReportInfo.Create;
              lReportInfo.FileName := APath + lSearchRec.Name;
              lNode.Data := lReportInfo;
            end;
          end;
        end;
        lError := FindNext(lSearchRec);
      end;
    finally
      FindClose(lSearchRec);
    end;
  end;

var
  lReportNode: TTreeNode;
  lPath: String;
begin
  lReportNode := tv.Items.Add(nil, Reports);
  lReportNode.ImageIndex := 0;
  lReportNode.SelectedIndex := 0;

  lPath := IncludeTrailingPathDelimiter(APath);
  LoadSubItems(lReportNode, lPath, ALLREPORT);
  LoadSubItems(lReportNode, lPath, ALLDIR);
end;

{ TReportInfo }

constructor TReportInfo.Create;
begin
  inherited Create;
  FMode := rimDirect;
end;


procedure TFrmFileReport.btnOKClick(Sender: TObject);
begin
  Close;
end;

end.
