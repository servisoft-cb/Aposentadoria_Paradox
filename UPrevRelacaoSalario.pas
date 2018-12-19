unit UPrevRelacaoSalario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DBCtrls, StdCtrls, ExtCtrls, Buttons, Mask, ToolEdit,
  RXDBCtrl, DBIProcs, Grids, DBGrids, MemTable;

type
  TfRelacaoSalario = class(TForm)
    tRelacaoSalario: TTable;
    dsRelacaoSalario: TDataSource;
    tUltimoSalario: TTable;
    dsUltimoSalario: TDataSource;
    tAumentoSalarial: TTable;
    dsAumentoSalarial: TDataSource;
    tCadastro: TTable;
    dsCadastro: TDataSource;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    DBDateEdit2: TDBDateEdit;
    Panel4: TPanel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    tRelacaoSalarioCodiFun: TIntegerField;
    tRelacaoSalarioMatINSS: TStringField;
    tRelacaoSalarioDtaAdm: TDateField;
    tRelacaoSalarioDDeslEmpresa: TDateField;
    tRelacaoSalarioLocal: TStringField;
    tRelacaoSalarioDataDoc: TDateField;
    Label9: TLabel;
    DBDateEdit3: TDBDateEdit;
    BitBtn9: TBitBtn;
    tAumentoSalarialCodFun: TIntegerField;
    tAumentoSalarialContador: TAutoIncField;
    tAumentoSalarialAno: TStringField;
    tAumentoSalarialMotivo: TStringField;
    tAumentoSalarialPorcentagem: TFloatField;
    DBGrid2: TDBGrid;
    Panel7: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tAumentoSalarialMes: TStringField;
    tUltimoSalarioCodFunci: TIntegerField;
    tUltimoSalarioAno: TStringField;
    tUltimoSalarioMes1: TFloatField;
    tUltimoSalarioMes2: TFloatField;
    tUltimoSalarioMes3: TFloatField;
    tUltimoSalarioMes4: TFloatField;
    tUltimoSalarioMes5: TFloatField;
    tUltimoSalarioMes6: TFloatField;
    tUltimoSalarioMes7: TFloatField;
    tUltimoSalarioMes8: TFloatField;
    tUltimoSalarioMes9: TFloatField;
    tUltimoSalarioMes10: TFloatField;
    tUltimoSalarioMes11: TFloatField;
    tUltimoSalarioMes12: TFloatField;
    tUltimoSalarioSoma: TFloatField;
    tUltimoSalarioRec1: TDateField;
    tUltimoSalarioRec2: TDateField;
    tUltimoSalarioRec3: TDateField;
    tUltimoSalarioRec4: TDateField;
    tUltimoSalarioRec5: TDateField;
    tUltimoSalarioRec6: TDateField;
    tUltimoSalarioRec7: TDateField;
    tUltimoSalarioRec8: TDateField;
    tUltimoSalarioRec9: TDateField;
    tUltimoSalarioRec10: TDateField;
    tUltimoSalarioRec11: TDateField;
    tUltimoSalarioRec12: TDateField;
    DBGrid1: TDBGrid;
    tRelacaoSalariolkFuncionario: TStringField;
    tRelacaoSalarioEmpresa: TStringField;
    tRelacaoSalarioEndereco: TStringField;
    tRelacaoSalarioCgc: TStringField;
    tUltimoSalarioContador: TAutoIncField;
    tAumentosSalariais: TTable;
    tAumentosSalariaisCodFun: TIntegerField;
    tAumentosSalariaisContador: TAutoIncField;
    tAumentosSalariaisAno: TStringField;
    tAumentosSalariaisMotivo: TStringField;
    tAumentosSalariaisPorcentagem: TFloatField;
    tAumentosSalariaisMes: TStringField;
    dsAumentosSalariais: TDataSource;
    tRelacaoSalarioContador: TAutoIncField;
    tUltimoSalarioItem: TIntegerField;
    tUltimoSalario2: TTable;
    tUltimoSalario2CodFunci: TIntegerField;
    tUltimoSalario2Contador: TIntegerField;
    tUltimoSalario2Item: TIntegerField;
    tUltimoSalario2Ano: TStringField;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure tRelacaoSalarioAfterPost(DataSet: TDataSet);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure tAumentosSalariaisAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fRelacaoSalario: TfRelacaoSalario;

implementation

uses USalariosContrbuicao, UAumentosSalariais, URelUltimosSalarios, UCadastro;

{$R *.DFM}

procedure TfRelacaoSalario.Habilita;
begin
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn2.Enabled := not(BitBtn2.Enabled);
  BitBtn3.Enabled := not(BitBtn3.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
  BitBtn5.Enabled := not(BitBtn5.Enabled);
  BitBtn6.Enabled := not(BitBtn6.Enabled);
  BitBtn9.Enabled := not(BitBtn9.Enabled);
  Panel3.Enabled  := not(Panel3.Enabled);
  Panel4.Enabled  := not(Panel4.Enabled);
  Panel5.Enabled  := True;
  Panel6.Enabled  := not(Panel6.Enabled);
  Panel7.Enabled  := not(Panel7.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfRelacaoSalario.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfRelacaoSalario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfRelacaoSalario.BitBtn1Click(Sender: TObject);
begin
  tRelacaoSalario.Last;
  tRelacaoSalario.Insert;
  tRelacaoSalario.Post;
  tRelacaoSalario.Edit;
  Habilita; // habilita botoes
  DBDateEdit1.SetFocus;
end;

procedure TfRelacaoSalario.BitBtn2Click(Sender: TObject);
begin
  tRelacaoSalario.Edit;
  Habilita;
end;

procedure TfRelacaoSalario.BitBtn5Click(Sender: TObject);
begin
  If MessageDlg('Esta operação apagará o registro atual!',mtConfirmation,
     [mbNo,mbOK],0) = mrOK then
     begin
       tUltimoSalario.First;
       while not fRelacaoSalario.tUltimoSalario.EOF do
         fRelacaoSalario.tUltimoSalario.Delete;
       tAumentosSalariais.First;
       while not tAumentosSalariais.EOF do
         tAumentosSalariais.Delete;
       tRelacaoSalario.Delete;
     end
  else
    tRelacaoSalario.Cancel;
end;

procedure TfRelacaoSalario.BitBtn3Click(Sender: TObject);
begin
  tRelacaoSalario.Post;
  Habilita;
end;

procedure TfRelacaoSalario.tRelacaoSalarioAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tRelacaoSalario.Handle);
end;

procedure TfRelacaoSalario.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  tRelacaoSalario.IndexFieldNames := 'CodiFun';
end;

procedure TfRelacaoSalario.BitBtn4Click(Sender: TObject);
begin
  tRelacaoSalario.Cancel;
  Habilita;
end;

procedure TfRelacaoSalario.SpeedButton1Click(Sender: TObject);
begin
  fSalariosContribuicao := TfSalariosContribuicao.Create(Self);
  fSalariosContribuicao.ShowModal;
end;

procedure TfRelacaoSalario.SpeedButton2Click(Sender: TObject);
begin
  fAumentosSalariais := TfAumentosSalariais.Create(Self);
  fAumentosSalariais.ShowModal;
end;

procedure TfRelacaoSalario.BitBtn9Click(Sender: TObject);
var
  vcodfun, vcodifun : string;
  soma    : currency;
begin
  soma := 0;
  vcodfun   := tRelacaoSalarioCodiFun.AsString;
  tRelacaoSalario.Filtered := False;
  tRelacaoSalario.Filter   := 'CodiFun = '''+vcodfun+'''';
  tRelacaoSalario.Filtered := True;
// soma total valores
  vcodifun := tUltimoSalarioCodFunci.AsString;
  tUltimoSalario.Filtered := False;
  tUltimoSalario.Filter   := 'CodFunci = '''+vcodifun+'''';
  tUltimoSalario.Filtered := True;
  tUltimoSalario.First;
  while not tUltimoSalario.EOF do
    begin
      tUltimoSalario.Edit;
      soma := tUltimoSalarioSoma.AsCurrency + soma;
      tUltimoSalarioSoma.AsCurrency := soma;
      tUltimoSalario.Post;
      tUltimoSalario.Next;
    end;
  tUltimoSalario.Filtered := False;
//                                                                       *******
  fRelUltimosSalarios := TfRelUltimosSalarios.Create(Self);
  fRelUltimosSalarios.QuickRep1.Preview;
  fRelUltimosSalarios.Free;
  tRelacaoSalario.Filtered := False;
  tRelacaoSalario.IndexFieldNames := 'CodiFun';
  tRelacaoSalario.FindKey([StrToInt(vcodfun)]);
end;

procedure TfRelacaoSalario.tAumentosSalariaisAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tAumentosSalariais.Handle);
end;

end.
