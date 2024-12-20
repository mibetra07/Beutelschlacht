unit map1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Path, Pinguin, wave;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public
  var Path: array[1..15] of Tpath;
  var Pinguin: array[1..100] of TPinguin;
  var HelmPinguin: array[1..100] of THelmPinguin;
  var wave: array [1..100] of Twave;
  end;

var
  Form5: TForm5;

implementation
uses Menu;
{$R *.lfm}

{ TForm5 }

procedure TForm5.FormCreate(Sender: TObject);
var i: integer;
begin
  randomize();
   //Weg der Map erstellen (dir, left, top, breit, hoch, map: integer)
   Path[1] := TPath.create(1, 100, 500, 500, 100, 1);
   Path[2] := Tpath.create(2, 600, 500, 100, 400, 1);
   Path[3] := Tpath.create(3, 300, 900, 400, 500, 1);
   Path[4] := Tpath.create(4, 300, 200, 100, 800, 1);
   Path[5] := Tpath.create(1, 300, 200, 1000, 100, 1);
   Path[6] := Tpath.create(2, 1300, 200, 100, 500, 1);
   Path[7] := Tpath.create(1, 1300, 700, 1000, 100, 1);
   wave[1] := Twave.create(5, 5, 0, 0, 0, 1);
   Timer1.Enabled := false;
   Timer1.interval := 5;
end;

procedure TForm5.Image2Click(Sender: TObject);
begin
  Form1.show;
  Form5.hide;
end;

procedure TForm5.Timer1Timer(Sender: TObject);
var i: integer;
begin
           tick(5, 5, 0, 0, 0, 1);
           if Pinguin[i] <> nil then
           Panel1.caption := inttostr(Pinguin[1].currentPath) + inttostr(Pinguin[2].currentPath);
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  Timer1.enabled := true;
end;

end.

