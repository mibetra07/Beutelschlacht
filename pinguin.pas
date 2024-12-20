unit Pinguin;

{$mode ObjFPC}{$H+}

interface

Uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Path;
type TPinguin  = class
      public
      x, y, width, height, art, armorlvl, hp, moved, currentPath:integer;
      bild: Timage;
      constructor create(map, offset: integer);
      procedure laufen(map: integer);
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
   begin
     inherited create;
     //je nach map pinguin auf Path[1] erstellen

     if map = 2 then
     begin
     self.x := Form6.Path[1].x - offset;
     self.y := Form6.Path[1].y;
     self.bild := TImage.Create(Form6);
     self.bild.Parent := Form6;
     end
     else if map = 1 then
     begin
     self.x := Form5.Path[1].x - offset ;
     self.y := Form5.Path[1].y;
     self.bild := TImage.Create(Form5);
     self.bild.Parent := Form5;
     end;
     //größe

     self.width := 96;
     self.height := 96;
     self.currentPath := 1;

     // bild erstellen

     self.bild.Width := 96;
     self.bild.Height := 96;
     self.bild.stretch := true;
     self.bild.Picture.LoadFromFile('images\Pinguin_beutelschlacht.png');
     self.bild.left := self.x;
     self.bild.top := self.y;
     self.bild.Visible := True;
     end;
constructor THelmPinguin.create(map, offset: integer);
   begin
     //je nach map pinguin auf Path[1] erstellen

     if map = 2 then
     begin
     self.x := Form6.Path[1].x - offset;
     self.y := Form6.Path[1].y;
     self.bild := TImage.Create(Form6);
     self.bild.Parent := Form6;
     end
     else if map = 1 then
     begin
     self.x := Form5.Path[1].x- offset;
     self.y := Form5.Path[1].y;
     self.bild := TImage.Create(Form5);
     self.bild.Parent := Form5;
     end;
     //größe

     self.width := 96;
     self.height := 96;
     self.currentPath := 1;

     // bild erstellen

     self.bild.Width := 96;
     self.bild.Height := 96;
     self.bild.stretch := true;
     self.bild.Picture.LoadFromFile('images\Pinguin helm.png');
     self.bild.left := self.x;
     self.bild.top := self.y;
     self.bild.Visible := True;
     self.hp := 6969;
   end;

procedure TPinguin.laufen(map: integer);
var i, speed, normal: integer;
begin
  speed := 30;
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
           end
         else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end;
         end
         else if self.currentPath >= 7 then
           begin
           self.currentPath := 100;
           self.x := -100000;
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
           end
         else
          inc(self.currentPath); // wenn ende erreicht -> nächster Path
         end;
         end
         else if self.currentPath > 6 then
           begin
           self.currentPath := 100;
           self.x := -100000; ;
           end;
  end;
end;


end.

