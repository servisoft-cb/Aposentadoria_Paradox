unit UPrevRequerimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, DBCtrls, Mask, ToolEdit, RXDBCtrl,
  Buttons, DBIProcs;

type
  TfPrevRequerimento = class(TForm)
    tCadastro: TTable;
    dsCadastro: TDataSource;
    tCadastroCodigo: TIntegerField;
    tCadastroNome: TStringField;
    tCadastroEndereco: TStringField;
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
    Panel3: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    tRequerimento: TTable;
    dsRequerimento: TDataSource;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    GroupBox1: TGroupBox;
    DBEdit4: TDBEdit;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    tRequerimentoCodFunci: TIntegerField;
    tRequerimentoContador: TAutoIncField;
    tRequerimentoBeneficioRequerido: TStringField;
    tRequerimentoLegislacao: TStringField;
    tRequerimentoSexo: TStringField;
    tRequerimentoCarteira: TStringField;
    tRequerimentoNumero: TStringField;
    tRequerimentoPis: TStringField;
    tRequerimentoCpf: TIntegerField;
    tRequerimentoFiliacaoINPS: TStringField;
    tRequerimentoDependentes: TStringField;
    tRequerimentoOutraAtividade: TStringField;
    tRequerimentoGozoBeneficio: TStringField;
    tRequerimentoLocal: TStringField;
    tRequerimentoDataDocumento: TDateField;
    tRequerimentolkPisCliente: TStringField;
    tRequerimentolkCpfCliente: TStringField;
    tRequerimentolkSexoCliente: TStringField;
    tRequerimentolkNuCarteiraCliente: TStringField;
    tRequerimentolkNuSerie: TStringField;
    DBRadioGroup3: TDBRadioGroup;
    Panel7: TPanel;
    BitBtn7: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure tRequerimentoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Habilita_Desabilita;
  public
    { Public declarations }
  end;

var
  fPrevRequerimento: TfPrevRequerimento;

implementation

uses URelRequerimento, UCadastro;

{$R *.DFM}

procedure TfPrevRequerimento.Habilita_Desabilita;
begin
  Panel3.Enabled       := not(Panel3.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  Panel6.Enabled       := not(Panel6.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  BitBtn7.Enabled      := not(BitBtn7.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfPrevRequerimento.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRequerimento.BitBtn4Click(Sender: TObject);
begin
  tRequerimento.Cancel;
  Habilita_Desabilita;
end;

procedure TfPrevRequerimento.BitBtn1Click(Sender: TObject);
begin
  Habilita_Desabilita;
  tRequerimento.Last;
  tRequerimento.Insert;
end;

procedure TfPrevRequerimento.BitBtn2Click(Sender: TObject);
begin
  Habilita_Desabilita;
  tRequerimento.Edit;
end;

procedure TfPrevRequerimento.BitBtn3Click(Sender: TObject);
begin
  tRequerimento.Post;
  Habilita_Desabilita;
  BitBtn7.SetFocus;
end;

procedure TfPrevRequerimento.BitBtn5Click(Sender: TObject);
begin
  If MessageDlg('Deseja realmente apagar o registro atual?',mtInformation,[mbNO,mbOK],0) = mrOK then
    tRequerimento.Delete;
end;

procedure TfPrevRequerimento.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  tRequerimento.IndexFieldNames := 'CodFunci';
end;

procedure TfPrevRequerimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfPrevRequerimento.BitBtn7Click(Sender: TObject);
var
  vcodfunci, vcontador : string;
begin
  vcodfunci := tRequerimentoCodFunci.AsString;
  vcontador := tRequerimentoContador.AsString;
  tRequerimento.Filtered := False;
  tRequerimento.Filter := 'CodFunci = '''+vcodfunci+''' and contador = '''+vcontador+'''';
  tRequerimento.Filtered := True;
  fRelRequerimento := TfRelRequerimento.Create(Self);
  fRelRequerimento.QuickRep1.Preview;// exibr relatorio
  fRelRequerimento.QuickRep1.Free;
  tRequerimento.Filtered := False;
  tRequerimento.IndexFieldNames := 'CodFunci;Contador';
  tRequerimento.FindKey([StrToInt(vcodfunci),StrToInt(vcontador)]);
end;

procedure TfPrevRequerimento.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  tRequerimento.IndexFieldNames := 'CodFunci';
end;

procedure TfPrevRequerimento.DBLookupComboBox1Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Nome';
end;

procedure TfPrevRequerimento.DBLookupComboBox1Exit(Sender: TObject);
begin
  tRequerimento.IndexFieldNames := 'CodFunci';
end;

procedure TfPrevRequerimento.DBDateEdit1Exit(Sender: TObject);
begin
  BitBtn3.SetFocus;
end;

procedure TfPrevRequerimento.tRequerimentoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tRequerimento.Handle);
end;

end.
