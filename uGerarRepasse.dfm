object frmGerarRepasse: TfrmGerarRepasse
  Left = 478
  Top = 248
  Width = 396
  Height = 344
  Caption = 'Gera'#231#227'o Repasse'
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
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 388
    Height = 41
    Align = alTop
    Color = clWhite
    TabOrder = 0
    object lblGeracaoRepasse: TLabel
      Left = 8
      Top = 8
      Width = 162
      Height = 23
      Caption = 'Gera'#231#227'o Repasse'
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
    Width = 388
    Height = 219
    Align = alClient
    TabOrder = 1
    object gbTela: TGroupBox
      Left = 1
      Top = 1
      Width = 386
      Height = 217
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 51
        Height = 18
        Caption = 'Credor'
      end
      object Label2: TLabel
        Left = 8
        Top = 83
        Width = 35
        Height = 18
        Caption = 'Data'
      end
      object sbBusca: TSpeedButton
        Left = 347
        Top = 42
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          1E070000424D1E07000000000000360000002800000022000000110000000100
          180000000000E8060000C40E0000C40E00000000000000000000C2C8CBBFC5C8
          A6ABAEA1A5A8B7BDC0C2C8CBC2C8CBC2C8CBC2C8CBC2C8CBC2C8CBC2C8CBC2C8
          CBC2C8CBC2C8CBC2C8CBC2C8CBDADDDFD8DCDDCBCDCFC8CACCD4D7D9DADDDFDA
          DDDFDADDDFDADDDFDADDDFDADDDFDADDDFDADDDFDADDDFDADDDFDADDDFDADDDF
          0000C0C6C98D8F905860644C5359838789B7BDC0C0C6C9C0C6C9C0C6C9C0C6C9
          C0C6C9C0C6C9C0C6C9C0C6C9C0C6C9C0C6C9C0C6C9D9DCDEBEC0C0ABADAFA7AA
          ABBABCBDD4D7D9D9DCDED9DCDED9DCDED9DCDED9DCDED9DCDED9DCDED9DCDED9
          DCDED9DCDED9DCDE0000BFC4C786909D3180B9256188434B50828587B5B9BCBF
          C4C7BFC4C7BFC4C7BFC4C7BFC4C7BFC4C7BFC4C7BFC4C7BFC4C7BFC4C7D8DBDD
          BCC0C7A2B9D5A0ADBCA5A7A9BABBBCD3D5D6D8DBDDD8DBDDD8DBDDD8DBDDD8DB
          DDD8DBDDD8DBDDD8DBDDD8DBDDD8DBDD0000BEC2C583C4E12C94ED1976BB2862
          8844494F7F8284B3B7B9BEC2C5BEC2C5BEC2C5BEC2C5BEC2C5BEC2C5BEC2C5BE
          C2C5BEC2C5D7DADCBADBECA1C2F4A0B5D6A0AEBCA6A7A8B8BABBD2D4D5D7DADC
          D7DADCD7DADCD7DADCD7DADCD7DADCD7DADCD7DADCD7DADC0000BCC1C3B3C5C9
          79C9EC2F93EA1978BD286288414850828687BABFC1BCC1C3BCC1C3BCC1C3BCC1
          C3BCC1C3BCC1C3BCC1C3BCC1C3D6D9DAD2DCDEB6DEF3A1C2F2A0B6D7A0AEBCA5
          A7A9BABCBCD5D8D9D6D9DAD6D9DAD6D9DAD6D9DAD6D9DAD6D9DAD6D9DAD6D9DA
          0000BBBFC1BBBFC1B3C3C777C8EC3195EA1776BE2B658B575A5CA1A4A6A1A5A7
          929597929597A2A6A7B6BABCBBBFC1BBBFC1BBBFC1D6D8D9D6D8D9D2DADDB6DD
          F3A2C2F29FB5D7A1AFBEAAABACC8CACBC8CACBC1C2C3C1C2C3C9CBCBD3D5D6D6
          D8D9D6D8D9D6D8D90000B9BDBFB9BDBFB9BDBFB0C2C66FC5EF2A8EE55C84A059
          5856605859766565776664615453565354818485AEB2B4B9BDBFB9BDBFD5D7D8
          D5D7D8D5D7D8D0DADCB2DCF5A1BFEEACBBC8ABABAAADABABB5AFAFB6AFAFADAA
          AAAAAAAABABBBBCFD1D2D5D7D8D5D7D80000B8BBBDB8BBBDB8BBBDB8BBBDAFC3
          C8A6CDDDB8B1B1AB938FD5BCA6F5E7D2FFFBF5F5ECEBAB95944D44447E8081B1
          B4B6B8BBBDD4D6D7D4D6D7D4D6D7D4D6D7CFDADDCBE0E9D4D1D1CDC2C0E5D6CB
          F9F0E3FFFCF9F9F3F2CDC2C2A7A6A6B8B9BAD1D2D3D4D6D70000B7B9BBB7B9BB
          B7B9BBB7B9BBB7B9BBB7B9BBBEA9A6E2CCAEEBD8ABF2E7CFFDFBF8FFFFFFFFFF
          FFB39B95534F519C9EA0B7B9BBD4D5D6D4D5D6D4D5D6D4D5D6D4D5D6D4D5D6D7
          CCCBEDE0CFF2E7CDF7F0E1FEFCFBFFFFFFFFFFFFD2C5C2AAA8A9C6C7C8D4D5D6
          0000B5B7B9B5B7B9B5B7B9B5B7B9B5B7B99F9EA0C9ADA0E7D19AE0C896ECDFC1
          F6EFE1FBF7F1F9F3E7F4E4CD6355538E9091B5B7B9D3D4D5D3D4D5D3D4D5D3D4
          D5D3D4D5C7C7C8DECEC8F0E3C5EBDDC3F3EBD9F9F5ECFCFAF6FBF7F0F8EEE0AE
          AAAABFC0C1D3D4D50000B4B5B7B4B5B7B4B5B7B4B5B7B4B5B7A69A9AE2CEB5DA
          BC78DABE83E4D0A6ECDDBEEFE2C9EDDEC1F3E1B97D6F67898A8BB4B5B7D2D3D4
          D2D3D4D2D3D4D2D3D4D2D3D4CBC5C5EDE1D3E8D6B6E8D7BAEEE2CBF3E9D7F5ED
          DEF4EAD9F7ECD5B8B2AFBDBDBED2D3D40000B2B4B5B2B4B5B2B4B5B2B4B5B2B4
          B5A79999E3D2B8D6B66DD6B775E1CA98E1CB9EE4D0A5E1CB9AEED8A784766F8D
          8F8FB2B4B5D1D2D3D1D2D3D1D2D3D1D2D3D1D2D3CBC4C4EDE3D4E5D3B2E5D4B4
          ECDFC4ECDFC7EEE2CAECDFC5F4E7CBBBB5B2BEC0C0D1D2D30000B1B2B3B1B2B3
          B1B2B3B1B2B3B1B2B3AAA2A2D0B8A0ECDDB1E8D7B3E8D6B0E0CA98D5B676D5B5
          6FEFDAB37767659D9E9FB1B2B3D1D1D2D1D1D2D1D1D2D1D1D2D1D1D2CDC9C9E2
          D4C8F3E9D1F0E6D2F0E5D0EBDFC4E5D3B5E5D3B2F5E8D2B6AFAFC7C7C7D1D1D2
          0000B0B0B1B0B0B1B0B0B1B0B0B1B0B0B1AFAEAFA98D84F4EAD0FFFFFFF5EEDE
          DEC791D0AB5BECD9A5D4B9A67B7475ADADAEB0B0B1D0D0D1D0D0D1D0D0D1D0D0
          D1D0D0D1CFCFCFCCBEBBF8F2E2FFFFFFF9F4EAEADDC1E2CDABF3E7CAE4D5CBB7
          B4B4CECECFD0D0D10000AEAEAFAEAEAFAEAEAFAEAEAFAEAEAFAEAEAFA9A2A3B2
          9487EDE3D3FAF6E3EEE1B9ECDCB3D3B9A6807371A8A8A9AEAEAFAEAEAFCFCFCF
          CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCCC9C9D1C2BCF4EDE4FCF9EDF4ECD5F3E9
          D2E4D5CBB9B4B3CCCCCCCFCFCFCFCFCF0000ADACADADACADADACADADACADADAC
          ADADACADADACADAAA5A6A48E8BB09182B89887A58A84908787ACABACADACADAD
          ACADADACADCECECECECECECECECECECECECECECECECECECECECECDCACBCABFBE
          D0C1BAD4C4BCCABDBBC0BCBCCECDCECECECECECECECECECE0000ABAAABABAAAB
          ABAAABABAAABABAAABABAAABABAAABABAAABABAAABABAAABABAAABABAAABABAA
          ABABAAABABAAABABAAABABAAABCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
          CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
          0000}
        NumGlyphs = 2
        OnClick = sbBuscaClick
      end
      object lblNumeroRepasse: TLabel
        Left = 8
        Top = 176
        Width = 161
        Height = 18
        Caption = 'Numero do Repasse : '
      end
      object Label3: TLabel
        Left = 8
        Top = 115
        Width = 74
        Height = 18
        Caption = 'Descri'#231#227'o'
      end
      object edCodigoCredor: TEdit
        Left = 8
        Top = 40
        Width = 65
        Height = 26
        TabOrder = 0
      end
      object edNomeCredor: TEdit
        Left = 76
        Top = 40
        Width = 265
        Height = 26
        TabOrder = 1
      end
      object dtDataRepasse: TDateTimePicker
        Left = 76
        Top = 78
        Width = 186
        Height = 26
        Date = 39739.890388993060000000
        Time = 39739.890388993060000000
        TabOrder = 2
      end
      object edDescricao: TEdit
        Left = 8
        Top = 138
        Width = 361
        Height = 26
        TabOrder = 3
      end
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 260
    Width = 388
    Height = 50
    Align = alBottom
    Color = clWhite
    TabOrder = 2
    DesignSize = (
      388
      50)
    object btnSair: TBitBtn
      Left = 269
      Top = 8
      Width = 115
      Height = 34
      Cursor = crHandPoint
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
    object btnGrava: TBitBtn
      Left = 151
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
