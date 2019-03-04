unit NumericEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, EditBind;

type
  TNumericEdit = class(TDataBindEdit) // TCustomEdit)
  private
    { Private declarations }
    FormatSettings: TFormatSettings;
    FOnBtnClick: TNotifyEvent;
    function GetShowButton: Boolean;
    procedure SetShowButton(Value: Boolean);
    function GetColor: TColor;
    procedure SetColor(const Value: TColor);
  protected
    { Protected declarations }
    FBtn: TSpeedButton;
    procedure UpdateButtonPosition; virtual;
    function ValidateChar(var Key: Char): Boolean; virtual; abstract;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DoEnter; override;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WindowPosChanged;
    procedure InternalClick(Sender: TObject); virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    { quando mudar a fonte durante o programa recalular o botao }
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
  public
    { Public declarations }
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property OnBtnClick: TNotifyEvent read FOnBtnClick write FOnBtnClick;
    property ShowButton: Boolean read GetShowButton write SetShowButton;
    property MaxLength;
    property AutoSelect;
    property AutoSize;
    property Anchors;
    property BorderStyle;
    property CharCase;
    property Color: TColor read GetColor write SetColor;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

  TIntegerEdit = class(TNumericEdit)
  private
    function GetNumberInteger: Integer;
    procedure SetNumberInteger(Value: Integer);
    function GetIsNull: Boolean;
  protected
    function ValidateChar(var Key: Char): Boolean; override;
    procedure KeyPress(var Key: Char); override;
    procedure WriteValue; override;
    procedure ReadValue; override;
  public
    property IntegerNumber: Integer read GetNumberInteger write SetNumberInteger;
    property IsNull: Boolean read GetIsNull;
  end;

  TFloatEdit = class(TNumericEdit)
  private
    FDecimals: Byte;
    FDigits  : Byte;
    FMascara : String;
    FComMascara : Boolean;

    function GetIsNull: Boolean;
  protected
    function GetNumberFloat: Double;
    procedure SetNumberFloat(Value: Double); virtual;
    function ValidateChar(var Key: Char): Boolean; override;
    procedure KeyPress(var Key: Char); override;
    function GetMaxSelection: Integer; virtual;
    Function TiraZerosaEsquerda(Valor:String):String;
    procedure WriteValue; override;
    procedure ReadValue; override;
  public
    constructor Create(Owner: TComponent); override;
    property FloatNumber: Double read GetNumberFloat write SetNumberFloat;
    property IsNull: Boolean read GetIsNull;
  published
    property Decimals: Byte read FDecimals write FDecimals default 2;
    property Digits: Byte read FDigits write FDigits default 14;
    Property Mascara : String Read FMascara Write FMascara;
    Property ComMascara : Boolean Read FComMascara Write FComMascara;
  end;

  TFloatEdit2 = class(TFloatEdit)
  private
    function GetDecimals: Byte;
  protected
    FDecimalOk: Boolean;
    procedure PreencheDecimais;
    procedure KeyPress(var Key: Char); override;
    function GetMaxSelection: Integer; override;
    procedure SetDecimals(Value: Byte);
    procedure SetNumberFloat(Value: Double); override;
  published
    property Decimals: Byte read GetDecimals write SetDecimals;
  end;

  TTimeEdit = class(TDataBindEdit)
  private
    FOnBtnClick: TNotifyEvent;
    procedure UpdateButtonPosition;
    function GetShowButton: Boolean;
    procedure SetShowButton(Value: Boolean);
    function GetTime: TDateTime;
    procedure SetTime(Value: TDateTime);
    function GetIsNull: Boolean;
  protected
    FBtn: TSpeedButton;
    procedure KeyPress(var Key: Char); override;
    procedure DoExit; override;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WindowPosChanged;
    procedure InternalClick(Sender: TObject); virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WriteValue; override;
    procedure ReadValue; override;
  public
    destructor Destroy; override;
    property Time: TDateTime read GetTime write SetTime;
    property IsNull: Boolean read GetIsNull;
    constructor Create(AOwner: TComponent); override;
  published
    property ShowButton: Boolean read GetShowButton write SetShowButton;
    property OnBtnClick: TNotifyEvent read FOnBtnClick write FOnBtnClick;
    property AutoSelect;
    property AutoSize;
    property Anchors;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

  TDateTimeEdit = class(TDataBindEdit)
  private
    FOnBtnClick: TNotifyEvent;
    procedure UpdateButtonPosition;
    function GetShowButton: Boolean;
    procedure SetShowButton(Value: Boolean);
    function GetDateTime: TDateTime;
    procedure SetDateTime(Value: TDateTime);
    function GetIsNull: Boolean;
  protected
    FBtn: TSpeedButton;
    procedure KeyPress(var Key: Char); override;
    procedure DoExit; override;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WindowPosChanged;
    procedure InternalClick(Sender: TObject); virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WriteValue; override;
    procedure ReadValue; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property DateTime: TDateTime read GetDateTime write SetDateTime;
    property IsNull: Boolean read GetIsNull;
  published
    property ShowButton: Boolean read GetShowButton write SetShowButton;
    property OnBtnClick: TNotifyEvent read FOnBtnClick write FOnBtnClick;
    property AutoSelect;
    property AutoSize;
    property Anchors;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

  TModeEdit = (meInteger, meFloat, meAlpha, meDate, meTime, meDateTime);

  TMorphoEdit = class(TNumericEdit)
  private
    FModeEdit: TModeEdit;
    procedure SetModeEdit(Value: TModeEdit);
  protected
    procedure UpdateButtonPosition; override;
    function ValidateChar(var Key: Char): Boolean; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure KeyPress(var Key: Char); override;
    procedure DoExit; override;
    procedure WriteValue; override;
    procedure ReadValue; override;
  public
    constructor Create(Owner: TComponent); override;
  published
    property ModeEdit: TModeEdit read FModeEdit write SetModeEdit;
    property MaxLength;
  end;

implementation

const
  MsgInvalidDate = 'Você precisa especificar uma data válida';
  MsgInvalidTime = 'Você precisa especificar uma hora válida';
  MsgInvalidDateTime = 'Você precisa especificar uma Date e/ou hora válida';

procedure TNumericEdit.UpdateButtonPosition;
var
  Rec: TRect;
  lText: TCaption;
begin
  lText := Text;
  Text := '';
  Rec.Top := 0;
  Rec.Left := 0;
  Rec.Bottom := Height;
  Rec.Right := ClientWidth;
  if (FBtn <> nil) then
  begin
    FBtn.Top := 0;
    FBtn.Height := ClientHeight;
    FBtn.Width := FBtn.Height;
    FBtn.Left := ClientWidth - FBtn.Width;
    Rec.Right := Width - (FBtn.Width + 5);
  end;
  SendMessage(Handle, EM_SETRECTNP, 0, Integer(@Rec));
  Text := lText;
end;

procedure TNumericEdit.KeyDown(var Key: Word; Shift: TShiftState);
var P: TPoint;
begin
  inherited KeyDown(Key, Shift);
  if (Key = VK_F7) and (FBtn <> nil) then
  begin
    Key := 0;
    P.X := FBtn.Left + 2;
    P.Y := FBtn.Top + 2;
    SendMessage(Handle, WM_LBUTTONDOWN, 0, Longint(PointToSmallPoint(P)));
    SendMessage(Handle, WM_LBUTTONUP, 0, Longint(PointToSmallPoint(P)));
    //FBtn.Click;
  end;
end;


function TNumericEdit.GetShowButton: Boolean;
begin
  Result := (FBtn <> nil);
end;

procedure TNumericEdit.SetShowButton(Value: Boolean);
begin
  if (Value <> GetShowButton) then
  begin
    if FBtn <> nil then
    begin
      FBtn.Free;
      FBtn := nil;
    end
    else
    begin
      FBtn := TSpeedButton.Create(nil);
      FBtn.Parent := Self;
      FBtn.Font.Style := [fsBold];
      FBtn.Caption := '...';
      FBtn.Cursor := crArrow;
      FBtn.OnClick := InternalClick;
    end;
    UpdateButtonPosition;
  end;
end;

procedure TNumericEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_RIGHT or ES_MULTILINE;
end;

destructor TNumericEdit.Destroy;
begin
  FBtn.Free;
  FBtn := nil;
  inherited Destroy;
end;

constructor TNumericEdit.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  Text := '0';
  GetLocaleFormatSettings(LOCALE_USER_DEFAULT, FormatSettings);
end;

procedure TNumericEdit.DoEnter;
begin
  inherited DoEnter;
  SelStart := 0;
  SelLength := Length(Text);
end;

procedure TNumericEdit.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  inherited;
  UpdateButtonPosition;
end;

procedure TNumericEdit.InternalClick(Sender: TObject);
begin
  SetFocus;
  if Assigned(FOnBtnClick) then
    FOnBtnClick(Sender);
end;

function IntegerValidateChar(var Key: Char; const Text: String): Boolean;
begin
  Result := (Key in [#8]) or ((Key in ['0'..'9', '-']) and (length(Text) < 10));
  if not Result then
    Key := #0;
end;

function FloatValidateChar(var Key: Char; const Text: String; const Digits: Byte): Boolean;
var
 I: Byte;
 NrPoints: Byte;
 FormatSettings: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_USER_DEFAULT, FormatSettings);
  NrPoints := 0;
  for I := 1 to Length(Text) do
   if Text[I] in [FormatSettings.DecimalSeparator, FormatSettings.ThousandSeparator] then
     inc(NrPoints);
  Result := (Key in [#8]) or ((Key in ['0'..'9', '-']) and (length(Text) < Digits + NrPoints));
  if not Result then
    Key := #0;
end;

//  TIntegerEdit

function TIntegerEdit.ValidateChar(var Key: Char): Boolean;
begin
  Result := IntegerValidateChar(Key, Text);
end;

function TIntegerEdit.GetNumberInteger: Integer;
begin
  try
    Result := StrToIntDef(Text, 0);  //emerson - troquei o strtoint por strtointdef
  except
    Result := 0;
  end;
end;

procedure TIntegerEdit.SetNumberInteger(Value: Integer);
begin
  Text := IntToStr(Value);  
end;

function TIntegerEdit.GetIsNull: Boolean;
begin          
  Result := (Text = '');
end;

procedure TIntegerEdit.KeyPress(var Key: Char);
begin
  if (Key = #13)
  and Assigned(onKeyPress) then
    onKeyPress(Self, Key);
  if not ValidateChar(Key) then
    MessageBeep(0);
  inherited KeyPress(Key);
end;

//  TFloatEdit

function TFloatEdit.ValidateChar(var Key: Char): Boolean;
begin
  Result := FloatValidateChar(Key, Text, FDigits);
end;

function TFloatEdit.GetNumberFloat: Double;
var
  Aux: String;
begin
  Aux := Text;
  while (Pos(FormatSettings.ThousandSeparator, Aux) <> 0) do
    delete(Aux, Pos(FormatSettings.ThousandSeparator, Aux), 1);
{Silvio 31.05.2000 inicio dava exception quando campo estava vazio}
  if   Aux <> '' then
       try
         Result := StrToFloat(Aux);
       except
         Result := 0;
       end
  else
       Result := 0;
{Silvio 31.05.2000 Final dava exception quando campo estava vazio}
end;                      

procedure TFloatEdit.SetNumberFloat(Value: Double);
begin
{  If   FComMascara Then}
       if  (FDecimals <> 0) then
            Begin
              If   FMascara <> '' Then
                   Text := FormatFloat(FMascara, Value)
              Else
                   Text := FormatFloat('###,###,###,##0.' + StringOfChar('0', FDecimals), Value);
            End
       else
            Text := ''{FormatFloat('###,###,###,##0', Value)}
{  Else
       Text := '';}
end;

function TFloatEdit.GetIsNull: Boolean;
begin
  Result := (Text = '');
end;

{Silvio 19.04.2000 Inicio Ignorar zeros a esquerda}
Function TFloatEdit.TiraZerosaEsquerda(Valor:String):String;
begin
  Result := Valor;
  While ((Result[1] = '0')
  Or     (Result[1] = FormatSettings.ThousandSeparator))
{Arnoldo/Eduardo - 12/04/06 - Inicio - Melhorias}
  And   (Length(Result) > FDecimals+2) do
{Arnoldo/Eduardo - 12/04/06 - Fim - Melhorias}  
        Delete(Result,1,1);
end;
{Silvio 19.04.2000 Final Ignorar zeros a esquerda}


procedure TFloatEdit.KeyPress(var Key: Char);
var
  Aux: String;
  P: Byte;

begin
  if (Key = #13)
  and Assigned(onKeyPress) then
    onKeyPress(Self, Key);
{Silvio 31.05.2000 inicio Apagar o selecionado}
//166.Claudio Schweder- Inicio- 18/05/2007- Tecnologia:Respeitar a propriedade ReadOnly
  if   Not ReadOnly then
       begin
//166.Claudio Schweder- Fim   - 18/05/2007- Tecnologia:Respeitar a propriedade ReadOnly
         if   Self.SelLength > 0 then
              self.SelText := '';
       {Silvio 31.05.2000 Final Apagar o selecionado}
         if not ValidateChar(Key) then
           MessageBeep(0);
         if (Key <> #0) then
         begin
           if (Key <> #8) then
           begin
             if (length(Text) = (FDecimals)) then
             begin
               Aux := Text;
       //        Insert(DecimalSeparator, Aux, FDecimals); // 2 FDecimals
               Insert(FormatSettings.DecimalSeparator, Aux, 2); // 2 FDecimals
               Text := Aux;
               SelStart := FDecimals + 1; // 3 FDecimals + 1
             end
             else if (Length(Text) >= (FDecimals + 1)) then // 3 FDecimals + 1
             begin
               Aux := Text;
               delete(Aux, Pos(DecimalSeparator, Aux), 1);
               while (Pos(ThousandSeparator, Aux) <> 0) do
                 delete(Aux, Pos(ThousandSeparator, Aux), 1);
       //        Insert(DecimalSeparator, Aux, Length(Aux));
               Insert(DecimalSeparator, Aux, Length(Aux) - (FDecimals - 2));
               if (Length(Aux) >= (FDecimals + 1 + 3)) then // 6 FDecimals + 1 + 3
               begin
                 P := Pos(DecimalSeparator, Aux);
                 Insert(ThousandSeparator, Aux, P - 3);
                 if (Length(Aux) >= (FDecimals + 1 + 3 + 1 + 3)) then // 10 FDecimals + 1 + 3 + 1 + 3
                 begin
                   P := Pos(ThousandSeparator, Aux);
                   Insert(ThousandSeparator, Aux, P - 3);
                   if (Length(Aux) >= (FDecimals + 1 + 3 + 1 + 3 + 1 + 3)) then // 14 FDecimals + 1 + 3 + 1 + 3 + 1 + 3
                   begin
                     P := Pos(ThousandSeparator, Aux);
                     Insert(ThousandSeparator, Aux, P - 3);
                   end;
                 end;
               end;
               Text := TiraZerosaEsquerda(Aux);
               SelStart := GetMaxSelection;
             end;
           end
           else if (Key = #8) and (Length(Text) >= (FDecimals + 1)) then // 3 FDecimals + 1
           begin
             Aux := Text;
             while (Pos(ThousandSeparator, Aux) <> 0) do
               delete(Aux, Pos(ThousandSeparator, Aux), 1);
             P := Pos(DecimalSeparator, Aux);
             delete(Aux, P, 1);
             if ((P - 1) > 1) then
               Insert(DecimalSeparator, Aux, P - 1);
             if (Length(Text) >= (FDecimals + 1 + 3)) then  // 6 FDecimals + 1 + 3
             begin
               P := Pos(DecimalSeparator, Aux);
               if ((P - 3) > 1) then
                 Insert(ThousandSeparator, Aux, P - 3);
               if (Length(Text) >= (FDecimals + 1 + 3 + 1 + 3)) then // 10 FDecimals + 1 + 3 + 1 + 3
               begin
                 P := Pos(ThousandSeparator, Aux);
                 if ((P - 3) > 1) then
                   Insert(ThousandSeparator, Aux, P - 3);
                 if (Length(Text) >= (FDecimals + 1 + 3 + 1 + 3 + 1 + 3)) then // 14 FDecimals + 1 + 3 + 1 + 3 + 1 + 3
                 begin
                   P := Pos(ThousandSeparator, Aux);
                   if ((P - 3) > 1) then
                     Insert(ThousandSeparator, Aux, P - 3);
                 end;
               end;
             end;
             Text := TiraZerosaEsquerda(Aux);
             SelStart := GetMaxSelection;
           end;
         end;
       end;
  inherited KeyPress(Key);
end;

function TFloatEdit.GetMaxSelection: Integer;
begin
  Result := Length(Text);
end;

constructor TFloatEdit.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FDecimals := 2;
  FDigits := 14;
end;

//  TFloatEdit2

procedure TFloatEdit2.PreencheDecimais;
var
  S: Integer;
begin
  if   not FDecimalOk then
       begin
         S := length(Text);
         Text := Text + StringOfChar('0', FDecimals);
         SelStart := S;
         SelLength := 0;
         FDecimalOk := true;
       end;
end;

procedure TFloatEdit2.KeyPress(var Key: Char);
var
  Bias: Byte;
  AuxText: String;
  S: Integer;
begin
  if (Key = #13)
  and Assigned(onKeyPress) then
    onKeyPress(Self, Key);
//166.Claudio Schweder- Inicio- 18/05/2007- Tecnologia:Respeitar a propriedade ReadOnly
  if   not ReadOnly then
       begin
//166.Claudio Schweder- Fim   - 18/05/2007- Tecnologia:Respeitar a propriedade ReadOnly
         if FDecimals > 0 then
            Bias := 1
         else
            Bias := 0;
         if   (Key in [#8, DecimalSeparator, '0'..'9', '-']) then
         begin
           if (SelLength = Length(Text)) then // não colocar um zero quando edit vazio e digitar um numero
              SetDecimals(FDecimals);
           FDecimalOk := (FDecimals > 0) and (SelStart >= (Length(Text) - FDecimals));
           if   FDecimalOk then
                begin
                  if (Key = #8) then
                  begin
                     if (Text[SelStart] <> DecimalSeparator) then
                     begin
                       AuxText := Text;
                       S := SelStart;
                       delete(AuxText, S, 1);
                       AuxText := AuxText + '0';
                       Text := AuxText;
                       SelStart := S - 1;
                       SelLength := 0;
                     end
                     else
                     begin
                       SelStart := SelStart - 1;
                       SelLength := 0;
                     end;
                  end
                  else
                  begin
                    AuxText := Text;
                    S := SelStart;
                    if S < Length(AuxText) then
                       AuxText[S + 1] := Key;
                    Text := AuxText;
                    SelStart := S + 1;
                    SelLength := 0;
                  end;
                end
           else
                begin
                  if (Key = DecimalSeparator) then
                  begin
                     SelStart := pos(DecimalSeparator, Text);
                     SelLength := 0;
                  end
                  else if (Key <> #8) and (length(Text) - (FDecimals + Bias) < FDigits) then
                  begin
                    AuxText := Text;
                    if (FDecimals > 0) then
                    begin
                       Insert(Key, AuxText, length(AuxText) - FDecimals);
                       AuxText := TiraZerosaEsquerda(AuxText);
                       Text := AuxText;
                       SelStart := pos(DecimalSeparator, AuxText) - 1;
                       SelLength := 0;
                    end
                    else
                    begin
                      if SelStart < Length(AuxText) then
                      begin
                         Insert(Key, AuxText, SelStart + 1);
                         S := SelStart;
                         Text := AuxText;
                         SelStart := S;
                      end
                      else
                      begin
                         AuxText := AuxText + Key;
                         Text := AuxText;
                         SelStart := length(AuxText);
                      end;
                      SelLength := 0;
                    end;
                  end
                  else if (Key = #8) then
                  begin
                    AuxText := Text;
                    S := SelStart;
                    delete(AuxText, S, 1);
                    if  (Length(AuxText) > 0) and (AuxText[1] <> DecimalSeparator) then
                        begin
                          Text := AuxText;
                          SelStart := S - 1;
                        end
                    else
                        begin
                          if (FDecimals > 0) then
                             Insert('0', AuxText, 1);
                          Text := AuxText;
                        end;
                  end;
                end;
       end;
  end;
  Key := #0;

end;

function TFloatEdit2.GetMaxSelection: Integer;
begin
  Result := SelStart;
end;

procedure TFloatEdit2.SetDecimals(Value: Byte);
begin
  FDecimals := Value;
  if (FDecimals > 0) then
     Text := FormatFloat(StringOfChar('#', FDigits) + '0.' + StringOfChar('0', FDecimals), 0)
  else
     Clear;
end;

procedure TFloatEdit2.SetNumberFloat(Value: Double);
begin
  Text := FormatFloat(StringOfChar('#', FDigits) + '0.' + StringOfChar('0', FDecimals), Value);
end;

procedure DateDoExit(const Text: String);
begin
  if (Text <> '') then
  try
    StrToDate(Text);
  except
    raise Exception.Create(MsgInvalidDate);
  end;
end;

procedure TimeDoExit(const Text: String);
begin
  if (Text <> '') then
  try
    StrToTime(Text);
  except
    raise Exception.Create(MsgInvalidTime);
  end;
end;

//  TTimeEdit

procedure TTimeEdit.UpdateButtonPosition;
var
  Rec: TRect;
begin
  Rec.Top := 0;
  Rec.Left := 0;
  Rec.Bottom := Height;
  Rec.Right := ClientWidth;
  if (FBtn <> nil) then
  begin
    FBtn.Top := 0;
    FBtn.Height := ClientHeight;
    FBtn.Width := FBtn.Height;
    FBtn.Left := ClientWidth - FBtn.Width;
    Rec.Right := Width - (FBtn.Width + 5);
  end;
  SendMessage(Handle, EM_SETRECTNP, 0, Integer(@Rec));
end;

function TTimeEdit.GetShowButton: Boolean;
begin
  Result := (FBtn <> nil);
end;

procedure TTimeEdit.SetShowButton(Value: Boolean);
begin
  if (Value <> GetShowButton) then
  begin
    if FBtn <> nil then
    begin
      FBtn.Free;
      FBtn := nil;
    end
    else
    begin
      FBtn := TSpeedButton.Create(nil);
      FBtn.Parent := Self;
      FBtn.Font.Style := [fsBold];
      FBtn.Caption := '...';
      FBtn.Cursor := crArrow;
      FBtn.OnClick := InternalClick;
      UpdateButtonPosition;
    end;
  end;
end;

function TTimeEdit.GetTime: TDateTime;
begin
  try
    Result := StrToTime(Text);
  except
    SetFocus;
    SelectAll;
    raise Exception.Create(MsgInvalidTime);
  end;
end;

procedure TTimeEdit.SetTime(Value: TDateTime);
begin
  Text := TimeToStr(Value);
end;

function TTimeEdit.GetIsNull: Boolean;
begin
  Result := (Text = '')
end;

procedure TTimeEdit.KeyPress(var Key: Char);
begin
  if not (Key in ['0'..'9', ':', #8]) then
  begin
    Key := #0;
    MessageBeep(0);
  end;
  inherited KeyPress(Key);
end;

procedure TTimeEdit.DoExit;
begin
  try
    TimeDoExit(Text);
  except
    SetFocus;
    SelectAll;
    raise;
  end;
  inherited DoExit;
end;

procedure TTimeEdit.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  inherited;
 UpdateButtonPosition;
end;

procedure TTimeEdit.InternalClick(Sender: TObject);
begin
  SetFocus;
  if Assigned(FOnBtnClick) then
    FOnBtnClick(Sender);
end;

procedure TTimeEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_MULTILINE;
end;                

destructor TTimeEdit.Destroy;
begin
  FBtn.Free;
  FBtn := nil;
  inherited Destroy;
end;

//  TDateTimeEdit

procedure TDateTimeEdit.UpdateButtonPosition;
var
  Rec: TRect;
begin
  Rec.Top := 0;
  Rec.Left := 0;
  Rec.Bottom := Height;
  Rec.Right := ClientWidth;
  if (FBtn <> nil) then
  begin
    FBtn.Top := 0;
    FBtn.Height := ClientHeight;
    FBtn.Width := FBtn.Height;
    FBtn.Left := ClientWidth - FBtn.Width;
    Rec.Right := Width - (FBtn.Width + 5);
  end;
  SendMessage(Handle, EM_SETRECTNP, 0, 0);
end;

function TDateTimeEdit.GetShowButton: Boolean;
begin
  Result := (FBtn <> nil);
end;

procedure TDateTimeEdit.SetShowButton(Value: Boolean);
begin
  if (Value <> GetShowButton) then
  begin
    if FBtn <> nil then
    begin
      FBtn.Free;
      FBtn := nil;
    end
    else
    begin
      FBtn := TSpeedButton.Create(nil);
      FBtn.Parent := Self;
      FBtn.Font.Style := [fsBold];
      FBtn.Caption := '...';
      FBtn.Cursor := crArrow;
      FBtn.OnClick := InternalClick;
      UpdateButtonPosition;
    end;
  end;
end;

function TDateTimeEdit.GetDateTime: TDateTime;
begin
  try
    Result := StrToDateTime(Text);
  except
    SetFocus;
    SelectAll;
    raise Exception.Create(MsgInvalidDateTime);
  end;
end;

procedure TDateTimeEdit.SetDateTime(Value: TDateTime);
begin
  Text := DateTimeToStr(Value);
end;

function TDateTimeEdit.GetIsNull: Boolean;
begin
  Result := (Text = '');
end;

procedure TDateTimeEdit.KeyPress(var Key: Char);
begin
  if not (Key in ['0'..'9', '/', ':', #8, ' ']) then
  begin
    Key := #0;
    MessageBeep(0);
  end;
  inherited KeyPress(Key);
end;

procedure DateTimeDoExit(const Text: String);
begin
  if (Text <> '') then
  try
    StrToDateTime(Text);
  except
    raise Exception.Create(MsgInvalidDateTime);
  end;
end;

procedure TDateTimeEdit.DoExit;
begin
  try
    DateTimeDoExit(Text)
  except
    SelectAll;
    SetFocus;
    raise;
  end;
end;

procedure TDateTimeEdit.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  inherited;
  UpdateButtonPosition;
end;

procedure TDateTimeEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_MULTILINE;
end;

procedure TDateTimeEdit.InternalClick(Sender: TObject);
begin
  SetFocus;
  if Assigned(FOnBtnClick) then
    FOnBtnClick(Sender);
end;

destructor TDateTimeEdit.Destroy;
begin
  FBtn.Free;
  FBtn := nil;
  inherited Destroy;
end;

//  TMorphoEdit

procedure TMorphoEdit.UpdateButtonPosition;
begin
  inherited UpdateButtonPosition;
  if FModeEdit <> meAlpha then
    inherited UpdateButtonPosition
  else
    if (FBtn <> nil) then
    begin
      FBtn.Top := 0;
      FBtn.Height := ClientHeight;
      FBtn.Width := FBtn.Height;
      FBtn.Left := ClientWidth - FBtn.Width;
      SendMessage(Handle, EM_SETMARGINS, EC_RIGHTMARGIN, MAKELONG(0, FBtn.Width));
    end
    else
      SendMessage(Handle, EM_SETMARGINS, EC_RIGHTMARGIN, MAKELONG(0, 0));
end;

procedure TMorphoEdit.SetModeEdit(Value: TModeEdit);
begin
  FModeEdit := Value;
  Clear;
  RecreateWnd;
  if ShowButton then
    UpdateButtonPosition;
end;

function TMorphoEdit.ValidateChar(var Key: Char): Boolean;
begin
  Result := true;
  case FModeEdit of
    meInteger: Result := IntegerValidateChar(Key, Text);
    meAlpha: Result := true;
  end;
end;

procedure TMorphoEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if FModeEdit in [meInteger, meFloat] then
    Params.Style := Params.Style or ES_RIGHT or ES_MULTILINE
  else
    begin
      if (Params.Style and ES_RIGHT) = ES_RIGHT then
         Params.Style := Params.Style xor ES_RIGHT;
      Params.Style := Params.Style or ES_LEFT xor ES_MULTILINE;
    end;
end;

procedure TMorphoEdit.KeyPress(var Key: Char);
begin
  if not ValidateChar(Key) then
    MessageBeep(0);
  inherited KeyPress(Key);
end;

procedure TMorphoEdit.DoExit;
begin
  case FModeEdit of
    meDate: DateDoExit(Text);
    meTime: TimeDoExit(Text);
    meDateTime: DateTimeDoExit(Text);
  end;
  inherited DoExit;
end;

constructor TMorphoEdit.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FModeEdit := meAlpha;
end;

function TFloatEdit2.GetDecimals: Byte;
begin
  Result := FDecimals;
end;

procedure TIntegerEdit.ReadValue;
begin
  if DataBind <> nil then
    IntegerNumber := DataBind.GetIntValue(DataField);
end;

procedure TIntegerEdit.WriteValue;
begin
  if DataBind <> nil then
    DataBind.SetIntValue(DataField, IntegerNumber);
end;

procedure TFloatEdit.ReadValue;
begin
  if DataBind <> nil then
    FloatNumber := DataBind.GetFloatValue(DataField);
end;

procedure TFloatEdit.WriteValue;
begin
  if DataBind <> nil then
    DataBind.SetFloatValue(DataField, FloatNumber);
end;

procedure TMorphoEdit.ReadValue;
begin
  if DataBind <> nil then
    case FModeEdit of
      meInteger:
        Text := IntToStr(DataBind.GetIntValue(DataField));
      meFloat:
        Text := FloatToStr(DataBind.GetFloatValue(DataField));
      meAlpha:
        Text := DataBind.GetValue(DataField);
      meDate:
        Text := DateToStr(DataBind.GetDateTimeValue(DataField));
      meTime:
        Text := TimeToStr(DataBind.GetDateTimeValue(DataField));
      meDateTime:
        Text := DateTimeToStr(DataBind.GetDateTimeValue(DataField));
    end;
end;

procedure TMorphoEdit.WriteValue;
begin
  if DataBind <> nil then
    case FModeEdit of
      meInteger:
        DataBind.SetIntValue(DataField, StrToInt(Text));
      meFloat:
        DataBind.SetFloatValue(DataField, StrToFloat(Text));
      meAlpha:
        DataBind.SetValue(DataField, Text);
      meDate:
        DataBind.SetDateTimeValue(DataField, StrToDate(Text));
      meTime:
        DataBind.SetDateTimeValue(DataField, StrToTime(Text));
      meDateTime:
        DataBind.SetDateTimeValue(DataField, StrToDateTime(Text));
    end;
end;

procedure TTimeEdit.ReadValue;
begin
  if DataBind <> nil then
    Time := DataBind.GetDateTimeValue(DataField);
end;

procedure TTimeEdit.WriteValue;
begin
  if DataBind <> nil then
    DataBind.SetDateTimeValue(DataField, Time);
end;

procedure TDateTimeEdit.ReadValue;
begin
  if DataBind <> nil then
    DateTime := DataBind.GetDateTimeValue(DataField);
end;

procedure TDateTimeEdit.WriteValue;
begin
  if DataBind <> nil then
    DataBind.SetDateTimeValue(DataField, DateTime);
end;

constructor TTimeEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

constructor TDateTimeEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

function TNumericEdit.GetColor: TColor;
begin
  Result := inherited Color;
end;

procedure TNumericEdit.SetColor(const Value: TColor);
begin
  inherited Color := Value;
  if Parent <> nil then
    UpdateButtonPosition;
end;

procedure TNumericEdit.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if Parent <> nil then
    UpdateButtonPosition;
end;

end.

