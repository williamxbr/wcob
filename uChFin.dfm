object FrmAtualizaFinanceiro: TFrmAtualizaFinanceiro
  Left = 409
  Top = 343
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Atualizador Sistema'
  ClientHeight = 71
  ClientWidth = 349
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 66
    Height = 16
    Caption = 'Aguarde...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 329
    Height = 13
    AutoSize = False
    Color = clCream
    ParentColor = False
  end
  object PB: TProgressBar
    Left = 16
    Top = 32
    Width = 329
    Height = 16
    TabOrder = 0
  end
  object TimerAtualiza: TTimer
    Interval = 500
    OnTimer = TimerAtualizaTimer
    Left = 88
  end
  object XPManifest1: TXPManifest
    Left = 168
  end
end
