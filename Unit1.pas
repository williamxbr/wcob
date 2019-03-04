unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DateUtils, jpeg, ExtCtrls, ShellApi;

type
  TForm1 = class(TForm)
    btnDayOfTheMonth: TButton;
    btnDayOfTheWeek: TButton;
    btnDayOfTheYear: TButton;
    btnDayOfWeek: TButton;
    btnDaysBetween: TButton;
    btnDaysInAMonth: TButton;
    btnDaysInAYear: TButton;
    btnDaySpan: TButton;
    btnFileAge: TButton;
    btnFileSetDate: TButton;
    btnIncDay: TButton;
    btnIncMillisecond: TButton;
    btnIncMinute: TButton;
    btnIncMonth: TButton;
    btnIncSecond: TButton;
    btnIncYear: TButton;
    btnIsLeapYear: TButton;
    Button1: TButton;
    btnMonthOfTheYear: TButton;
    Button2: TButton;
    Image1: TImage;
    procedure btnDayOfTheMonthClick(Sender: TObject);
    procedure btnDayOfTheWeekClick(Sender: TObject);
    procedure btnDayOfTheYearClick(Sender: TObject);
    procedure btnDayOfWeekClick(Sender: TObject);
    procedure btnDaysBetweenClick(Sender: TObject);
    procedure btnDaysInAMonthClick(Sender: TObject);
    procedure btnDaysInAYearClick(Sender: TObject);
    procedure btnDaySpanClick(Sender: TObject);
    procedure btnFileAgeClick(Sender: TObject);
    procedure btnFileSetDateClick(Sender: TObject);
    procedure btnIncDayClick(Sender: TObject);
    procedure btnIncMillisecondClick(Sender: TObject);
    procedure btnIncMinuteClick(Sender: TObject);
    procedure btnIncMonthClick(Sender: TObject);
    procedure btnIncSecondClick(Sender: TObject);
    procedure btnIncYearClick(Sender: TObject);
    procedure btnIsLeapYearClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnMonthOfTheYearClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnDayOfTheMonthClick(Sender: TObject);
begin
     ShowMessage('O dia do mes é = '+IntToStr(DayOfTheMonth(Date)));
end;

procedure TForm1.btnDayOfTheWeekClick(Sender: TObject);
var VetDias: array[1..7] of string;
begin
     VetDias[1] := 'Segunda-Feira';
     VetDias[2] := 'Terça-Feira';
     VetDias[3] := 'Quarta-Feira';
     VetDias[4] := 'Quinta-Feira';
     VetDias[5] := 'Sexta-Feira';
     VetDias[6] := 'Sábado';
     VetDias[7] := 'Domingo';
     ShowMessage('Hoje é '+VetDias[DayOfTheWeek(Date)]);
end;

procedure TForm1.btnDayOfTheYearClick(Sender: TObject);
begin
     ShowMessage('Hoje '+DateToStr(Date)+' é o ' + IntToStr(DayOfTheYear(Date)) + ' dia do ano.');
end;

procedure TForm1.btnDayOfWeekClick(Sender: TObject);
begin
     ShowMessage('Hoje é '+LongDayNames[DayOfWeek(date)]);
end;

procedure TForm1.btnDaysBetweenClick(Sender: TObject);
var DataAnterior: TDateTime;
begin
     DataAnterior := EncodeDateTime(2007, 01, 29, 0, 0, 0, 0);
     ShowMessage('A diferença de dias entre as datas é de '+
              IntToStr(DaysBetween(DataAnterior, now))+' dia');
end;

procedure TForm1.btnDaysInAMonthClick(Sender: TObject);
begin
     ShowMessage('Dias em Janeiro de 2007 = '+IntToStr(DaysInAMonth(2007, 1)));
end;

procedure TForm1.btnDaysInAYearClick(Sender: TObject);
begin
     ShowMessage('2007 terá '+IntToStr(DaysInAYear(2007))+' dias.');
end;

procedure TForm1.btnDaySpanClick(Sender: TObject);
var minhadatainicial, minhadatafinal : TDateTime;
begin
  minhadatainicial := EncodeDateTime(2007, 01, 29, 0, 0, 0, 0);
  minhadatafinal   := EncodeDateTime(2007, 01, 31, 06, 0, 0, 0);
  ShowMessage('Diferença fracionada entre datas = '+FloatToStrF(DaySpan(minhadatainicial, minhadatafinal),fffixed,8,2)+' dias.');
end;

procedure TForm1.btnFileAgeClick(Sender: TObject);
var dataArquivo: integer;
begin
     dataArquivo := FileAge('c:\meuarquivo.bat');
     if dataArquivo > -1 then
        ShowMessage('c:\meuarquivo.txt foi modificado pela última vez em: '+ DateToStr(FileDateToDateTime(dataArquivo)))
     else
         ShowMessage('Arquivo não encontrado.');
end;

procedure TForm1.btnFileSetDateClick(Sender: TObject);
var dataArquivo: integer;
begin
     dataArquivo := FileAge('c:\meuarquivo.txt');
     if dataArquivo > -1 then begin
        FileSetDate('c:\meuarquivo.txt',DateTimeToFileDate(Date));
        dataArquivo := FileAge('c:\meuarquivo.txt');
        ShowMessage('c:\meuarquivo.txt foi modificado pela última vez em: '+ DateToStr(FileDateToDateTime(dataArquivo)))
     end else
         ShowMessage('Arquivo não encontrado.');
end;

procedure TForm1.btnIncDayClick(Sender: TObject);
begin
     ShowMessage('Data + 10 Dias: '+DateToStr(IncDay(date,10)));
     ShowMessage('Data - 15 Dias: '+DateToStr(IncDay(date,-15)));
end;

procedure TForm1.btnIncMillisecondClick(Sender: TObject);
var minhaData : TDateTime;
begin
      minhaData := now;
      ShowMessage('Minha Data:'+DateTimeToStr(minhaData));
      minhaData := IncMillisecond(minhaData, 7000);
      ShowMessage('Minha Data + 7000 milliseconds = '+DateTimeToStr(minhaData));
      minhaData := IncMillisecond(minhaData, -3000);
      ShowMessage('Minha Data - 3000 milliseconds = '+DateTimeToStr(minhaData));
end;

procedure TForm1.btnIncMinuteClick(Sender: TObject);
var minhaData : TDateTime;
begin
      minhaData := now;
      ShowMessage('Minha Data:'+DateTimeToStr(minhaData));
      minhaData := IncMinute(minhaData, 15);
      ShowMessage('Minha Data + 15 minutos = '+DateTimeToStr(minhaData));
      minhaData := IncMinute(minhaData, -10);
      ShowMessage('Minha Data - 10 milliseconds = '+DateTimeToStr(minhaData));
end;

procedure TForm1.btnIncMonthClick(Sender: TObject);
var minhaData : TDateTime;
begin
      minhaData := now;
      ShowMessage('Minha Data: '+DateTimeToStr(minhaData));
      minhaData := IncMonth(minhaData, 2);
      ShowMessage('Minha Data + 2 meses = '+DateTimeToStr(minhaData));
      minhaData := IncMonth(minhaData, -1);
      ShowMessage('Minha Data - 1 mês = '+DateTimeToStr(minhaData));
end;

procedure TForm1.btnIncSecondClick(Sender: TObject);
var minhaData : TDateTime;
begin
      minhaData := now;
      ShowMessage('Minha Data: '+DateTimeToStr(minhaData));
      minhaData := IncSecond(minhaData, 30);
      ShowMessage('Minha Data + 30 seg. = '+DateTimeToStr(minhaData));
      minhaData := IncSecond(minhaData, -20);
      ShowMessage('Minha Data - 20 seg. = '+DateTimeToStr(minhaData));
end;

procedure TForm1.btnIncYearClick(Sender: TObject);
var minhaData : TDateTime;
begin
      minhaData := now;
      ShowMessage('Minha Data: '+DateTimeToStr(minhaData));
      minhaData := IncYear(minhaData, 2);
      ShowMessage('Minha Data + 2 anos = '+DateTimeToStr(minhaData));
      minhaData := IncYear(minhaData, -1);
      ShowMessage('Minha Data - 1 ano = '+DateTimeToStr(minhaData));
end;

procedure TForm1.btnIsLeapYearClick(Sender: TObject);
begin
     if IsLeapYear(2007) then
        ShowMessage('2007 é ano bissexto')
     else
         ShowMessage('2007 não é ano bissexto');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     ShowMessage('O dia tem '+IntToStr(HoursPerDay)+' horas.');
     ShowMessage('O dia tem '+IntToStr(MinsPerDay)+' minutos.');
     ShowMessage('O dia tem '+IntToStr(SecsPerDay)+' segundos.');
end;

procedure TForm1.btnMonthOfTheYearClick(Sender: TObject);
begin
     ShowMessage('O mês da data atual é '+LongMonthNames[(MonthOfTheYear(date))]);
end;

procedure TForm1.Button2Click(Sender: TObject);
var DataAnterior: TDateTime;
    minhadatainicial, minhadatafinal : TDateTime;
begin
     DataAnterior := EncodeDateTime(2006, 01, 29, 0, 0, 0, 0);
     ShowMessage('A diferença de dias entre as datas é de '+
              IntToStr(DaysBetween(DataAnterior, now))+' dia.');
     ShowMessage('A diferença de dias entre as datas é de '+
              IntToStr(YearsBetween(DataAnterior, now))+' anos.');
     ShowMessage('A diferença de dias entre as datas é de '+
              IntToStr(MonthsBetween(DataAnterior, now))+' meses.');
     ShowMessage('A diferença de dias entre as datas é de '+
              IntToStr(HoursBetween(DataAnterior, now))+' horas.');
     ShowMessage('A diferença de dias entre as datas é de '+
              IntToStr(MinutesBetween(DataAnterior, now))+' minutos.');
     ShowMessage('A diferença de dias entre as datas é de '+
              IntToStr(SecondsBetween(DataAnterior, now))+' segundos.');
     ShowMessage('Horas decorridas até hoje no ano = ' + IntToStr(HourOfTheYear(date)));
     ShowMessage('Horas decorridas até hoje no mês = ' + IntToStr(HourOfTheMonth(date)));
     minhadatainicial := EncodeDateTime(2007, 01, 29, 0, 0, 0, 0);
     minhadatafinal   := EncodeDateTime(2007, 01, 31, 06, 0, 0, 0);
     ShowMessage('Diferença fracionada entre datas = '+FloatToStrF(HourSpan(minhadatainicial, minhadatafinal),fffixed,8,2)+' horas.');
     ShowMessage('Diferença fracionada entre datas = '+FloatToStrF(MinuteSpan(minhadatainicial, minhadatafinal),fffixed,8,2)+' minutos.');
     ShowMessage('Diferença fracionada entre datas = '+FloatToStrF(SecondSpan(minhadatainicial, minhadatafinal),fffixed,8,2)+' segundos.');
     ShowMessage('Ontem era '+LongDayNames[DayOfWeek(YesterDay)]);
     ShowMessage('Amanha será '+LongDayNames[DayOfWeek(Tomorrow)]);
     case CompareDateTime(minhadatainicial,minhadatafinal) of
          -1: ShowMessage('Data inicio menor que data fim');
          0 : ShowMessage('Datas iguais');
          1 : ShowMessage('Data inicio maior que data fim')
     end;
     ShowMessage('Hoje é a '+ IntToStr(NthDayOfWeek(Date)) + 'ª ' + LongDayNames[DayOfWeek(Today)]+' do mês.');

end;

procedure TForm1.Image1Click(Sender: TObject);
begin
     ShellExecute(Application.Handle, nil, PChar('http://www.activedelphi.com.br/modules.php?op=modload&name=News&file=index&catid=&topic=31&allstories=1'), nil, nil, SW_SHOWNORMAL);
end;

end.
