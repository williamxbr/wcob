object SBLstV2fForm: TSBLstV2fForm
  Left = 194
  Top = 276
  Caption = 'Informa'#231#245'es para Relat'#243'rio'
  ClientHeight = 245
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Courier New'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object sbtAccept: TSpeedButton
    Left = 637
    Top = 215
    Width = 25
    Height = 24
    Flat = True
    Glyph.Data = {
      AA030000424DAA03000000000000360000002800000011000000110000000100
      18000000000074030000CE0E0000CE0E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF000080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF00008000008000008000
      0080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFF000080000080FFFFFF000080FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF0000800000
      80FFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFF000080000080000080FFFFFFFFFFFF0000800000
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      000080000080FFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080
      000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000080000080FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00}
    OnClick = sbtAcceptClick
  end
  object sbtCancel: TSpeedButton
    Left = 662
    Top = 215
    Width = 25
    Height = 24
    Flat = True
    Glyph.Data = {
      AA030000424DAA03000000000000360000002800000011000000110000000100
      18000000000074030000CE0E0000CE0E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF000080FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF0000800000
      80FFFFFFFFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFF0000800000
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF000080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000080000080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000080000080FFFFFF000080000080
      000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFF000080000080000080FFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000080000080FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000080000080000080FFFFFFFFFFFF00FFFF
      FFFFFFFF000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00}
    OnClick = sbtCancelClick
  end
  object sbtDelete: TSpeedButton
    Left = 3
    Top = 215
    Width = 78
    Height = 24
    Caption = 'Excluir'
    Flat = True
    OnClick = sbtDeleteClick
  end
  object gbFilterInf: TGroupBox
    Left = 0
    Top = 41
    Width = 693
    Height = 131
    Align = alTop
    Caption = 'Filtro Corrente'
    TabOrder = 0
    object meFilterInf: TMemo
      Left = 2
      Top = 16
      Width = 689
      Height = 113
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object gbLayoutInf: TGroupBox
    Left = 0
    Top = 172
    Width = 693
    Height = 41
    Align = alTop
    Caption = 'Arquivo do Relat'#243'rio'
    TabOrder = 1
    object sbtSelectFile: TSpeedButton
      Left = 637
      Top = 16
      Width = 23
      Height = 22
      Caption = '...'
      Flat = True
      OnClick = sbtSelectFileClick
    end
    object edFileReport: TEdit
      Left = 2
      Top = 16
      Width = 631
      Height = 22
      TabOrder = 0
    end
  end
  object gbReportName: TGroupBox
    Left = 0
    Top = 0
    Width = 693
    Height = 41
    Align = alTop
    Caption = 'Nome do Relat'#243'rio'
    TabOrder = 2
    object cbReportName: TComboBox
      Left = 3
      Top = 15
      Width = 678
      Height = 22
      AutoComplete = False
      ItemHeight = 14
      TabOrder = 0
      OnSelect = cbReportNameSelect
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'rtm'
    Filter = 'Relatorios|*.rtm'
    Title = 'Selecione um Leiaute de relat'#243'rio'
    Left = 534
    Top = 213
  end
end
