object FUsuarios: TFUsuarios
  Left = 432
  Top = 207
  Width = 498
  Height = 266
  BorderIcons = []
  Caption = 'Cadastro de Usu'#225'rios...'
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 21
    Top = 80
    Width = 50
    Height = 13
    Alignment = taRightJustify
    Caption = 'ID-C'#243'digo:'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 11
    Top = 104
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dt. Inclus'#227'o:'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 6
    Top = 128
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dt. Altera'#231#227'o:'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 40
    Top = 152
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nome:'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 42
    Top = 176
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'Login:'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 37
    Top = 200
    Width = 34
    Height = 13
    Alignment = taRightJustify
    Caption = 'Senha:'
    FocusControl = DBEdit6
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 8
    Width = 320
    Height = 33
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 80
    Top = 72
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'ID'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 80
    Top = 96
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'DT_INC'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 80
    Top = 120
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'DT_ALT'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 80
    Top = 144
    Width = 394
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 80
    Top = 168
    Width = 199
    Height = 21
    CharCase = ecUpperCase
    DataField = 'LOGIN'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 80
    Top = 192
    Width = 201
    Height = 19
    CharCase = ecLowerCase
    DataField = 'SENHA'
    DataSource = DataSource1
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Wingdings 2'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '8'
    TabOrder = 6
  end
  object DBCheckBox1: TDBCheckBox
    Left = 232
    Top = 72
    Width = 97
    Height = 17
    Caption = 'Bloqueado'
    DataField = 'STATUS'
    DataSource = DataSource1
    TabOrder = 7
    ValueChecked = 'N'
    ValueUnchecked = 'S'
  end
  object Button1: TButton
    Left = 400
    Top = 8
    Width = 75
    Height = 33
    Caption = '&Fechar'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Table1: TTable
    AfterInsert = Table1AfterInsert
    AfterEdit = Table1AfterEdit
    DatabaseName = 'Senha'
    TableName = 'USUARIOS.DB'
    Left = 344
    Top = 8
    object Table1ID: TAutoIncField
      Alignment = taCenter
      FieldName = 'ID'
      ReadOnly = True
    end
    object Table1DT_INC: TDateField
      Alignment = taCenter
      FieldName = 'DT_INC'
    end
    object Table1DT_ALT: TDateField
      Alignment = taCenter
      FieldName = 'DT_ALT'
    end
    object Table1STATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object Table1NOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object Table1LOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 15
    end
    object Table1SENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 344
    Top = 40
  end
end
