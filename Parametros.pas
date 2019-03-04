unit Parametros;

interface
Uses
  WinSock,
  Adodb,
  Windows,
  ActiveX,
  SysUtils;

Const
  Projecao   = 1;
  Wigcred    = 2;
  ServCredit = 3;
  Marcelo    = 4;
  VersaoSistema = 1;

Type

  TUniqueParametros = Class
  private
    FUsuario          : String;
    FSenha            : String;
    FVersao           : Integer;
    FUsuarioConectado : Boolean;
    FPrivilegiado     : Boolean;
    FSenhaMestre      : Boolean;
    FCancelaLogin     : Boolean;
    FEhCobrador       : Boolean;
    FIndiceDEPRE      : Double;
    FIDCobrador       : Integer;
    FEmpresaIdCredor  : Integer;
    FUltimoRecido     : Integer;
    FHostName         : String;
    FIPNumber         : String;
    FUsuarioSistema   : String;
    FConexao          : TADOConnection;
    FEmpresa          : Byte;
    FUsuarios         : Byte;
    FValidade         : TDateTime;
    function GetDatabaseName   : String;
    function GetDatabaseWork   : String;
    function GetDatabaseReport : String;
    function plParametrosDataBase: String;
    procedure plParametrosSistema;
    procedure plIniciaDatabase;
    function GetPermitirUsuario : Boolean;
    function GetVersion : String;
  public
    class function GetParametros: TUniqueParametros;
    class procedure FreeParametros;
    constructor Create;
    destructor Destroy; override;

    property Usuario          : String         read FUsuario            write FUsuario;
    property Senha            : String         read FSenha              write FSenha;
    property Versao           : Integer        read FVersao             write FVersao;
    property UsuarioConectado : Boolean        read FUsuarioConectado   write FUsuarioConectado;
    property Privilegiado     : Boolean        read FPrivilegiado       write FPrivilegiado;
    property SenhaMestre      : Boolean        read FSenhaMestre        write FSenhaMestre;
    property CancelaLogin     : Boolean        read FCancelaLogin       write FCancelaLogin;
    property DatabaseName     : String         read GetDatabaseName;
    property DatabaseWork     : String         read GetDatabaseWork;
    property DatabaseReport   : String         read GetDatabaseReport;
    property EhCobrador       : Boolean        read FEhCobrador         write FEhCobrador;
    property IndiceDEPRE      : Double         read FIndiceDEPRE        write FIndiceDEPRE;
    property IDCobrador       : Integer        read FIDCobrador         write FIDCobrador;
    property EmpresaIdCredor  : Integer        read FEmpresaIdCredor    write FEmpresaIdCredor;
    property UltimoRecibo     : Integer        read FUltimoRecido       write FUltimoRecido;
    property HostName         : String         read FHostName           write FHostName;
    property IPNumber         : String         read FIPNumber           write FIPNumber;
    property UsuarioSistema   : String         read FUsuarioSistema     write FUsuarioSistema;
    property Empresa          : Byte           read FEmpresa            write FEmpresa;
    property Conexao          : TADOConnection read FConexao;
    property Usuarios         : Byte           read FUsuarios           write FUsuarios;
    property Validade         : TDateTime      read FValidade           write FValidade;
    property PermitirUsuario  : Boolean        read GetPermitirUsuario;
    property VersaoSw         : String         read GetVersion;
  End;

implementation
Uses
 IniFiles,
 uCodifica,
 ucLayParametros,
 ucLayUsuario;

resourcestring
 Str_Erro = 'Erro';
 Str_BaseDeDadosNaoEncontradaOSistema = 'Base de dados não encontrada. O sistema será encerrado.';
 Str_SistemaInvalidoSemSerial = 'Sistema Invalido, sem serial';
 Str_SistemaIncompativelMotivoEmpresa = 'Sistema incompativel com a base de dados! Motivo : Empresa!';
 Str_SistemaIncompativelMotivoVersao = 'Sistema incompativel com a base de dados! Motivo : Versão!';
 Str_SistemaExpiradoFavorEntrarEmCont = 'Sistema expirado! Favor entrar em contato com o Administrador!';

const
 SDATABASECFG = 'DATABASE.CFG';
 SWork = 'Work\';
 SReport = 'Report\';
 FUniqueParametros: TUniqueParametros = nil;

{ TParametros }

constructor TUniqueParametros.Create;
begin
  inherited;
  CoInitialize(Nil);
end;

destructor TUniqueParametros.Destroy;
begin
  FConexao.Free;
  CoUninitialize;
  inherited;
end;

class procedure TUniqueParametros.FreeParametros;
begin
  if   FUniqueParametros <> Nil then
       begin
         FUniqueParametros.Free;
         FUniqueParametros := nil;
       end;
end;

function TUniqueParametros.GetDatabaseName: String;
Const
  FileCFG = SDATABASECFG;

  function GetDataBaseSourceDir : String;
  var
    //F: TextFile;
    F : TIniFile;
  begin
    //AssignFile(F, ExtractFilePath(ParamStr(0)) + FileCFG);
    //Reset(F);
    F := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'wCob.ini');
    try
      Result := F.ReadString('wcob','Database', EmptyStr);
     // Readln(F, Result);
    finally
     // CloseFile(F);
      F.Free;
    end;
  end;

begin
  Result := IncludeTrailingPathDelimiter(GetDataBaseSourceDir);
end;

function TUniqueParametros.GetDatabaseReport: String;
begin
  Result := GetDatabaseName + SReport;
end;

function TUniqueParametros.GetDatabaseWork: String;
begin
  Result := GetDatabaseName + SWork;
end;

class function TUniqueParametros.GetParametros: TUniqueParametros;
begin
  if   (FUniqueParametros = Nil) then
       Begin
         FUniqueParametros := TUniqueParametros.Create;
         FUniqueParametros.plIniciaDatabase;
       End;
  Result := FUniqueParametros;
end;

function TUniqueParametros.GetPermitirUsuario: Boolean;
Var
  FSimplesUsuario : TSimplesUsuario;
  Ind : Byte;
begin
  FSimplesUsuario := TSimplesUSUARIO.Create(Nil);
  Ind := 0;
  FSimplesUsuario.CarregaSQL;
  While FSimplesUsuario.Eof Do
    Begin
      If   FSimplesUsuario.USUARIO_LOGADO Then
           Inc(Ind);
      FSimplesUsuario.Next;
    End;
  Result := Usuarios > Ind;
end;

function TUniqueParametros.GetVersion: String;
{ ---------------------------------------------------------
   Extracts the FileVersion element of the VERSIONINFO
   structure that Delphi maintains as part of a project's
   options.

   Results are returned as a standard string.  Failure
   is reported as "".

   Note that this implementation was derived from similar
   code used by Delphi to validate ComCtl32.dll.  For
   details, see COMCTRLS.PAS, line 3541.
  -------------------------------------------------------- }
const
   NOVIDATA = '';

var
  dwInfoSize,           // Size of VERSIONINFO structure
  dwVerSize,            // Size of Version Info Data
  dwWnd: DWORD;         // Handle for the size call.
  FI: PVSFixedFileInfo; // Delphi structure; see WINDOWS.PAS
  ptrVerBuf: Pointer;   // pointer to a version buffer
  strFileName,          // Name of the file to check
  strVersion : string;  // Holds parsed version number
begin
   strFileName := paramStr( 0 );
   dwInfoSize :=
      getFileVersionInfoSize( pChar( strFileName ), dwWnd);

   if ( dwInfoSize = 0 ) then
      result := NOVIDATA
   else
   begin

      getMem( ptrVerBuf, dwInfoSize );
      try

         if getFileVersionInfo( pChar( strFileName ),
            dwWnd, dwInfoSize, ptrVerBuf ) then

            if verQueryValue( ptrVerBuf, '\',
                              pointer(FI), dwVerSize ) then

            strVersion :=
               format( '%d.%d.%d.%d',
                       [ hiWord( FI.dwFileVersionMS ),
                         loWord( FI.dwFileVersionMS ),
                         hiWord( FI.dwFileVersionLS ),
                         loWord( FI.dwFileVersionLS ) ] );

      finally
        freeMem( ptrVerBuf );
      end;
    end;
  Result := strVersion;
end;

procedure TUniqueParametros.plIniciaDatabase;
begin
  Try
    FConexao := TADOConnection.Create(Nil);
    FConexao.Connected := False;
    FConexao.Close;
    FConexao.ConnectionString := plParametrosDataBase;
    FConexao.CursorLocation := clUseServer;
    FConexao.Open;
    FConexao.Connected := True;
  Except
    Begin
      MessageBox(0,PChar(Str_BaseDeDadosNaoEncontradaOSistema), 'Erro'  , MB_OK);
      Halt;
    End;
  End;
  plParametrosSistema;
end;

function TUniqueParametros.plParametrosDataBase: String;
begin
//   Result := 'File Name='+TUniqueParametros.GetParametros.DatabaseName+'wCob.udl';
   Result := 'Provider=Microsoft.Jet.OLEDB.4.0;' + // provider for Access2000
             'Data Source='+TUniqueParametros.GetParametros.DatabaseName+'wCob.mdb;' + // databasefile
             'Mode=ReadWrite|Share Deny None;' + // set to ReadWrite
             'Persist Security Info=False';

end;

procedure TUniqueParametros.plParametrosSistema;
Var
  FParametros : TPARAMETROS;
  Serial      : String;
begin
  FParametros := TPARAMETROS.Create(Nil);
  Try
    Try
     FParametros.Carrega(False);
     FParametros.First;
     Versao          := FParametros.VERSAO_SISTEMA;
     IndiceDEPRE     := FParametros.JUROS_DEPRE;
     EmpresaIdCredor := FParametros.IDCREDORPROPRIETARIO;
     UltimoRecibo    := FParametros.ULTIMO_NUM_RECIBO;
     Empresa         := FParametros.EMPRESA;
     If    Trim(FParametros.NUMERO_SERIAL) = EmptyStr Then
           Raise Exception.Create(Str_SistemaInvalidoSemSerial);
     Serial          := Decriptografar(FParametros.NUMERO_SERIAL);
     If   Empresa <> StrToInt(Copy(Serial,1,3)) Then
          Raise Exception.Create(Str_SistemaIncompativelMotivoEmpresa);
     If   VersaoSistema <> StrToInt(Copy(Serial,4,3)) Then
          Raise Exception.Create(Str_SistemaIncompativelMotivoVersao);
     Usuarios        := StrToInt(Copy(Serial,7,3));
     Validade        := EncodeDate(StrToInt(Copy(Serial,10,4)),StrToInt(Copy(Serial,14,2)),StrToInt(Copy(Serial,16,2)));
     If   Date > Validade Then
          Raise Exception.Create(Str_SistemaExpiradoFavorEntrarEmCont);
    Except
       On E: Exception Do
          Begin
            MessageBox(0,PChar(E.Message), 'Erro', MB_OK);
            Halt;
          End;
    End;
  Finally
    FParametros.Free;
  End;
end;

initialization
  TUniqueParametros.GetParametros;

finalization
  TUniqueParametros.FreeParametros;

end.

