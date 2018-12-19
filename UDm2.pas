unit UDm2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDM2 = class(TDataModule)
    tCadastro2: TTable;
    tCadastro2Codigo: TIntegerField;
    tProcurador2: TTable;
    tProcurador2Codigo: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM2: TDM2;

implementation

{$R *.DFM}

end.
