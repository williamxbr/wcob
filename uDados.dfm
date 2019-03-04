object Dados: TDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 656
  Width = 1170
  object Conexao: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 16
  end
  object TB_TIPO_DOCUMENTO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_TIPO_DOCUMENTOBeforePost
    TableName = 'TIPO_DOCUMENTO'
    Left = 312
    Top = 72
    object TB_TIPO_DOCUMENTOTIPO_DOCUMENTO: TSmallintField
      FieldName = 'TIPO_DOCUMENTO'
    end
    object TB_TIPO_DOCUMENTOSIGLA_DOCUMENTO: TWideStringField
      FieldName = 'SIGLA_DOCUMENTO'
      Size = 5
    end
    object TB_TIPO_DOCUMENTODESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
    end
    object TB_TIPO_DOCUMENTOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_TIPO_DOCUMENTODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_TIPO_DOCUMENTODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_TIPO_DOCUMENTOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
  end
  object TB_TIPO_SITUACAO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_TIPO_SITUACAOBeforePost
    TableName = 'TIPO_SITUACAO'
    Left = 312
    Top = 184
    object TB_TIPO_SITUACAOTIPO_SITUACAO: TWordField
      FieldName = 'TIPO_SITUACAO'
    end
    object TB_TIPO_SITUACAODESCRICAO_SITUACAO: TWideStringField
      FieldName = 'DESCRICAO_SITUACAO'
      Size = 30
    end
    object TB_TIPO_SITUACAOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_TIPO_SITUACAODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_TIPO_SITUACAODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_TIPO_SITUACAOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_TIPO_SITUACAOSITUACAO: TWordField
      FieldName = 'SITUACAO'
    end
  end
  object TB_USUARIO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_USUARIOBeforePost
    TableName = 'USUARIO'
    Left = 312
    Top = 296
    object TB_USUARIOID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object TB_USUARIOUSUARIO: TWideStringField
      FieldName = 'USUARIO'
      Size = 10
    end
    object TB_USUARIOSENHA: TWideStringField
      FieldName = 'SENHA'
      OnSetText = TB_USUARIOSENHASetText
      Size = 10
    end
    object TB_USUARIONOME: TWideStringField
      FieldName = 'NOME'
    end
    object TB_USUARIOTIPO_USUARIO: TBooleanField
      FieldName = 'TIPO_USUARIO'
    end
    object TB_USUARIOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_USUARIODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_USUARIODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_USUARIOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_USUARIOENDERECO_IP: TWideStringField
      FieldName = 'ENDERECO_IP'
      Size = 15
    end
    object TB_USUARIONOME_COMPUTADOR: TWideStringField
      FieldName = 'NOME_COMPUTADOR'
      Size = 30
    end
    object TB_USUARIOUSUARIO_REDE: TWideStringField
      FieldName = 'USUARIO_REDE'
      Size = 30
    end
    object TB_USUARIOUSUARIO_LOGADO: TBooleanField
      FieldName = 'USUARIO_LOGADO'
    end
  end
  object TB_DEVEDOR: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_DEVEDORBeforePost
    TableName = 'DEVEDOR'
    Left = 48
    Top = 456
    object TB_DEVEDORCODIGO_DEVEDOR: TAutoIncField
      FieldName = 'CODIGO_DEVEDOR'
      ReadOnly = True
    end
    object TB_DEVEDORNOME_DEVEDOR: TWideStringField
      FieldName = 'NOME_DEVEDOR'
      Size = 60
    end
    object TB_DEVEDORTIPO_DEVEDOR: TWordField
      FieldName = 'TIPO_DEVEDOR'
    end
    object TB_DEVEDORDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object TB_DEVEDORPROFISSAO: TWideStringField
      FieldName = 'PROFISSAO'
      Size = 15
    end
    object TB_DEVEDORRENDA: TFloatField
      FieldName = 'RENDA'
    end
    object TB_DEVEDORCARRO_MODELO: TWideStringField
      FieldName = 'CARRO_MODELO'
      Size = 15
    end
    object TB_DEVEDORPLACA: TWideStringField
      FieldName = 'PLACA'
      Size = 8
    end
    object TB_DEVEDORCNPJ_CPF: TWideStringField
      FieldName = 'CNPJ_CPF'
      OnValidate = TB_DEVEDORCNPJ_CPFValidate
      Size = 18
    end
    object TB_DEVEDOROBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object TB_DEVEDOREMPRESA: TWideStringField
      FieldName = 'EMPRESA'
    end
    object TB_DEVEDORFUNCAO: TWideStringField
      FieldName = 'FUNCAO'
    end
    object TB_DEVEDORNOME_PAI: TWideStringField
      FieldName = 'NOME_PAI'
      Size = 60
    end
    object TB_DEVEDORNOME_MAE: TWideStringField
      FieldName = 'NOME_MAE'
      Size = 60
    end
    object TB_DEVEDORESTADO_CIVIL: TWideStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 10
    end
    object TB_DEVEDORIDENTIDADE: TWideStringField
      FieldName = 'IDENTIDADE'
      Size = 15
    end
    object TB_DEVEDOREMAIL01: TWideStringField
      FieldName = 'EMAIL01'
      Size = 50
    end
    object TB_DEVEDOREMAIL02: TWideStringField
      FieldName = 'EMAIL02'
      Size = 50
    end
    object TB_DEVEDOREMAIL03: TWideStringField
      FieldName = 'EMAIL03'
      Size = 50
    end
    object TB_DEVEDORDESC_TIPO_DEVEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_TIPO_DEVEDOR'
      LookupDataSet = TB_TIPO_PESSOA
      LookupKeyFields = 'TIPO_PESSOA'
      LookupResultField = 'DESCRICAO_TIPO_PESSOA'
      KeyFields = 'TIPO_DEVEDOR'
      Lookup = True
    end
    object TB_DEVEDORUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_DEVEDORDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_DEVEDORDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_DEVEDORUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
      Size = 15
    end
    object TB_DEVEDORUSUARIO_CADASTRO: TWideStringField
      FieldName = 'USUARIO_CADASTRO'
      Size = 15
    end
    object TB_DEVEDORCODIGO_ALTERNATIVO: TWideStringField
      FieldName = 'CODIGO_ALTERNATIVO'
      Size = 30
    end
    object TB_DEVEDOREH_LOCALIZADO: TBooleanField
      FieldName = 'EH_LOCALIZADO'
    end
    object TB_DEVEDORENDERECO_PRINCIPAL: TIntegerField
      FieldName = 'ENDERECO_PRINCIPAL'
    end
    object TB_DEVEDORTELEFONE_PRINCIPAL: TIntegerField
      FieldName = 'TELEFONE_PRINCIPAL'
    end
  end
  object TB_PARAMETROS: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_PARAMETROSBeforePost
    TableName = 'PARAMETROS'
    Left = 176
    Top = 344
    object TB_PARAMETROSID: TIntegerField
      FieldName = 'ID'
    end
    object TB_PARAMETROSVERSAO_SISTEMA: TSmallintField
      FieldName = 'VERSAO_SISTEMA'
    end
    object TB_PARAMETROSULTIMO_NUM_RECIBO: TIntegerField
      FieldName = 'ULTIMO_NUM_RECIBO'
    end
    object TB_PARAMETROSJUROS_DEPRE: TFloatField
      FieldName = 'JUROS_DEPRE'
    end
    object TB_PARAMETROSIDCREDORPROPRIETARIO: TIntegerField
      FieldName = 'IDCREDORPROPRIETARIO'
    end
    object TB_PARAMETROSUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_PARAMETROSUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_PARAMETROSDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_PARAMETROSDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_PARAMETROSEMPRESA: TWordField
      FieldName = 'EMPRESA'
    end
    object TB_PARAMETROSNUMERO_SERIAL: TWideStringField
      FieldName = 'NUMERO_SERIAL'
      Size = 30
    end
  end
  object TB_TIPO_PESSOA: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_TIPO_PESSOABeforePost
    TableName = 'TIPO_PESSOA'
    Left = 312
    Top = 128
    object TB_TIPO_PESSOATIPO_PESSOA: TWordField
      FieldName = 'TIPO_PESSOA'
    end
    object TB_TIPO_PESSOADESCRICAO_TIPO_PESSOA: TWideStringField
      FieldName = 'DESCRICAO_TIPO_PESSOA'
      Size = 10
    end
    object TB_TIPO_PESSOAUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_TIPO_PESSOADATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_TIPO_PESSOADATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_TIPO_PESSOAUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
  end
  object TB_COBRANCA: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_COBRANCABeforePost
    TableName = 'COBRANCA'
    Left = 48
    Top = 312
    object TB_COBRANCACOBRANCA: TAutoIncField
      FieldName = 'COBRANCA'
      ReadOnly = True
    end
    object TB_COBRANCACREDOR: TIntegerField
      FieldName = 'CREDOR'
    end
    object TB_COBRANCADEVEDOR: TIntegerField
      FieldName = 'DEVEDOR'
    end
    object TB_COBRANCADATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object TB_COBRANCAFORMA_PAGAMENTO: TIntegerField
      FieldName = 'FORMA_PAGAMENTO'
    end
    object TB_COBRANCASITUACAO: TIntegerField
      FieldName = 'SITUACAO'
    end
    object TB_COBRANCACOBRADOR: TIntegerField
      FieldName = 'COBRADOR'
    end
    object TB_COBRANCAVALOR_DIVIDA: TFloatField
      FieldName = 'VALOR_DIVIDA'
      currency = True
    end
    object TB_COBRANCANOME_CREDOR: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'NOME_CREDOR'
      LookupDataSet = TB_CREDOR
      LookupKeyFields = 'CODIGO_CREDOR'
      LookupResultField = 'NOME_CREDOR'
      KeyFields = 'CREDOR'
      Size = 60
      Lookup = True
    end
    object TB_COBRANCANOME_DEVEDOR: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'NOME_DEVEDOR'
      LookupDataSet = TB_DEVEDOR
      LookupKeyFields = 'CODIGO_DEVEDOR'
      LookupResultField = 'NOME_DEVEDOR'
      KeyFields = 'DEVEDOR'
      Size = 60
      Lookup = True
    end
    object TB_COBRANCAUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_COBRANCADATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_COBRANCADATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_COBRANCAUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_COBRANCADATA_ENCERRAMENTO: TDateTimeField
      FieldName = 'DATA_ENCERRAMENTO'
    end
    object TB_COBRANCAMOTIVO_ENCERRAMENTO: TWideStringField
      FieldName = 'MOTIVO_ENCERRAMENTO'
      Size = 255
    end
    object TB_COBRANCADATA_DIVIDA: TDateTimeField
      FieldName = 'DATA_DIVIDA'
    end
    object TB_COBRANCAMULTA: TFloatField
      FieldKind = fkLookup
      FieldName = 'MULTA'
      LookupDataSet = TB_CREDOR
      LookupKeyFields = 'CODIGO_CREDOR'
      LookupResultField = 'MULTA'
      KeyFields = 'CREDOR'
      Lookup = True
    end
    object TB_COBRANCAPERCENTUAL_ATRASO: TFloatField
      FieldKind = fkLookup
      FieldName = 'PERCENTUAL_ATRASO'
      LookupDataSet = TB_CREDOR
      LookupKeyFields = 'CODIGO_CREDOR'
      LookupResultField = 'PERCENTUAL_ATRASO'
      KeyFields = 'CREDOR'
      Lookup = True
    end
    object TB_COBRANCAAPLICAR_FINANCEIRO: TBooleanField
      FieldKind = fkLookup
      FieldName = 'APLICAR_FINANCEIRO'
      LookupDataSet = TB_CREDOR
      LookupKeyFields = 'CODIGO_CREDOR'
      LookupResultField = 'APLICAR_DADOS_FINANCEIROS'
      KeyFields = 'CREDOR'
      Lookup = True
    end
    object TB_COBRANCANOME_COBRADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_COBRADOR'
      LookupDataSet = TB_COBRADOR
      LookupKeyFields = 'IDCOBRADOR'
      LookupResultField = 'NOME_COBRADOR'
      KeyFields = 'COBRADOR'
      Lookup = True
    end
    object TB_COBRANCAVALOR_CORRIGIDO: TFloatField
      FieldName = 'VALOR_CORRIGIDO'
      currency = True
    end
    object TB_COBRANCAGRUPO_COBRANCA: TIntegerField
      FieldName = 'GRUPO_COBRANCA'
    end
    object TB_COBRANCATIPO_SITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'TIPO_SITUACAO'
      LookupDataSet = TB_TIPO_SITUACAO
      LookupKeyFields = 'TIPO_SITUACAO'
      LookupResultField = 'DESCRICAO_SITUACAO'
      KeyFields = 'SITUACAO'
      Lookup = True
    end
  end
  object TB_ESTADO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_ESTADOBeforePost
    TableName = 'ESTADO'
    Left = 176
    Top = 16
    object TB_ESTADOSIGLA: TWideStringField
      FieldName = 'SIGLA'
      Size = 2
    end
    object TB_ESTADOESTADO: TWideStringField
      FieldName = 'ESTADO'
    end
    object TB_ESTADOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_ESTADODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_ESTADODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_ESTADOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
  end
  object TB_TELEFONES: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_TELEFONESBeforePost
    IndexFieldNames = 'CODIGO_DEVEDOR'
    MasterFields = 'CODIGO_DEVEDOR'
    MasterSource = dsMestreDevedor
    TableName = 'TELEFONES'
    Left = 312
    Top = 16
    object TB_TELEFONESCODIGO_DEVEDOR: TIntegerField
      FieldName = 'CODIGO_DEVEDOR'
    end
    object TB_TELEFONESITEM_TELEFONE: TAutoIncField
      FieldName = 'ITEM_TELEFONE'
      ReadOnly = True
    end
    object TB_TELEFONESREFERENCIA_TELEFONE: TWideStringField
      FieldName = 'REFERENCIA_TELEFONE'
    end
    object TB_TELEFONESNUMERO_TELEFONE: TWideStringField
      FieldName = 'NUMERO_TELEFONE'
    end
    object TB_TELEFONESDDD: TWideStringField
      FieldName = 'DDD'
      Size = 3
    end
    object TB_TELEFONESUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_TELEFONESDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_TELEFONESDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_TELEFONESUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
  end
  object TB_ITENS_COBRANCA: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    AfterInsert = TB_ITENS_COBRANCAAfterInsert
    BeforePost = TB_ITENS_COBRANCABeforePost
    AfterPost = TB_ITENS_COBRANCAAfterPost
    AfterDelete = TB_ITENS_COBRANCAAfterDelete
    OnCalcFields = TB_ITENS_COBRANCACalcFields
    IndexFieldNames = 'COBRANCA'
    MasterFields = 'COBRANCA'
    MasterSource = dsMestreCobranca
    TableName = 'ITENS_COBRANCA'
    Left = 176
    Top = 128
    object TB_ITENS_COBRANCACOBRANCA: TIntegerField
      FieldName = 'COBRANCA'
    end
    object TB_ITENS_COBRANCAITEM: TSmallintField
      FieldName = 'ITEM'
    end
    object TB_ITENS_COBRANCATIPODOCUMENTO: TIntegerField
      FieldName = 'TIPODOCUMENTO'
    end
    object TB_ITENS_COBRANCANUMERO_DOCUMENTO: TWideStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Size = 10
    end
    object TB_ITENS_COBRANCAEMISSAO_DOCUMENTO: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'EMISSAO_DOCUMENTO'
      OnChange = TB_ITENS_COBRANCAEMISSAO_DOCUMENTOChange
      EditMask = '!99/99/00;1;_'
    end
    object TB_ITENS_COBRANCAVENCIMENTO_DOCUMENTO: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'VENCIMENTO_DOCUMENTO'
      EditMask = '!99/99/00;1;_'
    end
    object TB_ITENS_COBRANCAVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
      DisplayFormat = '#,###,##0.00'
      EditFormat = '#,###,##0.00'
      currency = True
    end
    object TB_ITENS_COBRANCASITUACAO: TIntegerField
      FieldName = 'SITUACAO'
    end
    object TB_ITENS_COBRANCAALINES: TWordField
      FieldName = 'ALINES'
    end
    object TB_ITENS_COBRANCABANCO_DOCUMENTO: TSmallintField
      FieldName = 'BANCO_DOCUMENTO'
    end
    object TB_ITENS_COBRANCAOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object TB_ITENS_COBRANCADESCRICAO_TIPO_DOCUMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_TIPO_DOCUMENTO'
      LookupDataSet = TB_TIPO_DOCUMENTO
      LookupKeyFields = 'TIPO_DOCUMENTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPODOCUMENTO'
      Lookup = True
    end
    object TB_ITENS_COBRANCADESCRICAO_SITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_SITUACAO'
      LookupDataSet = TB_TIPO_SITUACAO
      LookupKeyFields = 'TIPO_SITUACAO'
      LookupResultField = 'DESCRICAO_SITUACAO'
      KeyFields = 'SITUACAO'
      Lookup = True
    end
    object TB_ITENS_COBRANCADESCRICAO_BANCO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_BANCO'
      LookupDataSet = TB_BANCO
      LookupKeyFields = 'NUMERO_BANCO'
      LookupResultField = 'NOME_BANCO'
      KeyFields = 'BANCO_DOCUMENTO'
      Lookup = True
    end
    object TB_ITENS_COBRANCADESCRICAO_ALINES: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_ALINES'
      LookupDataSet = TB_ALINES
      LookupKeyFields = 'MOTIVO'
      LookupResultField = 'TIPO_ALINIAS'
      KeyFields = 'ALINES'
      Lookup = True
    end
    object TB_ITENS_COBRANCADIAS_EM_ATRASOS: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'DIAS_EM_ATRASOS'
      Calculated = True
    end
    object TB_ITENS_COBRANCAUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_ITENS_COBRANCADATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_ITENS_COBRANCADATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_ITENS_COBRANCAUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_ITENS_COBRANCADATA_DIVIDA: TDateTimeField
      FieldName = 'DATA_DIVIDA'
      EditMask = '!99/99/00;1;_'
    end
    object TB_ITENS_COBRANCADESC_SIGLA_DOCUMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_SIGLA_DOCUMENTO'
      LookupDataSet = TB_TIPO_DOCUMENTO
      LookupKeyFields = 'TIPO_DOCUMENTO'
      LookupResultField = 'SIGLA_DOCUMENTO'
      KeyFields = 'TIPODOCUMENTO'
      Size = 5
      Lookup = True
    end
    object TB_ITENS_COBRANCAVALOR_CORRIGIDO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VALOR_CORRIGIDO'
      DisplayFormat = '#,###,##0.00'
      EditFormat = '#,###,##0.00'
      currency = True
      Calculated = True
    end
  end
  object TB_ENDERECOS: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_ENDERECOSBeforePost
    IndexFieldNames = 'CODIGO_DEVEDOR'
    MasterFields = 'CODIGO_DEVEDOR'
    MasterSource = dsMestreDevedor
    TableName = 'ENDERECOS'
    Left = 48
    Top = 504
    object TB_ENDERECOSCODIGO_DEVEDOR: TIntegerField
      FieldName = 'CODIGO_DEVEDOR'
    end
    object TB_ENDERECOSNUMERO_ENDERECO: TAutoIncField
      FieldName = 'NUMERO_ENDERECO'
      ReadOnly = True
    end
    object TB_ENDERECOSREFERENCIA_ENDERECO: TWideStringField
      FieldName = 'REFERENCIA_ENDERECO'
      Size = 30
    end
    object TB_ENDERECOSENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object TB_ENDERECOSNUMERO: TWideStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object TB_ENDERECOSCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
    end
    object TB_ENDERECOSBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
    end
    object TB_ENDERECOSCIDADE: TWideStringField
      FieldName = 'CIDADE'
    end
    object TB_ENDERECOSESTADO: TWideStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object TB_ENDERECOSOBSERVACAO: TWideStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object TB_ENDERECOSCEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TB_ENDERECOSUF: TStringField
      FieldKind = fkLookup
      FieldName = 'UF'
      LookupDataSet = TB_ESTADO
      LookupKeyFields = 'SIGLA'
      LookupResultField = 'SIGLA'
      KeyFields = 'ESTADO'
      Size = 2
      Lookup = True
    end
    object TB_ENDERECOSUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_ENDERECOSDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_ENDERECOSDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_ENDERECOSUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
  end
  object TB_ACIONAMENTO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_ACIONAMENTOBeforePost
    IndexFieldNames = 'COBRANCA'
    MasterFields = 'COBRANCA'
    MasterSource = dsMestreCobranca
    TableName = 'ACIONAMENTO'
    Left = 48
    Top = 72
    object TB_ACIONAMENTOIDACIONAMENTO: TAutoIncField
      FieldName = 'IDACIONAMENTO'
      ReadOnly = True
    end
    object TB_ACIONAMENTOCOBRANCA: TIntegerField
      FieldName = 'COBRANCA'
    end
    object TB_ACIONAMENTODATA_ACIONAMENTO: TDateTimeField
      FieldName = 'DATA_ACIONAMENTO'
    end
    object TB_ACIONAMENTOHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      BlobType = ftMemo
    end
    object TB_ACIONAMENTOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_ACIONAMENTODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_ACIONAMENTODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_ACIONAMENTOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_ACIONAMENTOSITUACAO: TWordField
      FieldName = 'SITUACAO'
    end
    object TB_ACIONAMENTOIDDEVEDOR: TIntegerField
      FieldName = 'IDDEVEDOR'
    end
    object TB_ACIONAMENTOOBSERVACAO: TWideStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object TB_ACIONAMENTOIDCHAMADO: TIntegerField
      FieldName = 'IDCHAMADO'
    end
    object TB_ACIONAMENTOIDTELEFONE: TIntegerField
      FieldName = 'IDTELEFONE'
    end
  end
  object TB_ALINES: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_ALINESBeforePost
    TableName = 'ALINES'
    Left = 48
    Top = 168
    object TB_ALINESMOTIVO: TWordField
      FieldName = 'MOTIVO'
    end
    object TB_ALINESTIPO_ALINIAS: TWideStringField
      FieldName = 'TIPO_ALINIAS'
    end
    object TB_ALINESDESCRICAO_ALINIAS: TMemoField
      FieldName = 'DESCRICAO_ALINIAS'
      BlobType = ftMemo
    end
    object TB_ALINESUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_ALINESDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_ALINESDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_ALINESUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
  end
  object TB_BANCO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_BANCOBeforePost
    TableName = 'BANCO'
    Left = 312
    Top = 240
    object TB_BANCONUMERO_BANCO: TSmallintField
      FieldName = 'NUMERO_BANCO'
    end
    object TB_BANCONOME_BANCO: TWideStringField
      FieldName = 'NOME_BANCO'
    end
    object TB_BANCOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_BANCODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_BANCODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_BANCOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
  end
  object TB_CREDOR: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_CREDORBeforePost
    TableName = 'CREDOR'
    Left = 48
    Top = 360
    object TB_CREDORCODIGO_CREDOR: TAutoIncField
      FieldName = 'CODIGO_CREDOR'
      ReadOnly = True
    end
    object TB_CREDORNOME_CREDOR: TWideStringField
      FieldName = 'NOME_CREDOR'
      Size = 60
    end
    object TB_CREDORTIPO_CREDOR: TWordField
      FieldName = 'TIPO_CREDOR'
    end
    object TB_CREDORCNPJ_CPF: TWideStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object TB_CREDORRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object TB_CREDORDATA_CADASTRO: TWideStringField
      FieldName = 'DATA_CADASTRO'
      Size = 50
    end
    object TB_CREDORENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object TB_CREDORNUMERO: TWideStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object TB_CREDORCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
    end
    object TB_CREDORBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
    end
    object TB_CREDORCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object TB_CREDORESTADO: TWideStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object TB_CREDORCEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TB_CREDOROBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object TB_CREDORTELEFONE01: TWideStringField
      FieldName = 'TELEFONE01'
      Size = 15
    end
    object TB_CREDORTELEFONE02: TWideStringField
      FieldName = 'TELEFONE02'
      Size = 15
    end
    object TB_CREDORTELEFONE03: TWideStringField
      FieldName = 'TELEFONE03'
      Size = 15
    end
    object TB_CREDORFAX: TWideStringField
      FieldName = 'FAX'
      Size = 15
    end
    object TB_CREDORSITE: TWideStringField
      FieldName = 'SITE'
      Size = 50
    end
    object TB_CREDOREMAIL01: TWideStringField
      FieldName = 'EMAIL01'
      Size = 50
    end
    object TB_CREDOREMAIL02: TWideStringField
      FieldName = 'EMAIL02'
      Size = 50
    end
    object TB_CREDOREMAIL03: TWideStringField
      FieldName = 'EMAIL03'
      Size = 50
    end
    object TB_CREDORCONTATO01: TWideStringField
      FieldName = 'CONTATO01'
      Size = 50
    end
    object TB_CREDORCONTATO02: TWideStringField
      FieldName = 'CONTATO02'
      Size = 50
    end
    object TB_CREDORUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_CREDORDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_CREDORDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_CREDORUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_CREDORDESC_TIPO_CREDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_TIPO_CREDOR'
      LookupDataSet = TB_TIPO_PESSOA
      LookupKeyFields = 'TIPO_PESSOA'
      LookupResultField = 'DESCRICAO_TIPO_PESSOA'
      KeyFields = 'TIPO_CREDOR'
      Lookup = True
    end
    object TB_CREDORUF: TStringField
      FieldKind = fkLookup
      FieldName = 'UF'
      LookupDataSet = TB_ESTADO
      LookupKeyFields = 'SIGLA'
      LookupResultField = 'SIGLA'
      KeyFields = 'ESTADO'
      Size = 2
      Lookup = True
    end
    object TB_CREDORDDD1: TWideStringField
      FieldName = 'DDD1'
      Size = 3
    end
    object TB_CREDORDDD2: TWideStringField
      FieldName = 'DDD2'
      Size = 3
    end
    object TB_CREDORDDD3: TWideStringField
      FieldName = 'DDD3'
      Size = 3
    end
    object TB_CREDORMULTA: TFloatField
      FieldName = 'MULTA'
    end
    object TB_CREDORDESCONTO_MINIMO: TFloatField
      FieldName = 'DESCONTO_MINIMO'
    end
    object TB_CREDORDESCONTO_MAXIMO: TFloatField
      FieldName = 'DESCONTO_MAXIMO'
    end
    object TB_CREDORPERCENTUAL_ATRASO: TFloatField
      FieldName = 'PERCENTUAL_ATRASO'
    end
    object TB_CREDORAPLICAR_DADOS_FINANCEIROS: TBooleanField
      FieldName = 'APLICAR_DADOS_FINANCEIROS'
    end
    object TB_CREDORGERAR_BOLETOS: TBooleanField
      FieldName = 'GERAR_BOLETOS'
    end
  end
  object dsMestreCobranca: TDataSource
    DataSet = TB_COBRANCA
    Left = 598
    Top = 309
  end
  object dsMestreDevedor: TDataSource
    DataSet = TB_DEVEDOR
    Left = 502
    Top = 307
  end
  object TB_USUARIO_MENU: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_USUARIO_MENUBeforePost
    TableName = 'USUARIO_MENU'
    Left = 312
    Top = 352
    object TB_USUARIO_MENUIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
    end
    object TB_USUARIO_MENUIDMENU: TWideStringField
      FieldName = 'IDMENU'
      Size = 5
    end
    object TB_USUARIO_MENUUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_USUARIO_MENUUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_USUARIO_MENUDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_USUARIO_MENUDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object QU_CONSULTACOBRANCA: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1024
    Top = 152
  end
  object TB_ACORDO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_ACORDOBeforePost
    TableName = 'ACORDO'
    Left = 48
    Top = 120
    object TB_ACORDOIDACORDO: TAutoIncField
      FieldName = 'IDACORDO'
      ReadOnly = True
    end
    object TB_ACORDOCOBRANCA: TIntegerField
      FieldName = 'COBRANCA'
    end
    object TB_ACORDOCREDOR: TIntegerField
      FieldName = 'CREDOR'
    end
    object TB_ACORDODEVEDOR: TIntegerField
      FieldName = 'DEVEDOR'
    end
    object TB_ACORDOVALOR_DIVIDA: TFloatField
      FieldName = 'VALOR_DIVIDA'
      DisplayFormat = '#,###,##0.00'
    end
    object TB_ACORDOTAXA: TFloatField
      FieldName = 'TAXA'
      DisplayFormat = '###,##0.00'
    end
    object TB_ACORDOVALOR_CORRIGIDO: TFloatField
      FieldName = 'VALOR_CORRIGIDO'
      DisplayFormat = '#,###,##0.00'
    end
    object TB_ACORDOPRESTACOES: TWordField
      FieldName = 'PRESTACOES'
    end
    object TB_ACORDOPERIODO: TWordField
      FieldName = 'PERIODO'
    end
    object TB_ACORDOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_ACORDOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_ACORDODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_ACORDODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_ACORDONOME_CREDOR: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'NOME_CREDOR'
      LookupDataSet = TB_CREDOR
      LookupKeyFields = 'CODIGO_CREDOR'
      LookupResultField = 'NOME_CREDOR'
      KeyFields = 'CREDOR'
      Size = 60
      Lookup = True
    end
    object TB_ACORDONOME_DEVEDOR: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'NOME_DEVEDOR'
      LookupDataSet = TB_DEVEDOR
      LookupKeyFields = 'CODIGO_DEVEDOR'
      LookupResultField = 'NOME_DEVEDOR'
      KeyFields = 'DEVEDOR'
      Size = 60
      Lookup = True
    end
    object TB_ACORDOSTATUS: TWordField
      FieldName = 'STATUS'
    end
    object TB_ACORDORAZAO_SOCIAL_CREDOR: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'RAZAO_SOCIAL_CREDOR'
      LookupDataSet = TB_CREDOR
      LookupKeyFields = 'CODIGO_CREDOR'
      LookupResultField = 'RAZAO_SOCIAL'
      KeyFields = 'CREDOR'
      Size = 50
      Lookup = True
    end
    object TB_ACORDOCOBRADOR: TIntegerField
      FieldName = 'COBRADOR'
    end
    object TB_ACORDOVALOR_ENTRADA: TFloatField
      FieldName = 'VALOR_ENTRADA'
    end
    object TB_ACORDONOME_COBRADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_COBRADOR'
      LookupDataSet = TB_COBRADOR
      LookupKeyFields = 'IDCOBRADOR'
      LookupResultField = 'NOME_COBRADOR'
      KeyFields = 'COBRADOR'
      Size = 0
      Lookup = True
    end
    object TB_ACORDODATA_ACORDO: TDateTimeField
      FieldName = 'DATA_ACORDO'
    end
  end
  object QU_CONSULTA_ACIONAMENTO: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 814
    Top = 103
  end
  object TB_MENU: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_MENUBeforePost
    TableName = 'MENU'
    Left = 176
    Top = 184
    object TB_MENUIDMENU: TWideStringField
      FieldName = 'IDMENU'
      Size = 5
    end
    object TB_MENUDESCRICAO_MENU: TWideStringField
      FieldName = 'DESCRICAO_MENU'
      Size = 50
    end
    object TB_MENUACAO_MENU: TWideStringField
      FieldName = 'ACAO_MENU'
      Size = 50
    end
    object TB_MENUIDMENUPAI: TWideStringField
      FieldName = 'IDMENUPAI'
      Size = 5
    end
    object TB_MENUUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_MENUUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_MENUDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_MENUDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_MENUTEM_BARRA: TBooleanField
      FieldName = 'TEM_BARRA'
    end
  end
  object QU_MENU: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 812
    Top = 55
  end
  object Comando: TADOCommand
    Connection = Conexao
    Parameters = <>
    Left = 64
    Top = 16
  end
  object TB_RECEBIMENTO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_RECEBIMENTOBeforePost
    OnCalcFields = TB_RECEBIMENTOCalcFields
    IndexFieldNames = 'ACORDO'
    MasterFields = 'IDACORDO'
    MasterSource = dsMestreAcordo
    TableName = 'RECEBIMENTO'
    Left = 184
    Top = 400
    object TB_RECEBIMENTORECEBIMENTO: TAutoIncField
      FieldName = 'RECEBIMENTO'
      ReadOnly = True
    end
    object TB_RECEBIMENTOACORDO: TIntegerField
      FieldName = 'ACORDO'
    end
    object TB_RECEBIMENTOCOBRANCA: TIntegerField
      FieldName = 'COBRANCA'
    end
    object TB_RECEBIMENTOPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object TB_RECEBIMENTOVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
    end
    object TB_RECEBIMENTOSITUCAO: TIntegerField
      FieldName = 'SITUCAO'
    end
    object TB_RECEBIMENTOVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      currency = True
    end
    object TB_RECEBIMENTOCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object TB_RECEBIMENTOVALOR_REPASSE: TFloatField
      FieldName = 'VALOR_REPASSE'
      currency = True
    end
    object TB_RECEBIMENTOTIPODOCUMENTO: TIntegerField
      FieldName = 'TIPODOCUMENTO'
    end
    object TB_RECEBIMENTONUMERO_DOCUMENTO: TWideStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Size = 10
    end
    object TB_RECEBIMENTOPAGO: TBooleanField
      FieldName = 'PAGO'
    end
    object TB_RECEBIMENTODATA_PAGAMENTO: TDateTimeField
      FieldName = 'DATA_PAGAMENTO'
    end
    object TB_RECEBIMENTOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_RECEBIMENTOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_RECEBIMENTODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_RECEBIMENTODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_RECEBIMENTOOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object TB_RECEBIMENTOCOBRADOR: TIntegerField
      FieldName = 'COBRADOR'
    end
    object TB_RECEBIMENTODESC_TIPO_DOCUMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_TIPO_DOCUMENTO'
      LookupDataSet = TB_TIPO_DOCUMENTO
      LookupKeyFields = 'TIPO_DOCUMENTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPODOCUMENTO'
      Lookup = True
    end
    object TB_RECEBIMENTOQUITADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'QUITADO'
      OnValidate = TB_RECEBIMENTOQUITADOValidate
      Size = 3
      Calculated = True
    end
    object TB_RECEBIMENTOPROMESSA_PAGAMENTO: TDateTimeField
      FieldName = 'PROMESSA_PAGAMENTO'
    end
    object TB_RECEBIMENTOPAGTO_PRE_DATADO: TBooleanField
      FieldName = 'PAGTO_PRE_DATADO'
    end
    object TB_RECEBIMENTONOME_COBRADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_COBRADOR'
      LookupDataSet = TB_COBRADOR
      LookupKeyFields = 'IDCOBRADOR'
      LookupResultField = 'NOME_COBRADOR'
      KeyFields = 'COBRADOR'
      Lookup = True
    end
    object TB_RECEBIMENTOVENCIMENTO_REAL: TDateTimeField
      FieldName = 'VENCIMENTO_REAL'
    end
    object TB_RECEBIMENTOJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object TB_RECEBIMENTOCHEQUE_COMPENSADO: TBooleanField
      FieldName = 'CHEQUE_COMPENSADO'
    end
    object TB_RECEBIMENTOBANCO: TSmallintField
      FieldName = 'BANCO'
    end
    object TB_RECEBIMENTOIDREPASSE: TIntegerField
      FieldName = 'IDREPASSE'
    end
    object TB_RECEBIMENTONUMERO_BOLETO: TIntegerField
      FieldName = 'NUMERO_BOLETO'
    end
  end
  object dsMestreAcordo: TDataSource
    DataSet = TB_ACORDO
    Left = 814
    Top = 309
  end
  object QU_CONSULTAPARCELAS: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1022
    Top = 104
  end
  object dsPendenciasCredor: TDataSource
    Left = 812
    Top = 224
  end
  object TB_COBRADOR: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_COBRADORBeforePost
    TableName = 'COBRADOR'
    Left = 48
    Top = 266
    object TB_COBRADORIDCOBRADOR: TAutoIncField
      FieldName = 'IDCOBRADOR'
      ReadOnly = True
    end
    object TB_COBRADORNOME_COBRADOR: TWideStringField
      FieldName = 'NOME_COBRADOR'
    end
    object TB_COBRADORIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      LookupDataSet = TB_USUARIO
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
    end
    object TB_COBRADORUSUARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'USUARIO'
      LookupDataSet = TB_USUARIO
      LookupKeyFields = 'ID'
      LookupResultField = 'USUARIO'
      KeyFields = 'IDUSUARIO'
      Lookup = True
    end
    object TB_COBRADORUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_COBRADORUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_COBRADORDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_COBRADORDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object TB_RECIBO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_RECIBOBeforePost
    IndexFieldNames = 'IDRECEBIMENTO'
    MasterFields = 'RECEBIMENTO'
    MasterSource = dsMestreRecebimento
    TableName = 'RECIBO'
    Left = 178
    Top = 440
    object TB_RECIBONUMERO_RECIBO: TIntegerField
      FieldName = 'NUMERO_RECIBO'
    end
    object TB_RECIBOIDRECEBIMENTO: TIntegerField
      FieldName = 'IDRECEBIMENTO'
    end
    object TB_RECIBOVALOR_PRINCIPAL: TFloatField
      FieldName = 'VALOR_PRINCIPAL'
    end
    object TB_RECIBOENCARGOS: TFloatField
      FieldName = 'ENCARGOS'
    end
    object TB_RECIBOMULTA: TFloatField
      FieldName = 'MULTA'
    end
    object TB_RECIBOHONORARIOS: TFloatField
      FieldName = 'HONORARIOS'
    end
    object TB_RECIBOSITUACAO: TWordField
      FieldName = 'SITUACAO'
    end
    object TB_RECIBOMOTIVO_CANCELAMENTO: TWideStringField
      FieldName = 'MOTIVO_CANCELAMENTO'
      Size = 255
    end
    object TB_RECIBOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_RECIBOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_RECIBODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_RECIBODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object dsMestreRecebimento: TDataSource
    DataSet = TB_RECEBIMENTO
    Left = 718
    Top = 309
  end
  object QU_COBRANCA_COBRADOR: TADOQuery
    Connection = Conexao
    Parameters = <>
    SQL.Strings = (
      'SELECT C.COBRADOR, '
      '               B.NOME_COBRADOR, '
      '                COUNT(*) AS QUANTIDADE, '
      '                SUM(C.VALOR_DIVIDA) AS TOTAL '
      'FROM COBRANCA C, COBRADOR B'
      'WHERE C.COBRADOR = B.IDCOBRADOR'
      'AND C.SITUACAO = 0'
      'GROUP BY C.COBRADOR, B.NOME_COBRADOR'
      'ORDER BY C.COBRADOR')
    Left = 1026
    Top = 488
    object QU_COBRANCA_COBRADORCodigo: TIntegerField
      DisplayLabel = 'Cobrador'
      FieldName = 'COBRADOR'
    end
    object QU_COBRANCA_COBRADORNOME_COBRADOR: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_COBRADOR'
      Size = 30
    end
    object QU_COBRANCA_COBRADORQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object QU_COBRANCA_COBRADORTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      currency = True
    end
  end
  object QU_COBRANCAS_PENDENTES: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1024
    Top = 200
    object QU_COBRANCAS_PENDENTESCOBRANCA: TIntegerField
      DisplayLabel = 'Cobran'#231'a'
      FieldName = 'COBRANCA'
    end
    object QU_COBRANCAS_PENDENTESNOME_CREDOR: TStringField
      DisplayLabel = 'Credor'
      FieldName = 'NOME_CREDOR'
      Size = 60
    end
    object QU_COBRANCAS_PENDENTESNOME_DEVEDOR: TStringField
      DisplayLabel = 'Devedor'
      FieldName = 'NOME_DEVEDOR'
      Size = 60
    end
    object QU_COBRANCAS_PENDENTESDATA_CADASTRO: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QU_COBRANCAS_PENDENTESVALOR_DIVIDA: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_DIVIDA'
      currency = True
    end
  end
  object QU_COBRANCAS_COM_COBRADOR: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1018
    Top = 8
    object QU_COBRANCAS_COM_COBRADORCOBRANCA: TIntegerField
      FieldName = 'COBRANCA'
    end
    object QU_COBRANCAS_COM_COBRADORNOME_CREDOR: TStringField
      FieldName = 'NOME_CREDOR'
      Size = 60
    end
    object QU_COBRANCAS_COM_COBRADORNOME_DEVEDOR: TStringField
      FieldName = 'NOME_DEVEDOR'
      Size = 60
    end
    object QU_COBRANCAS_COM_COBRADORDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QU_COBRANCAS_COM_COBRADORVALOR_DIVIDA: TFloatField
      FieldName = 'VALOR_DIVIDA'
      currency = True
    end
    object QU_COBRANCAS_COM_COBRADORNOME_COBRADOR: TStringField
      FieldName = 'NOME_COBRADOR'
      Size = 30
    end
    object QU_COBRANCAS_COM_COBRADORDEVEDOR: TIntegerField
      FieldName = 'DEVEDOR'
    end
    object QU_COBRANCAS_COM_COBRADORSTATUS: TStringField
      FieldName = 'STATUS'
    end
  end
  object TB_DEPRE: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_DEPREBeforePost
    TableName = 'DEPRE'
    Left = 50
    Top = 408
    object TB_DEPREIDDEPRE: TAutoIncField
      FieldName = 'IDDEPRE'
      ReadOnly = True
    end
    object TB_DEPREANO: TSmallintField
      FieldName = 'ANO'
    end
    object TB_DEPREMES: TWordField
      FieldName = 'MES'
    end
    object TB_DEPREINDICE: TFloatField
      FieldName = 'INDICE'
    end
    object TB_DEPREUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_DEPREUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_DEPREDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_DEPREDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object QU_CONSULTA_COBRANCA: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1026
    Top = 392
  end
  object QU_CONSULTA_DEVEDOR: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1026
    Top = 536
  end
  object QU_CONSULTA_TELEFONES: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1026
    Top = 440
  end
  object QU_CONSULTA_ENDERECOS: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1026
    Top = 344
  end
  object QU_CONSULTA_ITENS_COBRANCA: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 810
    Top = 8
  end
  object QU_CONSULTA_CREDOR: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1026
    Top = 248
  end
  object QU_CONSULTA_ACORDO: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1026
    Top = 296
  end
  object QU_RECEBIMENTO_COM_COBRADOR: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 1022
    Top = 56
  end
  object QU_CONSULTA_ITENS_ACORDO: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 818
    Top = 152
  end
  object TB_BOLETO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_BOLETOBeforePost
    IndexFieldNames = 'IDCREDOR'
    MasterFields = 'CODIGO_CREDOR'
    MasterSource = dsMestreCredor
    TableName = 'BOLETO'
    Left = 48
    Top = 216
    object TB_BOLETOIDBOLETO: TAutoIncField
      FieldName = 'IDBOLETO'
      ReadOnly = True
    end
    object TB_BOLETOIDCREDOR: TIntegerField
      FieldName = 'IDCREDOR'
    end
    object TB_BOLETOBANCO: TWideStringField
      FieldName = 'BANCO'
      Size = 4
    end
    object TB_BOLETOCEDENTE: TWideStringField
      FieldName = 'CEDENTE'
      Size = 10
    end
    object TB_BOLETOCARTEIRA: TWideStringField
      FieldName = 'CARTEIRA'
      Size = 255
    end
    object TB_BOLETONOSSO_NUMERO: TIntegerField
      FieldName = 'NOSSO_NUMERO'
    end
    object TB_BOLETOAGENCIA: TWideStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object TB_BOLETOCONTA_CORRENTE: TWideStringField
      FieldName = 'CONTA_CORRENTE'
      Size = 15
    end
    object TB_BOLETODIGITO: TWideStringField
      FieldName = 'DIGITO'
      Size = 1
    end
    object TB_BOLETOMODALIDADE: TWideStringField
      FieldName = 'MODALIDADE'
      Size = 3
    end
    object TB_BOLETOCONVENIO: TWideStringField
      FieldName = 'CONVENIO'
      Size = 3
    end
    object TB_BOLETOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_BOLETOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_BOLETODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_BOLETODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object dsMestreCredor: TDataSource
    DataSet = TB_CREDOR
    Left = 912
    Top = 310
  end
  object TB_GRUPO_COBRANCA: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_GRUPO_COBRANCABeforePost
    TableName = 'GRUPO_COBRANCA'
    Left = 176
    Top = 72
    object TB_GRUPO_COBRANCAIDGRUPO: TAutoIncField
      FieldName = 'IDGRUPO'
      ReadOnly = True
    end
    object TB_GRUPO_COBRANCADESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object TB_GRUPO_COBRANCAIDCREDOR: TIntegerField
      FieldName = 'IDCREDOR'
    end
    object TB_GRUPO_COBRANCAOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object TB_GRUPO_COBRANCAVALIDADE: TDateTimeField
      FieldName = 'VALIDADE'
    end
    object TB_GRUPO_COBRANCASITUACAO: TWordField
      FieldName = 'SITUACAO'
    end
    object TB_GRUPO_COBRANCADESCONTO_MAXIMO: TFloatField
      FieldName = 'DESCONTO_MAXIMO'
    end
    object TB_GRUPO_COBRANCAUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_GRUPO_COBRANCAUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_GRUPO_COBRANCADATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_GRUPO_COBRANCADATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object TB_METAS: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_METASBeforePost
    TableName = 'METAS'
    Left = 176
    Top = 240
    object TB_METASIDMETA: TIntegerField
      FieldName = 'IDMETA'
    end
    object TB_METASIDCOBRADOR: TIntegerField
      FieldName = 'IDCOBRADOR'
    end
    object TB_METASANO: TSmallintField
      FieldName = 'ANO'
    end
    object TB_METASMES: TWordField
      FieldName = 'MES'
    end
    object TB_METASMETA: TFloatField
      FieldName = 'META'
    end
    object TB_METASUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_METASUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_METASDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_METASDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object TB_MOTIVOS_ACIONAMENTOS: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_MOTIVOS_ACIONAMENTOSBeforePost
    TableName = 'MOTIVOS_ACIONAMENTOS'
    Left = 176
    Top = 296
    object TB_MOTIVOS_ACIONAMENTOSCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TB_MOTIVOS_ACIONAMENTOSDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object TB_MOTIVOS_ACIONAMENTOSUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_MOTIVOS_ACIONAMENTOSUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_MOTIVOS_ACIONAMENTOSDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_MOTIVOS_ACIONAMENTOSDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object TB_REPASSE: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_REPASSEBeforePost
    TableName = 'REPASSE'
    Left = 176
    Top = 488
    object TB_REPASSEIDREPASSE: TAutoIncField
      FieldName = 'IDREPASSE'
      ReadOnly = True
    end
    object TB_REPASSEIDCREDOR: TIntegerField
      FieldName = 'IDCREDOR'
    end
    object TB_REPASSEDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
    end
    object TB_REPASSEDATA_REPASSE: TDateTimeField
      FieldName = 'DATA_REPASSE'
    end
    object TB_REPASSEVALOR_REPASSE: TFloatField
      FieldName = 'VALOR_REPASSE'
    end
    object TB_REPASSESITUACAO: TWordField
      FieldName = 'SITUACAO'
    end
    object TB_REPASSEUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_REPASSEUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_REPASSEDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_REPASSEDATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object TB_PROPOSTA: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'PROPOSTA'
    Left = 312
    Top = 408
    object TB_PROPOSTAIDPROPOSTA: TAutoIncField
      FieldName = 'IDPROPOSTA'
      ReadOnly = True
    end
    object TB_PROPOSTAIDCOBRANCA: TIntegerField
      FieldName = 'IDCOBRANCA'
    end
    object TB_PROPOSTAVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object TB_PROPOSTAENTRADA: TFloatField
      FieldName = 'ENTRADA'
    end
    object TB_PROPOSTAPARCELAS: TWordField
      FieldName = 'PARCELAS'
    end
    object TB_PROPOSTAVALIDADE: TDateTimeField
      FieldName = 'VALIDADE'
    end
    object TB_PROPOSTASITUACAO: TWordField
      FieldName = 'SITUACAO'
    end
    object TB_PROPOSTAOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object TB_PROPOSTAUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_PROPOSTAUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_PROPOSTADATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_PROPOSTADATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
    object TB_PROPOSTADIA_VENCIMENTO: TWordField
      FieldName = 'DIA_VENCIMENTO'
    end
  end
  object TB_AVISO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'AVISO'
    Left = 312
    Top = 464
    object TB_AVISOIDAVISO: TAutoIncField
      FieldName = 'IDAVISO'
      ReadOnly = True
    end
    object TB_AVISOIDCREDOR: TIntegerField
      FieldName = 'IDCREDOR'
    end
    object TB_AVISODESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object TB_AVISODATA: TDateTimeField
      FieldName = 'DATA'
    end
    object TB_AVISOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_AVISOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_AVISODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_AVISODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object TB_ITENS_AVISO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'ITENS_AVISO'
    Left = 312
    Top = 520
    object TB_ITENS_AVISOIDDEVEDOR_AVISO: TAutoIncField
      FieldName = 'IDDEVEDOR_AVISO'
      ReadOnly = True
    end
    object TB_ITENS_AVISOIDAVISO: TIntegerField
      FieldName = 'IDAVISO'
    end
    object TB_ITENS_AVISOIDDEVEDOR: TIntegerField
      FieldName = 'IDDEVEDOR'
    end
    object TB_ITENS_AVISOIDCOBRANCA: TIntegerField
      FieldName = 'IDCOBRANCA'
    end
    object TB_ITENS_AVISOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_ITENS_AVISOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_ITENS_AVISODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_ITENS_AVISODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
  object TB_CHAMADO: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    BeforePost = TB_CHAMADOBeforePost
    TableName = 'CHAMADO'
    Left = 424
    Top = 16
    object TB_CHAMADOIDCHAMADO: TAutoIncField
      FieldName = 'IDCHAMADO'
      ReadOnly = True
    end
    object TB_CHAMADOIDCOBRADOR: TIntegerField
      FieldName = 'IDCOBRADOR'
    end
    object TB_CHAMADOIDCREDOR: TIntegerField
      FieldName = 'IDCREDOR'
    end
    object TB_CHAMADOIDDEVEDOR: TIntegerField
      FieldName = 'IDDEVEDOR'
    end
    object TB_CHAMADOIDCOBRANCA: TIntegerField
      FieldName = 'IDCOBRANCA'
    end
    object TB_CHAMADOIDACORDO: TIntegerField
      FieldName = 'IDACORDO'
    end
    object TB_CHAMADOHORA_INICIO_CONFIRMADA: TDateTimeField
      FieldName = 'HORA_INICIO_CONFIRMADA'
    end
    object TB_CHAMADOHORA_FINAL_CONFIRMADA: TDateTimeField
      FieldName = 'HORA_FINAL_CONFIRMADA'
    end
    object TB_CHAMADOHORA_INICIO_PROGRAMADA: TDateTimeField
      FieldName = 'HORA_INICIO_PROGRAMADA'
    end
    object TB_CHAMADOHORA_FINAL_PROGRAMADA: TDateTimeField
      FieldName = 'HORA_FINAL_PROGRAMADA'
    end
    object TB_CHAMADOSITUACAO: TWordField
      FieldName = 'SITUACAO'
    end
    object TB_CHAMADOUSUARIO_INCLUSAO: TWideStringField
      FieldName = 'USUARIO_INCLUSAO'
    end
    object TB_CHAMADOUSUARIO_ALTERACAO: TWideStringField
      FieldName = 'USUARIO_ALTERACAO'
    end
    object TB_CHAMADODATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object TB_CHAMADODATA_ALTERACAO: TDateTimeField
      FieldName = 'DATA_ALTERACAO'
    end
  end
end
