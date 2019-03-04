object frmCobranca: TfrmCobranca
  Left = 259
  Top = 139
  BorderStyle = bsSingle
  Caption = 'Cobran'#231'a'
  ClientHeight = 596
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTela: TPanel
    Left = 0
    Top = 193
    Width = 921
    Height = 341
    Align = alClient
    Color = clSilver
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    object gbItens: TGroupBox
      Left = 1
      Top = 1
      Width = 919
      Height = 104
      Align = alTop
      Caption = 'Itens'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        919
        104)
      object btnDeletarItem: TBitBtn
        Left = 817
        Top = 67
        Width = 30
        Height = 30
        Cursor = crHandPoint
        Hint = 'Remove o item da lista'
        Anchors = [akRight, akBottom]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = btnDeletarItemClick
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
        Left = 849
        Top = 67
        Width = 30
        Height = 30
        Cursor = crHandPoint
        Hint = 'Edita o item selecionado'
        Anchors = [akRight, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
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
        Left = 881
        Top = 67
        Width = 30
        Height = 30
        Cursor = crHandPoint
        Hint = 'Configura a lista dos itens dos romaneios'
        Anchors = [akRight, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
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
      object gbAlines: TGroupBox
        Left = 500
        Top = 59
        Width = 229
        Height = 38
        Caption = 'Alines'
        TabOrder = 8
        object pnAlines: TPanel
          Left = 2
          Top = 15
          Width = 55
          Height = 21
          Align = alLeft
          Caption = 'pnAlines'
          TabOrder = 0
        end
        object pnDescAlines: TPanel
          Left = 64
          Top = 15
          Width = 163
          Height = 21
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object gbBanco: TGroupBox
        Left = 4
        Top = 58
        Width = 237
        Height = 40
        Caption = 'Banco'
        TabOrder = 6
        object pnBanco: TPanel
          Left = 2
          Top = 15
          Width = 50
          Height = 23
          Align = alLeft
          Caption = 'pnBanco'
          TabOrder = 0
        end
        object pnDescBanco: TPanel
          Left = 56
          Top = 15
          Width = 179
          Height = 23
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object gbData_Divida: TGroupBox
        Left = 177
        Top = 16
        Width = 105
        Height = 38
        Caption = 'Data Divida'
        TabOrder = 2
        object dtDataDivida: TDateTimePicker
          Left = 4
          Top = 13
          Width = 97
          Height = 21
          Date = 40251.000000000000000000
          Time = 40251.000000000000000000
          TabOrder = 0
        end
      end
      object gbEmissaoDocumento: TGroupBox
        Left = 71
        Top = 16
        Width = 105
        Height = 38
        Caption = 'Emissao'
        TabOrder = 1
        object dtEmissaoItem: TDateTimePicker
          Left = 4
          Top = 13
          Width = 96
          Height = 21
          Date = 40251.000000000000000000
          Time = 40251.000000000000000000
          TabOrder = 0
        end
      end
      object gbItem: TGroupBox
        Left = 4
        Top = 16
        Width = 64
        Height = 38
        Caption = 'Item'
        TabOrder = 0
        object pnItem: TPanel
          Left = 6
          Top = 14
          Width = 54
          Height = 21
          BevelOuter = bvNone
          TabOrder = 0
        end
      end
      object gbNumeroDocumento: TGroupBox
        Left = 397
        Top = 16
        Width = 118
        Height = 38
        Caption = 'Numero'
        TabOrder = 4
        object edNumeroDocumento: TEdit
          Left = 2
          Top = 14
          Width = 111
          Height = 21
          TabOrder = 0
        end
      end
      object gbTipoDocumento: TGroupBox
        Left = 241
        Top = 58
        Width = 256
        Height = 39
        Caption = 'Tipo'
        TabOrder = 7
        object pnTipo: TPanel
          Left = 2
          Top = 15
          Width = 47
          Height = 22
          Align = alLeft
          Caption = 'pnTipo'
          TabOrder = 0
        end
        object pnDescTipo: TPanel
          Left = 56
          Top = 15
          Width = 198
          Height = 22
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object gbValorDocumento: TGroupBox
        Left = 517
        Top = 16
        Width = 148
        Height = 38
        Caption = 'Valor'
        TabOrder = 5
        object pnValorItem: TPanel
          Left = 2
          Top = 15
          Width = 144
          Height = 21
          Align = alClient
          Caption = 'pnValorItem'
          TabOrder = 0
        end
      end
      object gbVencimento: TGroupBox
        Left = 284
        Top = 16
        Width = 110
        Height = 39
        Caption = 'Vencimento'
        TabOrder = 3
        object dtDataVencimento: TDateTimePicker
          Left = 4
          Top = 14
          Width = 97
          Height = 21
          Date = 40251.000000000000000000
          Time = 40251.000000000000000000
          TabOrder = 0
        end
      end
      object btnAdicionarItem: TBitBtn
        Left = 783
        Top = 67
        Width = 30
        Height = 30
        Hint = 'ADICIONA A NATUREZA DE OPERA'#199#195'O INFORMADA'
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
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
    end
    object pnListView: TPanel
      Left = 1
      Top = 105
      Width = 919
      Height = 235
      Align = alClient
      Caption = 'pnListView'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnCabecalho: TPanel
    Left = 0
    Top = 41
    Width = 921
    Height = 152
    Align = alTop
    Color = clSilver
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object gbCabecalho: TGroupBox
      Left = 1
      Top = 1
      Width = 919
      Height = 150
      Align = alClient
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object gbValorCorrigido: TGroupBox
        Left = 801
        Top = 104
        Width = 109
        Height = 40
        Caption = 'Valor Corrigido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object pnValorCor: TPanel
          Left = 2
          Top = 15
          Width = 105
          Height = 23
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnValorCor'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object gbValor: TGroupBox
        Left = 683
        Top = 104
        Width = 113
        Height = 40
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object pnValor: TPanel
          Left = 2
          Top = 15
          Width = 109
          Height = 23
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnValor'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object gbData: TGroupBox
        Left = 684
        Top = 56
        Width = 113
        Height = 40
        Caption = 'Data'
        TabOrder = 3
        object DTDATA_CADASTRO: TDateTimePicker
          Left = 9
          Top = 16
          Width = 99
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          Date = 39179.000000000000000000
          Time = 39179.000000000000000000
          Color = 13565951
          TabOrder = 0
        end
      end
      object gbCredor: TGroupBox
        Left = 4
        Top = 104
        Width = 673
        Height = 40
        Caption = 'Credor'
        TabOrder = 2
        object pnCredor: TPanel
          Left = 2
          Top = 15
          Width = 100
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'pnCredor'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
        object edNomeCredor: TEdit
          Left = 110
          Top = 15
          Width = 553
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
      end
      object gbDevedor: TGroupBox
        Left = 4
        Top = 56
        Width = 673
        Height = 40
        Caption = 'Devedor'
        TabOrder = 1
        object pnDevedor: TPanel
          Left = 2
          Top = 15
          Width = 100
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'pnDevedor'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
        object edNomeDevedor: TEdit
          Left = 109
          Top = 15
          Width = 553
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
      end
      object gbCobranca: TGroupBox
        Left = 4
        Top = 13
        Width = 408
        Height = 40
        Caption = 'Cobran'#231'a'
        TabOrder = 0
        object pnCobranca: TPanel
          Left = 2
          Top = 15
          Width = 100
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'pnCobranca'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
        end
        object pnTipoSituacao: TPanel
          Left = 165
          Top = 15
          Width = 241
          Height = 23
          Align = alRight
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 534
    Width = 921
    Height = 62
    Align = alBottom
    Color = clWhite
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 3
    object gbRodape: TGroupBox
      Left = 1
      Top = 1
      Width = 919
      Height = 60
      Align = alClient
      TabOrder = 0
      DesignSize = (
        919
        60)
      object btnExcluir: TBitBtn
        Left = 624
        Top = 10
        Width = 95
        Height = 47
        Anchors = [akRight, akBottom]
        Caption = 'Excluir'
        TabOrder = 1
        OnClick = btnExcluirClick
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
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object btnSair: TBitBtn
        Left = 820
        Top = 10
        Width = 95
        Height = 47
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
        TabOrder = 3
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
      object btnLimpar: TBitBtn
        Left = 723
        Top = 10
        Width = 95
        Height = 47
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
        TabOrder = 2
        OnClick = btnLimparClick
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
      object btnGrava: TBitBtn
        Left = 527
        Top = 10
        Width = 95
        Height = 47
        Cursor = crHandPoint
        Hint = 'Grava a nota fiscal'
        Anchors = [akRight, akBottom]
        Caption = '&Gravar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnGravaClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
          2222220000000000000220330000008803022033000000880302203300000088
          0302203300000000030220333333333333022033000000003302203088888888
          0302203088888888030220308888888803022030888888880302203088888888
          0002203088888888080220000000000000022222222222222222}
        Layout = blGlyphTop
      end
      object btnAlterar: TBitBtn
        Left = 430
        Top = 10
        Width = 95
        Height = 47
        Anchors = [akTop, akRight]
        Caption = 'Alterar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnAlterarClick
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
        Layout = blGlyphTop
      end
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 41
    Align = alTop
    Color = clGray
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object Shape1: TShape
      Left = 1
      Top = 1
      Width = 919
      Height = 39
      Align = alClient
      Pen.Color = clGray
      Shape = stRoundRect
    end
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 919
      Height = 39
      Align = alClient
      Alignment = taCenter
      Caption = 'Cobran'#231'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
  end
end
