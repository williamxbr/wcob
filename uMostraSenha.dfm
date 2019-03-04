object Form1: TForm1
  Left = 395
  Top = 186
  Width = 640
  Height = 606
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 129
    Width = 632
    Height = 443
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Home\wCob\Dados\' +
      'wCob.mdb;Persist Security Info=False'
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 8
    Top = 16
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'USUARIO'
    Left = 48
    Top = 16
    object ADOTable1ID: TAutoIncField
      DisplayWidth = 17
      FieldName = 'ID'
      ReadOnly = True
    end
    object ADOTable1USUARIO: TWideStringField
      DisplayWidth = 19
      FieldName = 'USUARIO'
      Size = 10
    end
    object ADOTable1SENHA1: TWideStringField
      DisplayWidth = 24
      FieldKind = fkCalculated
      FieldName = 'SENHA1'
      ReadOnly = True
      OnGetText = ADOTable1SENHA1GetText
      Calculated = True
    end
    object ADOTable1NOME: TWideStringField
      DisplayWidth = 24
      FieldName = 'NOME'
    end
    object ADOTable1TIPO_USUARIO: TBooleanField
      FieldName = 'TIPO_USUARIO'
      Visible = False
    end
    object ADOTable1ENDERECO_IP: TWideStringField
      FieldName = 'ENDERECO_IP'
      Visible = False
      Size = 15
    end
    object ADOTable1NOME_COMPUTADOR: TWideStringField
      FieldName = 'NOME_COMPUTADOR'
      Visible = False
      Size = 30
    end
    object ADOTable1USUARIO_REDE: TWideStringField
      FieldName = 'USUARIO_REDE'
      Visible = False
      Size = 30
    end
    object ADOTable1USUARIO_LOGADO: TBooleanField
      DisplayWidth = 20
      FieldName = 'USUARIO_LOGADO'
    end
    object ADOTable1SENHA: TWideStringField
      FieldName = 'SENHA'
      Visible = False
      Size = 10
    end
    object ADOTable1USUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
      Visible = False
    end
    object ADOTable1USUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
      Visible = False
    end
    object ADOTable1DATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
      Visible = False
    end
    object ADOTable1DATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
      Visible = False
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 96
    Top = 16
  end
end
