unit Empresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, DB, DBTables, DBActns,
  ActnList, DBCtrls, Mask, Grids, DBGrids, ExtDlgs;

type
  TFrmEmpresa = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    PageControl1: TPageControl;
    TabSheetCadastro: TTabSheet;
    Panel3: TPanel;
    Label2: TLabel;
    DBEditCodGrupo: TDBEdit;
    ActionList1: TActionList;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    TabSheetListagem: TTabSheet;
    Panel5: TPanel;
    Panel2: TPanel;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBImage1: TDBImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TbContasBeforeDelete(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBImage1DblClick(Sender: TObject);
    procedure DBEdit13Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmpresa: TFrmEmpresa;

implementation

uses DMU, Grupo, Contas;

{$R *.dfm}

procedure TFrmEmpresa.SpeedButton1Click(Sender: TObject);
begin
  FrmEmpresa.Close;
end;

procedure TFrmEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmEmpresa := NIL;
end;

procedure TFrmEmpresa.FormCreate(Sender: TObject);
begin
  DM.TbEmpresa.Open;
 PageControl1.ActivePage := TabSheetCadastro;  
end;

procedure TFrmEmpresa.TbContasBeforeDelete(DataSet: TDataSet);
begin
  if MessageBox(FrmEmpresa.Handle,'Voce Deseja Excluir o Contas','Confirmar Exclusão',MB_YESNO + MB_ICONQUESTION) = 7 then
   begin
    DM.TbEmpresa.Cancel;
    abort;
   end;
end;

procedure TFrmEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   Begin
      SelectNext(Sender as tWinControl, True, True );
      Key := #0;
   end;
end;

procedure TFrmEmpresa.DBImage1DblClick(Sender: TObject);
var BMP: TBitMap;
begin
   BMP := TBitMap.Create;
   if OpenPictureDialog1.Execute then
   begin
     begin
        if DM.TbEmpresa.State in [dsinsert] then
        begin
            BMP.LoadFromFile(OpenPictureDialog1.FileName);
            DM.TbEmpresaLogo.Assign( BMP );
        end
        else
        begin
           DM.TbEmpresa.edit;
           BMP.LoadFromFile(OpenPictureDialog1.FileName);
           DM.TbEmpresaLogo.Assign( BMP );
        end;
     end;
   end;
end;

procedure TFrmEmpresa.DBEdit13Change(Sender: TObject);
begin
   if (DM.TbEmpresaBuscaCodBarra.AsString <> 'S') or
      (DM.TbEmpresaBuscaCodBarra.AsString <> 'N') then
   ShowMessage('Digite Somente as letras "S"im ou "N"ão');
   if DM.TbEmpresaBuscaCodBarra.IsNull then
   ShowMessage('Digite Somente as letras "S"im ou "N"ão, Não poder nulo');
end;

end.
