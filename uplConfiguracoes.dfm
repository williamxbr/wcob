object FrmPlConfiguracoes: TFrmPlConfiguracoes
  Left = 784
  Top = 426
  BorderStyle = bsToolWindow
  Caption = 'Configura'#231#245'es'
  ClientHeight = 210
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbOpcoes: TGroupBox
    Left = 0
    Top = 0
    Width = 185
    Height = 210
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 7
      Top = 115
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Inicio :'
    end
    object Label4: TLabel
      Left = 7
      Top = 139
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final :'
    end
    object cbCredor: TCheckBox
      Left = 5
      Top = 13
      Width = 113
      Height = 17
      Caption = 'Selecionar Credor'
      TabOrder = 0
      OnClick = cbCredorClick
    end
    object cbData: TCheckBox
      Left = 7
      Top = 90
      Width = 113
      Height = 17
      Caption = 'Selecionar Data'
      TabOrder = 1
      OnClick = cbDataClick
    end
    object dtInicio: TDateTimePicker
      Left = 42
      Top = 111
      Width = 98
      Height = 21
      Date = 39550.621956921300000000
      Time = 39550.621956921300000000
      Enabled = False
      TabOrder = 2
    end
    object dtFinal: TDateTimePicker
      Left = 42
      Top = 135
      Width = 98
      Height = 21
      Date = 39550.621956921300000000
      Time = 39550.621956921300000000
      Enabled = False
      TabOrder = 3
    end
    object cbDevedor: TCheckBox
      Left = 4
      Top = 51
      Width = 113
      Height = 17
      Caption = 'Selecionar Devedor'
      TabOrder = 4
      OnClick = cbDevedorClick
    end
    object edCredor: TEdit
      Left = 5
      Top = 29
      Width = 57
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object btnBuscaCredor: TButton
      Left = 64
      Top = 30
      Width = 22
      Height = 20
      Caption = '...'
      Enabled = False
      TabOrder = 6
      OnClick = btnBuscaCredorClick
    end
    object edDevedor: TEdit
      Left = 4
      Top = 68
      Width = 59
      Height = 21
      Enabled = False
      TabOrder = 7
    end
    object btnBuscaDevedor: TButton
      Left = 64
      Top = 69
      Width = 22
      Height = 20
      Caption = '...'
      Enabled = False
      TabOrder = 8
      OnClick = btnBuscaDevedorClick
    end
    object cbCobrador: TCheckBox
      Left = 6
      Top = 160
      Width = 120
      Height = 17
      Caption = 'Selecionar Cobrador'
      TabOrder = 9
      OnClick = cbCobradorClick
    end
    object edCobrador: TEdit
      Left = 5
      Top = 177
      Width = 84
      Height = 21
      TabOrder = 10
    end
    object btnCobrador: TButton
      Left = 104
      Top = 178
      Width = 22
      Height = 20
      Caption = '...'
      Enabled = False
      TabOrder = 11
      OnClick = btnCobradorClick
    end
  end
end
