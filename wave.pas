unit Wave;

{$mode ObjFPC}{$H+}

interface
Uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;
procedure tick(normal, helm, schild, boss, tarn, map: integer);
type
  TWave  = class
      public
      constructor create(normal, helm, schild, boss, tarn, map: integer);
        end;
implementation
uses map1, map2, Pinguin, Path;

constructor TWave.create(normal, helm, schild, boss, tarn, map: integer);
var i: integer;
begin
  if map = 1 then
  begin
       for i := 1 to normal do
           Form5.Pinguin[i] := TPinguin.Create(1);
       {for i := 1 to helm do
           Form5.Pinguin[i] := THelmPinguin.Create(1);
       for i := 1 to schild do
           Form5.Pinguin[i] := TSchildPinguin.Create(1);
       for i := 1 to boss do
           Form5.Pinguin[i] := TBossPinguin.Create(1);
       for i := 1 to tarn do
           Form5.Pinguin[i] := TTarnPinguin.Create(1);}
  end;
  if map = 2 then
  begin
       for i := 1 to normal do
           Form6.Pinguin[i] := TPinguin.Create(2);
       {for i := 1 to helm do
           Form6.Pinguin[i] := THelmPinguin.Create(2);
       for i := 1 to schild do
           Form6.Pinguin[i] := TSchildPinguin.Create(2);
       for i := 1 to boss do
           Form6.Pinguin[i] := TBossPinguin.Create(2);
       for i := 1 to tarn do
           Form6.Pinguin[i] := TTarnPinguin.Create(2);}
  end;
end;
procedure tick(normal, helm, schild, boss, tarn, map: integer);
var i, speed: integer;
begin
  speed := 20;
  if map = 1 then
  begin
     for i:= 1 to normal do //für jeden Pinguin der Sorte normal
         if Form5.Pinguin[i].currentPath < 7 then
         begin
         if Form5.Path[Form5.Pinguin[i].currentPath].direction = 1 then  //wenn nach links
         begin
         if Form5.Pinguin[i].x <= Form5.Path[Form5.Pinguin[i].currentPath].x + Form5.Path[Form5.Pinguin[i].currentPath].width then  //damit es nur bis Path Ende geht
           begin
             Form5.Pinguin[i].x := Form5.Pinguin[i].x + speed;
             Form5.Pinguin[i].bild.left := Form5.Pinguin[i].x;
           end
           else
             inc(Form5.Pinguin[i].currentPath); // wenn ende erreicht -> nächster Path
           end
         else if Form5.Path[Form5.Pinguin[i].currentPath].direction = 2 then  //webb nach unten
           begin
           if Form5.Pinguin[i].y <= Form5.Path[Form5.Pinguin[i].currentPath].y + Form5.Path[Form5.Pinguin[i].currentPath].height then //damit es nur bis Path Ende geht
           begin
             Form5.Pinguin[i].y := Form5.Pinguin[i].y + speed;
             Form5.Pinguin[i].bild.top := Form5.Pinguin[i].y;
           end
           else
          inc(Form5.Pinguin[i].currentPath); // wenn ende erreicht -> nächster Path
         end
         else if Form5.Path[Form5.Pinguin[i].currentPath].direction = 3 then //wenn nach links
         begin
         if Form5.Pinguin[i].x >= Form5.Path[Form5.Pinguin[i].currentPath].x then //damit es nur bis Path Ende geht
         begin
         Form5.Pinguin[i].x := Form5.Pinguin[i].x - speed;
         Form5.Pinguin[i].bild.left := Form5.Pinguin[i].x;
         end
         else
          inc(Form5.Pinguin[i].currentPath); // wenn ende erreicht -> nächster Path
         end
         else if Form5.Path[Form5.Pinguin[i].currentPath].direction = 4 then //wenn nach oben
         begin
         if Form5.Pinguin[i].y >= Form5.Path[Form5.Pinguin[i].currentPath].y then    //damit es nur bis Path Ende geht
           begin
           Form5.Pinguin[i].y := Form5.Pinguin[i].y - speed;
           Form5.Pinguin[i].bild.top := Form5.Pinguin[i].y;
           end
         else
          inc(Form5.Pinguin[i].currentPath); // wenn ende erreicht -> nächster Path
         end;
         end
         {else if Form5.pinguin[i].currentPath >= 7 then
           begin
         Form5.Pinguin[i].bild.destroy;
         Form5.Pinguin[i].destroy;
           end; }
  end;
end;

end.

