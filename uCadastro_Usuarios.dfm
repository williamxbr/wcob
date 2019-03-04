object FrmUsuarios: TFrmUsuarios
  Left = 618
  Top = 263
  BorderStyle = bsSingle
  Caption = 'Cadastros de Usuarios'
  ClientHeight = 215
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 166
      Height = 19
      Caption = 'Cadastro de Usuarios'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 174
    Width = 433
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Color = clWhite
    TabOrder = 1
    object sbSair: TSpeedButton
      Left = 378
      Top = 8
      Width = 43
      Height = 25
      Flat = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
      OnClick = sbSairClick
    end
    object DBNavUsuarios: TDBNavigator
      Left = 14
      Top = 8
      Width = 240
      Height = 25
      DataSource = dsUsuarios
      Flat = True
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 433
    Height = 133
    Align = alClient
    BevelInner = bvLowered
    Color = clSilver
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    DesignSize = (
      433
      133)
    object Label2: TLabel
      Left = 24
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label3: TLabel
      Left = 160
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Senha'
    end
    object Label4: TLabel
      Left = 24
      Top = 56
      Width = 75
      Height = 13
      Caption = 'Nome Completo'
    end
    object Label5: TLabel
      Left = 304
      Top = 8
      Width = 60
      Height = 13
      Caption = 'Tipo Usuario'
    end
    object DBNOME: TDBEdit
      Left = 24
      Top = 72
      Width = 401
      Height = 21
      DataField = 'NOME'
      DataSource = dsUsuarios
      TabOrder = 3
    end
    object DBSENHA: TDBEdit
      Left = 160
      Top = 24
      Width = 121
      Height = 21
      DataField = 'SENHA'
      DataSource = dsUsuarios
      PasswordChar = '*'
      TabOrder = 1
    end
    object DBUSUARIO: TDBEdit
      Left = 24
      Top = 24
      Width = 121
      Height = 21
      DataField = 'USUARIO'
      DataSource = dsUsuarios
      TabOrder = 0
    end
    object DBTIPO_USUARIO: TDBCheckBox
      Left = 304
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Administrativo'
      Ctl3D = False
      DataField = 'TIPO_USUARIO'
      DataSource = dsUsuarios
      ParentCtl3D = False
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object btnPermissao: TBitBtn
      Left = 310
      Top = 97
      Width = 115
      Height = 29
      Cursor = crHandPoint
      Hint = 'Configura a lista dos romaneios selecionados'
      Anchors = [akLeft, akBottom]
      Caption = '&Permiss'#245'es'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFF0000FF0000
        7F0000FFBFBFBF000000FFFFFF7F7F7F000000000000000000FFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFF0000FF00007F0000FF000000007F7F7F7F7F000000
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
        7F0000FF007F7F007F7F000000FFFFFF000000000000FFFFFFFFFFFF000000FF
        FFFFFFFFFFFFFFFFFFFFFF0000FF00007F0000FF007F7F007F7F000000000000
        FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
        7F0000FF007F7FFFFFFF0000007F7F7FFFFFFFFFFFFF000000FFFFFF000000FF
        FFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF
        7F7F7F000000FFFFFF0000007F7F7FFFFFFFFFFFFF00000000007F00007F0000
        7F00007F00007FFFFFFFFFFFFFFFFFFF0000000000000000007F7F7FFFFFFFFF
        FFFF000000007F7F007F7F007F7F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000007F7F007F7F007F7FFFFFFF0000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF00000000
        7F7F007F7F007F7FFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000
        BFBFBF000000FFFFFF000000007F7F007F7F007F7FFFFFFFFFFFFFFFFFFF0000
        00FFFFFFFFFFFFFFFFFF000000BFBFBF000000000000000000007F7F007F7F00
        7F7FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000000000
        000000000000000000000000007F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000
        007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FF
        FFFFFFFFFFFFFFFFFFFFFF7F7F7F0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
        007F7F0000000000000000000000007F7F7FFFFFFFFFFFFFFFFFFF7F7F7F0000
        007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF007F7F007F7FFFFFFF00000000000000
        0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object DB_ATIVO: TDBCheckBox
      Left = 304
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Ativo'
      Ctl3D = False
      DataField = 'ATIVO'
      DataSource = dsUsuarios
      ParentCtl3D = False
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object dsUsuarios: TDataSource
    Left = 232
    Top = 8
  end
end
