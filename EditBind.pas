{
 @abstract (Classe que implementa a ligação dos controles Edit com a origem de dados )
 @author (Eduardo Hildebrandt (edu@operacionaltextil.com.br))
 @created (06 mar 2002)
 @lastmod (06 mar 2002)
}

unit EditBind;

interface

uses
  uDataBind, StdCtrls;

type
  { componente Edit que tem ligação com a origem de dados }
  TDataBindEdit = class(TCustomEdit)
  private
    FDataBind: IDataBind;
    FDataField: String;
    procedure SetDataBind(const Value: IDataBind);
  protected
    {@exclude - fazer a leitura do valor }
    procedure DoEnter; override;
    {@exclude - escrever o valor na origem de dados }
    procedure DoExit; override;
    { notificacao de atualização do valor na origem de dados}
    procedure NotifyUpdate(AbindNotifyType: TBindNotifyType); 
    { faz a escrita do valor na origem de dados}
    procedure WriteValue; virtual; abstract; 
    { faz a leitura do valor na origem de dados}
    procedure ReadValue; virtual; abstract;
  public
    { destrutor padrao, remove a ligação do databind }
    destructor Destroy; override;
    { define qual será o origem dos dados }
    property DataBind: IDataBind read FDataBind write SetDataBind;
    { define qual será o campo da origem dos dados que será lido/escrito}
    property DataField: String read FDataField write FDataField;
  end;
  
implementation

uses Controls;

{ TDataBindEdit }

destructor TDataBindEdit.Destroy;
begin
  if FDataBind <> nil then
    FDataBind.RemoveNotify(Self, NotifyUpdate);
  FDataBind := nil;
  inherited Destroy;
end;

procedure TDataBindEdit.DoEnter;
begin
  inherited DoEnter;
  NotifyUpdate(bntChange);
end;

procedure TDataBindEdit.DoExit;
begin
  inherited DoExit;
  if not ReadOnly and Enabled then
    WriteValue;
end;

procedure TDataBindEdit.NotifyUpdate(AbindNotifyType: TBindNotifyType);
begin
  case ABindNotifyType of
    bntChange:
      begin
        ReadValue;
        Update;
      end;
    bntUnBind: DataBind := nil; // precisar executar o setdatabind
  end;
end;

procedure TDataBindEdit.SetDataBind(const Value: IDataBind);
begin
  if FDataBind <> nil then
    FDataBind.RemoveNotify(Self, NotifyUpdate);
  FDataBind := Value;
  if FDataBind <> nil then
    FDataBind.AddNotify(Self, NotifyUpdate);
end;

end.
 