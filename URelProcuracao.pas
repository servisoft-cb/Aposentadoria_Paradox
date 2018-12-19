unit URelProcuracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls;

type
  TfRelProcuracao = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRDBText1: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape11: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape12: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape13: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape14: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape15: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape16: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText22: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelProcuracao: TfRelProcuracao;

implementation

uses UProcuracao, UCadastro;

{$R *.DFM}

procedure TfRelProcuracao.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  case fPrevProcuracao.tProcuracaoOpcao.AsInteger of
    0: begin
         QRLabel28.Caption := '- Receber mensalidades de benefícios, receber quantias atrasadas e firmar os respectivos recibos.';
       end;
    1: begin
         QRLabel28.Caption := '- Requerer benefícios, revisão e interpor recursos.';
       end;
  end;
end;



end.
