{$IMPORTEDDATA ON}
unit SBList;

interface
uses
  Classes, SysUtils;

type

  TKeyListItem = class;
  TKeyListItemClass = class of TKeyListItem;
  TKeyList = class;

  TKeyListItem = class
  private
    FOwner: TKeyList;
    FOriginalAddress: Pointer;
    procedure SetOwnerList(const Owner: TKeyList);
  protected
    procedure AssignTo(const KeyListItem: TKeyListItem); virtual;
    function CompareWith(const KeyListItem: TKeyListItem): Integer; virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Owner: TKeyList read FOwner;
  end;

  TKeyList = class
  private
    FOwner: TObject;
    FKeyListItemClass: TKeyListItemClass;
    FList: TList;
    FOk_List: Boolean;
    FPositionList: Integer;
    procedure CheckClassType(const KeyListItem: TKeyListItem);
    function CompareItem(const KeyListItem1, KeyListItem2: TKeyListItem): Integer;
    function InsertPosition(const KeyListItem: TKeyListItem): Integer;
    function GetCount: Integer;
    function GetItems(Index: Integer): TKeyListItem;
    procedure SetItems(Index: Integer; Value: TKeyListItem);
    procedure CheckEof;
    procedure CheckBof;
    procedure CheckPosition(const Position: Integer);
  protected
  public
    constructor Create(const KeyListItemClass: TKeyListItemClass); virtual;
    destructor Destroy; override;
    function Add(const KeyListItem: TKeyListItem): Integer;
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Remove(const KeyListItem: TKeyListItem): Integer;

    procedure Update(const KeyListItem: TKeyListItem);
    function Find(const KeyListItem: TKeyListItem): Boolean;
    function GetGreaterEqual(const KeyListItem: TKeyListItem): Boolean;
    function GetLessEqual(const KeyListItem: TKeyListItem): Boolean;
    function GetGreater(const KeyListItem: TKeyListItem): Boolean;
    function GetLess(const KeyListItem: TKeyListItem): Boolean;
    function GetFirst(const KeyListItem: TKeyListItem): Boolean;
    function GetLast(const KeyListItem: TKeyListItem): Boolean;
    function GetNext(const KeyListItem: TKeyListItem): Boolean;
    function GetPrevious(const KeyListItem: TKeyListItem): Boolean;
    function GetPosition: Integer;
    function GoPosition(const Position: Integer): Boolean;
    function GetDirect(const Position: Integer; const KeyListItem: TKeyListItem): Boolean;
    function PositionByAddressItem(const Address: Pointer): Integer;
    function AddressOfPosition(const Position: Integer): Pointer;
    function CurrentItem: TKeyListItem;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TKeyListItem read GetItems write SetItems; default;
    property Ok_List: Boolean read FOk_List;
    property Owner: TObject read FOwner write FOwner;
  end;

  EKeyListError = class(Exception);

implementation

const
  ErrorClassKeyItemListMismatch = 'A lista somente permite listas do tipo %s. O item atual é %s';
  ErrorInvalidPositionList = 'Posição inválida ou início/fim da lista';
  ErrorInvalidSetItem = 'Você só pode setar o item para NIL';
  ErrorAssignClass = 'Classes incompativeis %s e %s';
  ErrorKeyChanged = 'Não é possível alterar os valores da chave';

// TKeyListItem

procedure TKeyListItem.SetOwnerList(const Owner: TKeyList);
begin
  if   (FOwner = nil) then
       FOwner := Owner;
end;

procedure TKeyListItem.AssignTo(const KeyListItem: TKeyListItem);
begin
  if   (ClassType <> KeyListItem.ClassType) then
       raise EKeyListError.CreateFmt(ErrorAssignClass, [ClassName, KeyListItem.ClassName]);
end;

function TKeyListItem.CompareWith(const KeyListItem: TKeyListItem): Integer;
begin
  Result := 0;
end;

constructor TKeyListItem.Create;
begin
  inherited Create;
  FOriginalAddress := Self;
end;

destructor TKeyListItem.Destroy;
begin
  Self := FOriginalAddress;
  if   (FOwner <> nil) then
       FOwner.Remove(Self);
  inherited Destroy;
end;


// TKeyList

procedure TKeyList.CheckClassType(const KeyListItem: TKeyListItem);
begin
  if (FKeyListItemClass <> KeyListItem.ClassType) then
    raise EKeyListError.CreateFmt(ErrorClassKeyItemListMismatch, [FKeyListItemClass.ClassName, KeyListItem.ClassType.ClassName]);
end;

function TKeyList.CompareItem(const KeyListItem1, KeyListItem2: TKeyListItem): Integer;
begin
  Result := KeyListItem1.CompareWith(KeyListItem2);
end;

type
  TPosDirection = (pdForward, pdBackward);

function GetPositionByDirection(const PosDirection: TPosDirection; const List: TKeyList; const KeyListItem: TKeyListItem): Integer;
var
  L, H, I, C: Integer;
begin
  if   (List.FList.Count = 0) then
       Result := -1
  else
       begin
         L := 0;
         H := List.FList.Count - 1;
         while   (L <= H) do
                 begin
                   I := (L + H) shr 1;
                   C := List.CompareItem(TKeyListItem(List.FList[I]), KeyListItem);
//                   C := List.CompareItem(KeyListItem, TKeyListItem(List.FList[I]));
                   if   (C < 0) then
                        begin
                          L := I + 1
                        end
                   else
                        begin
                          H := I - 1;
                          if   (C = 0) then
                                 L := I;
//                                 L := I + 1;
                        end;
                 end;
         Result := L;
       end;
end;

function TKeyList.InsertPosition(const KeyListItem: TKeyListItem): Integer;
begin
  Result := GetPositionByDirection(pdForward, Self, KeyListItem);
end;

constructor TKeyList.Create(const KeyListItemClass: TKeyListItemClass);
begin
  inherited Create;
  FKeyListItemClass := KeyListItemClass;
  FList := TList.Create;
  FPositionList := 0;
end;

destructor TKeyList.Destroy;
begin
  Clear;
  FList.Free;
  inherited Destroy;
end;

function TKeyList.Add(const KeyListItem: TKeyListItem): Integer;
var
  Position: Integer;
begin
  CheckClassType(KeyListItem);
  KeyListItem.SetOwnerList(Self);
  Position := InsertPosition(KeyListItem);
  if   (Position = -1) then
        begin
          FList.Add(KeyListItem);
          FPositionList := FList.Count - 1;
        end
  else
        begin
          FPositionList := Position;
          if   Position <= FList.Count -1 then
               begin
                 if   TKeyListItem(FList[Position]).CompareWith(KeyListItem) = 0 then
                      begin
                        FList.Add(KeyListItem);
                        FPositionList := FList.Count - 1;
                      end
                 else
                      FList.Insert(Position, KeyListItem);
               end
          else
               FList.Insert(Position, KeyListItem);
        end;
  Result := FList.Count;
end;

procedure TKeyList.Clear;
begin
  FPositionList:=0;
  while (FList.Count <> 0) do
    Delete(0);
  FList.Clear;
end;

procedure TKeyList.Delete(const Index: Integer);
begin
  if   (FList[Index] <> nil) then
       begin
         TKeyListItem(FList[Index]).FOwner := nil;
         TKeyListItem(FList[Index]).Free;
         FList.Delete(Index);
       end;
end;

function TKeyList.Remove(const KeyListItem: TKeyListItem): Integer;
begin
  Result := FList.IndexOf(KeyListItem);
  if   (Result <> - 1) then
        Delete(Result);
end;

procedure TKeyList.Update(const KeyListItem: TKeyListItem);
var
  Item: TKeyListItem;
begin
  CheckClassType(KeyListItem);
  Item := TKeyListItem(FList[FPositionList]);
  if   (CompareItem(Item, KeyListItem) <> 0) then
       raise EKeyListError.Create(ErrorKeyChanged);
  KeyListItem.AssignTo(Item);
end;

function TKeyList.Find(const KeyListItem: TKeyListItem): Boolean;
var
  Index: Integer;
begin
  Result := false;
  Index := InsertPosition(KeyListItem);
  if   (Index <> -1)
  and  (Index <= FList.Count - 1) then
       begin
         Result := (TKeyListItem(FList[Index]).CompareWith(KeyListItem) = 0);
         if   Result then
              begin
                TKeyListItem(FList[Index]).AssignTo(KeyListItem);
                FPositionList := Index;
              end;
       end;
  FOk_List := Result;
end;

function TKeyList.GetGreaterEqual(const KeyListItem: TKeyListItem): Boolean;
var
  Index: Integer;
begin
  try
// FALAR com Roosevelt
    try
      CheckEof;
    except

    end;
    Result := false;
    Index := InsertPosition(KeyListItem);
    if   (Index <> -1)
    and  (Index <= FList.Count - 1) then
         begin
           Result := (TKeyListItem(FList[Index]).CompareWith(KeyListItem) >= 0);
           if   Result then
                begin
                  TKeyListItem(FList[Index]).AssignTo(KeyListItem);
                  FPositionList := Index;
                end;
         end;
  except
     on EKeyListError do Result := false;
  else
     raise;
  end;
  FOk_List := Result;
end;

function TKeyList.GetLessEqual(const KeyListItem: TKeyListItem): Boolean;
var
  Index: Integer;
begin
  try
    CheckEof;
    Result := false;
    Index := InsertPosition(KeyListItem);
    if  (Index > 0) 
    and (Index <= FList.Count - 1) then
         begin
           Result := (TKeyListItem(FList[Index]).CompareWith(KeyListItem) <= 0);
           while   (Index >= 0)
           and     (not Result) do
                   begin
                     dec(Index);
                     Result := (TKeyListItem(FList[Index]).CompareWith(KeyListItem) <= 0);
                   end;
           if   Result then
                begin
                  TKeyListItem(FList[Index]).AssignTo(KeyListItem);
                  FPositionList := Index;
                end;
         end
    else   if   (Index > FList.Count - 1) then
           begin
             dec(Index);
             Result := (TKeyListItem(FList[Index]).CompareWith(KeyListItem) <= 0);
             if   Result then
                  begin
                    TKeyListItem(FList[Index]).AssignTo(KeyListItem);
                    FPositionList := Index;
                  end;
           end
    else   if   (TKeyListItem(FList[Index]).CompareWith(KeyListItem) <= 0) then
                begin
                  TKeyListItem(FList[Index]).AssignTo(KeyListItem);
                  Result := true;
                  FPositionList := Index;
                end;
  except
    on EKeyListError do Result := false
  else
    raise;
  end;
  FOk_List := Result;
end;

function TKeyList.GetGreater(const KeyListItem: TKeyListItem): Boolean;
var
  Index: Integer;
begin
  try
    CheckEof;
    Result := false;
    Index := InsertPosition(KeyListItem);
    if   (Index <> -1)
    and  (Index <= FList.Count - 1) then
         begin
           Result := (TKeyListItem(FList[Index]).CompareWith(KeyListItem) > 0);
           while   (Index <= FList.Count - 1)
           and     (not Result) do
                   begin
                     inc(Index);
                     Result := (TKeyListItem(FList[Index]).CompareWith(KeyListItem) > 0);
                   end;
           if   Result then
                begin
                  TKeyListItem(FList[Index]).AssignTo(KeyListItem);
                  FPositionList := Index;
                end;
         end;
  except
    on EKeyListError do Result := false
  else
    raise;
  end;
  FOk_List := Result;
end;

function TKeyList.GetLess(const KeyListItem: TKeyListItem): Boolean;
var
  Index: Integer;
begin
  try
    CheckEof;
    Result := false;
    Index := InsertPosition(KeyListItem);
    if   (Index <> -1)
    and  (Index <= FList.Count - 1) then
         begin
           Result := (TKeyListItem(FList[Index]).CompareWith(KeyListItem) < 0);
           while   (Index >= 0)
           and     (not Result) do
                   begin
                     dec(Index);
                     Result := (TKeyListItem(FList[Index]).CompareWith(KeyListItem) < 0);
                   end;
           if   Result then
                begin
                  TKeyListItem(FList[Index]).AssignTo(KeyListItem);
                  FPositionList := Index;
                end;
         end;
  except
    on EKeyListError do Result := false
  else
    raise;
  end;
  FOk_List := Result;
end;

procedure TKeyList.CheckEof;
begin
  if   (FList.Count = 0)
  or   (FPositionList > FList.Count - 1) then
       raise EKeyListError.Create(ErrorInvalidPositionList);
end;

procedure TKeyList.CheckBof;
begin
  if  (FList.Count = 0)
  or  (FPositionList < 0) then
      raise EKeyListError.Create(ErrorInvalidPositionList);
end;

procedure TKeyList.CheckPosition(const Position: Integer);
begin
  if   (Position < 0)
  and  (Position > FList.Count - 1) then
       raise EKeyListError.Create(ErrorInvalidPositionList);
end;

function TKeyList.GetFirst(const KeyListItem: TKeyListItem): Boolean;
begin
  try
    FPositionList := 0;
    CheckEof;
    TKeyListItem(FList[FPositionList]).AssignTo(KeyListItem);
    FOk_List := true;
  except
    FOk_List := false;
  end;
  Result := FOk_List;
end;

function TKeyList.GetLast(const KeyListItem: TKeyListItem): Boolean;
begin
  try
    FPositionList := FList.Count - 1;
    CheckEof;
    TKeyListItem(FList[FPositionList]).AssignTo(KeyListItem);
    FOk_List := true;
  except
    FOk_List := false;
  end;
  Result := FOk_List;
end;

function TKeyList.GetNext(const KeyListItem: TKeyListItem): Boolean;
begin
  try
    inc(FPositionList);
    CheckEof;
    TKeyListItem(FList[FPositionList]).AssignTo(KeyListItem);
    FOk_List := true;
  except
    FOk_List := false;
    dec(FPositionList);
  end;
  Result := FOk_List;
end;

function TKeyList.GetPrevious(const KeyListItem: TKeyListItem): Boolean;
begin
  try
    dec(FPositionList);
    CheckBof;
    TKeyListItem(FList[FPositionList]).AssignTo(KeyListItem);
    FOk_List := true;
  except
    FOk_List := false;
    inc(FPositionList);
  end;
  Result := FOk_List;
end;

function TKeyList.GetPosition: Integer;
begin
  try
    CheckEof;
    Result := FPositionList;
    FOk_List := True;
  except
    Result := -1;
    FOk_List := false;
  end;
end;

function TKeyList.GoPosition(const Position: Integer): Boolean;
begin
  try
    CheckPosition(Position);
    FPositionList := Position;
    FOk_List := true;
  except
    FOk_List := false;
  end;
  Result := FOk_List;
end;

function TKeyList.GetDirect(const Position: Integer; const KeyListItem: TKeyListItem): Boolean;
begin
  try
    CheckPosition(Position);
    FPositionList := Position;
    TKeyListItem(FList[FPositionList]).AssignTo(KeyListItem);
    FOk_List := true;
  except
    FOk_List := false;
  end;
  Result := FOk_List;
end;

function TKeyList.PositionByAddressItem(const Address: Pointer): Integer;
begin
  Result := FList.IndexOf(Address)
end;

function TKeyList.AddressOfPosition(const Position: Integer): Pointer;
begin
  Result := FList[Position];
end;

function TKeyList.CurrentItem: TKeyListItem;
begin
  if   (FPositionList < FList.Count)
  and  (FPositionList >= 0) then
       Result:=TKeyListItem(FList[FPositionList])
  else
       Result:=Nil;
end;

function TKeyList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TKeyList.GetItems(Index: Integer): TKeyListItem;
begin
  Result := TKeyListItem(FList[Index]);
end;

procedure TKeyList.SetItems(Index: Integer; Value: TKeyListItem);
begin
  if   (Value <> nil) then
       raise EKeyListError.Create(ErrorInvalidSetItem);
  FList[Index] := Value;
end;

end.


