unit kanguru;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Path, Pinguin;

type TKanguru = class
  public
    width, height : integer;
    bild: Timage;
    attackradius : TShape;
    damage, range2 : integer; //range2 weil debugger sonst meckert wegen range in create()
    attackspeed : real;
    cancamo : boolean;
    active : boolean;
    constructor create(map, x, y, range : integer);
    procedure attack(map: integer; Pinguin: TPinguin; Kanguruart: string);
  end;

  TBoxerkanguru = class(TKanguru)
  public
    constructor create(map, x, y : integer);
  end;

  TBogenkanguru = class(TKanguru)
  public
    constructor create(map, x, y : integer);
  end;

  TEiskanguru = class(Tkanguru)
    constructor create(map, x, y : integer);
  end;

  TNinjakanguru = class(Tkanguru)
    constructor create(map, x, y : integer);
  end;


  TZauberkanguru = class(Tkanguru)
    constructor create(map, x, y : integer);
  end;
implementation

  Uses map2, map1;



constructor Tkanguru.create(map, x, y, range : integer);
  begin
    inherited create;
    //Angriffsumkreis erstellen
    if map = 1 then
    begin
      self.attackradius := TShape.Create(Form5);
      self.attackradius.Parent := Form5;
    end
    else if map = 2 then
    begin
      self.attackradius := TShape.Create(Form6);
      self.attackradius.Parent := Form6;
    end;
    self.attackradius.Width := range*2;
    self.attackradius.Height := range*2;
    self.attackradius.shape := stCircle;
    self.attackradius.brush.color := clGray;
    self.attackradius.brush.style := bsCross;
    self.attackradius.left := x + 48 - range; //range muss vielleicht geändert werden, dass hier ist falls 1 range = 1 pixel
    self.attackradius.top := y + 48 - range; //ebd.
    self.attackradius.visible := true;
    //bild erstellen
    if map = 1 then
    begin
      self.bild := TImage.Create(Form5);
      self.bild.Parent := Form5;
    end
    else if map = 2 then
    begin
      self.bild := TImage.Create(Form6);
      self.bild.Parent := Form6;
    end;
    //bild formatieren
    self.bild.Width := 96;
    self.bild.Height := 96;
    self.bild.stretch := true;
    self.bild.left := x;
    self.bild.top := y;
    self.bild.Visible := True;

    active := false;
  end;

  constructor TBoxerkanguru.create(map, x, y : integer);
  begin
    damage := 50;
    range2 := 150;
    attackspeed := 0.5;
    cancamo := false;
    inherited create(map, x, y, range2);
    self.bild.Picture.LoadFromFile('images\Boxerkanguru.png');
  end;

  constructor TBogenkanguru.create(map, x, y : integer);
  begin
    damage := 150;
    range2 := 300;
    attackspeed := 1;
    cancamo := false;
    inherited create(map, x, y, range2);
    self.bild.Picture.LoadFromFile('images\Bogenguru.png');
  end;

  constructor TEiskanguru.create(map, x, y : integer);
  begin
    damage := 25;
    range2 := 150;
    attackspeed := 0.5;
    cancamo := false;
    inherited create(map, x, y, range2);
    self.bild.Picture.LoadFromFile('images\Eisguru.png');
  end;

  constructor TNinjakanguru.create(map, x, y : integer);
  begin
    damage := 75;
    range2 := 225;
    attackspeed := 1;
    cancamo := true;
    inherited create(map, x, y, range2);
    self.bild.Picture.LoadFromFile('images\Ninja.png');
  end;

  constructor TZauberkanguru.create(map, x, y : integer);
  begin

  end;

  procedure Tkanguru.attack(map: integer; Pinguin: TPinguin; Kanguruart: string);
  var i, j: integer;
begin
  begin
  // Prüfen, ob irgendein Teil von `Pinguin` innerhalb des Kreises liegt (von chatgpt)
  if self <> nil then
    begin
  if (Sqr(Pinguin.X + 48 - (self.attackradius.Left + self.attackradius.Width div 2)) +
      Sqr(Pinguin.Y + 48 - (self.attackradius.Top + self.attackradius.Height div 2))
      <= Sqr(self.attackradius.Width div 2)) or
     (Sqr(Pinguin.X - (self.attackradius.Left + self.attackradius.Width div 2)) +
      Sqr(Pinguin.Y - (self.attackradius.Top + self.attackradius.Height div 2))
      <= Sqr(self.attackradius.Width div 2)) then
  begin
       Pinguin.hp := Pinguin.hp - self.damage div 10;
       Pinguin.hpBar.position := Pinguin.hp div 10;
       if (Kanguruart = 'Eis') AND (Pinguin.slowed = false)then
       begin
       Pinguin.speed := Pinguin.speed div 2;
       Pinguin.slowed := true;
       Form5.slowedTick := Form5.ticksPassed;
       end;
       if Kanguruart = 'Boxer' then
          self.bild.picture.LoadFromFile('Images\Pinguinboxer_Attack.png')
       else if Kanguruart = 'Bogen' then
            self.bild.picture.LoadFromFile('Images\Bogenguru_Attack.png')
  end;
end;


end;
  end;
end.

