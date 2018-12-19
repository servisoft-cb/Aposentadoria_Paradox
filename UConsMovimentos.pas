unit UConsMovimentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, RXLookup, Db, DBTables, Grids,
  DBGrids;

type
  TfConsMovimentos = class(TForm)
    Panel1: TPanel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    tCadastro: TTable;
    dsCadastro: TDataSource;
    tMovimentos: TTable;
    dsMovimentos: TDataSource;
    DBGrid1: TDBGrid;
    tMovimentosCodigoFuncionario: TIntegerField;
    tMovimentosContador: TAutoIncField;
    tMovimentosEmpresa: TStringField;
    tMovimentosFuncao: TStringField;
    tMovimentosEspecial: TStringField;
    tMovimentosDataAdmissao: TDateField;
    tMovimentosDataDemissao: TDateField;
    tMovimentosComumAA: TSmallintField;
    tMovimentosComumMM: TSmallintField;
    tMovimentosComumDD: TSmallintField;
    tMovimentosEspecialAA: TSmallintField;
    tMovimentosEspecialMM: TSmallintField;
    tMovimentosEspecialDD: TSmallintField;
    tMovimentosNomeFunc: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsMovimentos: TfConsMovimentos;

implementation

uses UConsMovimentosDet;

{$R *.DFM}

procedure TfConsMovimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfConsMovimentos.DBLookupComboBox1Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Nome';
end;

procedure TfConsMovimentos.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Codigo';
end;

procedure TfConsMovimentos.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsMovimentos.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  DBLookupComboBox1.KeyValue := '';
end;

procedure TfConsMovimentos.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  RxDBLookupCombo1.KeyValue := 0;
end;

procedure TfConsMovimentos.FormShow(Sender: TObject);
begin
  tCadastro.First;
  DBLookupComboBox1.KeyValue := tCadastro.FieldByName('Nome').AsString;
end;

procedure TfConsMovimentos.DBGrid1DblClick(Sender: TObject);
begin
  fConsMovimentosDet := TfConsMovimentosDet.Create(Self);
  fConsMovimentosDet.ShowModal;  
end;

end.
