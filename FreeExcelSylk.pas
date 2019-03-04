unit FreeExcelSylk;
        { ************************************************************

      FREEEXCEL SYLK 1.13.beta   ranní vydání Talpa


Zmìny:
  * Pøidány další barvy písma 

Oprava chyb:
  * Opravena chyba v ohranièení numerických bunìk èást i od Petra Stasiaka



   ************************************************************

      FREEEXCEL SYLK 1.12.beta   ranní vydání Talpa


Zmìny:
  * Pøidána možnost formát bunìk
  (fce cislo byla rozdìlena na Float a Float_Mathematic)
  (nové fce Date,DateTime),
  fce NumericType, kde je možno zadat vlastní formát bunìk který najdete pøi v exportovaném souboru,
  poèítá se od 'P;PGeneral'=0 .....  atd.

  * POZOR:fce SetFont odstranìno ohranièení sloupcù, a pøesunuto do vlastní fce
    SetBorder;

  Oprava chyb:
  * Ošetøena "chyba" #13#10 tj. je již možno vkladat bloby do pole


   ************************************************************

 FREEEXCEL SYLK 1.09.beta   noèní vydání Talpa


Zmìny:
  * Pøidána možnost volby barvy
  * POZOR:fce SetFont odstranìno ohranièení sloupcù, a pøesunuto do vlastní fce
    SetBorder;

  Oprava chyb:
  * Ošetøena chyba MS Excel ve fcich v poznámce ";"

   ************************************************************
 FREEEXCEL SYLK 1.08.beta   ranní vydání Davida Lebedy


Zmìny (opìt pod taktovkou Davida Lebedy, dìkujeme za úpravy):
  * Zrychlen export vytvoøením TEMP souboru pøi vytváøení exportovaného souboru
  * Šíøka sloupce koncepèní úprava dle chodu unity

  Oprava chyb:
  * Ošetøena chyba MS Excel ve funkci øetìzec,objevující se pøi zadání hodnoty ";"


   **************************************************************

   FREEEXCEL SYLK 1.07.beta   vecerni vydani -
   Formátovaný export do excelu

   Zmìna:
   * Nová fce sirkasloupce  vytvoril ji David Lebeda jemuž budiž vzdána chvála - podruhé:-))
   * Nové hodnota POZNÁMKA Modifikace vkládaných polí a funkcí je již možno pøidávat i poznámky - to jsem kupodivu dìlal sám (Talpa)
   **************************************************************


   FREEEXCEL SYLK 1.06.beta   ranní vydání
   Formátovaný export do excelu
   (Opraveny a zjednodušeny nìkteré kontrukce  a jedna fèní chyba Davidem Lebedou jemuž budiž vzdána chvála)
   Zmìna
   * Zjednodušen destruktor,kostruktor
   * Odstranìno zbyteèné uvolòování

   Oprava chyb:
   * Opravena chyba nevracejícího se pùvodního decimalseparátoru:-((

   **************************************************************


   FREEEXCEL SYLK 1.05.beta  noèní vydání
   Formátovaný export do excelu

   Zmìna
   * upravena chybnì strukturovaná podmínka
   * Opravena drobná pravopisná chyba v typu - BoBotton/BoBottom
   * Vylepšeno hlášení chyby tj. pøidán E.Message (na návrh internetového kolegy:-)

   **************************************************************

   FREEEXCEL SYLK 1.04.beta  ranni vydání
   Formátovaný export do excelu

   Zmìna
   * Pøidán Ohranièení(Border) buòky do SetFont
   * Zaruèena blbovzdornost,tj. zákaz hodnot 0 a ménì u X,Y

   **************************************************************


   FREEEXCEL SYLK 1.03.beta  veèerní vydání
    Formátovaný export do excelu
   Zmìna
   * Pøidán SUM položek
   * Zaèištìní drobných chyb ve sloupcích a øádcích


 **************************************************************  }

interface


uses
 Windows, SysUtils, Classes;


type
 TFormatFont =(B,I,U,S);
 TColumnsBorder =(BoLeft,BoRight,BoTop,BoBottom);
 TFormatFonts = set of TFormatFont;
 TColumnsBorders =set of TColumnsBorder;
 TFonts=
        (Courier,CourierNewCE,CourierNewBaltic,CourierNewCYR,CourierNewGreek,CourierNewTUR,
        TimesNewRomanCE,
        Arial,ArialNewCE,ArialBaltic,ArialBlack,ArialCYR,ArialGreek,ArialNarrow,ArialTUR,
        AvantGardeBkBT,AvantGardeMdBT,
        BookAntiqua,BookmanOldStyle,
        CenturyGothic,
        ComicSansMS,
        CommonBullets,
        EstrangeloEdessa,
        Fixedsys,
        FranklinGothicMedium,
        Garamond,
        Gautami,
        Georgia,
        Haettenschweiler,
        Impact,
        Latha,
        LucidaBlackletter,
        LucidaBright,
        LucidaCalligraphy
         );

TFontColor=(FcRed,
             FcGreen,
             FcYellow,
             FcBlue,
             FcBlack,
             {Barve dle Excel 2000}
             fcCerna,
             fcTmave_cervena,
             fcCervena,
             fcRuzova,
             fcSvetle_ruzova,
             fcHneda,
             fcOranzova,
             fcSvetle_oranzova,
             fcZlata,
             fcZlato_oranzova,
             fcOlivove_zelena,
             fcTmave_zluta,
             fcZlutozelena,
             fcZluta,
             fcSvetle_zluta,
             fcTmave_zelena,
             fcZelena,
             fcMorska_zelen,
             fcJasne_zelena,
             fcSvetle_zelena,
             fcTmave_sedozelena,
             fcSedozelena,
             fcAkvamarinova,
             fcTyrkisova,
             fcSvetle_tyrkisova,
             fcTmave_modra,
             fcModra,
             fcSvetle_modra,
             fcNebezka_modr,
             fcBlede_modra,
             fcIndigova_modr,
             fcModroseda,
             fcFialova,
             fcSvestkova,
             fcLebandulova,
             fcSeda_80,
             fcSeda_50,
             fcSeda_40,
             fcSeda_25,
             fcBila);





 TFontSize = ShortInt;
 TTextPosition = (TP_Center,TP_Left,TP_Right);

const
 StartSYLK ='ID;PWXL;N;E'+#13#10;
 FormatFields ='P;PGeneral'+#13#10+
 'P;P0'+#13#10+
 'P;P0.00'+#13#10+
 'P;P#,##0'+#13#10+
 'P;P#,##0.00'+#13#10+
 'P;P#,##0\ _K_NAe;;\-#,##0\ _K_NAe'+#13#10+
 'P;P#,##0\ _K_NAe;;[Red]\-#,##0\ _K_NAe'+#13#10+
 'P;P#,##0.00\ _K_NAe;;\-#,##0.00\ _K_NAe'+#13#10+
 'P;P#,##0.00\ _K_NAe;;[Red]\-#,##0.00\ _K_NAe'+#13#10+
'P;P#,##0\ "$";;\-#,##0\ "$"'+#13#10+
'P;P#,##0\ "$";;[Red]\-#,##0\ "$"'+#13#10+
'P;P#,##0.00\ "$";;\-#,##0.00\ "$"'+#13#10+
'P;P#,##0.00\ "$";;[Red]\-#,##0.00\ "$"'+#13#10+
'P;P0%'+#13#10+
'P;P0.00%'+#13#10+
'P;P0.00E+00'+#13#10+
'P;P##0.0E+0'+#13#10+
'P;P#" "?/?'+#13#10+
'P;P#" "??/??'+#13#10+
'P;Pd/m/yyyy'+#13#10+
'P;Pd/mmm/yy'+#13#10+
'P;Pd/mmm'+#13#10+
'P;Pmmm/yy'+#13#10+
'P;Ph:mm\ dop./odp.'+#13#10+
'P;Ph:mm:ss\ dop./odp.'+#13#10+
'P;Ph:mm'+#13#10+
'P;Ph:mm:ss'+#13#10+
'P;Pd/m/yyyy\ h:mm'+#13#10+
'P;Pmm:ss'+#13#10+
'P;Pmm:ss.0'+#13#10+
'P;P@'+#13#10+
'P;P[h]:mm:ss'+#13#10+
'P;P_-* #,##0\ "$"_-;;\-* #,##0\ "$"_-;;_-* "-"\ "$"_-;;_-@_-'+#13#10+
'P;P_-* #,##0\ _K_NAe_-;;\-* #,##0\ _K_NAe_-;;_-* "-"\ _K_NAe_-;;_-@_-'+#13#10+
'P;P_-* #,##0.00\ "$"_-;;\-* #,##0.00\ "$"_-;;_-* "-"??\ "$"_-;;_-@_-'+#13#10+
'P;P_-* #,##0.00\ _K_NAe_-;;\-* #,##0.00\ _K_NAe_-;;_-* "-"??\ _K_NAe_-;;_-@_-'+#13#10+
'P;FArial CE;M200'+#13#10+
'P;FArial CE;M200'+#13#10+
'P;FArial CE;M200'+#13#10+
'P;FArial CE;M200'+#13#10;

FormatMiddle ='F;P0;DG0G8;M255'+#13#10+
'B;Y1;X1;D0 0 0 0'+#13#10+
'O;D;V0;K47;G100 0.001'+#13#10;



C_CourierNewCE              = 'P;ECourier New CE;M%d%s';
C_ArialNewCE            = 'P;EArial CE;M%d%s';
C_TimesNewRomanCE       = 'P;ETimes New Roman CE;M%d%s';
C_Arial                 = 'P;EArial;M%d%s';
C_ArialBaltic           = 'P;EArial Baltic;M%d%s';
C_ArialBlack            = 'P;EArial Black;M%d%s';
C_ArialCYR              = 'P;EArial CYR;M%d%s';
C_ArialGreek            = 'P;EArial Greek;M%d%s';
C_ArialNarrow           = 'P;EArial Narrow;M%d%s';
C_ArialTUR              = 'P;EArial TUR;M%d%s';
C_AvantGardeBkBT        = 'P;EAvantGarde Bk BT;M%d%s';
C_AvantGardeMdBT        = 'P;EAvantGarde Md BT;M%d%s';
C_BookAntiqua           = 'P;EBook Antiqua;M%d%s';
C_BookmanOldStyle       = 'P;EBookman Old Style;M%d%s';
C_CenturyGothic         = 'P;ECentury Gothic;M%d%s';
C_ComicSansMS           = 'P;EComic Sans MS;M%d%s';
C_CommonBullets         = 'P;ECommonBullets;M%d%s';
C_Courier               = 'P;ECourier;M%d%s';
C_CourierNewBaltic      = 'P;ECourier New Baltic;M%d%s';
C_CourierNewCYR         = 'P;ECourier New CYR;M%d%s';
C_CourierNewGreek       = 'P;ECourier New Greek;M%d%s';
C_CourierNewTUR         = 'P;ECourier New TUR;M%d%s';
C_EstrangeloEdessa      = 'P;EEstrangelo Edessa;M%d%s';
C_Fixedsys              = 'P;EFixedsys;M%d%s';
C_FranklinGothicMedium  = 'P;EFranklin Gothic Medium;M%d%s';
C_Garamond              = 'P;EGaramond;M%d%s';
C_Gautami               = 'P;EGautami;M%d%s';
C_Georgia               = 'P;EGeorgia;M%d%s';
C_Haettenschweiler      = 'P;EHaettenschweiler;M%d%s';
C_Impact                = 'P;EImpact;M%d%s';
C_Latha                 = 'P;ELatha;M%d%s';
C_LucidaBlackletter     = 'P;ELucida Blackletter;M%d%s';
C_LucidaBright          = 'P;ELucida Bright;M%d%s';
C_LucidaCalligraphy     = 'P;ELucida Calligraphy;M%d%s';




C_ColorFormat      = ';L%d';
C_RowFormat        = 'F;P%d;%sS%sM%d;Y%d;X%d ';
C_ColWidth         = 'F;W%d %d %d';
C_ColPosition      = 'FG0%s;';

C_Position         = 'C;Y%d;X%d;';
C_ColFormatStr     = 'K"%s"';
C_ColFormatNumber  = 'K%e';
C_Poznamka_Pole    = ';A%s  :'+#13#10;

F_SOUCET    = 'ESUM(%s)';
F_SOUCIN    = 'EPRODUCT(%s)';
F_PRUMER    = 'EAVERAGE(%s)';
F_ODMOCNINA = 'ESQRT(%s)';


C_NewLine = #13#10;
C_ColFormatSum_Values ='(Rs% Cs%)';
C_ColFormatSum_ValuePlus ='[+%d]';
C_ColFormatSum_ValueMinus ='[%d]';



EndSYLK          = 'E'+#13#10;

resourcestring
    CantCreate       = 'Soubor "%s" nelze vytvoøit - chyba:'+#13#10+'%s';
    CantClose        = 'Soubor "%s" nelze uzavøít - chyba:'+#13#10+'%s';
    CantWriteBegin   = 'Nelze zapsat poèáteèní hodnoty do souboru "%s" - chyba:'+#13#10+'%s';
    CantWriteEnd   =   'Nelze zapsat koneèné hodnoty do souboru "%s" a uložit - chyba:'+#13#10+'%s';

    CantWriteInteger = 'Chyba zápisu hodnoty decimal do souboru na øádku %d a sloupci %d - chyba:'+#13#10+'%s';
    CantWriteDecimal = 'Chyba zápisu èíselné hodnoty do souboru %s na øádku %d a sloupci %d - chyba:'+#13#10+'%s';
    CantWriteString  = 'Chyba zápisu  textové hodnoty do souboru %s na øádku %d a sloupci %d - chyba:'+#13#10+'%s';
    LowNumberValues  = 'Malý poèet hodnot X,Y %d';
    NoDualValues  = 'Hodnoty (X,Y) se nepárují, èíslo %d je liché';
    NoNullValues = 'Hodnoty (X,Y) nesmìjí dosáhnout hodnotu 0';
    WrongIndex = 'Index sloupce musí být mezi 1 a 256';

type

 TFreeExcelS = class
  private
    { Private declarations }
    FFileName           : String;
    FFileStream         : TFileStream;
    FFontList           : TStringList;
    FColWidths          : TStringList;
    FSirky              : array [1..256] of integer;
    FTempFile           : string;
    FAlign              :TTextPosition;
    FSAlign             :String;
    FBackground         :Boolean;

    FFontIndex          : Integer;
    FFont               : TFonts;
    FSize               : Integer;
    FFontTypes          : TFormatFonts;
    FFontColor          : TFontColor;
    FColumnsBorders     : TColumnsBorders;
    FSColumnsBorders    : String;
    procedure           GetFont;
    procedure           XlsBeginStream;
    procedure           XlsEndStream;
    function            FindFont(FontValue:String):Integer;
    procedure           FreeComp;

  public
    { Public declarations }
    constructor         Create(FileName:String); reintroduce;
    Destructor          Destroy                                  ;override;
    procedure           NumericType     ( const ARow,ACol: Integer;const AValue: Double;const Type_Number:ShortInt;Poznamka:String='');
    procedure           Float           ( const ARow,ACol: Integer;const AValue: Double;Poznamka:String = '');
    procedure           Float_Mathematic( const ARow,ACol: Integer;const AValue: Double;Poznamka:String = '');
    procedure           DateTime        ( const ARow,ACol: Integer;const AValue: TDateTime;Poznamka:String='');
    procedure           Date            ( const ARow,ACol: Integer;const AValue: TDateTime;Poznamka:String='');
    procedure           Retezec         ( const ARow,ACol: Integer;const AValue: string;Poznamka:String = '');
    procedure           SetFont         ( const Font:TFonts;Size: TFontSize;FontTypes:TFormatFonts);
    procedure           SetBorder       ( const ColBorders:TColumnsBorders);
    procedure           SetFontColor    ( const FontColor:TFontColor);
    procedure           SetBackground(const Background:Boolean);

    procedure           Soucet          ( const ARow,ACol : Integer;Fields:Array of Integer;Poznamka:String = '');
    procedure           Soucin          ( const ARow,ACol: Integer;Fields:Array of Integer;Poznamka:String = '');
    procedure           Prumer          ( const ARow,ACol: Integer;Fields:Array of Integer;Poznamka:String = '');
    procedure           SirkaSloupce    ( const Index, Sirka: integer);
    procedure           Funkce          ( const ARow,ACol: Integer;Fields:Array of Integer;Const Funkce:String;Poznamka:String = '');
    procedure           TextPosition    ( const Align:TTextPosition);
  end;

implementation


Constructor TFreeExcelS.Create(FileName:String);
begin
 FFileName := FileName;
 try
  FTempFile := ChangeFileExt(FileName, '.$$$');
  FFileStream     := TFileStream.Create(FTempFile,fmCreate);
  FFontList       := TStringList.Create;
  FColWidths      := TStringList.Create;
 ZeroMemory(@(FSirky[1]), sizeof(FSirky));
 except
  on E: Exception do
  begin
   FreeComp;
   raise Exception.CreateFmt( CantCreate,[FTempFile,E.Message]);
  end;
 end;
 FFontColor:=FcBlack;
 FAlign:=TP_Right;
 FColumnsBorders:=[];
 FBackground:=false;
 SetFont(CourierNewCE, 10, []);
 XlsBeginStream;
end;

Destructor TFreeExcelS.Destroy;
begin
 try
  try
   XlsEndStream;
  except
   on E: Exception do
    raise Exception.CreateFmt(CantClose,[FFileName, E.Message]);
  end;
 finally
  FreeComp;
  DeleteFile(FTempFile);
 end;
end;

procedure TFreeExcelS.XlsBeginStream;
var
 Value:String;
begin
 value:=StartSYLK+FormatFields;
 try
  FFileStream.WriteBuffer(Pointer(Value)^,Length(Value));
 except
  on E: Exception do
   Raise Exception.CreateFmt(CantWriteBegin,[FTempFile,E.Message]);
 end;
end;

procedure TFreeExcelS.XlsEndStream;
var
 i: integer;
 FS: TFileStream;
begin
 FS := TFileStream.Create(FFileName, fmCreate);
 try
  FFileStream.Seek(0, soFromBeginning);
  FS.CopyFrom(FFileStream, length(STARTSYLK + FormatFields));
  FFontList.SaveToStream(FS);
  FS.Write(FormatMiddle,Length(FormatMiddle));
  FColWidths.Clear;
  for i := 1 to 256 do
   if FSirky[i] <> 0 then
    FColWidths.Add(Format(C_ColWidth,[i, i, FSirky[i]]));
  FColWidths.SaveToStream(FS);
  FFileStream.Seek(length(StartSYLK + FormatFields), soFromBeginning);
  FS.CopyFrom(FFileStream, FFileStream.Size - FFileStream.Position);
  FS.Write(EndSYLK,Length(EndSYLK));
 finally
  FS.Free;
 end;
end;

procedure TFreeExcelS.SirkaSloupce(const Index, Sirka: integer);
begin
 if (Index<1) or (Index > 256) then
  raise Exception.Create(WrongIndex);
 FSirky[Index] := Sirka;
end;
procedure TFreeExcelS.Float( const  ARow,ACol: Integer;const AValue: Double;Poznamka:String);
begin
NumericType( ARow,ACol,AValue,0,Poznamka);
end;

procedure TFreeExcelS.Float_Mathematic( const  ARow,ACol: Integer;const AValue: Double;Poznamka:String);
begin
NumericType( ARow,ACol,AValue,15,Poznamka);
end;

procedure TFreeExcelS.NumericType( const  ARow,ACol: Integer;const AValue: Double;const Type_Number:ShortInt;Poznamka:String);
var
 Value,pom:String;
 OldDecSep: char;
begin
 if (ARow<1) or (ACol<1) then
  raise Exception.Create(NoNullValues)
 else
 begin
  OldDecSep := DecimalSeparator;
  DecimalSeparator:='.';
  try

   Value:=Format(C_RowFormat,[Type_Number,FSAlign,FSColumnsBorders,FFontIndex,ARow,ACol])+#13#10;
   Value := Value + Format(C_Position,[ARow,ACol]);
   Value := Value + Format(C_ColFormatNumber,[AValue]);
     If Poznamka<>'' then
     begin
     pom := StringReplace(Poznamka, ';', ';;', [rfReplaceAll]);
     pom := StringReplace(pom, #13#10, ' :', [rfReplaceAll]);
     pom:=TrimRight(pom);
     while copy(pom,0,Length(pom)-3)=' :' do
     begin
     pom:=copy(pom,0,Length(pom)-3);
     pom:=TrimRight(pom);
     end;

     Value:=Value+Format(C_Poznamka_Pole,[Pom])
     end
     else
     Value:=Value+#13#10;

   try
    FFileStream.Write(PChar(Value)^, length(Value));
   except
    on E: Exception do
     Raise Exception.CreateFmt(CantWriteDecimal,[FTempFile,ARow,ACol,E.Message]);
   end;
  finally
   DecimalSeparator := OldDecSep;
  end;
 end;
end;

procedure TFreeExcelS.DateTime( const  ARow,ACol: Integer;const AValue: TDateTime;Poznamka:String);
begin
NumericType( ARow,ACol,AValue,27,Poznamka);
end;

procedure TFreeExcelS.Date( const  ARow,ACol: Integer;const AValue: TDateTime;Poznamka:String);
begin
NumericType( ARow,ACol,AValue,19,Poznamka);
end;


procedure TFreeExcelS.Retezec( const  ARow,ACol: Integer;const AValue: string;Poznamka:String);
var
 Value, pom:String;
begin
 If  (ARow<1) or (ACol<1) then
  Raise Exception.Create(NoNullValues)
 else
 begin

  Value:=Format(C_RowFormat,[0,FSAlign,FSColumnsBorders,FFontIndex,ARow,ACol])+#13#10;
  Value:=Value+Format(C_Position,[ARow,ACol]);

  pom := StringReplace(AValue, ';', ';;', [rfReplaceAll]);
  pom := StringReplace(pom, #13#10, ' :', [rfReplaceAll]);
  pom:=TrimRight(pom);
     while copy(pom,Length(pom)-2,Length(pom))=' :' do
     begin
     pom:=copy(pom,0,Length(pom)-2);
     pom:=TrimRight(pom);
     end;

  Value:=Value+Format(C_ColFormatStr,[pom]);
  If Poznamka<>'' then
     begin
     pom := StringReplace(Poznamka, ';', ';;', [rfReplaceAll]);
     pom := StringReplace(pom, #13#10, ' :', [rfReplaceAll]);
     pom:=TrimRight(pom);
     while copy(pom,Length(pom)-2,Length(pom))=' :' do
     begin
     pom:=copy(pom,0,Length(pom)-2);
     pom:=TrimRight(pom);
     end;

     Value:=Value+Format(C_Poznamka_Pole,[Pom])
     end
     else
     Value:=Value+#13#10;

  try
    FFileStream.Write(PChar(Value)^, length(Value));
  except
   on E: Exception do
    Raise Exception.CreateFmt(CantWriteString,[FTempFile,ARow,ACol,E.Message]);
  end;
 end;
end;

procedure TFreeExcelS.SetFont(Const Font:TFonts;Size:TFontSize;FontTypes:TFormatFonts);
begin
 FFont:=Font;
 FSize:=Size;
 FFontTypes:=FontTypes;
 GetFont;
end;

procedure TFreeExcelS.SetFontColor(const FontColor:TFontColor);
begin
  FFontColor:=FontColor;
  GetFont;
end;
procedure TFreeExcelS.SetBackground(const Background:Boolean);
begin
  FBackground:=Background;
  GetFont;
end;

procedure TFreeExcelS.SetBorder   ( const ColBorders:TColumnsBorders);
begin
  FColumnsBorders:=ColBorders;
  GetFont;
end;
procedure  TFreeExcelS.TextPosition    ( const Align:TTextPosition);
begin
  FAlign:=Align;
  GetFont;
end;

function TFreeExcelS.FindFont(FontValue:String):Integer;
begin
 Result:=FFontList.IndexOf(FontValue)+5;
end;

procedure TFreeExcelS.GetFont;

var
 LI_FontNumber  :Integer;
 LS_FontLabel   :String;
 LI_FontSize    :Integer;
 LS_FontType    :String;
 LS_ColumnBorder:String;
 LI_FontColor   :ShortInt;
 LS_Align       :String;
begin
 LI_FontSize:=FSize*20;

Case FAlign of
        TP_Center:LS_Align:=Format(C_ColPosition,['C']);
        TP_Right:LS_Align:=Format(C_ColPosition,['R']);
        TP_Left:LS_Align:='';

end;

If (FFontTypes<>[]) OR (FColumnsBorders<>[]) OR (FBackground) then
    LS_FontType:=';S';

If S in FFontTypes then
        LS_FontType:=LS_FontType+'S';

If B in FFontTypes then
        LS_FontType:=LS_FontType+'B';

If I in FFontTypes then
        LS_FontType:=LS_FontType+'I';

If U in FFontTypes then
        LS_FontType:=LS_FontType+'U';


If FBackground then
         LS_ColumnBorder:= 'S';
If BoLeft in FColumnsBorders then
         LS_ColumnBorder:= LS_ColumnBorder+'L';

If BoRight in FColumnsBorders then
         LS_ColumnBorder:= LS_ColumnBorder+'R';

If BoTop in FColumnsBorders then
         LS_ColumnBorder:= LS_ColumnBorder+'T';

If BoBottom in FColumnsBorders then
         LS_ColumnBorder:= LS_ColumnBorder+'B';

Case FFont of
        CourierNewCE            :        LS_FontLabel:=Format(C_CourierNewCE,[LI_FontSize,LS_FontType]);
        ArialNewCE              :        LS_FontLabel:=Format(C_ArialNewCE,[LI_FontSize,LS_FontType]);
        TimesNewRomanCE         :        LS_FontLabel:=Format(C_TimesNewRomanCE,[LI_FontSize,LS_FontType]);
        Arial                   :        LS_FontLabel:=Format(C_Arial,[LI_FontSize,LS_FontType]);
        ArialBaltic             :        LS_FontLabel:=Format(C_ArialBaltic,[LI_FontSize,LS_FontType]);
        ArialBlack              :        LS_FontLabel:=Format(C_ArialBlack,[LI_FontSize,LS_FontType]);
        ArialCYR                :        LS_FontLabel:=Format(C_ArialCYR,[LI_FontSize,LS_FontType]);
        ArialGreek              :        LS_FontLabel:=Format(C_ArialGreek,[LI_FontSize,LS_FontType]);
        ArialNarrow             :        LS_FontLabel:=Format(C_ArialNarrow,[LI_FontSize,LS_FontType]);
        ArialTUR                :        LS_FontLabel:=Format(C_ArialTUR,[LI_FontSize,LS_FontType]);
        AvantGardeBkBT          :        LS_FontLabel:=Format(C_AvantGardeBkBT,[LI_FontSize,LS_FontType]);
        AvantGardeMdBT          :        LS_FontLabel:=Format(C_AvantGardeMdBT,[LI_FontSize,LS_FontType]);
        BookAntiqua             :        LS_FontLabel:=Format(C_BookAntiqua,[LI_FontSize,LS_FontType]);
        BookmanOldStyle         :        LS_FontLabel:=Format(C_BookmanOldStyle,[LI_FontSize,LS_FontType]);
        CenturyGothic           :        LS_FontLabel:=Format(C_CenturyGothic,[LI_FontSize,LS_FontType]);
        ComicSansMS             :        LS_FontLabel:=Format(C_ComicSansMS,[LI_FontSize,LS_FontType]);
        CommonBullets           :        LS_FontLabel:=Format(C_CommonBullets,[LI_FontSize,LS_FontType]);
        Courier                 :        LS_FontLabel:=Format(C_Courier,[LI_FontSize,LS_FontType]);
        CourierNewBaltic        :        LS_FontLabel:=Format(C_CourierNewBaltic,[LI_FontSize,LS_FontType]);
        CourierNewCYR           :        LS_FontLabel:=Format(C_CourierNewCYR ,[LI_FontSize,LS_FontType]);
        CourierNewGreek         :        LS_FontLabel:=Format(C_CourierNewGreek,[LI_FontSize,LS_FontType]);
        CourierNewTUR           :        LS_FontLabel:=Format(C_CourierNewTUR,[LI_FontSize,LS_FontType]);
        EstrangeloEdessa        :        LS_FontLabel:=Format(C_EstrangeloEdessa,[LI_FontSize,LS_FontType]);
        Fixedsys                :        LS_FontLabel:=Format(C_Fixedsys,[LI_FontSize,LS_FontType]);
        FranklinGothicMedium    :        LS_FontLabel:=Format(C_FranklinGothicMedium,[LI_FontSize,LS_FontType]);
        Garamond                :        LS_FontLabel:=Format(C_Garamond,[LI_FontSize,LS_FontType]);
        Gautami                 :        LS_FontLabel:=Format(C_Gautami,[LI_FontSize,LS_FontType]);
        Georgia                 :        LS_FontLabel:=Format(C_Georgia,[LI_FontSize,LS_FontType]);
        Haettenschweiler        :        LS_FontLabel:=Format(C_Haettenschweiler,[LI_FontSize,LS_FontType]);
        Impact                  :        LS_FontLabel:=Format(C_Impact,[LI_FontSize,LS_FontType]);
        Latha                   :        LS_FontLabel:=Format(C_Latha,[LI_FontSize,LS_FontType]);
        LucidaBlackletter       :        LS_FontLabel:=Format(C_LucidaBlackletter,[LI_FontSize,LS_FontType]);
        LucidaBright            :        LS_FontLabel:=Format(C_LucidaBright,[LI_FontSize,LS_FontType]);
        LucidaCalligraphy       :        LS_FontLabel:=Format(C_LucidaCalligraphy,[LI_FontSize,LS_FontType]);


end;

Case FFontColor of
{compatabilita}
FcRed   :       LI_FontColor:=11;
FcGreen :       LI_FontColor:=12;
FcYellow:       LI_FontColor:=14;
FcBlue  :       LI_FontColor:=13;
FcBlack :       LI_FontColor:=9;
{barve dle MS-EXCEL 2000}
             fcCerna:LI_FontColor:=9;
             fcTmave_cervena:LI_FontColor:=17;
             fcCervena:LI_FontColor:=11;
             fcRuzova:LI_FontColor:=15;
             fcSvetle_ruzova:LI_FontColor:=46;
             fcHneda:LI_FontColor:=61;
             fcOranzova:LI_FontColor:=54;
             fcSvetle_oranzova:LI_FontColor:=53;
             fcZlata:LI_FontColor:=52;
             fcZlato_oranzova:LI_FontColor:=48;
             fcOlivove_zelena:LI_FontColor:=60;
             fcTmave_zluta:LI_FontColor:=20;
             fcZlutozelena:LI_FontColor:=51;
             fcZluta:LI_FontColor:=14;
             fcSvetle_zluta:LI_FontColor:=44;
             fcTmave_zelena:LI_FontColor:=59;
             fcZelena:LI_FontColor:=18;
             fcMorska_zelen:LI_FontColor:=58;
             fcJasne_zelena:LI_FontColor:=12;
             fcSvetle_zelena:LI_FontColor:=43;
             fcTmave_sedozelena:LI_FontColor:=57;
             fcSedozelena:LI_FontColor:=22;
             fcAkvamarinova:LI_FontColor:=50;
             fcTyrkisova:LI_FontColor:=16;
             fcSvetle_tyrkisova:LI_FontColor:=42;
             fcTmave_modra:LI_FontColor:=19;
             fcModra:LI_FontColor:=13;
             fcSvetle_modra:LI_FontColor:=49;
             fcNebezka_modr:LI_FontColor:=41;
             fcBlede_modra:LI_FontColor:=45;
             fcIndigova_modr:LI_FontColor:=63;
             fcModroseda:LI_FontColor:=55;
             fcFialova:LI_FontColor:=21;
             fcSvestkova:LI_FontColor:=62;
             fcLebandulova:LI_FontColor:=47;
             fcSeda_80:LI_FontColor:=64;
             fcSeda_50:LI_FontColor:=24;
             fcSeda_40:LI_FontColor:=56;
             fcSeda_25:LI_FontColor:=23;
             fcBila:LI_FontColor:=10;
             Else LI_FontColor:=9;
end;
LS_FontLabel:=LS_FontLabel+Format(C_ColorFormat,[LI_FontColor]);

LI_FontNumber:=FindFont(LS_FontLabel);

If LI_FontNumber = 4 then
   LI_FontNumber:=FFontList.Add(LS_FontLabel)+5;

FFontIndex:=LI_FontNumber;
FSColumnsBorders:=LS_ColumnBorder;
FSAlign:=LS_Align;
end;

procedure TFreeExcelS.Soucet( Const ARow,ACol: Integer;Fields:Array of Integer;Poznamka:String);
begin
 Funkce(ARow,ACol,Fields,F_SOUCET,Poznamka);
end;

procedure TFreeExcelS.Soucin( Const ARow,ACol: Integer;Fields:Array of Integer;Poznamka:String);
begin
 Funkce(ARow,ACol,Fields,F_SOUCIN,Poznamka);
end;

procedure TFreeExcelS.Prumer( Const ARow,ACol: Integer;Fields:Array of Integer;Poznamka:String);
begin
 Funkce(ARow,ACol,Fields,F_PRUMER,Poznamka);
end;

procedure TFreeExcelS.Funkce( Const ARow,ACol: Integer;Fields:Array of Integer;Const Funkce:String;Poznamka:String);
var i:Integer;
   Length_Fields,X,Y,Pecko:Integer;
   WriteLabel,pom:String;
   Separator:Char;
begin
Length_Fields:=length(Fields);
If  (ARow<1) or (ACol<1) then Raise Exception.Create(NoNullValues) else

If  Length_Fields mod 2<>0 then   Raise Exception.CreateFmt(NoDualValues,[Length(Fields)-1]) else


Case Length_Fields of
4:   Separator:=':';
2:   Separator:=#0 ;
else
Separator:=',';
end;


          begin
                For i:=0 to Length(Fields)-1 do
                        begin

                       If (i mod 2)=0 then
                         begin
                                X:=Fields[i]-ARow;
                                WriteLabel:=WriteLabel+Format('R[%d]',[X])
                         end
                         else
                         begin
                                Y:=Fields[i]-ACol;
                                WriteLabel:=WriteLabel+Format('C[%d]%s',[Y,Separator]);
                         end;

                        end;
                          WriteLabel:=Copy(WriteLabel,0,Length(WriteLabel)-1);
          end;





WriteLabel:=Format(C_RowFormat,[0,FSAlign,FSColumnsBorders,FFontIndex,ARow,ACol])+#13#10+
           Format(C_Position,[ARow,ACol])
           +Format(Funkce,[WriteLabel]);

If Poznamka<>'' then
     begin
     pom := StringReplace(Poznamka, ';', ';;', [rfReplaceAll]);
     pom := StringReplace(pom, #13#10, ' :', [rfReplaceAll]);
     pom:=TrimRight(pom);
     while copy(pom,0,Length(pom)-3)=' :' do
     begin
     pom:=copy(pom,0,Length(pom)-3);
     pom:=TrimRight(pom);
     end;
     WriteLabel:=WriteLabel+Format(C_Poznamka_Pole,[Pom])
     end
     else
     WriteLabel:=WriteLabel+#13#10;

 try
                FFileStream.Write(PChar(WriteLabel)^, length(WriteLabel));
        except


                on E: Exception do
                 Raise Exception.CreateFmt(CantWriteString,[FTempFile,ACol,ARow,E.Message]);

        end;
end;


procedure         TFreeExcelS.FreeComp;
begin
 FreeAndNil(FFileStream);
 FreeAndNil(FFontList);
 FreeAndNil(FColWidths);
end;

end.


