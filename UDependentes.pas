unit UDependentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, DBIProcs,
  Grids, DBGrids, RXDBCtrl;

type
  TfDependentes = class(TForm)
    tDependentes: TTable;
    dsDependentes: TDataSource;
    tCadastro: TTable;
    dsCadastro: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    tDependentesCodiFun: TIntegerField;
    tDependentesContador: TAutoIncField;
    tDependentesNomeDependentes: TStringField;
    tDependentesParentesco: TStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tDependentesAfterPost(DataSet: TDataSet);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDependentes: TfDependentes;

implementation

uses URelPenAuxRec, UPrevPensao, UCadastro;

{$R *.DFM}

procedure TfDependentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tDependentes.Refresh;
  Action := CaFree;
end;

procedure TfDependentes.tDependentesAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tDependentes.Handle);
end;

procedure TfDependentes.BitBtn7Click(Sender: TObject);
begin
  tDependentes.Refresh;
  Close;
end;

procedure TfDependentes.BitBtn9Click(Sender: TObject);
begin
  If MessageDlg('Esta operação apagará o resgistro atual!',mtConfirmation,
     [mbOK,mbNo],0) = mrOk then
    tDependentes.Delete
  else
    tDependentes.Cancel;
end;

procedure TfDependentes.BitBtn8Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
end;

procedure TfDependentes.BitBtn6Click(Sender: TObject);
begin
  tDependentes.Last;
  tDependentes.Insert;
  tDependentesNomeDependentes.AsString := Edit1.Text;
  tDependentesParentesco.AsString := Edit2.Text;
  tDependentes.Post;
  Edit1.Clear;
  Edit2.Clear; 
end;

end.
