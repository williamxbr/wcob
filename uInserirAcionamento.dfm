object frmInserirAcionamento: TfrmInserirAcionamento
  Left = 559
  Top = 238
  BorderStyle = bsSingle
  Caption = 'Cobran'#231'a'
  ClientHeight = 205
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 419
    Height = 35
    Align = alTop
    Color = clWhite
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 3
      Width = 223
      Height = 23
      Caption = 'Cadastrar Acionamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnCabecalho: TPanel
    Left = 0
    Top = 35
    Width = 419
    Height = 170
    Align = alClient
    Color = clSilver
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object gbAcionamento: TGroupBox
      Left = 1
      Top = 1
      Width = 417
      Height = 168
      Align = alClient
      Caption = 'Acionamento'
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 45
        Width = 47
        Height = 13
        Caption = 'Telefones'
      end
      object pnTopAcionamento: TPanel
        Left = 1
        Top = 92
        Width = 415
        Height = 75
        Align = alBottom
        Color = clSilver
        TabOrder = 0
        object sbInserirAcionamento: TSpeedButton
          Left = 390
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            CE040000424DCE0400000000000036000000280000001C0000000E0000000100
            1800000000009804000000000000000000000000000000000000C8D0D46C2A00
            6828005D24005320004F1F004F1F004F1F004F1F004F1F004F1F004F1F004018
            00C8D0D4DDE2E4B2A19FAFA09FADA09FAAA09FA8A09FA8A09FA8A09FA8A09FA8
            A09FA8A09FA8A09FA49F9FDDE2E4973B00BB4900B44600AA4200A03F00993C00
            973B00973B00993C00993C00973B009E3E007B3000401800C3A49FD6A79FD2A6
            9FCDA59FC8A49FC4A49FC3A49FC3A49FC4A49FC4A49FC3A49FC7A49FB7A19FA4
            9F9FB84800E35900D45300CC5000C54D00BB4900B14500AF4400AF4400AF4400
            AF4400B647009E3E004F1F00D4A79FEDAB9FE4AA9FE0A99FDCA79FD6A79FD1A6
            9FCFA69FCFA69FCFA69FCFA69FD3A69FC7A49FA8A09FC74E00F05E00E15800D1
            5200C74E00C04B00FFFFFFFFFFFFD45300A74100A54100AF4400993C00511F00
            DDA89FF5AD9FECAB9FE3A99FDDA89FD9A79FFFFFFFFFFFFFE4AA9FCBA59FCAA5
            9FCFA69FC4A49FA9A09FCA4F00FF6802F66000E35900D45300CA4F00FFFFFFFF
            FFFFD45300AA4200A74100AF4400993C004F1F00DFA89FFFAF9FF9AD9FEDAB9F
            E4AA9FDFA89FFFFFFFFFFFFFE4AA9FCDA59FCBA59FCFA69FC4A49FA8A09FCA4F
            00FF7A16FF6C06FF6A04FF6A04FF6A04FFFFFFFFFFFFD45300D45300D45300AF
            4400993C004F1F00DFA89FFFB69FFFB29FFFB19FFFB19FFFB19FFFFFFFFFFFFF
            E4AA9FE4AA9FE4AA9FCFA69FC4A49FA8A09FCA4F00FF9035FF750FFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB647009C3D00511F00DFA89FFF
            C0A3FFB49FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3A69F
            C6A49FA9A09FCA4F00FF9F4EFF7D19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFC04B00A34000592300DFA89FFFC7A8FFB8A0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9A79FC9A49FABA09FCA4F00FFA65A
            FF8221FF6E08FF6601FF6A04FFFFFFFFFFFFFF6A04D95500CF5100CC5000B145
            006A2900DFA89FFFCBABFFBAA0FFB29FFFAF9FFFB19FFFFFFFFFFFFFFFB19FE7
            AA9FE1A99FE0A99FD1A69FB1A19FCA4F00FFAD67FF8A2DFF7813FF730DFF6903
            FFFFFFFFFFFFFF6A04E65A00DE5700D95500BD4A00792F00DFA89FFFCEAFFFBD
            A1FFB69FFFB49FFFB09FFFFFFFFFFFFFFFB19FEFAB9FEAAA9FE7AA9FD7A79FB6
            A19FCA4F00FFB676FF9741FF7E1BFF7A16FF720CFFFFFFFFFFFFFF6A04F05E00
            E95B00E65A00C74E00873500DFA89FFFD3B5FFC3A5FFB8A0FFB69FFFB39FFFFF
            FFFFFFFFFFB19FF5AD9FF1AB9FEFAB9FDDA89FBCA39FCA4F00FFBB7FFFB472FF
            A456FF9A46FF9035FF8424FF7A16FF6B05F86200F05E00F05E00D95500993C00
            DFA89FFFD6B8FFD2B3FFCAAAFFC5A6FFC0A3FFBBA0FFB69FFFB19FFBAE9FF5AD
            9FF5AD9FE7AA9FC4A49FCA4F00FFA558FFBB7FFFBD83FFB676FFAC65FF9D4AFF
            8728FF740EFF6601F86200FB6300E35900A54100DFA89FFFCAABFFD6B8FFD7BA
            FFD3B5FFCEAFFFC7A7FFBCA0FFB49FFFAF9FFBAE9FFCAE9FEDAB9FCAA59FC8D0
            D4EE5D00FF700AFF720CFF700AFF6C06FF6601EE5D00DE5700D15200CC5000CF
            5100B84800C8D0D4DDE2E4F4AD9FFFB39FFFB39FFFB39FFFB29FFFAF9FF4AD9F
            EAAA9FE3A99FE0A99FE1A99FD4A79FDDE2E4}
          NumGlyphs = 2
          OnClick = sbInserirAcionamentoClick
        end
        object mmAcionamento: TMemo
          Left = 1
          Top = 1
          Width = 388
          Height = 73
          Align = alLeft
          TabOrder = 0
        end
      end
      object cbMotivos: TComboBox
        Left = 2
        Top = 16
        Width = 407
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        OnClick = cbMotivosClick
      end
      object cbTelefones: TComboBox
        Left = 3
        Top = 61
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 2
      end
    end
  end
end
