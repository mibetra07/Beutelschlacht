unit Wave;

{$mode ObjFPC}{$H+}

interface
Uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Pinguin;
procedure tick(map: integer; Pinguin: TPinguin);
type
  TWave  = class
      public
      constructor create(normal, helm, schild, boss, tarn, map: integer);
        end;
implementation
uses map1, map2, Path;

constructor TWave.create(normal, helm, schild, boss, tarn, map: integer);
var i, offsetmultiplier: integer;
begin
  offsetmultiplier := 100;
  if map = 1 then
  begin
       for i := 1 to normal do
           Form5.Pinguin[i] := TPinguin.Create(1, random(offsetmultiplier) * 50);
      // for i := 1 to helm do
          // Form5.helmPinguin[i] := THelmPinguin.Create(1, random(offsetmultiplier) * 50 + 100);
  end
  else if map = 2 then
  begin
       for i := 1 to normal do
           Form6.Pinguin[i] := TPinguin.Create(2, random(offsetmultiplier) * 50);
       //for i := 1 to helm do
        //   Form6.helmPinguin[i] := THelmPinguin.Create(2, random(offsetmultiplier) * 50 + 100);
       end;
end;

procedure tick(map: integer; Pinguin: TPinguin);
var i, j, speed: integer;
begin
  Pinguin.laufen(1);
  if Pinguin.hp <= 0 then //wenn Pinguin tot dann weg
     Pinguin.currentPath := 100;
  if map = 1 then
  begin
      if Pinguin <> nil then
      Pinguin.laufen(1);
      for j := 1 to 50 do   //für hedes Känguru: angriff auf Pinguine; Attackframe rein
          begin
      if Form5.BogenKanguru[j] <> nil then
      begin
       if (Form5.ticksPassed mod 20) = 0 then  //alle so und so viel sekunden
        begin
      Form5.BogenKanguru[j].attack(1, Pinguin, 'Bogen');
      if Form5.ticksPassed mod 40 = 0 then
      Form5.BogenKanguru[1].bild.picture.LoadFromFile('images\Bogenguru.png'); //alle anderen so und so viel sekunden
      end;
      end;
       if Form5.Kanguru[j] <> nil then
      begin
       if (Form5.ticksPassed mod 20) = 0 then
        begin
      Form5.Kanguru[j].attack(1, Pinguin, 'Boxer');
      if Form5.ticksPassed mod 40 = 0 then
      Form5.Kanguru[1].bild.picture.LoadFromFile('images\Boxerkanguru.png');
      end;
      end;
       if Form5.EisKanguru[j] <> nil then
      begin
       if (Form5.ticksPassed mod 20) = 0 then
        begin
      Form5.EisKanguru[j].attack(1, Pinguin, 'Eis');
      if Form5.ticksPassed mod 40 = 0 then
      Form5.EisKanguru[1].bild.picture.LoadFromFile('images\Eisguru.png');
      if Form5.ticksPassed - Form5.slowedTick > 20 then
       begin
        Pinguin.slowed := false;
        Pinguin.speed := 2;
       end;


      end;
      end;

      end;
  end
  else if map = 2 then
      Pinguin.laufen(2);
end;

end.

