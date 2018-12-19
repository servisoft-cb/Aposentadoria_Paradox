object Dm1: TDm1
  OldCreateOrder = False
  Left = 210
  Top = 136
  Height = 375
  Width = 544
  object tMovimentos: TTable
    Active = True
    DatabaseName = 'Aposentadoria1'
    IndexFieldNames = 'CodigoFuncionario;Contador'
    MasterFields = 'Codigo'
    MasterSource = dsCadastro
    TableName = 'dbMovimentos.db'
    Left = 24
    Top = 8
    object tMovimentosCodigoFuncionario: TIntegerField
      FieldName = 'CodigoFuncionario'
    end
    object tMovimentosContador: TAutoIncField
      FieldName = 'Contador'
      ReadOnly = True
    end
    object tMovimentosEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 40
    end
    object tMovimentosFuncao: TStringField
      FieldName = 'Funcao'
    end
    object tMovimentosEspecial: TStringField
      FieldName = 'Especial'
      Size = 3
    end
    object tMovimentosTipoEspecial: TStringField
      FieldName = 'TipoEspecial'
      Size = 1
    end
    object tMovimentosDataAdmissao: TDateField
      FieldName = 'DataAdmissao'
    end
    object tMovimentosDataDemissao: TDateField
      FieldName = 'DataDemissao'
    end
    object tMovimentosComumAA: TSmallintField
      FieldName = 'ComumAA'
    end
    object tMovimentosComumMM: TSmallintField
      FieldName = 'ComumMM'
    end
    object tMovimentosComumDD: TSmallintField
      FieldName = 'ComumDD'
    end
    object tMovimentosEspecialAA: TSmallintField
      FieldName = 'EspecialAA'
    end
    object tMovimentosEspecialMM: TSmallintField
      FieldName = 'EspecialMM'
    end
    object tMovimentosEspecialDD: TSmallintField
      FieldName = 'EspecialDD'
    end
  end
  object dsMovimentos: TDataSource
    DataSet = tMovimentos
    Left = 88
    Top = 8
  end
  object tCadastro: TTable
    Active = True
    DatabaseName = 'Aposentadoria1'
    TableName = 'dbCadastro.DB'
    Left = 152
    Top = 8
    object tCadastroCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tCadastroNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCadastroEndereco: TStringField
      FieldName = 'Endereco'
      Size = 60
    end
    object tCadastroCep: TStringField
      FieldName = 'Cep'
      Size = 9
    end
    object tCadastroCorrespondecia: TStringField
      FieldName = 'Correspondecia'
      Size = 60
    end
    object tCadastroSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tCadastroNumeroCarteira: TStringField
      FieldName = 'NumeroCarteira'
      Size = 8
    end
    object tCadastroSerieCarteira: TStringField
      FieldName = 'SerieCarteira'
      Size = 8
    end
    object tCadastroDataNascimento: TDateField
      FieldName = 'DataNascimento'
    end
    object tCadastroPis: TStringField
      FieldName = 'Pis'
      Size = 12
    end
    object tCadastroCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tCadastroRg: TStringField
      FieldName = 'Rg'
      Size = 11
    end
    object tCadastroFone: TStringField
      FieldName = 'Fone'
      Size = 15
    end
    object tCadastroCici: TStringField
      FieldName = 'Cici'
      Size = 15
    end
    object tCadastroAgencia: TStringField
      FieldName = 'Agencia'
      Size = 5
    end
    object tCadastroBanco: TStringField
      FieldName = 'Banco'
    end
    object tCadastroContaCorrente: TStringField
      FieldName = 'ContaCorrente'
    end
  end
  object dsCadastro: TDataSource
    DataSet = tCadastro
    Left = 224
    Top = 8
  end
  object tProcuracao: TTable
    Active = True
    DatabaseName = 'Aposentadoria1'
    TableName = 'dbProcuracao.DB'
    Left = 16
    Top = 64
    object tProcuracaoCodeFuncionario: TIntegerField
      FieldName = 'CodeFuncionario'
    end
    object tProcuracaoContador: TAutoIncField
      FieldName = 'Contador'
      ReadOnly = True
    end
    object tProcuracaoNacionalidade: TStringField
      FieldName = 'Nacionalidade'
      Size = 30
    end
    object tProcuracaoEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
      Size = 10
    end
    object tProcuracaoPorfissao: TStringField
      FieldName = 'Porfissao'
      Size = 60
    end
    object tProcuracaoResidencia: TStringField
      FieldName = 'Residencia'
      Size = 50
    end
    object tProcuracaoLocal: TStringField
      FieldName = 'Local'
    end
    object tProcuracaoData: TDateField
      FieldName = 'Data'
    end
    object tProcuracaoIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 10
    end
    object tProcuracaoCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
  end
  object tProcurador: TTable
    Active = True
    DatabaseName = 'Aposentadoria1'
    TableName = 'dbProcurador.db'
    Left = 160
    Top = 64
    object tProcuradorCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tProcuradorNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object tProcuradorNacionalidade: TStringField
      FieldName = 'Nacionalidade'
      Size = 30
    end
    object tProcuradorProfissao: TStringField
      FieldName = 'Profissao'
      Size = 30
    end
    object tProcuradorEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
    end
    object tProcuradorIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 10
    end
    object tProcuradorCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object tProcuradorEndereco: TStringField
      FieldName = 'Endereco'
      Size = 40
    end
    object tProcuradorBairro: TStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object tProcuradorCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tProcuradorEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
  end
  object dsProcuracao: TDataSource
    DataSet = tProcuracao
    Left = 88
    Top = 64
  end
  object dsProcurador: TDataSource
    DataSet = tProcurador
    Left = 224
    Top = 64
  end
  object tProcuracaoItens: TTable
    Active = True
    DatabaseName = 'Aposentadoria1'
    IndexFieldNames = 'Funcionario;Procuracao'
    MasterFields = 'CodeFuncionario;Contador'
    MasterSource = dsProcuracao
    TableName = 'dbProcuracaoItens.db'
    Left = 32
    Top = 128
    object tProcuracaoItensFuncionario: TIntegerField
      FieldName = 'Funcionario'
    end
    object tProcuracaoItensProcuracao: TIntegerField
      FieldName = 'Procuracao'
    end
    object tProcuracaoItensProcurador: TIntegerField
      FieldName = 'Procurador'
    end
    object tProcuracaoItenslkNome: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNome'
      LookupDataSet = tProcurador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Procurador'
      Size = 30
      Lookup = True
    end
    object tProcuracaoItenslkNacionalidade: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNacionalidade'
      LookupDataSet = tProcurador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nacionalidade'
      KeyFields = 'Procurador'
      Size = 30
      Lookup = True
    end
    object tProcuracaoItenslkProfissao: TStringField
      FieldKind = fkLookup
      FieldName = 'lkProfissao'
      LookupDataSet = tProcurador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Profissao'
      KeyFields = 'Procurador'
      Size = 30
      Lookup = True
    end
    object tProcuracaoItenslkEstadoCivil: TStringField
      FieldKind = fkLookup
      FieldName = 'lkEstadoCivil'
      LookupDataSet = tProcurador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'EstadoCivil'
      KeyFields = 'Procurador'
      Size = 30
      Lookup = True
    end
    object tProcuracaoItenslkIdentidade: TStringField
      FieldKind = fkLookup
      FieldName = 'lkIdentidade'
      LookupDataSet = tProcurador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Identidade'
      KeyFields = 'Procurador'
      Size = 10
      Lookup = True
    end
    object tProcuracaoItenslkCPF: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCPF'
      LookupDataSet = tProcurador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CPF'
      KeyFields = 'Procurador'
      Size = 14
      Lookup = True
    end
    object tProcuracaoItenslkEndereco: TStringField
      FieldKind = fkLookup
      FieldName = 'lkEndereco'
      LookupDataSet = tProcurador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Endereco'
      KeyFields = 'Procurador'
      Size = 40
      Lookup = True
    end
    object tProcuracaoItenslkBairro: TStringField
      FieldKind = fkLookup
      FieldName = 'lkBairro'
      LookupDataSet = tProcurador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Bairro'
      KeyFields = 'Procurador'
      Size = 30
      Lookup = True
    end
    object tProcuracaoItenslkCidade: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCidade'
      LookupDataSet = tProcurador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Cidade'
      KeyFields = 'Procurador'
      Size = 40
      Lookup = True
    end
    object tProcuracaoItenslkEstado: TStringField
      FieldKind = fkLookup
      FieldName = 'lkEstado'
      LookupDataSet = tProcurador
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Estado'
      KeyFields = 'Procurador'
      Size = 2
      Lookup = True
    end
  end
  object dsProcuracaoItens: TDataSource
    DataSet = tProcuracaoItens
    Left = 120
    Top = 128
  end
  object tAfastamento: TTable
    Active = True
    DatabaseName = 'Aposentadoria1'
    IndexFieldNames = 'Funcionario;Numero'
    MasterFields = 'Codigo'
    MasterSource = dsCadastro
    TableName = 'dbAfastamento.DB'
    Left = 200
    Top = 128
    object tAfastamentoFuncionario: TIntegerField
      FieldName = 'Funcionario'
    end
    object tAfastamentoNumero: TStringField
      FieldName = 'Numero'
    end
    object tAfastamentoTipo: TSmallintField
      FieldName = 'Tipo'
    end
    object tAfastamentoObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 1
    end
    object tAfastamentoInicio: TDateField
      FieldName = 'Inicio'
    end
    object tAfastamentoFim: TDateField
      FieldName = 'Fim'
    end
    object tAfastamentoLocal: TStringField
      FieldName = 'Local'
      Size = 40
    end
    object tAfastamentoData: TDateField
      FieldName = 'Data'
    end
  end
  object dsAfastamento: TDataSource
    DataSet = tAfastamento
    Left = 272
    Top = 120
  end
end
