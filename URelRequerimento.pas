unit URelRequerimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, QrAngLbl;

type
  TfRelRequerimento = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel4: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape10: TQRShape;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape15: TQRShape;
    QRLabel19: TQRLabel;
    QRShape16: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape17: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape18: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape19: TQRShape;
    QRLabel31: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape20: TQRShape;
    QRLabel32: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape23: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape24: TQRShape;
    QRLabel38: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape25: TQRShape;
    QRLabel39: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape26: TQRShape;
    QRLabel40: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape27: TQRShape;
    QRLabel41: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape28: TQRShape;
    QRLabel42: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape29: TQRShape;
    QRLabel43: TQRLabel;
    QRShape30: TQRShape;
    QRLabel44: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape39: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRShape40: TQRShape;
    QRDBText10: TQRDBText;
    QRShape42: TQRShape;
    QRLabel55: TQRLabel;
    QRShape41: TQRShape;
    QRShape43: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRShape44: TQRShape;
    QRLabel63: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel66: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRShape49: TQRShape;
    QRLabel69: TQRLabel;
    QRShape50: TQRShape;
    QRLabel71: TQRLabel;
    QRShape52: TQRShape;
    QRLabel72: TQRLabel;
    QRShape53: TQRShape;
    QRLabel73: TQRLabel;
    QRShape54: TQRShape;
    QRLabel74: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel75: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRAngledLabel1: TQRAngledLabel;
    QRShape51: TQRShape;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelRequerimento: TfRelRequerimento;

implementation

uses UPrevRequerimento, UCadastro;

{$R *.DFM}

procedure TfRelRequerimento.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//                                                           Beneficio Requerido
  QRLabel9.Caption  := ' ';
  QRLabel10.Caption := ' ';
  QRLabel11.Caption := ' ';
  QRLabel12.Caption := ' ';
  if fPrevRequerimento.tRequerimentoBeneficioRequerido.AsString = 'Aposentadoria por velhice' then
    QRLabel9.Caption := 'X';
  if fPrevRequerimento.tRequerimentoBeneficioRequerido.AsString = 'Aposentadoria por tempo de ser' then
    QRLabel10.Caption := 'X';
  if fPrevRequerimento.tRequerimentoBeneficioRequerido.AsString = 'Aposentadoria especial' then
    QRLabel11.Caption := 'X';
  if fPrevRequerimento.tRequerimentoBeneficioRequerido.AsString = 'Abono de permnencia em servico' then
    QRLabel12.Caption := 'X';
//                                                Legislaçao Especial Pretendida
  QRLabel24.Caption := ' ';
  QRLabel25.Caption := ' ';
  QRLabel26.Caption := ' ';
  QRLabel27.Caption := ' ';
  QRLabel28.Caption := ' ';
  QRLabel29.Caption := ' ';
  If fPrevRequerimento.tRequerimentoLegislacao.AsString = 'Excombatente' then
    QRLabel24.Caption := 'X';
  If fPrevRequerimento.tRequerimentoLegislacao.AsString = 'Jornalista profissional' then
    QRLabel25.Caption := 'X';
  If fPrevRequerimento.tRequerimentoLegislacao.AsString = 'Aeronauta' then
    QRLabel26.Caption := 'X';
  If fPrevRequerimento.tRequerimentoLegislacao.AsString = 'Jogador profi de futebol' then
    QRLabel27.Caption := 'X';
  If fPrevRequerimento.tRequerimentoLegislacao.AsString = 'Mudanca de regime juridico opcao' then
    QRLabel28.Caption := 'X';
  If fPrevRequerimento.tRequerimentoLegislacao.AsString = 'Contagem reciproca de tempo' then
    QRLabel29.Caption := 'X';
//
  QRLabel35.Caption := ' ';
  QRLabel62.Caption := ' ';
  If fPrevRequerimento.tRequerimentolkSexoCliente.AsString = 'M' then
    QRLabel35.Caption := 'X';
  If fPrevRequerimento.tRequerimentolkSexoCliente.AsString = 'F' then
    QRLabel62.Caption := 'X';
//                                                               Outra Atividade
  QRLabel58.Caption := ' ';
  QRLabel59.Caption := ' ';
  If fPrevRequerimento.tRequerimentoOutraAtividade.AsString = 'S' then
    QRLabel58.Caption := 'X';
  If fPrevRequerimento.tRequerimentoOutraAtividade.AsString = 'N' then
    QRLabel59.Caption := 'X';
//                                                           Esta Gozo Benefício
  QRLabel64.Caption := ' ';
  QRLabel65.Caption := ' ';
  If fPrevRequerimento.tRequerimentoGozoBeneficio.AsString = 'S' then
    QRLabel64.Caption := 'X';
  If fPrevRequerimento.tRequerimentoGozoBeneficio.AsString = 'N' then
    QRLabel65.Caption := 'X';
//                                                                 Filiação INPS
  QRLabel76.Caption := ' ';
  If fPrevRequerimento.tRequerimentoFiliacaoINPS.AsString = 'Empregado' then
    QRLabel76.Caption := 'X';
  QRLabel77.Caption := ' ';
  If fPrevRequerimento.tRequerimentoFiliacaoINPS.AsString = 'TrabaAvulso' then
    QRLabel77.Caption := 'X';
  QRLabel78.Caption := ' ';
  If fPrevRequerimento.tRequerimentoFiliacaoINPS.AsString = 'Empregador' then
    QRLabel78.Caption := 'X';
  QRLabel79.Caption := ' ';
  If fPrevRequerimento.tRequerimentoFiliacaoINPS.AsString = 'EmpregDomesti' then
    QRLabel79.Caption := 'X';
  QRLabel80.Caption := ' ';
  If fPrevRequerimento.tRequerimentoFiliacaoINPS.AsString = 'Facultativo' then
    QRLabel80.Caption := 'X';
  QRLabel81.Caption := ' ';
  If fPrevRequerimento.tRequerimentoFiliacaoINPS.AsString = 'ContribDobro' then
    QRLabel81.Caption := 'X';
  QRLabel82.Caption := ' ';
  If fPrevRequerimento.tRequerimentoFiliacaoINPS.AsString = 'Autonomo' then
    QRLabel82.Caption := 'X';
  QRLabel83.Caption := ' ';
  If fPrevRequerimento.tRequerimentoFiliacaoINPS.AsString = 'Desempregado' then
    QRLabel83.Caption := 'X';
end;                          

end.
