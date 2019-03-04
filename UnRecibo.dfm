object FrmRecibo: TFrmRecibo
  Left = 289
  Top = 82
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '[SisRecibo]'
  ClientHeight = 533
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 554
    Height = 41
    Align = alTop
    Caption = 'Impress'#227'o de Recibo'
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 41
    Width = 554
    Height = 492
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 15
      Top = 1
      Width = 521
      Height = 42
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 13
        Width = 106
        Height = 20
        Caption = 'N'#186' do Recibo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 309
        Top = 14
        Width = 71
        Height = 20
        Caption = 'Valor R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 120
        Top = 10
        Width = 104
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = Edit1Exit
      end
      object Edit2: TEdit
        Left = 387
        Top = 10
        Width = 121
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnExit = Edit2Exit
      end
    end
    object GroupBox2: TGroupBox
      Left = 15
      Top = 43
      Width = 521
      Height = 197
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Label3: TLabel
        Left = 10
        Top = 12
        Width = 80
        Height = 13
        Caption = 'Recebi(emos) de'
      end
      object Label4: TLabel
        Left = 10
        Top = 87
        Width = 71
        Height = 13
        Caption = 'Cidade/Estado'
      end
      object Label5: TLabel
        Left = 10
        Top = 125
        Width = 47
        Height = 13
        Caption = 'Referente'
      end
      object Label7: TLabel
        Left = 10
        Top = 50
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Edit3: TEdit
        Left = 8
        Top = 28
        Width = 504
        Height = 19
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 8
        Top = 66
        Width = 504
        Height = 19
        MaxLength = 60
        TabOrder = 1
      end
      object Edit5: TEdit
        Left = 8
        Top = 103
        Width = 504
        Height = 19
        MaxLength = 60
        TabOrder = 2
      end
      object Memo1: TMemo
        Left = 8
        Top = 141
        Width = 505
        Height = 49
        TabOrder = 3
      end
    end
    object GroupBox3: TGroupBox
      Left = 15
      Top = 289
      Width = 521
      Height = 177
      Caption = ' Remetente '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      object Label6: TLabel
        Left = 10
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label8: TLabel
        Left = 10
        Top = 53
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label9: TLabel
        Left = 10
        Top = 92
        Width = 71
        Height = 13
        Caption = 'Cidade/Estado'
      end
      object Label10: TLabel
        Left = 11
        Top = 130
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label11: TLabel
        Left = 95
        Top = 130
        Width = 73
        Height = 13
        Caption = 'CNPJ/CPF/RG'
      end
      object Edit7: TEdit
        Left = 8
        Top = 32
        Width = 504
        Height = 19
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 0
      end
      object Edit8: TEdit
        Left = 8
        Top = 70
        Width = 504
        Height = 19
        MaxLength = 60
        TabOrder = 1
      end
      object Edit9: TEdit
        Left = 8
        Top = 108
        Width = 504
        Height = 19
        MaxLength = 60
        TabOrder = 2
      end
      object BitBtn2: TBitBtn
        Left = 434
        Top = 141
        Width = 75
        Height = 25
        Caption = '&Limpar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = BitBtn2Click
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888800000000000888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFF
          F0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFF
          F0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F08888880FFFFFF00
          888888800000000888888888888888888888}
      end
      object Edit10: TEdit
        Left = 93
        Top = 146
        Width = 110
        Height = 19
        MaxLength = 18
        TabOrder = 4
      end
      object BitBtn3: TBitBtn
        Left = 358
        Top = 141
        Width = 75
        Height = 25
        Caption = '&Imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = BitBtn3Click
        Glyph.Data = {
          EE030000424DEE03000000000000360000002800000012000000110000000100
          180000000000B8030000C30E0000C30E00000000000000000000BFBFBF000000
          000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBF000000000000000000BFBFBF00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
          0000000000FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000FFFFFF
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C00000FF0000FFC0C0C0C0C0C00000000000000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000080808000000000000080808080808080808080808080
          8080808080808080808080808080808080808080808080000000000000808080
          0000BFBFBFBFBFBF000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000BFBFBFBFBFBF0000BFBFBFBFBFBF
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBF000000FFFF
          FF000000000000000000000000000000000000000000000000FFFFFF000000BF
          BFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF
          0000BFBFBFBFBFBFBFBFBF000000FFFFFF000000000000000000000000000000
          000000000000000000FFFFFF000000BFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
          BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000BFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBF000000FFFF
          FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BF
          BFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF
          0000BFBFBFBFBFBFBFBFBF000000000000000000000000000000000000000000
          000000000000000000000000000000BFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000}
      end
      object MaskEdit1: TMaskEdit
        Left = 10
        Top = 146
        Width = 71
        Height = 19
        EditMask = '##/##/####;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
        OnExit = MaskEdit1Exit
      end
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 469
      Width = 550
      Height = 19
      Panels = <
        item
          Text = 'Prefeitura Municipal de Lupion'#243'polis-Pr / Setor de Inform'#225'tica'
          Width = 50
        end>
      SimplePanel = False
    end
    object GroupBox4: TGroupBox
      Left = 16
      Top = 243
      Width = 521
      Height = 45
      Caption = ' Pag. c/ Cheque '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      object Label12: TLabel
        Left = 16
        Top = 18
        Width = 52
        Height = 13
        Caption = 'Ag'#234'ncia n'#176
      end
      object Label13: TLabel
        Left = 188
        Top = 19
        Width = 84
        Height = 13
        Caption = 'Conta Corrente n'#176
      end
      object Label14: TLabel
        Left = 384
        Top = 20
        Width = 50
        Height = 13
        Caption = 'Cheque n'#176
      end
      object Edit6: TEdit
        Left = 74
        Top = 16
        Width = 68
        Height = 19
        TabOrder = 0
      end
      object Edit11: TEdit
        Left = 278
        Top = 16
        Width = 57
        Height = 19
        TabOrder = 1
      end
      object Edit12: TEdit
        Left = 440
        Top = 17
        Width = 68
        Height = 19
        TabOrder = 2
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = CDS
    Left = 55
    Top = 9
  end
  object CDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 23
    Top = 4
    Data = {
      E70100009619E0BD010000001800000010000000000003000000E701084E5F52
      454349424F04000100000000000556414C4F5201004900000001000557494454
      4802000200140006524543454245010049000000010005574944544802000200
      640008454E44455245434F010049000000010005574944544802000200640006
      4349444144450100490000000100055749445448020002006400095245464552
      454E544504004B0000000200075355425459504502004900070042696E617279
      00055749445448020002002C01084E4F4D455F52454D01004900000001000557
      494454480200020064000C454E44455245434F5F52454D010049000000010005
      57494454480200020064000A4349444144455F52454D01004900000001000557
      494454480200020064000444415441040006000000000007444F435F52454D01
      004900000001000557494454480200020064000A44545F455854454E534F0100
      4900000001000557494454480200020064000B564C525F455854454E534F0100
      490000000100055749445448020002006400094E5F4147454E43494101004900
      00000100055749445448020002000F00074E5F434F4E54410100490000000100
      055749445448020002000F00084E5F4348455155450100490000000100055749
      4454480200020006000000}
    object CDSN_RECIBO: TIntegerField
      FieldName = 'N_RECIBO'
    end
    object CDSVALOR: TStringField
      FieldName = 'VALOR'
    end
    object CDSRECEBE: TStringField
      FieldName = 'RECEBE'
      Size = 100
    end
    object CDSENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object CDSCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object CDSREFERENTE: TBlobField
      FieldName = 'REFERENTE'
      Size = 300
    end
    object CDSNOME_REM: TStringField
      FieldName = 'NOME_REM'
      Size = 100
    end
    object CDSENDERECO_REM: TStringField
      FieldName = 'ENDERECO_REM'
      Size = 100
    end
    object CDSCIDADE_REM: TStringField
      FieldName = 'CIDADE_REM'
      Size = 100
    end
    object CDSDATA: TDateField
      FieldName = 'DATA'
    end
    object CDSDOC_REM: TStringField
      FieldName = 'DOC_REM'
      Size = 100
    end
    object CDSDT_EXTENSO: TStringField
      FieldName = 'DT_EXTENSO'
      Size = 100
    end
    object CDSVLR_EXTENSO: TStringField
      FieldName = 'VLR_EXTENSO'
      Size = 100
    end
    object CDSN_AGENCIA: TStringField
      DisplayWidth = 15
      FieldName = 'N_AGENCIA'
      Size = 15
    end
    object CDSN_CONTA: TStringField
      DisplayWidth = 15
      FieldName = 'N_CONTA'
      Size = 15
    end
    object CDSN_CHEQUE: TStringField
      DisplayWidth = 6
      FieldName = 'N_CHEQUE'
      Size = 6
    end
  end
end
