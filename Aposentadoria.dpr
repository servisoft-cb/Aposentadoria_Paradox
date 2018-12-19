 program Aposentadoria;

uses
  Forms,
  Db,
  DbTables,
  UMenuPrincipal in 'UMenuPrincipal.pas' {fMenuPrincipal},
  UCadastro in 'UCadastro.pas' {fCadastro},
  UMovimentos in 'UMovimentos.pas' {fMovimentos},
  UPrevRelFuncionarios in 'UPrevRelFuncionarios.pas' {fPrevRelFuncionarios},
  URelFuncionarios in 'URelFuncionarios.pas' {fRelFuncionarios},
  UConsFuncionarios in 'UConsFuncionarios.pas' {fConsFuncionarios},
  UConsFuncDet in 'UConsFuncDet.pas' {fConsFuncDet},
  UConsMovDet in 'UConsMovDet.pas' {fConsMovDet},
  UConsMovimentos in 'UConsMovimentos.pas' {fConsMovimentos},
  UConsMovimentosDet in 'UConsMovimentosDet.pas' {fConsMovimentosDet},
  UPrevRelMovimentos in 'UPrevRelMovimentos.pas' {fPrevRelMovimentos},
  UBackUp in 'UBackUp.pas' {fBackUp},
  USobre in 'USobre.pas' {fSobre},
  //URegistro in 'URegistro.pas' {fRegistro},
  URelMovimentos in 'URelMovimentos.pas' {fRelMovimentos},
  UCalculos in 'UCalculos.pas' {fCalculos},
  URelCalculos in 'URelCalculos.pas' {fRelCalculos},
  URelProcuracao in 'URelProcuracao.pas' {fRelProcuracao},
  URelRequerimento in 'URelRequerimento.pas' {fRelRequerimento},
  UProcuracao in 'UProcuracao.pas' {fPrevProcuracao},
  UPrevRequerimento in 'UPrevRequerimento.pas' {fPrevRequerimento},
  UPrevPensao in 'UPrevPensao.pas' {fPrevPensao},
  UDependentes in 'UDependentes.pas' {fDependentes},
  URelPenAuxRec in 'URelPenAuxRec.pas' {fRelPensaoAuxRec},
  UPrevRelacaoSalario in 'UPrevRelacaoSalario.pas' {fRelacaoSalario},
  USalariosContrbuicao in 'USalariosContrbuicao.pas' {fSalariosContribuicao},
  UAumentosSalariais in 'UAumentosSalariais.pas' {fAumentosSalariais},
  URelUltimosSalarios in 'URelUltimosSalarios.pas' {fRelUltimosSalarios},
  UProcurador in 'UProcurador.pas' {fProcurador},
  URecurso in 'URecurso.pas' {fRecurso},
  URelRecurso in 'URelRecurso.pas' {fRelRecurso};

{$R *.RES}

begin
  Application.Initialize;
  Session.AddPassword('46w3zq');
  Application.Title := 'Controle e Cálculo de Tempo de Serviço';
  Application.HelpFile := 'C:\DMSD\Aposentadoria\Dominius.hlp';
  Application.CreateForm(TfMenuPrincipal, fMenuPrincipal);
  Application.Run;
end.
