{
 @abstract (Interface para ligação do controle visual a uma origem de dados)
 @author (Eduardo Hildebrandt (edu@operacionaltextil.com.br))
 @created (06 mar 2003)
 @lastmod (06 mar 2003)


 procedure AddNotify(AObject: TObject; ANotifyProc: TNotifyProc);  -
 procedure RemoveNotify(AObject: TObject);  -
 procedure Refresh; 

 procedure SetValue(const AField: String; const AValue: String); 
 function GetValue(const AField: String): String; 
 procedure SetIntValue(const AField: String; const AValue: Longint); 
 function GetIntValue(const AField: String): Longint; 
 procedure SetFloatValue(const AField: String; const AValue: Double); 
 function GetFloatValue(const AField: String): Double; 
 procedure SetDateTimeValue(const AField: String; const AValue: TDateTime); 
 function GetDateTimeValue(const AField: String): TDateTime; 
}

unit uDataBind;

interface

uses Classes;

type
  { tipo da notificacao }
  TBindNotifyType = (bntChange, bntUnBind);
  { procedure de notificação todos os controles visuais devem ter esta procedure }
  TNotifyProc = procedure(AbindNotifyType: TBindNotifyType) of object;
  {@exclude - tipo que sera utilizado para guardar as informacoes da ligacao com o controle }
  PNotifyProc = ^TNotifyProcInfo;
  // informações do controle que ira ser notificado
  TNotifyProcInfo = packed record
    NotifyProc: TNotifyProc;
    AObject: TObject;
  end;

  TInterfaceDataType = (idtString, idtInteger, idtFloat, idtDate, idtTime, idtDateTime, idtBoolean);


  { interface de ligacao de uma origem de dados a um controle visual }
  IDataBind = Interface(IUnknown)
    { adiciona o controle a lista de notificações da origem de dados }
    procedure AddNotify(AObject: TObject; ANotifyProc: TNotifyProc); 
    { remove o controle da lista de notificações da origem de dados }
    procedure RemoveNotify(AObject: TObject; ANotifyProc: TNotifyProc); 
    { notifica a origem de dados, para atualizar todos os valores }
    procedure Refresh; 

    { seta um valor string no campo "AField" da origem de dados }
    procedure SetValue(const AField: String; const AValue: String); 
    { retorna um valor string do campo "AField" da origem de dados }
    function GetValue(const AField: String): String; 
    { seta um valor inteiro no campo "AField" da origem de dados }
    procedure SetIntValue(const AField: String; const AValue: Longint); 
    { retorna um valor inteiro do campo "AField" da origem de dados }
    function GetIntValue(const AField: String): Longint; 
    { seta um valor Real no campo "AField" da origem de dados }
    procedure SetFloatValue(const AField: String; const AValue: Double); 
    { retorna um valor Real do campo "AField" da origem de dados }
    function GetFloatValue(const AField: String): Double; 
    { seta um valor Data e hora no campo "AField" da origem de dados }
    procedure SetDateTimeValue(const AField: String; const AValue: TDateTime); 
    { retorna um valor Data e hora do campo "AField" da origem de dados }
    function GetDateTimeValue(const AField: String): TDateTime;
    { retorna o tipo de dado de um determinado campo }
    function GetDateType(const AField: String): TInterfaceDataType;
    { habilita as notificações aos controles visuais }
    procedure EnableControls;
    { desabilita as notificações aos controles visuais }
    procedure DisableControls;

    { funções de posicionamento na origem de dados }
    { retorna a posicao da linha corrente da origem de dados }
    function GetCurrentPos: Longint;
    { posiciona em uma linha especifica da origem de dados }
    function GotoPosition(const APosition: Longint): Boolean;
    { posiciona na primeira linha da origem de dados }
    function First: Boolean;
    { posiciona na ultima linha da origem de dados }
    function Last: Boolean;
    { posiciona na proxima linha da origem de dados }
    function Next: Boolean;
    { posiciona na linha anterior da origem de dados }
    function Prev: Boolean;
    { retorna o deslocamento realizado na origem de dados }
    function GetMoveOffset: Longint;
    { seta o deslocamento realizado na origem de dados }
    procedure SetMoveOffSet(const AOffSet: Longint);
    { preenche a lista com os tipos possiveis para o campo }
    procedure GetEnumValues(const AFieldName: String; const AList: TStrings);
    { retorna se os dados são validos }
    function GetValidValues: Boolean;
  end;

const
  OFFSET_POSITION = -2;
  OFFSET_NEXT = 1;
  OFFSET_PREV = -1;
  OFFSET_CHANGE = 0;
  OFFSET_REMOVE = -3;


implementation

end.
