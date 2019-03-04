program PagesDemo;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Preview in 'Preview.pas' {PreviewForm},
  Pages in '..\..\Components\Pages.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
