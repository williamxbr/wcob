object FrmDiretorios: TFrmDiretorios
  Left = 525
  Top = 334
  BorderStyle = bsToolWindow
  Caption = 'Selecione o Diret'#243'rio'
  ClientHeight = 121
  ClientWidth = 269
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
  object pnRodape: TPanel
    Left = 0
    Top = 95
    Width = 269
    Height = 26
    Align = alBottom
    Color = clWhite
    TabOrder = 0
    object sbCancela: TSpeedButton
      Left = 219
      Top = 2
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777771F77771F7777777777777111F777777
        1F7777111F777771F777777111F77711F7777777111F711F77777777711111F7
        7777777777111F7777777777711111F777777777111F71F77777771111F77711
        F77771111F7777711F77711F7777777711F77777777777777777}
      OnClick = sbCancelaClick
    end
    object sbConfirma: TSpeedButton
      Left = 243
      Top = 2
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000CE0E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777774F7777777777777444F777777777774444F7777777777444F44F777
        77777444F7744F777777774F77774F7777777777777774F7777777777777774F
        7777777777777774F7777777777777774F7777777777777774F7777777777777
        7747777777777777777777777777777777777777777777777777}
      OnClick = sbConfirmaClick
    end
  end
  object pnTela: TPanel
    Left = 0
    Top = 0
    Width = 269
    Height = 95
    Align = alClient
    BevelInner = bvLowered
    Color = clSilver
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object lblVersao: TLabel
      Left = 8
      Top = 8
      Width = 112
      Height = 13
      Caption = 'Diret'#243'rio da Vers'#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbVersao: TSpeedButton
      Left = 237
      Top = 23
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777000000000007777700333333333077770B0333333333
        07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
        77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
        7007777777770777070777777777700077777777777777777777}
      OnClick = sbVersaoClick
    end
    object lblDatabase: TLabel
      Left = 8
      Top = 48
      Width = 108
      Height = 13
      Caption = 'Diret'#243'rio de Dados:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbDatabase: TSpeedButton
      Left = 237
      Top = 63
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777000000000007777700333333333077770B0333333333
        07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
        77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
        7007777777770777070777777777700077777777777777777777}
      OnClick = sbDatabaseClick
    end
    object edVersao: TEdit
      Left = 8
      Top = 24
      Width = 225
      Height = 21
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object edDatabase: TEdit
      Left = 8
      Top = 64
      Width = 225
      Height = 21
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object XPManifest1: TXPManifest
    Left = 232
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Black'
    Left = 192
    Top = 8
  end
end
