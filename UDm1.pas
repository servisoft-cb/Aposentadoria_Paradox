unit UDm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDm1 = class(TDataModule)
    tMovimentos: TTable;
    dsMovimentos: TDataSource;
    tCadastro: TTable;
    dsCadastro: TDataSource;
    tCadastroCodigo: TIntegerField;
    tCadastroNome: TStringField;
    tCadastroEndereco: TStringField;
    tCadastroCep: TStringField;
    tCadastroCorrespondecia: TStringField;
    tCadastroSexo: TStringField;
    tCadastroNumeroCarteira: TStringField;
    tCadastroSerieCarteira: TStringField;
    tCadastroDataNascimento: TDateField;
    tCadastroPis: TStringField;
    tCadastroCpf: TStringField;
    tCadastroRg: TStringField;
    tCadastroFone: TStringField;
    tCadastroCici: TStringField;
    tCadastroAgencia: TStringField;
    tCadastroBanco: TStringField;
    tCadastroContaCorrente: TStringField;
    tMovimentosCodigoFuncionario: TIntegerField;
    tMovimentosContador: TAutoIncField;
    tMovimentosEmpresa: TStringField;
    tMovimentosFuncao: TStringField;
    tMovimentosEspecial: TStringField;
    tMovimentosTipoEspecial: TStringField;
    tMovimentosDataAdmissao: TDateField;
    tMovimentosDataDemissao: TDateField;
    tMovimentosComumAA: TSmallintField;
    tMovimentosComumMM: TSmallintField;
    tMovimentosComumDD: TSmallintField;
    tMovimentosEspecialAA: TSmallintField;
    tMovimentosEspecialMM: TSmallintField;
    tMovimentosEspecialDD: TSmallintField;
    tProcuracao: TTable;
    tProcurador: TTable;
    dsProcuracao: TDataSource;
    dsProcurador: TDataSource;
    tProcuracaoCodeFuncionario: TIntegerField;
    tProcuracaoContador: TAutoIncField;
    tProcuracaoNacionalidade: TStringField;
    tProcuracaoEstadoCivil: TStringField;
    tProcuracaoPorfissao: TStringField;
    tProcuracaoResidencia: TStringField;
    tProcuracaoLocal: TStringField;
    tProcuracaoData: TDateField;
    tProcuradorCodigo: TIntegerField;
    tProcuradorNome: TStringField;
    tProcuradorNacionalidade: TStringField;
    tProcuradorProfissao: TStringField;
    tProcuradorEstadoCivil: TStringField;
    tProcuracaoItens: TTable;
    dsProcuracaoItens: TDataSource;
    tProcuracaoItensProcuracao: TIntegerField;
    tProcuracaoItensProcurador: TIntegerField;
    tProcuracaoItensFuncionario: TIntegerField;
    tProcuracaoItenslkNome: TStringField;
    tProcuracaoItenslkNacionalidade: TStringField;
    tProcuracaoItenslkProfissao: TStringField;
    tProcuracaoItenslkEstadoCivil: TStringField;
    tProcuradorIdentidade: TStringField;
    tProcuradorCPF: TStringField;
    tProcuradorEndereco: TStringField;
    tProcuradorBairro: TStringField;
    tProcuradorCidade: TStringField;
    tProcuradorEstado: TStringField;
    tProcuracaoItenslkIdentidade: TStringField;
    tProcuracaoItenslkCPF: TStringField;
    tProcuracaoItenslkEndereco: TStringField;
    tProcuracaoItenslkBairro: TStringField;
    tProcuracaoItenslkCidade: TStringField;
    tProcuracaoItenslkEstado: TStringField;
    tProcuracaoIdentidade: TStringField;
    tProcuracaoCPF: TStringField;
    tAfastamento: TTable;
    dsAfastamento: TDataSource;
    tAfastamentoFuncionario: TIntegerField;
    tAfastamentoNumero: TStringField;
    tAfastamentoTipo: TSmallintField;
    tAfastamentoObs: TMemoField;
    tAfastamentoInicio: TDateField;
    tAfastamentoFim: TDateField;
    tAfastamentoLocal: TStringField;
    tAfastamentoData: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm1: TDm1;

implementation

{$R *.DFM}

end.
