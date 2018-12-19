unit URelPenAuxRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, ExtCtrls, Qrctrls, QrAngLbl;

type
  TfRelPensaoAuxRec = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel8: TQRLabel;
    QRShape8: TQRShape;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRLabel11: TQRLabel;
    QRShape12: TQRShape;
    QRLabel12: TQRLabel;
    QRShape13: TQRShape;
    QRLabel13: TQRLabel;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
    QRShape15: TQRShape;
    QRLabel15: TQRLabel;
    QRShape16: TQRShape;
    QRLabel16: TQRLabel;
    QRShape17: TQRShape;
    QRLabel17: TQRLabel;
    QRShape18: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRShape19: TQRShape;
    QRLabel25: TQRLabel;
    QRShape20: TQRShape;
    QRLabel24: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRBand3: TQRBand;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel27: TQRLabel;
    QRShape28: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape29: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape30: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel31: TQRLabel;
    QRShape31: TQRShape;
    QRLabel32: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape32: TQRShape;
    QRLabel34: TQRLabel;
    QRShape33: TQRShape;
    QRLabel35: TQRLabel;
    QRShape34: TQRShape;
    QRLabel36: TQRLabel;
    QRShape35: TQRShape;
    QRLabel37: TQRLabel;
    QRShape36: TQRShape;
    QRLabel38: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLabel40: TQRLabel;
    QRShape39: TQRShape;
    QRLabel41: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel42: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel43: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText16: TQRDBText;
    QRShape44: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText17: TQRDBText;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel47: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText19: TQRDBText;
    QRAngledLabel1: TQRAngledLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelPensaoAuxRec: TfRelPensaoAuxRec;

implementation

uses UPrevPensao, UCadastro, UDependentes;

{$R *.DFM}

procedure TfRelPensaoAuxRec.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel19.Caption := ' ';
  QRLabel20.Caption := ' ';
  QRLabel21.Caption := ' ';
  QRLabel22.Caption := ' ';
  QRLabel23.Caption := ' ';
  if fPrevPensao.tPensaoAuxRecluEstadoCivil.AsString = 'SO' then
    QRLabel19.Caption := 'X';
  if fPrevPensao.tPensaoAuxRecluEstadoCivil.AsString = 'CA' then
    QRLabel20.Caption := 'X';
  if fPrevPensao.tPensaoAuxRecluEstadoCivil.AsString = 'VI' then
    QRlabel21.Caption := 'X';
  If fPrevPensao.tPensaoAuxRecluEstadoCivil.AsString = 'DE' then
    QRLabel22.Caption := 'X';
  If fPrevPensao.tPensaoAuxRecluEstadoCivil.AsString = 'DI' then
    QRLabel23.Caption := 'X';
end;

end.
