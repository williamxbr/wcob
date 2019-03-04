object frmAcertos: TfrmAcertos
  Left = 266
  Top = 134
  Width = 812
  Height = 557
  Align = alClient
  Caption = 'eCob - Sistema de Cobran'#231'as'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 504
    Width = 804
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object Button1: TButton
    Left = 216
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 216
    Top = 192
    Width = 361
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object XPManifest1: TXPManifest
    Left = 768
    Top = 40
  end
end
