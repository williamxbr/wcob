unit SBLstV4f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, SBLstV3u, LstFil1u, ExtCtrls, ComCtrls, SBLstV0u,
  Grids, SBLstv2u;

type
  TfrmFilter = class(TForm)
    pnlBase: TPanel;
    ckSumValue: TCheckBox;
    sbtAccept: TSpeedButton;
    sbtCancel: TSpeedButton;
    sgFilter: TStringGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure sbtAcceptClick(Sender: TObject);
    procedure sbtCancelClick(Sender: TObject);
    procedure sgFilterSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    FFilter: TFilterInf;
    FCustomListViewFilter: TAbstractCustomListViewFilter;
    FSmartTabularView: TListViewSmartTabularView;
    FListView: TListView;
    // controles para a tela
    FComboColuna: TComboBox;
    FComboValor: TComboBox;
    FComboCond: TComboBox;
    FComboOrder: TComboBox;
    FComboOper: TComboBox;

    procedure DisplayFilter;
    procedure SaveFilter;
    procedure SetFilter(const Value: TFilterInf);
    procedure LoadValuesTo(const AColumnName: String; AItems: TStrings);
    procedure LoadColumns;
    procedure ComboColunaChange(Sender: TObject);
    procedure ComboColunaExit(Sender: TObject);
    procedure ComboValorExit(Sender: TObject);
    procedure ComboCondExit(Sender: TObject);
    procedure ComboOrderExit(Sender: TObject);
    procedure ComboOperExit(Sender: TObject);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure SetListViewFilter(const AListView: TListView; const AListViewFilter: TAbstractCustomListViewFilter);
    procedure SetListViewSmartTabularView(const AListViewSmartTabularView: TListViewSmartTabularView);
    property Filter: TFilterInf read FFilter write SetFilter;
  end;

var
  frmFilter: TfrmFilter;

implementation

uses Types;

{$R *.dfm}

const
  STR_DESC = 'Desc';
  STR_ASC = 'Asc';
  STR_AND = 'E';
  STR_OR = 'OU';

{ TSBLstV2fForm }

procedure TfrmFilter.Clear;
begin
  FFilter.Clear;
end;

constructor TfrmFilter.Create(AOwner: TComponent);

  function CreateCombo: TComboBox;
  begin
    Result :=TComboBox.Create(Self);
    Result.Parent := Self;
    Result.Hide;
  end;

begin
  inherited Create(AOwner);
  FFilter := TFilterInf.Create;
  sgFilter.Cells[0, 0] := 'Operador';
  sgFilter.Cells[1, 0] := 'Coluna';
  sgFilter.Cells[2, 0] := 'Condição';
  sgFilter.Cells[3, 0] := 'Valor';
  sgFilter.Cells[4, 0] := 'Ordem';

  FComboColuna := CreateCombo;
  FComboColuna.OnExit := ComboColunaExit;
  FComboValor := CreateCombo;
  FComboValor.OnExit := ComboValorExit;
  FComboCond := CreateCombo;
  FComboCond.OnExit := ComboCondExit;
  FComboOrder := CreateCombo;
  FComboOrder.OnExit := ComboOrderExit;
  FComboOper := CreateCombo;
  FComboOper.OnExit := ComboOperExit;

  FSmartTabularView := nil;
end;

destructor TfrmFilter.Destroy;
begin
  FComboColuna.Free;
  FComboValor.Free;
  FComboCond.Free;
  FComboOrder.Free;
  FComboOper.Free;

  FFilter.Free;
  inherited Destroy;
end;

procedure TfrmFilter.DisplayFilter;
var
  iFilter: Longint;
  lVisualIndex: Longint;
begin
  //***********
  if FFilter.FilterCount > 0 then
    sgFilter.RowCount := FFilter.FilterCount + 1;
  for iFilter := 0 to FFilter.FilterCount - 1 do
  begin
    sgFilter.Cells[0, iFilter + 1] := STR_CONDITION[FFilter.Filter[iFilter].Condition];
    // ISTO NÃO É A COLUNA VISUAL ACERTAR
    lVisualIndex := FSmartTabularView.AdjustColumns[FFilter.Filter[iFilter].Column].VisualIndex;
    if lVisualIndex = -1 then
      raise ESmartListView.Create('Coluna ' + FSmartTabularView.AdjustColumns[FFilter.Filter[iFilter].Column].Caption + ' não está visível');
    sgFilter.Cells[1, iFilter + 1] := FComboColuna.Items[lVisualIndex];
    sgFilter.Cells[2, iFilter + 1] := STR_Operand[FFilter.Filter[iFilter].Operand];
    sgFilter.Cells[3, iFilter + 1] := FFilter.Filter[iFilter].Value;
    if FFilter.Filter[iFilter].Order = otAsc then
      sgFilter.Cells[4, iFilter + 1] := STR_ASC
    else sgFilter.Cells[4, iFilter + 1] := STR_DESC;
  end;
end;

procedure TfrmFilter.SaveFilter;

  function StrtoOrderType(const AOrderType: String): TOrderType;
  begin
    if AOrderType = STR_DESC then
      Result := otDesc
    else Result := otAsc;
  end;

  function StrtoCondition(const ACondition: String): TCondition;
  begin
    if ACondition = STR_AND then
      Result := cAnd
    else Result := cOr;
  end;

  function StrtoOperand(const AOperand: String): TOperand;
  var
    cOper: TOperand;
  begin
    Result := Low(TOperand);
    for cOper := Low(TOperand) to High(TOperand) do
      if AOperand = STR_OPERAND[cOper] then
      begin
        Result := cOper;
        Break;
      end;
  end;
  
var
  lFilterInfo: TFilterInformation;
  iFilter: Longint;
  iColumn: Longint;
begin
  FFilter.Clear;

  for iFilter := 1 to sgFilter.RowCount -1 do
  begin
    if sgFilter.Cells[1, iFilter] <> '' then
    begin
      iColumn := FComboColuna.Items.IndexOf(sgFilter.Cells[1, iFilter]);
      if iColumn = -1 then
        raise Exception.Create('Coluna não encontrada ' + sgFilter.Cells[1, iFilter]);

      lFilterInfo := TFilterInformation.Create(FFilter);
      lFilterInfo.Column := FCustomListViewFilter.GetRealColumnIndex(iColumn);
      lFilterInfo.Order := StrtoOrderType(sgFilter.Cells[4, iFilter]);
      lFilterInfo.Value := sgFilter.Cells[3, iFilter];
      lFilterInfo.Condition := StrtoCondition(sgFilter.Cells[0, iFilter]);
      lFilterInfo.Operand := StrtoOperand(sgFilter.Cells[2, iFilter]);
      FFilter.AddFilter(lFilterInfo);
    end;
  end;
  
  FFilter.SumValues := ckSumValue.Checked;
end;

procedure TfrmFilter.SetFilter(const Value: TFilterInf);
begin
  FFilter.Assign(Value);
  DisplayFilter;
end;

procedure TfrmFilter.SetListViewFilter(const AListView: TListView; const AListViewFilter: TAbstractCustomListViewFilter);
begin
  FListView := AListView;
  FCustomListViewFilter := AListViewFilter;
  FFilter.OnGetColumnName := FCustomListViewFilter.FilterInf.OnGetColumnName;

  LoadColumns;
end;

procedure TfrmFilter.sbtAcceptClick(Sender: TObject);
begin
  sgFilter.SetFocus;
  SaveFilter;
  ModalResult := mrOk;
end;

procedure TfrmFilter.sbtCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFilter.comboColunaChange(Sender: TObject);
begin
  LoadValuesTo(FComboColuna.Text, FComboValor.Items);
  FComboValor.text := '';
end;

procedure TfrmFilter.LoadValuesTo(const AColumnName: String;
  AItems: TStrings);
var
  index, coluna : Integer;
  Item_ListView : String;
begin
  coluna := 0;
  if AColumnName <> '' then
    begin
      for index := 0 to FListView.Columns.Count -1 do
        if AColumnName = FListView.Columns[index].Caption then
          coluna := index;
      AItems.Clear;
      for  index := 0 to FListView.Items.Count -1 do
        begin
          if   Coluna = 0 then
              Item_ListView := FListView.Items[index].Caption
          Else
              Item_ListView := FListView.Items[index].SubItems[Coluna -1];
          if   trim(Item_ListView) > '' Then
               AItems.Add(Item_ListView);
       end;
    end;
end;

procedure TfrmFilter.LoadColumns;
var
  index: Longint;
  operand: TOperand;
begin
  for index := 0 to FListView.Columns.Count -1 do
    FComboColuna.Items.Add(FListView.Columns[index].Caption);

  for operand := Low(TOperand) to High(TOperand) do
    FComboCond.Items.Add(STR_Operand[operand]);

  FComboColuna.ItemIndex := 0;

  FComboOper.Items.Add(STR_AND);
  FComboOper.Items.Add(STR_OR);

  FComboOrder.Items.Add(STR_ASC);
  FComboOrder.Items.Add(STR_DESC);

  FComboColuna.OnChange := ComboColunaChange;
end;

procedure TfrmFilter.sgFilterSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  lRect: TRect;
begin
  FComboColuna.Hide;
  FComboValor.Hide;
  FComboCond.Hide;
  FComboOrder.Hide;
  FComboOper.Hide;
  lRect := sgFilter.CellRect(ACol, ARow);
  lRect.Left := lRect.Left + sgFilter.Left;
  lRect.Right := lRect.Right + sgFilter.Left;
  lRect.Top := lRect.Top + sgFilter.Top;
  lRect.Bottom := lRect.Bottom + sgFilter.Top;
  case ACol of
    0:
    begin
      if ARow > 1 then
      begin
        FComboOper.BoundsRect := lRect;
        FComboOper.Show;
        FComboOper.Text := sgFilter.Cells[ACol, ARow];
      end;
    end;
    1:
    begin
      FComboColuna.BoundsRect := lRect;
      FComboColuna.Show;
      FComboColuna.Text := sgFilter.Cells[ACol, ARow];
    end;
    2:
    begin
      FComboCond.BoundsRect := lRect;
      FComboCond.Show;
      FComboCond.Text := sgFilter.Cells[ACol, ARow];
    end;
    3:
    begin
      FComboValor.BoundsRect := lRect;
      FComboValor.Show;
      FComboValor.Text := sgFilter.Cells[ACol, ARow];
    end;
    4:
    begin
      FComboOrder.BoundsRect := lRect;
      FComboOrder.Show;
      FComboOrder.Text := sgFilter.Cells[ACol, ARow];
    end;
  end;
  LoadValuesTo(sgFilter.Cells[1, ARow], FComboValor.Items);
  FComboValor.text := '';
end;

procedure TfrmFilter.ComboColunaExit(Sender: TObject);
begin
  sgFilter.Cells[1, sgFilter.Row] := FComboColuna.Text;
end;

procedure TfrmFilter.ComboCondExit(Sender: TObject);
begin
  sgFilter.Cells[2, sgFilter.Row] := FComboCond.Text;
end;

procedure TfrmFilter.ComboOperExit(Sender: TObject);
begin
  sgFilter.Cells[0, sgFilter.Row] := FComboOper.Text;
end;

procedure TfrmFilter.ComboOrderExit(Sender: TObject);
begin
  sgFilter.Cells[4, sgFilter.Row] := FComboOrder.Text;
end;

procedure TfrmFilter.ComboValorExit(Sender: TObject);
begin
  sgFilter.Cells[3, sgFilter.Row] := FComboValor.Text;
end;

procedure TfrmFilter.SpeedButton1Click(Sender: TObject);
begin
  sgFilter.RowCount := sgFilter.RowCount + 1;
end;

procedure TfrmFilter.SpeedButton2Click(Sender: TObject);
begin
  if sgFilter.RowCount > 2 then
    sgFilter.RowCount := sgFilter.RowCount - 1;
end;

procedure TfrmFilter.SetListViewSmartTabularView(
  const AListViewSmartTabularView: TListViewSmartTabularView);
begin
  FSmartTabularView := AListViewSmartTabularView;
end;

end.
