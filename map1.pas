unit map1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, Buttons, Path, Pinguin, wave, kanguru, Collision;

type

  { TForm5 }

  TForm5 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
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
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
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
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image7MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
    //fürs Platzieren
    var isDragging, DragThresholdReached : boolean;
    StartX, StartY : integer;
    const DragThreshold = 96; //minimale Mausbewegung in px, um Dragging/kaufen zu starten
    UpgradeDamage = 25;
    UpgradeRange = 25;
    UpgradeSpeed = 1;
    var Kanguruzahl, Bogenkanguruzahl, Eiskanguruzahl, Ninjakanguruzahl, Zauberkanguruzahl : integer;
  //Positionsvariablen zum platzieren der Kängurus
    dx, dy: integer;
    procedure InitDrag(X, Y : integer; Button : TMouseButton);
    procedure CheckAllCollision(firstImage : TImage; var CollisionDetected : boolean; Sender : string);
  //KanguruClick und Menü-Zeugs
    var
    selectedKangurutype : string;
    selectedKanguruNumber : integer;
    procedure ShowMenu(kangurutype : string; damage, range, attackspeed, damagelvl, speedlvl, rangelvl: integer; cancamo : boolean);
    procedure sellKanguru();
  //Zauberangriff bewegen
    var ZauberBewegenClicked : boolean;
  public
    var
    ticksPassed, slowedTick : integer;
    Path: array[1..30] of Tpath;
    Pinguin: array[1..100] of TPinguin;
    HelmPinguin: array[1..100] of THelmPinguin;
    SchildPinguin: array[1..100] of TSchildPinguin;
    BossPinguin: array[1..100] of TBossPinguin;
    TarnPinguin: array[1..100] of TTarnPinguin;
    AllPinguin: array [1..300] of TPinguin;
    IndexOfKilled: array[1..5, 1..100] of integer;
    AmountKilled: array[1..5] of integer;
    KilledCount: integer;
    Pinguincount: integer;
    wave: array [1..100] of Twave;
    waveParams: array[1..100, 1..6] of integer;
    currentWave: integer;
    coins: integer;
    Kanguru : array[1..100] of TBoxerkanguru;
    Bogenkanguru : array[1..100] of TBogenkanguru;
    Zauberkanguru : array[1..100] of TZauberkanguru;
    Ninjakanguru : array[1..100] of TNinjakanguru;
    Eiskanguru : array[1..100] of TEiskanguru;
    playerHealth: integer;
    procedure KanguruClick(Sender: TObject);
    procedure ZauberMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure ZauberMouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure ZauberMouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure ConstructForm();
  end;

var
  Form5: TForm5;

implementation
uses Menu;
{$R *.lfm}

{ TForm5 }



procedure TForm5.FormCreate(Sender: TObject);
begin
   randomize();
   ConstructForm();
   //Weg der Map erstellen(dir, left, top, breit, hoch, map: integer)
   Path[1] := TPath.create(1, 0, 320, 620, 75, 1);
   Path[2] := Tpath.create(2, 620, 320, 75, 330, 1);
   Path[3] := Tpath.create(3, 300, 650, 400, 75, 1);
   Path[4] := Tpath.create(4, 250, 90, 75, 620, 1);
   Path[5] := Tpath.create(1, 250, 30, 740, 75, 1);
   Path[6] := Tpath.create(2, 990, 30, 75, 350, 1);
   Path[7] := Tpath.create(1, 990, 380, 400, 75, 1);
   //Paths, nur für Hindernisse (Platzierbarkeit Kängurus einschränken)
   Path[20] := TPath.create(1, 0, 0, 180, 100, 1);
   Path[21] := Tpath.create(1, 180, 0, 90, 20, 1);
   Path[22] := Tpath.create(1, 1290, 0, 180, 100,1);
   Path[23] := Tpath.create(1, 0, 650, 80, 430, 1);
   Path[24] := Tpath.create(1, 80, 800, 120, 330, 1);
   Path[25] := Tpath.create(1, 200, 900, 1200, 120, 1);
   Path[26] := Tpath.create(1, 1180, 690, 300, 400, 1);
   Path[27] := Tpath.create(1, 1120, 860, 100, 80, 1);
   Path[28] := Tpath.create(1, 1385, 550, 80, 80, 1);
   wave[1] := Twave.create(2, 2, 0, 0, 0, 1);
   currentWave := 1;
end;

procedure Tform5.ConstructForm();
var i, j : integer;
begin
  coins := 990000;
  label6.caption:= inttostr(coins);
  Pinguincount := 0;
  Timer1.enabled := false;
  Timer1.interval := 1;
  //Känguruzählervariablen
  Kanguruzahl := 0;
  Bogenkanguruzahl := 0;
  Eiskanguruzahl := 0;
  Ninjakanguruzahl := 0;
  Zauberkanguruzahl := 0;

  //Platzieren
  isDragging := false;
  ZauberBewegenClicked := false;
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

  Groupbox7.visible:=false;
  //vorkodierte Parameter für die wellen bis 20
  WaveParams[1, 1] := 2; //anzahl normale
  WaveParams[1, 2] := 0; //anzahl helm
  WaveParams[1, 3] := 0; //anzahl schild
  WaveParams[1, 4] := 0; //anzahl boss
  WaveParams[1, 5] := 0; //anzahl tarn

  WaveParams[2, 1] := 5;
  WaveParams[2, 2] := 0;
  WaveParams[2, 3] := 0;
  WaveParams[2, 4] := 0;
  WaveParams[2, 5] := 0;

  WaveParams[3, 1] := 7;
  WaveParams[3, 2] := 0;
  WaveParams[3, 3] := 0;
  WaveParams[3, 4] := 0;
  WaveParams[3, 5] := 0;

  WaveParams[4, 1] := 3;
  WaveParams[4, 2] := 2;
  WaveParams[4, 3] := 0;
  WaveParams[4, 4] := 0;
  WaveParams[4, 5] := 0;

  WaveParams[5, 1] := 4;
  WaveParams[5, 2] := 4;
  WaveParams[5, 3] := 0;
  WaveParams[5, 4] := 0;
  WaveParams[5, 5] := 0;

  WaveParams[6, 1] := 0;
  WaveParams[6, 2] := 7;
  WaveParams[6, 3] := 0;
  WaveParams[6, 4] := 0;
  WaveParams[6, 5] := 0;

  WaveParams[7, 1] := 6;   // Normaler Pinguin
  WaveParams[7, 2] := 3;   // Helm Pinguin
  WaveParams[7, 3] := 0;
  WaveParams[7, 4] := 0;
  WaveParams[7, 5] := 0;

  WaveParams[8, 1] := 4;
  WaveParams[8, 2] := 5;   // Fokus auf Helm Pinguin
  WaveParams[8, 3] := 0;
  WaveParams[8, 4] := 0;
  WaveParams[8, 5] := 0;

  WaveParams[9, 1] := 8;   // Schnelle Welle
  WaveParams[9, 2] := 2;
  WaveParams[9, 3] := 0;
  WaveParams[9, 4] := 0;
  WaveParams[9, 5] := 0;

  WaveParams[10, 1] := 3;
  WaveParams[10, 2] := 3;
  WaveParams[10, 3] := 1;  // Einführung Helm und Schild Pinguin
  WaveParams[10, 4] := 0;
  WaveParams[10, 5] := 0;

  WaveParams[11, 1] := 6;   // Mischung aus normal und Helm
  WaveParams[11, 2] := 4;
  WaveParams[11, 3] := 1;
  WaveParams[11, 4] := 0;
  WaveParams[11, 5] := 0;

  WaveParams[12, 1] := 5;
  WaveParams[12, 2] := 3;
  WaveParams[12, 3] := 3;
  WaveParams[12, 4] := 0;
  WaveParams[12, 5] := 0;

  WaveParams[13, 1] := 0;   // Einführung Tarn Pinguin
  WaveParams[13, 2] := 0;
  WaveParams[13, 3] := 0;
  WaveParams[13, 4] := 0;
  WaveParams[13, 5] := 6;

  WaveParams[14, 1] := 5;
  WaveParams[14, 2] := 2;
  WaveParams[14, 3] := 2;
  WaveParams[14, 4] := 0;
  WaveParams[14, 5] := 3;

  WaveParams[15, 1] := 0;   // Fokus auf Helm-Pinguine und Tarn
  WaveParams[15, 2] := 6;
  WaveParams[15, 3] := 2;
  WaveParams[15, 4] := 0;
  WaveParams[15, 5] := 4;

  WaveParams[16, 1] := 8;   // Rückkehr zu schnellen Wellen
  WaveParams[16, 2] := 0;
  WaveParams[16, 3] := 3;
  WaveParams[16, 4] := 0;
  WaveParams[16, 5] := 3;

  WaveParams[17, 1] := 0;   // Helm und Schild mit Tarn
  WaveParams[17, 2] := 0;
  WaveParams[17, 3] := 4;
  WaveParams[17, 4] := 0;
  WaveParams[17, 5] := 4;

  WaveParams[18, 1] := 4;
  WaveParams[18, 2] := 4;
  WaveParams[18, 3] := 3;
  WaveParams[18, 4] := 0;
  WaveParams[18, 5] := 4;

  WaveParams[19, 1] := 0;   // Herausforderung: viele starke Gegner
  WaveParams[19, 2] := 4;
  WaveParams[19, 3] := 5;
  WaveParams[19, 4] := 0;
  WaveParams[19, 5] := 3;

  WaveParams[20, 1] := 0;   // Einführung Boss
  WaveParams[20, 2] := 0;
  WaveParams[20, 3] := 4;
  WaveParams[20, 4] := 1;   // Boss Pinguin
  WaveParams[20, 5] := 3;

  //Form leeren (Pinguine und Kängurus)
  for i := 1 to 5 do
     for j := 1 to 100 do
         begin
              IndexOfKilled[i, j] := 0;
              AmountKilled[j] := 0;
         end;
  killedCount := 0;
  PlayerHealth := 5;
end;

procedure TForm5.Timer1Timer(Sender: TObject);
var i, j, switch: integer;
begin
   if playerHealth <= 0 then  //Abbruch wenn man keine hp mehr hat
   begin
        Timer1.enabled := false;
        label12.caption := '0';
        Button12.visible := true;
        Button13.visible := true;
   end;
       //ticks für jeden Pinguin ausführen
         for i := 1 to 100 do
         begin
         if Pinguin[i] <> nil then
            tick(1, Pinguin[i]);
         if HelmPinguin[i] <> nil then
            tick(1, HelmPinguin[i]);
         if SchildPinguin[i] <> nil then
            tick(1, SchildPinguin[i]);
         if BossPinguin[i] <> nil then
            tick(1, BossPinguin[i]);
         if TarnPinguin[i] <> nil then
            tick(1, TarnPinguin[i]);
         end;
         Panel1.Caption := inttostr(KilledCount) + ';' + inttostr(PinguinCount) + ';' + inttostr(Form5.currentWave);
         Panel2.Caption := inttostr(AmountKilled[1]) + ';' + inttostr(AmountKilled[2]);
         inc(ticksPassed);
   end;

//Angriffsbereich unsichtbar machen
procedure TForm5.Image1Click(Sender: TObject);
var i: integer;
begin
  for i:=1 to kanguruzahl do
  begin
    kanguru[i].attackradius.visible:=false;
  end;
  for i:=1 to bogenkanguruzahl do
  begin
    bogenkanguru[i].attackradius.visible:=false;
  end;
  for i:=1 to eiskanguruzahl do
  begin
    eiskanguru[i].attackradius.visible:=false;
  end;
  for i:=1 to ninjakanguruzahl do
  begin
    ninjakanguru[i].attackradius.visible:=false;
  end;
  for i:=1 to zauberkanguruzahl do
  begin
    zauberkanguru[i].attackradius.visible:=false;
  end;
  Groupbox7.visible:=false;
end;
//Form wechseln
procedure TForm5.Image2Click(Sender: TObject);
begin
  Form1.show;
  Form5.hide;
end;

//Känguru platzieren mit Kollisionsabfrage
procedure Tform5.CheckAllCollision(firstImage : TImage; var CollisionDetected : boolean; Sender : string);
var i : integer; Collision : boolean;
begin
  CollisionDetected := false;
  //Map und Pauseknopf
  CheckMapCollision(firstImage, Collision);
  if Collision = true then
  begin
    Collisiondetected := true;
    exit();
  end;
  CheckCollision(firstImage, Image2, Collision);
  if Collision = true then
  begin
    Collisiondetected := true;
    exit();
  end;
  //Kängurus
  if Sender = 'boxer' then
  begin
    for i:=1 to (kanguruzahl-1) do
    begin
      CheckCollision(firstImage, kanguru[i].bild, Collision);
      if Collision = true then
      begin
        Collisiondetected := true;
        exit();
      end;
    end;
  end
  else
  begin
  for i:=1 to (kanguruzahl) do
    begin
      CheckCollision(firstImage, kanguru[i].bild, Collision);
      if Collision = true then
      begin
        Collisiondetected := true;
        exit();
      end;
    end;
  end;

  if Sender = 'bogen' then
  begin
    for i:=1 to (bogenkanguruzahl-1) do
    begin
      CheckCollision(firstImage, bogenkanguru[i].bild, Collision);
      if Collision = true then
      begin
        Collisiondetected := true;
        exit();
      end;
    end;
  end
  else
  begin
  for i:=1 to (bogenkanguruzahl) do
    begin
      CheckCollision(firstImage, bogenkanguru[i].bild, Collision);
      if Collision = true then
      begin
        Collisiondetected := true;
        exit();
      end;
    end;
  end;

  if Sender = 'eis' then
  begin
    for i:=1 to (eiskanguruzahl-1) do
    begin
      CheckCollision(firstImage, eiskanguru[i].bild, Collision);
      if Collision = true then
      begin
        Collisiondetected := true;
        exit();
      end;
    end;
  end
  else
  begin
  for i:=1 to (eiskanguruzahl) do
    begin
      CheckCollision(firstImage, eiskanguru[i].bild, Collision);
      if Collision = true then
      begin
        Collisiondetected := true;
        exit();
      end;
    end;
  end;

  if Sender = 'ninja' then
  begin
    for i:=1 to (ninjakanguruzahl-1) do
    begin
      CheckCollision(firstImage, ninjakanguru[i].bild, Collision);
      if Collision = true then
      begin
        Collisiondetected := true;
        exit();
      end;
    end;
  end
  else
  begin
  for i:=1 to (ninjakanguruzahl) do
    begin
      CheckCollision(firstImage, ninjakanguru[i].bild, Collision);
      if Collision = true then
      begin
        Collisiondetected := true;
        exit();
      end;
    end;
  end;

  if Sender = 'zauber' then
  begin
    for i:=1 to (zauberkanguruzahl-1) do
    begin
      CheckCollision(firstImage, zauberkanguru[i].bild, Collision);
      if Collision = true then
      begin
        Collisiondetected := true;
        exit();
      end;
    end;
  end
  else
  begin
  for i:=1 to (zauberkanguruzahl) do
    begin
      CheckCollision(firstImage, zauberkanguru[i].bild, Collision);
      if Collision = true then
      begin
        Collisiondetected := true;
        exit();
      end;
    end;
  end;
  //Pfade
  for i:=1 to (Length(Path)) do
  begin
  if Path[i] <> nil then
  begin
    CheckCollision(firstImage, Path[i].bild, Collision);
    if Collision = true then
    begin
      Collisiondetected := true;
      exit();
    end;
  end;
  end;
end;

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

//Boxer
procedure TForm5.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  initDrag(X,Y,Button);
end;

procedure TForm5.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var Collision : boolean;
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
      Groupbox2.visible:=false;
      Groupbox3.visible:=false;
      Groupbox4.visible:=false;
      Groupbox5.visible:=false;
      Groupbox6.visible:=false;
      Groupbox7.visible:=false;
      kanguru[kanguruzahl].bild.left := Mouse.CursorPos.X;
      kanguru[kanguruzahl].bild.top := Mouse.CursorPos.Y;
      kanguru[kanguruzahl].attackradius.left := Mouse.CursorPos.X + 48 - kanguru[kanguruzahl].range2;
      kanguru[kanguruzahl].attackradius.Top := Mouse.CursorPos.Y + 48 - kanguru[kanguruzahl].range2;
      //Radius rot färben wenn versperrte Position
      CheckAllCollision(kanguru[kanguruzahl].bild, Collision, 'boxer');
      if (Collision = true) then
        kanguru[kanguruzahl].attackradius.brush.Color:=clMaroon
      else
        kanguru[kanguruzahl].attackradius.brush.Color:=clGray;
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

    CheckAllCollision(kanguru[kanguruzahl].bild, Collision, 'boxer');
    if (Collision = true) or (coins - kanguru[kanguruzahl].value < 0) then
    begin
      kanguru[kanguruzahl].destruct;
      dec(kanguruzahl);
    end
    else
    begin
      coins := coins - kanguru[kanguruzahl].value;
      kanguru[kanguruzahl].attackradius.visible := false;
      kanguru[kanguruzahl].setActive(1);
      label6.caption := inttostr(coins);
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
var Collision : boolean;
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
      Groupbox2.visible:=false;
      Groupbox3.visible:=false;
      Groupbox4.visible:=false;
      Groupbox5.visible:=false;
      Groupbox6.visible:=false;
      Groupbox7.visible:=false;
      bogenkanguru[bogenkanguruzahl].bild.left := Mouse.CursorPos.X;
      bogenkanguru[bogenkanguruzahl].bild.top := Mouse.CursorPos.Y;
      bogenkanguru[bogenkanguruzahl].attackradius.left := (Mouse.CursorPos.X + 48 - bogenkanguru[bogenkanguruzahl].range2);
      bogenkanguru[bogenkanguruzahl].attackradius.Top := (Mouse.CursorPos.Y + 48 - bogenkanguru[bogenkanguruzahl].range2);
      //Radius rot färben wenn versperrte Position
      CheckAllCollision(bogenkanguru[bogenkanguruzahl].bild, Collision, 'bogen');
      if (Collision = true) then
        bogenkanguru[bogenkanguruzahl].attackradius.brush.Color:=clMaroon
      else
        bogenkanguru[bogenkanguruzahl].attackradius.brush.Color:=clGray;
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

    CheckAllCollision(bogenkanguru[bogenkanguruzahl].bild, Collision, 'bogen');
    if (Collision = true) or (coins - bogenkanguru[bogenkanguruzahl].value < 0) then
    begin
      bogenkanguru[bogenkanguruzahl].destruct;
      dec(bogenkanguruzahl);
    end
    else
    begin
      coins := coins - bogenkanguru[bogenkanguruzahl].value;
      bogenkanguru[bogenkanguruzahl].attackradius.visible := false;
      bogenkanguru[bogenkanguruzahl].setactive(1);
      label6.caption := inttostr(coins);
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
var Collision : boolean;
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
      Groupbox2.visible:=false;
      Groupbox3.visible:=false;
      Groupbox4.visible:=false;
      Groupbox5.visible:=false;
      Groupbox6.visible:=false;
      Groupbox7.visible:=false;
      Eiskanguru[Eiskanguruzahl].bild.left := Mouse.CursorPos.X;
      Eiskanguru[Eiskanguruzahl].bild.top := Mouse.CursorPos.Y;
      Eiskanguru[Eiskanguruzahl].attackradius.left := (Mouse.CursorPos.X + 48 - Eiskanguru[Eiskanguruzahl].range2);
      Eiskanguru[Eiskanguruzahl].attackradius.Top := (Mouse.CursorPos.Y + 48 - Eiskanguru[Eiskanguruzahl].range2);
      //Radius rot färben wenn versperrte Position
      CheckAllCollision(Eiskanguru[Eiskanguruzahl].bild, Collision, 'eis');
      if (Collision = true) then
        Eiskanguru[Eiskanguruzahl].attackradius.brush.Color:=clMaroon
      else
        Eiskanguru[Eiskanguruzahl].attackradius.brush.Color:=clGray;
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

    CheckAllCollision(Eiskanguru[Eiskanguruzahl].bild, Collision, 'eis');
    if (Collision = true) or (coins - Eiskanguru[Eiskanguruzahl].value < 0) then
    begin
      eiskanguru[eiskanguruzahl].destruct;
      dec(Eiskanguruzahl);
    end
    else
    begin
      coins := coins - Eiskanguru[Eiskanguruzahl].value;
      Eiskanguru[Eiskanguruzahl].attackradius.visible := false;
      Eiskanguru[Eiskanguruzahl].setactive(1);
      label6.caption := inttostr(coins);
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
var Collision : boolean;
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
      Groupbox2.visible:=false;
      Groupbox3.visible:=false;
      Groupbox4.visible:=false;
      Groupbox5.visible:=false;
      Groupbox6.visible:=false;
      Groupbox7.visible:=false;
      Ninjakanguru[Ninjakanguruzahl].bild.left := Mouse.CursorPos.X;
      Ninjakanguru[Ninjakanguruzahl].bild.top := Mouse.CursorPos.Y;
      Ninjakanguru[Ninjakanguruzahl].attackradius.left := (Mouse.CursorPos.X + 48 - Ninjakanguru[Ninjakanguruzahl].range2);
      Ninjakanguru[Ninjakanguruzahl].attackradius.Top := (Mouse.CursorPos.Y + 48 - Ninjakanguru[Ninjakanguruzahl].range2);
      //Radius rot färben wenn versperrte Position
      CheckAllCollision(Ninjakanguru[Ninjakanguruzahl].bild, Collision, 'ninja');
      if (Collision = true) then
        Ninjakanguru[Ninjakanguruzahl].attackradius.brush.Color:=clMaroon
      else
        Ninjakanguru[Ninjakanguruzahl].attackradius.brush.Color:=clGray;
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

    CheckAllCollision(Ninjakanguru[Ninjakanguruzahl].bild, Collision, 'ninja');
    if (Collision = true) or (coins - Ninjakanguru[Ninjakanguruzahl].value < 0) then
    begin
      ninjakanguru[ninjakanguruzahl].destruct;
      dec(Ninjakanguruzahl);
    end
    else
    begin
      coins := coins - Ninjakanguru[Ninjakanguruzahl].value;
      Ninjakanguru[Ninjakanguruzahl].attackradius.visible := false;
      Ninjakanguru[Ninjakanguruzahl].setactive(1);
      label6.caption := inttostr(coins);
    end;
  end;
end;
//Zauberer
procedure TForm5.Image7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  initDrag(X,Y,Button);
end;

procedure TForm5.Image7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var Collision : boolean;
begin
  if isDragging = true then
  begin
    if not DragThresholdReached then
    begin
      if (Abs(X - StartX) > DragThreshold) or (Abs(Y - StartY) > DragThreshold) then
      begin
        DragThresholdReached := true;
        inc(zauberkanguruzahl);
        zauberkanguru[zauberKanguruzahl] := TZauberkanguru.create(1, Mouse.CursorPos.X, Mouse.CursorPos.Y);
      end;
    end;
    if DragThresholdReached then
    begin
      Groupbox2.visible:=false;
      Groupbox3.visible:=false;
      Groupbox4.visible:=false;
      Groupbox5.visible:=false;
      Groupbox6.visible:=false;
      Groupbox7.visible:=false;
      zauberkanguru[zauberkanguruzahl].bild.left := Mouse.CursorPos.X;
      zauberkanguru[zauberkanguruzahl].bild.top := Mouse.CursorPos.Y;
      zauberkanguru[zauberkanguruzahl].attackradius.left := Mouse.CursorPos.X + 48 - zauberkanguru[zauberkanguruzahl].range2;
      zauberkanguru[zauberkanguruzahl].attackradius.Top := Mouse.CursorPos.Y + 48 - zauberkanguru[zauberkanguruzahl].range2;
      //Radius rot färben wenn versperrte Position
      CheckAllCollision(zauberkanguru[zauberkanguruzahl].bild, Collision, 'zauber');
      if (Collision = true) then
        zauberkanguru[zauberkanguruzahl].attackradius.brush.Color:=clMaroon
      else
        zauberkanguru[zauberkanguruzahl].attackradius.brush.Color:=clGray;
    end;
  end;
end;

procedure TForm5.Image7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Collision, MapCollision : boolean;
    i, j: integer;
begin
  if (Button = mbLeft) and (DragThresholdReached = true) then
  begin
    Collision := false;
    isDragging := False;
    DragThresholdReached := False;

    CheckAllCollision(zauberkanguru[zauberkanguruzahl].bild, Collision, 'zauber');
    if (Collision = true) or (coins - zauberkanguru[zauberkanguruzahl].value < 0) then
    begin
      zauberkanguru[zauberkanguruzahl].destruct;
      dec(zauberkanguruzahl);
    end
    else
    begin
      coins := coins - zauberkanguru[zauberkanguruzahl].value;
      zauberkanguru[zauberkanguruzahl].attackradius.visible := false;
      zauberkanguru[zauberkanguruzahl].setActive(1);
      for i := 1 to 7 do
      if j <> 100 then
      begin
        if (Abs(path[i].x + path[i].width div 2 - (zauberkanguru[zauberkanguruzahl].bild.left + 48)) <= (path[i].width div 2 + zauberkanguru[zauberkanguruzahl].range2)) and
        (Abs(path[i].y + path[i].height div 2  - (zauberkanguru[zauberkanguruzahl].bild.top + 48)) <= (path[i].height div 2 + zauberkanguru[zauberkanguruzahl].range2)) then
        begin
          zauberkanguru[zauberkanguruzahl].Zauber := TZauberAngriff.create(1,zauberkanguru[zauberkanguruzahl].bild.left - zauberkanguru[zauberkanguruzahl].range2, zauberkanguru[zauberkanguruzahl].bild.top - zauberkanguru[zauberkanguruzahl].range2);
          zauberkanguru[zauberkanguruzahl].Zauber.active := true;
          j := 100;
          repeat
            begin
               zauberkanguru[zauberkanguruzahl].Zauber.x2 := zauberkanguru[zauberkanguruzahl].Zauber.x2 + 1;
               zauberkanguru[zauberkanguruzahl].Zauber.bild.left := zauberkanguru[zauberkanguruzahl].Zauber.x2 - 16;
               zauberkanguru[zauberkanguruzahl].Zauber.attackradius.left :=  zauberkanguru[zauberkanguruzahl].Zauber.x2 + 48 -  zauberkanguru[zauberkanguruzahl].Zauber.range2;
            end;
            until Abs(path[i].x + path[i].width div 2 - (zauberkanguru[zauberkanguruzahl].Zauber.x2)) <= (path[i].width div 2);
          repeat
            begin
               zauberkanguru[zauberkanguruzahl].Zauber.y2 := zauberkanguru[zauberkanguruzahl].Zauber.y2 + 1 ;
               zauberkanguru[zauberkanguruzahl].Zauber.bild.top := zauberkanguru[zauberkanguruzahl].Zauber.y2 - 16;
               zauberkanguru[zauberkanguruzahl].Zauber.attackradius.top :=  zauberkanguru[zauberkanguruzahl].Zauber.y2 + 48 -  zauberkanguru[zauberkanguruzahl].Zauber.range2;
            end;
            until Abs(path[i].y + path[i].height div 2 - (zauberkanguru[zauberkanguruzahl].Zauber.y2)) <= (path[i].height div 2);
        end;
      end;
      end;
      label6.caption := inttostr(coins);
    end;
end;
//Zauberangriff bewegen
procedure TForm5.Button14Click(Sender: TObject);
begin
  if ZauberBewegenClicked = false then
  begin
    zauberkanguru[selectedkangurunumber].Zauber.active:=false;
    button14.caption:= 'Abbrechen';
    bitbtn1.enabled:= false;
    button7.enabled:= false;
    button8.enabled:= false;
    zauberkanguru[selectedkangurunumber].zauber.DraggingEnabled:= true;
    ZauberBewegenClicked := true;
  end
  else
  begin
    zauberkanguru[selectedkangurunumber].zauber.active:=true;
    button14.caption:= 'Feuer bewegen';
    bitbtn1.enabled:= true;
    button7.enabled:= true;
    button8.enabled:= true;
    zauberkanguru[selectedkangurunumber].zauber.DraggingEnabled:= false;
    ZauberBewegenClicked := false;
  end;
end;

procedure Tform5.ZauberMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if zauberkanguru[selectedkangurunumber].zauber.DraggingEnabled = true then
  begin
    if Button = mbLeft then
    begin
      isDragging := true;
      DragThresholdReached := false;
      StartX :=  zauberkanguru[selectedkangurunumber].zauber.bild.left;
      StartY :=  zauberkanguru[selectedkangurunumber].zauber.bild.top;
    end;
  end;
end;

procedure TForm5.ZauberMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var collision : boolean; i : integer;
begin
  if isDragging = true then
  begin
    if not DragThresholdReached then
    begin
      if (Abs(X - StartX) > DragThreshold) or (Abs(Y - StartY) > DragThreshold) then
      begin
        DragThresholdReached := true;
      end;
    end;
    if DragThresholdReached then
    begin
      Groupbox2.visible:=false;
      Groupbox3.visible:=false;
      Groupbox4.visible:=false;
      Groupbox5.visible:=false;
      Groupbox6.visible:=false;
      zauberkanguru[selectedkangurunumber].zauber.bild.left := Mouse.CursorPos.X;
      zauberkanguru[selectedkangurunumber].zauber.bild.top := Mouse.CursorPos.Y;
      zauberkanguru[selectedkangurunumber].zauber.attackradius.left := Mouse.CursorPos.X + 48 - zauberkanguru[selectedkangurunumber].zauber.range2;
      zauberkanguru[selectedkangurunumber].zauber.attackradius.Top := Mouse.CursorPos.Y + 48 - zauberkanguru[selectedkangurunumber].zauber.range2;
      //Radius rot färben wenn versperrte Position
      for i:=1 to 7 do
      begin
        CheckCollision(zauberkanguru[selectedkangurunumber].zauber.bild, Path[i].Bild, Collision);
        if Collision = true {and (Abs(Mouse.CursorPos.X + 48 - (zauberkanguru[selectedkangurunumber].bild.left + 48)) <= (48 + zauberkanguru[selectedkangurunumber].range2)) and
        (Abs(Mouse.CursorPos.Y + 48 - (zauberkanguru[selectedkangurunumber].bild.top + 48)) <= (48 + zauberkanguru[selectedkangurunumber].range2))} then
        begin
          zauberkanguru[selectedkangurunumber].zauber.bild.Picture.LoadFromFile('images\Feuer.png');
          exit();
        end;
      end;
      if (Collision = true) {and (Abs(zauberkanguru[selectedkangurunumber].zauber.bild.left + 48 - (zauberkanguru[selectedkangurunumber].bild.left + 48)) <= (48 + zauberkanguru[selectedkangurunumber].range2)) and
        (Abs(zauberkanguru[selectedkangurunumber].zauber.bild.top + 48 - (zauberkanguru[selectedkangurunumber].bild.top + 48)) <= (48 + zauberkanguru[selectedkangurunumber].range2))} then
        zauberkanguru[selectedkangurunumber].zauber.bild.Picture.LoadFromFile('images\Feuer.png')
      else
        zauberkanguru[selectedkangurunumber].zauber.bild.Picture.LoadFromFile('images\Feuer_invalid.png');
    end;
  end;
end;

procedure Tform5.ZauberMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Collision : boolean;
    i : integer;
begin
  if (Button = mbLeft) and (DragThresholdReached = true) then
  zauberkanguru[selectedkangurunumber].zauber.bild.Picture.LoadFromFile('images\Feuer.png');
  zauberkanguru[selectedkangurunumber].zauber.active:=true;
  button14.caption:= 'Feuer bewegen';
  bitbtn1.enabled:= true;
  button7.enabled:= true;
  button8.enabled:= true;
  zauberkanguru[selectedkangurunumber].zauber.DraggingEnabled:= false;
  ZauberBewegenClicked := false;
  begin
    Collision := false;
    isDragging := False;
    DragThresholdReached := False;
    for i:=1 to 7 do
    begin
      CheckCollision(zauberkanguru[selectedkangurunumber].zauber.bild, Path[i].Bild, Collision);
      if Collision = true then
        exit();
    end;
    if Collision = false then
    begin
      zauberkanguru[selectedkangurunumber].zauber.bild.left := StartX;
      zauberkanguru[selectedkangurunumber].zauber.bild.top := StartY;
    end
    else
    begin
      zauberkanguru[selectedkangurunumber].zauber.active:=true;
      zauberkanguru[selectedkangurunumber].zauber.attackradius.left := zauberkanguru[selectedkangurunumber].zauber.bild.left + zauberkanguru[selectedkangurunumber].zauber.attackradius.width div 2;
      zauberkanguru[selectedkangurunumber].zauber.attackradius.top := zauberkanguru[selectedkangurunumber].zauber.bild.top + zauberkanguru[selectedkangurunumber].zauber.attackradius.height div 2;
    end;
  end;
end;

//Kängurumenü
procedure Tform5.KanguruClick(Sender: TObject);
var i : integer;
begin
  //alle Angriffsbereiche unsichtbar machen
  for i:=1 to kanguruzahl do
  begin
    kanguru[i].attackradius.visible:=false;
  end;
  for i:=1 to bogenkanguruzahl do
  begin
    bogenkanguru[i].attackradius.visible:=false;
  end;
  for i:=1 to eiskanguruzahl do
  begin
    eiskanguru[i].attackradius.visible:=false;
  end;
  for i:=1 to ninjakanguruzahl do
  begin
    ninjakanguru[i].attackradius.visible:=false;
  end;
  for i:=1 to zauberkanguruzahl do
  begin
    zauberkanguru[i].attackradius.visible:=false;
  end;
  //ShowMenu aufrufen und Angriffsbereich sichtbar machen mit Sender-Abfrage
  for i:=1 to kanguruzahl do
  begin
    if Kanguru[i].bild = Sender then
    begin
      selectedkangurutype:='boxer';
      selectedkangurunumber:=i;
      kanguru[i].attackradius.visible:=true;
      ShowMenu('boxer', kanguru[i].damage, kanguru[i].range2, kanguru[i].attackspeed, kanguru[i].damagelvl, kanguru[i].speedlvl, kanguru[i].rangelvl, kanguru[i].cancamo);
    end;
  end;
  for i:=1 to bogenkanguruzahl do
  begin
    if bogenKanguru[i].bild = Sender then
    begin
      selectedkangurutype:='bogen';
      selectedkangurunumber:=i;
      bogenkanguru[i].attackradius.visible:=true;
      ShowMenu('bogen', bogenkanguru[i].damage, bogenkanguru[i].range2, bogenkanguru[i].attackspeed, bogenkanguru[i].damagelvl, bogenkanguru[i].speedlvl, bogenkanguru[i].rangelvl, bogenkanguru[i].cancamo);
    end;
  end;
  for i:=1 to eiskanguruzahl do
  begin
    if eisKanguru[i].bild = Sender then
    begin
      selectedkangurutype:='eis';
      selectedkangurunumber:=i;
      eiskanguru[i].attackradius.visible:=true;
      ShowMenu('eis', eiskanguru[i].damage, eiskanguru[i].range2, eiskanguru[i].attackspeed, eiskanguru[i].damagelvl, eiskanguru[i].speedlvl, eiskanguru[i].rangelvl, eiskanguru[i].cancamo);
    end;
  end;
  for i:=1 to ninjakanguruzahl do
  begin
    if ninjaKanguru[i].bild = Sender then
    begin
      selectedkangurutype:='ninja';
      selectedkangurunumber:=i;
      ninjakanguru[i].attackradius.visible:=true;
      ShowMenu('ninja', ninjakanguru[i].damage, ninjakanguru[i].range2, ninjakanguru[i].attackspeed, ninjakanguru[i].damagelvl, ninjakanguru[i].speedlvl, ninjakanguru[i].rangelvl, ninjakanguru[i].cancamo);
    end;
  end;
  for i:=1 to zauberkanguruzahl do
  begin
    if zauberKanguru[i].bild = Sender then
    begin
      selectedkangurutype:='zauber';
      selectedkangurunumber:=i;
      zauberkanguru[i].attackradius.visible:=true;
      ShowMenu('zauber', zauberkanguru[i].damage, zauberkanguru[i].range2, zauberkanguru[i].attackspeed, zauberkanguru[i].damagelvl, zauberkanguru[i].speedlvl, zauberkanguru[i].rangelvl, zauberkanguru[i].cancamo);
    end;
  end;
  //Kängurus über Angriffsbereich bringen, sodass immer noch ansprechbar
  for i:=1 to kanguruzahl do
  begin
    kanguru[i].bild.bringtofront;
  end;
  for i:=1 to bogenkanguruzahl do
  begin
    bogenkanguru[i].bild.bringtofront;
  end;
  for i:=1 to eiskanguruzahl do
  begin
    eiskanguru[i].bild.bringtofront;
  end;
  for i:=1 to ninjakanguruzahl do
  begin
    ninjakanguru[i].bild.bringtofront;
  end;
  for i:=1 to zauberkanguruzahl do
  begin
    zauberkanguru[i].bild.bringtofront;
  end;
end;
//Menü anzeigen
procedure Tform5.ShowMenu(kangurutype : string; damage, range, attackspeed, damagelvl, speedlvl, rangelvl : integer; cancamo : boolean);
begin
  //Beschreibungen schließen
  Groupbox2.visible:=false;
  Groupbox3.visible:=false;
  Groupbox4.visible:=false;
  Groupbox5.visible:=false;
  Groupbox6.visible:=false;
  //Upgrademenü öffnen
  //Standardmenü
  Groupbox7.visible:=true;
  button9.visible:= true;
  label8.visible:= true;
  button10.visible:= true;
  label9.visible := true;
  button11.visible := false;
  label10.visible := false;
  button14.visible:= false;
  //Besonderheiten
  if  kangurutype = 'bogen' then
  begin
    panel11.caption:= 'Bogenkänguru';
    button11.visible := true;
    label10.visible := true;
  end
  else if  kangurutype = 'zauber' then
  begin
    panel11.caption:= 'Zauberkänguru';
    button9.visible:= false;
    label8.visible:= false;
    button10.visible:= false;
    label9.visible := false;
    button11.visible := true;   //Schimmer
    label10.visible := true;
    button14.visible:= true;
  end;
  panel12.caption := 'Schaden: '+inttostr(damage);
  panel13.caption := 'Angriffsgeschwindigkeit: '+inttostr(attackspeed);
  panel14.caption := 'Reichweite: '+inttostr(range);
  //Schadenupgrade Preis
  label7.Caption := inttostr(damagelvl)+'/5';
  if damagelvl = 5 then
  begin
    button8.caption := 'Max.';
    button8.enabled:=false;
  end
  else
  begin
    button8.enabled:=true;
    button8.Caption := inttostr(250+damagelvl*300)+'$';
  end;
  //Geschwindigkeitupgrade Preis
  label8.caption := inttostr(speedlvl)+'/5';
  if speedlvl = 5 then
  begin
    button9.caption := 'Max.';
    button9.enabled:=false;
  end
  else
  begin
    button9.enabled:=true;
    button9.caption := inttostr(300+speedlvl*200)+'$';
  end;
  //Reichweiteupgrade Preis
  label9.caption := inttostr(rangelvl)+'/5';
  if rangelvl = 5 then
  begin
    button10.caption := 'Max.';
    button10.enabled:=false;
  end
  else
  begin
    button10.enabled:=true;
    button10.caption := inttostr(400+rangelvl*300)+'$';
  end;
  //Camoupgrade
  if kangurutype = 'zauber' then
  begin
    if cancamo = true then
    begin
      panel15.caption := 'Schimmer: Ja';
      button11.caption := 'Max.';
    end
    else
      panel15.caption := 'Schimmer: Nein';
      button11.caption:= '5000$';
  end
  else
  begin
    if cancamo = true then
    begin
      panel15.caption := 'Bessere Sicht: Ja';
      button11.caption:= 'Max.';
    end
    else
      panel15.caption := 'Bessere Sicht: Nein';
      button11.caption:= '2000$';
  end;
  //Verkaufspreis
  if selectedkangurutype = 'boxer' then
  label11.caption:= inttostr(kanguru[selectedkangurunumber].value div 2)+'$'
  else if selectedkangurutype = 'bogen' then
  label11.caption:= inttostr(bogenkanguru[selectedkangurunumber].value div 2)+'$'
  else if selectedkangurutype = 'eis' then
  label11.caption:= inttostr(eiskanguru[selectedkangurunumber].value div 2)+'$'
  else if selectedkangurutype = 'ninja' then
  label11.caption:= inttostr(ninjakanguru[selectedkangurunumber].value div 2)+'$'
  else if selectedkangurutype = 'zauber' then
  label11.caption:= inttostr(zauberkanguru[selectedkangurunumber].value div 2)+'$';
end;
//Känguru verkaufen
procedure TForm5.sellKanguru();
var i : integer;
begin
  //halben Känguruwert erstatten, känguru zerstören, leere Position in Känguruarray mit anderem känguru füllen und känguruzahl um 1 verringern
  if selectedkangurutype = 'boxer' then
  begin
    kanguru[selectedkangurunumber].active := false;
    coins:= coins + (kanguru[selectedkangurunumber].value div 2);
    label6.caption:= inttostr(coins);
    kanguru[selectedkangurunumber].destruct;
    //"leere" Position im Array füllen, wenn nicht am Ende vom Array
    if selectedKanguruNumber <> kanguruzahl then
    begin
      for i:=selectedkangurunumber to (kanguruzahl-1) do
        kanguru[i]:=kanguru[i+1];
    end;
    dec(kanguruzahl);
  end
  else if  selectedkangurutype = 'bogen' then
  begin
    bogenkanguru[selectedkangurunumber].active := false;
    coins:= coins + (bogenkanguru[selectedkangurunumber].value div 2);
    label6.caption:= inttostr(coins);
    bogenkanguru[selectedkangurunumber].destruct;
    if selectedKanguruNumber <> kanguruzahl then
    begin
      for i:=selectedkangurunumber to (bogenkanguruzahl-1) do
        bogenkanguru[i]:=bogenkanguru[i+1];
    end;
    dec(bogenkanguruzahl);
  end
  else if  selectedkangurutype = 'eis' then
  begin
    eiskanguru[selectedkangurunumber].active := false;
    coins:= coins + (eiskanguru[selectedkangurunumber].value div 2);
    label6.caption:= inttostr(coins);
    eiskanguru[selectedkangurunumber].destruct;
    if selectedKanguruNumber <> eiskanguruzahl then
    begin
      for i:=selectedkangurunumber to (eiskanguruzahl-1) do
        eiskanguru[i]:=eiskanguru[i+1];
    end;
    dec(eiskanguruzahl);
  end
  else if  selectedkangurutype = 'ninja' then
  begin
    ninjakanguru[selectedkangurunumber].active := false;
    coins:= coins + (ninjakanguru[selectedkangurunumber].value div 2);
    label6.caption:= inttostr(coins);
    ninjakanguru[selectedkangurunumber].destruct;
    if selectedKanguruNumber <> ninjakanguruzahl then
    begin
      for i:=selectedkangurunumber to (ninjakanguruzahl-1) do
        ninjakanguru[i]:=ninjakanguru[i+1];
    end;
    dec(ninjakanguruzahl);
  end
  else if  selectedkangurutype = 'zauber' then
  begin
    zauberkanguru[selectedkangurunumber].active := false;
    coins:= coins + (Zauberkanguru[selectedkangurunumber].value div 2);
    label6.caption:= inttostr(coins);
    zauberkanguru[selectedkangurunumber].destruct;
    if selectedKanguruNumber <> zauberkanguruzahl then
    begin
      for i:=selectedkangurunumber to (zauberkanguruzahl-1) do
        zauberkanguru[i]:=zauberkanguru[i+1];
    end;
    dec(zauberkanguruzahl);
  end;
  Groupbox7.visible:=false;
end;

//Zwischen Beschreibungen wechseln
procedure TForm5.Image3Click(Sender: TObject);
begin
  Groupbox2.visible:=true;
  Groupbox3.visible:=false;
  Groupbox4.visible:=false;
  Groupbox5.visible:=false;
  Groupbox6.visible:=false;
  Groupbox7.visible:=false;
end;

procedure TForm5.Image4Click(Sender: TObject);
begin
  Groupbox3.visible:=true;
  Groupbox2.visible:=false;
  Groupbox4.visible:=false;
  Groupbox5.visible:=false;
  Groupbox6.visible:=false;
  Groupbox7.visible:=false;
end;

procedure TForm5.Image5Click(Sender: TObject);
begin
  Groupbox4.visible:=true;
  Groupbox3.visible:=false;
  Groupbox2.visible:=false;
  Groupbox5.visible:=false;
  Groupbox6.visible:=false;
  Groupbox7.visible:=false;
end;

procedure TForm5.Image6Click(Sender: TObject);
begin
  Groupbox5.visible:=true;
  Groupbox3.visible:=false;
  Groupbox4.visible:=false;
  Groupbox2.visible:=false;
  Groupbox6.visible:=false;
  Groupbox7.visible:=false;
end;

procedure TForm5.Image7Click(Sender: TObject);
begin
  Groupbox6.visible:=true;
  Groupbox3.visible:=false;
  Groupbox4.visible:=false;
  Groupbox5.visible:=false;
  Groupbox2.visible:=false;
  Groupbox7.visible:=false;
end;

//Timer

procedure TForm5.Button1Click(Sender: TObject);
begin
  Timer1.enabled := true;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
  sellkanguru();
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

procedure TForm5.Button7Click(Sender: TObject);
begin
  Groupbox7.visible := false;
end;
//Upgrades
//Damage
procedure TForm5.Button8Click(Sender: TObject);
begin
  if selectedkangurutype = 'boxer' then
  begin
    if coins - (250+kanguru[selectedkangurunumber].damagelvl*300) >= 0 then
    begin
      coins:= coins - (250+kanguru[selectedkangurunumber].damagelvl*300);
      kanguru[selectedkangurunumber].value := kanguru[selectedkangurunumber].value + (250+kanguru[selectedkangurunumber].damagelvl*300);
      inc(kanguru[selectedkangurunumber].damagelvl);
      kanguru[selectedkangurunumber].damage := kanguru[selectedkangurunumber].damage + UpgradeDamage;
      label7.caption:=inttostr(kanguru[selectedkangurunumber].damagelvl) + '/5';
      panel12.Caption:= 'Schaden: ' + inttostr(kanguru[selectedkangurunumber].damage);
      button8.Caption := inttostr(250+kanguru[selectedkangurunumber].damagelvl*300)+'$';
    end;
    if kanguru[selectedkangurunumber].damagelvl >=5 then
    begin
      button8.enabled:=false;
      button8.caption:='Max.';
    end;
    label11.caption:= inttostr(kanguru[selectedkangurunumber].value div 2)+'$'
  end
  else if selectedkangurutype = 'bogen' then
  begin
    if coins - (250+bogenkanguru[selectedkangurunumber].damagelvl*300) >= 0 then
    begin
      coins:= coins - (250+bogenkanguru[selectedkangurunumber].damagelvl*300);
      bogenkanguru[selectedkangurunumber].value := bogenkanguru[selectedkangurunumber].value + (250+bogenkanguru[selectedkangurunumber].damagelvl*300);
      inc(bogenkanguru[selectedkangurunumber].damagelvl);
      bogenkanguru[selectedkangurunumber].damage := bogenkanguru[selectedkangurunumber].damage + UpgradeDamage;
      label7.caption:=inttostr(bogenkanguru[selectedkangurunumber].damagelvl) + '/5';
      panel12.Caption:= 'Schaden: ' + inttostr(bogenkanguru[selectedkangurunumber].damage);
      button8.Caption := inttostr(250+bogenkanguru[selectedkangurunumber].damagelvl*300)+'$';
    end;
    if bogenkanguru[selectedkangurunumber].damagelvl >=5 then
    begin
      button8.enabled:=false;
      button8.caption:='Max.';
    end;
    label11.caption:= inttostr(bogenkanguru[selectedkangurunumber].value div 2)+'$'
  end
  else if selectedkangurutype = 'eis' then
  begin
    if coins - (250+eiskanguru[selectedkangurunumber].damagelvl*300) >= 0 then
    begin
      coins:= coins - (250+eiskanguru[selectedkangurunumber].damagelvl*300);
      eiskanguru[selectedkangurunumber].value := eiskanguru[selectedkangurunumber].value + (250+eiskanguru[selectedkangurunumber].damagelvl*300);
      inc(eiskanguru[selectedkangurunumber].damagelvl);
      eiskanguru[selectedkangurunumber].damage := eiskanguru[selectedkangurunumber].damage + UpgradeDamage;
      label7.caption:=inttostr(eiskanguru[selectedkangurunumber].damagelvl) + '/5';
      panel12.Caption:= 'Schaden: ' + inttostr(eiskanguru[selectedkangurunumber].damage);
      button8.Caption := inttostr(250+eiskanguru[selectedkangurunumber].damagelvl*300)+'$';
    end;
    if eiskanguru[selectedkangurunumber].damagelvl >=5 then
    begin
      button8.enabled:=false;
      button8.caption:='Max.';
    end;
    label11.caption:= inttostr(eiskanguru[selectedkangurunumber].value div 2)+'$';
  end
  else if selectedkangurutype = 'ninja' then
  begin
    if coins - (250+ninjakanguru[selectedkangurunumber].damagelvl*300) >= 0 then
    begin
      coins:= coins - (250+ninjakanguru[selectedkangurunumber].damagelvl*300);
      ninjakanguru[selectedkangurunumber].value := ninjakanguru[selectedkangurunumber].value + (250+ninjakanguru[selectedkangurunumber].damagelvl*300);
      inc(ninjakanguru[selectedkangurunumber].damagelvl);
      ninjakanguru[selectedkangurunumber].damage := ninjakanguru[selectedkangurunumber].damage + UpgradeDamage;
      label7.caption:=inttostr(ninjakanguru[selectedkangurunumber].damagelvl) + '/5';
      panel12.Caption:= 'Schaden: ' + inttostr(ninjakanguru[selectedkangurunumber].damage);
      button8.Caption := inttostr(250+ninjakanguru[selectedkangurunumber].damagelvl*300)+'$';
    end;
    if ninjakanguru[selectedkangurunumber].damagelvl >=5 then
    begin
      button8.enabled:=false;
      button8.caption:='Max.';
    end;
    label11.caption:= inttostr(ninjakanguru[selectedkangurunumber].value div 2)+'$';
  end
  else if selectedkangurutype = 'zauber' then
  begin
    if coins - (250+zauberkanguru[selectedkangurunumber].damagelvl*300) >= 0 then
    begin
      coins:= coins - (250+zauberkanguru[selectedkangurunumber].damagelvl*300);
      zauberkanguru[selectedkangurunumber].value := zauberkanguru[selectedkangurunumber].value + (250+zauberkanguru[selectedkangurunumber].damagelvl*300);
      inc(zauberkanguru[selectedkangurunumber].damagelvl);
      zauberkanguru[selectedkangurunumber].damage := zauberkanguru[selectedkangurunumber].damage + UpgradeDamage;
      label7.caption:=inttostr(zauberkanguru[selectedkangurunumber].damagelvl) + '/5';
      panel12.Caption:= 'Schaden: ' + inttostr(zauberkanguru[selectedkangurunumber].damage);
      button8.Caption := inttostr(250+zauberkanguru[selectedkangurunumber].damagelvl*300)+'$';
    end;
    if zauberkanguru[selectedkangurunumber].damagelvl >=5 then
    begin
      button8.enabled:=false;
      button8.caption:='Max.';
    end;
    label11.caption:= inttostr(zauberkanguru[selectedkangurunumber].value div 2)+'$';
  end;
  label6.caption:= inttostr(coins);
end;
//Speed
procedure TForm5.Button9Click(Sender: TObject);
begin
  if selectedkangurutype = 'boxer' then
  begin
  if coins - (250+kanguru[selectedkangurunumber].speedlvl*200) >= 0 then
    begin
      coins:= coins - (300+kanguru[selectedkangurunumber].speedlvl*200);
      kanguru[selectedkangurunumber].value := kanguru[selectedkangurunumber].value + (300+kanguru[selectedkangurunumber].speedlvl*200);
      inc(kanguru[selectedkangurunumber].Speedlvl);
      kanguru[selectedkangurunumber].attackSpeed := kanguru[selectedkangurunumber].attackSpeed - UpgradeSpeed;
      label8.caption:=inttostr(kanguru[selectedkangurunumber].Speedlvl) + '/5';
      panel13.Caption:= 'Angriffsgeschwindigkeit: ' + inttostr(kanguru[selectedkangurunumber].attackSpeed);
      button9.Caption := inttostr(300+kanguru[selectedkangurunumber].speedlvl*200)+'$';
    end;
    if kanguru[selectedkangurunumber].Speedlvl >=5 then
    begin
      button9.enabled:=false;
      button9.caption:='Max.';
    end;
    label11.caption:= inttostr(kanguru[selectedkangurunumber].value div 2)+'$';
  end
  else if selectedkangurutype = 'bogen' then
  begin
    if coins - (250+bogenkanguru[selectedkangurunumber].speedlvl*200) >= 0 then
    begin
      coins:= coins - (300+bogenkanguru[selectedkangurunumber].speedlvl*200);
      bogenkanguru[selectedkangurunumber].value := bogenkanguru[selectedkangurunumber].value + (300+bogenkanguru[selectedkangurunumber].speedlvl*200);
      inc(bogenkanguru[selectedkangurunumber].Speedlvl);
      bogenkanguru[selectedkangurunumber].attackSpeed := bogenkanguru[selectedkangurunumber].attackSpeed - UpgradeSpeed;
      label8.caption:=inttostr(bogenkanguru[selectedkangurunumber].Speedlvl) + '/5';
      panel13.Caption:= 'Angriffsgeschwindigkeit: ' + inttostr(bogenkanguru[selectedkangurunumber].attackSpeed);
      button9.Caption := inttostr(300+bogenkanguru[selectedkangurunumber].speedlvl*200)+'$';
    end;
    if bogenkanguru[selectedkangurunumber].Speedlvl >=5 then
    begin
      button9.enabled:=false;
      button9.caption:='Max.';
    end;
    label11.caption:= inttostr(bogenkanguru[selectedkangurunumber].value div 2)+'$';
  end
  else if selectedkangurutype = 'eis' then
  begin
    if coins - (250+eiskanguru[selectedkangurunumber].speedlvl*200) >= 0 then
    begin
      coins:= coins - (300+eiskanguru[selectedkangurunumber].speedlvl*200);
      eiskanguru[selectedkangurunumber].value := eiskanguru[selectedkangurunumber].value + (300+eiskanguru[selectedkangurunumber].speedlvl*200);
      inc(eiskanguru[selectedkangurunumber].Speedlvl);
      eiskanguru[selectedkangurunumber].attackSpeed := eiskanguru[selectedkangurunumber].attackSpeed - UpgradeSpeed;
      label8.caption:=inttostr(eiskanguru[selectedkangurunumber].Speedlvl) + '/5';
      panel13.Caption:= 'Angriffsgeschwindigkeit: ' + inttostr(eiskanguru[selectedkangurunumber].attackSpeed);
      button9.Caption := inttostr(300+eiskanguru[selectedkangurunumber].speedlvl*200)+'$';
    end;
    if eiskanguru[selectedkangurunumber].Speedlvl >=5 then
    begin
      button9.enabled:=false;
      button9.caption:='Max.';
    end;
    label11.caption:= inttostr(eiskanguru[selectedkangurunumber].value div 2)+'$';
  end
  else if selectedkangurutype = 'ninja' then
  begin
    if coins - (250+ninjakanguru[selectedkangurunumber].speedlvl*200) >= 0 then
    begin
      coins:= coins - (300+ninjakanguru[selectedkangurunumber].speedlvl*200);
      ninjakanguru[selectedkangurunumber].value := ninjakanguru[selectedkangurunumber].value + (300+ninjakanguru[selectedkangurunumber].speedlvl*200);
      inc(ninjakanguru[selectedkangurunumber].Speedlvl);
      ninjakanguru[selectedkangurunumber].attackSpeed := ninjakanguru[selectedkangurunumber].attackSpeed - UpgradeSpeed;
      label8.caption:=inttostr(ninjakanguru[selectedkangurunumber].Speedlvl) + '/5';
      panel13.Caption:= 'Angriffsgeschwindigkeit: ' + inttostr(ninjakanguru[selectedkangurunumber].attackSpeed);
      button9.Caption := inttostr(300+ninjakanguru[selectedkangurunumber].speedlvl*200)+'$';
    end;
    if ninjakanguru[selectedkangurunumber].Speedlvl >=5 then
    begin
      button9.enabled:=false;
      button9.caption:='Max.';
    end;
    label11.caption:= inttostr(kanguru[selectedkangurunumber].value div 2)+'$';
  end;
  label6.caption:= inttostr(coins);
end;
//range
procedure TForm5.Button10Click(Sender: TObject);
begin
  if selectedkangurutype = 'boxer' then
  begin
    if coins - (250+kanguru[selectedkangurunumber].speedlvl*200) >= 0 then
    begin
      coins:= coins - (400+kanguru[selectedkangurunumber].rangelvl*300);
      kanguru[selectedkangurunumber].value := kanguru[selectedkangurunumber].value + (400+kanguru[selectedkangurunumber].rangelvl*300);
      inc(kanguru[selectedkangurunumber].rangelvl);
      kanguru[selectedkangurunumber].range2 := kanguru[selectedkangurunumber].range2 + UpgradeRange;
      label9.caption:=inttostr(kanguru[selectedkangurunumber].rangelvl) + '/5';
      panel14.Caption:= 'Reichweite: ' + inttostr(kanguru[selectedkangurunumber].range2);
      button10.Caption := inttostr(400+kanguru[selectedkangurunumber].rangelvl*300)+'$';
      label11.caption:= inttostr(kanguru[selectedkangurunumber].value div 2)+'$';
    end;
    if kanguru[selectedkangurunumber].rangelvl >=5 then
    begin
      button10.enabled:=false;
      button10.caption:='Max.';
    end;
    kanguru[selectedkangurunumber].attackradius.Width := kanguru[selectedkangurunumber].range2*2;
    kanguru[selectedkangurunumber].attackradius.Height := kanguru[selectedkangurunumber].range2*2;
    kanguru[selectedkangurunumber].attackradius.left := kanguru[selectedkangurunumber].bild.left + 48 - kanguru[selectedkangurunumber].range2;
    kanguru[selectedkangurunumber].attackradius.top := kanguru[selectedkangurunumber].bild.top + 48 - kanguru[selectedkangurunumber].range2;
  end
  else if selectedkangurutype = 'bogen' then
  begin
    if coins - (250+bogenkanguru[selectedkangurunumber].speedlvl*200) >= 0 then
    begin
      coins:= coins - (400+bogenkanguru[selectedkangurunumber].rangelvl*300);
      bogenkanguru[selectedkangurunumber].value := bogenkanguru[selectedkangurunumber].value + (400+bogenkanguru[selectedkangurunumber].rangelvl*300);
      inc(bogenkanguru[selectedkangurunumber].rangelvl);
      bogenkanguru[selectedkangurunumber].range2 := bogenkanguru[selectedkangurunumber].range2 + UpgradeRange;
      label9.caption:=inttostr(bogenkanguru[selectedkangurunumber].rangelvl) + '/5';
      panel14.Caption:= 'Reichweite: ' + inttostr(bogenkanguru[selectedkangurunumber].range2);
      button10.Caption := inttostr(400+bogenkanguru[selectedkangurunumber].rangelvl*300)+'$';
      label11.caption:= inttostr(bogenkanguru[selectedkangurunumber].value div 2)+'$';
    end;
    if bogenkanguru[selectedkangurunumber].rangelvl >=5 then
    begin
      button10.enabled:=false;
      button10.caption:='Max.';
    end;
    bogenkanguru[selectedkangurunumber].attackradius.Width := bogenkanguru[selectedkangurunumber].range2*2;
    bogenkanguru[selectedkangurunumber].attackradius.Height := bogenkanguru[selectedkangurunumber].range2*2;
    bogenkanguru[selectedkangurunumber].attackradius.left := bogenkanguru[selectedkangurunumber].bild.left + 48 - bogenkanguru[selectedkangurunumber].range2;
    bogenkanguru[selectedkangurunumber].attackradius.top := bogenkanguru[selectedkangurunumber].bild.top + 48 - bogenkanguru[selectedkangurunumber].range2;
  end
  else if selectedkangurutype = 'eis' then
  begin
    if coins - (250+eiskanguru[selectedkangurunumber].speedlvl*200) >= 0 then
    begin
      coins:= coins - (400+eiskanguru[selectedkangurunumber].rangelvl*300);
      eiskanguru[selectedkangurunumber].value := eiskanguru[selectedkangurunumber].value + (400+eiskanguru[selectedkangurunumber].rangelvl*300);
      inc(eiskanguru[selectedkangurunumber].rangelvl);
      eiskanguru[selectedkangurunumber].range2 := eiskanguru[selectedkangurunumber].range2 + UpgradeRange;
      label9.caption:=inttostr(eiskanguru[selectedkangurunumber].rangelvl) + '/5';
      panel14.Caption:= 'Reichweite: ' + inttostr(eiskanguru[selectedkangurunumber].range2);
      button10.Caption := inttostr(400+eiskanguru[selectedkangurunumber].rangelvl*300)+'$';
      label11.caption:= inttostr(eiskanguru[selectedkangurunumber].value div 2)+'$';
    end;
    if eiskanguru[selectedkangurunumber].rangelvl >=5 then
    begin
      button10.enabled:=false;
      button10.caption:='Max.';
    end;
    eiskanguru[selectedkangurunumber].attackradius.Width := eiskanguru[selectedkangurunumber].range2*2;
    eiskanguru[selectedkangurunumber].attackradius.Height := eiskanguru[selectedkangurunumber].range2*2;
    eiskanguru[selectedkangurunumber].attackradius.left := eiskanguru[selectedkangurunumber].bild.left + 48 - eiskanguru[selectedkangurunumber].range2;
    eiskanguru[selectedkangurunumber].attackradius.top := eiskanguru[selectedkangurunumber].bild.top + 48 - eiskanguru[selectedkangurunumber].range2;
  end
  else if selectedkangurutype = 'ninja' then
  begin
    if coins - (250+ninjakanguru[selectedkangurunumber].speedlvl*200) >= 0 then
    begin
      coins:= coins - (400+ninjakanguru[selectedkangurunumber].rangelvl*300);
      ninjakanguru[selectedkangurunumber].value := ninjakanguru[selectedkangurunumber].value + (400+ninjakanguru[selectedkangurunumber].rangelvl*300);
      inc(ninjakanguru[selectedkangurunumber].rangelvl);
      ninjakanguru[selectedkangurunumber].range2 := ninjakanguru[selectedkangurunumber].range2 + UpgradeRange;
      label9.caption:=inttostr(ninjakanguru[selectedkangurunumber].rangelvl) + '/5';
      panel14.Caption:= 'Reichweite: ' + inttostr(ninjakanguru[selectedkangurunumber].range2);
      button10.Caption := inttostr(400+ninjakanguru[selectedkangurunumber].rangelvl*300)+'$';
      label11.caption:= inttostr(ninjakanguru[selectedkangurunumber].value div 2)+'$';
    end;
    if ninjakanguru[selectedkangurunumber].rangelvl >=5 then
    begin
      button10.enabled:=false;
      button10.caption:='Max.';
    end;
    ninjakanguru[selectedkangurunumber].attackradius.Width := ninjakanguru[selectedkangurunumber].range2*2;
    ninjakanguru[selectedkangurunumber].attackradius.Height := ninjakanguru[selectedkangurunumber].range2*2;
    ninjakanguru[selectedkangurunumber].attackradius.left := ninjakanguru[selectedkangurunumber].bild.left + 48 - ninjakanguru[selectedkangurunumber].range2;
    ninjakanguru[selectedkangurunumber].attackradius.top := ninjakanguru[selectedkangurunumber].bild.top + 48 - ninjakanguru[selectedkangurunumber].range2;
  end;
  label6.caption:= inttostr(coins);
end;
//CanCamo
procedure TForm5.Button11Click(Sender: TObject);
begin
  if selectedkangurutype = 'bogen' then
  begin
    if coins - 2000 >= 0 then
    begin
      coins := coins-2000;
      bogenkanguru[selectedkangurunumber].cancamo:=true;
      label10.caption:='1/1';
      panel15.Caption:= 'Bessere Sicht: Ja';
      button11.enabled:=false;
      button11.caption:= 'Max.';
      bogenkanguru[selectedkangurunumber].value := bogenkanguru[selectedkangurunumber].value + 2000;
      label11.caption:= inttostr(bogenkanguru[selectedkangurunumber].value div 2)+'$';
    end;
  end
  else if selectedkangurutype = 'zauber' then
  begin
    if coins - 5000 >= 0 then
    begin
      coins := coins-5000;
      zauberkanguru[selectedkangurunumber].cancamo := true;
      label10.caption:='1/1';
      panel15.Caption:= 'Schimmer: Ja' ;
      button11.enabled:=false;
      button11.caption:= 'Max.';
      zauberkanguru[selectedkangurunumber].value := zauberkanguru[selectedkangurunumber].value + 5000;
      label11.caption:= inttostr(zauberkanguru[selectedkangurunumber].value div 2)+'$';
    end;
  end;
  label6.caption:= inttostr(coins);
end;

procedure TForm5.Button12Click(Sender: TObject);
begin
  Form1.show;
  Form5.close;
end;
//beim erneut versuchen
procedure TForm5.Button13Click(Sender: TObject);
var i, j: integer;
    Pinguintemp: TPinguin;
begin
  //alle Kangurus entfernen
for i := 1 to 100 do
    begin
      if Kanguru[i] <> nil then
      begin
         selectedkangurutype := 'boxer';
         selectedKanguruNumber := i;
         sellkanguru();
      end;
      if BogenKanguru[i] <> nil then
      begin
         selectedkangurutype := 'bogen';
         selectedKanguruNumber := i;
         sellkanguru();
      end;
      if EisKanguru[i] <> nil then
      begin
         selectedkangurutype := 'eis';
         selectedKanguruNumber := i;
         sellkanguru();
      end;
      if NinjaKanguru[i] <> nil then
      begin
         selectedkangurutype := 'ninja';
         selectedKanguruNumber := i;
      end;
    end;
      {if ZauberKanguru[i] <> nil then
      begin
         selectedkangurutype := 'zauber';
         selectedKanguruNumber := i;
      end;}
      //Pinguine wegteleportieren
      for j := 1 to 5 do
          for i := 1 to 100 do
          begin
            if (j = 1) and (Pinguin[i] <> nil) then
               Pinguintemp := Pinguin[i]
            else if (j = 2) and (HelmPinguin[i] <> nil)  then
               Pinguintemp := HelmPinguin[i]
            else if (j = 3) and (SchildPinguin[i] <> nil)  then
               Pinguintemp := SchildPinguin[i]
            else if (j = 4) and (BossPinguin[i] <> nil)  then
               Pinguintemp := BossPinguin[i]
            else if (j = 5) and (TarnPinguin[i] <> nil)  then
               Pinguintemp := TarnPinguin[i];
            begin
              if Pinguintemp.x > -10000 then
                begin
                   inc(Form5.AmountKilled[Pinguintemp.art]);
                   inc(Form5.killedCount);
                end;
                   Pinguintemp.currentPath := 100;
                   Pinguintemp.x := -10000;
                   Pinguintemp.bild.left := Pinguintemp.x;
                   Pinguintemp.hpBar.Left := Pinguintemp.x;
                   Pinguintemp.lab.left := Pinguintemp.x;
                   Form5.IndexOfKilled[Pinguintemp.art, Form5.AmountKilled[Pinguintemp.art]] := Pinguintemp.index;
            end;
          end;
     for i := 1 to 5 do
         for j := 1 to 100 do
             begin
                  Form5.IndexOfKilled[i, j] := 0;
                  Form5.AmountKilled[j] := 0;
             end;
     //restlichen nötigen Variablen zutücksetzen
       currentWave := 1;
       wave[1] := Twave.create(2, 2, 0, 0, 0, 1);
       Timer1.enabled := true;
       ConstructForm();
       Button12.visible := false;
       Button13.visible := false;

    end;

end.

