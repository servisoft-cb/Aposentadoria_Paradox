unit UProcuracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, ToolEdit, DBIProcs,
  RXDBCtrl, RXLookup, Grids, DBGrids;

type
  TfPrevProcuracao = class(TForm)
    Panel1: TPanel;
    tProcuracao: TTable;
    dsProcuracao: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    tCadastro3: TTable;
    dsCadastro3: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    tProcuracaoCodeFuncionario: TIntegerField;
    tProcuracaoContador: TAutoIncField;
    tProcuracaoNacionalidade: TStringField;
    tProcuracaoEstadoCivil: TStringField;
    tProcuracaoLocal: TStringField;
    tProcuracaoData: TDateField;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label12: TLabel;
    DBDateEdit1: TDBDateEdit;
    BitBtn1: TBitBtn;
    tProcuracaoResdenciaProcurador: TStringField;
    tProcuracaoResidencia: TStringField;
    tCadastro3Codigo: TIntegerField;
    tCadastro3Nome: TStringField;
    tCadastro3Endereco: TStringField;
    tCadastro3Cep: TStringField;
    tCadastro3Correspondecia: TStringField;
    tCadastro3Sexo: TStringField;
    tCadastro3NumeroCarteira: TStringField;
    tCadastro3SerieCarteira: TStringField;
    tCadastro3DataNascimento: TDateField;
    tCadastro3Pis: TStringField;
    tCadastro3Cpf: TStringField;
    tCadastro3Rg: TStringField;
    tCadastro3Fone: TStringField;
    tCadastro3Cici: TStringField;
    tCadastro3Agencia: TStringField;
    tCadastro3Banco: TStringField;
    tCadastro3ContaCorrente: TStringField;
    tProcuracaoPorfissao: TStringField;
    tProcuracaoEstaCivilProcurador: TStringField;
    tProcuracaoProfissaoProcurador: TStringField;
    tProcuracaoNomeProcurador: TStringField;
    tProcuracaoNacionaProcurador: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label1: TLabel;
    BitBtn8: TBitBtn;
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
    RxDBGrid1: TRxDBGrid;
    tProcuracaoItem: TTable;
    dsProcuracaoItem: TDataSource;
    tProcuracaoItemFuncionario: TIntegerField;
    tProcuracaoItemProcuracao: TIntegerField;
    tProcuracaoItemProcurador: TIntegerField;
    tProcuracaoItemlkProcurador: TStringField;
    tProcuracaoItemlkNacionalidade: TStringField;
    tProcuracaoItemlkEstCivil: TStringField;
    tProcuracaoItemlkIdentidade: TStringField;
    tProcuracaoItemlkCPF: TStringField;
    tProcuracaoItemlkProfissao: TStringField;
    tProcuracaoItemlkEndereco: TStringField;
    tProcuracaoItemlkBairro: TStringField;
    tProcuracaoItemlkCidade: TStringField;
    tProcuracaoItemlkEstado: TStringField;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    tProcuracaoOpcao: TSmallintField;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBEdit6: TDBEdit;
    tProcuracaoDtAfast: TDateField;
    tProcuracaoDtRetor: TDateField;
    tProcuracaoPais: TStringField;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    tProcuracaoOutorgante: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure tProcuracaoAfterPost(DataSet: TDataSet);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita_Desabilita;
  public
    { Public declarations }
  end;

var
  fPrevProcuracao: TfPrevProcuracao;

implementation

uses URelProcuracao, UCadastro, UProcurador;

{$R *.DFM}

procedure TfPrevProcuracao.Habilita_Desabilita;
begin
  Panel1.Enabled       := not(Panel1.Enabled);
  Panel3.Enabled       := not(Panel3.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  BitBtn7.Enabled      := not(BitBtn7.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfPrevProcuracao.BitBtn1Click(Sender: TObject);
var
  Proc: String;
begin
  Proc := tProcuracaoContador.AsString;
  tProcuracao.Filtered := False;
  tProcuracao.Filter   := 'Contador = '''+Proc+'''';
  tProcuracao.Filtered := True;
  fRelProcuracao := TfRelProcuracao.Create(Self);// cria formulario procuração
  fRelProcuracao.QuickRep1.Preview; // exibe relatório
  tProcuracao.Filtered := False;
  tProcuracao.FindKey([fCadastro.tCadastroCodigo.AsInteger,StrToInt(Proc)]);
end;

procedure TfPrevProcuracao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevProcuracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfPrevProcuracao.BitBtn3Click(Sender: TObject);
begin
  tProcuracao.Cancel;
  Habilita_Desabilita;
end;

procedure TfPrevProcuracao.BitBtn5Click(Sender: TObject);
begin
  tProcuracao.Last;
  tProcuracao.Insert;
  tProcuracaoOutorgante.AsString := fCadastro.tCadastroNome.AsString;
  tProcuracaoOpcao.AsInteger    := 0;
  Habilita_Desabilita;
  DBEdit1.SetFocus;
end;

procedure TfPrevProcuracao.BitBtn4Click(Sender: TObject);
begin
  tProcuracao.Edit;
  Habilita_Desabilita;
  DBEdit1.SetFocus;
end;

procedure TfPrevProcuracao.BitBtn6Click(Sender: TObject);
begin
  tProcuracao.Post;
  Habilita_Desabilita;
  BitBtn1.SetFocus;
end;

procedure TfPrevProcuracao.BitBtn7Click(Sender: TObject);
begin
  if MessageDlg('Esta operação apagará a procuração atual!',mtConfirmation,[mbOk,mbNo],0) = mrOK then
    begin
      while not tProcuracaoItem.IsEmpty do
        tProcuracaoItem.Delete;
      tProcuracao.Delete;
    end;
end;

procedure TfPrevProcuracao.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  tProcuracao.IndexFieldNames := 'CodeFuncionario';
end;

procedure TfPrevProcuracao.tProcuracaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProcuracao.Handle);
end;

procedure TfPrevProcuracao.DBDateEdit1Exit(Sender: TObject);
begin
  BitBtn6.SetFocus;
end;

procedure TfPrevProcuracao.BitBtn8Click(Sender: TObject);
begin
  fProcurador := TfProcurador.Create(Self);
  fProcurador.ShowModal;
end;

procedure TfPrevProcuracao.BitBtn10Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o procurador desta procuração?',mtConfirmation,[mbOk,mbNo],0) = mrOk then
    tProcuracaoItem.Delete;
end;

procedure TfPrevProcuracao.BitBtn9Click(Sender: TObject);
begin
  tProcuracaoItem.Insert;
  tProcuracaoItemProcurador.AsInteger := tProcuradorCodigo.AsInteger;
  tProcuracaoItem.Post;
end;

end.
