program Project1;

uses
  Forms,
  Brauerei in 'Brauerei.pas' {Form1},
  Timer in 'Timer.pas' {Form2},
  Multi in 'Multi.pas' {Form3},
  Funktionsbezeichnungen in 'Funktionsbezeichnungen.pas' {Form4},
  iowkit in 'iowkit.pas';

{$E .exe}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Brauerei';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
