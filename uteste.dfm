object frmTeste: TfrmTeste
  Left = 386
  Top = 292
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'WigCred'
  ClientHeight = 153
  ClientWidth = 333
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 134
    Width = 333
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
    Left = 16
    Top = 16
    Width = 305
    Height = 25
    Caption = 'Imprimir Pendencias com Acionamento'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 48
    Width = 305
    Height = 25
    Caption = 'Imprimir Acordo'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 16
    Top = 80
    Width = 305
    Height = 25
    Caption = 'Planejamento'
    TabOrder = 3
    OnClick = Button2Click
  end
  object XPManifest1: TXPManifest
    Left = 768
    Top = 40
  end
end
