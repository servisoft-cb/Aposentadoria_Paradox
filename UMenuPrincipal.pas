unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, RXCtrls, Db, DBTables, StdCtrls, DBIProcs, PicClip;

type
  TfMenuPrincipal = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    tRegistro: TTable;
    tRegistroDataInicial: TDateField;
    tRegistroSerial: TStringField;
    tRegistroRegistro: TStringField;
    tRegistroContador1: TIntegerField;
    tRegistroContador2: TIntegerField;
    tRegistroNome: TStringField;
    dsRegistro: TDataSource;
    Image1: TImage;
    SpeedButton9: TSpeedButton;
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tRegistroAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenuPrincipal: TfMenuPrincipal;

implementation

uses UCadastro, UMovimentos, UPrevRelFuncionarios, UConsFuncionarios,
  UConsMovimentos, UPrevRelMovimentos, UBackUp, USobre, UCalculos,
  UProcurador;

{$R *.DFM}

procedure TfMenuPrincipal.SpeedButton9Click(Sender: TObject);
begin
  Close;
end;

procedure TfMenuPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfMenuPrincipal.SpeedButton1Click(Sender: TObject);
begin
  fCadastro := TfCadastro.Create(Self);
  fCadastro.ShowModal;
end;

procedure TfMenuPrincipal.SpeedButton2Click(Sender: TObject);
begin
  fMovimentos := TfMovimentos.Create(Self);
  fMovimentos.ShowModal;
end;

procedure TfMenuPrincipal.SpeedButton3Click(Sender: TObject);
begin
  fPrevRelFuncionarios := TfPrevRelFuncionarios.Create(Self);
  fPrevRelFuncionarios.ShowModal;
end;

procedure TfMenuPrincipal.SpeedButton4Click(Sender: TObject);
begin
  fProcurador := TfProcurador.Create(Self);
  fProcurador.ShowModal;
end;

procedure TfMenuPrincipal.SpeedButton5Click(Sender: TObject);
begin
  fConsMovimentos := TfConsMovimentos.Create(Self);
  fConsMovimentos.ShowModal;
end;

procedure TfMenuPrincipal.SpeedButton6Click(Sender: TObject);
begin
  fCalculos := TfCalculos.Create(Self);
  fCalculos.ShowModal
end;

procedure TfMenuPrincipal.SpeedButton7Click(Sender: TObject);
begin
  fBackup := TfBackup.Create(Self);
  fBackup.ShowModal;
end;

procedure TfMenuPrincipal.SpeedButton8Click(Sender: TObject);
begin
  fSobre := TfSobre.Create(Self);
  fSobre.ShowModal;
end;

procedure TfMenuPrincipal.FormCreate(Sender: TObject);
var
  VolumeNameBuffer, FileSystemNameBuffer: array[0..255] of char;
  VolumeSerialNumber, MaximumComponentLength, FileSystemFlags: Integer;
begin
  GetVolumeInformation(PChar('c:\'),
                     VolumeNameBuffer,
                     sizeof(VolumeNameBuffer),
                     @VolumeSerialNumber,
                     MaximumComponentLength,
                     FileSystemFlags,
                     FileSystemNameBuffer,
                     sizeof(FileSystemNameBuffer));
  if tRegistroDataInicial.AsString = '' then
    begin
      tRegistro.Edit;
      tRegistroDataInicial.AsDateTime := Date;
      tRegistroContador1.AsInteger    := 1;
      tRegistroSerial.AsString := Format('%x', [VolumeSerialNumber]);
      tRegistro.Post;
    end;
{  if (tRegistroRegistro.Text <> '') and (tRegistroRegistro.Text <> IntToStr(VolumeSerialNumber)) then
    begin
      ShowMessage('Cópia não registrada para este computador.');
      fMenuPrincipal.Panel1.Enabled := False;
      fSobre := TfSobre.Create(Self);
      fSobre.ShowModal;
    end;}
end;

procedure TfMenuPrincipal.FormShow(Sender: TObject);
begin
  if tRegistroDataInicial.AsDateTime <> Date then
    begin
      tRegistro.Edit;
      tRegistroContador1.AsInteger := tRegistroContador1.AsInteger + 1;
      tRegistro.Post;
    end;
  if (tRegistroContador1.AsInteger >= 30) or (tRegistroContador2.AsInteger >= 40) then
    begin
      if tRegistroRegistro.Text = '' then
        begin
          ShowMessage('O prazo de uso do programa sem registrar expirou');
          fMenuPrincipal.Panel1.Enabled := False;
          fSobre := TfSobre.Create(Self);
          fSobre.ShowModal;
        end;
    end;
  if tRegistroRegistro.Text = '' then
    begin
      if tRegistroContador2.Text = '' then
        begin
          tRegistro.Edit;
          tRegistroContador2.AsInteger := 1;
          tRegistro.Post;
        end
      else
        begin
          tRegistro.Edit;
          tRegistroContador2.AsInteger := tRegistroContador2.AsInteger + 1;
          tRegistro.Post;
        end;
    end;
end;

procedure TfMenuPrincipal.tRegistroAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tRegistro.Handle);
end;

end.
