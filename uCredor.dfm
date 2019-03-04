object frmCredor: TfrmCredor
  Left = 390
  Top = 165
  Caption = 'Cadastro de Credor'
  ClientHeight = 465
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 424
    Width = 533
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Color = clWhite
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    DesignSize = (
      533
      41)
    object btnSair: TBitBtn
      Left = 421
      Top = 5
      Width = 113
      Height = 32
      Cursor = crArrow
      Hint = 'Sai da tela'
      Anchors = [akRight, akBottom]
      Caption = '&Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSairClick
      Glyph.Data = {
        8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
        180000000000580B0000CE0E0000D80E00000000000000000000FFFFFFF2F2F2
        F2F2F2D3D3D3E8E8E8F5F5F5DBDBDBDDDDDDECECECEEEEEED3D3D3EBEBEBF7F7
        F723230F4F4F00B2B2A8E9E9E9D6D6D6EBEBEBFAFAFAFFFFFFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBF7F7F7F7F7F7FB2B2A8BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFF
        FFF0F0F0D8D8D8EDEDEDEAEAEADFDFDFDCDCDCF4F4F4E6E6E6D7D7D7F2F2F2E7
        E7E7DDDDDD4C4C0CFFFF006868119B9B9BF4F4F4E7E7E7DBDBDBE6E6E6BFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFD3D3D3E4E4E4EFEFEFE4E4E4D8D8D8EDEDEDF3F3F3D3D3D3E7E7E7F1F1F1
        DFDFDFDBDBDBECECEC4D4D0DFFFF008D8D00515105878781DFDFDFEDEDEDECEC
        ECBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFF00BFBFBF7F7F7F7F7F7FBFBFBFBFBFBF
        BFBFBFBFBFBFE6E6E6EDEDEDE1E1E1DBDBDBF5F5F5E3E3E3DCDCDCEAEAEAEAEA
        EAE0E0E0DBDBDBF6F6F6E3E3E34D4D0DFFFF008F8F007F7F0056560DA1A1A1E2
        E2E2DBDBDBBFBFBFBFBFBFFFFFAFFFFFAFFFFFAFFFFFAFFFFFAFFFFFAFFFFFAF
        FFFFAFFFFFAFBFBFBFBFBFBFBFBFBF7F7F7FFFFF00BFBFBFBFBFBF7F7F7FBFBF
        BFFFFFAFFFFFAFFFFFAF4B4B4B5050504E4E4E4848484F4F4F5050504A4A4A4C
        4C4C444444F0F0F0F3F3F3D3D3D3E7E7E74E4E0EFFFF008F8F007F7F007D7D00
        4C4C0D323232484848BFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7FFFFFAFBFBFBFBFBFBFBFBFBF7F7F7FFFFF00BFBFBFBFBFBFBF
        BFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBF4A4A4ADFDFDFDFDFDFE9E9E9EBEBEB4D4D0DFFFF008F8F007F7F
        007F7F00474700636363BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBF7F7F7FFFFF00BFBFBF
        BFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFB0B0B0BFBFBF4040403F3F3F3737373737373F3F3F434303FFFF008F
        8F007F7F007F7F00474700636363BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFB0B0B0BFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF
        00BFBFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF3D3D3D8F8F8F3E3E3E7F7F7F7F7F7F7F7F7F7F7F7F474707
        FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FFFFFAFBFBFBFBFBFBFBFBFBF7F
        7F7FFFFF00BFBFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBF3C3C304D4D141515137F7F7F7F7F7F7F7F7F7F7F
        7F474707FFFF008D8D007777007D7D00474700636363BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FFFFFAFBFBFBFBFBFBF
        BFBFBF7F7F7FFFFF00BFBFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4646309A9A004545046161617F7F7F7F
        7F7F7F7F7F474707FFFF005F5F08171717676700474700636363BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFAF7F7F7F7F7F7FBFBF
        BFBFBFBFBFBFBF7F7F7FFFFF00BFBFBF7F7F7F7F7F7F7F7F7FFFFFAFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF474727EDED0092920045450E
        6363637F7F7F7F7F7F474707FFFF004747276B6B6B676700474700636363BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFAFFFFFAF7F
        7F7F7F7F7FBFBFBFBFBFBF7F7F7FFFFF00BFBFBF7F7F7F7F7F7F7F7F7FFFFFAF
        BFBFBFBFBFBFAEAEAE57574531310A272700272700272700424200FFFF00F9F9
        009898004242006363637F7F7F474707FFFF007E7E002727006E6E0047470063
        6363BFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFAF
        BFBFBFFFFFAF7F7F7F7F7F7FBFBFBF7F7F7FFFFF00BFBFBF7F7F7F7F7F7F7F7F
        7FFFFFAFBFBFBFBFBFBF8989898C8C13CFCF01CFCF00CFCF00CFCF00D5D500FF
        FF00FFFF00EDED0098980045450E616161474707FFFF008F8F007F7F007F7F00
        474700636363BFBFBFBFBFBF7F7F7FFFFFAFFFFFAFFFFFAFFFFFAFFFFFAFFFFF
        AFBFBFBFBFBFBFBFBFBFFFFFAF7F7F7F7F7F7F7F7F7FFFFF00BFBFBFBFBFBFBF
        BFBF7F7F7FFFFFAFBFBFBFBFBFBF898989A1A113FEFE2CFFFFAFFFFFAFFFFFAF
        FFFFAFFFFFAFFFFFDBFFFF6DE3E3004B4B095B5B5B474707FFFF008F8F007F7F
        007F7F00474700636363BFBFBFBFBFBF7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FFFFF00BFBFBF
        BFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFA7A7A76F6F4879790C7A7A0A7A7A
        0A7A7A0A8A8A09FFFF3EFFFF70E4E4005F5F005858587F7F7F474707FFFF008F
        8F007F7F007F7F00474700636363BFBFBFBFBFBFA7A7A77F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBF7F7F7F7F7F7FBFBFBF7F7F7FFFFF
        00BFBFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFB1B1B1A9A9A9A9
        A9A9A9A9A9A9A9A94C4C2CFFFF0DE6E6075959085858537F7F7F7F7F7F474707
        FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBFBFBFBFB1B1B1A9A9
        A9A9A9A9A9A9A9A9A9A97F7F7FBFBFBFBFBFBF7F7F7F7F7F7FBFBFBFBFBFBF7F
        7F7FFFFF00BFBFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBF505030E3E3005F5F035757577F7F7F7F7F7F7F7F
        7F474707FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF7F7F7F7F7F7FBFBFBFBFBFBF
        BFBFBF7F7F7FFFFF008F8F00BFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4242356E6E2521211B7F7F7F7F7F7F7F
        7F7F7F7F7F5E5E52999906D5D5008787007F7F00474700636363BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FFFFFAFBFBF
        BFBFBFBFBFBFBF7F7F7F999906D5D500878700BFBFBF7F7F7FFFFFAFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7070708888884444447F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F565656999906DBDB00898900474700636363BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FFF
        FFAFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F999906DBDB008989007F7F7FFFFFAF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4444
        447F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5E5E529B9B03D7D7004C4C0076
        7676BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F9B9B03D7D7007F7F
        7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBF4141415656565656565656565656565656565656565656562E2E2E888807
        65650C888888BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F88
        88077F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBF9696968989898989898989898989898989898989898989898989
        89898989898989B1B1B1BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF7F7F7FFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00BFBFBFBFBFBF}
      NumGlyphs = 2
    end
    object DBNavCredor: TDBNavigator
      Left = 8
      Top = 6
      Width = 320
      Height = 32
      DataSource = dsCredor
      Flat = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Color = clWhite
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 183
      Height = 22
      Caption = 'Cadastro de Credor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 533
    Height = 383
    Align = alClient
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    object Label2: TLabel
      Left = 7
      Top = 26
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel
      Left = 6
      Top = 51
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 6
      Top = 77
      Width = 63
      Height = 13
      Caption = 'Raz'#227'o Social'
    end
    object Label5: TLabel
      Left = 7
      Top = 101
      Width = 27
      Height = 13
      Caption = 'CNPJ'
    end
    object Label6: TLabel
      Left = 288
      Top = 27
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label7: TLabel
      Left = 344
      Top = 101
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object DBCODIGO_CREDOR: TDBEdit
      Left = 72
      Top = 24
      Width = 65
      Height = 21
      DataField = 'CODIGO_CREDOR'
      DataSource = dsCredor
      TabOrder = 0
    end
    object DBNOME_CREDOR: TDBEdit
      Left = 72
      Top = 48
      Width = 393
      Height = 21
      DataField = 'NOME_CREDOR'
      DataSource = dsCredor
      TabOrder = 1
    end
    object DBRAZAO_SOCIAL: TDBEdit
      Left = 72
      Top = 72
      Width = 393
      Height = 21
      DataField = 'RAZAO_SOCIAL'
      DataSource = dsCredor
      TabOrder = 2
    end
    object DBCNPJ_CPF: TDBEdit
      Left = 72
      Top = 96
      Width = 121
      Height = 21
      DataField = 'CNPJ_CPF'
      DataSource = dsCredor
      TabOrder = 3
      OnKeyPress = DBCNPJ_CPFKeyPress
    end
    object DBDATA_CADASTRO: TDBEdit
      Left = 376
      Top = 96
      Width = 89
      Height = 21
      DataField = 'DATA_CADASTRO'
      DataSource = dsCredor
      TabOrder = 4
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 131
      Width = 531
      Height = 251
      ActivePage = tsFinanceiro
      Align = alBottom
      TabOrder = 5
      object TabSheet1: TTabSheet
        Caption = 'Gerais'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label8: TLabel
          Left = 3
          Top = 18
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label9: TLabel
          Left = 7
          Top = 44
          Width = 37
          Height = 13
          Caption = 'Numero'
        end
        object Label10: TLabel
          Left = 125
          Top = 43
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label11: TLabel
          Left = 12
          Top = 67
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label12: TLabel
          Left = 9
          Top = 91
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label13: TLabel
          Left = 239
          Top = 92
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label14: TLabel
          Left = 374
          Top = 91
          Width = 14
          Height = 13
          Caption = 'UF'
        end
        object Label23: TLabel
          Left = 3
          Top = 137
          Width = 63
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object DBENDERECO: TDBEdit
          Left = 56
          Top = 16
          Width = 401
          Height = 21
          DataField = 'ENDERECO'
          DataSource = dsCredor
          TabOrder = 0
        end
        object DBNUMERO: TDBEdit
          Left = 56
          Top = 40
          Width = 65
          Height = 21
          DataField = 'NUMERO'
          DataSource = dsCredor
          TabOrder = 1
        end
        object DBCOMPLEMENTO: TDBEdit
          Left = 192
          Top = 40
          Width = 265
          Height = 21
          DataField = 'COMPLEMENTO'
          DataSource = dsCredor
          TabOrder = 2
        end
        object DBCIDADE: TDBEdit
          Left = 56
          Top = 88
          Width = 169
          Height = 21
          DataField = 'CIDADE'
          DataSource = dsCredor
          TabOrder = 3
        end
        object DBLookupEstado: TDBLookupComboBox
          Left = 392
          Top = 88
          Width = 65
          Height = 21
          DataField = 'ESTADO'
          DataSource = dsCredor
          KeyField = 'SIGLA'
          ListField = 'SIGLA'
          ListSource = dsEstado
          TabOrder = 4
        end
        object DBCEP: TDBEdit
          Left = 264
          Top = 88
          Width = 81
          Height = 21
          DataField = 'CEP'
          DataSource = dsCredor
          TabOrder = 5
        end
        object DBBAIRRO: TDBEdit
          Left = 56
          Top = 64
          Width = 401
          Height = 21
          DataField = 'BAIRRO'
          DataSource = dsCredor
          TabOrder = 6
        end
        object DBMemo1: TDBMemo
          Left = 0
          Top = 155
          Width = 523
          Height = 68
          Align = alBottom
          Color = 13565951
          DataField = 'OBSERVACAO'
          DataSource = dsCredor
          TabOrder = 7
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Contatos'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label20: TLabel
          Left = 8
          Top = 194
          Width = 18
          Height = 13
          Caption = 'Site'
        end
        object DBSITE: TDBEdit
          Left = 40
          Top = 192
          Width = 433
          Height = 21
          DataField = 'SITE'
          DataSource = dsCredor
          TabOrder = 0
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 8
          Width = 241
          Height = 81
          Caption = 'Contatos'
          TabOrder = 1
          object DBCONTATO01: TDBEdit
            Left = 8
            Top = 22
            Width = 225
            Height = 21
            DataField = 'CONTATO01'
            DataSource = dsCredor
            TabOrder = 0
          end
          object DBCONTATO02: TDBEdit
            Left = 8
            Top = 46
            Width = 225
            Height = 21
            DataField = 'CONTATO02'
            DataSource = dsCredor
            TabOrder = 1
          end
        end
        object GroupBox2: TGroupBox
          Left = 288
          Top = 8
          Width = 185
          Height = 101
          Caption = 'Telefones'
          TabOrder = 2
          object DBDDD1: TDBEdit
            Left = 8
            Top = 22
            Width = 41
            Height = 21
            DataField = 'DDD1'
            DataSource = dsCredor
            TabOrder = 0
          end
          object DBTELEFONE01: TDBEdit
            Left = 56
            Top = 46
            Width = 121
            Height = 21
            DataField = 'TELEFONE01'
            DataSource = dsCredor
            TabOrder = 1
          end
          object DBTELEFONE02: TDBEdit
            Left = 56
            Top = 22
            Width = 121
            Height = 21
            DataField = 'TELEFONE02'
            DataSource = dsCredor
            TabOrder = 2
          end
          object DBTELEFONE03: TDBEdit
            Left = 56
            Top = 70
            Width = 121
            Height = 21
            DataField = 'TELEFONE03'
            DataSource = dsCredor
            TabOrder = 3
          end
          object DBDDD2: TDBEdit
            Left = 8
            Top = 46
            Width = 41
            Height = 21
            DataField = 'DDD2'
            DataSource = dsCredor
            TabOrder = 4
          end
          object DBDDD3: TDBEdit
            Left = 8
            Top = 70
            Width = 41
            Height = 21
            DataField = 'DDD3'
            DataSource = dsCredor
            TabOrder = 5
          end
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 93
          Width = 241
          Height = 93
          Caption = 'E-Mail'
          TabOrder = 3
          object DBEMAIL01: TDBEdit
            Left = 10
            Top = 19
            Width = 223
            Height = 21
            DataField = 'EMAIL01'
            DataSource = dsCredor
            TabOrder = 0
          end
          object DBEMAIL02: TDBEdit
            Left = 10
            Top = 41
            Width = 223
            Height = 21
            DataField = 'EMAIL02'
            DataSource = dsCredor
            TabOrder = 1
          end
          object DBEMAIL03: TDBEdit
            Left = 10
            Top = 63
            Width = 223
            Height = 21
            DataField = 'EMAIL03'
            DataSource = dsCredor
            TabOrder = 2
          end
        end
      end
      object tsFinanceiro: TTabSheet
        Caption = 'Financeiro'
        ImageIndex = 2
        object gbFinanceiro: TGroupBox
          Left = 0
          Top = 0
          Width = 523
          Height = 223
          Align = alClient
          TabOrder = 0
          object Label15: TLabel
            Left = 64
            Top = 47
            Width = 37
            Height = 13
            Caption = '% Multa'
          end
          object Label16: TLabel
            Left = 66
            Top = 80
            Width = 41
            Height = 13
            Caption = '% Atraso'
          end
          object DBAPLICAR_DADOS_FINANCEIROS: TDBCheckBox
            Left = 9
            Top = 16
            Width = 249
            Height = 17
            Caption = 'Aplicar dados financeiros'
            DataField = 'APLICAR_DADOS_FINANCEIROS'
            DataSource = dsCredor
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBMULTA: TDBEdit
            Left = 8
            Top = 40
            Width = 49
            Height = 21
            DataField = 'MULTA'
            DataSource = dsCredor
            TabOrder = 1
          end
          object DBPERCENTUAL_ATRASO: TDBEdit
            Left = 8
            Top = 72
            Width = 49
            Height = 21
            DataField = 'PERCENTUAL_ATRASO'
            DataSource = dsCredor
            TabOrder = 2
          end
          object gbDesconto: TGroupBox
            Left = 8
            Top = 96
            Width = 185
            Height = 105
            Caption = 'Desconto'
            TabOrder = 3
            object Label17: TLabel
              Left = 8
              Top = 32
              Width = 33
              Height = 13
              Caption = 'Minimo'
            end
            object Label18: TLabel
              Left = 8
              Top = 72
              Width = 36
              Height = 13
              Caption = 'Maximo'
            end
            object DBDESCONTO_MINIMO: TDBEdit
              Left = 88
              Top = 28
              Width = 81
              Height = 21
              DataField = 'DESCONTO_MINIMO'
              DataSource = dsCredor
              TabOrder = 0
            end
            object DBDESCONTO_MAXIMO: TDBEdit
              Left = 87
              Top = 68
              Width = 82
              Height = 21
              DataField = 'DESCONTO_MAXIMO'
              DataSource = dsCredor
              TabOrder = 1
            end
          end
          object gbBoleto: TGroupBox
            Left = 192
            Top = 15
            Width = 329
            Height = 206
            Align = alRight
            Caption = 'Dados Boleto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object lblBanco: TLabel
              Left = 8
              Top = 56
              Width = 31
              Height = 13
              Caption = 'Banco'
            end
            object Label19: TLabel
              Left = 141
              Top = 56
              Width = 40
              Height = 13
              Caption = 'Cedente'
            end
            object Label21: TLabel
              Left = 8
              Top = 80
              Width = 36
              Height = 13
              Caption = 'Carteira'
            end
            object Label22: TLabel
              Left = 120
              Top = 82
              Width = 70
              Height = 13
              Caption = 'Nosso Numero'
            end
            object Label24: TLabel
              Left = 9
              Top = 108
              Width = 39
              Height = 13
              Caption = 'Agencia'
            end
            object Label25: TLabel
              Left = 7
              Top = 136
              Width = 71
              Height = 13
              Caption = 'Conta Corrente'
            end
            object Label26: TLabel
              Left = 184
              Top = 135
              Width = 27
              Height = 13
              Caption = 'Digito'
            end
            object Modalidade: TLabel
              Left = 8
              Top = 185
              Width = 55
              Height = 13
              Caption = 'Modalidade'
            end
            object Label27: TLabel
              Left = 139
              Top = 183
              Width = 45
              Height = 13
              Caption = 'Conv'#234'nio'
            end
            object DBBOLETOS: TDBNavigator
              Left = 144
              Top = 16
              Width = 168
              Height = 25
              DataSource = dsBoleto
              VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
              TabOrder = 0
            end
            object DBBANCO: TDBEdit
              Left = 57
              Top = 52
              Width = 52
              Height = 21
              DataField = 'BANCO'
              DataSource = dsBoleto
              TabOrder = 1
            end
            object DBCEDENTE: TDBEdit
              Left = 198
              Top = 50
              Width = 121
              Height = 21
              DataField = 'CEDENTE'
              DataSource = dsBoleto
              TabOrder = 2
            end
            object DBCARTEIRA: TDBEdit
              Left = 57
              Top = 77
              Width = 57
              Height = 21
              DataField = 'CARTEIRA'
              DataSource = dsBoleto
              TabOrder = 3
            end
            object DBNOSSO_NUMERO: TDBEdit
              Left = 199
              Top = 77
              Width = 121
              Height = 21
              DataField = 'NOSSO_NUMERO'
              DataSource = dsBoleto
              TabOrder = 4
            end
            object DBAGENCIA: TDBEdit
              Left = 57
              Top = 103
              Width = 48
              Height = 21
              DataField = 'AGENCIA'
              DataSource = dsBoleto
              TabOrder = 5
            end
            object DBCONTA_CORRENTE: TDBEdit
              Left = 88
              Top = 129
              Width = 83
              Height = 21
              DataField = 'CONTA_CORRENTE'
              DataSource = dsBoleto
              TabOrder = 6
            end
            object DBDIGITO: TDBEdit
              Left = 216
              Top = 128
              Width = 25
              Height = 21
              DataField = 'DIGITO'
              DataSource = dsBoleto
              TabOrder = 7
            end
            object DBMODALIDADE: TDBEdit
              Left = 67
              Top = 176
              Width = 63
              Height = 21
              DataField = 'MODALIDADE'
              DataSource = dsBoleto
              TabOrder = 8
            end
            object DBCONVENIO: TDBEdit
              Left = 192
              Top = 173
              Width = 121
              Height = 21
              DataField = 'CONVENIO'
              DataSource = dsBoleto
              TabOrder = 9
            end
          end
        end
      end
    end
    object DBLookupTipoPessoa: TDBLookupComboBox
      Left = 320
      Top = 24
      Width = 145
      Height = 21
      DataField = 'TIPO_CREDOR'
      DataSource = dsCredor
      KeyField = 'TIPO_PESSOA'
      ListField = 'DESCRICAO_TIPO_PESSOA'
      ListSource = dsTipoPessoa
      TabOrder = 6
    end
    object dbCheckUsaBoleto: TDBCheckBox
      Left = 368
      Top = 128
      Width = 97
      Height = 17
      Caption = 'Gerar Boletos'
      DataField = 'GERAR_BOLETOS'
      DataSource = dsCredor
      TabOrder = 7
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = dbCheckUsaBoletoClick
    end
  end
  object dsCredor: TDataSource
    Left = 304
    Top = 8
  end
  object dsBoleto: TDataSource
    OnStateChange = dsBoletoStateChange
    Left = 344
    Top = 8
  end
  object dsTipoPessoa: TDataSource
    Left = 384
    Top = 8
  end
  object dsEstado: TDataSource
    Left = 432
    Top = 8
  end
end
