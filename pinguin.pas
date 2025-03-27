unit Pinguin;

{$mode ObjFPC}{$H+}

interface

Uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Path, ComCtrls;
type TPinguin  = class
      public
      x, y, width, height, art, armorlvl, hp, basehp, moved, currentPath, position, speed, bildOffset, baseSpeed, slowedTick, schimmertick, index, wert:integer;
      slowed, camo, canBeSlowed, schimmert: boolean;
      FileName: string;
      bild: Timage;
      hpBar: TProgressBar;
      constructor create(map, offset: integer);
      procedure laufen(map: integer);
     // procedure attackcheck(map: integer; Kanguru: Tkanguru; Kanguruart: string);
        end;

      THelmPinguin = class(TPinguin)
      public
      constructor create(map, offset: integer);
      end;

      TSchildPinguin = class(Tpinguin)
      public
      constructor create(map, offset: integer);
      end;

      TBossPinguin = class(Tpinguin)
      public
      constructor create(map, offset: integer);
      end;

      TTarnPinguin = class(Tpinguin)
      public
      constructor create(map, offset: integer);
      end;
procedure posUpdate(Pinguin: TPinguin);
implementation

   Uses map2, map1, tutorial;

constructor TPinguin.create(map, offset: integer);
var i: integer;
   begin
     inherited create;
     //je nach map pinguin auf Path[1] erstellen
     with self do
begin
     if map = 2 then //grundlegende Form-bezogene Eigenschaften
     begin
       x := Form6.Path[1].x - offset ;
       y := Form6.Path[1].y;
       bild := TImage.Create(Form6);
       bild.Parent := Form6;
       hpBar := TProgressbar.create(Form6);
       hpBar.parent := Form6;
       position := Form6.PinguinCount;
       inc(Form6.Pinguincount);
       self.index := Form6.Pinguincount;
     end
     else if map = 1 then //grundlegende Form-bezogene Eigenschaften
     begin
       x := Form5.Path[1].x - offset ;
       y := Form5.Path[1].y;
       bild := TImage.Create(Form5);
       bild.Parent := Form5;
       hpBar := TProgressbar.create(Form5);
       hpBar.parent := Form5;
       position := Form5.PinguinCount;
       inc(Form5.Pinguincount);
       self.index := Form5.Pinguincount;
     end;
     //größe und hp bar
     width := 96;
     height := 96;
     currentPath := 1;
     hpBar.left := x + 24;
     hpBar.top := y - 10;
     hpBar.width := 50;
     hpBar.min := 0;
     hpBar.max := hpBar.width;
     hpBar.height := 10;
     hpBar.Visible := true;
     hpBar.Position := 100;
     hpBar.color := clred;

     // bild erstellen

     bild.Width := 96;
     bild.Height := 96;
     bild.stretch := true;
     bild.Picture.LoadFromFile('images\Pinguin_beutelschlacht.png');
     FileName := 'images\Pinguin_beutelschlacht';
     bild.left := x;
     bild.top := y;
     bild.Visible := True;
     //Pinguin spezifische Eigenschaften
     hp := 100;
     basehp := hp;
     baseSpeed := 3;
     bildOffset := 0;
     camo := false;
     self.speed := self.baseSpeed;
     canBeSlowed := true;
     art := 1;
     schimmert := false;
     wert := 200;
     end;
   end;

constructor THelmPinguin.create(map, offset: integer);
   begin

     inherited create(map, offset);
     //Pinguin spezifische Eigenschaften
     self.bild.Picture.LoadFromFile('images\Pinguin helm.png');
     self.FileName := 'images\Pinguin helm';
     self.hp := 300;
     self.baseSpeed := 2;
     self.speed := self.baseSpeed;
     self.art := 2;
     self.basehp := self.hp;
     self.wert := 350;
   end;
constructor TSchildPinguin.create(map, offset: integer);
begin
     inherited create(map, offset);
     //Pinguin spezifische Eigenschaften
     self.bild.picture.loadFromFile('images\Pinguin Helm und Schild.png');
     self.FileName := 'images\Pinguin Helm und Schild';
     self.hp := 500;
     self.baseSpeed := 1;
     self.speed := self.baseSpeed;
     self.art := 3;
     self.basehp := self.hp;
     self.wert := 500;
end;
constructor TBossPinguin.create(map, offset: integer);
begin
     inherited create(map, offset);
     with self do
     begin
     //Pinguin spezifische Eigenschaften
     bild.picture.loadFromFile('images\BossPinguin.png');
     FileName := 'images\BossPinguin';
     bild.Width := 192;
     bild.Height := 192;
     width := 192;
     height := 192;
     bild.left := x;
     bild.top := y - 48;
     bild.Visible := True;
     hp := 1500;
     baseSpeed := 1;
     self.speed := self.baseSpeed;
     bildOffset := 48;
     canBeSlowed := false;
     art := 4;
     basehp := hp;
     wert := 3000;
     end;
end;
constructor TTarnPinguin.create(map, offset: integer);
begin
     inherited create(map, offset);
     //Pinguin spezifische Eigenschaften
     self.camo := true;
     self.bild.picture.loadFromFile('images\Tarnguin.png');
      FileName := 'images\Tarnguin';
     self.hp := 300;
     self.baseSpeed := 5;
     self.speed := self.baseSpeed;
     self.art := 5;
     self.basehp := self.hp;
     wert := 350;
end;

procedure TPinguin.laufen(map: integer);
var i, normal: integer;
begin
  if map = 1 then
  begin
       if ((self.width = 192) AND (Form5.tickspassed mod 4 = 0)) OR (self.width <> 192) then // wenn es der bosspinguin ist alle 8 ticks sonst alle 2 ticks
       begin
         if self.currentPath < 8 then //solange noch auf den Weg-Paths
         begin
         if Form5.Path[self.currentPath].direction = 1 then  //wenn nach links
         begin
         if self.x <= Form5.Path[self.currentPath].x + Form5.Path[self.currentPath].width then  //damit es nur bis Path Ende geht
           begin
             self.x := self.x + self.speed;
           end
           else
             inc(self.currentPath); // wenn ende erreicht -> nächster Path
           end
         else if Form5.Path[self.currentPath].direction = 2 then  //webb nach unten
           begin
           if self.y <= Form5.Path[self.currentPath].y + Form5.Path[self.currentPath].height then //damit es nur bis Path Ende geht
           begin
             self.y := self.y + self.speed;
           end
           else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end
         else if Form5.Path[self.currentPath].direction = 3 then //wenn nach links
         begin
         if self.x >= Form5.Path[self.currentPath].x - 48 then //damit es nur bis Path Ende geht
         begin
         self.x := self.x - self.speed;
         end
         else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end
         else if Form5.Path[self.currentPath].direction = 4 then //wenn nach oben
         begin
         if self.y >= Form5.Path[self.currentPath].y - 48 then    //damit es nur bis Path Ende geht
           begin
           self.y := self.y - self.speed;
           end
         else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end;
         posUpdate(self);
         end
         else if (self.currentPath >= 8) and (self.x > -10000) and (self.hp > 0) then //kriterien für einen durchgekommenen Pinguin
           begin
           //Pinguin wegteleportieren, hp vom spieler abziehen, anzeigen
           self.x := -1000;
           Form5.playerHealth := Form5.playerHealth - self.hp div 5;
           Form5.label12.caption := inttostr(Form5.playerHealth);
           self.hp := 0;
           end;
       end;
  end
    else if map = 2 then
  begin
       if ((self.width = 192) AND (Form6.tickspassed mod 4 = 0)) OR (self.width <> 192) then // wenn es der bosspinguin ist alle 8 ticks sonst alle 2 ticks
       begin
         if self.currentPath < 8 then //solange noch auf den Weg-Paths
         begin
         if Form6.Path[self.currentPath].direction = 1 then  //wenn nach links
         begin
         if self.x <= Form6.Path[self.currentPath].x + Form6.Path[self.currentPath].width then  //damit es nur bis Path Ende geht
           begin
             self.x := self.x + self.speed;
           end
           else
             inc(self.currentPath); // wenn ende erreicht -> nächster Path
           end
         else if Form6.Path[self.currentPath].direction = 2 then  //webb nach unten
           begin
           if self.y <= Form6.Path[self.currentPath].y + Form6.Path[self.currentPath].height then //damit es nur bis Path Ende geht
           begin
             self.y := self.y + self.speed;
           end
           else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end
         else if Form6.Path[self.currentPath].direction = 3 then //wenn nach links
         begin
         if self.x >= Form6.Path[self.currentPath].x - 48 then //damit es nur bis Path Ende geht
         begin
         self.x := self.x - self.speed;
         end
         else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end
         else if Form6.Path[self.currentPath].direction = 4 then //wenn nach oben
         begin
         if self.y >= Form6.Path[self.currentPath].y - 48 then    //damit es nur bis Path Ende geht
           begin
           self.y := self.y - self.speed;
           end
         else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end;
         posUpdate(self);
         end
         else if (self.currentPath >= 8) and (self.x > -10000) and (self.hp > 0) then //kriterien für einen durchgekommenen Pinguin
           begin
           //Pinguin wegteleportieren, hp vom spieler abziehen, anzeigen
           self.x := -1000;
           Form6.playerHealth := Form6.playerHealth - self.hp div 5;
           Form6.label12.caption := inttostr(Form6.playerHealth);
           self.hp := 0;
           end;
       end;
  end;
end;

procedure posUpdate(Pinguin: TPinguin);
begin
         Pinguin.bild.left := Pinguin.x;
         Pinguin.hpBar.left := Pinguin.x + 24 + Pinguin.bildOffset;
         Pinguin.bild.top := Pinguin.y - Pinguin.bildOffset;
         Pinguin.hpBar.top := Pinguin.y - 10 - Pinguin.bildOffset;
         Pinguin.bild.BringToFront;
end;


end.

