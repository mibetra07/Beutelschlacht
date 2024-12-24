unit Wave;

{$mode ObjFPC}{$H+}

interface
Uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Pinguin;
procedure tick(normal, helm, schild, boss, tarn, map: integer; Pinguin: TPinguin);
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
       {for i := 1 to helm do
           Form5.Pinguin[i] := THelmPinguin.Create(1);
       for i := 1 to schild do
           Form5.Pinguin[i] := TSchildPinguin.Create(1);
       for i := 1 to boss do
           Form5.Pinguin[i] := TBossPinguin.Create(1);
       for i := 1 to tarn do
           Form5.Pinguin[i] := TTarnPinguin.Create(1);}
  end
  else if map = 2 then
  begin
       for i := 1 to normal do
           Form6.Pinguin[i] := TPinguin.Create(2, random(offsetmultiplier) * 50);
       {for i := 1 to helm do
           Form6.Pinguin[i] := THelmPinguin.Create(2);
       for i := 1 to schild do
           Form6.Pinguin[i] := TSchildPinguin.Create(2);
       for i := 1 to boss do
           Form6.Pinguin[i] := TBossPinguin.Create(2);
       for i := 1 to tarn do
           Form6.Pinguin[i] := TTarnPinguin.Create(2);}
  end;
  if map = 1 then
  begin
       for i := 1 to helm do
           Form5.helmPinguin[i] := THelmPinguin.Create(1, random(offsetmultiplier) * 50 + 100);
       {for i := 1 to helm do
           Form5.Pinguin[i] := THelmPinguin.Create(1);
       for i := 1 to schild do
           Form5.Pinguin[i] := TSchildPinguin.Create(1);
       for i := 1 to boss do
           Form5.Pinguin[i] := TBossPinguin.Create(1);
       for i := 1 to tarn do
           Form5.Pinguin[i] := TTarnPinguin.Create(1);}
  end
  else if map = 2 then
  begin
       for i := 1 to helm do
           Form6.helmPinguin[i] := THelmPinguin.Create(2, random(offsetmultiplier) * 50 + 100);
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
procedure tick(normal, helm, schild, boss, tarn, map: integer; Pinguin: TPinguin);
var i, j, speed: integer;
begin
  if Pinguin.hp <= 0 then
     Pinguin.currentPath := 100;
  if map = 1 then
  begin

  for i := 1 to normal do
      begin
      Pinguin.laufen(1);
      for j := 1 to 50 do
          begin
      if Form5.BogenKanguru[j] <> nil then
      begin
       if (Form5.ticksPassed mod 20) = 0 then
        begin
      Pinguin.attackcheck(1, Form5.BogenKanguru[i], 'Bogen');
      if Form5.ticksPassed mod 40 = 0 then
      Form5.BogenKanguru[1].bild.picture.LoadFromFile('images\Bogenguru.png');
      end;
      end;
       if Form5.Kanguru[j] <> nil then
      begin
       if (Form5.ticksPassed mod 20) = 0 then
        begin
      Pinguin.attackcheck(1, Form5.Kanguru[i], 'Boxer');
      if Form5.ticksPassed mod 40 = 0 then
      Form5.Kanguru[1].bild.picture.LoadFromFile('images\Boxerkanguru.png');
      end;
      end;
  end;

      end;
  for i := 1 to helm do
      //Form5.HelmPinguin[i].laufen(1);
  end
  else if map = 2 then
  begin
  for i := 1 to normal do
      Pinguin.laufen(2);
  for i := 1 to helm do
      Form6.HelmPinguin[i].laufen(2);
  end;
end;

end.

