unit UConsFuncDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, RXCtrls, Mask, ExtCtrls;

type
  TfConsFuncDet = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Panel4: TPanel;
    RxLabel1: TRxLabel;
    DBText1: TDBText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsFuncDet: TfConsFuncDet;

implementation

uses UConsFuncionarios, UConsMovDet;

{$R *.DFM}

procedure TfConsFuncDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfConsFuncDet.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsFuncDet.BitBtn2Click(Sender: TObject);
begin
  fConsMovDet := TfConsMovDet.Create(Self);
  fConsMovDet.ShowModal;
end;

end.
