unit URelRecurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls;

type
  TfRelRecurso = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRShape8: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape16: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape20: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel17: TQRLabel;
    QRShape7: TQRShape;
    QRShape14: TQRShape;
    QRLabel18: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelRecurso: TfRelRecurso;

implementation

uses URecurso, UCadastro;

{$R *.DFM}

procedure TfRelRecurso.QuickRep1BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  case fRecurso.tRecursoTipo.AsInteger of
    0: begin
         QRLabel33.Caption := 'X';
         QRLabel25.Caption := fRecurso.tRecursoNumero.AsString;
         QRLabel16.Font.Style := [fsBold];
       end;
    1: begin
         QRLabel33.Caption := 'X';
         QRLabel25.Caption := fRecurso.tRecursoNumero.AsString;
         QRLabel17.Font.Style := [fsBold];
       end;
    2: begin
         QRLabel34.Caption := 'X';
         QRLabel30.Caption := fRecurso.tRecursoNumero.AsString;
         QRLabel5.Font.Style := [fsBold];
       end;
    3: begin
         QRLabel34.Caption := 'X';
         QRLabel30.Caption := fRecurso.tRecursoNumero.AsString;
         QRLabel18.Font.Style := [fsBold];
       end;
    4: begin
         QRLabel35.Caption := 'X';
         QRLabel31.Caption := fRecurso.tRecursoNumero.AsString;
       end;
  end;
end;

end.
