unit SBLstV0f;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, CheckLst, ExtCtrls, NumericEdit;

type
  TFSBColumnConf = class(TForm)
    Panel1: TPanel;
    sbtAccept: TSpeedButton;
    sbtCancel: TSpeedButton;
    cmbImpMode: TComboBox;
    Label2: TLabel;
    Panel2: TPanel;
    sbtSaveas: TSpeedButton;
    sbtLoadas: TSpeedButton;
    sbtUp: TSpeedButton;
    sbtDown: TSpeedButton;
    sbtAll: TSpeedButton;
    sbtOriginal: TSpeedButton;
    sbtDelete: TSpeedButton;
    CbLarguraFixa: TCheckBox;
    sbtSaveToReport: TSpeedButton;
    sbtFont: TSpeedButton;
    sbtColCalc: TSpeedButton;
    CbCorRelatorio: TCheckBox;
    clbColumns: TCheckListBox;
    procedure sbtAcceptClick(Sender: TObject);
    procedure sbtCancelClick(Sender: TObject);
    procedure sbtUpClick(Sender: TObject);
    procedure sbtDownClick(Sender: TObject);
    procedure clbColumnsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure clbColumnsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtOriginalClick(Sender: TObject);
    procedure sbtAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtFontClick(Sender: TObject);
    procedure clbColumnsDblClick(Sender: TObject);
    procedure clbColumnsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure clbColumnsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
    FOnOriginalClick: TNotifyEvent;
    FChecked: Boolean;
    FontDlg: TFontDialog;
    FList: TList;
    procedure ChageItem(Index1, Index2: Integer);
//    function GetFixColumns: Integer;
//    procedure SetFixColumns(const Value: Integer);
    function GetFont: TFont;
    procedure SetFont(const Value: TFont);
    procedure DoSelectFont;
    function CanChange(const AItemIndex: Integer; const NewPos: Integer): Boolean;
    function GetImpMode: Integer;
    procedure SetImpMode(const Value: Integer);
{begin Arnoldo - 25/07/2001}
    function GerCorRelatorio : Boolean;
    Procedure SetCorRelatorio (Valor : Boolean);
{End Arnoldo - 25/07/2001}
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
    function GetLarguraFixa : Boolean;
    Procedure SetLarguraFixa (Valor : Boolean);
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property OnOriginalClick: TNotifyEvent read FOnOriginalClick write FOnOriginalClick;
//    property FixColumns: Integer read GetFixColumns write SetFixColumns;
    property Font: TFont read GetFont write SetFont;
    property List: TList read FList write FList;
    property ImpMode: Integer read GetImpMode write SetImpMode;
{begin Arnoldo - 25/07/2001}
    Property CorRelatorio : Boolean Read GerCorRelatorio write SetCorRelatorio;
{End Arnoldo - 25/07/2001}
{ Arnoldo - Início - 30/09/2005 - Tecnologia}
    Property LarguraFixa  : Boolean Read GetLarguraFixa Write SetLarguraFixa;
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}
  end;

implementation

{$R *.DFM}

procedure TFSBColumnConf.ChageItem(Index1, Index2: Integer);
var S: String;
    Chk: Boolean;
    Obj: Pointer;
{ Arnoldo - Início - 22/06/2005 - Tecnologia}
    ien: Boolean;
begin
  S:=clbColumns.Items[Index1];
  Chk:=clbColumns.Checked[Index1];
  Obj:=clbColumns.Items.Objects[Index1];
  ien:=clbColumns.ItemEnabled[Index1];

  clbColumns.Items[Index1]:=clbColumns.Items[Index2];
  clbColumns.Checked[Index1]:=clbColumns.Checked[Index2];
  clbColumns.Items.Objects[Index1]:=clbColumns.Items.Objects[Index2];
  clbColumns.ItemEnabled[Index1] := clbColumns.ItemEnabled[Index2];

  clbColumns.Items[Index2]:=S;
  clbColumns.Checked[Index2]:=Chk;
  clbColumns.Items.Objects[Index2]:=Obj;
  clbColumns.ItemEnabled[Index2] := ien;
{ Arnoldo - Fim - 22/06/2005 - Tecnologia}
end;

procedure TFSBColumnConf.sbtAcceptClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TFSBColumnConf.sbtCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFSBColumnConf.sbtUpClick(Sender: TObject);
begin
  if clbColumns.ItemIndex > 0 then
    if CanChange(clbColumns.ItemIndex, clbColumns.ItemIndex - 1) then
    begin
      ChageItem(clbColumns.ItemIndex, clbColumns.ItemIndex - 1);
      if Sender <> Nil then
        clbColumns.ItemIndex:=clbColumns.ItemIndex - 1;
    end;
end;

procedure TFSBColumnConf.sbtDownClick(Sender: TObject);
begin
  if   (clbColumns.ItemIndex >= 0)
  and  (clbColumns.ItemIndex < clbColumns.Items.Count - 1) then
    if CanChange(clbColumns.ItemIndex, clbColumns.ItemIndex + 1) then
    begin
      ChageItem(clbColumns.ItemIndex, clbColumns.ItemIndex + 1);
      if   Sender <> Nil then
           clbColumns.ItemIndex:=clbColumns.ItemIndex + 1;
    end;
end;

procedure TFSBColumnConf.clbColumnsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_RETURN: sbtAcceptClick(Nil);
  VK_ESCAPE: sbtCancelClick(Nil);
  end;
end;

procedure TFSBColumnConf.clbColumnsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_UP: if ssCtrl in Shift then sbtUpClick(Nil);
  VK_DOWN: if ssCtrl in Shift then sbtDownClick(Nil);
  end;
end;

procedure TFSBColumnConf.sbtOriginalClick(Sender: TObject);
begin
  if   Assigned(FOnOriginalClick) then
       FOnOriginalClick(sbtOriginal);
end;

procedure TFSBColumnConf.sbtAllClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to clbColumns.Items.Count -1 do
    clbColumns.Checked[i] := FChecked;
  FChecked := not FChecked;
end;

procedure TFSBColumnConf.FormCreate(Sender: TObject);
begin
  FChecked := True;
end;

(*function TFSBColumnConf.GetFixColumns: Integer;
begin
  Result := ieFixColumn.IntegerNumber;
end;

procedure TFSBColumnConf.SetFixColumns(const Value: Integer);
begin
  ieFixColumn.IntegerNumber := Value;
end;*)

procedure TFSBColumnConf.DoSelectFont;
begin
  FontDlg.Execute;
end;

constructor TFSBColumnConf.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FontDlg := TFontDialog.Create(Self);
end;

destructor TFSBColumnConf.Destroy;
begin
  FontDlg.Free;
  inherited Destroy;
end;

procedure TFSBColumnConf.sbtFontClick(Sender: TObject);
begin
  DoSelectFont;
end;

function TFSBColumnConf.GetFont: TFont;
begin
  Result := FontDlg.Font;
end;

procedure TFSBColumnConf.SetFont(const Value: TFont);
begin
  FontDlg.Font := Value;
end;

function TFSBColumnConf.CanChange(const AItemIndex: Integer; const NewPos: Integer): Boolean;
var
  i: Integer;
begin
  if FList <> nil then
  begin
    i := FList.IndexOf(Pointer(AItemIndex));
    Result := i = -1;
    if Result then
    begin
      i := FList.IndexOf(Pointer(NewPos));
      if i <> -1 then
        Result := (NewPos <> Longint(FList[i]));
    end
    else
      Result := (AItemIndex > NewPos);
  end
  else Result := True;
end;

function TFSBColumnConf.GetImpMode: Integer;
begin
  Result := cmbImpMode.ItemIndex;
end;

procedure TFSBColumnConf.SetImpMode(const Value: Integer);
begin
  cmbImpMode.ItemIndex := Value;
end;

procedure TFSBColumnConf.clbColumnsDblClick(Sender: TObject);
begin
  if clbColumns.ItemIndex <> -1 then
    clbColumns.Items[clbColumns.ItemIndex] := InputBox(clbColumns.Items[clbColumns.ItemIndex], 'Novo Titulo', clbColumns.Items[clbColumns.ItemIndex]);
end;

{begin Arnoldo - 25/07/2001}
function TFSBColumnConf.GerCorRelatorio : Boolean;
begin
  Result:=CbCorRelatorio.Checked;
end;

Procedure TFSBColumnConf.SetCorRelatorio (Valor : Boolean);
begin
  CbCorRelatorio.Checked:=Valor;
end;
{End Arnoldo - 25/07/2001}

{ Arnoldo - Início - 30/09/2005 - Tecnologia}
function TFSBColumnConf.GetLarguraFixa : Boolean;
begin
  Result := CbLarguraFixa.Checked;
end;

Procedure TFSBColumnConf.SetLarguraFixa (Valor : Boolean);
begin
  CbLarguraFixa.Checked := Valor;
end;
{ Arnoldo - Fim - 30/09/2005 - Tecnologia}

{Lino.OpTextil.Begin - 31.03.2006 - Melhorias Gerais, mover colunas com o mouse}
procedure TFSBColumnConf.clbColumnsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
Var P: TPoint;
    lbIndex  : Byte;    //Previsto que não tenha mais que 255 colunas
    lsStrItem: String;
    loObjeto : TObject;
    lbStatus : Boolean;
begin
  Try
    P.X:= X;
    P.Y:= Y;
    loObjeto:= Nil;
    lbIndex := clbColumns.ItemAtPos(P, True);
    If   lbIndex < clbColumns.Count Then
         With clbColumns Do
           Begin
             // Pegando informações do item original
             lsStrItem:= Items.Strings[clbColumns.ItemIndex];
             If   Assigned(Items.Objects[clbColumns.ItemIndex]) Then
                  loObjeto := Items.Objects[clbColumns.ItemIndex];
             lbStatus := Checked[clbColumns.ItemIndex];
             Items.Delete(clbColumns.ItemIndex);

             // Inserindo item na posição nova
             If   Assigned(loObjeto) Then
                  Items.InsertObject(lbIndex, lsStrItem, loObjeto)
             Else
                  Items.Insert(lbIndex, lsStrItem);
             Checked[lbIndex]:= lbStatus;
           End;
  Except

  End;
end;
{Lino.OpTextil.End - 31.03.2006 - Melhorias Gerais, mover colunas com o mouse}

{Lino.OpTextil.Begin - 02.05.2006 - Melhorias Gerais, mover colunas com o mouse}
procedure TFSBColumnConf.clbColumnsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TCheckListBox);
end;
{Lino.OpTextil.End - 02.05.2006 - Melhorias Gerais, mover colunas com o mouse}

end.
