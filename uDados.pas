unit uDados;

interface

uses
  SysUtils, Dialogs, Forms, Classes, DB, ADODB, DateUtils,
  Parametros, uLogin, Variants, uCodifica, uSplash, uAguarde, ComCtrls,
  StrUtils,
  uFreeReport, uGetFunctions,
  uFuncoes;

Type  TSituacaoCobranca = (tsitPendente, tsitAcordado, tsitEncerrado);


type
  TDados = class(TDataModule)
    Conexao: TADOConnection;
    TB_TIPO_DOCUMENTO: TADOTable;
    TB_TIPO_SITUACAO: TADOTable;
    TB_USUARIO: TADOTable;
    TB_DEVEDOR: TADOTable;
    TB_PARAMETROS: TADOTable;
    TB_TIPO_PESSOA: TADOTable;
    TB_COBRANCA: TADOTable;
    TB_ESTADO: TADOTable;
    TB_TELEFONES: TADOTable;
    TB_ITENS_COBRANCA: TADOTable;
    TB_ENDERECOS: TADOTable;
    TB_ACIONAMENTO: TADOTable;
    TB_ALINES: TADOTable;
    TB_BANCO: TADOTable;
    TB_ACIONAMENTOIDACIONAMENTO: TAutoIncField;
    TB_ACIONAMENTOCOBRANCA: TIntegerField;
    TB_ACIONAMENTODATA_ACIONAMENTO: TDateTimeField;
    TB_ACIONAMENTOHISTORICO: TMemoField;
    TB_ALINESMOTIVO: TWordField;
    TB_ALINESTIPO_ALINIAS: TWideStringField;
    TB_ALINESDESCRICAO_ALINIAS: TMemoField;
    TB_ESTADOSIGLA: TWideStringField;
    TB_ESTADOESTADO: TWideStringField;
    TB_DEVEDORCODIGO_DEVEDOR: TAutoIncField;
    TB_DEVEDORNOME_DEVEDOR: TWideStringField;
    TB_DEVEDORTIPO_DEVEDOR: TWordField;
    TB_DEVEDORDATA_CADASTRO: TDateTimeField;
    TB_DEVEDORPROFISSAO: TWideStringField;
    TB_DEVEDORRENDA: TFloatField;
    TB_DEVEDORCARRO_MODELO: TWideStringField;
    TB_DEVEDORPLACA: TWideStringField;
    TB_DEVEDORCNPJ_CPF: TWideStringField;
    TB_DEVEDOROBSERVACAO: TMemoField;
    TB_DEVEDOREMPRESA: TWideStringField;
    TB_DEVEDORFUNCAO: TWideStringField;
    TB_DEVEDORNOME_PAI: TWideStringField;
    TB_DEVEDORNOME_MAE: TWideStringField;
    TB_DEVEDORESTADO_CIVIL: TWideStringField;
    TB_DEVEDORIDENTIDADE: TWideStringField;
    TB_DEVEDOREMAIL01: TWideStringField;
    TB_DEVEDOREMAIL02: TWideStringField;
    TB_DEVEDOREMAIL03: TWideStringField;
    TB_USUARIOID: TAutoIncField;
    TB_USUARIOUSUARIO: TWideStringField;
    TB_USUARIOSENHA: TWideStringField;
    TB_USUARIONOME: TWideStringField;
    TB_TIPO_DOCUMENTOTIPO_DOCUMENTO: TSmallintField;
    TB_TIPO_DOCUMENTODESCRICAO: TWideStringField;
    TB_TELEFONESCODIGO_DEVEDOR: TIntegerField;
    TB_TELEFONESITEM_TELEFONE: TAutoIncField;
    TB_TELEFONESREFERENCIA_TELEFONE: TWideStringField;
    TB_TELEFONESNUMERO_TELEFONE: TWideStringField;
    TB_TIPO_PESSOATIPO_PESSOA: TWordField;
    TB_TIPO_PESSOADESCRICAO_TIPO_PESSOA: TWideStringField;
    TB_TIPO_SITUACAOTIPO_SITUACAO: TWordField;
    TB_TIPO_SITUACAODESCRICAO_SITUACAO: TWideStringField;
    TB_BANCONUMERO_BANCO: TSmallintField;
    TB_BANCONOME_BANCO: TWideStringField;
    TB_CREDOR: TADOTable;
    dsMestreCobranca: TDataSource;
    dsMestreDevedor: TDataSource;
    TB_COBRANCACOBRANCA: TAutoIncField;
    TB_COBRANCACREDOR: TIntegerField;
    TB_COBRANCADEVEDOR: TIntegerField;
    TB_COBRANCADATA_CADASTRO: TDateTimeField;
    TB_COBRANCAFORMA_PAGAMENTO: TIntegerField;
    TB_COBRANCASITUACAO: TIntegerField;
    TB_COBRANCACOBRADOR: TIntegerField;
    TB_COBRANCAVALOR_DIVIDA: TFloatField;
    TB_PARAMETROSID: TIntegerField;
    TB_ITENS_COBRANCACOBRANCA: TIntegerField;
    TB_ITENS_COBRANCAITEM: TSmallintField;
    TB_ITENS_COBRANCATIPODOCUMENTO: TIntegerField;
    TB_ITENS_COBRANCANUMERO_DOCUMENTO: TWideStringField;
    TB_ITENS_COBRANCAEMISSAO_DOCUMENTO: TDateTimeField;
    TB_ITENS_COBRANCAVENCIMENTO_DOCUMENTO: TDateTimeField;
    TB_ITENS_COBRANCAVALOR_DOCUMENTO: TFloatField;
    TB_ITENS_COBRANCASITUACAO: TIntegerField;
    TB_ITENS_COBRANCAALINES: TWordField;
    TB_ITENS_COBRANCABANCO_DOCUMENTO: TSmallintField;
    TB_ENDERECOSCODIGO_DEVEDOR: TIntegerField;
    TB_ENDERECOSNUMERO_ENDERECO: TAutoIncField;
    TB_ENDERECOSREFERENCIA_ENDERECO: TWideStringField;
    TB_ENDERECOSENDERECO: TWideStringField;
    TB_ENDERECOSNUMERO: TWideStringField;
    TB_ENDERECOSCOMPLEMENTO: TWideStringField;
    TB_ENDERECOSBAIRRO: TWideStringField;
    TB_ENDERECOSCIDADE: TWideStringField;
    TB_ENDERECOSESTADO: TWideStringField;
    TB_ENDERECOSOBSERVACAO: TWideStringField;
    TB_ENDERECOSCEP: TWideStringField;
    TB_COBRANCANOME_CREDOR: TStringField;
    TB_COBRANCANOME_DEVEDOR: TStringField;
    TB_ITENS_COBRANCAOBSERVACAO: TMemoField;
    TB_ITENS_COBRANCADESCRICAO_TIPO_DOCUMENTO: TStringField;
    TB_ITENS_COBRANCADESCRICAO_SITUACAO: TStringField;
    TB_ITENS_COBRANCADESCRICAO_BANCO: TStringField;
    TB_ITENS_COBRANCADESCRICAO_ALINES: TStringField;
    TB_CREDORCODIGO_CREDOR: TAutoIncField;
    TB_CREDORNOME_CREDOR: TWideStringField;
    TB_CREDORTIPO_CREDOR: TWordField;
    TB_CREDORCNPJ_CPF: TWideStringField;
    TB_CREDORRAZAO_SOCIAL: TWideStringField;
    TB_CREDORDATA_CADASTRO: TWideStringField;
    TB_CREDORENDERECO: TWideStringField;
    TB_CREDORNUMERO: TWideStringField;
    TB_CREDORCOMPLEMENTO: TWideStringField;
    TB_CREDORBAIRRO: TWideStringField;
    TB_CREDORCIDADE: TWideStringField;
    TB_CREDORESTADO: TWideStringField;
    TB_CREDORCEP: TWideStringField;
    TB_CREDOROBSERVACAO: TMemoField;
    TB_CREDORTELEFONE01: TWideStringField;
    TB_CREDORTELEFONE02: TWideStringField;
    TB_CREDORTELEFONE03: TWideStringField;
    TB_CREDORFAX: TWideStringField;
    TB_CREDORSITE: TWideStringField;
    TB_CREDOREMAIL01: TWideStringField;
    TB_CREDOREMAIL02: TWideStringField;
    TB_CREDOREMAIL03: TWideStringField;
    TB_CREDORCONTATO01: TWideStringField;
    TB_CREDORCONTATO02: TWideStringField;
    TB_DEVEDORDESC_TIPO_DEVEDOR: TStringField;
    TB_ENDERECOSUF: TStringField;
    TB_TELEFONESDDD: TWideStringField;
    TB_USUARIOTIPO_USUARIO: TBooleanField;
    TB_ITENS_COBRANCADIAS_EM_ATRASOS: TIntegerField;
    TB_ACIONAMENTOUSUARIO_ALTERACAO: TWideStringField;
    TB_ACIONAMENTODATA_INCLUSAO: TDateTimeField;
    TB_ACIONAMENTODATA_ALTERACAO: TDateTimeField;
    TB_ALINESUSUARIO_ALTERACAO: TWideStringField;
    TB_ALINESDATA_INCLUSAO: TDateTimeField;
    TB_ALINESDATA_ALTERACAO: TDateTimeField;
    TB_CREDORUSUARIO_ALTERACAO: TWideStringField;
    TB_CREDORDATA_INCLUSAO: TDateTimeField;
    TB_CREDORDATA_ALTERACAO: TDateTimeField;
    TB_ESTADOUSUARIO_ALTERACAO: TWideStringField;
    TB_ESTADODATA_INCLUSAO: TDateTimeField;
    TB_ESTADODATA_ALTERACAO: TDateTimeField;
    TB_DEVEDORUSUARIO_ALTERACAO: TWideStringField;
    TB_DEVEDORDATA_INCLUSAO: TDateTimeField;
    TB_DEVEDORDATA_ALTERACAO: TDateTimeField;
    TB_USUARIOUSUARIO_ALTERACAO: TWideStringField;
    TB_USUARIODATA_INCLUSAO: TDateTimeField;
    TB_USUARIODATA_ALTERACAO: TDateTimeField;
    TB_TIPO_DOCUMENTOUSUARIO_ALTERACAO: TWideStringField;
    TB_TIPO_DOCUMENTODATA_INCLUSAO: TDateTimeField;
    TB_TIPO_DOCUMENTODATA_ALTERACAO: TDateTimeField;
    TB_TELEFONESUSUARIO_ALTERACAO: TWideStringField;
    TB_TELEFONESDATA_INCLUSAO: TDateTimeField;
    TB_TELEFONESDATA_ALTERACAO: TDateTimeField;
    TB_TIPO_PESSOAUSUARIO_ALTERACAO: TWideStringField;
    TB_TIPO_PESSOADATA_INCLUSAO: TDateTimeField;
    TB_TIPO_PESSOADATA_ALTERACAO: TDateTimeField;
    TB_TIPO_SITUACAOUSUARIO_ALTERACAO: TWideStringField;
    TB_TIPO_SITUACAODATA_INCLUSAO: TDateTimeField;
    TB_TIPO_SITUACAODATA_ALTERACAO: TDateTimeField;
    TB_BANCOUSUARIO_ALTERACAO: TWideStringField;
    TB_BANCODATA_INCLUSAO: TDateTimeField;
    TB_BANCODATA_ALTERACAO: TDateTimeField;
    TB_ENDERECOSUSUARIO_ALTERACAO: TWideStringField;
    TB_ENDERECOSDATA_INCLUSAO: TDateTimeField;
    TB_ENDERECOSDATA_ALTERACAO: TDateTimeField;
    TB_COBRANCAUSUARIO_ALTERACAO: TWideStringField;
    TB_COBRANCADATA_INCLUSAO: TDateTimeField;
    TB_COBRANCADATA_ALTERACAO: TDateTimeField;
    TB_ITENS_COBRANCAUSUARIO_ALTERACAO: TWideStringField;
    TB_ITENS_COBRANCADATA_INCLUSAO: TDateTimeField;
    TB_ITENS_COBRANCADATA_ALTERACAO: TDateTimeField;
    TB_ACIONAMENTOUSUARIO_INCLUSAO: TWideStringField;
    TB_ALINESUSUARIO_INCLUSAO: TWideStringField;
    TB_CREDORUSUARIO_INCLUSAO: TWideStringField;
    TB_ESTADOUSUARIO_INCLUSAO: TWideStringField;
    TB_DEVEDORUSUARIO_INCLUSAO: TWideStringField;
    TB_USUARIOUSUARIO_INCLUSAO: TWideStringField;
    TB_TELEFONESUSUARIO_INCLUSAO: TWideStringField;
    TB_TIPO_PESSOAUSUARIO_INCLUSAO: TWideStringField;
    TB_TIPO_SITUACAOUSUARIO_INCLUSAO: TWideStringField;
    TB_BANCOUSUARIO_INCLUSAO: TWideStringField;
    TB_ENDERECOSUSUARIO_INCLUSAO: TWideStringField;
    TB_ITENS_COBRANCAUSUARIO_INCLUSAO: TWideStringField;
    TB_PARAMETROSVERSAO_SISTEMA: TSmallintField;
    TB_COBRANCAUSUARIO_INCLUSAO: TWideStringField;
    TB_TIPO_DOCUMENTOUSUARIO_INCLUSAO: TWideStringField;
    TB_CREDORDESC_TIPO_CREDOR: TStringField;
    TB_CREDORUF: TStringField;
    TB_CREDORDDD1: TWideStringField;
    TB_CREDORDDD2: TWideStringField;
    TB_CREDORDDD3: TWideStringField;
    QU_CONSULTACOBRANCA: TADOQuery;
    TB_ACORDO: TADOTable;
    TB_ACORDOIDACORDO: TAutoIncField;
    TB_ACORDOCREDOR: TIntegerField;
    TB_ACORDODEVEDOR: TIntegerField;
    TB_ACORDOVALOR_DIVIDA: TFloatField;
    TB_ACORDOTAXA: TFloatField;
    TB_ACORDOVALOR_CORRIGIDO: TFloatField;
    TB_ACORDOPRESTACOES: TWordField;
    TB_ACORDOPERIODO: TWordField;
    TB_ACORDOUSUARIO_INCLUSAO: TWideStringField;
    TB_ACORDOUSUARIO_ALTERACAO: TWideStringField;
    TB_ACORDODATA_INCLUSAO: TDateTimeField;
    TB_ACORDODATA_ALTERACAO: TDateTimeField;
    TB_TIPO_DOCUMENTOSIGLA_DOCUMENTO: TWideStringField;
    TB_ITENS_COBRANCADATA_DIVIDA: TDateTimeField;
    QU_CONSULTA_ACIONAMENTO: TADOQuery;
    TB_MENU: TADOTable;
    TB_MENUIDMENU: TWideStringField;
    TB_MENUDESCRICAO_MENU: TWideStringField;
    TB_MENUACAO_MENU: TWideStringField;
    TB_MENUIDMENUPAI: TWideStringField;
    QU_MENU: TADOQuery;
    TB_USUARIO_MENU: TADOTable;
    TB_USUARIO_MENUIDUSUARIO: TIntegerField;
    TB_USUARIO_MENUIDMENU: TWideStringField;
    TB_USUARIO_MENUUSUARIO_INCLUSAO: TWideStringField;
    TB_USUARIO_MENUUSUARIO_ALTERACAO: TWideStringField;
    TB_USUARIO_MENUDATA_INCLUSAO: TDateTimeField;
    TB_USUARIO_MENUDATA_ALTERACAO: TDateTimeField;
    Comando: TADOCommand;
    TB_COBRANCADATA_ENCERRAMENTO: TDateTimeField;
    TB_COBRANCAMOTIVO_ENCERRAMENTO: TWideStringField;
    TB_ACORDONOME_CREDOR: TStringField;
    TB_ACORDONOME_DEVEDOR: TStringField;
    TB_RECEBIMENTO: TADOTable;
    dsMestreAcordo: TDataSource;
    TB_RECEBIMENTORECEBIMENTO: TAutoIncField;
    TB_RECEBIMENTOACORDO: TIntegerField;
    TB_RECEBIMENTOCOBRANCA: TIntegerField;
    TB_RECEBIMENTOPARCELA: TIntegerField;
    TB_RECEBIMENTOVENCIMENTO: TDateTimeField;
    TB_RECEBIMENTOSITUCAO: TIntegerField;
    TB_RECEBIMENTOVALOR: TFloatField;
    TB_RECEBIMENTOCOMISSAO: TFloatField;
    TB_RECEBIMENTOVALOR_REPASSE: TFloatField;
    TB_RECEBIMENTOTIPODOCUMENTO: TIntegerField;
    TB_RECEBIMENTONUMERO_DOCUMENTO: TWideStringField;
    TB_RECEBIMENTOPAGO: TBooleanField;
    TB_RECEBIMENTODATA_PAGAMENTO: TDateTimeField;
    TB_RECEBIMENTOUSUARIO_INCLUSAO: TWideStringField;
    TB_RECEBIMENTOUSUARIO_ALTERACAO: TWideStringField;
    TB_RECEBIMENTODATA_INCLUSAO: TDateTimeField;
    TB_RECEBIMENTODATA_ALTERACAO: TDateTimeField;
    TB_ACORDOSTATUS: TWordField;
    QU_CONSULTAPARCELAS: TADOQuery;
    TB_COBRANCADATA_DIVIDA: TDateTimeField;
    dsPendenciasCredor: TDataSource;
    TB_ITENS_COBRANCADESC_SIGLA_DOCUMENTO: TStringField;
    TB_RECEBIMENTOOBSERVACAO: TMemoField;
    TB_ACORDORAZAO_SOCIAL_CREDOR: TStringField;
    TB_CREDORMULTA: TFloatField;
    TB_CREDORDESCONTO_MINIMO: TFloatField;
    TB_CREDORDESCONTO_MAXIMO: TFloatField;
    TB_CREDORPERCENTUAL_ATRASO: TFloatField;
    TB_CREDORAPLICAR_DADOS_FINANCEIROS: TBooleanField;
    TB_ITENS_COBRANCAVALOR_CORRIGIDO: TFloatField;
    TB_COBRANCAMULTA: TFloatField;
    TB_COBRANCAPERCENTUAL_ATRASO: TFloatField;
    TB_COBRANCAAPLICAR_FINANCEIRO: TBooleanField;
    TB_RECEBIMENTOCOBRADOR: TIntegerField;
    TB_ACORDOCOBRADOR: TIntegerField;
    TB_COBRADOR: TADOTable;
    TB_COBRADORIDCOBRADOR: TAutoIncField;
    TB_COBRADORNOME_COBRADOR: TWideStringField;
    TB_COBRADORIDUSUARIO: TIntegerField;
    TB_ACORDOVALOR_ENTRADA: TFloatField;
    TB_ACORDOCOBRANCA: TIntegerField;
    TB_COBRADORUSUARIO: TStringField;
    TB_COBRANCANOME_COBRADOR: TStringField;
    TB_COBRANCAVALOR_CORRIGIDO: TFloatField;
    TB_ACORDONOME_COBRADOR: TStringField;
    TB_RECIBO: TADOTable;
    TB_PARAMETROSULTIMO_NUM_RECIBO: TIntegerField;
    TB_RECIBONUMERO_RECIBO: TIntegerField;
    TB_RECIBOIDRECEBIMENTO: TIntegerField;
    TB_RECIBOVALOR_PRINCIPAL: TFloatField;
    TB_RECIBOENCARGOS: TFloatField;
    TB_RECIBOMULTA: TFloatField;
    TB_RECIBOHONORARIOS: TFloatField;
    dsMestreRecebimento: TDataSource;
    TB_RECEBIMENTODESC_TIPO_DOCUMENTO: TStringField;
    TB_RECEBIMENTOQUITADO: TStringField;
    QU_COBRANCA_COBRADOR: TADOQuery;
    QU_COBRANCAS_PENDENTES: TADOQuery;
    QU_COBRANCA_COBRADORCodigo: TIntegerField;
    QU_COBRANCA_COBRADORNOME_COBRADOR: TStringField;
    QU_COBRANCAS_PENDENTESCOBRANCA: TIntegerField;
    QU_COBRANCAS_PENDENTESNOME_CREDOR: TStringField;
    QU_COBRANCAS_PENDENTESNOME_DEVEDOR: TStringField;
    QU_COBRANCAS_PENDENTESDATA_CADASTRO: TDateField;
    QU_COBRANCAS_PENDENTESVALOR_DIVIDA: TFloatField;
    QU_COBRANCA_COBRADORQUANTIDADE: TIntegerField;
    QU_COBRANCA_COBRADORTOTAL: TFloatField;
    QU_COBRANCAS_COM_COBRADOR: TADOQuery;
    QU_COBRANCAS_COM_COBRADORCOBRANCA: TIntegerField;
    QU_COBRANCAS_COM_COBRADORNOME_CREDOR: TStringField;
    QU_COBRANCAS_COM_COBRADORNOME_DEVEDOR: TStringField;
    QU_COBRANCAS_COM_COBRADORDATA_CADASTRO: TDateField;
    QU_COBRANCAS_COM_COBRADORVALOR_DIVIDA: TFloatField;
    QU_COBRANCAS_COM_COBRADORNOME_COBRADOR: TStringField;
    TB_ACIONAMENTOSITUACAO: TWordField;
    TB_DEPRE: TADOTable;
    TB_RECEBIMENTOPROMESSA_PAGAMENTO: TDateTimeField;
    TB_RECEBIMENTOPAGTO_PRE_DATADO: TBooleanField;
    QU_COBRANCAS_COM_COBRADORDEVEDOR: TIntegerField;
    TB_ACIONAMENTOIDDEVEDOR: TIntegerField;
    QU_CONSULTA_COBRANCA: TADOQuery;
    QU_CONSULTA_DEVEDOR: TADOQuery;
    QU_CONSULTA_TELEFONES: TADOQuery;
    QU_CONSULTA_ENDERECOS: TADOQuery;
    QU_CONSULTA_ITENS_COBRANCA: TADOQuery;
    QU_CONSULTA_CREDOR: TADOQuery;
    QU_CONSULTA_ACORDO: TADOQuery;
    QU_RECEBIMENTO_COM_COBRADOR: TADOQuery;
    TB_RECEBIMENTONOME_COBRADOR: TStringField;
    QU_CONSULTA_ITENS_ACORDO: TADOQuery;
    TB_DEPREIDDEPRE: TAutoIncField;
    TB_DEPREANO: TSmallintField;
    TB_DEPREMES: TWordField;
    TB_DEPREINDICE: TFloatField;
    TB_RECEBIMENTOVENCIMENTO_REAL: TDateTimeField;
    TB_RECEBIMENTOJUROS: TFloatField;
    TB_RECEBIMENTOCHEQUE_COMPENSADO: TBooleanField;
    TB_RECEBIMENTOBANCO: TSmallintField;
    TB_BOLETO: TADOTable;
    TB_BOLETOIDBOLETO: TAutoIncField;
    TB_BOLETOIDCREDOR: TIntegerField;
    TB_BOLETOBANCO: TWideStringField;
    TB_BOLETOCEDENTE: TWideStringField;
    TB_BOLETOCARTEIRA: TWideStringField;
    TB_BOLETOAGENCIA: TWideStringField;
    TB_BOLETOCONTA_CORRENTE: TWideStringField;
    TB_BOLETODIGITO: TWideStringField;
    TB_BOLETOMODALIDADE: TWideStringField;
    TB_BOLETOCONVENIO: TWideStringField;
    TB_CREDORGERAR_BOLETOS: TBooleanField;
    dsMestreCredor: TDataSource;
    TB_PARAMETROSJUROS_DEPRE: TFloatField;
    TB_PARAMETROSIDCREDORPROPRIETARIO: TIntegerField;
    TB_COBRADORUSUARIO_INCLUSAO: TWideStringField;
    TB_COBRADORUSUARIO_ALTERACAO: TWideStringField;
    TB_COBRADORDATA_INCLUSAO: TDateTimeField;
    TB_COBRADORDATA_ALTERACAO: TDateTimeField;
    TB_COBRANCAGRUPO_COBRANCA: TIntegerField;
    TB_DEVEDORUSUARIO_CADASTRO: TWideStringField;
    TB_DEVEDORCODIGO_ALTERNATIVO: TWideStringField;
    TB_DEVEDOREH_LOCALIZADO: TBooleanField;
    TB_GRUPO_COBRANCA: TADOTable;
    TB_GRUPO_COBRANCAIDGRUPO: TAutoIncField;
    TB_GRUPO_COBRANCADESCRICAO: TWideStringField;
    TB_GRUPO_COBRANCAIDCREDOR: TIntegerField;
    TB_GRUPO_COBRANCAOBSERVACAO: TMemoField;
    TB_GRUPO_COBRANCAVALIDADE: TDateTimeField;
    TB_GRUPO_COBRANCASITUACAO: TWordField;
    TB_GRUPO_COBRANCADESCONTO_MAXIMO: TFloatField;
    TB_METAS: TADOTable;
    TB_METASIDMETA: TIntegerField;
    TB_METASIDCOBRADOR: TIntegerField;
    TB_METASANO: TSmallintField;
    TB_METASMES: TWordField;
    TB_METASMETA: TFloatField;
    TB_MOTIVOS_ACIONAMENTOS: TADOTable;
    TB_MOTIVOS_ACIONAMENTOSCODIGO: TIntegerField;
    TB_MOTIVOS_ACIONAMENTOSDESCRICAO: TWideStringField;
    TB_RECEBIMENTOIDREPASSE: TIntegerField;
    TB_REPASSE: TADOTable;
    TB_RECIBOSITUACAO: TWordField;
    TB_RECIBOMOTIVO_CANCELAMENTO: TWideStringField;
    TB_REPASSEIDREPASSE: TAutoIncField;
    TB_REPASSEIDCREDOR: TIntegerField;
    TB_REPASSEDATA_REPASSE: TDateTimeField;
    TB_REPASSEVALOR_REPASSE: TFloatField;
    TB_REPASSESITUACAO: TWordField;
    TB_BOLETOUSUARIO_INCLUSAO: TWideStringField;
    TB_BOLETOUSUARIO_ALTERACAO: TWideStringField;
    TB_BOLETODATA_INCLUSAO: TDateTimeField;
    TB_BOLETODATA_ALTERACAO: TDateTimeField;
    TB_DEPREUSUARIO_INCLUSAO: TWideStringField;
    TB_DEPREUSUARIO_ALTERACAO: TWideStringField;
    TB_DEPREDATA_INCLUSAO: TDateTimeField;
    TB_DEPREDATA_ALTERACAO: TDateTimeField;
    TB_GRUPO_COBRANCAUSUARIO_INCLUSAO: TWideStringField;
    TB_GRUPO_COBRANCAUSUARIO_ALTERACAO: TWideStringField;
    TB_GRUPO_COBRANCADATA_INCLUSAO: TDateTimeField;
    TB_GRUPO_COBRANCADATA_ALTERACAO: TDateTimeField;
    TB_MENUUSUARIO_INCLUSAO: TWideStringField;
    TB_MENUUSUARIO_ALTERACAO: TWideStringField;
    TB_MENUDATA_INCLUSAO: TDateTimeField;
    TB_MENUDATA_ALTERACAO: TDateTimeField;
    TB_METASUSUARIO_INCLUSAO: TWideStringField;
    TB_METASUSUARIO_ALTERACAO: TWideStringField;
    TB_METASDATA_INCLUSAO: TDateTimeField;
    TB_METASDATA_ALTERACAO: TDateTimeField;
    TB_MOTIVOS_ACIONAMENTOSUSUARIO_INCLUSAO: TWideStringField;
    TB_MOTIVOS_ACIONAMENTOSUSUARIO_ALTERACAO: TWideStringField;
    TB_MOTIVOS_ACIONAMENTOSDATA_INCLUSAO: TDateTimeField;
    TB_MOTIVOS_ACIONAMENTOSDATA_ALTERACAO: TDateTimeField;
    TB_PARAMETROSUSUARIO_INCLUSAO: TWideStringField;
    TB_PARAMETROSUSUARIO_ALTERACAO: TWideStringField;
    TB_PARAMETROSDATA_INCLUSAO: TDateTimeField;
    TB_PARAMETROSDATA_ALTERACAO: TDateTimeField;
    TB_RECIBOUSUARIO_INCLUSAO: TWideStringField;
    TB_RECIBOUSUARIO_ALTERACAO: TWideStringField;
    TB_RECIBODATA_INCLUSAO: TDateTimeField;
    TB_RECIBODATA_ALTERACAO: TDateTimeField;
    TB_REPASSEUSUARIO_INCLUSAO: TWideStringField;
    TB_REPASSEUSUARIO_ALTERACAO: TWideStringField;
    TB_REPASSEDATA_INCLUSAO: TDateTimeField;
    TB_REPASSEDATA_ALTERACAO: TDateTimeField;
    TB_PARAMETROSEMPRESA: TWordField;
    TB_PARAMETROSNUMERO_SERIAL: TWideStringField;
    TB_USUARIOENDERECO_IP: TWideStringField;
    TB_USUARIONOME_COMPUTADOR: TWideStringField;
    TB_USUARIOUSUARIO_REDE: TWideStringField;
    TB_USUARIOUSUARIO_LOGADO: TBooleanField;
    TB_PROPOSTA: TADOTable;
    TB_PROPOSTAIDPROPOSTA: TAutoIncField;
    TB_PROPOSTAIDCOBRANCA: TIntegerField;
    TB_PROPOSTAVALOR: TFloatField;
    TB_PROPOSTAENTRADA: TFloatField;
    TB_PROPOSTAPARCELAS: TWordField;
    TB_PROPOSTAVALIDADE: TDateTimeField;
    TB_PROPOSTASITUACAO: TWordField;
    TB_PROPOSTAOBSERVACAO: TMemoField;
    TB_PROPOSTAUSUARIO_INCLUSAO: TWideStringField;
    TB_PROPOSTAUSUARIO_ALTERACAO: TWideStringField;
    TB_PROPOSTADATA_INCLUSAO: TDateTimeField;
    TB_PROPOSTADATA_ALTERACAO: TDateTimeField;
    TB_REPASSEDESCRICAO: TWideStringField;
    TB_TIPO_SITUACAOSITUACAO: TWordField;
    TB_COBRANCATIPO_SITUACAO: TStringField;
    TB_BOLETONOSSO_NUMERO: TIntegerField;
    TB_RECEBIMENTONUMERO_BOLETO: TIntegerField;
    QU_COBRANCAS_COM_COBRADORSTATUS: TStringField;
    TB_DEVEDORENDERECO_PRINCIPAL: TIntegerField;
    TB_DEVEDORTELEFONE_PRINCIPAL: TIntegerField;
    TB_ACORDODATA_ACORDO: TDateTimeField;
    TB_ACIONAMENTOOBSERVACAO: TWideStringField;
    TB_ACIONAMENTOIDCHAMADO: TIntegerField;
    TB_MENUTEM_BARRA: TBooleanField;
    TB_AVISO: TADOTable;
    TB_AVISOIDAVISO: TAutoIncField;
    TB_AVISOIDCREDOR: TIntegerField;
    TB_AVISODESCRICAO: TWideStringField;
    TB_AVISODATA: TDateTimeField;
    TB_AVISOUSUARIO_INCLUSAO: TWideStringField;
    TB_AVISOUSUARIO_ALTERACAO: TWideStringField;
    TB_AVISODATA_INCLUSAO: TDateTimeField;
    TB_AVISODATA_ALTERACAO: TDateTimeField;
    TB_ITENS_AVISO: TADOTable;
    TB_ITENS_AVISOIDDEVEDOR_AVISO: TAutoIncField;
    TB_ITENS_AVISOIDAVISO: TIntegerField;
    TB_ITENS_AVISOIDDEVEDOR: TIntegerField;
    TB_ITENS_AVISOIDCOBRANCA: TIntegerField;
    TB_ITENS_AVISOUSUARIO_INCLUSAO: TWideStringField;
    TB_ITENS_AVISOUSUARIO_ALTERACAO: TWideStringField;
    TB_ITENS_AVISODATA_INCLUSAO: TDateTimeField;
    TB_ITENS_AVISODATA_ALTERACAO: TDateTimeField;
    TB_CHAMADO: TADOTable;
    TB_CHAMADOIDCHAMADO: TAutoIncField;
    TB_CHAMADOIDCOBRADOR: TIntegerField;
    TB_CHAMADOIDCREDOR: TIntegerField;
    TB_CHAMADOIDDEVEDOR: TIntegerField;
    TB_CHAMADOIDCOBRANCA: TIntegerField;
    TB_CHAMADOIDACORDO: TIntegerField;
    TB_CHAMADOHORA_INICIO_CONFIRMADA: TDateTimeField;
    TB_CHAMADOHORA_FINAL_CONFIRMADA: TDateTimeField;
    TB_CHAMADOHORA_INICIO_PROGRAMADA: TDateTimeField;
    TB_CHAMADOHORA_FINAL_PROGRAMADA: TDateTimeField;
    TB_CHAMADOSITUACAO: TWordField;
    TB_CHAMADOUSUARIO_INCLUSAO: TWideStringField;
    TB_CHAMADOUSUARIO_ALTERACAO: TWideStringField;
    TB_CHAMADODATA_INCLUSAO: TDateTimeField;
    TB_CHAMADODATA_ALTERACAO: TDateTimeField;
    TB_ACIONAMENTOIDTELEFONE: TIntegerField;
    TB_PROPOSTADIA_VENCIMENTO: TWordField;
    procedure TB_ACIONAMENTOBeforePost(DataSet: TDataSet);
    procedure TB_ITENS_COBRANCAAfterInsert(DataSet: TDataSet);
    procedure TB_ITENS_COBRANCAAfterPost(DataSet: TDataSet);
    procedure TB_COBRANCABeforePost(DataSet: TDataSet);
    procedure TB_ITENS_COBRANCABeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure TB_ITENS_COBRANCAEMISSAO_DOCUMENTOChange(Sender: TField);
    procedure TB_USUARIOSENHASetText(Sender: TField; const Text: String);
    procedure TB_ITENS_COBRANCACalcFields(DataSet: TDataSet);
    procedure TB_ALINESBeforePost(DataSet: TDataSet);
    procedure TB_CREDORBeforePost(DataSet: TDataSet);
    procedure TB_RECEBIMENTOBeforePost(DataSet: TDataSet);
    procedure TB_ESTADOBeforePost(DataSet: TDataSet);
    procedure TB_DEVEDORBeforePost(DataSet: TDataSet);
    procedure TB_USUARIOBeforePost(DataSet: TDataSet);
    procedure TB_TIPO_DOCUMENTOBeforePost(DataSet: TDataSet);
    procedure TB_TELEFONESBeforePost(DataSet: TDataSet);
    procedure TB_TIPO_PESSOABeforePost(DataSet: TDataSet);
    procedure TB_TIPO_SITUACAOBeforePost(DataSet: TDataSet);
    procedure TB_BANCOBeforePost(DataSet: TDataSet);
    procedure TB_ENDERECOSBeforePost(DataSet: TDataSet);
    procedure TB_ITENS_COBRANCAAfterDelete(DataSet: TDataSet);
    procedure TB_RECEBIMENTOQUITADOValidate(Sender: TField);
    procedure TB_RECEBIMENTOCalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure TB_DEVEDORCNPJ_CPFValidate(Sender: TField);
    procedure TB_ACORDOBeforePost(DataSet: TDataSet);
    procedure TB_BOLETOBeforePost(DataSet: TDataSet);
    procedure TB_COBRADORBeforePost(DataSet: TDataSet);
    procedure TB_DEPREBeforePost(DataSet: TDataSet);
    procedure TB_GRUPO_COBRANCABeforePost(DataSet: TDataSet);
    procedure TB_MENUBeforePost(DataSet: TDataSet);
    procedure TB_METASBeforePost(DataSet: TDataSet);
    procedure TB_MOTIVOS_ACIONAMENTOSBeforePost(DataSet: TDataSet);
    procedure TB_PARAMETROSBeforePost(DataSet: TDataSet);
    procedure TB_RECIBOBeforePost(DataSet: TDataSet);
    procedure TB_REPASSEBeforePost(DataSet: TDataSet);
    procedure TB_USUARIO_MENUBeforePost(DataSet: TDataSet);
    procedure TB_CHAMADOBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    function flRetornarProximaSequencia: Integer;
    procedure plAtualizarTotal;
    procedure plParametrosSistema;
    procedure plAbrirTabelas;
    procedure plFecharTabelas;
  public
    { Public declarations }
    function flRetornarQuantRecebimentoRepasse: Integer;
    function flRetornarValorTotalRecebimentoRepasse: Double;
    function flRetornaQuantidadeQuitadas(cCredor : Integer) : Double;
    function flRetornaQuantidadeAtrasadas(cCredor : Integer): Double;
    function flRetornaQuantidadeAcionadas(cCredor : Integer; cAcionadas : Boolean):
        Integer;
    procedure plDesconectarUsuario;
    procedure plConsultaCobrancaporDevedor(const ciDevedor : Integer);
    procedure plConsultaAcionamentoporDevedor(const ciDevedor : Integer);
    procedure plConsultaAcionamentoporCobranca(const ciCobranca : Integer);
    procedure plConsultaCobranca(const ciCobranca : Integer);
    procedure plRetornaItensMenu(IdMenuPai:String);
    function  plLiberaAcessoMenu(Menu:String) : Boolean;
    procedure plConsultaParcelas(const ciCobranca : Integer);
    procedure plAtualizarAcordo;
    procedure plConsultaItensCobranca(const ciCobranca : Integer);
    procedure plConsultaDevedor(const ciDevedor : Integer);
    procedure plConsultaCobrancaPendentes(clCobranca : Integer; clCredor : Integer;
        clDevedor : Integer; DataInicio : TDateTime; DataFinal  : TDateTime);
    procedure plConsultaCobrancaCobradorAtivo(clCredor : Integer; DataInicio :
        TDateTime; DataFinal : TDateTime; clCobrador : Integer; LikeNomeDevedor :
        String);
    procedure plConsultaCobrancaporDevedorSintetico(const ciDevedor : Integer);
    procedure plConsultaAcordoDevedorSintetico(const ciDevedor : Integer);
    procedure plConsultaRecebimentoCobrador(clCredor : Integer; DataInicio :
        TDateTime; DataFinal : TDateTime; clCobrador : Integer; LikeNomeDevedor :
        String; cbSomentePagos : Boolean);
    procedure plConsultaCredor(const ciCredor : Integer);
    procedure plConsultaDevedorTelefones(const ciDevedor : Integer);
    procedure plConsultaDevedorEndereco(const ciDevedor : Integer);
    procedure plConsultaItensAcordo(const ciCobranca : Integer);
    procedure plImprimeRelCobrancasPendentesTipoDocumento(clCredor, clTipoDocumento
        : Integer; Configurar : Boolean);

    function flValorCorrigidoByTabDepre(cData : TDateTime; cValor : Double) : Double;
    procedure pImprimirResumoCredor(Credor:LongInt;Configura : Boolean);
    procedure plConsultaAcionamentoPendentes(const ciCredor : Integer; cDataInicio,
        cDataFinal : TDatetime);
    procedure plConsultaCobrancaCobradorReceptivo(clCredor : Integer; DataInicio :
        TDateTime; DataFinal : TDateTime; clCobrador : Integer; LikeNomeDevedor :
        String);
    procedure plPosicionaDevedor(cDevedor : Integer);
    procedure plPosicionaCredor(cCredor : Integer);
    procedure plResumoCredor(cCredor : Integer; Var cAberto, cAcordo, cFechado : Double);    
 end;

var
  Dados: TDados;

implementation

uses
   Math;

resourcestring
  StrParametrizandoSiste = 'Parametrizando Sistema';
  StrConectandoUsuario = 'Conectando Usuario';
  StrUsuarioNaoCadastra = 'Usuario não Cadastrado';
  StrOperacaoCancelada = 'Operação Cancelada : Valor do Repasse maior que o ' +
  'Valor da Parcela.';
  StrUsuarioNaoEncontra = 'Usuario não encontrado';

{$R *.dfm}

function TDados.flRetornarProximaSequencia: Integer;
var
  FQuery : TADOQuery;
  int : integer;
begin
  FQuery := TADOQuery.Create(Self);
  with FQuery do begin
    FQuery.Connection := Conexao;
    Try
      Try
        SQL.Add(' Select Max(ITEM) as Proximo ');
        SQL.Add(' From ITENS_COBRANCA ');
        SQL.Add(' Where COBRANCA ='+ IntToStr(TB_COBRANCACOBRANCA.Value));
        Open;
        Int:= FieldByName('Proximo').asInteger + 1;
        Result := int;
      Except
        On E: Exception Do
           ShowMessage(E.Message);
      End;
    Finally
      free;
    End;
  end; {with vQry}
end;


procedure TDados.plAtualizarTotal;
var
  vQry     : TADOQuery;
  Cobranca : Integer;
  Soma     : Double;
begin
  vQry := TADOQuery.Create(Self);
  with vQry do begin
    vQry.Connection := Conexao;
    Try
      SQL.Add('Select Sum(VALOR_DOCUMENTO) as Total');
      SQL.Add('From ITENS_COBRANCA');
      SQL.Add('Where COBRANCA ='+ IntToStr(TB_COBRANCACOBRANCA.Value));
      Open;
      Soma:= FieldByName('Total').AsFloat;
      Cobranca := TB_COBRANCACOBRANCA.Value;
      Close;
    Finally
      free;
    End;
  end; {with vQry}
  Dados.TB_COBRANCA.Close;
  Dados.TB_ITENS_COBRANCA.Close;
  Dados.TB_COBRANCA.Open;
  Dados.TB_ITENS_COBRANCA.Open;
  If   TB_COBRANCA.Locate(TB_COBRANCACOBRANCA.FieldName,Cobranca,[loCaseInsensitive, loPartialKey]) Then
       Begin
         If   Not(TB_COBRANCA.State = dsEdit) Then
              TB_COBRANCA.Edit;
         Try
           TB_COBRANCA.FieldByName('VALOR_DIVIDA').AsFloat := Soma;
           TB_COBRANCA.Post;
         Except
           TB_COBRANCA.Cancel;
         End;
  end; {with vQry}
end;

procedure TDados.TB_ACIONAMENTOBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_ACIONAMENTODATA_ACIONAMENTO.Value := Now;
                   TB_ACIONAMENTODATA_INCLUSAO.Value    := Now;
                   TB_ACIONAMENTOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_ACIONAMENTODATA_ALTERACAO.Value    := Now;
                   TB_ACIONAMENTOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_ITENS_COBRANCAAfterInsert(DataSet: TDataSet);
begin
  TB_ITENS_COBRANCAITEM.Value := flRetornarProximaSequencia;
end;

procedure TDados.TB_ITENS_COBRANCAAfterPost(DataSet: TDataSet);
begin
  plAtualizarTotal;
end;

procedure TDados.TB_COBRANCABeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                  TB_COBRANCADATA_CADASTRO.Value    := Date;
                  TB_COBRANCAUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   If   TB_COBRANCASITUACAO.NewValue <> 0 Then
                        TB_COBRANCADATA_ENCERRAMENTO.Value := Now;
                   If   TB_COBRANCADATA_CADASTRO.IsNull Then
                        TB_COBRANCADATA_CADASTRO.Value := Date;
                   TB_COBRANCADATA_ALTERACAO.Value := Date;
                   TB_COBRANCAUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_ITENS_COBRANCABeforePost(DataSet: TDataSet);
begin
  Try
    If   (TB_ITENS_COBRANCAITEM.IsNull)
    Or   (TB_ITENS_COBRANCAITEM.Value = 0) Then
          flRetornarProximaSequencia;
    Case DataSet.State of
      dsInsert:  Begin
                   TB_ITENS_COBRANCADATA_INCLUSAO.Value    := Date;
                   TB_ITENS_COBRANCAUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_ITENS_COBRANCADATA_ALTERACAO.Value    := Date;
                   TB_ITENS_COBRANCAUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.DataModuleCreate(Sender: TObject);
begin
  Try
   plAbrirTabelas;
  Except
    On E: Exception Do
       Begin
         ShowMessage(E.Message);
         Halt;
       End;
  End;
end;

procedure TDados.TB_ITENS_COBRANCAEMISSAO_DOCUMENTOChange(Sender: TField);
begin
  TB_ITENS_COBRANCAVENCIMENTO_DOCUMENTO.AsDateTime := TB_ITENS_COBRANCAEMISSAO_DOCUMENTO.AsDateTime;
end;


procedure TDados.TB_USUARIOSENHASetText(Sender: TField;
  const Text: String);
begin
  TB_USUARIOSENHA.Value := Criptografar(Text);
end;

procedure TDados.TB_ITENS_COBRANCACalcFields(DataSet: TDataSet);
begin
   If   TB_COBRANCASITUACAO.Value <> 1 Then
        TB_ITENS_COBRANCADIAS_EM_ATRASOS.Value := DaysBetween(Now,TB_ITENS_COBRANCAVENCIMENTO_DOCUMENTO.Value)
   Else TB_ITENS_COBRANCADIAS_EM_ATRASOS.Value := DaysBetween(TB_COBRANCADATA_ENCERRAMENTO.Value,TB_ITENS_COBRANCAVENCIMENTO_DOCUMENTO.Value);
   If   TB_COBRANCAAPLICAR_FINANCEIRO.Value Then
        TB_ITENS_COBRANCAVALOR_CORRIGIDO.Value := TB_ITENS_COBRANCAVALOR_DOCUMENTO.Value +
                                                  ((TB_ITENS_COBRANCAVALOR_DOCUMENTO.Value *
                                                   (TB_ITENS_COBRANCADIAS_EM_ATRASOS.Value/100)) *
                                                    TB_COBRANCAPERCENTUAL_ATRASO.Value) +
                                                    (TB_ITENS_COBRANCAVALOR_DOCUMENTO.Value *
                                                    (TB_COBRANCAMULTA.Value/100))
   Else TB_ITENS_COBRANCAVALOR_CORRIGIDO.Value := flValorCorrigidoByTabDepre(TB_ITENS_COBRANCAVENCIMENTO_DOCUMENTO.Value,
                                                                          TB_ITENS_COBRANCAVALOR_DOCUMENTO.Value);
end;

procedure TDados.plParametrosSistema;
begin
  TB_PARAMETROS.First;
  TUniqueParametros.GetParametros.Versao          := TB_PARAMETROSVERSAO_SISTEMA.AsInteger;
  TUniqueParametros.GetParametros.IndiceDEPRE     := TB_PARAMETROSJUROS_DEPRE.Value;
  TUniqueParametros.GetParametros.EmpresaIdCredor := TB_PARAMETROSIDCREDORPROPRIETARIO.Value;
  TUniqueParametros.GetParametros.UltimoRecibo    := TB_PARAMETROSULTIMO_NUM_RECIBO.Value;
end;

procedure TDados.TB_ALINESBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_ALINESDATA_INCLUSAO.Value    := Date;
                   TB_ALINESUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_ALINESDATA_ALTERACAO.Value    := Date;
                   TB_ALINESUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_CREDORBeforePost(DataSet: TDataSet);
begin
  Try

    Case TB_CREDORTIPO_CREDOR.Value of
      0 : Begin
            If  Not(ValidaCPF(TB_CREDORCNPJ_CPF.Value)) Then
                Raise Exception.Create('CPF Invalido!');
          End;
      1 : Begin
            If  Not(ValidaCNPJ(TB_CREDORCNPJ_CPF.Value)) Then
                Raise Exception.Create('CNPJ Invalido!');
          End;
     End;

    Case DataSet.State of
      dsInsert:  Begin
                   TB_CREDORDATA_INCLUSAO.Value    := Date;
                   TB_CREDORUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_CREDORDATA_ALTERACAO.Value    := Date;
                   TB_CREDORUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_RECEBIMENTOBeforePost(DataSet: TDataSet);
begin
  Try
    If   (TB_RECEBIMENTOVALOR_REPASSE.Value > TB_RECEBIMENTOVALOR.Value) Then
         Raise Exception.Create(StrOperacaoCancelada);

    Case DataSet.State of
      dsInsert:  Begin
                   TB_RECEBIMENTODATA_INCLUSAO.Value    := Date;
                   TB_RECEBIMENTOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_RECEBIMENTODATA_ALTERACAO.Value    := Date;
                   TB_RECEBIMENTOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;

  Except
    On E: Exception Do
       Raise Exception.Create(E.Message);
  End;
end;

procedure TDados.TB_ESTADOBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_ESTADODATA_INCLUSAO.Value    := Date;
                   TB_ESTADOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_ESTADODATA_ALTERACAO.Value    := Date;
                   TB_ESTADOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_DEVEDORBeforePost(DataSet: TDataSet);
begin
  Try
    Case TB_DEVEDORTIPO_DEVEDOR.Value of
      0 : Begin
            If  Not(ValidaCPF(TB_DEVEDORCNPJ_CPF.Value)) Then
                Raise Exception.Create('CPF Invalido!');
          End;
      1 : Begin
            If  Not(ValidaCNPJ(TB_DEVEDORCNPJ_CPF.Value)) Then
                Raise Exception.Create('CNPJ Invalido!');
          End;
     End;

    Case DataSet.State of
      dsInsert:  Begin
                   TB_DEVEDORDATA_INCLUSAO.Value    := Date;
                   TB_DEVEDORUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_DEVEDORDATA_ALTERACAO.Value    := Date;
                   TB_DEVEDORUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
    On E: Exception Do
       Raise Exception.Create(E.Message);
  End;
end;

procedure TDados.TB_USUARIOBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_USUARIODATA_INCLUSAO.Value    := Date;
                   TB_USUARIOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_USUARIODATA_ALTERACAO.Value    := Date;
                   TB_USUARIOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_TIPO_DOCUMENTOBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_TIPO_DOCUMENTODATA_INCLUSAO.Value    := Date;
                   TB_TIPO_DOCUMENTOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_TIPO_DOCUMENTODATA_ALTERACAO.Value    := Date;
                   TB_TIPO_DOCUMENTOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
    On E: Exception Do
       Raise Exception.Create(E.Message);
  End;
end;

procedure TDados.TB_TELEFONESBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_TELEFONESDATA_INCLUSAO.Value    := Date;
                   TB_TELEFONESUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_TELEFONESDATA_ALTERACAO.Value    := Date;
                   TB_TELEFONESUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
    On E: Exception Do
       Raise Exception.Create(E.Message);
  End;
end;

procedure TDados.TB_TIPO_PESSOABeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_TIPO_PESSOADATA_INCLUSAO.Value    := Date;
                   TB_TIPO_PESSOAUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_TIPO_PESSOADATA_ALTERACAO.Value    := Date;
                   TB_TIPO_PESSOAUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
    On E: Exception Do
       Raise Exception.Create(E.Message);
  End;
end;

procedure TDados.TB_TIPO_SITUACAOBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_TIPO_SITUACAODATA_INCLUSAO.Value    := Date;
                   TB_TIPO_SITUACAOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_TIPO_SITUACAODATA_ALTERACAO.Value    := Date;
                   TB_TIPO_SITUACAOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_BANCOBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_BANCODATA_INCLUSAO.Value    := Date;
                   TB_BANCOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_BANCODATA_ALTERACAO.Value    := Date;
                   TB_BANCOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
    On E: Exception Do
       Raise Exception.Create(E.Message);
  End;
end;

procedure TDados.TB_ENDERECOSBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_ENDERECOSDATA_INCLUSAO.Value    := Date;
                   TB_ENDERECOSUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_ENDERECOSDATA_ALTERACAO.Value    := Date;
                   TB_ENDERECOSUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.plConsultaCobrancaporDevedor(const ciDevedor : Integer);
begin
  With QU_CONSULTACOBRANCA Do
    Begin
      Parameters.AddParameter.Name := 'DEVEDOR';
      Active := False;
      SQL.Clear;
      SQL.Add(' SELECT ');
      SQL.Add(' A.COBRANCA AS Cobranca, ');
      SQL.Add(' C.NOME_CREDOR AS Credor, ');
      SQL.Add(' A.DATA_CADASTRO AS Data, ');
      SQL.Add(' A.VALOR_DIVIDA AS Valor, ');
      SQL.Add(' B.ITEM AS Item, ');
      SQL.Add(' B.NUMERO_DOCUMENTO AS Documento, ');
      SQL.Add(' B.VENCIMENTO_DOCUMENTO AS Vencimento, ');
      SQL.Add(' B.VALOR_DOCUMENTO AS Valor_Item, ');
      SQL.Add(' A.SITUACAO AS Sit, ');
      SQL.Add(' IIf(A.SITUACAO=0,"Aberta",IIf(A.SITUACAO=1,"Acordo","Encerrado")) AS Situação ');
      SQL.Add(' FROM COBRANCA A, ITENS_COBRANCA B, CREDOR C ');
      SQL.Add(' WHERE A.COBRANCA = B.COBRANCA ');
      SQL.Add(' AND A.CREDOR = C.CODIGO_CREDOR ');
      SQL.Add(' AND A.DEVEDOR = :DEVEDOR ');
      Parameters.ParamByName('DEVEDOR').Value := ciDevedor;
      Prepared;
      Open;
      Active := True;
    End;
End;

procedure TDados.TB_ITENS_COBRANCAAfterDelete(DataSet: TDataSet);
begin
  plAtualizarTotal;
end;

procedure TDados.plConsultaAcionamentoporDevedor(const ciDevedor : Integer);
begin
  With QU_CONSULTA_ACIONAMENTO Do
    Begin
      Parameters.AddParameter.Name := 'PDEVEDOR';
      Active := False;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  ');
      SQL.Add(' A.DATA_ACIONAMENTO, ');
      SQL.Add(' A.USUARIO_INCLUSAO, ');
      SQL.Add(' A.COBRANCA, ');
      SQL.Add(' R.NOME_CREDOR, ');
      SQL.Add(' A.HISTORICO ');
      SQL.Add(' FROM  ACIONAMENTO A, COBRANCA C, CREDOR R ');
      SQL.Add(' WHERE A.COBRANCA = C.COBRANCA ');
      SQL.Add(' AND C.CREDOR = R.CODIGO_CREDOR ');
      SQL.Add(' AND A.IDDEVEDOR = :PDEVEDOR ');
      SQL.Add(' ORDER BY A.DATA_ACIONAMENTO, A.COBRANCA ');
      Parameters.ParamByName('PDEVEDOR').Value := ciDevedor;
      Open;
      Active := True;
    End;
end;

procedure TDados.plConsultaAcionamentoporCobranca(const ciCobranca : Integer);
begin
  With QU_CONSULTA_ACIONAMENTO Do
    Begin
      Parameters.AddParameter.Name := 'PCOBRANCA';
      Active := False;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  ');
      SQL.Add(' A.DATA_ACIONAMENTO, ');
      SQL.Add(' A.USUARIO_INCLUSAO, ');
      SQL.Add(' (SELECT NUMERO_TELEFONE FROM TELEFONES T WHERE T.ITEM_TELEFONE = A.IDTELEFONE) As TELEFONE, ');
      SQL.Add(' A.HISTORICO ');
      SQL.Add(' FROM  ACIONAMENTO A ');
      SQL.Add(' WHERE A.COBRANCA =  :PCOBRANCA ');
      SQL.Add(' ORDER BY A.DATA_ACIONAMENTO ');
      Parameters.ParamByName('PCOBRANCA').Value := ciCobranca;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plConsultaCobranca(const ciCobranca : Integer);
begin
  With QU_CONSULTA_COBRANCA Do
    Begin
      Parameters.AddParameter.Name := 'PCOBRANCA';
      Active := False;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  ');
      SQL.Add(' * ');
      SQL.Add(' FROM  COBRANCA C ');
      SQL.Add(' WHERE C.COBRANCA =  :PCOBRANCA ');
      Parameters.ParamByName('PCOBRANCA').Value := ciCobranca;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plRetornaItensMenu(IdMenuPai: String);
begin
  With QU_MENU Do
    Begin
      Parameters.AddParameter.Name := 'MENUPAI';
      Active := False;
      SQL.Clear;
      SQL.Add(' SELECT ');
      SQL.Add(' * ');
      SQL.Add(' FROM MENU M ');
      SQL.Add(' WHERE M.IDMENUPAI = :MENUPAI ');
      Parameters.ParamByName('MENUPAI').Value := IdMenuPai;
      Prepared;
      Open;
      Active := True;
    End;
end;

function TDados.plLiberaAcessoMenu(Menu: String) : Boolean;
begin
  Try
    If   Not TB_USUARIO.Locate('USUARIO',TUniqueParametros.GetParametros.Usuario,[]) Then
         Raise Exception.Create('Usuario não encontrado');

    If   TB_USUARIO_MENU.Locate('IDUSUARIO;IDMENU', VarArrayOf([TB_USUARIOID.Value,Menu]), [loPartialKey]) then
         Result := True
    else Result := False;

  Except
    Result := False;
  End;
end;

procedure TDados.plConsultaParcelas(const ciCobranca : Integer);
begin
  With QU_CONSULTAPARCELAS Do
    Begin
      Parameters.AddParameter.Name := 'COBRANCA';
      Active := False;
      SQL.Clear;
      SQL.Add(' SELECT ');
      SQL.Add(' * ');
      SQL.Add(' FROM RECEBIMENTO R ');
      SQL.Add(' WHERE R.COBRANCA = :COBRANCA ');
      Parameters.ParamByName('COBRANCA').Value := ciCobranca;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plAtualizarAcordo;
var
  vQry       : TADOQuery;
  Achou      : Boolean;
  lbParcelas : Byte;
  ldValor    : Double;
begin
  Achou := False;
  vQry := TADOQuery.Create(nil);
  with vQry do begin
    Connection := Conexao;
    Try
      Try
        Parameters.AddParameter.Name := 'COBRANCAEX';
        Close;
        SQL.Clear;
        SQL.Add(' SELECT ');
        SQL.Add(' R.COBRANCA, ');
        SQL.Add(' COUNT(*) AS PARCELAS, ');
        SQL.Add(' SUM(R.VALOR) AS VALOR_CORRIGIDO ');
        SQL.Add(' FROM RECEBIMENTO R ');
        SQL.Add(' WHERE R.COBRANCA = :COBRANCAEX ');
        SQL.Add(' GROUP BY R.COBRANCA ');
        Parameters.ParamByName('COBRANCAEX').Value := TB_COBRANCACOBRANCA.Value;
        Prepared;
        Open;
        Active := True;
        lbParcelas := FieldByName('PARCELAS').AsInteger;
        ldValor    := FieldByName('VALOR_CORRIGIDO').AsFloat;

        Close;
        SQL.Clear;
        SQL.Add(' INSERT INTO ACORDO (COBRANCA,CREDOR,DEVEDOR,VALOR_DIVIDA,VALOR_CORRIGIDO,STATUS,PRESTACOES) ');
        SQL.Add(' VALUES ('+QuotedStr(IntToStr(TB_COBRANCACOBRANCA.Value))+','
                          +QuotedStr(IntToStr(TB_COBRANCACREDOR.Value))+','
                          +QuotedStr(IntToStr(TB_COBRANCADEVEDOR.Value))+','
                          +QuotedStr(FloatToStr(TB_COBRANCAVALOR_DIVIDA.Value))+','
                          +QuotedStr(FloatToStr(ldValor))+','
                          +QuotedStr('0')+','
                          +QuotedStr(IntToStr(lbParcelas))+' )');
        ExecSQL;

        While Not Achou Do
           Begin
             TB_ACORDO.Close;
             TB_ACORDO.Open;
             TB_ACORDO.Refresh;
             Achou := TB_ACORDO.Locate(TB_ACORDOCOBRANCA.FieldName,TB_COBRANCACOBRANCA.Value,[]);
           End;

        Close;
        SQL.Clear;
        SQL.Add(' UPDATE RECEBIMENTO R ');
        SQL.Add(' SET R.ACORDO = '+ IntToStr(TB_ACORDOIDACORDO.Value));
        SQL.Add(' WHERE R.COBRANCA = '+IntToStr(TB_COBRANCACOBRANCA.Value));

        ExecSQL;

      Except
        On E: Exception Do
           ShowMessage(E.Message);
      End;
    Finally
      free;
    End;
  end; {with vQry}
end;

procedure TDados.plImprimeRelCobrancasPendentesTipoDocumento(clCredor,
    clTipoDocumento : Integer; Configurar : Boolean);
var
  FConsulta       : TADOQuery;
  FFreeReport     : TFreeReport;
  FMyDataset      : TfrMyDBDataset;
begin
  FConsulta       := TADOQuery.Create(Self);
  FConsulta.Name  := 'Q';
  FFreeReport     := TFreeReport.Create(Self);
  FMyDataset      := TfrMyDBDataset.Create(Self);
  FMyDataset.Name := 'FrCobrancasPendentesTipoDocumento';

  Try
   with FConsulta do
   begin
     Connection := Conexao;
     Parameters.AddParameter.Name := 'CREDOR';
     Parameters.AddParameter.Name := 'TIPO_DOCUMENTO';
     Close;
     SQL.Clear;
     SQL.Add(' SELECT ');
     SQL.Add('   C.CREDOR, ');
     SQL.Add('   R.NOME_CREDOR, ');
     SQL.Add('   C.DEVEDOR, ');
     SQL.Add('   D.NOME_DEVEDOR, ');
     SQL.Add('   I.DATA_DIVIDA, ');
     SQL.Add('   I.TIPODOCUMENTO, ');
     SQL.Add('   T.SIGLA_DOCUMENTO, ');
     SQL.Add('   T.DESCRICAO, ');
     SQL.Add('   I.NUMERO_DOCUMENTO, ');
     SQL.Add('   I.VALOR_DOCUMENTO ');
     SQL.Add(' FROM COBRANCA C, ');
     SQL.Add('   ITENS_COBRANCA I, ');
     SQL.Add('   TIPO_DOCUMENTO T, ');
     SQL.Add('   CREDOR R, ');
     SQL.Add('   DEVEDOR D ');
     SQL.Add(' WHERE ');
     SQL.Add('   C.COBRANCA = I.COBRANCA ');
     SQL.Add(' AND ');
     SQL.Add('   I.TIPODOCUMENTO = T.TIPO_DOCUMENTO ');
     SQL.Add(' AND ');
     SQL.Add('   C.CREDOR = R.CODIGO_CREDOR ');
     SQL.Add(' AND ');
     SQL.Add('   C.DEVEDOR = D.CODIGO_DEVEDOR ');
     SQL.Add(' AND ');
     SQL.Add('   C.SITUACAO = 0 ');
     SQL.Add(' AND ');
     SQL.Add('   C.CREDOR = :CREDOR ');
     SQL.Add(' AND ');
     SQL.Add('   I.TIPODOCUMENTO = :TIPO_DOCUMENTO ');
     SQL.Add(' ORDER BY ');
     SQL.Add('   C.CREDOR, ');
     SQL.Add('   D.NOME_DEVEDOR ');

     Parameters.ParamByName('CREDOR').Value         := clCredor;
     Parameters.ParamByName('TIPO_DOCUMENTO').Value := clTipoDocumento;

     Prepared;
     Open;
     Active := True;

     FFreeReport.plAdicionaVariavel('vCredor',FConsulta.FieldByName('NOME_CREDOR').AsString);
     FFreeReport.plAdicionaVariavel('vTipoDocumento',FConsulta.FieldByName('DESCRICAO').AsString);

     If   FileExists(TUniqueParametros.GetParametros.DatabaseReport + 'Pendencias_Credor_TipoDocumentos.frf') Then
          FFreeReport.Arquivo   := TUniqueParametros.GetParametros.DatabaseReport + 'Pendencias_Credor_TipoDocumentos.frf';

     If   Configurar Then
          FFreeReport.Desenhar
     Else FFreeReport.Visualiza;

   End;
  Finally
    FreeAndNil(FMyDataset);
    FreeAndNil(FConsulta);
    FreeAndNil(FFreeReport);
  End;
end;

procedure TDados.TB_RECEBIMENTOQUITADOValidate(Sender: TField);
begin
  If   TB_RECEBIMENTOPAGO.Value Then
       Sender.AsString := 'Sim'
  Else Sender.AsString := 'Não';
end;

procedure TDados.TB_RECEBIMENTOCalcFields(DataSet: TDataSet);
begin
  If   TB_RECEBIMENTOPAGO.Value Then
       TB_RECEBIMENTOQUITADO.Value := 'Sim'
  Else TB_RECEBIMENTOQUITADO.Value := 'Não';
end;

procedure TDados.plAbrirTabelas;
Var
  I : Integer;
begin
  For I := 0 to Self.ComponentCount - 1 do
      If  Self.Components[I] is TADOTable Then
          Begin
            TADOTable(Components[I]).Connection := TUniqueParametros.GetParametros.Conexao;
            TADOTable(Components[I]).Open;
          End;
end;

procedure TDados.plFecharTabelas;
Var
  I : Integer;
begin
  For I := 0 to ComponentCount - 1 do
      If  Components[I] is TADOTable Then
          TADOTable(Components[I]).Close;
end;

procedure TDados.DataModuleDestroy(Sender: TObject);
begin
  plFecharTabelas;
end;

function TDados.flRetornarQuantRecebimentoRepasse: Integer;
var
  FQuery : TADOQuery;
begin
  FQuery := TADOQuery.Create(Self);
  with FQuery do begin
    FQuery.Connection := Conexao;
    Try
      Try
        SQL.Add(' Select Count(*) as Quantidade ');
        SQL.Add(' From RECEBIMENTO ');
        SQL.Add(' Where IDREPASSE ='+ IntToStr(TB_REPASSEIDREPASSE.Value));
        Open;
        Result := FieldByName('Quantidade').asInteger;
      Except
        On E: Exception Do
           ShowMessage(E.Message);
      End;
    Finally
      free;
    End;
  end; {with vQry}
end;

function TDados.flRetornarValorTotalRecebimentoRepasse: Double;
var
  FQuery : TADOQuery;
begin
  FQuery := TADOQuery.Create(Self);
  with FQuery do begin
    FQuery.Connection := Conexao;
    Try
      Try
        SQL.Add(' Select Sum(VALOR_REPASSE) as ValorRepasse ');
        SQL.Add(' From RECEBIMENTO ');
        SQL.Add(' Where IDREPASSE ='+ IntToStr(TB_REPASSEIDREPASSE.Value));
        Open;
        Result := FieldByName('ValorRepasse').AsFloat;
      Except
        On E: Exception Do
           ShowMessage(E.Message);
      End;
    Finally
      free;
    End;
  end; {with vQry}
end;

procedure TDados.plConsultaItensCobranca(const ciCobranca : Integer);
begin
  With QU_CONSULTA_ITENS_COBRANCA Do
    Begin
      Parameters.AddParameter.Name := 'PCOBRANCA';
      Active := False;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  ');
      SQL.Add(' * ');
      SQL.Add(' FROM ITENS_COBRANCA C, TIPO_DOCUMENTO T, BANCO B ');
      SQL.Add(' WHERE C.TIPODOCUMENTO = T.TIPO_DOCUMENTO ');
      SQL.Add(' AND C.BANCO_DOCUMENTO = B.NUMERO_BANCO ');
      SQL.Add(' AND C.COBRANCA =  :PCOBRANCA ');
      Parameters.ParamByName('PCOBRANCA').Value := ciCobranca;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plConsultaDevedor(const ciDevedor : Integer);
begin
  With QU_CONSULTA_DEVEDOR Do
    Begin
      Parameters.AddParameter.Name := 'PDEVEDOR';
      Active := False;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  ');
      SQL.Add(' * ');
      SQL.Add(' FROM  DEVEDOR C ');
      SQL.Add(' WHERE C.CODIGO_DEVEDOR =  :PDEVEDOR ');
      Parameters.ParamByName('PDEVEDOR').Value := ciDevedor;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plConsultaCobrancaPendentes(clCobranca : Integer; clCredor :
    Integer; clDevedor : Integer; DataInicio : TDateTime; DataFinal  :
    TDateTime);
begin
  With QU_COBRANCAS_PENDENTES Do
    Begin
      Parameters.AddParameter.Name := 'PCOBRANCA';
      Parameters.AddParameter.Name := 'PCREDOR';
      Parameters.AddParameter.Name := 'PDEVEDOR';
      Parameters.AddParameter.Name := 'PDTINICIO';
      Parameters.AddParameter.Name := 'PDTFINAL';
      Active := False;
      SQL.Clear;
      SQL.Add(' SELECT C.COBRANCA, ');
      SQL.Add('        A.NOME_CREDOR, ');
      SQL.Add('        D.NOME_DEVEDOR, ');
      SQL.Add('        C.DATA_CADASTRO, ');
      SQL.Add('        C.VALOR_DIVIDA ');
      SQL.Add(' FROM COBRANCA C, CREDOR A, DEVEDOR D ');
      SQL.Add(' WHERE C.CREDOR = A.CODIGO_CREDOR ');
      SQL.Add(' AND C.DEVEDOR = D.CODIGO_DEVEDOR ');
      SQL.Add(' AND C.SITUACAO = 0 ');
      SQL.Add(' AND C.COBRADOR = 0 ');
      If   clCobranca <> 0 Then
           SQL.Add(' AND C.COBRANCA = :PCOBRANCA ');
      If   clCredor <> 0 Then
           SQL.Add(' AND C.CREDOR = :PCREDOR ');
      If   clDevedor <> 0 Then
           SQL.Add(' AND C.DEVEDOR = :PDEVEDOR ');
      If   DataInicio <> 0 Then
           SQL.Add(' AND C.DATA_CADASTRO BETWEEN :PDTINICIO AND :PDTFINAL ');
      SQL.Add(' ORDER BY ');
      SQL.Add('     C.COBRANCA ');
      If   clCobranca <> 0 Then
           Parameters.ParamByName('PCOBRANCA').Value    := clCobranca;
      If   clCredor <> 0 Then
           Parameters.ParamByName('PCREDOR').Value      := clCredor;
      If   clDevedor <> 0 Then
           Parameters.ParamByName('PDEVEDOR').Value      := clDevedor;
      If   DataInicio <> 0 Then
           Begin
             Parameters.ParamByName('PDTINICIO').Value := DataInicio;
             Parameters.ParamByName('PDTFINAL').Value   := DataFinal;
           End;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plConsultaCobrancaCobradorAtivo(clCredor : Integer; DataInicio
    : TDateTime; DataFinal : TDateTime; clCobrador : Integer; LikeNomeDevedor :
    String);
begin
  With QU_COBRANCAS_COM_COBRADOR Do
    Begin
      Parameters.AddParameter.Name := 'PCREDOR';
      Parameters.AddParameter.Name := 'PDTINICIO';
      Parameters.AddParameter.Name := 'PDTFINAL';
      Parameters.AddParameter.Name := 'PCOBRADOR';
      Active := False;
      SQL.Clear;
      SQL.Add(' SELECT C.COBRANCA, ');
      SQL.Add('        A.NOME_CREDOR, ');
      SQL.Add('        C.DEVEDOR, ');
      SQL.Add('        D.NOME_DEVEDOR, ');
      SQL.Add('        C.DATA_CADASTRO, ');
      SQL.Add('        C.VALOR_DIVIDA, ');
      SQL.Add('        B.NOME_COBRADOR, ');
      SQL.Add('        T.DESCRICAO_SITUACAO AS STATUS ');
      SQL.Add('  FROM COBRANCA C, CREDOR A, DEVEDOR D, COBRADOR B, TIPO_SITUACAO T ');
      SQL.Add(' WHERE C.CREDOR = A.CODIGO_CREDOR ');
      SQL.Add(' AND C.DEVEDOR = D.CODIGO_DEVEDOR ');
      SQL.Add(' AND C.COBRADOR = B.IDCOBRADOR ');
      SQL.Add(' AND C.SITUACAO = T.TIPO_SITUACAO ');
      SQL.Add(' AND C.SITUACAO = 0 ');

      If   clCredor <> 0 Then
           SQL.Add(' AND C.CREDOR = :PCREDOR ');
      If   DataInicio <> 0 Then
           SQL.Add(' AND C.DATA_CADASTRO BETWEEN :PDTINICIO AND :PDTFINAL ');
      If   clCobrador <> 0 Then
           SQL.Add(' AND C.COBRADOR = :PCOBRADOR ');
      If   Trim(LikeNomeDevedor) <> '' Then
           SQL.Add(' AND D.NOME_DEVEDOR LIKE '+ AnsiQuotedStr(UpperCase(LikeNomeDevedor) +'%','"'));

      SQL.Add(' ORDER BY ');
      SQL.Add('     C.COBRADOR, ');
      SQL.Add('     A.NOME_CREDOR, ');
      SQL.Add('     C.COBRANCA ');
      If   clCredor <> 0 Then
           Parameters.ParamByName('PCREDOR').Value     := clCredor;
      If   DataInicio <> 0 Then
           Begin
             Parameters.ParamByName('PDTINICIO').Value := DataInicio;
             Parameters.ParamByName('PDTFINAL').Value  := DataFinal;
           End;
      If   clCobrador <> 0 Then
           Parameters.ParamByName('PCOBRADOR').Value   := clCobrador;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plConsultaCobrancaporDevedorSintetico(const ciDevedor :
    Integer);
begin
  With QU_CONSULTACOBRANCA Do
    Begin
      Parameters.AddParameter.Name := 'DEVEDOR';
      Active := False;
      SQL.Clear;
      SQL.Add(' SELECT ');
      SQL.Add(' A.COBRANCA AS Cobranca, ');
      SQL.Add(' C.NOME_CREDOR AS Credor, ');
      SQL.Add(' A.VALOR_DIVIDA AS Valor, ');
      SQL.Add(' A.MOTIVO_ENCERRAMENTO AS Encerramento, ');
      SQL.Add(' A.SITUACAO AS Sit, ');
      SQL.Add(' IIf(A.SITUACAO=0,"Aberta",IIf(A.SITUACAO=1,"Acordo","Encerrado")) AS Situação ');
      SQL.Add(' FROM COBRANCA A, CREDOR C ');
      SQL.Add(' WHERE A.CREDOR = C.CODIGO_CREDOR ');
      SQL.Add(' AND A.DEVEDOR = :DEVEDOR ');
      Parameters.ParamByName('DEVEDOR').Value := ciDevedor;
      Prepared;
      Open;
      Active := True;
    End;
End;

procedure TDados.plConsultaAcordoDevedorSintetico(const ciDevedor : Integer);
begin
  With QU_CONSULTA_ACORDO Do
    Begin
      Parameters.AddParameter.Name := 'DEVEDOR';
      Active := False;
      SQL.Clear;
      SQL.Add(' SELECT ');
      SQL.Add(' A.IDACORDO AS Acordo, ');
      SQL.Add(' C.NOME_CREDOR AS Credor, ');
      SQL.Add(' A.VALOR_CORRIGIDO AS Valor ');
//      SQL.Add(' A.SITUACAO AS Sit, ');
//      SQL.Add(' IIf(A.SITUACAO=0,"Aberta",IIf(A.SITUACAO=1,"Acordo","Encerrado")) AS Situação ');
      SQL.Add(' FROM ACORDO A, CREDOR C ');
      SQL.Add(' WHERE A.CREDOR = C.CODIGO_CREDOR ');
      SQL.Add(' AND A.DEVEDOR = :DEVEDOR ');
      Parameters.ParamByName('DEVEDOR').Value := ciDevedor;
      Prepared;
      Open;
      Active := True;
    End;
End;

procedure TDados.plConsultaRecebimentoCobrador(clCredor : Integer; DataInicio :
    TDateTime; DataFinal : TDateTime; clCobrador : Integer; LikeNomeDevedor :
    String; cbSomentePagos : Boolean);
begin
  With QU_RECEBIMENTO_COM_COBRADOR Do
    Begin
      Try
        Parameters.AddParameter.Name := 'PCREDOR';
        Parameters.AddParameter.Name := 'PDTINICIO';
        Parameters.AddParameter.Name := 'PDTFINAL';
        Parameters.AddParameter.Name := 'PCOBRADOR';
        Active := False;
        SQL.Clear;

        SQL.Add(' SELECT  ');
        SQL.Add('   A.IDACORDO, ');
        SQL.Add('   A.COBRANCA, ');
        SQL.Add('   A.CREDOR, ');
        SQL.Add('   C.NOME_CREDOR, ');
        SQL.Add('   A.DEVEDOR, ');
        SQL.Add('   D.NOME_DEVEDOR, ');
        SQL.Add('   A.VALOR_CORRIGIDO, ');
        SQL.Add('   R.PARCELA, ');
        SQL.Add('   A.PRESTACOES, ');
        SQL.Add('   R.VENCIMENTO, ');
        SQL.Add('   R.VALOR, ');
        SQL.Add('   B.NOME_COBRADOR ');
        SQL.Add(' FROM ACORDO A, RECEBIMENTO R, CREDOR C, DEVEDOR D, COBRADOR B ');
        SQL.Add(' WHERE A.IDACORDO = R.ACORDO ');
        SQL.Add('    AND A.CREDOR = C.CODIGO_CREDOR ');
        SQL.Add('    AND A.DEVEDOR = D.CODIGO_DEVEDOR ');
        SQL.Add('    AND R.COBRADOR = B.IDCOBRADOR ');

        If   cbSomentePagos Then
             SQL.Add('    AND R.PAGO = False ');
        If   clCredor <> 0 Then
             SQL.Add(' AND A.CREDOR = :PCREDOR ');
        If   DataInicio <> 0 Then
             SQL.Add(' AND R.VENCIMENTO BETWEEN :PDTINICIO AND :PDTFINAL ');
        If   clCobrador <> 0 Then
             SQL.Add(' AND R.COBRADOR = :PCOBRADOR ');
        If   Trim(LikeNomeDevedor) <> '' Then
             SQL.Add(' AND D.NOME_DEVEDOR LIKE '+ AnsiQuotedStr(UpperCase(LikeNomeDevedor) +'%','"'));

        SQL.Add(' ORDER BY ');
        SQL.Add('     R.COBRADOR, ');
        SQL.Add('     C.NOME_CREDOR, ');
        SQL.Add('     A.IDACORDO ');
        If   clCredor <> 0 Then
             Parameters.ParamByName('PCREDOR').Value     := clCredor;
        If   DataInicio <> 0 Then
             Begin
               Parameters.ParamByName('PDTINICIO').Value := DataInicio;
               Parameters.ParamByName('PDTFINAL').Value  := DataFinal;
             End;
        If   clCobrador <> 0 Then
             Parameters.ParamByName('PCOBRADOR').Value   := clCobrador;
        Prepared;
        Open;
        Active := True;
      Except
        Active := False;
      End;
    End;
end;

procedure TDados.plConsultaCredor(const ciCredor : Integer);
begin
  With QU_CONSULTA_CREDOR Do
    Begin
      Parameters.AddParameter.Name := 'PCREDOR';
      Active := False;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  ');
      SQL.Add(' * ');
      SQL.Add(' FROM  CREDOR C ');
      SQL.Add(' WHERE C.CODIGO_CREDOR =  :PCREDOR ');
      Parameters.ParamByName('PCREDOR').Value := ciCredor;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plConsultaDevedorTelefones(const ciDevedor : Integer);
begin
  With QU_CONSULTA_TELEFONES Do
    Begin
      Parameters.AddParameter.Name := 'PDEVEDOR';
      Active := False;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  ');
      SQL.Add(' * ');
      SQL.Add(' FROM  TELEFONES C ');
      SQL.Add(' WHERE C.CODIGO_DEVEDOR =  :PDEVEDOR ');
      Parameters.ParamByName('PDEVEDOR').Value := ciDevedor;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plConsultaDevedorEndereco(const ciDevedor : Integer);
begin
  With QU_CONSULTA_ENDERECOS Do
    Begin
      Parameters.AddParameter.Name := 'PDEVEDOR';
      Active := False;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  ');
      SQL.Add(' * ');
      SQL.Add(' FROM  ENDERECOS C ');
      SQL.Add(' WHERE C.CODIGO_DEVEDOR =  :PDEVEDOR ');
      Parameters.ParamByName('PDEVEDOR').Value := ciDevedor;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plConsultaItensAcordo(const ciCobranca : Integer);
begin
  With QU_CONSULTA_ITENS_ACORDO Do
    Begin
      Parameters.AddParameter.Name := 'PCOBRANCA';
      Active := False;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  ');
      SQL.Add(' * ');
      SQL.Add(' FROM RECEBIMENTO R LEFT JOIN TIPO_DOCUMENTO T ');
      SQL.Add(' ON (R.TIPODOCUMENTO = T.TIPO_DOCUMENTO) ');
      SQL.Add(' WHERE R.COBRANCA = :PCOBRANCA ');
      Parameters.ParamByName('PCOBRANCA').Value := ciCobranca;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.TB_DEVEDORCNPJ_CPFValidate(Sender: TField);
begin
  If  Trim(Sender.Value) = '' Then
      Raise Exception.Create('Preenchimento do Campo é Obrigatório!');
end;

procedure TDados.TB_ACORDOBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_ACORDODATA_INCLUSAO.Value    := Date;
                   TB_ACORDOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_ACORDODATA_ALTERACAO.Value := Date;
                   TB_ACORDOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_BOLETOBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_BOLETODATA_INCLUSAO.Value := Date;
                   TB_BOLETOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_BOLETODATA_ALTERACAO.Value := Date;
                   TB_BOLETOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_COBRADORBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_COBRADORDATA_INCLUSAO.Value    := Date;
                   TB_COBRADORUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_COBRADORDATA_ALTERACAO.Value    := Date;
                   TB_COBRADORUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_DEPREBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_DEPREDATA_INCLUSAO.Value    := Date;
                   TB_DEPREUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_DEPREDATA_ALTERACAO.Value    := Date;
                   TB_DEPREUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_GRUPO_COBRANCABeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_GRUPO_COBRANCADATA_INCLUSAO.Value    := Date;
                   TB_GRUPO_COBRANCAUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_GRUPO_COBRANCADATA_ALTERACAO.Value    := Date;
                   TB_GRUPO_COBRANCAUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_MENUBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_MENUDATA_INCLUSAO.Value    := Date;
                   TB_MENUUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_MENUDATA_ALTERACAO.Value    := Date;
                   TB_MENUUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_METASBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_METASDATA_INCLUSAO.Value    := Date;
                   TB_METASUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_METASDATA_ALTERACAO.Value    := Date;
                   TB_METASUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_MOTIVOS_ACIONAMENTOSBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_MOTIVOS_ACIONAMENTOSDATA_INCLUSAO.Value    := Date;
                   TB_MOTIVOS_ACIONAMENTOSUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_MOTIVOS_ACIONAMENTOSDATA_ALTERACAO.Value    := Date;
                   TB_MOTIVOS_ACIONAMENTOSUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_PARAMETROSBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_PARAMETROSDATA_INCLUSAO.Value    := Date;
                   TB_PARAMETROSUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_PARAMETROSDATA_ALTERACAO.Value    := Date;
                   TB_PARAMETROSUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_RECIBOBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_RECIBODATA_INCLUSAO.Value    := Date;
                   TB_RECIBOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_RECIBODATA_ALTERACAO.Value    := Date;
                   TB_RECIBOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_REPASSEBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_REPASSEDATA_INCLUSAO.Value    := Date;
                   TB_REPASSEUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_REPASSEDATA_ALTERACAO.Value    := Date;
                   TB_REPASSEUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.TB_USUARIO_MENUBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_USUARIO_MENUDATA_INCLUSAO.Value    := Date;
                   TB_USUARIO_MENUUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_USUARIO_MENUDATA_ALTERACAO.Value    := Date;
                   TB_USUARIO_MENUUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
  End;
end;

procedure TDados.plDesconectarUsuario;
begin
  If  TB_USUARIO.Locate('USUARIO;SENHA', VarArrayOf([TUniqueParametros.GetParametros.Usuario,
                                                     TUniqueParametros.GetParametros.Senha]), [loPartialKey]) Then
      Begin
        TB_USUARIO.Edit;
        TB_USUARIOUSUARIO_LOGADO.Value := False;
        TB_USUARIO.Post;
      End;
end;

function TDados.flValorCorrigidoByTabDepre(cData: TDateTime;
  cValor: Double): Double;
Var
  Multa,
  IndiceDepreAtual,
  ValorCorrigido,
  ValorJuros       : Double;
  TotalMeses       : Integer;
begin
  TB_DEPRE.Active := True;
  TB_DEPRE.Last;
  IndiceDepreAtual := TB_DEPREINDICE.Value;
  Multa := cValor * 0.02;
  If   TB_DEPRE.Locate('ANO;MES',VarArrayOf([YearOf(cData),MonthOf(cData)]),[loPartialKey]) Then
       Begin
         ValorCorrigido := (cValor + Multa) / TB_DEPREINDICE.Value * IndiceDepreAtual;
         TotalMeses     := MonthsBetween(Date,cData)+1;
         ValorJuros     := ValorCorrigido * ((TUniqueParametros.GetParametros.IndiceDEPRE * TotalMeses) / 100);
         Result         := ValorCorrigido + ValorJuros;
       End
  Else Result := 0.00;
  TB_DEPRE.Active := False;
end;

procedure TDados.pImprimirResumoCredor(Credor:LongInt;Configura : Boolean);
var
  FQuery   : TADOQuery;
  Report   : TFreeReport;
  FDataset : TfrMyDBDataset;
begin
  FQuery        := TADOQuery.Create(Self);
  FQuery.Name   := 'Q';
  Report        := TFreeReport.Create(Self);
  FDataset      := TfrMyDBDataset.Create(Self);
  FDataset.Name := 'FrResumoCredor';

  Try
    FQuery.Connection := Conexao;
    FQuery.Parameters.Clear;
    FQuery.Parameters.AddParameter.Name := 'PCREDOR';

    FQuery.SQL.Add(' SELECT C.CREDOR, ');
    FQuery.SQL.Add('        A.NOME_CREDOR, ');
    FQuery.SQL.Add('        T.DESCRICAO_SITUACAO, ');
    FQuery.SQL.Add('        SUM(C.VALOR_DIVIDA) AS VALORES, ');
    FQuery.SQL.Add('        COUNT(*) AS QUANT ');
    FQuery.SQL.Add(' FROM COBRANCA C, CREDOR A, TIPO_SITUACAO T ');
    FQuery.SQL.Add(' WHERE C.CREDOR = A.CODIGO_CREDOR ');
    FQuery.SQL.Add(' AND C.SITUACAO = T.TIPO_SITUACAO ');

    If   Credor > 0 Then
         FQuery.SQL.Add(' AND C.CREDOR = :PCREDOR ');

    FQuery.SQL.Add(' GROUP BY C.CREDOR, A.NOME_CREDOR, T.DESCRICAO_SITUACAO ');
    FQuery.SQL.Add(' ORDER BY A.NOME_CREDOR ASC, COUNT(*) DESC ');

    If   Credor <> 0 Then
         FQuery.Parameters.ParamByName('PCREDOR').Value     := Credor;

    FQuery.Open;
    FQuery.Active := True;
    If   FileExists(TUniqueParametros.GetParametros.DatabaseReport + 'ResumoCredor.frf') Then
         Begin
           Report.Arquivo :=  TUniqueParametros.GetParametros.DatabaseReport + 'ResumoCredor.frf';
           If   Configura Then
                Report.Desenhar
           Else Report.Visualiza;
         End
    Else Report.Desenhar;     
  Finally
    FreeAndNil(FDataset);
    FreeAndNil(FQuery);
    FreeAndNil(Report);
  End;
end;

procedure TDados.plConsultaCobrancaCobradorReceptivo(clCredor : Integer;
    DataInicio : TDateTime; DataFinal : TDateTime; clCobrador : Integer;
    LikeNomeDevedor : String);
begin
  With QU_COBRANCAS_COM_COBRADOR Do
    Begin
      Parameters.Clear;
      Parameters.AddParameter.Name := 'PCREDOR';
      Parameters.AddParameter.Name := 'PDTINICIO';
      Parameters.AddParameter.Name := 'PDTFINAL';
      Parameters.AddParameter.Name := 'PCOBRADOR';
      Active := False;
      SQL.Clear;
      SQL.Add(' SELECT C.COBRANCA, ');
      SQL.Add('        A.NOME_CREDOR, ');
      SQL.Add('        C.DEVEDOR, ');
      SQL.Add('        D.NOME_DEVEDOR, ');
      SQL.Add('        C.DATA_CADASTRO, ');
      SQL.Add('        C.VALOR_DIVIDA, ');
      SQL.Add('        B.NOME_COBRADOR, ');
      SQL.Add('        T.DESCRICAO_SITUACAO AS STATUS ');
      SQL.Add('  FROM COBRANCA C, CREDOR A, DEVEDOR D, COBRADOR B, TIPO_SITUACAO T ');
      SQL.Add(' WHERE C.CREDOR = A.CODIGO_CREDOR ');
      SQL.Add(' AND C.DEVEDOR = D.CODIGO_DEVEDOR ');
      SQL.Add(' AND C.COBRADOR = B.IDCOBRADOR ');
      SQL.Add(' AND C.SITUACAO = T.TIPO_SITUACAO ');

      If   clCredor <> 0 Then
           SQL.Add(' AND C.CREDOR = :PCREDOR ');
      If   DataInicio <> 0 Then
           SQL.Add(' AND C.DATA_CADASTRO BETWEEN :PDTINICIO AND :PDTFINAL ');
      If   clCobrador <> 0 Then
           SQL.Add(' AND C.COBRADOR = :PCOBRADOR ');
      If   Trim(LikeNomeDevedor) <> '' Then
           SQL.Add(' AND D.NOME_DEVEDOR LIKE '+ AnsiQuotedStr(UpperCase(LikeNomeDevedor) +'%','"'));

      SQL.Add(' ORDER BY ');
      SQL.Add('     C.COBRADOR, ');
      SQL.Add('     A.NOME_CREDOR, ');
      SQL.Add('     C.COBRANCA ');
      If   clCredor <> 0 Then
           Parameters.ParamByName('PCREDOR').Value     := clCredor;
      If   DataInicio <> 0 Then
           Begin
             Parameters.ParamByName('PDTINICIO').Value := DataInicio;
             Parameters.ParamByName('PDTFINAL').Value  := DataFinal;
           End;
      If   clCobrador <> 0 Then
           Parameters.ParamByName('PCOBRADOR').Value   := clCobrador;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.plPosicionaCredor(cCredor : Integer);
begin
  Dados.TB_CREDOR.Locate('CODIGO_CREDOR',cCredor,[]);
end;

procedure TDados.plPosicionaDevedor(cDevedor : Integer);
begin
  Dados.TB_DEVEDOR.Locate('CODIGO_DEVEDOR',cDevedor,[]);
end;

procedure TDados.plResumoCredor(cCredor: Integer; var cAberto, cAcordo,
  cFechado: Double);
var
  FQuery : TADOQuery;
begin
  FQuery := TADOQuery.Create(Self);
  with FQuery do begin
    Connection := Conexao;
    Try
      Try
        Parameters.Clear;
        Parameters.AddParameter.Name := 'PCREDOR';
        SQL.Clear;
        SQL.Add(' SELECT C.SITUACAO, SUM(C.VALOR_DIVIDA) AS DIVIDA ');
        SQL.Add(' FROM COBRANCA C ');
        SQL.Add(' WHERE C.CREDOR = :PCREDOR ');
        SQL.Add(' GROUP BY C.SITUACAO ');
        Parameters.ParamByName('PCREDOR').Value := cCredor;
        Prepared;
        Open;
        First;
        While Not Eof Do
          Begin
            Case FieldByName('SITUACAO').Value of
              0: cAberto := cAberto + FieldValues['DIVIDA'];
              1: cAcordo := cAcordo + FieldValues['DIVIDA'];
            Else cFechado := cFechado + FieldValues['DIVIDA'];
            End;
            Next;
          End;
      Except
        On E: Exception Do
           ShowMessage(E.Message);
      End;
    Finally
      Close;
      free;
    End;
  end; {with vQry}
end;

function TDados.flRetornaQuantidadeQuitadas(cCredor: Integer): Double;
var
  FQuery : TADOQuery;
begin
  FQuery := TADOQuery.Create(Self);
  with FQuery do begin
    Connection := Conexao;
    Try
      Try
        Parameters.Clear;
        Parameters.AddParameter.Name := 'PCREDOR';
        SQL.Clear;

        SQL.Add(' SELECT SUM(R.VALOR) AS VALOR ');
        SQL.Add(' FROM  RECEBIMENTO R, COBRANCA C ');
        SQL.Add(' WHERE R.COBRANCA = C.COBRANCA ');
        SQL.Add(' AND C.CREDOR = :PCREDOR ');
        SQL.Add(' AND R.PAGO ');

        Parameters.ParamByName('PCREDOR').Value := cCredor;
        Prepared;
        Open;
        Result := FieldByName('VALOR').AsFloat;
      Except
        On E: Exception Do
           ShowMessage(E.Message);
      End;
    Finally
      Close;
      free;
    End;
  end; {with vQry}
end;

function TDados.flRetornaQuantidadeAtrasadas(cCredor : Integer): Double;
var
  FQuery : TADOQuery;
begin
  FQuery := TADOQuery.Create(Self);
  with FQuery do begin
    Connection := Conexao;
    Try
      Try
        Parameters.Clear;
        Parameters.AddParameter.Name := 'PCREDOR';
        Parameters.AddParameter.Name := 'PVENCIMENTO';

        SQL.Clear;
        SQL.Add(' SELECT SUM(R.VALOR) AS VALOR ');
        SQL.Add(' FROM  RECEBIMENTO R, COBRANCA C ');
        SQL.Add(' WHERE R.COBRANCA = C.COBRANCA ');
        SQL.Add(' AND C.CREDOR = :PCREDOR ');
        SQL.Add(' AND R.PAGO = FALSE  ');
        SQL.Add(' AND R.VENCIMENTO < :PVENCIMENTO ');

        Parameters.ParamByName('PCREDOR').Value := cCredor;
        Parameters.ParamByName('PVENCIMENTO').Value := Date;
        Prepared;
        Open;
        Result := FieldByName('VALOR').AsFloat;
      Except
        On E: Exception Do
           ShowMessage(E.Message);
      End;
    Finally
      Close;
      free;
    End;
  end; {with vQry}
end;

function TDados.flRetornaQuantidadeAcionadas(cCredor : Integer; cAcionadas :
    Boolean): Integer;
var
  FQuery : TADOQuery;
begin
  FQuery := TADOQuery.Create(Self);
  with FQuery do begin
    Connection := Conexao;
    Try
      Try
        Parameters.Clear;
        Parameters.AddParameter.Name := 'PCREDOR';

        SQL.Clear;
        SQL.Add(' SELECT COUNT(*) AS REGISTROS ');
        SQL.Add(' FROM COBRANCA C LEFT OUTER JOIN ACIONAMENTO A ON C.COBRANCA = A.COBRANCA ');
        SQL.Add(' WHERE C.CREDOR = :PCREDOR ');
        SQL.Add(' AND C.SITUACAO = 0 ');

        If   cAcionadas Then
             SQL.Add(' AND A.IDACIONAMENTO > 0 ')
        Else SQL.Add(' AND A.IDACIONAMENTO IS NULL ');

        Parameters.ParamByName('PCREDOR').Value := cCredor;
        Prepared;
        Open;
        Result := FieldByName('REGISTROS').AsInteger;
      Except
        On E: Exception Do
           Result := 0;
      End;
    Finally
      Close;
      free;
    End;
  end; {with vQry}
end;

procedure TDados.plConsultaAcionamentoPendentes(const ciCredor : Integer;
    cDataInicio, cDataFinal : TDatetime);
begin
  With QU_CONSULTA_ACIONAMENTO Do
    Begin
      Parameters.AddParameter.Name := 'PCREDOR';
      Parameters.AddParameter.Name := 'PDATAINICIO';
      Parameters.AddParameter.Name := 'PDATAFINAL';
      Active := False;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  ');
      SQL.Add(' A.IDACIONAMENTO, ');
      SQL.Add(' D.NOME_DEVEDOR, ');
      SQL.Add(' A.DATA_ACIONAMENTO, ');
      SQL.Add(' A.USUARIO_INCLUSAO, ');
      SQL.Add(' A.HISTORICO ');
      SQL.Add(' FROM  ACIONAMENTO A, DEVEDOR D ');
      SQL.Add(' WHERE A.IDDEVEDOR = D.CODIGO_DEVEDOR ');
      SQL.Add(' AND A.COBRANCA IN (SELECT COBRANCA FROM COBRANCA WHERE CREDOR = :PCREDOR AND SITUACAO = 0) ');
      SQL.Add(' AND A.DATA_ACIONAMENTO BETWEEN :PDATAINICIO AND :PDATAFINAL ');
      SQL.Add(' AND SITUACAO = 0 ');
      SQL.Add(' ORDER BY D.NOME_DEVEDOR, A.DATA_ACIONAMENTO ');
      Parameters.ParamByName('PCREDOR').Value      := ciCredor;
      Parameters.ParamByName('PDATAINICIO').Value  := cDataInicio;
      Parameters.ParamByName('PDATAFINAL').Value   := cDataFinal;
      Prepared;
      Open;
      Active := True;
    End;
end;

procedure TDados.TB_CHAMADOBeforePost(DataSet: TDataSet);
begin
  Try
    Case DataSet.State of
      dsInsert:  Begin
                   TB_CHAMADODATA_INCLUSAO.Value    := Date;
                   TB_CHAMADOUSUARIO_INCLUSAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
      dsEdit  :  Begin
                   TB_CHAMADODATA_ALTERACAO.Value    := Date;
                   TB_CHAMADOUSUARIO_ALTERACAO.Value := TUniqueParametros.GetParametros.Usuario;
                 End;
    End;
  Except
    On E: Exception Do
       Raise Exception.Create(E.Message);
  End;
end;

end.
