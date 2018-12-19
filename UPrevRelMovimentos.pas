unit UPrevRelMovimentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Db, DBTables, RXLookup;

type
  TfPrevRelMovimentos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tCadastro: TTable;
    dsCadastro: TDataSource;
    RadioGroup2: TRadioGroup;
    RxDBLookupCombo1: TRxDBLookupCombo;
    tMovimentos: TTable;
    dsMovimentos: TDataSource;
    tCadastroNome: TStringField;
    tCadastroCodigo: TIntegerField;
    tCadastroSexo: TStringField;
    tCadastroDataNascimento: TDateField;
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
    tCadastroEndereco: TStringField;
    tCadastroCorrespondecia: TStringField;
    tCadastroNumeroCarteira: TStringField;
    tCadastroSerieCarteira: TStringField;
    tCadastroPis: TStringField;
    tCadastroCpf: TStringField;
    tCadastroRg: TStringField;
    tCadastroFone: TStringField;
    tCadastroCici: TStringField;
    tMovimentosTipoEspecial: TStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure DBLookupComboBox3Enter(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure DBLookupComboBox3CloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Calcula_Totais;

  public
    { Public declarations }
    procedure Calcula_Tempo;
    procedure Conclusao;
  end;

var
  fPrevRelMovimentos: TfPrevRelMovimentos;
  CAno, CMes, CDia, EAno, EMes, EDia, TAno, TMes, TDia,
  Ano_Serv, Mes_Serv, Dia_Serv,
  AnoI, MesI, DiaI, AnoP, MesP, DiaP, AnoIdade,
  AnoInt, MesInt, DiaInt, AnoPrp, MesPrp, DiaPrp : Word;
  Data53 : TDateTime;

implementation

uses URelMovimentos, UConsFuncionarios;

{$R *.DFM}

procedure TfPrevRelMovimentos.Calcula_Totais;
begin
  CAno := 0; CMes := 0; CDia := 0;
  EAno := 0; EMes := 0; EDia := 0;
  TAno := 0; TMes := 0;

  tMovimentos.First;
  while not tMovimentos.Eof do
    begin
// calcula a comum
      CDia := CDia + tMovimentos.FieldByName('ComumDD').AsInteger;
      if CDia >= 30 then
        begin
          CMes := CMes + 1;
          CDia := CDia - 30;
        end;
      CMes := CMes + tMovimentos.FieldByName('ComumMM').AsInteger;
      if CMes >= 12 then
        begin
          CAno := CAno + 1;
          CMes := CMes - 12;
        end;
      CAno := CAno + tMovimentos.FieldByName('ComumAA').AsInteger;
// calcula a especial
      EDia := EDia + tMovimentos.FieldByName('EspecialDD').AsInteger;
      if EDia >= 30 then
        begin
          EMes := EMes + 1;
          EDia := Edia - 30;
        end;
      EMes := EMes + tMovimentos.FieldByName('EspecialMM').AsInteger;
      if EMes >= 12 then
        begin
          EAno := EAno + 1;
          EMes := EMes - 12;
        end;
      EAno := EAno + tMovimentos.FieldByName('EspecialAA').AsInteger;
      tMovimentos.Next;
    end;
// calcula o total
  TDia := CDia + EDia;
  if TDia >= 30 then
    begin
      TMes := TMes + 1;
      TDia := TDia - 30;
    end;
  TMes := TMes + CMes + EMes;
  if TMes >= 12 then
    begin
      TAno := TAno + 1;
      TMes := TMes - 12;
    end;
  TAno := TAno + CAno + EAno;
end;

procedure TfPrevRelMovimentos.Calcula_Tempo;
var
  Ano_Dem, Mes_Dem, Dia_Dem, Ano_Aux, Mes_Aux, Dia_Aux,
  Ano_Com, Mes_Com, Dia_Com, Ano_Esp, Mes_Esp, Dia_Esp : Word;
  Data_Aux, Data_Dem, Total_Dia, Dia_Ax2, Erro : Integer;
begin
  Ano_Serv := 0;   Mes_Serv := 0;   Dia_Serv := 0;
  Ano_Aux := 0;   Mes_Aux := 0;   Dia_Aux := 0;
  Ano_Dem := 0;   Mes_Dem := 0;   Dia_Dem := 0;
  Ano_Esp := 0;   Mes_Esp := 0;   Dia_Esp := 0;
  Dia_Com := 0;   Mes_Com := 0;   Ano_Com := 0;
  Erro := 0;
  tMovimentos.First;
  while not tMovimentos.EOF do
    begin
      inc(Dia_Com);
      DecodeDate(tMovimentosDataAdmissao.AsDateTime, Ano_Aux, Mes_Aux, Dia_Aux);
      DecodeDate(tMovimentosDataDemissao.AsDateTime, Ano_Dem, Mes_Dem, Dia_Dem);
      Data_Aux := StrToInt(FormatFloat('0000', Ano_Aux) +
                  FormatFloat('00', Mes_Aux) + FormatFloat('00', Dia_Aux));
      if tMovimentosDataDemissao.AsDateTime > StrToDate('15/12/1998') then
        begin
          Ano_Dem := 1998;
          Mes_Dem := 12;
          Dia_Dem := 15;
          Erro := 1;
        end;
      Data_Dem := StrToInt(FormatFloat('0000', Ano_Dem) +
                  FormatFloat('00', Mes_Dem) + FormatFloat('00', Dia_Dem));
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
          if (Dia_Dem = 31) and (Mes_Dem = Mes_Aux) and (Ano_Dem = Ano_Aux) and
             (Dia_Aux = 31) then
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
        Data_Aux := StrToInt(FormatFloat('0000', Ano_Aux) +
                    FormatFloat('00', Mes_Aux) + FormatFloat('00', Dia_Aux));
      end;
//   Calculo do especial
    if tMovimentosEspecial.AsString = 'SIM' then
      begin
        if tCadastro.FieldByName('Sexo').AsString = 'M' then
          case tMovimentosTipoEspecial.AsInteger of
            0 : Total_Dia := Round(Total_Dia * 1.4);
            1 : Total_Dia := Round(Total_Dia * 1.75);
            2 : Total_Dia := Round(Total_Dia * 2.33);
          end
        else
          case tMovimentosTipoEspecial.AsInteger of
            0 : Total_Dia := Round(Total_Dia * 1.2);
            1 : Total_Dia := Round(Total_Dia * 1.5);
            2 : Total_Dia := Round(Total_Dia * 2);
          end;

        Dia_Ax2 := 0;
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
      end;
    tMovimentos.Next;
  end;
  Ano_Serv := Ano_Serv + Ano_Esp;
  Mes_Serv := Mes_Serv + Mes_Esp;
  Dia_Serv := Dia_Serv + Dia_Esp;
  While Dia_Serv > 30 do
    begin
      Dia_Serv := Dia_Serv - 30;
      Mes_Serv := Mes_Serv + 1;
    end;
  while Mes_Serv > 11 do
    begin
      Mes_Serv := Mes_Serv - 12;
      Ano_Serv := Ano_Serv + 1;
    end;
  Ano_Serv := Ano_Serv + Ano_Com;
  Mes_Serv := Mes_Serv + Mes_Com;
  Dia_Serv := Dia_Serv + Dia_Com;
  While Dia_Serv > 30 do
    begin
      Dia_Serv := Dia_Serv - 30;
      Mes_Serv := Mes_Serv + 1;
    end;
  while Mes_Serv > 11 do
    begin
      Mes_Serv := Mes_Serv - 12;
      Ano_Serv := Ano_Serv + 1;
    end;
  if Erro = 0 then
    begin
      Ano_Serv := TAno;
      Mes_Serv := TMes;
      Dia_Serv := TDia;
    end;
  Conclusao;
end;

//Calculos finais para efeito de aposentadoria
procedure TfPrevRelMovimentos.Conclusao;
var
  i2, i3, TFI, TFP : Integer;
  AnoN, MesN, DiaN : Word;
begin
  if tCadastroSexo.AsString = 'M' then
    begin
      TFI := Trunc((12600-(Ano_Serv * 360) - (Mes_Serv * 30) - Dia_Serv) * 1.2);
      TFP := Trunc((10800-(Ano_Serv * 360) - (Mes_Serv * 30) - Dia_Serv) * 1.4);
    end
  else
    begin
      TFI := Trunc((10800-(Ano_Serv * 360) - (Mes_Serv * 30) - Dia_Serv) * 1.2);
      TFP := Trunc((9000-(Ano_Serv * 360) - (Mes_Serv * 30) - Dia_Serv) * 1.4);
    end;
  AnoI := 0; MesI := 0; DiaI := 0;
  AnoP := 0; MesP := 0; DiaP := 0;
//Calcula o tempo faltante em 15/12/1998 para aposentadoria integral
  for i2 := 1 to TFI do
    begin
      DiaI := DiaI + 1;
      if DiaI = 30 then
        begin
          DiaI := 0;
          MesI := MesI + 1;
        end;
        if MesI = 12 then
          begin
            MesI := 0;
            AnoI := AnoI + 1;
          end;
    end;
//Calcula o tempo faltante em 15/12/1998 para aposentadoria proporcional
  for i3 := 1 to TFP do
    begin
      DiaP := DiaP + 1;
      if DiaP = 30 then
        begin
          DiaP := 0;
          MesP := MesP + 1;
        end;
        if MesP = 12 then
          begin
            MesP := 0;
            AnoP := AnoP + 1;
          end;
    end;
  DecodeDate(tCadastroDataNascimento.AsDateTime, AnoN, MesN, DiaN);
  if tCadastroSexo.AsString = 'M' then
    begin
      AnoIdade := AnoN + 53;
      Data53 := EncodeDate(AnoIdade, MesN, DiaN);
    end
  else
    begin
      AnoIdade := AnoN + 48;
      Data53 := EncodeDate(AnoIdade, MesN, DiaN);
    end;
  DiaInt := 0; MesInt := 0; AnoInt := 0;
  DiaPrp := 0; MesPrp := 0; AnoPrp := 0;
  if (DiaI = 0) and (MesI = 0) and (AnoI = 0) then
    begin
      DiaInt := 0;
      MesInt := 0;
      AnoInt := 0;
    end
  else
    begin
      DiaInt := 15 + DiaI;
      MesInt := 12 + MesI;
      AnoInt := 1998 + AnoI;
      While DiaInt > 30 do
        begin
          DiaInt := DiaInt - 30;
          MesInt := MesInt + 1;
        end;
      while MesInt > 12 do
        begin
          MesInt := MesInt - 12;
          AnoInt := AnoInt + 1;
        end;
    end;
  if (DiaP = 0) and (MesP = 0) and (AnoP = 0) then
    begin
      DiaPrp := 0;
      MesPrp := 0;
      AnoPrp := 0;
    end
  else
    begin
      DiaPrp := 15 + DiaP;
      MesPrp := 12 + MesP;
      AnoPrp := 1998 + AnoP;
      While DiaPrp > 30 do
        begin
          DiaPrp := DiaPrp - 30;
          MesPrp := MesPrp + 1;
        end;
      while MesPrp > 12 do
        begin
          MesPrp := MesPrp - 12;
          AnoPrp := AnoPrp + 1;
        end;
    end;
end;

procedure TfPrevRelMovimentos.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelMovimentos.BitBtn2Click(Sender: TObject);
begin
  RadioGroup2.ItemIndex      := 0;
  RxDBLookupCombo1.KeyValue  := 0;
  DBLookupComboBox3.KeyValue := '';
  DBLookupComboBox3.SetFocus;
  tCadastro.IndexFieldNames  := 'Nome';
end;

procedure TfPrevRelMovimentos.BitBtn1Click(Sender: TObject);
procedure Imprime;
begin
  tMovimentos.IndexFieldNames := 'CodigoFuncionario;DataAdmissao';
  fRelMovimentos := TfRelMovimentos.Create(Self);
  Calcula_Totais;
  Calcula_Tempo;
  case RadioGroup2.ItemIndex of
    0 : fRelMovimentos.QuickRep1.Print;
    1 : fRelMovimentos.QuickRep1.Preview;
  end;
end;
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      tCadastro.Filtered := False;
      tCadastro.Filter   := 'Codigo = '''+RxDBLookupCombo1.Text+'''';
      tCadastro.Filtered := True;
      Imprime;
    end
  else
  if DBLookupComboBox3.Text <> '' then
    begin
      tCadastro.Filtered := False;
      tCadastro.Filter   := 'Nome = '''+DBLookupComboBox3.Text+'''';
      tCadastro.Filtered := True;
      Imprime;
    end
  else
    ShowMessage('Você deve escolher um Código ou um Nome!');
  tCadastro.Filtered := False;
end;

procedure TfPrevRelMovimentos.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Codigo';
end;

procedure TfPrevRelMovimentos.DBLookupComboBox3Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Nome';
end;

procedure TfPrevRelMovimentos.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  DBLookupComboBox3.KeyValue := '';
end;

procedure TfPrevRelMovimentos.DBLookupComboBox3CloseUp(Sender: TObject);
begin
  RxDBLookupCombo1.KeyValue := 0;
end;

procedure TfPrevRelMovimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
