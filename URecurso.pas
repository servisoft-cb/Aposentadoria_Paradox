unit URecurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, ToolEdit, RXDBCtrl, Db,
  DBTables;

type
  TfRecurso = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn3: TBitBtn;
    Panel5: TPanel;
    Label2: TLabel;
    Panel6: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    tRecurso: TTable;
    dsRecurso: TDataSource;
    tRecursoFuncionario: TIntegerField;
    tRecursoTipo: TSmallintField;
    tRecursoObs: TMemoField;
    tRecursoInicio: TDateField;
    tRecursoFim: TDateField;
    tRecursoLocal: TStringField;
    tRecursoData: TDateField;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBEdit2: TDBEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn7: TBitBtn;
    BitBtn1: TBitBtn;
    tRecursoNumero: TStringField;
    tRecursoRecorrente: TStringField;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fRecurso: TfRecurso;

implementation

uses URelRecurso, UCadastro;

{$R *.DFM}

procedure TfRecurso.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  BitBtn7.Enabled      := not(BitBtn7.Enabled);
  Panel1.Enabled       := not(Panel1.Enabled);
  Panel3.Enabled       := not(Panel3.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  Panel5.Enabled       := not(Panel5.Enabled);
  Panel6.Enabled       := not(Panel6.Enabled);
end;

procedure TfRecurso.BitBtn1Click(Sender: TObject);
begin
  fRelRecurso := TfRelRecurso.Create(Self);
  fRelRecurso.QuickRep1.Preview;
end;

procedure TfRecurso.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfRecurso.BitBtn4Click(Sender: TObject);
begin
  Habilita;
  tRecurso.Insert;
  tRecursoRecorrente.AsString := fCadastro.tCadastroNome.AsString;
  tRecursoTipo.AsInteger := 0;
end;

procedure TfRecurso.BitBtn5Click(Sender: TObject);
begin
  Habilita;
  tRecurso.Edit;
end;

procedure TfRecurso.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir este recurso?',mtConfirmation,[mbOk,mbNO],0) = mrOk then
    tRecurso.Delete;
end;

procedure TfRecurso.BitBtn7Click(Sender: TObject);
begin
  Habilita;
  tRecurso.Post;
end;

procedure TfRecurso.BitBtn3Click(Sender: TObject);
begin
  Habilita;
  tRecurso.Cancel;
end;

end.
