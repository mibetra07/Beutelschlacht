unit Options;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, MMSystem, IniFiles;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button19: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Panel16: TPanel;
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
  public
    procedure UpdateSettings();
  end;

var
  Form3: TForm3;

implementation
uses Menu;
{$R *.lfm}

{ TForm3 }
procedure Tform3.UpdateSettings();
var Ini : TIniFile;
begin
  Ini := TIniFile.Create('settings.ini');
  try
    //Autostart
    checkbox2.checked := Ini.ReadBool('Spiel', 'Autostart', true);
    //Stummschalten Button caption
    if Ini.ReadBool('Musik', 'Stumm', false) = true then
      Button19.caption:='Musik entstummen'
    else
      Button19.caption:='Musik stummschalten';
   //Musik wiederholen
   checkbox3.checked := Ini.ReadBool('Musik', 'Wiederholen', false);
  finally
    Ini.Free;
  end;
end;
//Zurück zu Main Menu
procedure TForm3.Image1Click(Sender: TObject);
begin
  Form1.show;
  Groupbox2.visible:=false;
  Form3.hide;
end;

//Musik stumm
procedure TForm3.Button19Click(Sender: TObject);
var Ini : TIniFile;
begin
  Ini := TIniFile.Create('settings.ini');
  try
    if Ini.ReadBool('Musik', 'Stumm', false) = false then
    begin
      Ini.WriteBool('Musik', 'Stumm', true);
      Button19.caption:='Musik entstummen';
      Playsound(nil, 0, SND_PURGE);
      Form1.Timer1.enabled:=false;
    end
    else
    begin
      Ini.WriteBool('Musik','Stumm', false);
      Button19.caption:='Musik stummschalten';
      Form1.StartMenuMusic();
    end;
  finally
    Ini.Free;
  end;
end;

//Einstellungen zurücksetzen
procedure TForm3.Button1Click(Sender: TObject);
var Ini : TIniFile;
begin
  Ini := TIniFile.Create('settings.ini');
  try
    //Schreiben
    Ini.WriteBool('Spiel', 'Autostart', true);
    Ini.WriteBool('Musik', 'Stumm', false);
    Ini.WriteBool('Musik', 'Wiederholen', false);
    //Aktualisieren
    checkbox2.checked := Ini.ReadBool('Spiel', 'Autostart', true);
    Button19.caption:='Musik stummschalten';
    Form1.StartMenuMusic();
    checkbox3.checked := Ini.ReadBool('Musik', 'Wiederholen', false);
  finally
    Ini.Free;
  end;
end;

//Spielstand zurücksetzen
procedure TForm3.Button2Click(Sender: TObject);
begin
  Groupbox2.visible:=true;
end;
//Ja
procedure TForm3.Button3Click(Sender: TObject);
var Ini : TIniFile;
begin
  Ini := TIniFile.Create('settings.ini');
  try
    Ini.WriteBool('Spielstand', 'map1_done', false);
    Ini.WriteBool('Spielstand', 'map2_done', false);
  finally
    Ini.Free;
  end;
  Groupbox2.visible:=false;
end;
//Nein
procedure TForm3.Button4Click(Sender: TObject);
begin
  Groupbox2.visible:=false;
end;

//Autostart
procedure TForm3.CheckBox2Change(Sender: TObject);
var Ini : TIniFile;
begin
  Ini := TIniFile.Create('settings.ini');
  try
      Ini.WriteBool('Spiel', 'Autostart', checkbox2.checked);
  finally
    Ini.Free;  // Datei schließen
  end;
end;
//Musik wiederholen
procedure TForm3.CheckBox3Change(Sender: TObject);
var Ini : TIniFile;
begin
  Ini := TIniFile.Create('settings.ini');
  try
      Ini.WriteBool('Musik', 'Wiederholen', checkbox3.checked);
  finally
    Ini.Free;  // Datei schließen
  end;
end;

end.

