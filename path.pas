unit Path;

{$mode ObjFPC}{$H+}

interface
uses
  Classes, SysUtils, Controls, Graphics, Dialogs, ExtCtrls, Forms;
type TPath = class
     public
     x, y, width, height, direction: integer;
     Bild: TImage;
     constructor create(dir, left, top, breit, hoch, map: integer);
     end;
implementation
uses map2, map1;
constructor TPath.create(dir, left, top, breit, hoch, map: integer);
begin
inherited create;
 //Path erstellen mit x y und größe

 self.direction := dir;
 self.x := left;
 self.y := top;
 self.width := breit;
 self.height := hoch;

 //je nach map image in der map erstellen

 if map = 2 then
 begin
 self.bild := TImage.create(Form6);
 self.Bild.parent := Form6;
 end
 else if map = 1 then
 begin
 self.bild := TImage.create(Form5);
 self.Bild.parent := Form5;
 end;

//Bild bekommt gleiche Koordinaten und Größen wie Path
 self.bild.left := left;
 self.bild.top := top;
 self.bild.height := hoch;
 self.bild.width := breit;
 self.bild.visible := true;

 //je nach map Bild laden

 if map = 2 then
 begin
 if (dir = 1) or (dir = 3) then
 self.bild.picture.loadfromfile('Images\IcePathSide.png')
 else
 self.bild.picture.loadfromfile('Images\IcePathUp.png');
 end
 else if map = 1 then
 begin
 if (dir = 1) or (dir = 3) then
 self.bild.picture.loadfromfile('Images\IcePathSide.png')
 else
 self.bild.picture.loadfromfile('Images\IcePathUp.png');
 end;

end;

end.

