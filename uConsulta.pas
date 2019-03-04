unit uConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids;

type
  TFrameConsulta = class(TFrame)
    FGridConsulta: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
     constructor Create(Owner: TComponent); override;
     destructor Destroy; override;
     property GridConsulta: TDBGrid read FGridConsulta;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameConsulta }



constructor TFrameConsulta.Create(Owner: TComponent);
begin
  inherited;

end;

destructor TFrameConsulta.Destroy;
begin
  inherited;
end;

end.
