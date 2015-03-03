program Project1;

uses
  Forms,
  Brauerei in 'Brauerei.pas' {Form1},
  Timer in 'Timer.pas' {Form2};

{$E .exe}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Brauerei';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
