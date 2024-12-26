unit Collision;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

procedure CheckCollision(Image1, Image2 : TImage; var CollisionDetected : boolean);
procedure CheckMapCollision(Image1 : TImage; var CollisionDetected : boolean);
implementation

uses map1, map2;

//einfache Kollisionsüberprüfung zwischen 2 Bildern
procedure CheckCollision(Image1, Image2 : TImage; var CollisionDetected : Boolean);
begin
  if (Image1.Left + Image1.Width > Image2.Left) and (Image1.Top + Image1.Height > Image2.Top) and not (Image2.Left + Image2.Width < Image1.Left) and not (Image2.Top + Image2.Height < Image1.Top)
  then
    CollisionDetected := true
  else
    CollisionDetected := false;
end;

//Fürs platzieren, checkt zusätzlich, dass es auf der karte ist und nicht außerhalb
procedure CheckMapCollision(Image1 : TImage; var CollisionDetected : boolean);
begin
  if (Image1.Left + Image1.Width > 1460) or (Image1.Top + Image1.Height > 1010)
  then CollisionDetected := true
  else CollisionDetected := false;
end;

end.

