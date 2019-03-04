object frmEncerramento: TfrmEncerramento
  Left = 570
  Top = 338
  BorderStyle = bsNone
  Caption = 'Encerramento'
  ClientHeight = 192
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 28
    Align = alTop
    Caption = 'Encerramento Cobran'#231'a'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 28
    Width = 305
    Height = 123
    Align = alClient
    TabOrder = 1
    object MMotivoEncerramento: TMemo
      Left = 1
      Top = 41
      Width = 303
      Height = 81
      Align = alClient
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 303
      Height = 40
      Align = alTop
      Caption = 'GroupBox1'
      TabOrder = 1
      object lblDescricaoSituacao: TLabel
        Left = 64
        Top = 18
        Width = 237
        Height = 20
        Align = alRight
        AutoSize = False
        Caption = 'lblDescricaoSituacao'
      end
      object pnSituacao: TPanel
        Left = 2
        Top = 18
        Width = 55
        Height = 20
        Align = alLeft
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 151
    Width = 305
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnGravarEncerramento: TBitBtn
      Left = 3
      Top = 3
      Width = 110
      Height = 35
      TabOrder = 0
      Kind = bkOK
    end
    object btnCancelarEncerramento: TBitBtn
      Left = 115
      Top = 3
      Width = 105
      Height = 34
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
end
