unit Pinguin;

{$mode ObjFPC}{$H+}

interface

Uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Path, ComCtrls;
type TPinguin  = class
      public
      x, y, width, height, art, armorlvl, hp, moved, currentPath, position, speed:integer;
      slowed: boolean;
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
      //constructor create(map: integer);
      end;

      TBossPinguin = class(Tpinguin)
      public
      //constructor create(map: integer);
      end;

      TTarnPinguin = class(Tpinguin)
      public
      //constructor create(map: integer);
      end;

implementation

   Uses map2, map1;

constructor TPinguin.create(map, offset: integer);
var i: integer;
   begin
     inherited create;
     //je nach map pinguin auf Path[1] erstellen

     if map = 2 then
     begin
     self.x := Form6.Path[1].x - offset;
     self.y := Form6.Path[1].y;
     self.bild := TImage.Create(Form6);
     self.bild.Parent := Form6;
     self.hpBar := TProgressbar.create(Form6);
     self.hpBar.parent := Form6;
     end
     else if map = 1 then
     begin
     self.x := Form5.Path[1].x - offset ;
     self.y := Form5.Path[1].y;
     self.bild := TImage.Create(Form5);
     self.bild.Parent := Form5;
     self.hpBar := TProgressbar.create(Form5);
     self.hpBar.parent := Form5;
     end;
     //größe

     self.width := 96;
     self.height := 96;
     self.currentPath := 1;
     self.hpBar.left := self.x + 24;
     self.hpBar.top := self.y - 10;
     self.hpBar.width := 50;
     self.hpBar.height := 10;
     self.hpBar.Visible := true;
     self.hpBar.Position := 100;
     self.hpBar.color := clred;

     // bild erstellen

     self.bild.Width := 96;
     self.bild.Height := 96;
     self.bild.stretch := true;
     self.bild.Picture.LoadFromFile('images\Pinguin_beutelschlacht.png');
     self.bild.left := self.x;
     self.bild.top := self.y;
     self.bild.Visible := True;
     self.hp := 100;
     self.speed := 3;
     end;
constructor THelmPinguin.create(map, offset: integer);
   begin

     inherited create(map, offset);

     self.bild.Picture.LoadFromFile('images\Pinguin helm.png');
     self.bild.left := self.x;
     self.bild.top := self.y;
     self.bild.Visible := True;
     self.hp := 300;
     self.speed := 2;
   end;

procedure TPinguin.laufen(map: integer);
var i, normal: integer;
begin
  speed := self.speed;
  if map = 1 then
  begin
         if self.currentPath < 7 then
         begin
         if Form5.Path[self.currentPath].direction = 1 then  //wenn nach links
         begin
         if self.x <= Form5.Path[self.currentPath].x + Form5.Path[self.currentPath].width then  //damit es nur bis Path Ende geht
           begin
             self.x := self.x + speed;
             self.bild.left := self.x;
             self.hpbar.left := self.x + 24;
           end
           else
             inc(self.currentPath); // wenn ende erreicht -> nächster Path
           end
         else if Form5.Path[self.currentPath].direction = 2 then  //webb nach unten
           begin
           if self.y <= Form5.Path[self.currentPath].y + Form5.Path[self.currentPath].height then //damit es nur bis Path Ende geht
           begin
             self.y := self.y + speed;
             self.bild.top := self.y;
             self.hpbar.top := self.y - 10;
           end
           else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end
         else if Form5.Path[self.currentPath].direction = 3 then //wenn nach links
         begin
         if self.x >= Form5.Path[self.currentPath].x then //damit es nur bis Path Ende geht
         begin
         self.x := self.x - speed;
         self.bild.left := self.x;
         self.hpbar.left := self.x + 24;
         end
         else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end
         else if Form5.Path[self.currentPath].direction = 4 then //wenn nach oben
         begin
         if self.y >= Form5.Path[self.currentPath].y then    //damit es nur bis Path Ende geht
           begin
           self.y := self.y - speed;
           self.bild.top := self.y;
           self.hpbar.top := self.y - 10;
           end
         else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end;
         end
         else if self.currentPath >= 7 then
           begin
           self.currentPath := 100;
           self.x := -10000;
           self.bild.left := self.x;
           self.hpBar.Left := self.x;
           end;
  end
    else if map = 2 then
  begin
         if self.currentPath < 7 then
         begin
         if Form6.Path[self.currentPath].direction = 1 then  //wenn nach links
         begin
         if self.x <= Form6.Path[self.currentPath].x + Form6.Path[self.currentPath].width then  //damit es nur bis Path Ende geht
           begin
             self.x := self.x + speed;
             self.bild.left := self.x;
             self.hpBar.left := self.x + 24;
           end
           else
             inc(self.currentPath); // wenn ende erreicht -> nächster Path
           end
         else if Form6.Path[self.currentPath].direction = 2 then  //webb nach unten
           begin
           if self.y <= Form6.Path[self.currentPath].y + Form6.Path[self.currentPath].height then //damit es nur bis Path Ende geht
           begin
             self.y := self.y + speed;
             self.bild.top := self.y;
             self.hpBar.top := self.y - 100;
           end
           else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end
         else if Form6.Path[self.currentPath].direction = 3 then //wenn nach links
         begin
         if self.x >= Form6.Path[self.currentPath].x then //damit es nur bis Path Ende geht
         begin
         self.x := self.x - speed;
         self.bild.left := self.x;
         self.hpBar.left := self.x + 24;
         end
         else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end
         else if Form6.Path[self.currentPath].direction = 4 then //wenn nach oben
         begin
         if self.y >= Form6.Path[self.currentPath].y then    //damit es nur bis Path Ende geht
           begin
           self.y := self.y - speed;
           self.bild.top := self.y;
           self.hpBar.top := self.y - 100;
           end
         else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end;
         end
         else if self.currentPath >=  7 then
           begin
           self.currentPath := 100;
           self.x := -10000;
           self.bild.left := self.x;
           self.hpBar.Left := self.x;
           end;
  end;
end;
{procedure Tpinguin.attackcheck(map: integer; Kanguru: TKanguru; Kanguruart: string);
var i, j: integer;
begin
  begin
  // Prüfen, ob irgendein Teil von `self` innerhalb des Kreises liegt (von chatgpt)
  if Kanguru <> nil then
    begin
  if (Sqr(self.X + 48 - (Kanguru.attackradius.Left + Kanguru.attackradius.Width div 2)) +
      Sqr(self.Y + 48 - (Kanguru.attackradius.Top + Kanguru.attackradius.Height div 2))
      <= Sqr(Kanguru.attackradius.Width div 2)) or
     (Sqr(self.X - (Kanguru.attackradius.Left + Kanguru.attackradius.Width div 2)) +
      Sqr(self.Y - (Kanguru.attackradius.Top + Kanguru.attackradius.Height div 2))
      <= Sqr(Kanguru.attackradius.Width div 2)) then
  begin
        self.hp := self.hp - Kanguru.damage div 5;
       self.hpBar.position := self.hp div 10;
       if Kanguruart = 'boxer' then
          Kanguru.bild.picture.LoadFromFile('Images\Pinguinboxer_Attack.png')
       else if Kanguruart = 'Bogen' then
            Kanguru.bild.picture.LoadFromFile('Images\Bogenguru_Attack.png')
  end;
end;


end;
  end; }

end.

