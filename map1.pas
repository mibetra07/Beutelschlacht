unit map1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, Path, Pinguin, wave, kanguru;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
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
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public
  var Path: array[1..15] of Tpath;
  var Pinguin: array[1..100] of TPinguin;
  var HelmPinguin: array[1..100] of THelmPinguin;
  var wave: array [1..100] of Twave;

  var Kanguru : array[1..5] of Tkanguru;
  var Bogenkanguru : array[1..5] of TBogenkanguru;
  var Zauberkanguru : array[1..5] of TZauberkanguru;
  var Ninjakanguru : array[1..5] of TNinjakanguru;
  var Eiskanguru : array[1..5] of TEiskanguru;
  end;

var
  Form5: TForm5;

implementation
uses Menu;
{$R *.lfm}

{ TForm5 }

procedure TForm5.FormCreate(Sender: TObject);
var i, coins : integer;
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


   //Memos mit Känguruinfos
   //Boxerkänguru
   Memo1.Lines.Clear;
   Memo1.Lines.add('Das klassische Känguru - quadratisch, praktisch, gut');
   Memo1.Lines.add('');
   Memo1.Lines.add('Reichweite: Gering');
   Memo1.Lines.add('Schaden: Mittel');
   Memo1.Lines.add('Angriffsgeschwindigkeit: Hoch');
   Groupbox2.visible:=false;

   //Bogenkänguru
   Memo2.Lines.Clear;
   Memo2.Lines.add('Großer Fan von Robin Hood - stiehlt den Reichen, verteilt an alle');
   Memo2.Lines.add('');
   Memo2.Lines.add('Reichweite: Hoch');
   Memo2.Lines.add('Schaden: Hoch');
   Memo2.Lines.add('Angriffsgeschwindigkeit: Gering');
   Groupbox3.visible:=false;
   //Eiskänguru
   Memo3.Lines.Clear;
   Memo3.Lines.add('Etwas zu lang am Nordpol gewesen - hat ein Praktikum beim Weihnachtsmann');
   Memo3.Lines.add('');
   Memo3.Lines.add('Reichweite: Gering');
   Memo3.Lines.add('Schaden: Gering');
   Memo3.Lines.add('Angriffsgeschwindigkeit: Mittel');
   Memo5.Lines.add('');
   Memo3.Lines.add('Verlangsamt Gegner');
   Groupbox4.visible:=false;
   //Ninjakänguru
   Memo4.Lines.Clear;
   Memo4.Lines.add('Ausgebildet im feudalen Japan – schlägt zu, bevor du es siehst, und hüpft weg, bevor du „Aua!“ sagen kannst');
   Memo4.Lines.add('');
   Memo4.Lines.add('Reichweite: Mittel');
   Memo4.Lines.add('Schaden: Mittel');
   Memo4.Lines.add('Angriffsgeschwindigkeit: Hoch');
   Memo5.Lines.add('');
   Memo4.Lines.add('Durchschaut jede Verkleidung');
   Groupbox5.visible:=false;
   //Magie
   Memo5.Lines.Clear;
   Memo5.Lines.add('ᒲᒲᒲ↸⎓ᒲ↸ʖ⍊ ⊣╎ ⊣ʖ∷ᓭ↸ꖌᓭ⎓⍑↸ᓭ⎓');
   Memo5.Lines.add('');
   Memo5.Lines.add('Reichweite: ???');
   Memo5.Lines.add('Schaden: Magisch');
   Memo5.Lines.add('Angriffsgeschwindigkeit: ???');
   Memo5.Lines.add('');
   Memo5.Lines.add('Beschwört Kreis auf der Strecke, der konstant Schaden zufügt');
   Groupbox6.visible:=false;
end;

procedure TForm5.Image2Click(Sender: TObject);
begin
  Form1.show;
  Form5.hide;
end;

procedure TForm5.Image3Click(Sender: TObject);
begin
  Groupbox2.visible:=true;
  Groupbox3.visible:=false;
  Groupbox4.visible:=false;
  Groupbox5.visible:=false;
  Groupbox6.visible:=false;
end;

procedure TForm5.Image4Click(Sender: TObject);
begin
  Groupbox3.visible:=true;
  Groupbox2.visible:=false;
  Groupbox4.visible:=false;
  Groupbox5.visible:=false;
  Groupbox6.visible:=false;
end;

procedure TForm5.Image5Click(Sender: TObject);
begin
  Groupbox4.visible:=true;
  Groupbox3.visible:=false;
  Groupbox2.visible:=false;
  Groupbox5.visible:=false;
  Groupbox6.visible:=false;
end;

procedure TForm5.Image6Click(Sender: TObject);
begin
  Groupbox5.visible:=true;
  Groupbox3.visible:=false;
  Groupbox4.visible:=false;
  Groupbox2.visible:=false;
  Groupbox6.visible:=false;
end;

procedure TForm5.Image7Click(Sender: TObject);
begin
  Groupbox6.visible:=true;
  Groupbox3.visible:=false;
  Groupbox4.visible:=false;
  Groupbox5.visible:=false;
  Groupbox2.visible:=false;
end;

procedure TForm5.Timer1Timer(Sender: TObject);
var i: integer;
begin
           tick(5, 5, 0, 0, 0, 1);
end;

procedure TForm5.Button1Click(Sender: TObject);
begin

  Timer1.enabled := true;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  Groupbox2.visible := false;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  Groupbox3.visible := false;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  Groupbox4.visible := false;
end;

procedure TForm5.Button5Click(Sender: TObject);
begin
  Groupbox5.visible := false;
end;

procedure TForm5.Button6Click(Sender: TObject);
begin
  Groupbox6.visible := false;
end;

end.

