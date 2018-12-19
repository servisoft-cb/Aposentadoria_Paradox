unit UCadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, DBTables, Mask,
  RXCtrls, DBIProcs, VerificaCPF;

type
  TfCadastro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBNavigator1: TDBNavigator;
    tCadastro: TTable;
    dsCadastro: TDataSource;
    Panel3: TPanel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit2: TDBEdit;
    tCadastroCodigo: TIntegerField;
    tCadastroNome: TStringField;
    tCadastroEndereco: TStringField;
    tCadastroCorrespondecia: TStringField;
    tCadastroSexo: TStringField;
    tCadastroDataNascimento: TDateField;
    tCadastroCpf: TStringField;
    tCadastroRg: TStringField;
    tCadastroFone: TStringField;
    tCadastroCici: TStringField;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    tCadastro2: TTable;
    Panel4: TPanel;
    RxLabel1: TRxLabel;
    DBText1: TDBText;
    tCadastro2Codigo: TIntegerField;
    tCadastro2Cpf: TStringField;
    tMovimentos: TTable;
    tMovimentosCodigoFuncionario: TIntegerField;
    tMovimentosContador: TAutoIncField;
    tCadastro2Nome: TStringField;
    tCadastroNumeroCarteira: TStringField;
    tCadastroSerieCarteira: TStringField;
    tCadastroPis: TStringField;
    Panel5: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    VerificaCPF1: TVerificaCPF;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Label14: TLabel;
    Label15: TLabel;
    tCadastroAgencia: TStringField;
    tCadastroBanco: TStringField;
    tCadastroContaCorrente: TStringField;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    tCadastroCep: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure tCadastroAfterPost(DataSet: TDataSet);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita_Desabilita;
  public
    { Public declarations }
  end;

var
  fCadastro: TfCadastro;

implementation

uses URelProcuracao, UProcuracao, UPrevRequerimento, UPrevPensao,
     UPrevRelacaoSalario, URecurso;

{$R *.DFM}

procedure TfCadastro.Habilita_Desabilita;
begin
  Panel2.Enabled  := not(Panel2.Enabled);
  Panel3.Enabled  := not(Panel3.Enabled);
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn2.Enabled := not(BitBtn2.Enabled);
  BitBtn3.Enabled := not(BitBtn3.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
  BitBtn5.Enabled := not(BitBtn5.Enabled);
  BitBtn6.Enabled := not(BitBtn6.Enabled);
end;

procedure TfCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfCadastro.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfCadastro.BitBtn4Click(Sender: TObject);
begin
  tCadastro.Cancel;
  Habilita_Desabilita;
end;

procedure TfCadastro.BitBtn1Click(Sender: TObject);
begin
  Habilita_Desabilita;
  tCadastro2.Last;
  tCadastro.Insert;
  tCadastroCodigo.AsInteger := tCadastro2Codigo.AsInteger + 1;
  DBEdit1.SetFocus;
end;

procedure TfCadastro.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfCadastro.DBComboBox1Exit(Sender: TObject);
begin
  if (DBComboBox1.Text = 'M') or (DBComboBox1.Text = 'F') then
  else
    begin
      ShowMessage('Digite apenas "M" ou "F" aqui!');
      DBComboBox1.SetFocus;
    end;
end;

procedure TfCadastro.DBEdit6Exit(Sender: TObject);
begin
{  VerificaCpf1.Entrada := DBEdit6.Text;
 if not VerificaCPF1.Resultado then
    begin
      ShowMessage('Número de CPF inválido!');
      DBEdit6.SetFocus;
    end;
  tCadastro2.IndexFieldNames := 'CPF';
  tCadastro2.SetKey;
  tCadastro2CPF.AsString := tCadastroCPF.AsString;
  if tCadastro2.GotoKey then
    begin
      if MessageDlg('Já existe um Funcionário com este Nº de CPF cadastrado como '
         + tCadastro2Nome.AsString +'!'
         +#13+'Deseja continuar?',mtconfirmation,
         [mbok,mbno],0) = mrNO then
        BitBtn4Click(Sender);
    end;
  tCadastro2.IndexFieldNames := 'Codigo';}
end;

procedure TfCadastro.DBEdit5Exit(Sender: TObject);
begin
{  if not CheckPis1.IsValid(DBEdit5.Text) then
    begin
      ShowMessage('Número de PIS inválido!');
      DBEdit5.SetFocus;
    end;}
end;

procedure TfCadastro.BitBtn2Click(Sender: TObject);
begin
  Habilita_Desabilita;
  DBEdit1.SetFocus;
  tCadastro.Edit;
end;

procedure TfCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if tCadastro.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve cancelar ou confirmar antes de fechar esta janela');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfCadastro.BitBtn3Click(Sender: TObject);
begin
  if (DBEdit1.Text <> '') and (DBComboBox1.Text <> '') and (tCadastroDataNascimento.AsString <> '') then
    begin
      tCadastro.Post;
      Habilita_Desabilita;
    end
  else
    ShowMessage('Há campos necessários em branco!');
end;

procedure TfCadastro.BitBtn5Click(Sender: TObject);
begin
  if MessageDlg('Esta operação apagará o funcionário e todos seus movimentos.'
     +#13+'Deseja realmente excluir o funcionário ' + tCadastroNome.AsString + '?',mtconfirmation,
     [mbok,mbno],0) = mrOK then
    begin
      tMovimentos.First;
      while not tMovimentos.EOF do
        tMovimentos.Delete;
      tCadastro.Delete;
    end
  else
    tCadastro.Cancel;
end;

procedure TfCadastro.DBLookupComboBox1Exit(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Codigo';
  BitBtn1.SetFocus;
end;

procedure TfCadastro.DBLookupComboBox1Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Nome';
end;

procedure TfCadastro.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  tCadastro.IndexFieldNames := 'Codigo';
end;

procedure TfCadastro.tCadastroAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tCadastro.Handle);
end;

procedure TfCadastro.BitBtn7Click(Sender: TObject);
begin
  fRecurso := TfRecurso.Create(Self);
  fRecurso.ShowModal;
end;

procedure TfCadastro.BitBtn8Click(Sender: TObject);
begin
  fPrevProcuracao := TfPrevProcuracao.Create(Self);
  fPrevProcuracao.ShowModal;
end;

procedure TfCadastro.BitBtn9Click(Sender: TObject);
begin
  fPrevRequerimento := TfPrevRequerimento.Create(Self);
  fPrevRequerimento.ShowModal;
end;

procedure TfCadastro.BitBtn10Click(Sender: TObject);
begin
  fPrevPensao := TfPrevPensao.Create(Self);
  fPrevPensao.ShowModal;
end;

procedure TfCadastro.BitBtn11Click(Sender: TObject);
begin
  fRelacaoSalario := TfRelacaoSalario.Create(Self);
  fRelacaoSalario.ShowModal;
end;

end.
