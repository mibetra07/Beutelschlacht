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
       begin
           Form5.Pinguin[i] := TPinguin.Create(1, random(offsetmultiplier) * 50);
           Form5.AllPinguin[i] := Form5.Pinguin[i];
       end;
        for i := 1 to helm do
        begin
          Form5.helmPinguin[i] := THelmPinguin.Create(1, random(offsetmultiplier) * 50 + 100);
          Form5.AllPinguin[i + normal] := Form5.HelmPinguin[i];
        end;
        for i := 1 to schild do
        begin
          Form5.SchildPinguin[i] := TSchildPinguin.Create(1, random(offsetmultiplier) * 50 + 100);
          Form5.AllPinguin[i + helm + normal ] := Form5.HelmPinguin[i];
        end;
        for i := 1 to Boss do
        begin
          Form5.bossPinguin[i] := TbossPinguin.Create(1, random(offsetmultiplier) * 10 + 100);
          Form5.AllPinguin[i + helm + normal + schild] := Form5.HelmPinguin[i];
        end;
        for i := 1 to Tarn do
        begin
          Form5.tarnPinguin[i] := TtarnPinguin.Create(1, random(offsetmultiplier) * 10 + 100);
          Form5.AllPinguin[i + helm + normal + schild + boss] := Form5.TarnPinguin[i];
        end;
  end
  else if map = 2 then
  begin
       for i := 1 to normal do
           Form6.Pinguin[i] := TPinguin.Create(2, random(offsetmultiplier) * 50);
       for i := 1 to helm do
           Form6.helmPinguin[i] := THelmPinguin.Create(2, random(offsetmultiplier) * 50 + 100);
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
      for j := 1 to 50 do   //für jedes Känguru: angriff auf Pinguine; Attackframe rein
          begin
      if Form5.BogenKanguru[j] <> nil then
      begin
       if Form5.ticksPassed mod (1200 div (Form5.BogenKanguru[j].attackspeed * 20)) = 0 then  //alle so und so viel sekunden
        begin
      Form5.BogenKanguru[j].attack(1, Pinguin, 'Bogen');
      if (Form5.ticksPassed mod (1200 div (Form5.BogenKanguru[j].attackspeed * 10)) = 0) and (Form5.BogenKanguru[j] <> nil) and (Form5.BogenKanguru[j].active = true)then
      Form5.BogenKanguru[1].bild.picture.LoadFromFile('images\Bogenguru.png'); //alle anderen so und so viel sekunden
      end;
      end;
       if Form5.Kanguru[j] <> nil then
      begin
       if (Form5.ticksPassed mod (1200 div (Form5.Kanguru[j].attackspeed * 20)) = 0) and (Form5.Kanguru[j] <> nil) and (Form5.Kanguru[j].active = true) then
        begin
      Form5.Kanguru[j].attack(1, Pinguin, 'Boxer');
      if Form5.ticksPassed mod (1200 div (Form5.Kanguru[j].attackspeed * 10)) = 0 then
      Form5.Kanguru[1].bild.picture.LoadFromFile('images\Boxerkanguru.png');
      end;
      end;
       if Form5.EisKanguru[j] <> nil then
      begin
       if (Form5.ticksPassed mod (1200 div (Form5.EisKanguru[j].attackspeed * 20)) = 0) and (Form5.EisKanguru[j] <> nil) and (Form5.EisKanguru[j].active = true) AND ((Form5.ticksPassed - Pinguin.slowedTick > 120) OR (Pinguin.slowedTick = 0)) then
        begin
      Form5.EisKanguru[j].attack(1, Pinguin, 'Eis');
      if Form5.ticksPassed mod (1200 div (Form5.EisKanguru[j].attackspeed * 10)) = 0 then
      Form5.EisKanguru[1].bild.picture.LoadFromFile('images\Eisguru.png');
       end;
       if Form5.ticksPassed - Pinguin.slowedTick > 35 then
       begin
        Pinguin.slowed := false;
        Pinguin.speed :=  Pinguin.baseSpeed;
      end;
      end;
      end;
      pinguin.lab.caption := inttostr(pinguin.position);
  end
  else if map = 2 then
      Pinguin.laufen(2);
end;

end.

