unit UMovimentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, ToolEdit,
  ComCtrls, Grids, DBGrids, DBIProcs, RXLookup;

type
  TfMovimentos = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    tCadastro: TTable;
    dsCadastro: TDataSource;
    tMovimentos: TTable;
    dsMovimentos: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    BitBtn3: TBitBtn;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
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
    tMovimentosTipoEspecial: TStringField;
    RadioGroup1: TRadioGroup;
    SpeedButton4: TSpeedButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure tMovimentosAfterPost(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    { Private declarations }
     procedure Calcula_Tempo;
     procedure Verifica_Concomitancia;
  public
    { Public declarations }
  end;

var
  fMovimentos: TfMovimentos;

implementation

uses UCadastro, UCalculos;

{$R *.DFM}

procedure TfMovimentos.Verifica_Concomitancia;
begin
  tMovimentos.First;
  While not tMovimentos.EOF do
    begin
      if (DateEdit1.Date <= tMovimentosDataAdmissao.AsDateTime) and (DateEdit2.Date >= tMovimentosDataDemissao.AsDateTime) then
        if MessageDlg('Outro período é concominante e menor que este!' + #13 + 'Apagar o período menor?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
          tMovimentos.Delete;
      if (DateEdit1.Date >= tMovimentosDataAdmissao.AsDateTime) and (DateEdit1.Date <= tMovimentosDataDemissao.AsDateTime) then
        begin
          DateEdit1.Date := tMovimentosDataDemissao.AsDateTime + 1;
          ShowMessage('Período será ajustado por estar em concominância com outro!');
        end;
      if (DateEdit2.Date >= tMovimentosDataAdmissao.AsDateTime) and (DateEdit2.Date <= tMovimentosDataDemissao.AsDateTime) then
        begin
          DateEdit2.Date := tMovimentosDataAdmissao.AsDateTime - 1;
          ShowMessage('Período será ajustado por estar em concominância com outro!');
        end;
      if DateEdit2.Date < DateEdit1.Date then
        begin
          ShowMessage('Período em concomitância com outro movimento!' + #13 + 'Período será desprezado!');
          SpeedButton1.Click;
        end;
      tMovimentos.Next;
    end;
end;

procedure TfMovimentos.Calcula_Tempo;
var
  Ano_Dem, Mes_Dem, Dia_Dem, Ano_Aux, Mes_Aux, Dia_Aux,
  Ano_Com, Mes_Com, Dia_Com, Ano_Esp, Mes_Esp, Dia_Esp : Word;
  Data_Aux, Data_Dem, Total_Dia, Dia_Ax2 : Integer;
begin
  DecodeDate(DateEdit1.Date, Ano_Aux, Mes_Aux, Dia_Aux);
  DecodeDate(DateEdit2.Date, Ano_Dem, Mes_Dem, Dia_Dem);
  Data_Aux := StrToInt(FormatFloat('0000', Ano_Aux) + FormatFloat('00', Mes_Aux) + FormatFloat('00', Dia_Aux));
  Data_Dem := StrToInt(FormatFloat('0000', Ano_Dem) + FormatFloat('00', Mes_Dem) + FormatFloat('00', Dia_Dem));
  Dia_Com  := 1;
  Mes_Com  := 0;
  Ano_Com  := 0;
  Total_Dia := 1;
  while Data_Aux < Data_Dem do
    begin
//**** Calcula a data aux ate chegar igual a data de demissao
      Dia_Aux := Dia_Aux + 1;
      if (Dia_Dem = 31) and (Mes_Dem = Mes_Aux) and (Ano_Dem = Ano_Aux) then
        begin
          if Dia_Aux > 31 then
            Dia_Aux := 31;
        end
      else
      if Dia_Aux > 30 then
        begin
          Dia_Aux := 1;
          Mes_Aux := Mes_Aux + 1;
          if Mes_Aux > 12 then
            begin
              Mes_Aux := 1;
              Ano_Aux := Ano_Aux + 1;
            end;
        end;
//**** Calcula a quantidade de dias, mes e ano
      Dia_Com := Dia_Com + 1;
      if (Dia_Dem = 31) and (Mes_Dem = Mes_Aux) and (Ano_Dem = Ano_Aux) and (Dia_Aux = 31) then
        begin
          if Dia_Com > 31 then
            Dia_Com := 31;
        end
      else
        if Dia_Com > 30 then
          begin
            Dia_Com := 1;
            Mes_Com := Mes_Com + 1;
            if Mes_Com > 11 then
              begin
                Mes_Com := 0;
                Ano_Com := Ano_Com + 1;
              end;
          end;
      Total_Dia := Total_Dia + 1;
      Data_Aux := StrToInt(FormatFloat('0000', Ano_Aux) + FormatFloat('00', Mes_Aux) + FormatFloat('00', Dia_Aux));
    end;
// Calculo do especial
  if tCadastro.FieldByName('Sexo').AsString = 'M' then
    case RadioGroup1.ItemIndex of
      0 : Total_Dia := Round(Total_Dia * 1.4);
      1 : Total_Dia := Round(Total_Dia * 1.75);
      2 : Total_Dia := Round(Total_Dia * 2.33);
    end
  else
    case RadioGroup1.ItemIndex of
      0 : Total_Dia := Round(Total_Dia * 1.2);
      1 : Total_Dia := Round(Total_Dia * 1.5);
      2 : Total_Dia := Round(Total_Dia * 2);
    end;

  Dia_Ax2 := 0;
  Dia_Esp := 0;
  Mes_Esp := 0;
  Ano_Esp := 0;
  while Dia_Ax2 < Total_Dia do
    begin
      Dia_Ax2 := Dia_Ax2 + 1;
      Dia_Esp := Dia_Esp + 1;
      if Dia_Esp > 30 then
        begin
          Dia_Esp := 1;
          Mes_Esp := Mes_Esp + 1;
          if Mes_Esp > 11 then
            begin
              Mes_Esp := 0;
              Ano_Esp := Ano_Esp + 1;
            end;
        end;
    end;
  if ComboBox1.Text = 'NÃO' then
    begin
      Edit3.Text := IntToStr(Ano_Com);
      Edit4.Text := IntToStr(Mes_Com);
      Edit5.Text := IntToStr(Dia_Com);
      Edit6.Text := '';
      Edit7.Text := '';
      Edit8.Text := '';
    end
  else
    begin
      Edit3.Text := '';
      Edit4.Text := '';
      Edit5.Text := '';
      Edit6.Text := IntToStr(Dia_Esp);
      Edit7.Text := IntToStr(Mes_Esp);
      Edit8.Text := IntToStr(Ano_Esp);
    end;
end;

procedure TfMovimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfMovimentos.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMovimentos.DBLookupComboBox1Exit(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Codigo';
  Edit1.SetFocus;
end;

procedure TfMovimentos.DBLookupComboBox1Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Nome';
end;

procedure TfMovimentos.BitBtn2Click(Sender: TObject);
begin
  if RXDBLookupCombo1.KeyValue > 0 then
    begin
      if Edit1.Text = '' then
        ShowMessage('Você deve digitar o nome da Empresa!')
      else
      if DateEdit1.Date > DateEdit2.Date then
        ShowMessage('Data Inicial não pode ser maior que Data Final!')
      else
        begin
          Verifica_Concomitancia;
          Calcula_Tempo;
          BitBtn3.Enabled := True;
          SpeedButton2.Enabled := False;
        end;
{      if (DateEdit1.Date > StrToDate('28/05/1998')) and (ComboBox1.Text = 'SIM') then
        begin
          ShowMessage('Para este peíodo não existe aposentadoria especial!');
          ComboBox1.Text := 'NÃO';
        end;  }
    end
  else
    ShowMessage('Você deve escolher um funcionário!');
end;

procedure TfMovimentos.FormShow(Sender: TObject);
begin
  DateEdit1.Date := Date;
  DateEdit2.Date := Date;
  RXDBLookupCombo1.KeyValue := 1;
  tMovimentos.IndexFieldNames := 'CodigoFuncionario;DataAdmissao';
end;

procedure TfMovimentos.SpeedButton1Click(Sender: TObject);
begin
  BitBtn3.Enabled      := False;
  SpeedButton2.Enabled := True;
  Edit1.SetFocus;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  Edit8.Clear;
  DateEdit1.Date := Date;
  DateEdit2.Date := Date;
end;

procedure TfMovimentos.BitBtn3Click(Sender: TObject);
begin
  tMovimentos.Insert;
  tMovimentos.FieldByName('CodigoFuncionario').AsInteger := tCadastro.FieldByName('Codigo').AsInteger;
  tMovimentos.FieldByName('Empresa').AsString            := Edit1.Text;
  tMovimentos.FieldByName('Funcao').AsString             := Edit2.Text;
  tMovimentos.FieldByName('Especial').AsString           := ComboBox1.Text;
  tMovimentos.FieldByName('TipoEspecial').AsInteger      := RadioGroup1.ItemIndex;
  tMovimentos.FieldByName('DataAdmissao').AsDateTime     := DateEdit1.Date;
  tMovimentos.FieldByName('DataDemissao').AsDateTime     := DateEdit2.Date;
  tMovimentos.FieldByName('ComumAA').AsString            := Edit3.Text;
  tMovimentos.FieldByName('ComumMM').AsString            := Edit4.Text;
  tMovimentos.FieldByName('ComumDD').AsString            := Edit5.Text;
  tMovimentos.FieldByName('EspecialAA').AsString         := Edit8.Text;
  tMovimentos.FieldByName('EspecialMM').AsString         := Edit7.Text;
  tMovimentos.FieldByName('EspecialDD').AsString         := Edit6.Text;
  tMovimentos.Post;
  BitBtn3.Enabled      := False;
  SpeedButton2.Enabled := True;
  SpeedButton1Click(Sender);
end;

procedure TfMovimentos.tMovimentosAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tMovimentos.Handle);
end;

procedure TfMovimentos.SpeedButton2Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente apagar este movimento?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
    tMovimentos.Delete;
end;

procedure TfMovimentos.SpeedButton3Click(Sender: TObject);
begin
  fCadastro := TfCadastro.Create(Self);
  fCadastro.ShowModal;
end;

procedure TfMovimentos.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  tCadastro.IndexFieldNames := 'Codigo';
  RXDBLookupCombo1.KeyValue := tCadastro.FieldByName('Codigo').AsInteger;
end;

procedure TfMovimentos.DBGrid1DblClick(Sender: TObject);
var
  Empresa, Funcao, Especial, DataAdm, DataDem : String;
begin
  Empresa  := tMovimentosEmpresa.AsString;
  Funcao   := tMovimentosFuncao.AsString;
  Especial := tMovimentosEspecial.AsString;
  DataAdm  := tMovimentosDataAdmissao.AsString;
  DataDem  := tMovimentosDataDemissao.AsString;
  Edit1.Text := Empresa;
  Edit2.Text := Funcao;
  ComboBox1.Text := Especial;
  DateEdit1.Text := DataAdm;
  DateEdit2.Text := DataDem;
  tMovimentos.Delete;
end;

procedure TfMovimentos.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.Text = 'SIM' then

    RadioGroup1.Enabled := True

  else
    RadioGroup1.Enabled := False;

end;

procedure TfMovimentos.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(key);
end;


procedure TfMovimentos.SpeedButton4Click(Sender: TObject);
begin
  fCalculos := TfCalculos.Create(Self);
  fCalculos.ShowModal;
end;

procedure TfMovimentos.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Nome';
end;

end.
