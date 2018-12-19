unit USalariosContrbuicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, DBCtrls, Buttons, StdCtrls, Grids, DBGrids, DBIProcs,
  ToolEdit, RXDBCtrl, Mask, CurrEdit;

type
  TfSalariosContribuicao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
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
    Label14: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBEdit14: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label15: TLabel;
    Label16: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    DBDateEdit5: TDBDateEdit;
    DBDateEdit6: TDBDateEdit;
    DBDateEdit7: TDBDateEdit;
    DBDateEdit8: TDBDateEdit;
    DBDateEdit9: TDBDateEdit;
    DBDateEdit10: TDBDateEdit;
    DBDateEdit11: TDBDateEdit;
    DBDateEdit12: TDBDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    function Soma: Currency;
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fSalariosContribuicao: TfSalariosContribuicao;

implementation

uses UPrevRelacaoSalario, URelUltimosSalarios, UCadastro;

{$R *.DFM}

function TfSalariosContribuicao.Soma: Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to 12 do
    Result := Result + fRelacaoSalario.tUltimoSalario.FieldByName('Mes' + IntToStr(i)).AsCurrency;
end;

procedure TfSalariosContribuicao.Habilita;
begin
  BitBtn1.Enabled := not BitBtn1.Enabled;
  BitBtn2.Enabled := not BitBtn2.Enabled;
  BitBtn3.Enabled := not BitBtn3.Enabled;
  BitBtn4.Enabled := not BitBtn4.Enabled;
  BitBtn5.Enabled := not BitBtn5.Enabled;
  BitBtn6.Enabled := not BitBtn6.Enabled;
  Panel2.Enabled := not Panel2.Enabled;
end;

procedure TfSalariosContribuicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfSalariosContribuicao.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfSalariosContribuicao.DBEdit1Exit(Sender: TObject);
begin
  fRelacaoSalario.tUltimoSalarioSoma.AsCurrency := Soma;
end;

procedure TfSalariosContribuicao.BitBtn2Click(Sender: TObject);
begin
  if fRelacaoSalario.tUltimoSalario.RecordCount <> 4 then
    begin
      Habilita;
      DBEdit14.SetFocus;
      fRelacaoSalario.tUltimoSalario2.Last;
      fRelacaoSalario.tUltimoSalario.Insert;
      fRelacaoSalario.tUltimoSalarioItem.AsInteger := fRelacaoSalario.tUltimoSalario2Item.AsInteger + 1;
      fRelacaoSalario.tUltimoSalario.Post;
      fRelacaoSalario.tUltimoSalario.Edit; 
    end
  else
    ShowMessage('Já há 4 anos cadastrados!');
end;

procedure TfSalariosContribuicao.BitBtn6Click(Sender: TObject);
begin
  fRelacaoSalario.tUltimoSalarioContador.AsInteger := fRelacaoSalario.tRelacaoSalarioContador.AsInteger;
  fRelacaoSalario.tUltimoSalario.Post;
  Habilita;
  BitBtn2.SetFocus;
end;

procedure TfSalariosContribuicao.BitBtn5Click(Sender: TObject);
begin
  if MessageDLG('Deseja realmente excluir os lançamentos deste ano?',mtConfirmation,[mbOk,mbNo],0) = mrOk then
    fRelacaoSalario.tUltimoSalario.Delete;
end;

procedure TfSalariosContribuicao.BitBtn1Click(Sender: TObject);
begin
  Habilita;
  DBEdit14.SetFocus;
  fRelacaoSalario.tUltimoSalario.Edit;
end;

procedure TfSalariosContribuicao.BitBtn4Click(Sender: TObject);
begin
  if fRelacaoSalario.tUltimoSalarioAno.AsString = '' then
    BitBtn5Click(Sender)
  else
    fRelacaoSalario.tUltimoSalario.Cancel;
  Habilita;
  BitBtn2.SetFocus;
end;

end.
