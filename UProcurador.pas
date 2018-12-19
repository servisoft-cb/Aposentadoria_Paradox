unit UProcurador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, ToolEdit, DBIProcs,
  RXDBCtrl;

type
  TfProcurador = class(TForm)
    Panel1: TPanel;
    tProcurador: TTable;
    dsProcurador: TDataSource;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
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
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit9: TDBEdit;
    Label5: TLabel;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    tProcurador2: TTable;
    tProcurador2Codigo: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure tProcuradorAfterPost(DataSet: TDataSet);
    procedure DBDateEdit1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita_Desabilita;
  public
    { Public declarations }
  end;

var
  fProcurador: TfProcurador;

implementation

uses URelProcuracao, UCadastro;

{$R *.DFM}

procedure TfProcurador.Habilita_Desabilita;
begin
  Panel1.Enabled       := not(Panel1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  BitBtn7.Enabled      := not(BitBtn7.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfProcurador.BitBtn1Click(Sender: TObject);
begin
  fRelProcuracao := TfRelProcuracao.Create(Self);// cria formulario procuração
  fRelProcuracao.QuickRep1.Preview; // exibe relatório
end;

procedure TfProcurador.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfProcurador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfProcurador.BitBtn3Click(Sender: TObject);
begin
  tProcurador.Cancel;
  Habilita_Desabilita;
end;

procedure TfProcurador.BitBtn5Click(Sender: TObject);
begin
  tProcurador.Insert;
  Habilita_Desabilita;
  DBEdit5.SetFocus;
end;

procedure TfProcurador.BitBtn4Click(Sender: TObject);
begin
  tProcurador.Edit;
  Habilita_Desabilita;
  DBEdit5.SetFocus;
end;

procedure TfProcurador.BitBtn6Click(Sender: TObject);
begin
  tProcurador2.Last;
  tProcuradorCodigo.AsInteger := tProcurador2Codigo.AsInteger + 1;
  tProcurador.Post;
  Habilita_Desabilita;
  BitBtn5.SetFocus;
end;

procedure TfProcurador.BitBtn7Click(Sender: TObject);
begin
  if MessageDlg('Esta operação apagará o procurador atual!',mtConfirmation,[mbOk,mbNo],0) = mrOK then
    tProcurador.Delete;
end;

procedure TfProcurador.tProcuradorAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tProcurador.Handle);
end;

procedure TfProcurador.DBDateEdit1Exit(Sender: TObject);
begin
  BitBtn6.SetFocus;
end;           

end.
