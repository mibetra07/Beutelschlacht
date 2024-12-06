unit Pinguin;

{$mode ObjFPC}{$H+}

interface

Uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Path;
type TPinguin  = class
      public
      x, y, width, height, art, armorlvl, hp, moved, currentPath:integer;
      bild: Timage;
      constructor create(map: integer);
        end;

      THelmPinguin = class(TPinguin)
      public
      //constructor create(map: integer);
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

constructor TPinguin.create(map: integer);
   begin
     inherited create;
     //je nach map pinguin auf Path[1] erstellen

     if map = 2 then
     begin
     self.x := Form6.Path[1].x;
     self.y := Form6.Path[1].y;
     self.bild := TImage.Create(Form6);
     self.bild.Parent := Form6;
     end
     else if map = 1 then
     begin
     self.x := Form5.Path[1].x;
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
end.

