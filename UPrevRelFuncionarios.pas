unit UPrevRelFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Db, DBTables, RXLookup;

type
  TfPrevRelFuncionarios = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tCadastro: TTable;
    dsCadastro: TDataSource;
    RadioGroup2: TRadioGroup;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevRelFuncionarios: TfPrevRelFuncionarios;

implementation

uses URelFuncionarios;

{$R *.DFM}

procedure TfPrevRelFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfPrevRelFuncionarios.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
          RxDBLookupCombo1.KeyValue := 0;
          RxDBLookupCombo2.KeyValue := 0;
          RxDBLookupCombo1.Enabled  := False;
          RxDBLookupCombo2.Enabled  := False;
          DBLookupComboBox3.Enabled := True;
          DBLookupComboBox4.Enabled := True;
          tCadastro.IndexFieldNames := 'Nome';
        end;
    1 : begin
          DBLookupComboBox3.KeyValue := '';
          DBLookupComboBox4.KeyValue := '';
          RxDBLookupCombo1.Enabled   := True;
          RxDBLookupCombo2.Enabled   := True;
          DBLookupComboBox3.Enabled  := False;
          DBLookupComboBox4.Enabled  := False;
          tCadastro.IndexFieldNames  := 'Codigo';
        end;
  end;
end;

procedure TfPrevRelFuncionarios.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelFuncionarios.BitBtn2Click(Sender: TObject);
begin
  RxDBLookupCombo1.KeyValue  := 0;
  RxDBLookupCombo2.KeyValue  := 0;
  DBLookupComboBox3.KeyValue := '';
  DBLookupComboBox4.KeyValue := '';
  RxDBLookupCombo1.Enabled   := False;
  RxDBLookupCombo2.Enabled   := False;
  DBLookupComboBox3.Enabled  := True;
  DBLookupComboBox4.Enabled  := True;
  tCadastro.IndexFieldNames  := 'Nome';
  RadioGroup1.ItemIndex      := 0;
  RadioGroup2.ItemIndex      := 0;
end;

procedure TfPrevRelFuncionarios.BitBtn1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
          tCadastro.Filtered := False;
          tCadastro.Filter   := 'Nome >= '''+DBLookupComboBox3.Text+''' and Nome <= '''+DBLookupComboBox4.Text+'''';
          tCadastro.Filtered := True;
        end;
    1 : begin
          tCadastro.Filtered := False;
          tCadastro.Filter   := 'Codigo >= '''+RxDBLookupCombo1.Text+''' and Codigo <= '''+RxDBLookupCombo2.Text+'''';
          tCadastro.Filtered := True;
        end;
  end;
  fRelFuncionarios := TfRelFuncionarios.Create(Self);
  case RadioGroup2.ItemIndex of
    0 : fRelFuncionarios.QuickRep1.Print;
    1 : fRelFuncionarios.QuickRep1.Preview;
  end;
  tCadastro.Filtered := False;
end;

end.
