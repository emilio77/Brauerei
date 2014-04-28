program Project1;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  Brauerei in 'Brauerei.pas' {Form1};

{$E .exe}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Brauerei';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
