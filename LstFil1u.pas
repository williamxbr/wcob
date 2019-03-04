unit LstFil1u;

interface

uses SBLstV3u;

type
  TAbstractCustomListViewFilter = class
  protected
    FFilterInf: TFilterInf;
  public
    // alteracao salvar filtro
    function GetRealColumnIndex(const AVisualIndex: Longint): Longint; virtual;
    property FilterInf: TFilterInf read FFilterInf;
  end;

implementation

{ TAbstractCustomListViewFilter }

function TAbstractCustomListViewFilter.GetRealColumnIndex(
  const AVisualIndex: Integer): Longint;
begin
  Result := AVisualIndex;
end;

end.
 