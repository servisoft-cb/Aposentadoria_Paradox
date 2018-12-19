unit UProcuracao1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Grids, DBGrids, RXDBCtrl, StdCtrls, DBCtrls, Db, DBTables, Mask,
  RxLookup, ExtCtrls, ToolEdit;

type
  TfProcuracao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    tProcuracao: TTable;
    dsProcuracao: TDataSource;
    tProcuracaoCodeFuncionario: TIntegerField;
    tProcuracaoContador: TAutoIncField;
    tProcuracaoNacionalidade: TStringField;
    tProcuracaoEstadoCivil: TStringField;
    tProcuracaoPorfissao: TStringField;
    tProcuracaoResidencia: TStringField;
    tProcuracaoNomeProcurador: TStringField;
    tProcuracaoNacionaProcurador: TStringField;
    tProcuracaoEstaCivilProcurador: TStringField;
    tProcuracaoProfissaoProcurador: TStringField;
    tProcuracaoResdenciaProcurador: TStringField;
    tProcuracaoLocal: TStringField;
    tProcuracaoData: TDateField;
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
    DBText1: TDBText;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    tProcurador: TTable;
    dsProcurador: TDataSource;
    tProcuradorCodigo: TIntegerField;
    tProcuradorNome: TStringField;
    tProcuradorNacionalidade: TStringField;
    tProcuradorProfissao: TStringField;
    tProcuradorIdentidade: TStringField;
    tProcuradorEstadoCivil: TStringField;
    tProcuradorCPF: TStringField;
    tProcuradorEndereco: TStringField;
    tProcuradorBairro: TStringField;
    tProcuradorCidade: TStringField;
    tProcuradorEstado: TStringField;
    SpeedButton1: TSpeedButton;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBEdit3: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label5: TLabel;
    Label8: TLabel;
    BitBtn9: TBitBtn;
    tCadastro2: TTable;
    tCadastro2Codigo: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProcuracao: TfProcuracao;

implementation

{$R *.DFM}

procedure TfProcuracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfProcuracao.BitBtn1Click(Sender: TObject);
begin
  tProcuracao.Last;
  tProcuracao.Insert;
end;

end.
