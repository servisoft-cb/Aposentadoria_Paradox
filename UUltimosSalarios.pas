unit UUltimosSalarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, StdCtrls, Buttons, DBCtrls, Grids, DBGrids;

type
  TfUltimosSalarios = class(TForm)
    tUltimoSalario: TTable;
    dsUltimoSalario: TDataSource;
    tCadastro: TTable;
    dsCadastro: TDataSource;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel3: TPanel;
    tUltimoSalarioCodFunci: TIntegerField;
    tUltimoSalarioAno: TIntegerField;
    tUltimoSalarioMes1: TStringField;
    tUltimoSalarioValor1: TFloatField;
    tUltimoSalarioRec1: TDateField;
    tUltimoSalarioMes2: TStringField;
    tUltimoSalarioValor2: TFloatField;
    tUltimoSalarioRec2: TDateField;
    tUltimoSalarioMes3: TStringField;
    tUltimoSalarioValor3: TFloatField;
    tUltimoSalarioRec3: TDateField;
    tUltimoSalarioMes4: TStringField;
    tUltimoSalarioValor4: TFloatField;
    tUltimoSalarioRec4: TDateField;
    tUltimoSalarioMes5: TStringField;
    tUltimoSalarioValor5: TFloatField;
    tUltimoSalarioRec5: TDateField;
    tUltimoSalarioMes6: TStringField;
    tUltimoSalarioValor6: TFloatField;
    tUltimoSalarioRec6: TDateField;
    tUltimoSalarioMes7: TStringField;
    tUltimoSalarioValor7: TFloatField;
    tUltimoSalarioRec7: TDateField;
    tUltimoSalarioMes8: TStringField;
    tUltimoSalarioValor8: TFloatField;
    tUltimoSalarioRec8: TDateField;
    tUltimoSalarioMes9: TStringField;
    tUltimoSalarioRec9: TDateField;
    tUltimoSalarioValor9: TFloatField;
    tUltimoSalarioMes10: TStringField;
    tUltimoSalarioValor10: TFloatField;
    tUltimoSalarioRec10: TDateField;
    tUltimoSalarioMes11: TStringField;
    tUltimoSalarioValor11: TFloatField;
    tUltimoSalarioRec11: TDateField;
    tUltimoSalarioMes12: TStringField;
    tUltimoSalarioValor12: TFloatField;
    tUltimoSalarioRec12: TDateField;
    tUltimoSalarioSoma: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUltimosSalarios: TfUltimosSalarios;

implementation

{$R *.DFM}

procedure TfUltimosSalarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfUltimosSalarios.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

end.
