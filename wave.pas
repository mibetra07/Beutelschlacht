unit Wave;

{$mode ObjFPC}{$H+}

interface
Uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Pinguin;
procedure tick(map: integer; Pinguin: TPinguin);
type
  TWave  = class
      public
      constructor create(normal, helm, schild, boss, tarn, map, offsetmultiplier: integer);
        end;
implementation
uses map1, map2, Path;

constructor TWave.create(normal, helm, schild, boss, tarn, map, offsetmultiplier: integer);
var i, j , k: integer;
begin
  if map = 1 then
    begin
  for i := 1 to 5 do //Die wegteleportierten Pinguine nach Bedarf zurückrufen und resetten
      for j := 1 to Form5.AmountKilled[i] do
          for k := 1 to Form5.Pinguincount do
              begin
                if Form5.AllPinguin[k].index = Form5.IndexOfKilled[i, j] then
                begin
                 with Form5.AllPinguin[k] do
                  begin
                    currentPath := 1;
                    x := 1;
                    hp := basehp;
                    bild.left := x;
                    hpBar.Left := x;
                    lab.left := x;
                  end;
                end;
              end;
       //neue Pinguine erzeugen
         for i := 1 to normal - Form5.AmountKilled[1] do
         begin
             Form5.Pinguin[i] := TPinguin.Create(1, random(offsetmultiplier) * 50);
             Form5.AllPinguin[i] := Form5.Pinguin[i];
         end;
        for i := 1 to helm - Form5.AmountKilled[2] do
        begin
          Form5.helmPinguin[i] := THelmPinguin.Create(1, random(offsetmultiplier) * 50 + 100);
          Form5.AllPinguin[i + normal] := Form5.HelmPinguin[i];
        end;
        for i := 1 to schild - Form5.AmountKilled[3] do
        begin
          Form5.SchildPinguin[i] := TSchildPinguin.Create(1, random(offsetmultiplier) * 50 + 100);
          Form5.AllPinguin[i + helm + normal ] := Form5.HelmPinguin[i];
        end;
        for i := 1 to Boss - Form5.AmountKilled[4] do
        begin
          Form5.bossPinguin[i] := TbossPinguin.Create(1, random(offsetmultiplier) * 10 + 100);
          Form5.AllPinguin[i + helm + normal + schild] := Form5.HelmPinguin[i];
        end;
        for i := 1 to Tarn - Form5.AmountKilled[5] do
        begin
          Form5.tarnPinguin[i] := TtarnPinguin.Create(1, random(offsetmultiplier) * 10 + 100);
          Form5.AllPinguin[i + helm + normal + schild + boss] := Form5.TarnPinguin[i];
        end;
  end
  else if map = 2 then
    begin
  for i := 1 to 5 do //Die wegteleportierten Pinguine nach Bedarf zurückrufen und resetten
      for j := 1 to Form6.AmountKilled[i] do
          for k := 1 to Form6.Pinguincount do
              begin
                if Form6.AllPinguin[k].index = Form6.IndexOfKilled[i, j] then
                begin
                 with Form6.AllPinguin[k] do
                  begin
                    currentPath := 1;
                    x := 1;
                    hp := basehp;
                    bild.left := x;
                    hpBar.Left := x;
                    lab.left := x;
                  end;
                end;
              end;
       //neue Pinguine erzeugen
         for i := 1 to normal - Form6.AmountKilled[1] do
         begin
             Form6.Pinguin[i] := TPinguin.create(2, random(offsetmultiplier) * 50);
             Form6.AllPinguin[i] := Form6.Pinguin[i];
         end;
        for i := 1 to helm - Form6.AmountKilled[2] do
        begin
          Form6.helmPinguin[i] := THelmPinguin.create(2, random(offsetmultiplier) * 50 + 100);
          Form6.AllPinguin[i + normal] := Form6.HelmPinguin[i];
        end;
        for i := 1 to schild - Form6.AmountKilled[3] do
        begin
          Form6.SchildPinguin[i] := TSchildPinguin.create(2, random(offsetmultiplier) * 50 + 100);
          Form6.AllPinguin[i + helm + normal ] := Form6.HelmPinguin[i];
        end;
        for i := 1 to Boss - Form6.AmountKilled[4] do
        begin
          Form6.bossPinguin[i] := TbossPinguin.create(2, random(offsetmultiplier) * 10 + 100);
          Form6.AllPinguin[i + helm + normal + schild] := Form6.HelmPinguin[i];
        end;
        for i := 1 to Tarn - Form6.AmountKilled[5] do
        begin
          Form6.tarnPinguin[i] := TtarnPinguin.create(2, random(offsetmultiplier) * 10 + 100);
          Form6.AllPinguin[i + helm + normal + schild + boss] := Form6.TarnPinguin[i];
        end;
  end
end;
procedure tick(map: integer; Pinguin: TPinguin);
var i, j, k, speed: integer;
begin
  k := 0;
  if Form5.tickspassed > 1000000 then //sicherheit falls irgendwer extrem lange spielt
     Form5.tickspassed := 0;
  if map = 1 then
  begin
   if Form5.playerHealth <= 0 then
     Pinguin.hp := 0;
    repeat
      if Pinguin <> nil then
             Pinguin.laufen(1);
      if Pinguin.hp <= 0 then //wenn Pinguin tot dann weg
      begin
        if Pinguin.x > -10000 then //wenn der Pinguin noch nicht wegteleportiert wurde: Arrays mit "toten" Pinguinen updaten
        begin
           inc(Form5.AmountKilled[Pinguin.art]);
           inc(Form5.killedCount);
           Form5.coins := Form5.coins + Pinguin.wert;
           Form5.label6.caption := inttostr(Form5.coins);
        end;
            //Pinguin wegteleportieren (destroy hat aus Lazarus Gründen nicht funktioniert)
           Pinguin.currentPath := 100;
           Pinguin.x := -10000;
           Pinguin.bild.left := Pinguin.x;
           Pinguin.hpBar.Left := Pinguin.x;
           Pinguin.lab.left := Pinguin.x;
           Form5.IndexOfKilled[Pinguin.art, Form5.AmountKilled[Pinguin.art]] := Pinguin.index;
      end;
      if Form5.KilledCount = Form5.PinguinCount then //Wenn alle Pinguine einer Wave tot sind: Speicher der getöteten Pinguin resetten und die nächste wave starten
      begin
       for i := 1 to 5 do
           for j := 1 to 100 do
               begin
                    Form5.IndexOfKilled[i, j] := 0;
                    Form5.AmountKilled[j] := 0;
               end;
         inc(Form5.currentWave);
         Form5.Label13.caption:= 'Welle ' + inttostr(Form5.currentWave) + '/20';      //label zum Anzeigen der momentanen Welle
         Form5.wave[Form5.currentWave] := TWave.create(Form5.waveParams[Form5.currentWave, 1], Form5.waveParams[Form5.currentWave, 2], Form5.waveParams[Form5.currentWave, 3], Form5.waveParams[Form5.currentWave, 4], Form5.waveParams[Form5.currentWave, 5], 1, Form5.waveParams[Form5.currentwave, 6]);
         Form5.killedCount := 0;
         if not(Form5.checkbox2.checked) then
         begin
          Form5.timer1.Enabled := false;
          break;
         end;
      end;

         // for j := 1 to 50 do   //für jedes Känguru: angriff auf Pinguine
             // begin
             for j := 1 to Form5.Bogenkanguruzahl do
                if Form5.BogenKanguru[j] <> nil then
                begin
                  Form5.BogenKanguru[j].attack(1, Pinguin, 'Bogen');
                  if (Form5. ticksPassed - Form5.BogenKanguru[j].cooldownTick > Form5.BogenKanguru[j].attackspeed div 2) and (Form5.BogenKanguru[j] <> nil) and (Form5.BogenKanguru[j].active = true)then
                     Form5.BogenKanguru[1].bild.picture.LoadFromFile('images\Bogenguru.png'); //alle anderen so und so viel sekunden idle Bild
                end;
             for j := 1 to Form5.Kanguruzahl do
                 if Form5.Kanguru[j] <> nil then
                begin
                  Form5.Kanguru[j].attack(1, Pinguin, 'Boxer');
                  if (Form5. ticksPassed - Form5.Kanguru[j].cooldownTick > Form5.Kanguru[j].attackspeed div 2) and (Form5.Kanguru[j] <> nil) and (Form5.Kanguru[j].active = true)then
                     Form5.Kanguru[1].bild.picture.LoadFromFile('images\Boxerkanguru.png'); //alle anderen so und so viel sekunden idle Bild
                end;
             for j := 1 to Form5.Ninjakanguruzahl do
                 if Form5.Ninjakanguru[j] <> nil then
                begin
                  Form5.Ninjakanguru[j].attack(1, Pinguin, 'Ninja');
                  if (Form5. ticksPassed - Form5.NinjaKanguru[j].cooldownTick > Form5.NinjaKanguru[j].attackspeed div 2) and (Form5.NinjaKanguru[j] <> nil) and (Form5.NinjaKanguru[j].active = true)then
                     Form5.Ninjakanguru[1].bild.picture.LoadFromFile('images\Ninja.png'); //alle anderen so und so viel sekunden idle Bild
                end;
             for j := 1 to Form5.Zauberkanguruzahl do
                 if (Form5.Zauberkanguru[j] <> nil) and (Form5.Zauberkanguru[j].zauber <> nil) then
                begin
                 Form5.Zauberkanguru[j].zauber.attack(1, Pinguin, 'Zauber');
                end;
             for j := 1 to Form5.Eiskanguruzahl do
                 if Form5.EisKanguru[j] <> nil then
                begin
                     begin
                          Form5.EisKanguru[j].attack(1, Pinguin, 'Eis');
                          if (Form5. ticksPassed - Form5.EisKanguru[j].cooldownTick > Form5.EisKanguru[j].attackspeed div 2) and (Form5.EisKanguru[j] <> nil) and (Form5.EisKanguru[j].active = true)then
                          Form5.EisKanguru[1].bild.picture.LoadFromFile('images\Eisguru.png'); //alle anderen so und so viel sekunden idle Bild
                     end;
                end;
              if (Form5.ticksPassed - Pinguin.slowedTick > 55) and (Pinguin.slowed) then //wenn der Pinguin eine Zeit gefreezed war: entfreezen
                      begin
                          Pinguin.slowed := false;
                          if Pinguin.schimmert then
                             Pinguin.bild.picture.loadFromFile('Images\Tarnguin_Schimmer.png')
                          else
                              Pinguin.bild.picture.loadFromFile(Pinguin.FileName + '.png');
                          Pinguin.speed :=  Pinguin.baseSpeed;
                      end;
              if (Pinguin.art = 5) and (Pinguin.schimmert) and (Form5.ticksPassed - Pinguin.schimmertick > 105) then //wenn der Pinguin eine Zeit gefreezed war: entfreezen
                      begin
                          Pinguin.schimmert := false;
                          Pinguin.bild.picture.loadFromFile('Images\Tarnguin.png');
                          Pinguin.camo := true;
                      end;
              //end;
          pinguin.lab.caption := inttostr(pinguin.index);
          if Form5.CheckBox1.checked then  //wenn die checkbox gechecked ist loop parameter erhöhen (2x speed: alles 2x ausgeführt)
             begin
                  inc(k);
             end
          else
              k :=2;
        until k = 2;
  end
  else if map = 2 then
  begin
   if Form6.playerHealth <= 0 then
     Pinguin.hp := 0;
    repeat
      if Pinguin <> nil then
             Pinguin.laufen(1);
      if Pinguin.hp <= 0 then //wenn Pinguin tot dann weg
      begin
        if Pinguin.x > -10000 then //wenn der Pinguin noch nicht wegteleportiert wurde: Arrays mit "toten" Pinguinen updaten
        begin
           inc(Form6.AmountKilled[Pinguin.art]);
           inc(Form6.killedCount);
           Form6.coins := Form6.coins + Pinguin.wert;
           Form6.label6.caption := inttostr(Form6.coins);
        end;
            //Pinguin wegteleportieren (destroy hat aus Lazarus Gründen nicht funktioniert)
           Pinguin.currentPath := 100;
           Pinguin.x := -10000;
           Pinguin.bild.left := Pinguin.x;
           Pinguin.hpBar.Left := Pinguin.x;
           Pinguin.lab.left := Pinguin.x;
           Form6.IndexOfKilled[Pinguin.art, Form6.AmountKilled[Pinguin.art]] := Pinguin.index;
      end;
      if Form6.KilledCount = Form6.PinguinCount then //Wenn alle Pinguine einer Wave tot sind: Speicher der getöteten Pinguin resetten und die nächste wave starten
      begin
       for i := 1 to 5 do
           for j := 1 to 100 do
               begin
                    Form6.IndexOfKilled[i, j] := 0;
                    Form6.AmountKilled[j] := 0;
               end;
         inc(Form6.currentWave);
         Form6.Label13.caption:= 'Welle ' + inttostr(Form6.currentWave) + '/20';      //label zum Anzeigen der momentanen Welle
         Form6.wave[Form6.currentWave] := TWave.create(Form6.waveParams[Form6.currentWave, 1], Form6.waveParams[Form6.currentWave, 2], Form6.waveParams[Form6.currentWave, 3], Form6.waveParams[Form6.currentWave, 4], Form6.waveParams[Form6.currentWave, 5], 2, Form6.waveParams[Form6.currentwave, 6]);
         Form6.killedCount := 0;
         if not(Form6.checkbox2.checked) then
         begin
          Form6.timer1.Enabled := false;
          break;
         end;
      end;

         // for j := 1 to 50 do   //für jedes Känguru: angriff auf Pinguine
             // begin
             for j := 1 to Form6.Bogenkanguruzahl do
                if Form6.BogenKanguru[j] <> nil then
                begin
                  Form6.BogenKanguru[j].attack(2, Pinguin, 'Bogen');
                  if (Form6. ticksPassed - Form6.BogenKanguru[j].cooldownTick > Form6.BogenKanguru[j].attackspeed div 2) and (Form6.BogenKanguru[j] <> nil) and (Form6.BogenKanguru[j].active = true)then
                     Form6.BogenKanguru[1].bild.picture.LoadFromFile('images\Bogenguru.png'); //alle anderen so und so viel sekunden idle Bild
                end;
             for j := 1 to Form6.Kanguruzahl do
                 if Form6.Kanguru[j] <> nil then
                begin
                  Form6.Kanguru[j].attack(2, Pinguin, 'Boxer');
                  if (Form6. ticksPassed - Form6.Kanguru[j].cooldownTick > Form6.Kanguru[j].attackspeed div 2) and (Form6.Kanguru[j] <> nil) and (Form6.Kanguru[j].active = true)then
                     Form6.Kanguru[1].bild.picture.LoadFromFile('images\Boxerkanguru.png'); //alle anderen so und so viel sekunden idle Bild
                end;
             for j := 1 to Form6.Ninjakanguruzahl do
                 if Form6.Ninjakanguru[j] <> nil then
                begin
                  Form6.Ninjakanguru[j].attack(2, Pinguin, 'Ninja');
                  if (Form6. ticksPassed - Form6.NinjaKanguru[j].cooldownTick > Form6.NinjaKanguru[j].attackspeed div 2) and (Form6.NinjaKanguru[j] <> nil) and (Form6.NinjaKanguru[j].active = true)then
                     Form6.Ninjakanguru[1].bild.picture.LoadFromFile('images\Ninja.png'); //alle anderen so und so viel sekunden idle Bild
                end;
             for j := 1 to Form6.Zauberkanguruzahl do
                 if (Form6.Zauberkanguru[j] <> nil) and (Form6.Zauberkanguru[j].zauber <> nil) then
                begin
                 Form6.Zauberkanguru[j].zauber.attack(2, Pinguin, 'Zauber');
                end;
             for j := 1 to Form6.Eiskanguruzahl do
                 if Form6.EisKanguru[j] <> nil then
                begin
                     begin
                          Form6.EisKanguru[j].attack(2, Pinguin, 'Eis');
                          if (Form6. ticksPassed - Form6.EisKanguru[j].cooldownTick > Form6.EisKanguru[j].attackspeed div 2) and (Form6.EisKanguru[j] <> nil) and (Form6.EisKanguru[j].active = true)then
                          Form6.EisKanguru[1].bild.picture.LoadFromFile('images\Eisguru.png'); //alle anderen so und so viel sekunden idle Bild
                     end;
                end;
              if (Form6.ticksPassed - Pinguin.slowedTick > 55) and (Pinguin.slowed) then //wenn der Pinguin eine Zeit gefreezed war: entfreezen
                      begin
                          Pinguin.slowed := false;
                          if Pinguin.schimmert then
                             Pinguin.bild.picture.loadFromFile('Images\Tarnguin_Schimmer.png')
                          else
                              Pinguin.bild.picture.loadFromFile(Pinguin.FileName + '.png');
                          Pinguin.speed :=  Pinguin.baseSpeed;
                      end;
              if (Pinguin.art = 5) and (Pinguin.schimmert) and (Form6.ticksPassed - Pinguin.schimmertick > 105) then //wenn der Pinguin eine Zeit gefreezed war: entfreezen
                      begin
                          Pinguin.schimmert := false;
                          Pinguin.bild.picture.loadFromFile('Images\Tarnguin.png');
                          Pinguin.camo := true;
                      end;
              //end;
          pinguin.lab.caption := inttostr(pinguin.index);
          if Form6.CheckBox1.checked then  //wenn die checkbox gechecked ist loop parameter erhöhen (2x speed: alles 2x ausgeführt)
             begin
                  inc(k);
             end
          else
              k :=2;
        until k = 2;
  end
end;


end.

