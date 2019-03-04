unit Preview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Pages, ComCtrls, ToolWin
  {$IFNDEF VER100}, ImgList{$ENDIF};

type
  TPreviewForm = class(TForm)
    PrintDialog1: TPrintDialog;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ToolBar1: TToolBar;
    btnFirst: TToolButton;
    btnPrev: TToolButton;
    btnNext: TToolButton;
    btnLast: TToolButton;
    ToolButton1: TToolButton;
    btnZoomIn: TToolButton;
    btnZoomOut: TToolButton;
    ToolButton2: TToolButton;
    btnPrint: TToolButton;
    ToolButton3: TToolButton;
    btnClose: TToolButton;
    procedure BtnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pages1PreviewPageChanged(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure Pages1ZoomChanged(Sender: TObject; Zoom: Integer;
      ZoomStatus: TZoomStatus);
  private
    ZoomIndex: integer;
    procedure UpdateNavButtons;

  public
    Pages1: TPages;
  end;

var
  PreviewForm: TPreviewForm;

const
  crMagnify = 2;
  zoom: array [ 0.. 5 ] of integer = (25, 50, 75, 100, 150, 200);

implementation

{$R *.DFM}
{$R MagGlass.res}


//------------------------------------------------------------------------------
// TPreviewForm methods ...
//------------------------------------------------------------------------------

procedure TPreviewForm.FormCreate(Sender: TObject);
begin
  Pages1 := TPages.Create(self);
  Pages1.Parent := self;
  Pages1.Align := alClient;
  Pages1.OnPreviewPageChanged := Pages1PreviewPageChanged;
  Pages1.OnZoomChanged := Pages1ZoomChanged;
  
  Screen.Cursors[crMagnify] := LoadCursor(HInstance, 'MGLASS');
  Pages1.cursor := crMagnify;
end;
//------------------------------------------------------------------------------

procedure TPreviewForm.FormShow(Sender: TObject);
begin
  WindowState := wsNormal;
  //align on top of mainform ...
  with application.mainform do
    self.setbounds(left,top,width,height);

  Pages1.Zoom := PAGE_FIT;
  if Pages1.PageCount > 1 then
  begin
    btnNext.enabled := true;
    btnLast.enabled := true;
  end;
  Statusbar1.Panels[2].Text :=
    CurrentPrinterName + '  -  '+ CurrentPrinterPaperSize;

end;
//------------------------------------------------------------------------------

procedure TPreviewForm.btnFirstClick(Sender: TObject);
begin
  //page navigation button pressed
  with Pages1 do
  begin
    //display the appropriate page ...
    perform(WM_SETREDRAW,0,0);
    if Sender = btnFirst then
      Page := 1
    else if Sender = btnPrev then
      Page := Page-1
    else if Sender = btnNext then
      Page := Page+1
    else
      Page := PageCount;
    VertScrollbar.position := 0;
    HorzScrollbar.position := 0;
    perform(WM_SETREDRAW,1,0);
    invalidate;
  end;
  UpdateNavButtons;
end;
//------------------------------------------------------------------------------

procedure TPreviewForm.btnZoomInClick(Sender: TObject);
begin
  if ZoomIndex = 5 then exit;
  inc(ZoomIndex);
  Pages1.zoom := zoom[ZoomIndex];
end;
//------------------------------------------------------------------------------

procedure TPreviewForm.btnZoomOutClick(Sender: TObject);
begin
  if ZoomIndex = 0 then exit;
  dec(ZoomIndex);
  Pages1.zoom := zoom[ZoomIndex];
end;
//------------------------------------------------------------------------------

procedure TPreviewForm.BtnPrintClick(Sender: TObject);
begin
  with PrintDialog1 do
  begin
    MinPage := 1;
    MaxPage := Pages1.PageCount;
    FromPage := 1;
    ToPage := MaxPage;
    Copies := 1;
    if execute then
    begin
      screen.cursor := crHourglass;
      try
        Pages1.printpages(FromPage,ToPage);
      finally
        screen.cursor := crDefault;
      end;
      close;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TPreviewForm.BtnCloseClick(Sender: TObject);
begin
  close;
end;
//------------------------------------------------------------------------------

procedure TPreviewForm.Pages1PreviewPageChanged(Sender: TObject);
begin
  with Pages1 do
    Statusbar1.Panels[0].Text := format('  Page %d of %d',[Page,PageCount]);
  UpdateNavButtons;
end;
//------------------------------------------------------------------------------

procedure TPreviewForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;
//------------------------------------------------------------------------------

procedure TPreviewForm.UpdateNavButtons;
begin
  with Pages1 do
  begin
    if Page = 1 then
    begin
      btnFirst.enabled := false;
      btnPrev.enabled := false;
    end else
    begin
      btnFirst.enabled := true;
      btnPrev.enabled := true;
    end;
    if Page = PageCount then
    begin
      btnNext.enabled := false;
      btnLast.enabled := false;
    end else
    begin
      btnNext.enabled := true;
      btnLast.enabled := true;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TPreviewForm.Pages1ZoomChanged(Sender: TObject;
  Zoom: Integer; ZoomStatus: TZoomStatus);
begin
  if Zoom <= 25 then
    ZoomIndex := 0
  else if Zoom <= 50 then
    ZoomIndex := 1
  else if Zoom <= 75 then
    ZoomIndex := 2
  else if Zoom <= 100 then
    ZoomIndex := 3
  else if Zoom <= 150 then
    ZoomIndex := 4
  else
    ZoomIndex := 5;
  case ZoomStatus of
    zsPercent: Statusbar1.Panels[1].Text := inttostr(Zoom) +'%';
    zsFit: Statusbar1.Panels[1].Text := 'Fit';
    else Statusbar1.Panels[1].Text := 'Width';
  end;
end;
//------------------------------------------------------------------------------

end.
