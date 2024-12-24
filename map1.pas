unit map1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, Path, Pinguin, wave, kanguru, Collision;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
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
    Shape6: TShape;
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
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image5Click(Sender: TObject);
    procedure Image5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image5MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image6Click(Sender: TObject);
    procedure Image6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image6MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
  //fürs Platzieren
  var isDragging, DragThresholdReached : boolean;
  var StartX, StartY : integer;
  const DragThreshold = 96; //minimale Mausbewegung in px, um Dragging/kaufen zu starten
  var Kanguruzahl, Bogenkanguruzahl, Eiskanguruzahl, Ninjakanguruzahl, Zauberkanguruzahl : integer;
  public
  var coins : integer;
  var Path: array[1..15] of Tpath;
  var Pinguin: array[1..100] of TPinguin;
  var HelmPinguin: array[1..100] of THelmPinguin;
  var wave: array [1..100] of Twave;

  var Kanguru : array[1..100] of TBoxerkanguru;
  var Bogenkanguru : array[1..100] of TBogenkanguru;
  var Zauberkanguru : array[1..100] of TZauberkanguru;
  var Ninjakanguru : array[1..100] of TNinjakanguru;
  var Eiskanguru : array[1..100] of TEiskanguru;

  //Positionsvariablen zum platzieren der Kängurus
  var dx, dy : integer;
  procedure InitDrag(X, Y : integer; Button : TMouseButton);
  end;

var
  Form5: TForm5;

implementation
uses Menu;
{$R *.lfm}

{ TForm5 }



procedure TForm5.FormCreate(Sender: TObject);
var i : integer;
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

   //Känguruzählervariablen
   Kanguruzahl := 0;
   Bogenkanguruzahl := 0;
   Eiskanguruzahl := 0;
   Ninjakanguruzahl := 0;
   Zauberkanguruzahl := 0;

   //Platzieren
   isDragging := false;

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

//Form wechseln
procedure TForm5.Image2Click(Sender: TObject);
begin
  Form1.show;
  Form5.hide;
end;

//Känguru platzieren mit Kollisionsabfrage

//Boxer
procedure Tform5.InitDrag(X, Y : integer; Button : TMouseButton);
begin
  if Button = mbLeft then
  begin
    isDragging := true;
    DragThresholdReached := false;
    //Startposition der Maus speichern
    StartX := X;
    StartY := Y;
  end;
end;

procedure TForm5.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  initDrag(X,Y,Button);
end;

procedure TForm5.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if isDragging = true then
  begin
    if not DragThresholdReached then
    begin
      if (Abs(X - StartX) > DragThreshold) or (Abs(Y - StartY) > DragThreshold) then
      begin
        DragThresholdReached := true;
        inc(kanguruzahl);
        kanguru[Kanguruzahl] := TBoxerkanguru.create(1, Mouse.CursorPos.X, Mouse.CursorPos.Y);
      end;
    end;
    if DragThresholdReached then
    begin
      kanguru[kanguruzahl].bild.left := Mouse.CursorPos.X;
      kanguru[kanguruzahl].bild.top := Mouse.CursorPos.Y;
      kanguru[kanguruzahl].attackradius.left := (Mouse.CursorPos.X + 48 - kanguru[kanguruzahl].range2);
      kanguru[kanguruzahl].attackradius.Top := (Mouse.CursorPos.Y + 48 - kanguru[kanguruzahl].range2);
    end;
  end;
end;

procedure TForm5.Image3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Collision, MapCollision : boolean;
begin
  if (Button = mbLeft) and (DragThresholdReached = true) then
  begin
    Collision := false;
    isDragging := False;
    DragThresholdReached := False;
    //Schleife zur Kollisionsabfrage mit (fast) allen anderen Bildern
    CheckCollision(kanguru[kanguruzahl].bild, Image2, Collision);
    CheckMapCollision(kanguru[kanguruzahl].bild, MapCollision);

    if (Collision = true) or (MapCollision = true) then
    begin
      kanguru[kanguruzahl].attackradius.free;
      kanguru[kanguruzahl].bild.free;
      kanguru[kanguruzahl].Free;
      dec(kanguruzahl);
    end
    else
    begin
      coins := coins - 1000;
      kanguru[kanguruzahl].attackradius.visible := false;
      kanguru[kanguruzahl].active := true;
    end;
  end;
end;
//Bogen
procedure TForm5.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  InitDrag(X, Y, Button);
end;

procedure TForm5.Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if isDragging = true then
  begin
    if not DragThresholdReached then
    begin
      if (Abs(X - StartX) > DragThreshold) or (Abs(Y - StartY) > DragThreshold) then
      begin
        DragThresholdReached := true;
        inc(bogenkanguruzahl);
        bogenkanguru[bogenKanguruzahl] := TBogenkanguru.create(1, Mouse.CursorPos.X, Mouse.CursorPos.Y);
      end;
    end;
    if DragThresholdReached then
    begin
      bogenkanguru[bogenkanguruzahl].bild.left := Mouse.CursorPos.X;
      bogenkanguru[bogenkanguruzahl].bild.top := Mouse.CursorPos.Y;
      bogenkanguru[bogenkanguruzahl].attackradius.left := (Mouse.CursorPos.X + 48 - bogenkanguru[bogenkanguruzahl].range2);
      bogenkanguru[bogenkanguruzahl].attackradius.Top := (Mouse.CursorPos.Y + 48 - bogenkanguru[bogenkanguruzahl].range2);
    end;
  end;
end;

procedure TForm5.Image4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Collision, MapCollision : boolean;
begin
  if (Button = mbLeft) and (DragThresholdReached = true) then
  begin
    Collision := false;
    isDragging := False;
    DragThresholdReached := False;

    //Schleife zur Kollisionsabfrage mit (fast) allen anderen Bildern
    CheckCollision(kanguru[kanguruzahl].bild, Image2, Collision);
    CheckMapCollision(kanguru[kanguruzahl].bild, MapCollision);

    if (Collision = true) or (MapCollision = true) then
    begin
      bogenkanguru[bogenkanguruzahl].attackradius.free;
      bogenkanguru[bogenkanguruzahl].bild.free;
      bogenkanguru[bogenkanguruzahl].Free;
      dec(bogenkanguruzahl);
    end
    else
    begin
      coins := coins - 2000;
      bogenkanguru[bogenkanguruzahl].attackradius.visible := false;
      bogenkanguru[bogenkanguruzahl].active := true;
    end;
  end;
end;
//Eis
procedure TForm5.Image5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  initDrag(X,Y,Button);
end;

procedure TForm5.Image5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if isDragging = true then
  begin
    if not DragThresholdReached then
    begin
      if (Abs(X - StartX) > DragThreshold) or (Abs(Y - StartY) > DragThreshold) then
      begin
        DragThresholdReached := true;
        inc(Eiskanguruzahl);
        Eiskanguru[EisKanguruzahl] := TEiskanguru.create(1, Mouse.CursorPos.X, Mouse.CursorPos.Y);
      end;
    end;
    if DragThresholdReached then
    begin
      Eiskanguru[Eiskanguruzahl].bild.left := Mouse.CursorPos.X;
      Eiskanguru[Eiskanguruzahl].bild.top := Mouse.CursorPos.Y;
      Eiskanguru[Eiskanguruzahl].attackradius.left := (Mouse.CursorPos.X + 48 - Eiskanguru[Eiskanguruzahl].range2);
      Eiskanguru[Eiskanguruzahl].attackradius.Top := (Mouse.CursorPos.Y + 48 - Eiskanguru[Eiskanguruzahl].range2);
    end;
  end;
end;

procedure TForm5.Image5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Collision, MapCollision : boolean;
begin
  if (Button = mbLeft) and (DragThresholdReached = true) then
  begin
    Collision := false;
    isDragging := False;
    DragThresholdReached := False;
    //Schleife zur Kollisionsabfrage mit (fast) allen anderen Bildern
    CheckCollision(kanguru[kanguruzahl].bild, Image2, Collision);
    CheckMapCollision(kanguru[kanguruzahl].bild, MapCollision);

    if (Collision = true) or (MapCollision = true) then
    begin
      Eiskanguru[Eiskanguruzahl].attackradius.free;
      Eiskanguru[Eiskanguruzahl].bild.free;
      Eiskanguru[Eiskanguruzahl].Free;
      dec(Eiskanguruzahl);
    end
    else
    begin
      coins := coins - 3000;
      Eiskanguru[Eiskanguruzahl].attackradius.visible := false;
      Eiskanguru[Eiskanguruzahl].active := true;
    end;
  end;
end;
//Ninja
procedure TForm5.Image6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  initDrag(X,Y,Button);
end;

procedure TForm5.Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if isDragging = true then
  begin
    if not DragThresholdReached then
    begin
      if (Abs(X - StartX) > DragThreshold) or (Abs(Y - StartY) > DragThreshold) then
      begin
        DragThresholdReached := true;
        inc(Ninjakanguruzahl);
        Ninjakanguru[NinjaKanguruzahl] := TNinjakanguru.create(1, Mouse.CursorPos.X, Mouse.CursorPos.Y);
      end;
    end;
    if DragThresholdReached then
    begin
      Ninjakanguru[Ninjakanguruzahl].bild.left := Mouse.CursorPos.X;
      Ninjakanguru[Ninjakanguruzahl].bild.top := Mouse.CursorPos.Y;
      Ninjakanguru[Ninjakanguruzahl].attackradius.left := (Mouse.CursorPos.X + 48 - Ninjakanguru[Ninjakanguruzahl].range2);
      Ninjakanguru[Ninjakanguruzahl].attackradius.Top := (Mouse.CursorPos.Y + 48 - Ninjakanguru[Ninjakanguruzahl].range2);
    end;
  end;
end;

procedure TForm5.Image6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Collision, MapCollision : boolean;
begin
  if (Button = mbLeft) and (DragThresholdReached = true) then
  begin
    Collision := false;
    isDragging := False;
    DragThresholdReached := False;
    //Schleife zur Kollisionsabfrage mit (fast) allen anderen Bildern
    CheckCollision(Ninjakanguru[Ninjakanguruzahl].bild, Image2, Collision);
    CheckMapCollision(Ninjakanguru[Ninjakanguruzahl].bild, MapCollision);

    if (Collision = true) or (MapCollision = true) then
    begin
      Ninjakanguru[Ninjakanguruzahl].attackradius.free;
      Ninjakanguru[Ninjakanguruzahl].bild.free;
      Ninjakanguru[Ninjakanguruzahl].Free;
      dec(Ninjakanguruzahl);
    end
    else
    begin
      coins := coins - 5000;
      Ninjakanguru[Ninjakanguruzahl].attackradius.visible := false;
      Ninjakanguru[Ninjakanguruzahl].active := true;
    end;
  end;
end;

//Zwischen Beschreibungen wechseln
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

//Timer
procedure TForm5.Timer1Timer(Sender: TObject);
var i: integer;
begin
           for i := 1 to 5 do
           tick(5, 0, 0, 0, 0, 1, Pinguin[i]);
           inc(ticksPassed);
end;

procedure TForm5.Button1Click(Sender: TObject);
begin

  Timer1.enabled := true;
end;

//Beschreibungen schließen
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

