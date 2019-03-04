object frmInserirInstrucoesBoleto: TfrmInserirInstrucoesBoleto
  Left = 445
  Top = 366
  BorderStyle = bsSingle
  Caption = 'Instru'#231#245'es'
  ClientHeight = 218
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
      Width = 170
      Height = 23
      Caption = 'Instru'#231#245'es Boleto'
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
    Height = 183
    Align = alClient
    Color = clSilver
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object gbAcionamento: TGroupBox
      Left = 1
      Top = 1
      Width = 417
      Height = 181
      Align = alClient
      TabOrder = 0
      object pnTopAcionamento: TPanel
        Left = 1
        Top = 40
        Width = 415
        Height = 140
        Align = alBottom
        Color = clSilver
        TabOrder = 0
        object mmInstrucoes: TMemo
          Left = 2
          Top = 2
          Width = 409
          Height = 135
          TabOrder = 0
        end
      end
      object btnIncluir: TButton
        Left = 336
        Top = 12
        Width = 75
        Height = 25
        Caption = 'Sair'
        TabOrder = 1
        OnClick = btnIncluirClick
      end
    end
  end
end
