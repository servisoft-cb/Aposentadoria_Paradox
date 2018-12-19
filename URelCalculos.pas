unit URelCalculos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TfRelCalculos = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape8: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape19: TQRShape;
    QRShape17: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape14: TQRShape;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape12: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRShape21: TQRShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCalculos: TfRelCalculos;

implementation

uses UCalculos;

{$R *.DFM}

procedure TfRelCalculos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCalculos.QuickRep1BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  with fCalculos do
    begin
      QRLabel32.Caption := Edit1.Text;
      QRLabel33.Caption := Edit2.Text;
      QRLabel34.Caption := Edit3.Text;
      QRLabel25.Caption := TCAA;
      QRLabel26.Caption := TCMM;
      QRLabel27.Caption := TCDD;
      QRLabel28.Caption := TEAA;
      QRLabel29.Caption := TEMM;
      QRLabel30.Caption := TEDD;
      QRLabel44.Caption := DateToStr(Data53);
      if tCadastroSexo.AsString = 'M' then
        begin
          QRLabel64.Enabled := False;
          QRLabel63.Enabled := True;
        end
      else
        begin
          QRLabel64.Enabled := True;
          QRLabel63.Enabled := False;
        end;
      QRLabel40.Caption := IntToStr(DiaP);
      QRLabel41.Caption := IntToStr(MesP);
      QRLabel42.Caption := IntToStr(AnoP);
      QRLabel43.Caption := IntToStr(DiaI);
      QRLabel46.Caption := IntToStr(MesI);
      QRLabel65.Caption := IntToStr(AnoI);
      QRLabel51.Caption := IntToStr(DiaInt);
      QRLabel52.Caption := IntToStr(MesInt);
      QRLabel53.Caption := IntToStr(AnoInt);
      QRLabel54.Caption := IntToStr(DiaPrp);
      QRLabel55.Caption := IntToStr(MesPrp);
      QRLabel56.Caption := IntToStr(AnoPrp);
      QRLAbel47.Caption := A1298;
      QRLabel48.Caption := M1298;
      QRLabel49.Caption := D1298;
    end;
end;

end.
