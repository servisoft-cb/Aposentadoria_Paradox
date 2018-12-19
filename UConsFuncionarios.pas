unit UConsFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, RXLookup, Db, DBTables, Grids,
  DBGrids;

type
  TfConsFuncionarios = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsFuncionarios: TfConsFuncionarios;

implementation

uses UConsFuncDet;

{$R *.DFM}

procedure TfConsFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfConsFuncionarios.DBLookupComboBox1Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Nome';
end;

procedure TfConsFuncionarios.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Codigo';
end;

procedure TfConsFuncionarios.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsFuncionarios.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  DBLookupComboBox1.KeyValue := '';
end;

procedure TfConsFuncionarios.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  RxDBLookupCombo1.KeyValue := 0;
end;

procedure TfConsFuncionarios.DBGrid1DblClick(Sender: TObject);
begin
  fConsFuncDet := TfConsFuncDet.Create(Self);
  fConsFuncDet.ShowModal;
end;

end.
