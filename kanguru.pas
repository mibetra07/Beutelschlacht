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
    attackspeed, attackspeed2 : integer;
    value : integer;
    cancamo : boolean;
    active : boolean;
    damagelvl, rangelvl, speedlvl : integer;
    slowness: integer;
    cooldownTick: integer;
    schimmertick: integer;
    tickSinceAttack: integer;
    constructor create(map, x, y, range : integer);
    procedure destruct;
    procedure attack(map: integer; Pinguin: TPinguin; Kanguruart: string);
    procedure setActive(map : integer);
  private

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
   TZauberAngriff = class(Tkanguru)
     x2, y2: integer;
     DraggingEnabled : boolean;
     constructor create(map, x, y : integer);
  end;

  TZauberkanguru = class(Tkanguru)
   Zauber: TZauberangriff;
   constructor create(map, x, y : integer);
   procedure destruct;
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
    self.attackradius.left := x + 48 - range;
    self.attackradius.top := y + 48 - range;
    self.attackradius.visible := true;
    //bild erstellen
    if map = 1 then
    begin
      self.bild := TImage.Create(Form5);
      self.bild.Parent := Form5;
      self.attackradius.OnClick:= @Form5.AttackradiusClick;
    end
    else if map = 2 then
    begin
      self.bild := TImage.Create(Form6);
      self.bild.Parent := Form6;
      self.attackradius.OnClick:= @Form6.AttackradiusClick
    end;
    //bild formatieren
    self.bild.Width := 96;
    self.bild.Height := 96;
    self.bild.stretch := true;
    self.bild.left := x;
    self.bild.top := y;
    self.bild.Visible := True;

    damagelvl:=0;
    rangelvl:=0;
    speedlvl:=0;
    active := false;
    slowness := 1;
    attackspeed := 15;
    attackspeed2 := 0;
  end;

  constructor TBoxerkanguru.create(map, x, y : integer);
  begin
    damage := 50;
    range2 := 150;
    cancamo := false;
    value := 1000;
    inherited create(map, x, y, range2);
    self.bild.Picture.LoadFromFile('images\Boxerkanguru.png');
    attackspeed := 9;
  end;

  constructor TBogenkanguru.create(map, x, y : integer);
  begin
    damage := 150;
    range2 := 300;
    cancamo := false;
    value:= 2000;
    inherited create(map, x, y, range2);
    self.bild.Picture.LoadFromFile('images\Bogenguru.png');
    attackspeed := 15;
  end;

  constructor TEiskanguru.create(map, x, y : integer);
  begin
    damage := 60;
    range2 := 150;
    cancamo := false;
    value := 3000;
    inherited create(map, x, y, range2);
    attackspeed2 := 120;
    self.bild.Picture.LoadFromFile('images\Eisguru.png');
    slowness := 2;
    attackspeed := 0;
  end;

  constructor TNinjakanguru.create(map, x, y : integer);
  begin
    damage := 60;
    range2 := 225;
    cancamo := true;
    value := 5000;
    inherited create(map, x, y, range2);
    self.bild.Picture.LoadFromFile('images\Ninja.png');
    attackspeed := 9;
  end;

  constructor TZauberAngriff.create(map, x, y : integer);
  begin
    schimmertick := 0;
    damage := 30;
    range2 := 75;
    cancamo := false;
    value := 0;
    self.x2 := x;
    self.y2 := y;
    self.DraggingEnabled:= false;
    inherited create(map, x, y, range2);
    self.bild.stretch := true;
    self.bild.Picture.LoadFromFile('images\Feuer.png');
    self.bild.Width := 124;
    self.bild.Height := 114;
    self.attackradius.visible := false;
    attackspeed := 0;
    if map = 1 then
    begin
      self.bild.OnMouseDown := @Form5.ZauberMouseDown;
      self.bild.OnMouseMove := @Form5.ZauberMouseMove;
      self.bild.OnMouseUp := @Form5.ZauberMouseUp;
    end
    else if map = 2 then
    begin
      self.bild.OnMouseDown := @Form6.ZauberMouseDown;
      self.bild.OnMouseMove := @Form6.ZauberMouseMove;
      self.bild.OnMouseUp := @Form6.ZauberMouseUp;
    end;
  end;

  constructor TZauberkanguru.create(map, x, y : integer);
  begin
  damage := 100;
  range2 := 150;
  cancamo := false;
  value := 8000;
  inherited create(map, x, y, range2);
  self.bild.Picture.LoadFromFile('images\Magier.png');
  attackspeed := 999;

  end;

procedure TKanguru.destruct();
begin
  self.Attackradius.free;
  self.bild.free;
  self.Free;
end;

procedure TZauberkanguru.destruct();
begin
  if self.active = true then
  begin
    self.Zauber.attackradius.free;
    self.Zauber.Bild.free;
    self.Zauber.Free;
  end;
  self.attackradius.free;
  self.bild.free;
  self.free;
end;

procedure Tkanguru.setActive(map : integer);
begin
  self.active := true;
  if map = 1 then
  Self.bild.OnClick := @Form5.KanguruClick
  else if map = 2 then
  Self.bild.OnClick := @Form6.KanguruClick;
end;



procedure Tkanguru.attack(map: integer; Pinguin: TPinguin; Kanguruart: string);
var i, j: integer;
begin
  if map = 1 then
  begin
  if self <> nil then
    begin
      try
      if  (self.active = true)and ((Sqr(Pinguin.X + 48 - (self.attackradius.Left + self.attackradius.Width div 2)) +
          Sqr(Pinguin.Y + 48 - (self.attackradius.Top + self.attackradius.Height div 2))
          <= Sqr(self.attackradius.Width div 2)) or
         (Sqr(Pinguin.X - (self.attackradius.Left + self.attackradius.Width div 2)) +
          Sqr(Pinguin.Y - (self.attackradius.Top + self.attackradius.Height div 2))
          <= Sqr(self.attackradius.Width div 2))) and ((Pinguin.camo = false) or (self.cancamo)) and ((Pinguin.slowed = false) or (Kanguruart <> 'Zauber')) then   // Prüfen, ob irgendein Teil von `Pinguin` innerhalb des Kreises liegt (von chatgpt) und auf camo überprüufen und Zauberer können gefrorene Pinguine nicht attackieren
      begin
           if Form5.ticksPassed - self.cooldownTick >= self.attackSpeed then //wenn der Angriifs-Cooldown abgelaufen ist
            begin
              //neuen Cooldown tick setzen, hp abziehen, hp bar updaten
              self.cooldownTick := Form5.ticksPassed;
              if (Kanguruart <> 'Eis') and (Kanguruart <> 'Zauber') or ((Kanguruart = 'Eis') and (Form5.tickspassed - Pinguin.slowedTick > self.attackspeed2)) or ((Kanguruart = 'Zauber') and (Form5.ticksPassed - self.schimmertick > 2)) then
              begin
              Pinguin.hp := Pinguin.hp - self.damage div 10;
              if Form5.checkbox1.checked then
              Pinguin.hp := Pinguin.hp - self.damage div 10;
              if Kanguruart = 'Zauber' then
                 Schimmertick := Form5.tickspassed;
              end;
              Pinguin.hpBar.position := (Pinguin.hp * Pinguin.hpBar.width) div (Pinguin.basehp);
              if (Kanguruart = 'Zauber') and (Self.cancamo) and (Pinguin.art = 5) then
              begin
                 Pinguin.schimmert := true;
                 Pinguin.camo := false;
                 Pinguin.schimmertick := Form5.tickspassed;
                 Form5.Panel5.caption := inttostr(Pinguin.schimmertick);
              end;
              if Pinguin.schimmert then
              Pinguin.bild.picture.loadFromFile('Images\Tarnguin_Schimmer.png');
               if (Kanguruart = 'Eis') AND (Pinguin.slowed = false) AND (Pinguin.canBeSlowed = true) AND (Form5.ticksPassed - Pinguin.slowedTick > self.attackspeed2) then  //wenn ein eiskanguru angreift; der Pinguin nicht gefroren ist und der Gefrier Cooldown abgelaufen ist
               begin
                 //Pinguin einfrieren; Slowed Tick setzen (Zeitpunkt zu dem der Pinguin gefroren wurde)
                 Pinguin.slowed := true;
                 Pinguin.speed := 0;
                 Pinguin.slowedTick := Form5.ticksPassed;
                 if Pinguin.schimmert then
                    Pinguin.bild.picture.loadFromFile('Images\Tarnguin_Schimmer_freeze.png')
                 else
                     Pinguin.bild.picture.loadFromFile(Pinguin.FileName + '_freeze' + '.png');
                 self.bild.picture.LoadFromFile('Images\Eisguru_Attack.png')
               end
               //Attackframes für die Kangurus
               else if Kanguruart = 'Boxer' then
                  self.bild.picture.LoadFromFile('Images\Pinguinboxer_Attack.png')
               else if (Kanguruart = 'Bogen') and (assigned(self)) then
                    self.bild.picture.LoadFromFile('Images\Bogenguru_Attack.png')
               else if (Kanguruart = 'Ninja') and (assigned(self)) then
                    self.bild.picture.LoadFromFile('Images\Ninja_Attack.png')
           end;
      end;
      except
        halt;
        end;
    end;
  end
  else if map = 2 then
  begin
  if self <> nil then
    begin
      try
      if  (self.active = true)and ((Sqr(Pinguin.X + 48 - (self.attackradius.Left + self.attackradius.Width div 2)) +
          Sqr(Pinguin.Y + 48 - (self.attackradius.Top + self.attackradius.Height div 2))
          <= Sqr(self.attackradius.Width div 2)) or
         (Sqr(Pinguin.X - (self.attackradius.Left + self.attackradius.Width div 2)) +
          Sqr(Pinguin.Y - (self.attackradius.Top + self.attackradius.Height div 2))
          <= Sqr(self.attackradius.Width div 2))) and ((Pinguin.camo = false) or (self.cancamo)) and ((Pinguin.slowed = false) or (Kanguruart <> 'Zauber')) then   // Prüfen, ob irgendein Teil von `Pinguin` innerhalb des Kreises liegt (von chatgpt) und auf camo überprüufen und Zauberer können gefrorene Pinguine nicht attackieren
      begin
           if Form6.ticksPassed - self.cooldownTick >= self.attackSpeed then //wenn der Angriifs-Cooldown abgelaufen ist
            begin
              //neuen Cooldown tick setzen, hp abziehen, hp bar updaten
              self.cooldownTick := Form6.ticksPassed;
              if (Kanguruart <> 'Eis') and (Kanguruart <> 'Zauber') or ((Kanguruart = 'Eis') and (Form6.tickspassed - Pinguin.slowedTick > 120)) or ((Kanguruart = 'Zauber') and (Form6.ticksPassed - self.schimmertick > 2)) then
              begin
              Pinguin.hp := Pinguin.hp - self.damage div 10;
              if Form6.checkbox1.checked then
              Pinguin.hp := Pinguin.hp - self.damage div 10;
              if Kanguruart = 'Zauber' then
                 Schimmertick := Form6.tickspassed;
              end;
              Pinguin.hpBar.position := (Pinguin.hp * Pinguin.hpBar.width) div (Pinguin.basehp);
              if (Kanguruart = 'Zauber') and (Self.cancamo) and (Pinguin.art = 5) then
              begin
                 Pinguin.schimmert := true;
                 Pinguin.camo := false;
                 Pinguin.schimmertick := Form6.tickspassed;
                 Form6.Panel5.caption := inttostr(Pinguin.schimmertick);
              end;
              if Pinguin.schimmert then
              Pinguin.bild.picture.loadFromFile('Images\Tarnguin_Schimmer.png');
               if (Kanguruart = 'Eis') AND (Pinguin.slowed = false) AND (Pinguin.canBeSlowed = true) AND (Form6.ticksPassed - Pinguin.slowedTick > 120) then  //wenn ein eiskanguru angreift; der Pinguin nicht gefroren ist und der Gefrier Cooldown abgelaufen ist
               begin
                 //Pinguin einfrieren; Slowed Tick setzen (Zeitpunkt zu dem der Pinguin gefroren wurde)
                 Pinguin.slowed := true;
                 Pinguin.speed := 0;
                 Pinguin.slowedTick := Form6.ticksPassed;
                 if Pinguin.schimmert then
                    Pinguin.bild.picture.loadFromFile('Images\Tarnguin_Schimmer_freeze.png')
                 else
                     Pinguin.bild.picture.loadFromFile(Pinguin.FileName + '_freeze' + '.png');
                 self.bild.picture.LoadFromFile('Images\Eisguru_Attack.png')
               end
               //Attackframes für die Kangurus
               else if Kanguruart = 'Boxer' then
                  self.bild.picture.LoadFromFile('Images\Pinguinboxer_Attack.png')
               else if (Kanguruart = 'Bogen') and (assigned(self)) then
                    self.bild.picture.LoadFromFile('Images\Bogenguru_Attack.png')
               else if (Kanguruart = 'Ninja') and (assigned(self)) then
                    self.bild.picture.LoadFromFile('Images\Ninja_Attack.png')
           end;
      end;
      except
        halt;
        end;
    end;
  end
end;


end.

