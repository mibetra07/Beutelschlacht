unit map1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Path, Pinguin;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
  var Path: array[1..15] of Tpath;
  var Pinguin: array[1..100] of TPinguin;
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
   //Weg der Map erstellen (dir, left, top, breit, hoch, map: integer)
   Path[1] := TPath.create(1, 100, 500, 500, 100, 1);
   Path[2] := Tpath.create(2, 600, 500, 100, 400, 1);
   Path[3] := Tpath.create(1, 300, 900, 400, 500, 1);
   Path[4] := Tpath.create(2, 300, 200, 100, 800, 1);
   Path[5] := Tpath.create(1, 300, 200, 1000, 100, 1);
   Path[6] := Tpath.create(2, 1300, 200, 100, 500, 1);
   Path[7] := Tpath.create(1, 1300, 700, 1000, 100, 1);
   for i := 1 to 5 do
       Pinguin[i] := TPinguin.create(1);  //Pinguine erstellen (test)
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  Form1.show;
  Form5.hide;
end;

end.
