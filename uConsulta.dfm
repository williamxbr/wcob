object FrameConsulta: TFrameConsulta
  Left = 0
  Top = 0
  Width = 392
  Height = 240
  Ctl3D = False
  ParentCtl3D = False
  TabOrder = 0
  object Label1: TLabel
    Left = 0
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Pesquisar'
  end
  object FGridConsulta: TDBGrid
    Left = 0
    Top = 48
    Width = 392
    Height = 192
    Align = alBottom
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 0
    Top = 24
    Width = 391
    Height = 21
    TabOrder = 1
    Text = 'edCampo'
  end
end
