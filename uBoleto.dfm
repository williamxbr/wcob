object FrmBoleto: TFrmBoleto
  Left = 542
  Top = 169
  Width = 621
  Height = 518
  Caption = 'Demonstra'#231#227'o FreeBoleto'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel2: TBevel
    Left = 264
    Top = 104
    Width = 225
    Height = 33
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 12
    Top = 104
    Width = 237
    Height = 33
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 48
    Top = 17
    Width = 35
    Height = 15
    Caption = 'Banco'
  end
  object Label2: TLabel
    Left = 140
    Top = 17
    Width = 93
    Height = 15
    Caption = 'C'#243'digo Cedente:'
  end
  object Agencia: TLabel
    Left = 36
    Top = 81
    Width = 44
    Height = 15
    Caption = 'Agencia'
  end
  object Label3: TLabel
    Left = 16
    Top = 48
    Width = 65
    Height = 15
    Caption = 'Vencimento'
  end
  object Label4: TLabel
    Left = 204
    Top = 48
    Width = 28
    Height = 15
    Caption = 'Valor'
  end
  object Label5: TLabel
    Left = 316
    Top = 48
    Width = 82
    Height = 15
    Caption = 'NossoNumero'
  end
  object Label6: TLabel
    Left = 144
    Top = 81
    Width = 84
    Height = 15
    Caption = 'Conta Corrente'
  end
  object Label7: TLabel
    Left = 364
    Top = 81
    Width = 32
    Height = 15
    Caption = 'Digito'
  end
  object Label8: TLabel
    Left = 352
    Top = 17
    Width = 44
    Height = 15
    Caption = 'Carteira'
  end
  object Label9: TLabel
    Left = 20
    Top = 116
    Width = 103
    Height = 15
    Caption = 'Modalidade Conta:'
  end
  object Label10: TLabel
    Left = 171
    Top = 116
    Width = 67
    Height = 15
    Caption = '(Banco 151)'
  end
  object Label11: TLabel
    Left = 16
    Top = 152
    Width = 101
    Height = 15
    Caption = 'Nome do Cedente'
  end
  object Label12: TLabel
    Left = 16
    Top = 179
    Width = 50
    Height = 15
    Caption = 'Emiss'#227'o'
  end
  object Label13: TLabel
    Left = 172
    Top = 179
    Width = 67
    Height = 15
    Caption = 'Documento:'
  end
  object Label21: TLabel
    Left = 272
    Top = 116
    Width = 55
    Height = 15
    Caption = 'Conv'#234'nio:'
  end
  object Label22: TLabel
    Left = 415
    Top = 116
    Width = 67
    Height = 15
    Caption = '(Banco 001)'
  end
  object Button1: TButton
    Left = 496
    Top = 9
    Width = 109
    Height = 30
    Caption = 'Gerar Dados'
    TabOrder = 10
    OnClick = Button1Click
  end
  object edBanco: TEdit
    Left = 88
    Top = 9
    Width = 41
    Height = 23
    Color = 8421631
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = '033'
  end
  object edCodCedente: TEdit
    Left = 236
    Top = 9
    Width = 97
    Height = 23
    Color = 9830399
    TabOrder = 1
    Text = '14813026478'
  end
  object edAgencia: TEdit
    Left = 88
    Top = 73
    Width = 49
    Height = 23
    Color = 8421631
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = '0148'
  end
  object dtpVencimento: TDateTimePicker
    Left = 88
    Top = 40
    Width = 89
    Height = 23
    Date = 38430.389601956020000000
    Time = 38430.389601956020000000
    Color = 8421631
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object edValor: TEdit
    Left = 236
    Top = 40
    Width = 69
    Height = 23
    Color = 8421631
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = '103,58'
  end
  object edNNum: TEdit
    Left = 404
    Top = 40
    Width = 81
    Height = 23
    Color = 8421631
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = '4952'
  end
  object Memo1: TMemo
    Left = 12
    Top = 304
    Width = 573
    Height = 93
    TabOrder = 11
  end
  object edContaCorrente: TEdit
    Left = 236
    Top = 73
    Width = 89
    Height = 23
    Color = 9830399
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object edDigitoCC: TEdit
    Left = 404
    Top = 73
    Width = 25
    Height = 23
    Color = 9830399
    TabOrder = 8
  end
  object edCarteira: TEdit
    Left = 404
    Top = 9
    Width = 57
    Height = 23
    Color = 9830399
    TabOrder = 2
  end
  object edModeloCarteira: TEdit
    Left = 127
    Top = 108
    Width = 37
    Height = 23
    Hint = 'Obrigat'#243'rio para o Banco NossaCaixa (151)'
    Color = 9830399
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object edNomeCede: TEdit
    Left = 124
    Top = 144
    Width = 365
    Height = 23
    TabOrder = 12
    Text = 'Jos'#233' Jo'#227'o'
  end
  object dtpEmissao: TDateTimePicker
    Left = 76
    Top = 171
    Width = 89
    Height = 23
    Date = 38353.389601956020000000
    Time = 38353.389601956020000000
    TabOrder = 13
  end
  object edDocumento: TEdit
    Left = 248
    Top = 171
    Width = 121
    Height = 23
    TabOrder = 14
    Text = '0123456789'
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 196
    Width = 577
    Height = 105
    Caption = ' Sacado '
    TabOrder = 15
    object Label14: TLabel
      Left = 16
      Top = 24
      Width = 34
      Height = 15
      Caption = 'Nome'
    end
    object Label15: TLabel
      Left = 260
      Top = 24
      Width = 53
      Height = 15
      Caption = 'Endere'#231'o'
    end
    object Label16: TLabel
      Left = 24
      Top = 52
      Width = 33
      Height = 15
      Caption = 'Bairro'
    end
    object Label17: TLabel
      Left = 440
      Top = 52
      Width = 23
      Height = 15
      Caption = 'Cep'
    end
    object Label18: TLabel
      Left = 372
      Top = 52
      Width = 16
      Height = 15
      Caption = 'UF'
    end
    object Label19: TLabel
      Left = 196
      Top = 52
      Width = 40
      Height = 15
      Caption = 'Cidade'
    end
    object Label20: TLabel
      Left = 24
      Top = 80
      Width = 59
      Height = 15
      Caption = 'CNPJ/CPF'
    end
    object edSacado: TEdit
      Left = 68
      Top = 16
      Width = 181
      Height = 23
      Color = 8421631
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Manoel Joaquim'
    end
    object edEndereco: TEdit
      Left = 316
      Top = 16
      Width = 241
      Height = 23
      TabOrder = 1
      Text = 'Rua Governador, 1000'
    end
    object edUF: TEdit
      Left = 396
      Top = 44
      Width = 33
      Height = 23
      TabOrder = 4
      Text = 'SP'
    end
    object edBairro: TEdit
      Left = 68
      Top = 44
      Width = 117
      Height = 23
      TabOrder = 2
      Text = 'Centro'
    end
    object edCidade: TEdit
      Left = 240
      Top = 44
      Width = 121
      Height = 23
      TabOrder = 3
      Text = 'S'#227'o Paulo'
    end
    object edCep: TEdit
      Left = 468
      Top = 44
      Width = 89
      Height = 23
      TabOrder = 5
      Text = '01000-000'
    end
    object edCNPJ: TEdit
      Left = 88
      Top = 72
      Width = 153
      Height = 23
      TabOrder = 6
      Text = '00.000.000/0000-00'
    end
  end
  object GroupBox2: TGroupBox
    Left = 12
    Top = 400
    Width = 573
    Height = 53
    Caption = ' Preview '
    TabOrder = 16
    object Button3: TButton
      Left = 12
      Top = 16
      Width = 135
      Height = 25
      Caption = 'Adicionar Boleto'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 156
      Top = 16
      Width = 135
      Height = 25
      Caption = 'Preview de Boletos'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 300
      Top = 16
      Width = 135
      Height = 25
      Caption = 'Limpar Lista'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object Button5: TButton
    Left = 496
    Top = 53
    Width = 109
    Height = 30
    Caption = 'Gerar && adicionar'
    TabOrder = 17
    OnClick = Button5Click
  end
  object edConvenio: TEdit
    Left = 331
    Top = 108
    Width = 70
    Height = 23
    Hint = 'Obrigat'#243'rio para o Banco NossaCaixa (151)'
    Color = 9830399
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
end
