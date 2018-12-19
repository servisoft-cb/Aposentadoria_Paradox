unit UCalculos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, RXLookup, ExtCtrls, Db,
  DBTables, MemTable;

type
  TfCalculos = class(TForm)
    tCadastro: TTable;
    tMovimentos: TTable;
    dsCadastro: TDataSource;
    dsMovimentos: TDataSource;
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
    tMovimentosTipoEspecial: TStringField;
    tMovimentosDataAdmissao: TDateField;
    tMovimentosDataDemissao: TDateField;
    tMovimentosComumAA: TSmallintField;
    tMovimentosComumMM: TSmallintField;
    tMovimentosComumDD: TSmallintField;
    tMovimentosEspecialAA: TSmallintField;
    tMovimentosEspecialMM: TSmallintField;
    tMovimentosEspecialDD: TSmallintField;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Bevel1: TBevel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    tMemMovimentos: TMemoryTable;
    dsMemMovimentos: TDataSource;
    tMemMovimentosCodigoFuncionario: TIntegerField;
    tMemMovimentosContador: TAutoIncField;
    tMemMovimentosEspecial: TStringField;
    tMemMovimentosTipoEspecial: TStringField;
    tMemMovimentosDataAdmissao: TDateField;
    tMemMovimentosDataDemissao: TDateField;
    Bevel2: TBevel;
    BitBtn2: TBitBtn;
    tMemMovimentosFuncao: TStringField;
    tMemMovimentosEmpresa: TStringField;
    tMemMovimentosComumAA: TStringField;
    tMemMovimentosComumMM: TStringField;
    tMemMovimentosComumDD: TStringField;
    tMemMovimentosEspecialAA: TStringField;
    tMemMovimentosEspecialMM: TStringField;
    tMemMovimentosEspecialDD: TStringField;
    BitBtn3: TBitBtn;
    tAuxMov: TTable;
    dsAuxMov: TDataSource;
    tAuxMovCodigoFuncionario: TIntegerField;
    tAuxMovContador: TAutoIncField;
    tAuxMovEmpresa: TStringField;
    tAuxMovFuncao: TStringField;
    tAuxMovEspecial: TStringField;
    tAuxMovTipoEspecial: TStringField;
    tAuxMovDataAdmissao: TDateField;
    tAuxMovDataDemissao: TDateField;
    tAuxMovComumAA: TSmallintField;
    tAuxMovComumMM: TSmallintField;
    tAuxMovComumDD: TSmallintField;
    tAuxMovEspecialAA: TSmallintField;
    tAuxMovEspecialMM: TSmallintField;
    tAuxMovEspecialDD: TSmallintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Calcula_Tempo;
    procedure Respostas;
    procedure Formata;
    procedure Testa_Data_151298;
    procedure Calcula_Idade;
    procedure Conclusao;
    function  Afastamento: Real;
  end;

var
  fCalculos: TfCalculos;
  AnoAdm, MesAdm, DiaAdm, AnoDem, MesDem, DiaDem, Anos, Meses, Dias,
  AnoN, MesN, DiaN, AnoIdade, AnoI, MesI, DiaI, AnoP, MesP, DiaP,
  AnoInt, MesInt, DiaInt, AnoPrp, MesPrp, DiaPrp : Word;
  Tempo, DataAdm, DataDem, DiasMov, TX, TY,
  DiaX, MesX, AnoX, DiaY, MesY, AnoY: Integer;
  x1, x2, x3, TotDias, VE, TotCom, TotEsp : Real;
  MesAdmStr, DiaAdmStr, MesDemStr, DiaDemStr, TempoStr,
  VerMes, VerDia, VSA, VSM, VSD, TCAA, TCMM, TCDD, TEAA, TEMM, TEDD,
  EspecialAA, EspecialMM, EspecialDD, ComumAA, ComumMM, ComumDD,
  A1298, M1298, D1298 : String;
  Data53 : TDateTime;

implementation

uses URelCalculos, UMovimentos;

{$R *.DFM}

procedure TfCalculos.Calcula_Tempo;
var
  i : Integer;
begin
  if MesAdm < 10 then                  //Preenche com 0 os meses e dias menores que 10
    MesAdmStr := '0' + IntToStr(MesAdm)
  else
    MesAdmStr := IntToStr(MesAdm);
  if DiaAdm < 10 then
    DiaAdmStr := '0' + IntToStr(DiaAdm)
  else
    DiaAdmStr := IntToStr(DiaAdm);
  if MesDem < 10 then
    MesDemStr := '0' + IntToStr(MesDem)
  else
    MesDemStr := IntToStr(MesDem);
  if DiaDem < 10 then
    DiaDemStr := '0' + IntToStr(DiaDem)
  else
    DiaDemStr := IntToStr(DiaDem);
  DataAdm := StrToInt(IntToStr(AnoAdm)+ MesAdmStr + DiaAdmStr);
  DataDem := StrToInt(IntToStr(AnoDem)+ MesDemStr + DiaDemStr);
  Tempo   := DataDem - DataAdm;
  TempoStr := IntToStr(Tempo);
  for i := 1 to 8 - Length(IntToStr(Tempo)) do
    TempoStr := '0' + TempoStr;
  VerMes := Copy(TempoStr,5,2);
  VerDia := Copy(TempoStr,7,2);
  if StrToInt(VerMes) > 12 then
    Tempo := Tempo - 8800;       //Quando ocorrer mes maior que 12
  if StrToInt(VerDia) > 30 then
    Tempo := Tempo - 70;         //Quando ocorrer dia maior que 30
  if DiaDem < 31 then            //Quando a data de demissão for = 31 nao soma-se 1 dia
    Tempo := Tempo + 1;
  TempoStr := IntToStr(Tempo);
  for i := 1 to 6 - Length(IntToStr(Tempo)) do
    TempoStr := '0' + TempoStr;
  Anos  := StrToInt(Copy(TempoStr,1,2));
  Meses := StrToInt(Copy(TempoStr,3,2));
  Dias  := StrToInt(Copy(TempoStr,5,2));
  DiasMov := Anos * 360 + Meses * 30 + Dias;
  if tMemMovimentosEspecial.AsString = 'SIM' then
    begin
      if tCadastroSexo.AsString = 'M' then
        case tMemMovimentostipoEspecial.AsInteger of
          0 : VE := DiasMov * 1.4;
          1 : VE := DiasMov * 1.75;
          2 : VE := DiasMov * 2.33;
        end
      else
        case tMemMovimentostipoEspecial.AsInteger of
          0 : VE := DiasMov * 1.2;
          1 : VE := DiasMov * 1.5;
          2 : VE := DiasMov * 2;
        end;
      TotEsp  := TotEsp + VE;
      TotDias := TotDias + VE;
      Formata;
      EspecialAA := VSA;
      EspecialMM := VSM;
      EspecialDD := VSD;
    end
  else
    begin
      ComumAA := Copy(TempoStr,1,2);
      ComumMM := Copy(TempoStr,3,2);
      ComumDD := Copy(TempoStr,5,2);
      TotCom  := TotCom + DiasMov;
      TotDias := TotDias + DiasMov;
    end;
end;

procedure TfCalculos.Respostas;
begin
  VE := TotDias;
  Formata;
  Edit1.Text := VSA;
  Edit2.Text := VSM;
  Edit3.Text := VSD;
  VE := TotCom;
  Formata;
  TCAA := VSA; TCMM := VSM; TCDD := VSD;
  VE := TotEsp;
  Formata;
  TEAA := VSA; TEMM := VSM; TEDD := VSD;
end;

procedure TfCalculos.Formata;
var
  i : Integer;
begin
  x1 := int(VE / 360);
  VSA := FloatToStr(x1);
  for i := 1 to 2 - Length(FloatToStr(x1)) do
    VSA := '0' + VSA;
  x2 := int(((VE / 360) - x1) * 12);
  VSM := FloatToStr(x2);
  for i := 1 to 2 - Length(FloatToStr(x2)) do
    VSM := '0' + VSM;
  x3 := Round(((((VE / 360) - x1) * 12) - x2) * 30);
  VSD := FloatToStr(x3);
  for i := 1 to 2 - Length(FloatToStr(x3)) do
    VSD := '0' + VSD;
end;

procedure TfCalculos.Testa_Data_151298;
begin
  tMemMovimentos.First;
  while not tMemMovimentos.EOF do
    begin
      DecodeDate(tMemMovimentosDataAdmissao.AsDateTime,AnoAdm,MesAdm,DiaAdm);
      if tMemMovimentosDataAdmissao.AsDateTime < StrToDate('15/12/1998') then
        if tMemMovimentosDataDemissao.AsDateTime > StrToDate('15/12/1998') then
          begin
            AnoDem := 1998;
            MesDem := 12;
            DiaDem := 15;
            Calcula_Tempo;
          end    //verificar necessidade de begin e end para este else!!!
      else
        begin
          DecodeDate(tMemMovimentosDataDemissao.AsDateTime,AnoDem,MesDem,DiaDem);
          Calcula_Tempo;
        end;
      tMemMovimentos.Next;
    end;
end;

function TfCalculos.Afastamento: Real;
var
  Data1, Data2: TDateTime;
begin
  Result := 0;
  tAuxMov.Last;
  while not tAuxMov.BOF do
    begin
      if tAuxMovDataAdmissao.AsDateTime > StrToDate('15/12/1998') then
        begin
          Data1 := tAuxMovDataAdmissao.AsDateTime;
          tAuxMov.Prior;
          if tAuxMovDataDemissao.AsDateTime < StrToDate('15/12/1998') then
            begin
              Data2 := StrToDate('15/12/1998');
              Result := Result + Data1 - Data2;
              Break;
            end
          else
            Data2 := tAuxMovDataDemissao.AsDateTime;
          Result := Result + Data1 - Data2;
        end
      else
        tAuxMov.Prior;
    end;
end;

procedure TfCalculos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCalculos.FormCreate(Sender: TObject);
begin
  tMovimentos.IndexFieldNames := 'CodigoFuncionario;DataAdmissao';
end;

procedure TfCalculos.BitBtn1Click(Sender: TObject);
var
  Cont: Integer;
begin
  if RxDBLookupCombo1.Text = '' then
    begin
      RxDBLookupCombo1.SetFocus;
      ShowMessage('Você deve selecionar um funcionário para efetuar o cálculo!');
    end
  else
    begin
      tMemMovimentos.EmptyTable;
      tMovimentos.First;
      Cont := 0;
      while not tMovimentos.EOF do
        begin
          if tMovimentosEspecial.AsString = 'SIM' then
          //if tMovimentosDataDemissao.AsDateTime > StrToDate('28/05/1998') then
            begin
              tMemMovimentos.Insert;
              Cont := Cont + 1;
              tMemMovimentosContador.AsInteger := cont;
              tMemMovimentosCodigoFuncionario.AsInteger := tMovimentosCodigoFuncionario.AsInteger;
              tMemMovimentosEmpresa.AsString            := tMovimentosEmpresa.AsString;
              tMemMovimentosFuncao.AsString             := tMovimentosFuncao.AsString;
              tMemMovimentosEspecial.AsString           := 'SIM';
              tMemMovimentosTipoEspecial.AsString       := tMovimentosTipoEspecial.AsString;
              tMemMovimentosDataAdmissao.AsDateTime     := tMovimentosDataAdmissao.AsDateTime;
              tMemMovimentosDataDemissao.AsDateTime     := tMovimentosDataDemissao.AsDateTime;

            {  tMemMovimentos.Insert;
              Cont := Cont + 1;
              tMemMovimentosContador.AsInteger := cont;
              tMemMovimentosCodigoFuncionario.AsInteger := tMovimentosCodigoFuncionario.AsInteger;
              tMemMovimentosEmpresa.AsString            := tMovimentosEmpresa.AsString;
              tMemMovimentosFuncao.AsString             := tMovimentosFuncao.AsString;
              tMemMovimentosEspecial.AsString           := 'NÃO';
              tMemMovimentosTipoEspecial.AsString       := tMovimentosTipoEspecial.AsString;
              tMemMovimentosDataAdmissao.AsDateTime     := StrToDate('29/05/1998');
              tMemMovimentosDataDemissao.AsDateTime     := tMovimentosDataDemissao.AsDateTime;
              tMemMovimentos.Post;}
            end
          {else
            begin
              tMemMovimentos.Insert;
              Cont := Cont + 1;
              tMemMovimentosContador.AsInteger := cont;
              tMemMovimentosCodigoFuncionario.AsInteger := tMovimentosCodigoFuncionario.AsInteger;
              tMemMovimentosFuncao.AsString             := tMovimentosFuncao.AsString;
              tMemMovimentosEmpresa.AsString            := tMovimentosEmpresa.AsString;
              tMemMovimentosEspecial.AsString           := 'SIM';
              tMemMovimentosTipoEspecial.AsString       := tMovimentosTipoEspecial.AsString;
              tMemMovimentosDataAdmissao.AsDateTime     := tMovimentosDataAdmissao.AsDateTime;
              tMemMovimentosDataDemissao.AsDateTime     := tMovimentosDataDemissao.AsDateTime;
              tMemMovimentos.Post;
            end}
          else
            begin
              tMemMovimentos.Insert;
              Cont := Cont + 1;
              tMemMovimentosContador.AsInteger := Cont;
              tMemMovimentosCodigoFuncionario.AsInteger := tMovimentosCodigoFuncionario.AsInteger;
              tMemMovimentosEmpresa.AsString            := tMovimentosEmpresa.AsString;
              tMemMovimentosFuncao.AsString             := tMovimentosFuncao.AsString;
              tMemMovimentosEspecial.AsString           := 'NÃO';
              tMemMovimentosTipoEspecial.AsString       := tMovimentosTipoEspecial.AsString;
              tMemMovimentosDataAdmissao.AsDateTime     := tMovimentosDataAdmissao.AsDateTime;
              tMemMovimentosDataDemissao.AsDateTime     := tMovimentosDataDemissao.AsDateTime;
              tMemMovimentos.Post;
            end;
        tMovimentos.Next;
      end;
      tMemMovimentos.First;
      TotDias := 0;
      TotCom  := 0;
      TotEsp  := 0;
      while not tMemMovimentos.EOF do
        begin
          DecodeDate(tMemMovimentosDataAdmissao.AsDateTime,AnoAdm,MesAdm,DiaAdm);
          DecodeDate(tMemMovimentosDataDemissao.AsDateTime,AnoDem,MesDem,DiaDem);
          Calcula_Tempo;
          tMemMovimentos.Edit;
          if tMemMovimentosEspecial.AsString = 'SIM' then
            begin
              tMemMovimentosEspecialAA.AsString := EspecialAA;
              tMemMovimentosEspecialMM.AsString := EspecialMM;
              tMemMovimentosEspecialDD.AsString := EspecialDD;
            end
          else
            begin
              tMemMovimentosComumAA.AsString := ComumAA;
              tMemMovimentosComumMM.AsString := ComumMM;
              tMemMovimentosComumDD.AsString := ComumDD;
            end;
          tMemMovimentos.Post;
          tMemMovimentos.Next;
        end;
      Respostas;
      TotDias := 0;
      Testa_Data_151298;
      VE := TotDias;
      Formata;
      A1298 := VSA;
      M1298 := VSM;
      D1298 := VSD;
      Calcula_Idade;
      Conclusao;
      BitBtn2.Enabled := True;
    end;
end;

//Calculos finais para efeito de aposentadoria
procedure TfCalculos.Conclusao;
var
  i2, i3, TFI, TFP : Integer;
begin
  AnoX := 0; MesX := 0; DiaX := 0;
  AnoY := 0; MesY := 0; DiaY := 0;
  if tCadastroSexo.AsString = 'M' then
    begin
      TFI := Round((12600 - TotDias) * 1.2);
      TFP := Round((10800 - TotDias) * 1.4);
    end
  else
    begin
      TFI := Round((10800 - TotDias) * 1.2);
      TFP := Round((9000  - TotDias) * 1.4);
    end;
  AnoI := 0; MesI := 0; DiaI := 0;
  AnoP := 0; MesP := 0; DiaP := 0;
//Calcula o tempo faltante em 15/12/1998 para aposentadoria integral
  TX := TFI + StrToInt(FloatToStr(Afastamento));
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

  for i2 := 1 to TX do
    begin
      DiaX := DiaX + 1;
      if DiaX = 30 then
        begin
          DiaX := 0;
          MesX := MesX + 1;
        end;
        if MesX = 12 then
          begin
            MesX := 0;
            AnoX := AnoX + 1;
          end;
    end;

//Calcula o tempo faltante em 15/12/1998 para aposentadoria proporcional
  TY := TFP + StrToInt(FloatToStr(Afastamento));
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

  for i2 := 1 to TY do
    begin
      DiaY := DiaY + 1;
      if DiaY = 30 then
        begin
          DiaY := 0;
          MesY := MesY + 1;
        end;
        if MesY = 12 then
          begin
            MesY := 0;
            AnoY := AnoY + 1;
          end;
    end;

//Acrescenta o tempo faltante a data do último movimento
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
      DiaInt := 15 + DiaX;
      MesInt := 12 + MesX;
      AnoInt := 1998 + AnoX;
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
      DiaPrp := 15 + DiaY;
      MesPrp := 12 + MesY;
      AnoPrp := 1998 + AnoY;
      while DiaPrp > 30 do
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

procedure TfCalculos.Calcula_Idade;
begin
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
end;

procedure TfCalculos.BitBtn2Click(Sender: TObject);
begin
  fRelCalculos := TfRelCalculos.Create(Self);
  fRelCalculos.QuickRep1.Preview;
end;

procedure TfCalculos.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfCalculos.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tCadastro.IndexFieldNames := 'Nome';
end;

procedure TfCalculos.FormShow(Sender: TObject);

Var i: integer;
begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if (Screen.Forms[i] is TfMovimentos) and (fMovimentos.Showing) then
        begin
         fCalculos.RxDBLookupCombo1.Value := fMovimentos.RXDBLookupCombo1.Value;
         BitBtn1.Click;
         BitBtn2.Click;
        end;
    end;
end;

end.
