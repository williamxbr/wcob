object FrmRelatorioAcordos: TFrmRelatorioAcordos
  Left = 0
  Top = 0
  Caption = 'Relatorio de Acordos'
  ClientHeight = 442
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 73
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 785
    Height = 319
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 376
    ExplicitTop = 168
    ExplicitWidth = 185
    ExplicitHeight = 41
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 783
      Height = 317
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 192
      ExplicitTop = 56
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 392
    Width = 785
    Height = 50
    Align = alBottom
    TabOrder = 2
  end
end
