unit USobre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, RXCtrls, DBCtrls, Db, DbTables, Lklabel;

type
  TfSobre = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RxLabel1: TRxLabel;
    Image1: TImage;
    RxLabel2: TRxLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    tRegistro: TTable;
    MRLinkLabel1: TMRLinkLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSobre: TfSobre;

implementation

uses UMenuPrincipal, URegistro;

{$R *.DFM}

procedure TfSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfSobre.BitBtn1Click(Sender: TObject);
begin
  if (fMenuPrincipal.tRegistroContador1.AsInteger >= 30) or (fMenuPrincipal.tRegistroContador2.AsInteger >= 40) then
    begin
      if fMenuPrincipal.tRegistroRegistro.AsString = '' then
        begin
          Application.Terminate;
        end
      else
        Close;
    end
  else
    Close;
end;

procedure TfSobre.BitBtn2Click(Sender: TObject);
begin
  fRegistro := TfRegistro.Create(Self);
  fRegistro.ShowModal;
end;

procedure TfSobre.FormShow(Sender: TObject);
begin
  if tRegistro.FieldByName('Registro').AsString = '' then
    BitBtn2.Enabled := True;
end;

end.
