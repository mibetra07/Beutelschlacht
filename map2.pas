unit map2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Path, Pinguin, wave, kanguru;

type

  { TForm6 }
  TForm6 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
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
  var wave: array [1..100] of TWave;

  var Kanguru : array[1..5] of Tkanguru;
  var Bogenkanguru : array[1..5] of TBogenkanguru;
  var Zauberkanguru : array[1..5] of TZauberkanguru;
  var Ninjakanguru : array[1..5] of TNinjakanguru;
  var Eiskanguru : array[1..5] of TEiskanguru;
  end;

var
  Form6: TForm6;

implementation
uses Menu;
{$R *.lfm}

{ TForm6 }

procedure TForm6.FormCreate(Sender: TObject);
var i: integer;
begin
  //Weg der Map erstellen (dir, left, top, breit, hoch, map: integer)
   Path[1] := TPath.create(1, 100, 500, 500, 100, 2);
   Path[2] := Tpath.create(2, 600, 500, 100, 400, 2);
   Path[3] := Tpath.create(3, 300, 900, 400, 500, 2);
   Path[4] := Tpath.create(4, 300, 200, 100, 800, 2);
   Path[5] := Tpath.create(1, 300, 200, 1000, 100, 2);
   Path[6] := Tpath.create(2, 1300, 200, 100, 1000, 2);
    wave[1] := Twave.create(5, 5, 0, 0, 0, 2);
   Timer1.Enabled := false;
   Timer1.interval := 5;
end;

procedure TForm6.Image2Click(Sender: TObject);
begin
  Form1.show;
  Form6.hide;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
  tick(2, Pinguin[1]);
end;

 procedure TForm6.Button1Click(Sender: TObject);
begin
     Timer1.enabled := true;
     Pinguin[10] := Tpinguin.create(2, 0);
end;



end.

