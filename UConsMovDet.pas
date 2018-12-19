unit UConsMovDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls;

type
  TfConsMovDet = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBGrid1: TDBGrid;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBText1: TDBText;
    Label22: TLabel;
    GroupBox2: TGroupBox;
    Bevel10: TBevel;
    Label31: TLabel;
    Label32: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Bevel11: TBevel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Calcula_Tempo;
    procedure Conclusao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsMovDet: TfConsMovDet;
  CAno, CMes, CDia, EAno, EMes, EDia, TAno, TMes, TDia,
  Ano_Serv, Mes_Serv, Dia_Serv,
  AnoI, MesI, DiaI, AnoP, MesP, DiaP, AnoIdade,
  AnoInt, MesInt, DiaInt, AnoPrp, MesPrp, DiaPrp : Word;
  Data53 : TDateTime;
implementation

uses UConsFuncionarios, UMovimentos;

{$R *.DFM}


procedure TfConsMovDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfConsMovDet.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsMovDet.FormShow(Sender: TObject);
begin
  CAno := 0; CMes := 0; CDia := 0;
  EAno := 0; EMes := 0; EDia := 0;
  TAno := 0; TMes := 0; TDia := 0;

  with fConsFuncionarios do
    begin
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

  Label13.Caption := IntToStr(CAno); Label14.Caption := IntToStr(CMes);
  Label15.Caption := IntToStr(CDia); Label16.Caption := IntToStr(EAno);
  Label17.Caption := IntToStr(EMes); Label18.Caption := IntToStr(EDia);
  Label19.Caption := IntToStr(TAno); Label20.Caption := IntToStr(TMes);
  Label21.Caption := IntToStr(TDia);

  Calcula_Tempo;
end;

procedure TfConsMovDet.Calcula_Tempo;
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

  fConsFuncionarios.tMovimentos.First;
  while not fConsFuncionarios.tMovimentos.EOF do
    begin
      inc(Dia_Com);
      DecodeDate(fConsFuncionarios.tMovimentosDataAdmissao.AsDateTime, Ano_Aux, Mes_Aux, Dia_Aux);
      DecodeDate(fConsFuncionarios.tMovimentosDataDemissao.AsDateTime, Ano_Dem, Mes_Dem, Dia_Dem);
      Data_Aux := StrToInt(FormatFloat('0000', Ano_Aux) +
                  FormatFloat('00', Mes_Aux) + FormatFloat('00', Dia_Aux));
      if fConsFuncionarios.tMovimentosDataDemissao.AsDateTime > StrToDate('15/12/1998') then
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
              Dia_Com := 1; //teste aqui antes = 1
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
    if fConsFuncionarios.tMovimentosEspecial.AsString = 'SIM' then
      begin
        if fConsFuncionarios.tCadastro.FieldByName('Sexo').AsString = 'M' then
          Total_Dia := Round(Total_Dia * 40 / 100)
        else
          Total_Dia := Round(Total_Dia * 20 / 100);
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
    fConsFuncionarios.tMovimentos.Next;
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
procedure TfConsMovDet.Conclusao;
var
  i2, i3, TFI, TFP : Integer;
  AnoN, MesN, DiaN : Word;
begin
  if fConsFuncionarios.tCadastroSexo.AsString = 'M' then
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
  DecodeDate(fConsFuncionarios.tCadastroDataNascimento.AsDateTime, AnoN, MesN, DiaN);
  if fConsFuncionarios.tCadastroSexo.AsString = 'M' then
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
  Label23.Caption := IntToStr(DiaInt);
  Label24.Caption := IntToStr(MesInt);
  Label25.Caption := IntToStr(AnoInt);
  Label26.Caption := IntToStr(DiaPrp);
  Label27.Caption := IntToStr(MesPrp);
  Label28.Caption := IntToStr(AnoPrp);
  if fConsFuncionarios.tCadastroSexo.AsString = 'M' then
    Label36.Caption := '53'
  else
    Label36.Caption := '48';
  Label38.Caption := DateToStr(Data53);
end;

end.

