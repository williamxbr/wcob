object frmGerarAcordo: TfrmGerarAcordo
  Left = 706
  Top = 129
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Gera'#231#227'o Acordo'
  ClientHeight = 507
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 41
    Align = alTop
    Color = clWhite
    TabOrder = 0
    object lblGeracaoAcordo: TLabel
      Left = 8
      Top = 8
      Width = 150
      Height = 23
      Caption = 'Gera'#231#227'o Acordo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnTela: TPanel
    Left = 0
    Top = 41
    Width = 320
    Height = 416
    Align = alClient
    TabOrder = 1
    object gbTela: TGroupBox
      Left = 1
      Top = 1
      Width = 318
      Height = 414
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblCredor: TLabel
        Left = 8
        Top = 83
        Width = 297
        Height = 21
        AutoSize = False
        Caption = 'Credor :'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblDataInicial: TLabel
        Left = 54
        Top = 311
        Width = 97
        Height = 18
        Alignment = taRightJustify
        Caption = 'Data Entrada'
      end
      object lblNumeroAcordo: TLabel
        Left = 12
        Top = 288
        Width = 4
        Height = 18
      end
      object lblCobranca: TLabel
        Left = 131
        Top = 24
        Width = 70
        Height = 18
        Caption = 'Cobran'#231'a'
      end
      object lblDevedor: TLabel
        Left = 8
        Top = 56
        Width = 297
        Height = 21
        AutoSize = False
        Caption = 'Devedor :'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblValor: TLabel
        Left = 111
        Top = 216
        Width = 40
        Height = 18
        Alignment = taRightJustify
        Caption = 'Valor'
      end
      object lblEntrada: TLabel
        Left = 93
        Top = 278
        Width = 58
        Height = 18
        Alignment = taRightJustify
        Caption = 'Entrada'
      end
      object lblPeriodo: TLabel
        Left = 93
        Top = 377
        Width = 58
        Height = 18
        Alignment = taRightJustify
        Caption = 'Periodo'
      end
      object lblParcelas: TLabel
        Left = 86
        Top = 340
        Width = 65
        Height = 18
        Alignment = taRightJustify
        Caption = 'Parcelas'
      end
      object lblxValorOriginal: TLabel
        Left = 52
        Top = 117
        Width = 118
        Height = 18
        Alignment = taRightJustify
        Caption = 'Valor Original : '
      end
      object Label1: TLabel
        Left = 60
        Top = 247
        Width = 91
        Height = 18
        Alignment = taRightJustify
        Caption = 'Data Acordo'
      end
      object lblxValorCorrigido: TLabel
        Left = 43
        Top = 141
        Width = 127
        Height = 18
        Alignment = taRightJustify
        Caption = 'Valor Corrigido : '
        Layout = tlCenter
      end
      object lblValorOriginal: TLabel
        Left = 175
        Top = 112
        Width = 129
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdLeftToRight
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblValorCorrigido: TLabel
        Left = 175
        Top = 139
        Width = 129
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object dtDataInicial: TDateTimePicker
        Left = 158
        Top = 306
        Width = 149
        Height = 24
        Date = 39739.000000000000000000
        Time = 39739.000000000000000000
        TabOrder = 2
      end
      object edValor: TEdit
        Left = 158
        Top = 212
        Width = 145
        Height = 26
        TabOrder = 0
      end
      object edEntrada: TEdit
        Left = 158
        Top = 274
        Width = 149
        Height = 26
        TabOrder = 1
      end
      object edPeriodo: TEdit
        Left = 158
        Top = 372
        Width = 53
        Height = 26
        TabOrder = 4
      end
      object edParcelas: TEdit
        Left = 158
        Top = 340
        Width = 147
        Height = 26
        TabOrder = 3
      end
      object dtDataAcordo: TDateTimePicker
        Left = 158
        Top = 243
        Width = 149
        Height = 24
        Date = 39739.000000000000000000
        Time = 39739.000000000000000000
        TabOrder = 5
      end
      object rgUtilizarValor: TRadioGroup
        Left = 6
        Top = 165
        Width = 300
        Height = 42
        Caption = 'Utilizar Valores'
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Original'
          'Corrigido')
        ParentFont = False
        TabOrder = 6
      end
      object stCobranca: TStaticText
        Left = 216
        Top = 21
        Width = 89
        Height = 22
        Align = alCustom
        Alignment = taRightJustify
        AutoSize = False
        BevelOuter = bvRaised
        BiDiMode = bdLeftToRight
        BorderStyle = sbsSingle
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        TabOrder = 7
        Transparent = False
      end
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 457
    Width = 320
    Height = 50
    Align = alBottom
    Color = clWhite
    TabOrder = 2
    DesignSize = (
      320
      50)
    object btnCancelar: TBitBtn
      Left = 201
      Top = 8
      Width = 115
      Height = 34
      Cursor = crHandPoint
      Hint = 'Sai da tela'
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnCancelarClick
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
    object btnGrava: TBitBtn
      Left = 83
      Top = 8
      Width = 115
      Height = 34
      Cursor = crHandPoint
      Hint = 'Grava a nota fiscal'
      Anchors = [akRight, akBottom]
      Caption = '&Gravar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnGravaClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222220000000000000220330000008803022033000000880302203300000088
        0302203300000000030220333333333333022033000000003302203088888888
        0302203088888888030220308888888803022030888888880302203088888888
        0002203088888888080220000000000000022222222222222222}
    end
  end
end
