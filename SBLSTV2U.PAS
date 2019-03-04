unit SBLSTV2U;

interface

uses SBLstv0u, SBLstV1u, Classes, ComCtrls, Windows, LstFil1u;

type
  TListViewSmartTabularView = class(TListViewTabularView)
  private
    function GetData(const I: Integer): Pointer;
    procedure SetData(const I: Integer; const Value: Pointer);
    function GetAdjustColumns(const Col: Integer): TTabularViewColumn;
    function GetVisualColumns(const Col: Integer): TTabularViewColumn;
  protected
    function NameofRegisterKey: String; override;
  public
    constructor Create(ListView: TListView; const AListViewFilter: TAbstractCustomListViewFilter); override;
    destructor Destroy; override;
    property Data[const I: Integer]: Pointer read GetData write SetData;
    property AdjustColumns[const Col: Integer]: TTabularViewColumn read GetAdjustColumns;
    property VisualColumns[const Col: Integer]: TTabularViewColumn read GetVisualColumns;
    property RegNameSave: String read FRegNameSave write FRegNameSave;
  end;

  PPoint = ^TPoint;

implementation

uses Controls;

{ TListViewSmartTabularView }

constructor TListViewSmartTabularView.Create(ListView: TListView; const AListViewFilter: TAbstractCustomListViewFilter); 
begin
  inherited Create(ListView, AListViewFilter);
  FRegNameSave := '';
end;

destructor TListViewSmartTabularView.Destroy;
begin
  inherited Destroy;
end;

function TListViewSmartTabularView.GetAdjustColumns(const Col: Integer): TTabularViewColumn;
begin
  Result := FOriginalColumnList[Col];
end;

function TListViewSmartTabularView.GetData(const I: Integer): Pointer;
begin
  Result := FDataList[I];
end;

function TListViewSmartTabularView.GetVisualColumns(const Col: Integer): TTabularViewColumn;
begin
  Result := TTabularViewColumn(FListView.Columns[Col].Tag);
end;

function TListViewSmartTabularView.NameofRegisterKey: String;
begin
  Result := inherited NameofRegisterKey + FRegNameSave;
end;

procedure TListViewSmartTabularView.SetData(const I: Integer; const Value: Pointer);
var
  l: Integer;
begin
  for l := FDataList.Count to I do
    FDataList.Add(nil);
  FDataList[I] := Value;
end;

end.
