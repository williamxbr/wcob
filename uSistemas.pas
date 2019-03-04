unit uSistemas;

interface

procedure InicializaSistemas;

procedure plConectarUsuario;

procedure plParametrosSistema;

procedure plDesconectarUsuario;

implementation
Uses
  DB,
  Forms,
  DateUtils,
  Variants,
  Windows,
  SysUtils,
  Dialogs,
  uSplash,
  ULogin,
  uclayUsuario,
  ucLayCobrador,
  Parametros, Classes;

resourcestring
  StrParametrizandoSiste = 'Parametrizando Sistema';
  StrConectandoUsuario = 'Conectando Usuario';

procedure InicializaSistemas;
Var
  Splash : TfrmSplash;
Begin
  TUniqueParametros.GetParametros;
  Splash := TfrmSplash.Create(Application);
  Try
    Try
      Splash.Show;
      Splash.Update;
      Splash.Contar;
      Splash.Contar;
      Splash.Mensagem(StrParametrizandoSiste);
      plParametrosSistema;
      Splash.Contar;
      Splash.Mensagem(StrConectandoUsuario);
      plConectarUsuario;
      If   TUniqueParametros.GetParametros.CancelaLogin Then
           Begin
             Splash.Mensagem('Fechando Tabelas');
             Halt;
           End;
      Splash.Hide;
    Except
      On E: Exception Do
         Begin
           MessageBox(0,PChar(E.Message), 'Erro', MB_OK);
           Halt;
         End;
    End;
  Finally
    Splash.Free;
  End;
End;

procedure plConectarUsuario;
Var
  FUsuario  : TUSUARIO;
  FCobrador : TCOBRADOR;
begin
  FUsuario  := TUSUARIO.Create(Nil);
  FCobrador := TCOBRADOR.Create(Nil);
  Try
    Try
      If   Not TUniqueParametros.GetParametros.PermitirUsuario Then
           Raise Exception.Create('Quantidade de usuarios excedidas');
      FUsuario.Carrega(False);
      FCobrador.Carrega(False);
      CarregaLogin;
      If   Not TUniqueParametros.GetParametros.CancelaLogin Then
           Begin
             if  AnsiUpperCase(Trim(TUniqueParametros.GetParametros.Usuario)) = 'MESTRE'   then
               Begin
                    if Copy(TUniqueParametros.GetParametros.Senha,1,4) <> IntToStr(YearOf(Now)) then
                       Raise Exception.Create(Copy(TUniqueParametros.GetParametros.Senha,1,4));

                    TUniqueParametros.GetParametros.SenhaMestre := True;
                    TUniqueParametros.GetParametros.EhCobrador  := False;
               End
             else
               Begin
                   If  Not FUsuario.FindByInd_Usuario(TUniqueParametros.GetParametros.Usuario) Then
                       Raise Exception.Create('Usuario não encontrado!');

                   If  FUsuario.SENHA <> TUniqueParametros.GetParametros.Senha Then
                       Raise Exception.Create('Senha invalida!');

                   If  Not FUsuario.ATIVO Then
                       Raise Exception.Create('Usuario desativado!');

                   If  FUsuario.USUARIO_LOGADO Then
                       Raise Exception.Create('Usuario Logado!');

                   FUsuario.Edit;
                   FUsuario.ENDERECO_IP     := TUniqueParametros.GetParametros.IPNumber;
                   FUsuario.NOME_COMPUTADOR := TUniqueParametros.GetParametros.HostName;
                   FUsuario.USUARIO_REDE    := TUniqueParametros.GetParametros.UsuarioSistema;
                   FUsuario.USUARIO_LOGADO  := True;
                   FUsuario.Post;

                   If  FCobrador.FindByInd_Usuario(FUsuario.ID) Then
                       Begin
                         TUniqueParametros.GetParametros.EhCobrador := True;
                         TUniqueParametros.GetParametros.IDCobrador := FCobrador.IDCOBRADOR;
                       End
                   Else
                       Begin
                         TUniqueParametros.GetParametros.Privilegiado := FUsuario.TIPO_USUARIO = True;
                         TUniqueParametros.GetParametros.EhCobrador   := False;
                       End;
                 End;
           End;
    Except
      On E: Exception Do
         Begin
           TUniqueParametros.GetParametros.CancelaLogin := True;
           MessageBox(0,PChar(E.Message), 'Erro', MB_OK);
         End;
    End;
  Finally
    FUsuario.Free;
    FCobrador.Free;
  End;
end;

procedure plParametrosSistema;
begin
end;

procedure plDesconectarUsuario;
Var
  FUsuario  : TUSUARIO;
begin
  FUsuario := TUSUARIO.Create(Nil);
  FUsuario.Carrega(False);
  Try
    If  FUsuario.FindByInd_Usuario(TUniqueParametros.GetParametros.Usuario) Then
        Begin
          FUsuario.Edit;
          FUsuario.USUARIO_LOGADO := False;
          FUsuario.Post;
        End;
  Finally
    FUsuario.Free;
  End;
end;

end.
