unit URegistro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DbTables, Mask, DBCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TfRegistro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRegistro: TfRegistro;

implementation

uses UMenuPrincipal, USobre;

{$R *.DFM}

procedure TfRegistro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRegistro.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfRegistro.BitBtn1Click(Sender: TObject);
var
  VolumeNameBuffer, FileSystemNameBuffer: array[0..255] of Char;
  VolumeSerialNumber, MaximumComponentLength, FileSystemFlags: Integer;
begin
  if (DBEdit1.Text <> '') and (Edit1.Text <> '') then
    begin
      GetVolumeInformation(PChar('c:\'),
                         VolumeNameBuffer,
                         sizeof(VolumeNameBuffer),
                         @VolumeSerialNumber,
                         MaximumComponentLength,
                         FileSystemFlags,
                         FileSystemNameBuffer,
                         sizeof(FileSystemNameBuffer));
      if Edit1.Text = IntToStr(VolumeSerialNumber) then
        begin
          fMenuPrincipal.tRegistroRegistro.Text := Edit1.Text;
          fMenuPrincipal.tRegistro.Post;
          ShowMessage('O programa foi registrado com sucesso!');
          fMenuPrincipal.Panel1.Enabled := True;
          Close;
          fSobre.BitBtn2.Enabled := False;  ;
        end
      else
        ShowMessage('O programa não foi registrado! Confira se o código de registro foi digitado corretamente!');
        Edit1.SetFocus;
    end;
end;

procedure TfRegistro.FormActivate(Sender: TObject);
begin
  fMenuPrincipal.tRegistro.Edit;
  DBEdit1.SetFocus;
end;

procedure TfRegistro.BitBtn2Click(Sender: TObject);
begin
  fMenuPrincipal.tRegistro.Cancel;
  DBEdit1.SetFocus;
  Edit1.Clear;
end;

end.
