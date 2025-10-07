program projProgLinear;

uses
  Vcl.Forms,
  uMenu in 'uMenu.pas' {Form1},
  uSobre in 'uSobre.pas' {formSobre},
  uMetBas in 'uMetBas.pas' {formMetBas},
  uFuncs in 'uFuncs.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TformSobre, formSobre);
  Application.CreateForm(TformMetBas, formMetBas);
  Application.Run;
end.
