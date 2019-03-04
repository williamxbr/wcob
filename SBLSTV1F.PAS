unit SBLstV1f;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons;

type
  TfrmCalcColumns = class(TForm)
    lvCalcCol: TListView;
    edExpress: TEdit;
    edColumn: TEdit;
    sbtAdd: TSpeedButton;
    sbtDel: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    lbColumn: TListBox;
    Label3: TLabel;
    sbtAccept: TSpeedButton;
    sbtCancel: TSpeedButton;
    chkSum: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbtAddClick(Sender: TObject);
    procedure sbtDelClick(Sender: TObject);
    procedure lbColumnDblClick(Sender: TObject);
    procedure sbtCancelClick(Sender: TObject);
    procedure sbtAcceptClick(Sender: TObject);
    procedure lvCalcColSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);

  private
    { Private declarations }
    FPath: String;
    FSection: String;
    FChanged: Boolean;
    FFileName: String;
    procedure AddColumn;
    procedure DelColumn;
    procedure LoadConfiguration;
    procedure AcceptChanges;
  public
    { Public declarations }
    procedure ConfigureColumns(const APath, AListName: String);
    procedure SetFileName(const AFileName: String);
    property Altered: Boolean read FChanged;
  end;

  TEnumCFG = class(TForm)
  private
    FCombo: TComboBox;
    FOldCFG: String;
    procedure CreateControls;
    function GetCFGNane: String;
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    procedure LoadCFG(const FileName, ListName, OldCFG: String);
    property CFGNane: String read GetCFGNane;
  end;

  TArgumentInput = class(TForm)
  private
    FEdit: TEdit;
    FCombo: TComboBox;
    procedure CreateControls;
    function GetArgument: String;
    function GetColumn: Integer;
    procedure SetArgument(const Value: String);
    procedure SetColumn(const Value: Integer);
    procedure KeyUpConfirm(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    procedure AddColumns(const AColumns: TListColumns);
    property Argument: String read GetArgument write SetArgument;
    property Column: Integer read GetColumn write SetColumn;
  end;

  procedure EnumConfiguration(const FileName, ListName: String; const AList: TStrings);

var
  frmCalcColumns: TfrmCalcColumns;

implementation

{$R *.DFM}

uses IniFiles, GenFunc;

procedure EnumConfiguration(const FileName, ListName: String; const AList: TStrings);
var
  IniFile: TMemIniFile;
  SL: TStringList;
  i: Integer;
  S: String;
begin
  SL := TStringList.Create;
  try
    IniFile := TMemIniFile.Create(FileName);
    try
      IniFile.ReadSections(SL);
    finally
      IniFile.Free;
    end;
    for i := 0 to SL.Count -1 do
      if Pos(ListName, SL[i]) > 0 then
        if (Pos('CFG', SL[i]) <> (Length(SL[i]) - 2)) then
        begin
          S := SL[i];
          Delete(S, Pos(ListName, S), Length(ListName));
          AList.Add(S);
        end;
  finally
    SL.Free;
  end;
end;

  { formato da gravacao da coluna }
  { <nome da coluna> = expressao}

procedure TfrmCalcColumns.FormCreate(Sender: TObject);
begin
  lbColumn.ItemIndex := 0;
  FPath := '';
  FSection := '';
end;

procedure TfrmCalcColumns.sbtAddClick(Sender: TObject);
begin
  if edColumn.Text = '' then
    raise Exception.Create('Nome da Coluna inválido'); 
  if edExpress.Text = '' then
    raise Exception.Create('Expressão inválida');
  AddColumn;
  FChanged := True;
end;

procedure TfrmCalcColumns.sbtDelClick(Sender: TObject);
begin
  DelColumn;
  FChanged := True;
end;

procedure TfrmCalcColumns.AddColumn;
begin
  if lvCalcCol.Selected = nil then
    with lvCalcCol.Items.Add do
    begin
      Caption := edColumn.Text;
      SubItems.Add(edExpress.Text);
      SubItems.Add(BoolStr(chkSum.Checked));
      Data := Pointer(chkSum.Checked);
    end
  else
  begin
    lvCalcCol.Selected.Caption := edColumn.Text;
    lvCalcCol.Selected.SubItems[0] := edExpress.Text;
    lvCalcCol.Selected.SubItems[1] := BoolStr(chkSum.Checked);
    lvCalcCol.Selected.Data := Pointer(chkSum.Checked);
  end;
end;

procedure TfrmCalcColumns.DelColumn;
begin
  lvCalcCol.Selected.Free;
end;

procedure TfrmCalcColumns.lbColumnDblClick(Sender: TObject);
begin
  if lbColumn.ItemIndex <> -1 then
    edExpress.Text := edExpress.Text + 'C' + IntToStr(lbColumn.ItemIndex) + ' ';
  edExpress.SetFocus;
  edExpress.SelStart := Length(edExpress.Text);
end;

procedure TfrmCalcColumns.sbtCancelClick(Sender: TObject);
begin
  Close;
  FChanged := False;
end;

procedure TfrmCalcColumns.sbtAcceptClick(Sender: TObject);
begin
  AcceptChanges;
  Close;
end;

procedure TfrmCalcColumns.AcceptChanges;
var
  IniFile: TMemIniFile;
  i: Integer;
  lSumSection: String;
begin
  IniFile := TMemIniFile.Create(FPath + FFileName);
  try
    lSumSection :=   SumCalcColumnSection(FSection);
    IniFile.EraseSection(FSection);
    IniFile.EraseSection(lSumSection);
    for i := 0 to lvCalcCol.Items.Count -1 do
    begin
      IniFile.WriteString(FSection, lvCalcCol.Items[i].Caption, lvCalcCol.Items[i].SubItems[0]);
      { somente escrever as que nao devem somar as demais serao somadas }
      if not Boolean(lvCalcCol.Items[i].Data) then
        IniFile.WriteString(lSumSection, lvCalcCol.Items[i].Caption, '0');
    end;
    IniFile.UpdateFile;
  finally
    IniFile.Free;
  end;
end;

procedure TfrmCalcColumns.LoadConfiguration;
var
  IniFile: TMemIniFile;
  SL: TStringList;
  SLSum: TStringList;
  i: Integer;
  lSumSection: String;
begin
  IniFile := TMemIniFile.Create(FPath + FFileName);
  SL := TStringList.Create;
  SLSum := TStringList.Create;
  try
    IniFile.ReadSection(FSection, SL);
    lSumSection := SumCalcColumnSection(FSection);
    IniFile.ReadSection(lSumSection, SLSum);
    for i := 0 to SL.Count -1 do
      With lvCalcCol.Items.Add do
      begin
        Caption := SL[i];
        SubItems.Add(IniFile.ReadString(FSection, SL[i], ''));
        Data := Pointer(SLSum.IndexOf(SL[i]) = -1);
        if not Boolean(Data) then
          Data := Pointer(IniFile.ReadString(lSumSection, SL[i], '0') = '1');
        SubItems.Add(BoolStr(Boolean(Data)))
      end;
  finally
    IniFile.Free;
    SL.Free;
    SLSum.Free;
  end;
end;

procedure TfrmCalcColumns.ConfigureColumns(const APath, AListName: String);
begin
  FPath := APath;
  FSection := AListName;
  LoadConfiguration;
  ShowModal;
end;

procedure TfrmCalcColumns.lvCalcColSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin
    edExpress.Text := Item.SubItems[0];
    edColumn.Text := Item.Caption;
    chkSum.Checked := Boolean(Item.Data);
  end;
end;

{ TEnumCFG }

constructor TEnumCFG.CreateNew(AOwner: TComponent; Dummy: Integer = 0);
begin
  inherited CreateNew(AOwner);
  BorderStyle := bsToolWindow;
  CreateControls;
  Width := 200;
  Height := 120;
  Position := poScreenCenter;
end;

procedure TEnumCFG.CreateControls;
begin
  with TLabel.Create(Self) do
  begin
    Caption := 'Configuração';
    Left := 10;
    Top := 10;
    Parent := Self;
  end;

  FCombo := TComboBox.Create(Self);
  FCombo.Left := 10;
  FCombo.Top := 25;
  FCombo.Width := 180;
  FCombo.Style := csDropDownList;
  FCombo.Parent := Self;

  with TButton.Create(Self) do
  begin
    Caption := 'OK';
    Left := 25;
    Top := 50;
    ModalResult := mrOk;
    Parent := Self;
  end;

  with TButton.Create(Self) do
  begin
    Caption := 'Cancelar';
    Left := 110;
    Top := 50;
    ModalResult := mrCancel;
    Parent := Self;
  end;
end;

function TEnumCFG.GetCFGNane: String;
begin
  if FCombo.ItemIndex <> -1 then
    Result := FCombo.Items[FCombo.ItemIndex]
  else Result := FOldCFG;
end;

procedure TEnumCFG.LoadCFG(const FileName, ListName, OldCFG: String);
begin
  FOldCFG := OldCFG;
  FCombo.Items.Clear;
  EnumConfiguration(FileName, ListName, FCombo.Items);
  FCombo.ItemIndex := 0;
end;

{ TArgumentInput }

procedure TArgumentInput.AddColumns(const AColumns: TListColumns);
var
  i: Integer;
begin
  FCombo.Items.Clear;
  for i := 0 to AColumns.Count -1 do
    FCombo.Items.Add(AColumns[i].Caption);
end;

procedure TArgumentInput.CreateControls;
begin
  with TLabel.Create(Self) do
  begin
    Caption := 'Coluna';
    Left := 10;
    Top := 10;
    Parent := Self;
  end;

  FCombo := TComboBox.Create(Self);
  FCombo.Left := 10;
  FCombo.Top := 30;
  FCombo.Width := 100;
  FCombo.Parent := Self;
  FCombo.Style := csDropDownList;

  with TLabel.Create(Self) do
  begin
    Caption := 'Argumento';
    Left := 120;
    Top := 10;
    Parent := Self;
  end;

  FEdit := TEdit.Create(Self);
  FEdit.Left := 120;
  FEdit.Top := 30;
  FEdit.Width := 150;
  FEdit.Parent := Self;
  FEdit.OnKeyUp := KeyUpConfirm;

  with TButton.Create(Self) do
  begin
    Caption := 'OK';
    Left := 105;
    Top := 55;
    ModalResult := mrOk;
    Parent := Self;
  end;

  with TButton.Create(Self) do
  begin
    Caption := 'Cancelar';
    Left := 190;
    Top := 55;
    ModalResult := mrCancel;
    Parent := Self;
  end;
end;

constructor TArgumentInput.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited;
  BorderStyle := bsToolWindow;
  CreateControls;
  Height := 110;
  Width := 300;
  Position := poScreenCenter;
end;

function TArgumentInput.GetArgument: String;
begin
  Result := FEdit.Text;
end;

function TArgumentInput.GetColumn: Integer;
begin
  Result := FCombo.ItemIndex;
end;

procedure TArgumentInput.KeyUpConfirm(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_RETURN) then
    ModalResult := mrOk;
end;

procedure TArgumentInput.SetArgument(const Value: String);
begin
  FEdit.Text := Value;
end;

procedure TArgumentInput.SetColumn(const Value: Integer);
begin
  FCombo.ItemIndex := Value;
end;

procedure TfrmCalcColumns.SetFileName(const AFileName: String);
begin
  FFileName := AFileName;
end;

end.
