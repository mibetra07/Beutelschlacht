unit Menu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  chooseMap, map1, map2, options, credits, tutorial, MMSystem, IniFiles;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Image1: TImage;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    firstactivate : boolean;
    var Songtick:integer;
  public
    procedure StartMenuMusic();
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

//Kartenauswahl
procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.show;
  Form2.UpdateCompletion();
  Form1.hide;
end;

//Tutorial
procedure TForm1.Button2Click(Sender: TObject);
begin
  Form7.show;
  timer1.enabled:=false; //Menü Musik aus
  Form7.StartTutorialMusic();
  Form1.hide;
end;

//Einstellungen
procedure TForm1.Button3Click(Sender: TObject);
begin
  Form3.show;
  Form3.UpdateSettings();
  Form1.hide;
end;

//Credits
procedure TForm1.Button4Click(Sender: TObject);
begin
  Form4.show;
  Form1.hide;
end;

//Schließt das Programm
procedure TForm1.Button5Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  firstactivate:=true;
end;
//Musik
procedure TForm1.Timer1Timer(Sender: TObject);
begin
  inc(Songtick);
  if Songtick >= 239 then
  begin
    Songtick:=0;
    StartMenuMusic();
  end;
end;

procedure TForm1.StartMenuMusic();
var Ini : Tinifile;
begin
  SongTick:=0;
  Ini := TIniFile.Create('settings.ini');
  try
    if Ini.ReadBool('Musik', 'Stumm', false) = false then
    begin
      timer1.Enabled:= true;
      PlaySound('Music\Menu_Music.wav', 0, SND_ASYNC);
    end;
  finally
    Ini.Free;  // Datei schließen
  end;
end;

//alle Forms laden und schließen
procedure TForm1.FormActivate(Sender: TObject);
var
  Ini: TIniFile;
begin
  if firstactivate=true then
  begin
    Form2.show;
    Form3.show;
    Form4.show;
    Form5.show;
    Form6.show;
    Form7.show;

    Form2.hide;
    Form3.hide;
    Form4.hide;
    Form5.hide;
    Form6.hide;
    Form7.hide;

    firstactivate:=false;
    //ggf. Einstellungsdatei erstellen
    if not FileExists('settings.ini') then
    begin
      Ini := TIniFile.Create('settings.ini');
      try
        // Standardwerte schreiben
        Ini.WriteBool('Spiel', 'Autostart', true);

        Ini.WriteBool('Musik', 'Stumm', false);
        Ini.WriteBool('Musik', 'Wiederholen', false);

        Ini.WriteBool('Spielstand', 'map1_done', false);
        Ini.WriteBool('Spielstand', 'map2_done', false);
      finally
        Ini.Free;
      end;
    end;
    StartMenuMusic();
  end;
end;
end.


