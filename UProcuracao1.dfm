object fProcuracao: TfProcuracao
  Left = 131
  Top = -1
  Width = 544
  Height = 421
  BorderIcons = [biSystemMenu]
  Caption = 'Procuração'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 58
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 10
      Top = 28
      Width = 516
      Height = 29
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 2
      Width = 83
      Height = 25
      Caption = '&Inserir'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 100
      Top = 2
      Width = 83
      Height = 25
      Caption = '&Alterar'
      TabOrder = 2
    end
    object BitBtn3: TBitBtn
      Left = 184
      Top = 2
      Width = 83
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 3
    end
    object BitBtn4: TBitBtn
      Left = 268
      Top = 2
      Width = 83
      Height = 25
      Caption = 'E&xcluir'
      TabOrder = 4
    end
    object BitBtn5: TBitBtn
      Left = 352
      Top = 2
      Width = 83
      Height = 25
      Caption = 'C&onfirmar'
      TabOrder = 5
    end
    object BitBtn6: TBitBtn
      Left = 436
      Top = 2
      Width = 83
      Height = 25
      Caption = '&Fechar'
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 58
    Width = 535
    Height = 295
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Funcionário:'
    end
    object Label2: TLabel
      Left = 8
      Top = 39
      Width = 71
      Height = 13
      Caption = 'Nacionalidade:'
    end
    object Label3: TLabel
      Left = 211
      Top = 39
      Width = 58
      Height = 13
      Caption = 'Estado Civil:'
    end
    object Label6: TLabel
      Left = 8
      Top = 62
      Width = 46
      Height = 13
      Caption = 'Profissão:'
    end
    object Label7: TLabel
      Left = 8
      Top = 85
      Width = 56
      Height = 13
      Caption = 'Residência:'
    end
    object DBText1: TDBText
      Left = 456
      Top = 14
      Width = 65
      Height = 17
      DataField = 'Contador'
      DataSource = dsProcuracao
    end
    object Label4: TLabel
      Left = 395
      Top = 15
      Width = 58
      Height = 13
      Caption = 'Procuração:'
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 83
      Top = 8
      Width = 254
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = dsCadastro
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 83
      Top = 31
      Width = 121
      Height = 21
      DataField = 'Nacionalidade'
      DataSource = dsProcuracao
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 276
      Top = 31
      Width = 121
      Height = 21
      DataField = 'EstadoCivil'
      DataSource = dsProcuracao
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 83
      Top = 54
      Width = 121
      Height = 21
      DataField = 'Porfissao'
      DataSource = dsProcuracao
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 83
      Top = 77
      Width = 310
      Height = 21
      DataField = 'Residencia'
      DataSource = dsProcuracao
      TabOrder = 4
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 120
      Width = 524
      Height = 171
      Caption = 'Procurador'
      TabOrder = 5
      object SpeedButton1: TSpeedButton
        Left = 280
        Top = 12
        Width = 65
        Height = 25
        Caption = 'E&xcluir'
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 8
        Top = 17
        Width = 225
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = dsProcurador
        TabOrder = 0
      end
      object RxDBGrid1: TRxDBGrid
        Left = 7
        Top = 48
        Width = 511
        Height = 120
        DataSource = dsProcurador
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nacionalidade'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Profissao'
            Title.Alignment = taCenter
            Title.Caption = 'Profissão'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Identidade'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EstadoCivil'
            Title.Alignment = taCenter
            Title.Caption = 'Estado Civil'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Endereco'
            Title.Alignment = taCenter
            Title.Caption = 'Endereço'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bairro'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Estado'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
      object BitBtn8: TBitBtn
        Left = 240
        Top = 12
        Width = 25
        Height = 25
        TabOrder = 2
      end
    end
    object BitBtn7: TBitBtn
      Left = 343
      Top = 4
      Width = 25
      Height = 25
      Caption = 'BitBtn7'
      TabOrder = 6
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 353
    Width = 535
    Height = 41
    TabOrder = 2
    object Label5: TLabel
      Left = 49
      Top = 18
      Width = 29
      Height = 13
      Caption = 'Local:'
    end
    object Label8: TLabel
      Left = 267
      Top = 18
      Width = 26
      Height = 13
      Caption = 'Data:'
    end
    object DBEdit3: TDBEdit
      Left = 80
      Top = 11
      Width = 121
      Height = 21
      DataField = 'Local'
      DataSource = dsProcuracao
      TabOrder = 0
    end
    object DBDateEdit1: TDBDateEdit
      Left = 296
      Top = 11
      Width = 89
      Height = 21
      DataField = 'Data'
      DataSource = dsProcuracao
      NumGlyphs = 2
      TabOrder = 1
    end
    object BitBtn9: TBitBtn
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 2
    end
  end
  object tProcuracao: TTable
    Active = True
    DatabaseName = 'Marion'
    TableName = 'dbProcuracao.DB'
    Left = 344
    Top = 114
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
    object tProcuracaoNomeProcurador: TStringField
      FieldName = 'NomeProcurador'
      Size = 30
    end
    object tProcuracaoNacionaProcurador: TStringField
      FieldName = 'NacionaProcurador'
      Size = 30
    end
    object tProcuracaoEstaCivilProcurador: TStringField
      FieldName = 'EstaCivilProcurador'
      Size = 10
    end
    object tProcuracaoProfissaoProcurador: TStringField
      FieldName = 'ProfissaoProcurador'
      Size = 60
    end
    object tProcuracaoResdenciaProcurador: TStringField
      FieldName = 'ResdenciaProcurador'
      Size = 50
    end
    object tProcuracaoLocal: TStringField
      FieldName = 'Local'
    end
    object tProcuracaoData: TDateField
      FieldName = 'Data'
    end
  end
  object dsProcuracao: TDataSource
    DataSet = tProcuracao
    Left = 376
    Top = 114
  end
  object tCadastro: TTable
    Active = True
    DatabaseName = 'Marion'
    TableName = 'dbCadastro.DB'
    Left = 432
    Top = 82
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
    Left = 400
    Top = 82
  end
  object tProcurador: TTable
    Active = True
    DatabaseName = 'Marion'
    TableName = 'dbProcurador.DB'
    Left = 446
    Top = 194
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
    object tProcuradorIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 10
    end
    object tProcuradorEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
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
  object dsProcurador: TDataSource
    DataSet = tProcurador
    Left = 486
    Top = 194
  end
  object tCadastro2: TTable
    Active = True
    DatabaseName = 'Marion'
    TableName = 'dbCadastro.DB'
    Left = 464
    Top = 82
    object tCadastro2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
end
