program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  SoundPlayer in 'SoundPlayer.pas',
  MyUtils in 'MyUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Server';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
