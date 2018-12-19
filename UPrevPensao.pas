unit UPrevPensao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, StdCtrls, DBCtrls, Mask, ToolEdit, RXDBCtrl,
  Buttons, DBIProcs, Grids, DBGrids;

type
  TfPrevPensao = class(TForm)
    tCadastro: TTable;
    dsCadastro: TDataSource;
    tPensaoAuxReclu: TTable;
    dsPensaoAuxReclu: TDataSource;
    tDependentes: TTable;
    dsDependentes: TDataSource;
    Panel2: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    Panel3: TPanel;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel5: TPanel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBDateEdit2: TDBDateEdit;
    Panel6: TPanel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    BitBtn7: TBitBtn;
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
    Panel8: TPanel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    tRequerimento: TTable;
    dsRequerimento: TDataSource;
    tPensaoAuxRecluCodFun: TIntegerField;
    tPensaoAuxRecluContador: TAutoIncField;
    tPensaoAuxRecluDataObitoReclusao: TDateField;
    tPensaoAuxRecluEstadoCivil: TStringField;
    tPensaoAuxRecluBancoAgencia: TStringField;
    tPensaoAuxRecluLocal: TStringField;
    tPensaoAuxRecluDataDoc: TDateField;
    tPensaoAuxRecluQualidade: TStringField;
    tDependentesCodiFun: TIntegerField;
    tDependentesContador: TAutoIncField;
    tDependentesNomeDependentes: TStringField;
    tDependentesParentesco: TStringField;
    BitBtn8: TBitBtn;
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
    tPensaoAuxRecluCepDependentes: TStringField;
    tPensaoAuxRecluCepRecebedor: TStringField;
    tPensaoAuxRecluEndDependentes: TStringField;
    tPensaoAuxRecluNomeRecebedor: TStringField;
    tPensaoAuxRecluEndRecebedor: TStringField;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure tPensaoAuxRecluAfterPost(DataSet: TDataSet);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBDateEdit2Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fPrevPensao: TfPrevPensao;

implementation

uses UDependentes, URelPenAuxRec, UCadastro;

{$R *.DFM}

procedure TfPrevPensao.Habilita;
begin
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn2.Enabled := not(BitBtn2.Enabled);
  BitBtn3.Enabled := not(BitBtn3.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
  BitBtn5.Enabled := not(BitBtn5.Enabled);
  BitBtn6.Enabled := not(BitBtn6.Enabled);
  BitBtn8.Enabled := not(BitBtn8.Enabled);
  Panel2.Enabled  := not(Panel2.Enabled);
  Panel3.Enabled  := not(Panel3.Enabled);
//  Panel7.Enabled  := not(Panel7.Enabled);
  Panel8.Enabled  := not(Panel8.Enabled);
  Panel6.Enabled  := not(Panel6.Enabled);
  Panel5.Enabled  := not(Panel5.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfPrevPensao.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevPensao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfPrevPensao.BitBtn4Click(Sender: TObject);
begin
  tPensaoAuxReclu.Cancel;
  Habilita;
end;

procedure TfPrevPensao.BitBtn7Click(Sender: TObject);
begin
  fDependentes := TfDependentes.Create(Self);
  fDependentes.ShowModal;
end;

procedure TfPrevPensao.BitBtn1Click(Sender: TObject);
begin
  tPensaoAuxReclu.Last;
  tPensaoAuxReclu.Insert;
  Habilita;
end;

procedure TfPrevPensao.BitBtn2Click(Sender: TObject);
begin
  tPensaoAuxReclu.Edit;
  Habilita;
end;

procedure TfPrevPensao.BitBtn5Click(Sender: TObject);
begin
  If MessageDlg('Esta operação apagará o registro atual.',mtConfirmation,
     [mbOK,mbNO],0) = mrOK then
    tPensaoAuxReclu.Delete
  else
    tPensaoAuxReclu.Cancel;
end;

procedure TfPrevPensao.BitBtn3Click(Sender: TObject);
begin
  tPensaoAuxReclu.Post;
  Habilita;
  BitBtn8.SetFocus;
end;

procedure TfPrevPensao.tPensaoAuxRecluAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tPensaoAuxReclu.Handle);
end;

procedure TfPrevPensao.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  tPensaoAuxReclu.IndexFieldNames := 'CodFun';
end;

procedure TfPrevPensao.BitBtn8Click(Sender: TObject);
var
  vcodfun, vcontador : string;
begin
  vcodfun   := tPensaoAuxRecluCodFun.AsString;
  vcontador := tPensaoAuxRecluContador.AsString;
  tPensaoAuxReclu.Filtered := False;
  tPensaoAuxReclu.Filter := 'CodFun = '''+vcodfun+''' and contador = '''+vcontador+'''';
  tPensaoAuxReclu.Filtered := True;
  fRelPensaoAuxRec := TfRelPensaoAuxRec.Create(Self);
  fRelPensaoAuxRec.QuickRep1.Preview;// exibir relatorio
  fRelPensaoAuxRec.QuickRep1.Free;
  tPensaoAuxReclu.Filtered := False;
  tPensaoAuxReclu.IndexFieldNames := 'CodFun;Contador';
  tPensaoAuxReclu.FindKey([StrToInt(vcodfun),StrToInt(vcontador)]);
end;

procedure TfPrevPensao.DBDateEdit2Exit(Sender: TObject);
begin
  BitBtn3.SetFocus;
end;

end.
