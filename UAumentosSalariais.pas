unit UAumentosSalariais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, DBIProcs,
  ToolEdit, CurrEdit, Grids, DBGrids, RXDBCtrl;

type
  TfAumentosSalariais = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RxDBGrid1: TRxDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAumentosSalariais: TfAumentosSalariais;

implementation

uses UPrevRelacaoSalario, UCadastro;

{$R *.DFM}

procedure TfAumentosSalariais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfAumentosSalariais.BitBtn6Click(Sender: TObject);
begin
  fRelacaoSalario.tAumentosSalariais.Insert;
  fRelacaoSalario.tAumentosSalariaisMes.AsString := Edit1.Text;
  fRelacaoSalario.tAumentosSalariaisAno.AsString := Edit2.Text;
  fRelacaoSalario.tAumentosSalariaisMotivo.AsString := Edit3.Text;
  fRelacaoSalario.tAumentosSalariaisPorcentagem.AsInteger := CurrencyEdit1.AsInteger;
  fRelacaoSalario.tAumentosSalariais.Post;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  CurrencyEdit1.Clear;
end;

procedure TfAumentosSalariais.BitBtn7Click(Sender: TObject);
begin
  Close;
end;

procedure TfAumentosSalariais.BitBtn9Click(Sender: TObject);
begin
  If MessageDlg('Deseja realmente apagar este registro?',mtInformation,
     [mbOK,mbNO],0) = mrOk then
    fRelacaoSalario.tAumentosSalariais.Delete
  else
    fRelacaoSalario.tAumentosSalariais.Cancel;
end;

procedure TfAumentosSalariais.BitBtn8Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  CurrencyEdit1.Clear;
end;

end.
