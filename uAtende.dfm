object frmAtende: TfrmAtende
  Left = 93
  Top = 68
  Caption = 'Chamado'
  ClientHeight = 616
  ClientWidth = 1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1078
    Height = 33
    Align = alTop
    Color = clWhite
    TabOrder = 0
    DesignSize = (
      1078
      33)
    object Label7: TLabel
      Left = 11
      Top = 6
      Width = 168
      Height = 18
      Caption = 'Atendimento Cobran'#231'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 1075
      Top = 8
      Width = 4
      Height = 18
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 576
    Width = 1078
    Height = 40
    Align = alBottom
    Color = clWhite
    TabOrder = 1
    object sbtnBuscaDevedor: TSpeedButton
      Left = 379
      Top = 5
      Width = 120
      Height = 30
      Caption = 'Devedor'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000EAE6D3EAE6D3
        EAE6D3EAE6D3EAE6D3BAB7A888867B88867B88867B88867B88867B88867B8886
        7B88867B88867B88867B88867B88867B88867BB0AD9FEAE6D3EAE6D3EAE6D3EA
        E6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3AB6767E5C7C5E5C7C5E5C7C5E5C7C5
        E5C7C5AB6767E5C7C5E5C7C5E5C7C5E5C7C5E5C7C5E5C7C5AB67679B998DEAE6
        D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3984848FFEAE5FF
        EAE5FFEAE5FFEAE5AB6665984848984848FFEAE5FFEAE5FFEAE5FFEAE5FFEAE5
        AB6565ACA99BEAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6
        D3984848FFDFD9FFE1DAFFE5DFFFE5DF984848984848984848FFDFD9FFDFD9FF
        DFD9FFDFD9FFDFD9984848C4C1B1EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3
        EAE6D3EAE6D3EAE6D3AD736EFFD5CDFFEBE7FFEBE7FFEBE7AB66659848489848
        48FFD5CDFFD5CDFFD5CDFFD5CDFFD5CD92514FD9D5C4EAE6D3EAE6D3EAE6D3EA
        E6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3E3DAC8CB8883FFF1EEFFF1EEFFF1EE
        DEBAB8984848984848FFD0C6FFCBC0FFCBC0FFCBC0D899929A8F83E8E5D2EAE6
        D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3984848FF
        D9D1FFF7F6FFF7F6FFF7F6984848C59292FFF7F5FFF7F5FFF7F5FFDED8984848
        CFCDBBEAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6
        D3EAE6D3E3DAC8B16764FFFAF9FFFEFEFFFDFD984848ECDAD9FFFDFDFFFDFDFF
        FDFDBE7772A7968AE7E4D1EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3
        EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3BB8D85DB9A93FFFCFAFFFFFFA66060FFFF
        FFFFFFFFFFFFFFDB9A939F6C67E4E1CEEAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EA
        E6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3CDADA2B97B7A
        FFCEC4B47878DAB8B7FFD1C7BE807EB29088E5E2CFEAE6D3EAE6D3EAE6D3EAE6
        D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EA
        E6D3E8E5D2D3D0BFB39791B88C8ABD8E8EA48782B3B1A2DBD9C6EAE6D3EAE6D3
        EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6
        D3EAE6D3EAE6D3E4E1CE929E9D0055AF2172BF4991D24990D00E5CAC094F977F
        7E73C1BFAFE7E4D1EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3
        EAE6D3EAE6D3EAE6D3EAE6D3E6E3D03678AE398DD795D0FF95D0FF95D0FF95D0
        FF95D0FF95D0FF0653A5596871C1BFAFEAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EA
        E6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D381A5B94DA1E786C8FF86C8FF
        86C8FF86C8FF86C8FF86C8FF86C8FF86C8FF0552A5807E73DCDAC7EAE6D3EAE6
        D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3DBD8C60067CA77
        C0FF77C0FF77C0FF77C0FF77C0FF77C0FF77C0FF77C0FF77C0FF77C0FF105194
        BFBDAEEAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6
        D31E3B5E093772153D77336BAD62B0FF62B0FF62B0FF62B0FF62B0FF62B0FF62
        B0FF62B0FF004BA0A9A799EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3
        EAE6D3EAE6D3EAE6D30D47831761A2145FA01761A2062F680014464992E655A5
        FF55A5FF55A5FF55A5FF55A5FF1162B8A8A698EAE6D3EAE6D3EAE6D3EAE6D3EA
        E6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D30542800C5C940C5C940C5C940C5C94
        0D599401245C11327155A5FF55A5FF55A5FF55A5FF004DA3BCB9A9EAE6D3EAE6
        D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D300336A367CA936
        7CA9367CA9367CA9367CA9367CA90C4F8A0014481C428655A5FF55A5FF0B569F
        D7D3C1EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6
        D3002A585590B8639BBE639BBE639BBE639BBE639BBE639BBE639BBE296EA200
        1C54000D41323B53C5C3B2EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3
        EAE6D3EAE6D3EAE6D396A6A905417993BAD293BAD293BAD293BAD293BAD293BA
        D293BAD293BAD288B2CE0045861C2A51DFDCCAEAE6D3EAE6D3EAE6D3EAE6D3EA
        E6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3214B6D3D739EC1D8E5C1D8E5
        C1D8E5C1D8E5C1D8E5C1D8E5C1D8E5004586001043D4D1C0EAE6D3EAE6D3EAE6
        D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D359
        778A002D5EB9D1E2ECF3F7ECF3F7ECF3F7689ABF002962102551DDDAC8EAE6D3
        EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6
        D3EAE6D3EAE6D3EAE6D3EAE6D3587588002555002353002050435A76DDDAC8EA
        E6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3EAE6D3}
      OnClick = sbtnBuscaDevedorClick
    end
    object btnSair: TBitBtn
      Left = 757
      Top = 5
      Width = 120
      Height = 30
      Cursor = crArrow
      Hint = 'Sai da tela'
      BiDiMode = bdLeftToRight
      Caption = '&Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
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
    object btnProgramar: TBitBtn
      Left = 5
      Top = 5
      Width = 120
      Height = 30
      Cursor = crHandPoint
      Caption = 'Reprogramar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnProgramarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnGerarPromessa: TBitBtn
      Left = 129
      Top = 5
      Width = 120
      Height = 30
      Cursor = crHandPoint
      Hint = 'Carrega Dados'
      Caption = '&Gerar Promessa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnGerarPromessaClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333000030000000000000333333000030788888888880333333000030F7
        7777777780333333000030F99777777780333333000030FFFFFFFFFF70333333
        0000300000000000003333330000333333333333333333330000333003333333
        3333333300003330033333333333333300003330033333300000000300003330
        03303330FFFFFF030000333008300330F4444F030000333800000030FFFFFF03
        0000333380000030F4444F030000333333300330FFFFFF030000333333303330
        F44F00030000333333333330FFFF003300003333333333300000033300003333
        33333333333333330000}
    end
    object btnGerarAcordo: TBitBtn
      Left = 255
      Top = 5
      Width = 120
      Height = 30
      Caption = 'Gerar Acordo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
    end
    object btnDesconfirma: TBitBtn
      Left = 506
      Top = 5
      Width = 120
      Height = 30
      Cursor = crHandPoint
      Hint = 'Fechar Chamado'
      Caption = 'Finalizar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnDesconfirmaClick
      Glyph.Data = {
        3E020000424D3E0200000000000036000000280000000D0000000D0000000100
        18000000000008020000C40E0000C40E00000000000000000000BFBFBF000000
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
        0000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF00000000000000000000000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBF000000BFBFBF00BFBFBF000000000000000000BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBF00BFBFBFBFBFBF
        000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF000000000000BFBFBFBFBF
        BF00BFBFBFBFBFBFBFBFBF000000000000000000BFBFBFBFBFBF000000000000
        BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBF00000000000000000000
        0000000000BFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF
        BFBFBFBFBFBF000000000000000000000000000000BFBFBFBFBFBFBFBFBFBFBF
        BF00BFBFBFBFBFBFBFBFBF000000000000000000BFBFBFBFBFBF000000000000
        BFBFBFBFBFBFBFBFBF00BFBFBF000000000000000000000000BFBFBFBFBFBFBF
        BFBFBFBFBF000000000000BFBFBFBFBFBF00000000000000000000000000BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000BFBFBF00000000000000
        000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
        0000}
    end
    object btnAcionamento: TBitBtn
      Left = 632
      Top = 5
      Width = 120
      Height = 30
      Caption = 'Acionamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnAcionamentoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
        FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
        FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
        FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C880733777777777733700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object pnTela: TPanel
    Left = 0
    Top = 33
    Width = 1078
    Height = 543
    Align = alClient
    TabOrder = 2
    object gbCobranca: TGroupBox
      Left = 1
      Top = 1
      Width = 1076
      Height = 112
      Align = alTop
      Caption = 'Dados Cobran'#231'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 111
        Top = 20
        Width = 38
        Height = 13
        Caption = 'Credor'
      end
      object Label2: TLabel
        Left = 8
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Cobran'#231'a'
      end
      object Label3: TLabel
        Left = 584
        Top = 22
        Width = 27
        Height = 13
        Caption = 'Data'
      end
      object Label5: TLabel
        Left = 9
        Top = 63
        Width = 29
        Height = 13
        Caption = 'Valor'
      end
      object Label8: TLabel
        Left = 154
        Top = 62
        Width = 83
        Height = 13
        Caption = 'Valor Corrigido'
      end
      object Label9: TLabel
        Left = 711
        Top = 21
        Width = 49
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object stCobranca: TStaticText
        Left = 6
        Top = 37
        Width = 91
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object stCredor: TStaticText
        Left = 110
        Top = 37
        Width = 459
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object stDataCadastro: TStaticText
        Left = 582
        Top = 37
        Width = 115
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object stValorDivida: TStaticText
        Left = 8
        Top = 77
        Width = 105
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object stValorCorrigido: TStaticText
        Left = 120
        Top = 77
        Width = 121
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object stSituacao: TStaticText
        Left = 710
        Top = 37
        Width = 179
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object dtDataInicial: TDateTimePicker
        Left = 367
        Top = 76
        Width = 107
        Height = 21
        Date = 39942.609361979160000000
        Time = 39942.609361979160000000
        TabOrder = 6
      end
      object bbAjustarProdDep: TBitBtn
        Left = 263
        Top = 75
        Width = 90
        Height = 24
        Hint = 'Novo Status ---> AJUSTADO'
        Caption = 'Aj&ustar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = bbAjustarProdDepClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
      end
    end
    object gbDevedor: TGroupBox
      Left = 1
      Top = 185
      Width = 1076
      Height = 357
      Align = alClient
      TabOrder = 1
      object Splitter6: TSplitter
        Left = 2
        Top = 355
        Width = 1072
        Height = 0
        Cursor = crVSplit
        Align = alBottom
        Color = clGray
        ParentColor = False
        ExplicitTop = 360
        ExplicitWidth = 1080
      end
      object Panel6: TPanel
        Left = 2
        Top = 15
        Width = 1072
        Height = 340
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object pcItens: TPageControl
          Left = 1
          Top = 1
          Width = 1070
          Height = 338
          ActivePage = tsAcionamentos
          Align = alClient
          TabOrder = 0
          object tsItensCobranca: TTabSheet
            Caption = 'Itens Cobran'#231'a'
            object lstItensCobranca: TListView
              Left = 0
              Top = 0
              Width = 1062
              Height = 310
              Align = alClient
              Columns = <
                item
                  Caption = 'Item'
                  MaxWidth = 35
                  MinWidth = 35
                  Width = 35
                end
                item
                  Caption = 'Documento'
                  MaxWidth = 150
                  MinWidth = 46
                  Width = 120
                end
                item
                  Alignment = taCenter
                  Caption = 'Vencimento'
                  MaxWidth = 70
                  MinWidth = 70
                  Width = 70
                end
                item
                  Alignment = taRightJustify
                  Caption = 'Valor'
                  MaxWidth = 80
                  MinWidth = 60
                  Width = 70
                end
                item
                  Alignment = taRightJustify
                  Caption = 'Valor Corrigido'
                end>
              GridLines = True
              RowSelect = True
              TabOrder = 0
              ViewStyle = vsReport
            end
          end
          object tsItensAcordo: TTabSheet
            Caption = 'Itens Acordo'
            ImageIndex = 1
            object lstItensAcordo: TListView
              Left = 0
              Top = 0
              Width = 1062
              Height = 310
              Align = alClient
              Columns = <
                item
                  Caption = 'Parcela'
                  MaxWidth = 35
                  MinWidth = 35
                  Width = 35
                end
                item
                  Caption = 'Documento'
                  MaxWidth = 150
                  MinWidth = 80
                  Width = 100
                end
                item
                  Alignment = taCenter
                  Caption = 'Vencimento'
                  MaxWidth = 70
                  MinWidth = 70
                  Width = 70
                end
                item
                  Alignment = taRightJustify
                  Caption = 'Valor'
                  MaxWidth = 80
                  MinWidth = 60
                  Width = 70
                end
                item
                  Caption = 'Situa'#231#227'o'
                end>
              GridLines = True
              RowSelect = True
              TabOrder = 0
              ViewStyle = vsReport
              OnCustomDrawItem = lstItensAcordoCustomDrawItem
            end
          end
          object tsEnderecos: TTabSheet
            Caption = 'Endere'#231'os'
            ImageIndex = 2
            object lstEnderecos: TListView
              Left = 0
              Top = 0
              Width = 1062
              Height = 310
              Align = alClient
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Referencia'
                  MaxWidth = 90
                  MinWidth = 30
                end
                item
                  AutoSize = True
                  Caption = 'Endere'#231'o'
                  MaxWidth = 400
                  MinWidth = 100
                end
                item
                  AutoSize = True
                  Caption = 'Bairro'
                  MaxWidth = 150
                  MinWidth = 50
                end
                item
                  AutoSize = True
                  Caption = 'Cidade'
                  MaxWidth = 150
                  MinWidth = 50
                end
                item
                  AutoSize = True
                  Caption = 'Estado'
                  MaxWidth = 60
                  MinWidth = 20
                end
                item
                  AutoSize = True
                  Caption = 'CEP'
                  MaxWidth = 70
                  MinWidth = 30
                end>
              GridLines = True
              RowSelect = True
              TabOrder = 0
              ViewStyle = vsReport
              OnCustomDrawItem = lstEnderecosCustomDrawItem
            end
          end
          object tsTelefones: TTabSheet
            Caption = 'Telefones'
            ImageIndex = 3
            object lstTelefones: TListView
              Left = 0
              Top = 0
              Width = 1062
              Height = 310
              Align = alClient
              Columns = <
                item
                  Caption = 'Ref'
                  MaxWidth = 80
                  MinWidth = 80
                  Width = 80
                end
                item
                  Caption = 'DDD'
                  MaxWidth = 50
                  MinWidth = 50
                end
                item
                  Caption = 'Telefone'
                  MaxWidth = 100
                  MinWidth = 100
                  Width = 100
                end>
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLines = True
              RowSelect = True
              ParentFont = False
              TabOrder = 0
              ViewStyle = vsReport
            end
          end
          object tsAcordos: TTabSheet
            Caption = 'Acordos'
            ImageIndex = 4
            object lstOutrasDividas: TListView
              Left = 0
              Top = 0
              Width = 1062
              Height = 310
              Align = alClient
              Color = clSilver
              Columns = <
                item
                  Caption = 'Tipo'
                  MaxWidth = 80
                  MinWidth = 30
                end
                item
                  Caption = 'Documento'
                end
                item
                  Caption = 'Credor'
                  MaxWidth = 150
                  MinWidth = 50
                  Width = 100
                end
                item
                  Alignment = taRightJustify
                  Caption = 'Valor'
                  MaxWidth = 40
                  MinWidth = 90
                  Width = 90
                end
                item
                  Caption = 'Obs'
                  MaxWidth = 200
                  MinWidth = 50
                end>
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLines = True
              ReadOnly = True
              RowSelect = True
              ParentFont = False
              TabOrder = 0
              ViewStyle = vsReport
              OnDblClick = lstOutrasDividasDblClick
            end
          end
          object tsAcionamentos: TTabSheet
            Caption = 'Acionamentos'
            ImageIndex = 5
            object lstAcionamento: TListView
              Left = 0
              Top = 32
              Width = 1062
              Height = 278
              Align = alClient
              Columns = <
                item
                  Caption = 'Data Acionamento'
                  MaxWidth = 120
                  MinWidth = 120
                  Width = 120
                end
                item
                  Caption = 'Usuario'
                  MaxWidth = 100
                  MinWidth = 100
                  Width = 100
                end
                item
                  Caption = 'Telefone'
                end
                item
                  Caption = 'Historico'
                  MaxWidth = 2000
                  MinWidth = 600
                  Width = 600
                end>
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLines = True
              RowSelect = True
              ParentFont = False
              TabOrder = 0
              ViewStyle = vsReport
              OnCustomDrawItem = lstAcionamentoCustomDrawItem
            end
            object rgOpcoesView: TRadioGroup
              Left = 0
              Top = 0
              Width = 1062
              Height = 32
              Align = alTop
              Caption = 'Op'#231#245'es de Visualiza'#231#227'o'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Todos'
                'Somente meus')
              TabOrder = 1
              OnClick = rgOpcoesViewClick
            end
          end
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 113
      Width = 1076
      Height = 72
      Align = alTop
      Caption = 'Dados Devedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label4: TLabel
        Left = 5
        Top = 15
        Width = 48
        Height = 13
        Caption = 'Devedor'
      end
      object Label6: TLabel
        Left = 374
        Top = 12
        Width = 97
        Height = 13
        Caption = 'Inscri'#231#227'o Federal'
      end
      object lblRG: TLabel
        Left = 614
        Top = 13
        Width = 16
        Height = 13
        Caption = 'RG'
      end
      object lblLocalizado: TLabel
        Left = 854
        Top = 16
        Width = 59
        Height = 13
        Caption = 'Localizado'
      end
      object stCodigoDevedor: TStaticText
        Left = 5
        Top = 32
        Width = 67
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object stNomeDevedor: TStaticText
        Left = 78
        Top = 32
        Width = 287
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object stInscricaoFederal: TStaticText
        Left = 372
        Top = 32
        Width = 235
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object stRG: TStaticText
        Left = 613
        Top = 31
        Width = 235
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object stLocalizado: TStaticText
        Left = 853
        Top = 31
        Width = 68
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 312
  end
end
