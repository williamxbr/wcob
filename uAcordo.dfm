object frmAcordo: TfrmAcordo
  Left = 225
  Top = 139
  Width = 957
  Height = 587
  Caption = 'Acordo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 949
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Color = clWhite
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object Shape1: TShape
      Left = 2
      Top = 2
      Width = 945
      Height = 37
      Align = alClient
      Shape = stRoundRect
    end
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 945
      Height = 37
      Align = alClient
      Alignment = taCenter
      Caption = 'Acordo'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
  end
  object pnTela: TPanel
    Left = 0
    Top = 41
    Width = 949
    Height = 445
    Align = alClient
    BevelInner = bvLowered
    Color = clSilver
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object gbCabecalho: TGroupBox
      Left = 2
      Top = 2
      Width = 945
      Height = 127
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object gbAcordo: TGroupBox
        Left = 8
        Top = 10
        Width = 100
        Height = 38
        Caption = 'Acordo'
        TabOrder = 0
        object pnAcordo: TPanel
          Left = 2
          Top = 15
          Width = 96
          Height = 21
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnAcordo'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object gbCobranca: TGroupBox
        Left = 111
        Top = 10
        Width = 100
        Height = 38
        Caption = 'Cobran'#231'a'
        TabOrder = 1
        object pnCobranca: TPanel
          Left = 2
          Top = 15
          Width = 96
          Height = 21
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnCobranca'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object gbDivida: TGroupBox
        Left = 213
        Top = 10
        Width = 100
        Height = 38
        Caption = 'Divida'
        TabOrder = 2
        object pnDivida: TPanel
          Left = 2
          Top = 15
          Width = 96
          Height = 21
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnDivida'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object gbValorAcordo: TGroupBox
        Left = 317
        Top = 10
        Width = 100
        Height = 38
        BiDiMode = bdLeftToRight
        Caption = 'Valor'
        ParentBiDiMode = False
        TabOrder = 3
        object pnValorAcordo: TPanel
          Left = 2
          Top = 15
          Width = 96
          Height = 21
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnValorAcordo'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object gbParcelas: TGroupBox
        Left = 421
        Top = 10
        Width = 60
        Height = 38
        BiDiMode = bdLeftToRight
        Caption = 'Parcelas'
        ParentBiDiMode = False
        TabOrder = 4
        object pnParcelas: TPanel
          Left = 2
          Top = 15
          Width = 56
          Height = 21
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnParcelas'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object gbCredor: TGroupBox
        Left = 8
        Top = 51
        Width = 705
        Height = 34
        Caption = 'Credor'
        TabOrder = 5
        object lblCredor: TLabel
          Left = 2
          Top = 15
          Width = 701
          Height = 17
          Align = alClient
          Layout = tlCenter
        end
      end
      object gbDevedor: TGroupBox
        Left = 9
        Top = 86
        Width = 704
        Height = 34
        Caption = 'Devedor'
        TabOrder = 6
        object lblDevedor: TLabel
          Left = 2
          Top = 15
          Width = 700
          Height = 17
          Align = alClient
          Layout = tlCenter
        end
      end
      object gbSituacao: TGroupBox
        Left = 483
        Top = 10
        Width = 185
        Height = 37
        Caption = 'Situa'#231#227'o'
        TabOrder = 7
        object lblSituacao: TLabel
          Left = 2
          Top = 15
          Width = 181
          Height = 20
          Align = alClient
          Alignment = taCenter
          Layout = tlCenter
        end
      end
    end
    object pnlvAcordo: TPanel
      Left = 2
      Top = 273
      Width = 945
      Height = 170
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlvAcordo'
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 699
        Top = 0
        Width = 5
        Height = 170
        Align = alRight
        Visible = False
      end
      object pnRecibo: TPanel
        Left = 704
        Top = 0
        Width = 241
        Height = 170
        Align = alRight
        TabOrder = 0
        Visible = False
        object gbRecibo: TGroupBox
          Left = 1
          Top = 1
          Width = 239
          Height = 96
          Align = alTop
          Caption = 'Recibo'
          TabOrder = 0
          DesignSize = (
            239
            96)
          object gbValorRecibo: TGroupBox
            Left = 4
            Top = 12
            Width = 76
            Height = 38
            Caption = 'Valor'
            TabOrder = 0
            object pnValorRecibo: TPanel
              Left = 2
              Top = 15
              Width = 72
              Height = 21
              Align = alClient
              Caption = 'pnValorRecibo'
              TabOrder = 0
            end
          end
          object gbEncargosRecibo: TGroupBox
            Left = 78
            Top = 12
            Width = 67
            Height = 38
            Caption = 'Encargos'
            TabOrder = 1
            object pnEncargosRecibo: TPanel
              Left = 2
              Top = 15
              Width = 63
              Height = 21
              Align = alClient
              Caption = 'pnEncargosRecibo'
              TabOrder = 0
            end
          end
          object gbMultaRecibo: TGroupBox
            Left = 143
            Top = 12
            Width = 67
            Height = 38
            Caption = 'Multa'
            TabOrder = 2
            object pnMultaRecibo: TPanel
              Left = 2
              Top = 15
              Width = 63
              Height = 21
              Align = alClient
              Caption = 'pnMultaRecibo'
              TabOrder = 0
            end
          end
          object GroupBox1: TGroupBox
            Left = 5
            Top = 50
            Width = 75
            Height = 38
            Caption = 'Honorarios'
            TabOrder = 3
            object pnHonorariosRecibo: TPanel
              Left = 2
              Top = 15
              Width = 71
              Height = 21
              Align = alClient
              Caption = 'pnHonorariosRecibo'
              TabOrder = 0
            end
          end
          object gbTotalRecibo: TGroupBox
            Left = 78
            Top = 50
            Width = 67
            Height = 38
            Caption = 'Total'
            TabOrder = 4
            object pnTotalRecibo: TPanel
              Left = 2
              Top = 15
              Width = 63
              Height = 21
              Align = alClient
              Caption = 'pnTotalRecibo'
              Enabled = False
              TabOrder = 0
            end
          end
          object btnAdicionaRecibo: TBitBtn
            Left = 146
            Top = 63
            Width = 30
            Height = 30
            Anchors = [akRight, akBottom]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = btnAdicionaReciboClick
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000E0000000E0000000100
              0400000000007000000000000000000000001000000000000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3300333333333333330033333333333333003333300033333300333330F03333
              3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
              3300333330F033333300333330F0333333003333300033333300333333333333
              33003333333333333300}
          end
          object btnDeletaRecibo: TBitBtn
            Left = 175
            Top = 63
            Width = 30
            Height = 30
            Cursor = crHandPoint
            Hint = 'Remove o item da lista'
            Anchors = [akRight, akBottom]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000E0000000E0000000100
              0400000000007000000000000000000000001000000000000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3300333333333333330033333333333333003333333333333300333333333333
              330033333333333333003300000000003300330FFFFFFFF03300330000000000
              3300333333333333330033333333333333003333333333333300333333333333
              33003333333333333300}
          end
          object btnImpriirRecibo: TBitBtn
            Left = 204
            Top = 63
            Width = 30
            Height = 30
            Cursor = crHandPoint
            Hint = 'Imprime os romaneios selecionados'
            Anchors = [akLeft, akBottom]
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = btnImpriirReciboClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
              0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBF
              BF000000FFFFFFFFFFFF00000000000000000000000000000000000000000000
              0000000000000000000000000000000000BFBFBF000000FFFFFF000000BFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00FFFF00FFFF00FFFFBFBFBFBFBFBF0000
              00000000000000FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F
              7F7F7F7F7F7F7F7FBFBFBFBFBFBF000000BFBFBF000000FFFFFF000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00BFBFBFBFBFBF000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BFBFBF000000FFFFFF000000
              000000000000000000000000000000000000000000000000000000BFBFBF0000
              00BFBFBF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000BFBFBF000000BFBFBF000000FFFFFFFFFFFF
              FFFFFF000000FFFFFF000000000000000000000000000000FFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000FFFFFF000000000000000000000000000000FFFFFF0000
              00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
              00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          end
        end
      end
    end
    object pnItens: TPanel
      Left = 2
      Top = 129
      Width = 945
      Height = 144
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object gbItens: TGroupBox
        Left = 0
        Top = 0
        Width = 945
        Height = 144
        Align = alClient
        TabOrder = 0
        DesignSize = (
          945
          144)
        object gbParcela: TGroupBox
          Left = 3
          Top = 11
          Width = 67
          Height = 38
          Caption = 'Parcela'
          TabOrder = 0
          object pnParcela: TPanel
            Left = 2
            Top = 15
            Width = 63
            Height = 21
            Align = alClient
            Caption = 'pnParcela'
            TabOrder = 0
          end
        end
        object gbVencimento: TGroupBox
          Left = 72
          Top = 11
          Width = 103
          Height = 38
          Caption = 'Vencimento'
          TabOrder = 1
          object dtVencimento: TDateTimePicker
            Left = 4
            Top = 14
            Width = 96
            Height = 21
            Date = 40270.000000000000000000
            Time = 40270.000000000000000000
            TabOrder = 0
          end
        end
        object gbValor: TGroupBox
          Left = 176
          Top = 11
          Width = 108
          Height = 38
          Caption = 'Valor'
          TabOrder = 2
          object pnValorItem: TPanel
            Left = 2
            Top = 15
            Width = 104
            Height = 21
            Align = alClient
            Caption = 'pnValorItem'
            TabOrder = 0
          end
        end
        object gbValorRepasse: TGroupBox
          Left = 285
          Top = 11
          Width = 121
          Height = 38
          Caption = 'Repasse'
          TabOrder = 3
          object pnRepasse: TPanel
            Left = 2
            Top = 15
            Width = 117
            Height = 21
            Align = alClient
            Caption = 'Repasse'
            TabOrder = 0
          end
        end
        object ckPago: TCheckBox
          Left = 7
          Top = 62
          Width = 58
          Height = 17
          Caption = 'Pago'
          TabOrder = 4
          OnClick = ckPagoClick
        end
        object gbPagamento: TGroupBox
          Left = 72
          Top = 48
          Width = 103
          Height = 38
          Caption = 'Pagamento'
          TabOrder = 5
          object dtPagamento: TDateTimePicker
            Left = 4
            Top = 14
            Width = 96
            Height = 21
            Date = 40270.000000000000000000
            Time = 40270.000000000000000000
            Enabled = False
            TabOrder = 0
          end
        end
        object ckPreDatado: TCheckBox
          Left = 181
          Top = 63
          Width = 97
          Height = 17
          Caption = 'Pre datado'
          TabOrder = 6
        end
        object gbTipoDocumento: TGroupBox
          Left = 409
          Top = 11
          Width = 256
          Height = 37
          Caption = 'Tipo'
          TabOrder = 7
          object pnTipoDoc: TPanel
            Left = 2
            Top = 15
            Width = 47
            Height = 20
            Align = alLeft
            Caption = 'pnTipoDoc'
            TabOrder = 0
          end
          object pnDescTipo: TPanel
            Left = 56
            Top = 15
            Width = 198
            Height = 20
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object gbNumeroDocumento: TGroupBox
          Left = 669
          Top = 11
          Width = 118
          Height = 38
          Caption = 'Numero'
          TabOrder = 8
          object edNumeroDocumento: TEdit
            Left = 2
            Top = 14
            Width = 111
            Height = 21
            TabOrder = 0
          end
        end
        object ckChequeCompensado: TCheckBox
          Left = 288
          Top = 63
          Width = 97
          Height = 17
          Caption = 'Compensado'
          TabOrder = 9
        end
        object gbBanco: TGroupBox
          Left = 409
          Top = 47
          Width = 237
          Height = 38
          Caption = 'Banco'
          TabOrder = 10
          object pnBanco: TPanel
            Left = 2
            Top = 15
            Width = 47
            Height = 21
            Align = alLeft
            Caption = 'pnBanco'
            TabOrder = 0
          end
          object pnDescBanco: TPanel
            Left = 56
            Top = 15
            Width = 179
            Height = 21
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object btnAdicionarItem: TBitBtn
          Left = 825
          Top = 7
          Width = 30
          Height = 30
          Hint = 'ADICIONA A NATUREZA DE OPERA'#199#195'O INFORMADA'
          Anchors = [akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnClick = btnAdicionarItemClick
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000000000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3300333333333333330033333333333333003333300033333300333330F03333
            3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
            3300333330F033333300333330F0333333003333300033333300333333333333
            33003333333333333300}
        end
        object btnDeletarItem: TBitBtn
          Left = 854
          Top = 7
          Width = 30
          Height = 30
          Cursor = crHandPoint
          Hint = 'Remove o item da lista'
          Anchors = [akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000000000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3300333333333333330033333333333333003333333333333300333333333333
            330033333333333333003300000000003300330FFFFFFFF03300330000000000
            3300333333333333330033333333333333003333333333333300333333333333
            33003333333333333300}
        end
        object btnAlterarItem: TBitBtn
          Left = 883
          Top = 7
          Width = 30
          Height = 30
          Cursor = crHandPoint
          Hint = 'Edita o item selecionado'
          Anchors = [akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          OnClick = btnAlterarItemClick
          Glyph.Data = {
            9E020000424D9E0200000000000036000000280000000E0000000E0000000100
            18000000000068020000C40E0000C40E0000000000000000000000BFBF00BFBF
            00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
            BF00BFBF000000BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
            BF00BFBF00BFBF00BFBF00BFBF00BFBF000000BFBF00BFBF00BFBF00BFBF00BF
            BF00BFBF00000000000000000000BFBF00BFBF00BFBF00BFBF00BFBF000000BF
            BF00BFBF00BFBF00BFBF00BFBF00BFBF000000FFFFFF00000000BFBF00BFBF00
            BFBF00BFBF00BFBF000000BFBF00BFBF00BFBF000000000000000000000000FF
            FFFF00000000000000000000000000BFBF00BFBF000000BFBF00BFBF00BFBF00
            0000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF00000000BFBF00BFBF
            000000BFBF00BFBF00BFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            00000000000000BFBF00BFBF000000BFBF00BFBF00BFBF00BFBF000000000000
            000000FFFFFF00000000000000000000BFBF00BFBF00BFBF000000BFBF00BFBF
            00BFBF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000BF
            BF00BFBF000000BFBF00BFBF00BFBF000000FFFFFFFFFFFF000000FFFFFF0000
            00FFFFFFFFFFFF00000000BFBF00BFBF000000BFBF00BFBF00BFBF0000000000
            00000000000000FFFFFF00000000000000000000000000BFBF00BFBF000000BF
            BF00BFBF00BFBF00BFBF00BFBF00BFBF000000FFFFFF00000000BFBF00BFBF00
            BFBF00BFBF00BFBF000000BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00000000
            000000000000BFBF00BFBF00BFBF00BFBF00BFBF000000BFBF00BFBF00BFBF00
            BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
            0000}
        end
        object btnConfiguraListView: TBitBtn
          Left = 912
          Top = 7
          Width = 30
          Height = 30
          Cursor = crHandPoint
          Hint = 'Configura a lista dos itens dos romaneios'
          Anchors = [akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          OnClick = btnConfiguraListViewClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFF0000FF0000
            7F0000FFBFBFBF000000FFFFFF7F7F7F000000000000000000FFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFF0000FF00007F0000FF000000007F7F7F7F7F000000
            FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
            7F0000FF007F7F007F7F000000FFFFFF000000000000FFFFFFFFFFFF000000FF
            FFFFFFFFFFFFFFFFFFFFFF0000FF00007F0000FF007F7F007F7F000000000000
            FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
            7F0000FF007F7FFFFFFF0000007F7F7FFFFFFFFFFFFF000000FFFFFF000000FF
            FFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF
            7F7F7F000000FFFFFF0000007F7F7FFFFFFFFFFFFF00000000007F00007F0000
            7F00007F00007FFFFFFFFFFFFFFFFFFF0000000000000000007F7F7FFFFFFFFF
            FFFF000000007F7F007F7F007F7F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000007F7F007F7F007F7FFFFFFF0000
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF00000000
            7F7F007F7F007F7FFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000
            BFBFBF000000FFFFFF000000007F7F007F7F007F7FFFFFFFFFFFFFFFFFFF0000
            00FFFFFFFFFFFFFFFFFF000000BFBFBF000000000000000000007F7F007F7F00
            7F7FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000000000
            000000000000000000000000007F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000
            007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FF
            FFFFFFFFFFFFFFFFFFFFFF7F7F7F0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
            007F7F0000000000000000000000007F7F7FFFFFFFFFFFFFFFFFFF7F7F7F0000
            007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF007F7F007F7FFFFFFF00000000000000
            0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object mmObservacoes: TMemo
          Left = 2
          Top = 88
          Width = 941
          Height = 54
          Align = alBottom
          TabOrder = 15
        end
      end
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 486
    Width = 949
    Height = 67
    Align = alBottom
    BevelInner = bvLowered
    Color = clWhite
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    DesignSize = (
      949
      67)
    object btnImprime: TBitBtn
      Left = 318
      Top = 8
      Width = 90
      Height = 50
      Cursor = crHandPoint
      Hint = 'Imprime os romaneios selecionados'
      Anchors = [akRight, akBottom]
      Caption = 'I&mprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnImprimeClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FF4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
        4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4D4D4D4D4D4D4D4D4D4D4D
        4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF4D4D4D575757FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4D4D4D
        4DFF00FFFF00FFFF00FFFF00FF4D4D4DFF00FF4D4D4D575757FF00FF4D4D4D4D
        4D4D4D4D4D575757FF00FF4D4D4D4D4D4DFF00FF4D4D4DFF00FF4D4D4D4D4D4D
        FF00FF4D4D4D575757FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4D5454
        54FF00FF4D4D4D4D4D4D4D4D4D4D4D4DFF00FF4D4D4D575757FF00FF4D4D4D4D
        4D4D4D4D4D575757FF00FF4D4D4D575757FF00FF4D4D4D4D4D4D4D4D4D4D4D4D
        FF00FF4D4D4D575757FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4D5757
        57FF00FF4D4D4D4D4D4D4D4D4D4D4D4DFF00FF7777774D4D4D4D4D4D4D4D4D4D
        4D4D4D4D4D4D4D4D4D4D4D4D4D4D818181FF00FF4D4D4D4D4D4D4D4D4D4D4D4D
        FF00FFFF00FF7777774D4D4D4D4D4D4D4D4D4D4D4D4D4D4D575757818181FF00
        FFFF00FF4D4D4D4D4D4D4D4D4D4D4D4DCBCBCBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCB4D4D4D4D4D4D4D4D4D4D4D4D
        606060C9C9C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C9
        C96060604D4D4D4D4D4DFF00FF4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
        4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4DFF00FFFF00FFFF00FF
        4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
        4D4D4D4DFF00FFFF00FFFF00FFFF00FF4D4D4D4D4D4D575757FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF4D4D4D4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF4D4D4D4D4D4D4D4D4D575757FF00FFFF00FF4D4D4D4D4D4D4D4D4D4D4D
        4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4D4D4D4D4D4D4D575757FF
        00FFFF00FF4D4D4D4D4D4D4D4D4D4D4D4DFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
    end
    object btnBoleto: TBitBtn
      Left = 407
      Top = 8
      Width = 90
      Height = 50
      Cursor = crHandPoint
      Hint = 'Gerar Boletos'
      Anchors = [akRight, akBottom]
      BiDiMode = bdLeftToRight
      Caption = '&Imprimir Boletos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnBoletoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Left = 496
      Top = 8
      Width = 90
      Height = 50
      Cursor = crHandPoint
      Hint = 'Limpa a tela'
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F0000F000FFF
        FFFF00000000FFF0FFFF00FF000FF0FFFFFF00FFF00FFFFFFFFFF00FF00F00FF
        FFFFFF00F0F0110FFFFFFFFF0F099910FFFFF00FFF0999910FFFF00F0FF09990
        30FFFF00F0FF090B030FFFFFFFFFF0B0B030FFFF0FFFFF0B0B33FFFFFFFFFFF0
        BBB3FFF0FFFFFFFF0BBBFFFFFFFFFFFFF0BBFFFFFFFFFFFFFF0B}
      Layout = blGlyphTop
    end
    object btnGravar: TBitBtn
      Left = 585
      Top = 8
      Width = 90
      Height = 50
      Anchors = [akRight, akBottom]
      Caption = 'Gravar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnGravarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        B2B2B27B7B7B5050504D4D4D4D4D4D4D4D4D4D4D4D5050507B7B7BB2B2B2FF00
        FFFF00FFFF00FFFF00FFFF00FF8888884D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
        4D4D4D4D4D4D4D4D4D4D4D4D4D4D868686FF00FFFF00FFFF00FFADADAD4D4D4D
        5C5C5CC4C4C4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC4C4C45E5E5E4D4D
        4DADADADFF00FFFF00FF7B7B7B4D4D4DC9C9C9FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFC9C9C94D4D4D7B7B7BFF00FFFF00FF5050504D4D4D
        FF00FFFF00FFFF00FFFF00FFFF00FFC3C3C3A2A2A2FF00FFFF00FFFF00FF4D4D
        4D505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1D1D15A
        5A5A565656C5C5C5FF00FFFF00FF4D4D4D4D4D4DFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFDBDBDB5C5C5C565656565656626262EBEBEBFF00FF4D4D
        4D4D4D4DFF00FFFF00FF4D4D4D4D4D4DFF00FFFF00FFE7E7E76464645C5C5C8A
        8A8A5656565656567C7C7CFBFBFB4D4D4D4D4D4DFF00FFFF00FF4D4D4D4D4D4D
        FF00FFFF00FF6C6C6C707070E1E1E1FF00FFABABAB565656565656A4A4A4D3D3
        D3646464FF00FFFF00FF5353534D4D4DFF00FFFF00FF989898FF00FFFF00FFFF
        00FFFF00FFB7B7B7565656565656CDCDCDFF00FFFF00FFFF00FF7D7D7D4D4D4D
        CBCBCBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C15858586262
        62EBEBEBFF00FFFF00FFABABAB4D4D4D606060C9C9C9FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFC9C9C95A5A5A7E7E7EFF00FFFF00FFFF00FF838383
        4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D7D7D7DF0F0F0B7B7
        B75C5C5CA4A4A4FF00FFFF00FFFF00FFADADAD7777774D4D4D4D4D4D4D4D4D4D
        4D4D4D4D4D4D4D4D777777ADADADFF00FFD9D9D9646464FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE5E5E5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
    end
    object btnLimpar: TBitBtn
      Left = 674
      Top = 8
      Width = 90
      Height = 50
      Cursor = crHandPoint
      Hint = 'Limpa a tela'
      Anchors = [akRight, akBottom]
      Caption = '&Limpar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnLimparClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE8E8E8919191
        8D8D8D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E
        8E8D8D8D939393E1E1E1BEBEBEB1B1B1ACACACAEAEAEAEAEAEAEAEAEAEAEAEAE
        AEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEACACACA8A8A8A2A2A2ABABABACACAC
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFACACAC7C7C7CADADADACACACFF00FFA4A4A4525252FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACAC818181ADADADACACAC
        FF00FF9898983A3A3AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFACACAC818181ADADADACACACFF00FF9A9A9A3E3E3EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACAC818181ADADADACACAC
        FF00FF9A9A9A3E3E3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFACACAC818181ADADADACACACFF00FF9796973A3A3AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACAC818181ADADADACACAC
        FF00FFA0A0A1515151FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFACACAC818181ACACACACACACFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACAC7D7D7DBEBEBEACACAC
        ACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACAC
        ACACACACACACACA3A3A3EAEAEAB5B5B5B4B4B4B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B4B4B4B8B8B8E3E3E3FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
    end
    object btnExcluir: TBitBtn
      Left = 763
      Top = 8
      Width = 90
      Height = 50
      Cursor = crHandPoint
      Hint = 'Excluir o registro atual'
      Anchors = [akRight, akBottom]
      Caption = '&Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnExcluirClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF8C8C8C6969696F6F6F7575757B7B7B7F
        7F7F7F7F7F7B7B7B7575756F6F6F6969698C8C8CFF00FFFF00FFFF00FF8D8D8D
        8080809898989898989898989898989898989898989898989898989898989898
        988080808D8D8DFF00FFFF00FF6B6B6B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B6B6B6BFF00FFFF00FF6E6E6E
        9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F
        9F9F9F9F6E6E6EFF00FFFF00FF737373A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4
        A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4737373FF00FFFF00FF777777
        A9A9A99C9C9C9898989898989898989898989898989898989898989898989C9C
        9CA9A9A9777777FF00FFFF00FF7C7C7CAFAFAF9C9C9CFFEEDDFFEEDDFFEEDDFF
        EEDDFFEEDDFFEEDDFFEEDDFFEEDD9C9C9CAFAFAF7C7C7CFF00FFFF00FF818181
        B4B4B4A0A0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0A0
        A0B4B4B4818181FF00FFFF00FF868686BABABAAAAAAAA5A5A5A5A5A5A5A5A5A5
        A5A5A5A5A5A5A5A5A5A5A5A5A5A5AAAAAABABABA868686FF00FFFF00FF8A8A8A
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF8A8A8AFF00FFFF00FF8F8F8FC4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4
        C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C48F8F8FFF00FFFF00FF929292
        C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9
        C9C9C9C9929292FF00FFFF00FFB0B0B0B1B1B1CCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCB1B1B1B0B0B0FF00FFFF00FFFF00FF
        B2B2B29C9C9CA2A2A2A8A8A8AEAEAEB2B2B2B2B2B2AEAEAEA8A8A8A2A2A29C9C
        9CB2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
    end
    object btnSair: TBitBtn
      Left = 852
      Top = 8
      Width = 90
      Height = 50
      Cursor = crHandPoint
      Hint = 'Sai da tela'
      Anchors = [akRight, akBottom]
      Caption = '&Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSairClick
      Glyph.Data = {
        8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
        180000000000580B0000CE0E0000D80E00000000000000000000FFFFFFF2F2F2
        F2F2F2D3D3D3E8E8E8F5F5F5DBDBDBDDDDDDECECECEEEEEED3D3D3EBEBEBF7F7
        F723230F4F4F00B2B2A8E9E9E9D6D6D6EBEBEBFAFAFAFFFFFFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBF7F7F7F7F7F7FB2B2A8BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFF
        FFF0F0F0D8D8D8EDEDEDEAEAEADFDFDFDCDCDCF4F4F4E6E6E6D7D7D7F2F2F2E7
        E7E7DDDDDD4C4C0CFFFF006868119B9B9BF4F4F4E7E7E7DBDBDBE6E6E6BFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFD3D3D3E4E4E4EFEFEFE4E4E4D8D8D8EDEDEDF3F3F3D3D3D3E7E7E7F1F1F1
        DFDFDFDBDBDBECECEC4D4D0DFFFF008D8D00515105878781DFDFDFEDEDEDECEC
        ECBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFF00BFBFBF7F7F7F7F7F7FBFBFBFBFBFBF
        BFBFBFBFBFBFE6E6E6EDEDEDE1E1E1DBDBDBF5F5F5E3E3E3DCDCDCEAEAEAEAEA
        EAE0E0E0DBDBDBF6F6F6E3E3E34D4D0DFFFF008F8F007F7F0056560DA1A1A1E2
        E2E2DBDBDBBFBFBFBFBFBFFFFFAFFFFFAFFFFFAFFFFFAFFFFFAFFFFFAFFFFFAF
        FFFFAFFFFFAFBFBFBFBFBFBFBFBFBF7F7F7FFFFF00BFBFBFBFBFBF7F7F7FBFBF
        BFFFFFAFFFFFAFFFFFAF4B4B4B5050504E4E4E4848484F4F4F5050504A4A4A4C
        4C4C444444F0F0F0F3F3F3D3D3D3E7E7E74E4E0EFFFF008F8F007F7F007D7D00
        4C4C0D323232484848BFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7FFFFFAFBFBFBFBFBFBFBFBFBF7F7F7FFFFF00BFBFBFBFBFBFBF
        BFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBF4A4A4ADFDFDFDFDFDFE9E9E9EBEBEB4D4D0DFFFF008F8F007F7F
        007F7F00474700636363BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBF7F7F7FFFFF00BFBFBF
        BFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFB0B0B0BFBFBF4040403F3F3F3737373737373F3F3F434303FFFF008F
        8F007F7F007F7F00474700636363BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFB0B0B0BFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF
        00BFBFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF3D3D3D8F8F8F3E3E3E7F7F7F7F7F7F7F7F7F7F7F7F474707
        FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FFFFFAFBFBFBFBFBFBFBFBFBF7F
        7F7FFFFF00BFBFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBF3C3C304D4D141515137F7F7F7F7F7F7F7F7F7F7F
        7F474707FFFF008D8D007777007D7D00474700636363BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FFFFFAFBFBFBFBFBFBF
        BFBFBF7F7F7FFFFF00BFBFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4646309A9A004545046161617F7F7F7F
        7F7F7F7F7F474707FFFF005F5F08171717676700474700636363BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFAF7F7F7F7F7F7FBFBF
        BFBFBFBFBFBFBF7F7F7FFFFF00BFBFBF7F7F7F7F7F7F7F7F7FFFFFAFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF474727EDED0092920045450E
        6363637F7F7F7F7F7F474707FFFF004747276B6B6B676700474700636363BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFAFFFFFAF7F
        7F7F7F7F7FBFBFBFBFBFBF7F7F7FFFFF00BFBFBF7F7F7F7F7F7F7F7F7FFFFFAF
        BFBFBFBFBFBFAEAEAE57574531310A272700272700272700424200FFFF00F9F9
        009898004242006363637F7F7F474707FFFF007E7E002727006E6E0047470063
        6363BFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFAF
        BFBFBFFFFFAF7F7F7F7F7F7FBFBFBF7F7F7FFFFF00BFBFBF7F7F7F7F7F7F7F7F
        7FFFFFAFBFBFBFBFBFBF8989898C8C13CFCF01CFCF00CFCF00CFCF00D5D500FF
        FF00FFFF00EDED0098980045450E616161474707FFFF008F8F007F7F007F7F00
        474700636363BFBFBFBFBFBF7F7F7FFFFFAFFFFFAFFFFFAFFFFFAFFFFFAFFFFF
        AFBFBFBFBFBFBFBFBFBFFFFFAF7F7F7F7F7F7F7F7F7FFFFF00BFBFBFBFBFBFBF
        BFBF7F7F7FFFFFAFBFBFBFBFBFBF898989A1A113FEFE2CFFFFAFFFFFAFFFFFAF
        FFFFAFFFFFAFFFFFDBFFFF6DE3E3004B4B095B5B5B474707FFFF008F8F007F7F
        007F7F00474700636363BFBFBFBFBFBF7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FFFFF00BFBFBF
        BFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFA7A7A76F6F4879790C7A7A0A7A7A
        0A7A7A0A8A8A09FFFF3EFFFF70E4E4005F5F005858587F7F7F474707FFFF008F
        8F007F7F007F7F00474700636363BFBFBFBFBFBFA7A7A77F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBF7F7F7F7F7F7FBFBFBF7F7F7FFFFF
        00BFBFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFB1B1B1A9A9A9A9
        A9A9A9A9A9A9A9A94C4C2CFFFF0DE6E6075959085858537F7F7F7F7F7F474707
        FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBFBFBFBFB1B1B1A9A9
        A9A9A9A9A9A9A9A9A9A97F7F7FBFBFBFBFBFBF7F7F7F7F7F7FBFBFBFBFBFBF7F
        7F7FFFFF00BFBFBFBFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBF505030E3E3005F5F035757577F7F7F7F7F7F7F7F
        7F474707FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF7F7F7F7F7F7FBFBFBFBFBFBF
        BFBFBF7F7F7FFFFF008F8F00BFBFBFBFBFBF7F7F7FFFFFAFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4242356E6E2521211B7F7F7F7F7F7F7F
        7F7F7F7F7F5E5E52999906D5D5008787007F7F00474700636363BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FFFFFAFBFBF
        BFBFBFBFBFBFBF7F7F7F999906D5D500878700BFBFBF7F7F7FFFFFAFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7070708888884444447F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F565656999906DBDB00898900474700636363BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FFF
        FFAFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F999906DBDB008989007F7F7FFFFFAF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4444
        447F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5E5E529B9B03D7D7004C4C0076
        7676BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        7F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F9B9B03D7D7007F7F
        7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBF4141415656565656565656565656565656565656565656562E2E2E888807
        65650C888888BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F88
        88077F7F7FFFFFAFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBF9696968989898989898989898989898989898989898989898989
        89898989898989B1B1B1BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF7F7F7FFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00BFBFBFBFBFBF}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    object ckConfigurar: TCheckBox
      Left = 7
      Top = 4
      Width = 97
      Height = 17
      Caption = 'Configurar'
      TabOrder = 7
    end
    object ckCarne: TCheckBox
      Left = 7
      Top = 22
      Width = 97
      Height = 17
      Caption = 'Carn'#234
      TabOrder = 8
    end
  end
  object pnGerarParcelas: TPanel
    Left = 392
    Top = 129
    Width = 145
    Height = 200
    Ctl3D = True
    UseDockManager = False
    DragKind = dkDock
    DragMode = dmAutomatic
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Locked = True
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    Visible = False
    DesignSize = (
      145
      200)
    object pnGerarParcelasTitulo: TPanel
      Left = 1
      Top = 1
      Width = 143
      Height = 33
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Gerar Parcelas'
      Color = clMedGray
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object gbEntrada: TGroupBox
      Left = 1
      Top = 34
      Width = 143
      Height = 47
      Align = alTop
      Caption = 'Entrada'
      TabOrder = 1
      object dtVencimentoEntrada: TDateTimePicker
        Left = 8
        Top = 16
        Width = 130
        Height = 21
        Date = 40280.958013055550000000
        Time = 40280.958013055550000000
        TabOrder = 0
      end
    end
    object gbValorEntrada: TGroupBox
      Left = 1
      Top = 81
      Width = 143
      Height = 40
      Align = alTop
      Caption = 'Valor Entrada'
      TabOrder = 2
      object pnValorEntrada: TPanel
        Left = 2
        Top = 15
        Width = 139
        Height = 23
        Align = alClient
        Caption = 'pnValorEntrada'
        TabOrder = 0
      end
    end
    object btnGerarOMs: TBitBtn
      Left = 4
      Top = 168
      Width = 138
      Height = 30
      Anchors = [akTop, akRight]
      Caption = 'Gerar Parcelas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnGerarOMsClick
      Glyph.Data = {
        9E020000424D9E0200000000000036000000280000000E0000000E0000000100
        18000000000068020000C40E0000C40E00000000000000000000808080000000
        000000000000000000000000000000000000000000000000000000000000BFBF
        BFBFBFBF000080808080FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FF
        FF80FFFF80FFFF000000BFBFBFBFBFBF000080808080FFFF80FFFF80FFFF80FF
        FF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF000000BFBFBFBFBFBF00008080
        8080FFFF80FFFF80FFFF80FFFF80FFFFC0C0C000000000000080FFFF80FFFF00
        0000BFBFBFBFBFBF000080808080FFFF80FFFF80FFFF80FFFF80808000000000
        000000000080FFFF80FFFF000000BFBFBFBFBFBF000080808080FFFF80FFFF80
        FFFF80808000000000000000000000000000000080FFFF000000BFBFBFBFBFBF
        000080808080FFFF80FFFF80FFFF00000000000000000080FFFF000000000000
        80FFFF808080BFBFBFBFBFBF000080808080FFFF80FFFF80FFFF000000000000
        80FFFF80FFFF80FFFF000000000000BFBFBFBFBFBFBFBFBF000080808080FFFF
        80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF000000000000BFBFBFBFBF
        BFBFBFBF000080808080FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FF
        FF80FFFF000000000000BFBFBFBFBFBF000080808080FFFF80FFFF80FFFF80FF
        FF80FFFF80FFFF80FFFF808080808080C0C0C0000000000000BFBFBF00008080
        8080FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80808080FFFF808080BF
        BFBF000000000000000080808080FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80
        FFFF808080808080BFBFBFBFBFBFBFBFBFBFBFBF000080808080808080808080
        8080808080808080808080808080808080BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        0000}
    end
    object gbPeriodo: TGroupBox
      Left = 1
      Top = 121
      Width = 143
      Height = 44
      Align = alTop
      Caption = 'Periodo'
      TabOrder = 3
      object pnPeriodo: TPanel
        Left = 2
        Top = 15
        Width = 139
        Height = 27
        Align = alClient
        Caption = 'pnPeriodo'
        TabOrder = 0
      end
    end
  end
  object pmLocalizar: TPopupMenu
    Left = 688
    Top = 10
    object Credor1: TMenuItem
      Caption = 'Credor'
      OnClick = Credor1Click
    end
    object Devedor1: TMenuItem
      Caption = 'Devedor'
      OnClick = Devedor1Click
    end
    object Documento1: TMenuItem
      Caption = 'Documento'
      OnClick = Documento1Click
    end
    object Valor1: TMenuItem
      Caption = 'Valor'
      OnClick = Valor1Click
    end
  end
  object RLBTitulo1: TRLBTitulo
    PrintDialog = True
    TipoOcorrencia = toRemessaRegistrar
    LocalPagamento = 'PAG'#193'VEL EM QUALQUER BANCO AT'#201' O VENCIMENTO'
    Cedente.TipoInscricao = tiPessoaFisica
    Sacado.TipoInscricao = tiPessoaFisica
    AceiteDocumento = adNao
    EspecieDocumento = edDuplicataMercantil
    EmissaoBoleto = ebClienteEmite
    LayoutNN = lnN11
    Versao = '1.1.5'
    Left = 794
    Top = 11
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 'FortesReport v0.6 \251 1999-2007 GPL'
    ViewerOptions = []
    FontEncoding = feNoEncoding
    DisplayName = 'Documento PDF'
    Left = 832
    Top = 8
  end
end
