object frmplCobrador: TfrmplCobrador
  Left = 801
  Top = 365
  BorderStyle = bsToolWindow
  Caption = 'Cobrador'
  ClientHeight = 305
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 323
    Height = 305
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        AutoSize = True
        Caption = 'ID'
      end
      item
        AutoSize = True
        Caption = 'Cobrador'
      end>
    GridLines = True
    TabOrder = 0
    ViewStyle = vsReport
  end
end
