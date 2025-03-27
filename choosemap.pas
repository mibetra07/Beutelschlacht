unit chooseMap;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, map1, map2, IniFiles;

type

  { TForm2 }

  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private

  public
    procedure UpdateCompletion();
  end;

var
  Form2: TForm2;

implementation

uses Menu;

{$R *.lfm}

{ TForm2 }

//map1
procedure TForm2.Image1Click(Sender: TObject);
begin
  Form5.show;
  Form1.timer1.enabled:=false;  //Musik aus
  Form5.ConstructForm();
  Form2.hide;
end;

procedure TForm2.UpdateCompletion();
var Ini : TIniFile;
begin
  Ini := TIniFile.Create('settings.ini');
  try
    if Ini.ReadBool('Spielstand', 'map1_done', false) = true then
      Panel3.caption:= 'Pinguinpass: Geschafft'
    else
      Panel3.caption:= 'Pinguinpass: Nicht Geschafft';

    if Ini.ReadBool('Spielstand', 'map2_done', false) = true then
      Panel2.caption:= 'Verdorrte Weiten: Geschafft'
    else
      Panel2.caption:= 'Verdorrte Weiten: Nicht Geschafft';
  finally
    Ini.Free;  // Datei schließen
  end;
end;

//map2
procedure TForm2.Image2Click(Sender: TObject);
begin
  Form6.show;
  Form1.timer1.enabled:=false; //Musik aus
  Form6.ConstructForm();
  Form2.hide;
end;

//zurück zu Main
procedure TForm2.Image3Click(Sender: TObject);
begin
  Form1.show;
  Form2.hide;
end;

end.

