unit UBackUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ZipMstr, Gauges, Feedback, ExtCtrls, Buttons;

type
  TfBackUp = class(TForm)
    Panel1: TPanel;
    NeatoMeter1: TNeatoMeter;
    ZipMaster1: TZipMaster;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ZipMaster1Progress(Sender: TObject; ProgrType: ProgressType;
      Filename: String; FileSize: Integer);
    procedure ZipMaster1Message(Sender: TObject; ErrCode: Integer;
      Message: String);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBackUp : TfBackUp;
  Cont  : Integer;

implementation

{$R *.DFM}

procedure TfBackUp.FormCreate(Sender: TObject);
begin
  SetCurrentDir('C:\Dmsd\Aposentadoria\');
  ZipMaster1.ZipFileName := 'DominiusBkp.zip';
  ZipMaster1.Load_Zip_Dll;
  ZipMaster1.Load_Unz_Dll;
end;

procedure TfBackUp.FormDestroy(Sender: TObject);
begin
  ZipMaster1.Unload_Zip_Dll;
  ZipMaster1.Unload_Unz_Dll;
end;

procedure TfBackUp.ZipMaster1Progress(Sender: TObject;
  ProgrType: ProgressType; Filename: String; FileSize: Integer);
begin
  Inc(Cont);
  NeatoMeter1.Completed := Cont;
end;

procedure TfBackUp.ZipMaster1Message(Sender: TObject; ErrCode: Integer;
  Message: String);
begin
  if ErrCode <> 0 then
    ShowMessage(Message);
end;

procedure TfBackUp.BitBtn1Click(Sender: TObject);
begin
  if not FileExists('C:\Dmsd\Aposentadoria\Db*.*') then
    ShowMessage('Não foi encontrado arquivos para compactação!')
  else
    begin
      ZipMaster1.FSpecArgs.Add('C:\Dmsd\Aposentadoria\db*.*');
      ZipMaster1.Add;
      ZipMaster1.CopyFile('C:\Dmsd\Aposentadoria\DominiusBkp.zip',ComboBox1.Text + '\DominiusBkp.zip');
      ShowMessage('Total de  ' + IntToStr(ZipMaster1.SuccessCnt) + '  arquivos compactados!');
      NeatoMeter1.Completed := 0;
      Cont := 0;
      DeleteFile('C:\Dmsd\Aposentadoria\DominiusBkp.zip');
    end;
end;

procedure TfBackUp.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Se você restaurar o Backup, seus dados anteriores'+#13+
                'serão todos perdidos. Deseja prosseguir a operação?',mtConfirmation,
                [mbOK,mbNO],0) = mrOK then
    if not FileExists(ComboBox1.Text + '\DominiusBkp.Zip') then
      ShowMessage('Não existe disquete no drive ou não existe o arquivo DominiusBkp.Zip!')
    else
      begin
        ZipMaster1.CopyFile(ComboBox1.Text + '\DominiusBkp.zip','C:\Dmsd\Aposentadoria\DominiusBkp.zip');
        ZipMaster1.FSpecArgs.Add('Db*.*');
        ZipMaster1.ExtrBaseDir := 'C:\Dmsd\Aposentadoria\';
        ZipMaster1.ExtrOptions := ZipMaster1.ExtrOptions+[ExtrOverwrite];
        ZipMaster1.Extract;
        ShowMessage('Arquivos restaurados do BackUp = ' + IntToStr(ZipMaster1.SuccessCnt));
        NeatoMeter1.Completed := 0;
        Cont := 0;
        DeleteFile('C:\Dmsd\Aposentadoria\DominiusBkp.zip');
      end;
end;

procedure TfBackUp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfBackUp.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.
