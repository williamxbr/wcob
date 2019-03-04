object Form1: TForm1
  Left = 243
  Top = 214
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'C'#225'lculos Financeiros - CRM Desenvolvimentos'
  ClientHeight = 383
  ClientWidth = 589
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TELA: TNotebook
    Left = 0
    Top = 0
    Width = 589
    Height = 383
    Align = alClient
    PageIndex = 3
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Inicial'
      object Label2: TLabel
        Left = 128
        Top = 96
        Width = 320
        Height = 32
        Caption = 'C'#225'lculos Financeiros:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 8
        Top = 346
        Width = 172
        Height = 16
        Caption = 'Programador : C'#233'lio Roberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 88
        Top = 144
        Width = 409
        Height = 81
        Caption = 'Fun'#231#245'es de C'#225'lculos'
        TabOrder = 0
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Desconto'
      object Label7: TLabel
        Left = 168
        Top = 8
        Width = 240
        Height = 29
        Caption = 'Calcular Desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 40
        Width = 577
        Height = 137
        Caption = 'Valores para C'#225'lculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 16
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 64
          Width = 125
          Height = 16
          Caption = 'Data de Vencimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 104
          Width = 124
          Height = 16
          Caption = 'Data de Pagamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 352
          Top = 24
          Width = 81
          Height = 16
          Caption = 'Taxa Mensal:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 504
          Top = 24
          Width = 26
          Height = 16
          Caption = '( % )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton2: TSpeedButton
          Left = 543
          Top = 8
          Width = 31
          Height = 23
          Cursor = crHandPoint
          Hint = 'Exibir Calculadora'
          Flat = True
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9945179945179945179945
            1799451799451799451799451799451799451799451799451799451799451799
            4517994517994517994517994517994517994517994517FF00FFAD6800E9A34E
            FFB669FFB15EFFAD55FFAA4BFFA541FFA138FF9E30FF9A28FF961FFF9218FF8F
            11FF8A0BFF8706FF8301FF8100FF8100FF8100FF8100FF8100FF8100E5720499
            4517BF790EFFBC79FFB76FEEA95FBF874ADE9749FFA747FFA43EDE8E32BF7829
            DE8723FF951CFF9015FF8C0FFF8909FF8403FF8201FF8100FF8100FF8100FF81
            00FF8100FF8100994517C68114FFBD7FCE99641F1F211F1F211F1F21916737CE
            893D1F1F211F1F211F1F21BF751FFF92192A25201F1F211F1F211F1F211F1F21
            1F1F211F1F212A241FDE7403FF8100994517C98314FFBF81FFBC7B916E4B8263
            4182603DEEA14EEE9F46916532825A2C916028EE9025FF951C915A1C82521882
            5015824E11824D0E824C0D824C0D91520CFF8100FF8100994517CB8614FFBF81
            FFBF80DEA46ABF8C5ACE9254FFAF57FFAB4ECE893DBF7E34CE832EFF9A2AFF97
            22C07D3AAD6F41C1742DFF8807FF8302C16C1CAD6629C16C1CFF8100FF810099
            4517CE8814FFBF81CE9D6D1F1F211F1F211F1F21916A40BF84461F1F211F1F21
            1F1F21AF722C88666D001EFF001EFF001EFFAD6B3676545D001EFF001EFF001E
            FFC16C1CFF8100994517D08A14FFBF81FFBF819F7B5982664A916D4AEEA95FFF
            B05A9F703E825D339F6C32EE9632EA923588656A66548188605DFF8C0DEA8111
            76535A664C67885845FF8100FF8100994517D38C14FFBF81FFBF81CE9D6D9170
            51BF8C5AFFB669FFB15EBF8446825D35C07D3AFFA138FF9E30AD7654665481AD
            7045FF8F11FF8A0BAD6931664C67AD6629FF8100FF8100994517D58F14FFBF81
            C093681F1F211F1F211F1F21826444BF8A531F1F211F1F211F1F219F6C32886A
            79001EFF001EFF001EFFAD6F41885E58001EFF001EFF001EFFAD6629FF810099
            4517D89114FFBF81FFBF81CE9D6D82674DAF865EFFBA75FFB66AAF7F4B825F3B
            AF793FFFA643FFA1389A7269665689AD754EFF9219FF8F129A6547664E6EAD67
            2DFF8100FF8100994517DA9314FFBF81FFBF81FFBF81FFBF81FFBF81FFBC7BFF
            B870FFB465FFB05CFFAC52FFA948FFA43EFFA137FF9D2DFF9925FF951EFF9116
            FF8E0FFF8909FF8605FF8201FF8100994517DD9614FFBF81FFC487FFCF9FFFCF
            9FFFCF9FFFCE9DFFCA92FFCA92FFC487FFC27DFFBF75FFBC6CFFB259FF9F33FF
            9A2AFF9722FF931AFF8F13FF8B0DFF8807FF8403FF8100994517E09814FFBF81
            C0936876D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8
            CCD5DCBBFFA137DE8B2DCE7F26BF751FBF721ABF6E14CE740EFF8605FF820199
            4517E29914FFBF81AD82584FCBBC4FCBBC4FCBBC4FCBBC4FCBBC4FCBBC4FCBBC
            4FCBBC4FCBBC4FCBBCD5DCBBFFA33CAF722C9F6828915D229F641D82531BBF6D
            12FF8808FF8403994517E0970EFFBF81EAAF76AD8258AD8258AD8258AD8258AD
            8258AD8156AD7F4FAD7B48AD7941AD763AEAA658FFA541EE9837EE952EFF9A28
            DE8620BF721AFF8F11FF8A0BFF8706994517D98E00F8B562FFBF81FFBF81FFBF
            81FFBF81FFBF81FFBF81FFBF81FFBC79FFB76FFFB465FFB05AFFAC52FFA747FF
            A43EFFA035FF9D2DFF9824FF951CFF9015FF8C0FE2790A904B11FF00FFDC9103
            E79F23EBA534E9A334E9A334E5A034E29E34E29E34DE9A32DC952CDC952CD88E
            24D88E24D5881ED3831AD18016D07D13CF7910CC760DCB730DB6650B95500CFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object MaskEdit1: TMaskEdit
          Left = 144
          Top = 56
          Width = 113
          Height = 26
          EditMask = '##/##/####;1;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 2
          Text = '  /  /    '
          OnKeyDown = ValorDKeyDown
        end
        object MaskEdit2: TMaskEdit
          Left = 144
          Top = 96
          Width = 113
          Height = 26
          EditMask = '##/##/####;1;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
          OnExit = MaskEdit2Exit
          OnKeyDown = ValorDKeyDown
        end
        object TaxaD: TEdit
          Left = 440
          Top = 16
          Width = 57
          Height = 26
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyDown = ValorDKeyDown
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 184
        Width = 577
        Height = 169
        Caption = 'Resultados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object GroupBox4: TGroupBox
          Left = 8
          Top = 24
          Width = 273
          Height = 137
          Caption = 'Desconto Composto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label6: TLabel
            Left = 8
            Top = 24
            Width = 31
            Height = 16
            Caption = 'Dias:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 8
            Top = 64
            Width = 61
            Height = 16
            Caption = 'Desconto:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 8
            Top = 104
            Width = 68
            Height = 16
            Caption = 'Valor Atual:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DiasC: TLabel
            Left = 88
            Top = 24
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DescontoC: TLabel
            Left = 88
            Top = 64
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object ValorC: TLabel
            Left = 88
            Top = 104
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox5: TGroupBox
          Left = 296
          Top = 24
          Width = 273
          Height = 137
          Caption = 'Desconto Simples'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label13: TLabel
            Left = 8
            Top = 24
            Width = 31
            Height = 16
            Caption = 'Dias:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DiasS: TLabel
            Left = 88
            Top = 24
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 8
            Top = 64
            Width = 61
            Height = 16
            Caption = 'Desconto:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DescontoS: TLabel
            Left = 88
            Top = 64
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 8
            Top = 104
            Width = 68
            Height = 16
            Caption = 'Valor Atual:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object ValorS: TLabel
            Left = 88
            Top = 104
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Acrescimo'
      object Label11: TLabel
        Left = 192
        Top = 8
        Width = 188
        Height = 29
        Caption = 'Calcular Juros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 40
        Width = 577
        Height = 137
        Caption = 'Valores para C'#225'lculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label12: TLabel
          Left = 8
          Top = 24
          Width = 35
          Height = 16
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 8
          Top = 64
          Width = 125
          Height = 16
          Caption = 'Data de Vencimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 8
          Top = 104
          Width = 124
          Height = 16
          Caption = 'Data de Pagamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 360
          Top = 24
          Width = 81
          Height = 16
          Caption = 'Taxa Mensal:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 512
          Top = 24
          Width = 26
          Height = 16
          Caption = '( % )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 543
          Top = 8
          Width = 31
          Height = 23
          Cursor = crHandPoint
          Hint = 'Exibir Calculadora'
          Flat = True
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9945179945179945179945
            1799451799451799451799451799451799451799451799451799451799451799
            4517994517994517994517994517994517994517994517FF00FFAD6800E9A34E
            FFB669FFB15EFFAD55FFAA4BFFA541FFA138FF9E30FF9A28FF961FFF9218FF8F
            11FF8A0BFF8706FF8301FF8100FF8100FF8100FF8100FF8100FF8100E5720499
            4517BF790EFFBC79FFB76FEEA95FBF874ADE9749FFA747FFA43EDE8E32BF7829
            DE8723FF951CFF9015FF8C0FFF8909FF8403FF8201FF8100FF8100FF8100FF81
            00FF8100FF8100994517C68114FFBD7FCE99641F1F211F1F211F1F21916737CE
            893D1F1F211F1F211F1F21BF751FFF92192A25201F1F211F1F211F1F211F1F21
            1F1F211F1F212A241FDE7403FF8100994517C98314FFBF81FFBC7B916E4B8263
            4182603DEEA14EEE9F46916532825A2C916028EE9025FF951C915A1C82521882
            5015824E11824D0E824C0D824C0D91520CFF8100FF8100994517CB8614FFBF81
            FFBF80DEA46ABF8C5ACE9254FFAF57FFAB4ECE893DBF7E34CE832EFF9A2AFF97
            22C07D3AAD6F41C1742DFF8807FF8302C16C1CAD6629C16C1CFF8100FF810099
            4517CE8814FFBF81CE9D6D1F1F211F1F211F1F21916A40BF84461F1F211F1F21
            1F1F21AF722C88666D001EFF001EFF001EFFAD6B3676545D001EFF001EFF001E
            FFC16C1CFF8100994517D08A14FFBF81FFBF819F7B5982664A916D4AEEA95FFF
            B05A9F703E825D339F6C32EE9632EA923588656A66548188605DFF8C0DEA8111
            76535A664C67885845FF8100FF8100994517D38C14FFBF81FFBF81CE9D6D9170
            51BF8C5AFFB669FFB15EBF8446825D35C07D3AFFA138FF9E30AD7654665481AD
            7045FF8F11FF8A0BAD6931664C67AD6629FF8100FF8100994517D58F14FFBF81
            C093681F1F211F1F211F1F21826444BF8A531F1F211F1F211F1F219F6C32886A
            79001EFF001EFF001EFFAD6F41885E58001EFF001EFF001EFFAD6629FF810099
            4517D89114FFBF81FFBF81CE9D6D82674DAF865EFFBA75FFB66AAF7F4B825F3B
            AF793FFFA643FFA1389A7269665689AD754EFF9219FF8F129A6547664E6EAD67
            2DFF8100FF8100994517DA9314FFBF81FFBF81FFBF81FFBF81FFBF81FFBC7BFF
            B870FFB465FFB05CFFAC52FFA948FFA43EFFA137FF9D2DFF9925FF951EFF9116
            FF8E0FFF8909FF8605FF8201FF8100994517DD9614FFBF81FFC487FFCF9FFFCF
            9FFFCF9FFFCE9DFFCA92FFCA92FFC487FFC27DFFBF75FFBC6CFFB259FF9F33FF
            9A2AFF9722FF931AFF8F13FF8B0DFF8807FF8403FF8100994517E09814FFBF81
            C0936876D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8
            CCD5DCBBFFA137DE8B2DCE7F26BF751FBF721ABF6E14CE740EFF8605FF820199
            4517E29914FFBF81AD82584FCBBC4FCBBC4FCBBC4FCBBC4FCBBC4FCBBC4FCBBC
            4FCBBC4FCBBC4FCBBCD5DCBBFFA33CAF722C9F6828915D229F641D82531BBF6D
            12FF8808FF8403994517E0970EFFBF81EAAF76AD8258AD8258AD8258AD8258AD
            8258AD8156AD7F4FAD7B48AD7941AD763AEAA658FFA541EE9837EE952EFF9A28
            DE8620BF721AFF8F11FF8A0BFF8706994517D98E00F8B562FFBF81FFBF81FFBF
            81FFBF81FFBF81FFBF81FFBF81FFBC79FFB76FFFB465FFB05AFFAC52FFA747FF
            A43EFFA035FF9D2DFF9824FF951CFF9015FF8C0FE2790A904B11FF00FFDC9103
            E79F23EBA534E9A334E9A334E5A034E29E34E29E34DE9A32DC952CDC952CD88E
            24D88E24D5881ED3831AD18016D07D13CF7910CC760DCB730DB6650B95500CFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object VencimentoJ: TMaskEdit
          Left = 144
          Top = 56
          Width = 113
          Height = 26
          EditMask = '##/##/####;1;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 2
          Text = '  /  /    '
          OnKeyDown = ValorJKeyDown
        end
        object PagamentoJ: TMaskEdit
          Left = 144
          Top = 96
          Width = 113
          Height = 26
          EditMask = '##/##/####;1;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
          OnExit = PagamentoJExit
          OnKeyDown = ValorJKeyDown
        end
        object TaxaJ: TEdit
          Left = 448
          Top = 16
          Width = 57
          Height = 26
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyDown = ValorJKeyDown
        end
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 184
        Width = 577
        Height = 169
        Caption = 'Resultados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object GroupBox8: TGroupBox
          Left = 8
          Top = 24
          Width = 273
          Height = 137
          Caption = 'Juros Composto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label19: TLabel
            Left = 8
            Top = 24
            Width = 31
            Height = 16
            Caption = 'Dias:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label20: TLabel
            Left = 8
            Top = 64
            Width = 36
            Height = 16
            Caption = 'Juros:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label21: TLabel
            Left = 8
            Top = 104
            Width = 68
            Height = 16
            Caption = 'Valor Atual:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object JDiasC: TLabel
            Left = 88
            Top = 24
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object JDescontoC: TLabel
            Left = 88
            Top = 64
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object JvalorC: TLabel
            Left = 88
            Top = 104
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox9: TGroupBox
          Left = 296
          Top = 24
          Width = 273
          Height = 137
          Caption = 'Juros Simples'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label25: TLabel
            Left = 8
            Top = 24
            Width = 31
            Height = 16
            Caption = 'Dias:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object JDiasS: TLabel
            Left = 88
            Top = 24
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 8
            Top = 64
            Width = 36
            Height = 16
            Caption = 'Juros:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object JDescontoS: TLabel
            Left = 88
            Top = 64
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 8
            Top = 104
            Width = 68
            Height = 16
            Caption = 'Valor Atual:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object JValorS: TLabel
            Left = 88
            Top = 104
            Width = 6
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Prestacao'
      object Label24: TLabel
        Left = 168
        Top = 8
        Width = 263
        Height = 29
        Caption = 'Calcular Presta'#231#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox10: TGroupBox
        Left = 8
        Top = 40
        Width = 577
        Height = 137
        Caption = 'Valores para C'#225'lculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label26: TLabel
          Left = 8
          Top = 24
          Width = 105
          Height = 16
          Caption = 'Valor Financiado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 8
          Top = 64
          Width = 81
          Height = 16
          Caption = 'Taxa Mensal:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 192
          Top = 64
          Width = 26
          Height = 16
          Caption = '( % )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 8
          Top = 104
          Width = 88
          Height = 16
          Caption = 'Qt. Presta'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 543
          Top = 8
          Width = 31
          Height = 23
          Cursor = crHandPoint
          Hint = 'Exibir Calculadora'
          Flat = True
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9945179945179945179945
            1799451799451799451799451799451799451799451799451799451799451799
            4517994517994517994517994517994517994517994517FF00FFAD6800E9A34E
            FFB669FFB15EFFAD55FFAA4BFFA541FFA138FF9E30FF9A28FF961FFF9218FF8F
            11FF8A0BFF8706FF8301FF8100FF8100FF8100FF8100FF8100FF8100E5720499
            4517BF790EFFBC79FFB76FEEA95FBF874ADE9749FFA747FFA43EDE8E32BF7829
            DE8723FF951CFF9015FF8C0FFF8909FF8403FF8201FF8100FF8100FF8100FF81
            00FF8100FF8100994517C68114FFBD7FCE99641F1F211F1F211F1F21916737CE
            893D1F1F211F1F211F1F21BF751FFF92192A25201F1F211F1F211F1F211F1F21
            1F1F211F1F212A241FDE7403FF8100994517C98314FFBF81FFBC7B916E4B8263
            4182603DEEA14EEE9F46916532825A2C916028EE9025FF951C915A1C82521882
            5015824E11824D0E824C0D824C0D91520CFF8100FF8100994517CB8614FFBF81
            FFBF80DEA46ABF8C5ACE9254FFAF57FFAB4ECE893DBF7E34CE832EFF9A2AFF97
            22C07D3AAD6F41C1742DFF8807FF8302C16C1CAD6629C16C1CFF8100FF810099
            4517CE8814FFBF81CE9D6D1F1F211F1F211F1F21916A40BF84461F1F211F1F21
            1F1F21AF722C88666D001EFF001EFF001EFFAD6B3676545D001EFF001EFF001E
            FFC16C1CFF8100994517D08A14FFBF81FFBF819F7B5982664A916D4AEEA95FFF
            B05A9F703E825D339F6C32EE9632EA923588656A66548188605DFF8C0DEA8111
            76535A664C67885845FF8100FF8100994517D38C14FFBF81FFBF81CE9D6D9170
            51BF8C5AFFB669FFB15EBF8446825D35C07D3AFFA138FF9E30AD7654665481AD
            7045FF8F11FF8A0BAD6931664C67AD6629FF8100FF8100994517D58F14FFBF81
            C093681F1F211F1F211F1F21826444BF8A531F1F211F1F211F1F219F6C32886A
            79001EFF001EFF001EFFAD6F41885E58001EFF001EFF001EFFAD6629FF810099
            4517D89114FFBF81FFBF81CE9D6D82674DAF865EFFBA75FFB66AAF7F4B825F3B
            AF793FFFA643FFA1389A7269665689AD754EFF9219FF8F129A6547664E6EAD67
            2DFF8100FF8100994517DA9314FFBF81FFBF81FFBF81FFBF81FFBF81FFBC7BFF
            B870FFB465FFB05CFFAC52FFA948FFA43EFFA137FF9D2DFF9925FF951EFF9116
            FF8E0FFF8909FF8605FF8201FF8100994517DD9614FFBF81FFC487FFCF9FFFCF
            9FFFCF9FFFCE9DFFCA92FFCA92FFC487FFC27DFFBF75FFBC6CFFB259FF9F33FF
            9A2AFF9722FF931AFF8F13FF8B0DFF8807FF8403FF8100994517E09814FFBF81
            C0936876D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8CC76D8
            CCD5DCBBFFA137DE8B2DCE7F26BF751FBF721ABF6E14CE740EFF8605FF820199
            4517E29914FFBF81AD82584FCBBC4FCBBC4FCBBC4FCBBC4FCBBC4FCBBC4FCBBC
            4FCBBC4FCBBC4FCBBCD5DCBBFFA33CAF722C9F6828915D229F641D82531BBF6D
            12FF8808FF8403994517E0970EFFBF81EAAF76AD8258AD8258AD8258AD8258AD
            8258AD8156AD7F4FAD7B48AD7941AD763AEAA658FFA541EE9837EE952EFF9A28
            DE8620BF721AFF8F11FF8A0BFF8706994517D98E00F8B562FFBF81FFBF81FFBF
            81FFBF81FFBF81FFBF81FFBF81FFBC79FFB76FFFB465FFB05AFFAC52FFA747FF
            A43EFFA035FF9D2DFF9824FF951CFF9015FF8C0FE2790A904B11FF00FFDC9103
            E79F23EBA534E9A334E9A334E5A034E29E34E29E34DE9A32DC952CDC952CD88E
            24D88E24D5881ED3831AD18016D07D13CF7910CC760DCB730DB6650B95500CFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object TaxaP: TEdit
          Left = 120
          Top = 56
          Width = 65
          Height = 26
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnKeyDown = ValorJKeyDown
        end
        object Prestacao: TEdit
          Left = 120
          Top = 96
          Width = 65
          Height = 26
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyDown = PrestacaoKeyDown
        end
      end
      object GroupBox11: TGroupBox
        Left = 8
        Top = 184
        Width = 577
        Height = 169
        Caption = 'Resultados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object GroupBox12: TGroupBox
          Left = 8
          Top = 24
          Width = 561
          Height = 137
          Caption = 'Presta'#231#245'es com Juros Composto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label33: TLabel
            Left = 8
            Top = 24
            Width = 65
            Height = 16
            Caption = 'Presta'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label34: TLabel
            Left = 8
            Top = 64
            Width = 87
            Height = 16
            Caption = 'Juros a Pagar:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 8
            Top = 104
            Width = 67
            Height = 16
            Caption = 'Valor Final:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LPrestacaoC: TLabel
            Left = 104
            Top = 24
            Width = 101
            Height = 20
            Caption = '                    '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LJurosC: TLabel
            Left = 104
            Top = 64
            Width = 101
            Height = 20
            Caption = '                    '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LValorC: TLabel
            Left = 104
            Top = 104
            Width = 101
            Height = 20
            Caption = '                    '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Relatorio'
      object Memo: TRichEdit
        Left = 0
        Top = 0
        Width = 589
        Height = 383
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier'
        Font.Style = []
        Lines.Strings = (
          '')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object ActionList1: TActionList
    Left = 128
    Top = 8
    object Dias: TAction
      Caption = 'Dias'
      OnExecute = DiasExecute
    end
    object CalcDescontoS: TAction
      Caption = 'CalcDescontoS'
      OnExecute = CalcDescontoSExecute
    end
    object CalcDescontoC: TAction
      Caption = 'CalcDescontoC'
      OnExecute = CalcDescontoCExecute
    end
    object JurosS: TAction
      Caption = 'JurosS'
      OnExecute = JurosSExecute
    end
    object JurosC: TAction
      Caption = 'JurosC'
      OnExecute = JurosCExecute
    end
    object DiasJ: TAction
      Caption = 'DiasJ'
      OnExecute = DiasJExecute
    end
  end
  object Pop: TPopupMenu
    Left = 8
    Top = 8
    object ImprimirDescontoGeral1: TMenuItem
      Caption = 'Imprimir Desconto Geral'
      OnClick = ImprimirDescontoGeral1Click
    end
    object ImprimirDescontoSimples1: TMenuItem
      Caption = 'Imprimir Desconto Simples'
      OnClick = ImprimirDescontoSimples1Click
    end
    object ImprimirDescontoComposto1: TMenuItem
      Caption = 'Imprimir Desconto Composto'
      OnClick = ImprimirDescontoComposto1Click
    end
  end
  object PopJ: TPopupMenu
    Left = 48
    Top = 8
    object MenuItem1: TMenuItem
      Caption = 'Imprimir Juro Geral'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Imprimir Juro Simples'
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Caption = 'Imprimir Juro Composto'
      OnClick = MenuItem3Click
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 88
    Top = 12
  end
  object PopP: TPopupMenu
    Left = 448
    Top = 8
    object MenuItem6: TMenuItem
      Caption = 'Imprimir Presta'#231#227'o'
      OnClick = MenuItem6Click
    end
  end
end
