unit uAtualizador_eCob;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, XPMan, jpeg;

type
  TFrmAtualizador = class(TForm)
    Label1: TLabel;
    TimerAtualiza: TTimer;
    PB: TProgressBar;
    Label2: TLabel;
    XPManifest1: TXPManifest;
    Image1: TImage;
    procedure TimerAtualizaTimer(Sender: TObject);
  private
    { Private declarations }
    procedure DisposeStrList(const StrList: TStrings);
    function GetRegDir: String;
    procedure GetExtNames(const ExtDir, ExtName: String; const StrLst: TStrings);
    procedure GetExeNames(const ExeDir: String; const StrLst: TStrings);
    procedure GetININames(const ExeDir: String; const StrLst: TStrings);
    procedure UpdateFile(FileName: String);
    procedure CompareCopyFiles(const SourceDir, DestDir: String; const FStrList: TStrings; const FOverWrite : Boolean = True);
  public
    { Public declarations }
    function flEhAcessoLocal : Boolean;
    procedure Atualiza;
  end;

var
  FrmAtualizador: TFrmAtualizador;

implementation
{$R *.DFM}

uses
  DBTables,
  FileCtrl,
  Registry,
  IniFiles,
  DateUtils;


const
    eCOB_EXE    = 'wCOB.EXE';


type
  TInfoFile = class
  private
   FDateTime: Integer;
   FSize: Integer;
  public
    property DateTime: Integer read FDateTime write FDateTime;
    property Size: Integer read FSize write FSize;
  end;

const
  CHAVEREG = 'Software\eCob\Atualizador wCob';
  DIRETORIOBMP = 'RECURSOS\IMAGENS\';
  ARQUIVOSISTEMA = 'SISTEMA.CFG';

function GetSystemDir: String;
var
  lBuffer: array[0..128] of Char;
begin
  ZeroMemory(@lBuffer, Sizeof(lBuffer));
  if GetSystemDirectory(@lBuffer, 128) <> 0 then
    Result := lBuffer
  else Result := ExtractFilePath(Application.ExeName);
  Result := IncludeTrailingPathDelimiter(Result);
end;

procedure TFrmAtualizador.DisposeStrList(const StrList: TStrings);
var
  I: Integer;
begin
  for I := 0 to StrList.Count - 1 do
      TInfoFile(StrList.Objects[I]).Free;
  StrList.Clear;
end;

function TFrmAtualizador.GetRegDir: String;
var
  FReg: TRegIniFile;
  F: TextFile;
begin
  Try
    if FileExists(ARQUIVOSISTEMA) then
    begin
      AssignFile(F, ARQUIVOSISTEMA);
      Reset(F);
      Readln(F, Result);
    end
    else
      raise Exception.Create('Falta o arquivo de configuração. Execute o SelecionaDiretorio.exe');
  Except
    On E:Exception Do
    Begin
      ShowMessage(E.Message);
      Application.Terminate;
    End;
  End;
end;

procedure TFrmAtualizador.GetExtNames(const ExtDir, ExtName: String; const StrLst: TStrings);
var
  SR: TSearchRec;
  InfoFile: TInfoFile;
begin
  StrLst.BeginUpdate;
  try
    if  FindFirst(ExtDir + ExtName, faArchive, SR) = 0 then
        begin
          Repeat
            InfoFile := TInfoFile.Create;
            InfoFile.FDateTime := SR.Time;
            InfoFile.Size := SR.Size;
            StrLst.AddObject(AnsiUpperCase(SR.Name), InfoFile);
          Until (FindNext(SR) <> 0);
        end;
    FindClose(SR);
  finally
    StrLst.EndUpdate;
  end;
end;

procedure TFrmAtualizador.GetExeNames(const ExeDir: String; const StrLst: TStrings);
begin
  StrLst.BeginUpdate;
  try
    GetExtNames(ExeDir, eCOB_EXE, StrLst);
  finally
    StrLst.EndUpdate;
  end;
end;

procedure TFrmAtualizador.GetININames(const ExeDir: String;
  const StrLst: TStrings);
begin
  StrLst.BeginUpdate;
  try
    GetExtNames(ExeDir, ChangeFileExt(eCOB_EXE, '.UDL'), StrLst);
  finally
    StrLst.EndUpdate;
  end;
end;

procedure TFrmAtualizador.UpdateFile(FileName: String);
var
  OldName: String;
  SRLocal: TSearchRec;
  Ext: String;
  P, Status: Integer;
  TotalArquivos: Integer;
begin
  OldName := FileName;
  Ext := ExtractFileExt(FileName);
  P := pos(Ext, FileName);
  Delete(FileName, P, length(FileName));
  TotalArquivos := 0;
  Status := FindFirst(FileName + '.*', faArchive, SRLocal);
  while (Status = 0) do
  begin
    inc(TotalArquivos);
    Status := FindNext(SRLocal);
  end;
  FindClose(SRLocal);
  inc(TotalArquivos);
  RenameFile(OldName, OldName + '_' + FormatFloat('000', TotalArquivos));
end;

procedure TFrmAtualizador.CompareCopyFiles(const SourceDir, DestDir: String; const FStrList: TStrings; const FOverWrite : Boolean = True);
var
  x: Integer;
  SRLocal: TSearchRec;
  L,R: TDateTime;
begin
  if  (FStrList.Count <> 0) then
      PB.Max := FStrList.Count - 1
  else
      PB.Max := 0;
  try
    for x := 0 to FStrList.Count - 1 do
    begin
  //    L := FileDateToDateTime(SRLocal.Time);
  //    R := FileDateToDateTime(TInfoFile(FStrList.Objects[x]).FDateTime);

      // Dalutex - Andre - 13/07/2005
      // Se o Parametro FOverWrite estiver False, irá copiar apenas os Arquivos que não existirem no Destino
      if   (FindFirst(DestDir + FStrList[x], faArchive, SRLocal) = 0) then
           begin
             if   (FOverWrite) then
                  begin
                    L := FileDateToDateTime(SRLocal.Time);
                    R := FileDateToDateTime(TInfoFile(FStrList.Objects[x]).FDateTime);
                    if (MinutesBetween(L, R) > 2) or
                       (TInfoFile(FStrList.Objects[x]).Size <> SRLocal.Size) then
                       begin
                         Label2.Caption := UpperCase(FStrList[x]) + format('(L -> %s) <-> (R -> %s)' ,[DateTimeToStr(L),
                                                                                                      DateTimeToStr(R)]);
                         PB.Position := x;
                         Application.ProcessMessages;
                         try
                           DeleteFile(DestDir + FStrList[x]);
                           if GetLastError <> 0 then
                              raise Exception.CreateFmt('%s - %d' , [SysErrorMessage(GetLastError), GetLastError]);
                           if not CopyFile(pChar(SourceDir + FStrList[x]), pChar(DestDir + FStrList[x]), FALSE) then
                              Exception.CreateFmt('%s - %d' , [SysErrorMessage(GetLastError), GetLastError]);
                         except
                           FileSetAttr(DestDir + FStrList[x], faArchive);
                           UpdateFile(DestDir + FStrList[x]);
                           if not CopyFile(pChar(SourceDir + FStrList[x]), pChar(DestDir + FStrList[x]), FALSE) then
                              Exception.CreateFmt('%s - %d' , [SysErrorMessage(GetLastError), GetLastError]);
                           if  CompareText(FStrList[x], 'SelecionaDiretorio.exe') = 0 then
                           begin
                              WinExec('SelecionaDiretorio.exe', SW_SHOWNORMAL);
                              Halt;
                           end;
                         end;
                       end;
                  end;
           end
      else
           begin
             Label2.Caption := UpperCase(FStrList[x]) + '*';;
             PB.Position := x;
             Application.ProcessMessages;
             if not CopyFile(pChar(SourceDir + FStrList[x]), pChar(DestDir + FStrList[x]), FALSE) then
                Exception.CreateFmt('%s - %d' , [SysErrorMessage(GetLastError), GetLastError]);
           end;
      FindClose(SRLocal);
    end;
  except
    raise;
  end;
end;

procedure TFrmAtualizador.Atualiza;
var
  Indice : LongInt;
  StrList: TStrings;
  LocalP,
  RemoteP: String;
  Comando : String;
begin
  StrList := TStringList.Create;
  TimerAtualiza.Enabled := False;
  PB.Min := 0;
  try
    try
      LocalP := ExtractFilePath(Application.ExeName);
      if   ParamCount = 1 then
           RemoteP := ParamStr(1)
      else
           RemoteP := GetRegDir;
      If String(LocalP)[Length(LocalP)] <> '\' then
        LocalP := LocalP + '\';
      If String(RemoteP)[Length(RemoteP)] <> '\' then
        RemoteP := RemoteP + '\';
      // =========== Checagem de diretorios =============
      if not DirectoryExists(RemoteP) then
        Exception.Create('Diretório não encontrado: ' + RemoteP);
      if not DirectoryExists(LocalP + DIRETORIOBMP) then
        if not ForceDirectories(LocalP + DIRETORIOBMP) then
          Exception.Create('Não posso criar ' + LocalP + DIRETORIOBMP);
      // ===================== *.EXE ====================
      DisposeStrList(StrList);
      GetExeNames(RemoteP, StrList);
      CompareCopyFiles(RemoteP, LocalP, StrList);
      // ===================== *.UDL ====================
      DisposeStrList(StrList);
      GetExtNames(RemoteP, '*.UDL', StrList);
      CompareCopyFiles(RemoteP, LocalP, StrList);

      Comando:= eCOB_EXE;
      Application.ProcessMessages;
      if WinExec(pChar(LocalP + Comando), SW_SHOW) <= 31 then
        Exception.CreateFmt('%s - %d' , [SysErrorMessage(GetLastError), GetLastError]);
    except
      raise;
    end;
  finally
    StrList.Free;
  end;
end;

procedure TFrmAtualizador.TimerAtualizaTimer(Sender: TObject);
begin
  if   (flEhAcessoLocal) then
       Atualiza
  else
       ShowMessage('Apenas é permitido executar em Unidades Locais');
  Close;
end;

function TFrmAtualizador.flEhAcessoLocal: Boolean;
Var
  lsPastaAtual : String;
begin
  lsPastaAtual := UpperCase(Copy(ParamStr(0), 1, 2)) + '/';

  Result := Not((Length(lsPastaAtual) > 0) and
                (GetDriveType(PChar(lsPastaAtual)) = DRIVE_REMOTE));
end;

end.
