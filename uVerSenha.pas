unit uVerSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, jpeg, ExtCtrls, ToolWin, StdCtrls, Buttons,
  DB,
  SmtLstvw, SBLstV0u,
  XPMan, CheckLst;


type



  TfrmPrincipal = class(TForm)
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnSair: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FecharSistema(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    lvUsuarios : TSmartListView;
    procedure plCarregaUsuarios;
    procedure plCriarComponentes;
    procedure plCriarCabecalho;
  public
    { Public declarations }
  end;


var
  frmPrincipal: TfrmPrincipal;

implementation
Uses
  ucLayUsuario,
  uSistemas,
  uCodifica,
  //Modulo

  //Parametros
  Parametros,
  uParametros;


const
 SIDMENU  = 'IDMENU';
 SDados   = 'Dados : ';
 SVersao  = 'Versão : ';
 SUsuario = 'Usuario : ';

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Try
    InicializaSistemas;
    plCarregaUsuarios;
  Except
    Application.Terminate;
  End;
end;



procedure TfrmPrincipal.FecharSistema;
begin
  Close;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  plDesconectarUsuario;
end;

procedure TfrmPrincipal.plCarregaUsuarios;
Var
  FSimplesUsuario : TSimplesUSUARIO;
begin
  plCriarComponentes;
  plCriarCabecalho;
  FSimplesUsuario := TSimplesUSUARIO.Create(Self);
  FSimplesUsuario.CarregaSQL;
  While Not FSimplesUsuario.Eof Do
    Begin
      lvUsuarios.AdjustColumnsByName['Id'          ].Lines.Add(IntToStr(FSimplesUsuario.ID));
      lvUsuarios.AdjustColumnsByName['Usuario'     ].Lines.Add(FSimplesUsuario.USUARIO);
      lvUsuarios.AdjustColumnsByName['Senha'       ].Lines.Add(Decriptografar(FSimplesUsuario.SENHA));
      lvUsuarios.AdjustColumnsByName['Nome'        ].Lines.Add(FSimplesUsuario.NOME);
      If   FSimplesUsuario.TIPO_USUARIO Then
           lvUsuarios.AdjustColumnsByName['Privilegiado'].Lines.Add('Sim')
      Else lvUsuarios.AdjustColumnsByName['Privilegiado'].Lines.Add('Não');
      If   FSimplesUsuario.ATIVO Then
           lvUsuarios.AdjustColumnsByName['Ativo'       ].Lines.Add('Sim')
      Else lvUsuarios.AdjustColumnsByName['Ativo'       ].Lines.Add('Não');
      FSimplesUsuario.Next;
    End;
  lvUsuarios.Execute;  
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.plCriarComponentes;
begin
  lvUsuarios := TSmartListView.Create(Self);
  With lvUsuarios Do
    Begin
      Align             := alClient;
      Parent            := Panel2;
      Name              := 'lvUsuarios';
      Visible           := True;
      ShowColumnHeaders := True;
      ViewStyle         := vsReport;
//      OnGetPath         := lvGetPath;
      Color             := clInfoBk;
      GridLines         := True;
      ReadOnly          := True;
      RowSelect         := True;
      EnableSort        := True;
      EnableFilter      := True;
      EnableSum         := True;
      ShowMainColumns   := False;
      EnablePaintCells  := True;
    End;
end;

procedure TfrmPrincipal.plCriarCabecalho;
begin
  lvUsuarios.Clear;
  lvUsuarios.TabularView.ClearColumns;
  lvUsuarios.TabularView.AddColumn('Id'           , taRightJustify  , otAsc, '', True, SmNotSum  , nil, ctInteger);
  lvUsuarios.TabularView.AddColumn('Usuario'      , taLeftJustify   , otAsc, '', True, SmNotSum  , nil, ctString);
  lvUsuarios.TabularView.AddColumn('Senha'        , taLeftJustify   , otAsc, '', True, SmNotSum  , nil, ctString);
  lvUsuarios.TabularView.AddColumn('Nome'         , taLeftJustify   , otAsc, '', True, SmNotSum  , nil, ctString);
  lvUsuarios.TabularView.AddColumn('Privilegiado' , taCenter        , otAsc, '', True, SmNotSum  , nil, ctString);
  lvUsuarios.TabularView.AddColumn('Ativo'        , taCenter        , otAsc, '', True, SmNotSum  , nil, ctString);

  lvUsuarios.AdjustColumnsByName['Id'           ].ColumnType := ctInteger;
  lvUsuarios.AdjustColumnsByName['Usuario'      ].ColumnType := ctString;
  lvUsuarios.AdjustColumnsByName['Senha'        ].ColumnType := ctString;
  lvUsuarios.AdjustColumnsByName['Nome'         ].ColumnType := ctString;
  lvUsuarios.AdjustColumnsByName['Privilegiado' ].ColumnType := ctString;
  lvUsuarios.AdjustColumnsByName['Ativo'        ].ColumnType := ctString;

  lvUsuarios.Execute;

end;

end.
