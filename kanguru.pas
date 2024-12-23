unit kanguru;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Path;

type TKanguru = class
  public
    width, height : integer;
    bild: Timage;
    attackradius : TShape;
    damage, range : integer;
    attackspeed : real;
    cancamo : boolean;
    active : boolean;
    constructor create(map, x, y : integer);
    procedure attack();
  end;

  TBogenkanguru = class(TKanguru)

  end;

  TZauberkanguru = class(Tkanguru)

  end;

  TNinjakanguru = class(Tkanguru)

  end;

  TEiskanguru = class(Tkanguru)

  end;

implementation

  Uses map2, map1;

constructor Tkanguru.create(map, x, y : integer);
  begin
    inherited create;

    //stats
    damage := 10;
    range := 150;
    attackspeed := 0.2;
    cancamo := false;
    active := false;
    //testkoordinaten


    //Angriffsumkreis erstellen
    if map = 1 then
    begin
      self.attackradius := TShape.Create(Form5);
      self.attackradius.Parent := Form5;
    end
    else if map = 2 then
    begin
      self.attackradius := TShape.Create(Form6);
      self.attackradius.Parent := Form6;
    end;

    self.attackradius.Width := range*2;
    self.attackradius.Height := range*2;
    self.attackradius.shape := stCircle;
    self.attackradius.brush.color := clGray;
    self.attackradius.brush.style := bsCross;
    self.attackradius.left := x + 48 - range; //range muss vielleicht geändert werden, dass hier ist falls 1 range = 1 pixel
    self.attackradius.top := y + 48 - range; //ebd.
    self.attackradius.visible := true;

    //bild erstellen

    if map = 1 then
    begin
      self.bild := TImage.Create(Form5);
      self.bild.Parent := Form5;
    end
    else if map = 2 then
    begin
      self.bild := TImage.Create(Form6);
      self.bild.Parent := Form6;
    end;

    //bild formatieren
    self.bild.Width := 96;
    self.bild.Height := 96;
    self.bild.stretch := true;
    self.bild.Picture.LoadFromFile('images\Boxerkanguru.png');
    self.bild.left := x;
    self.bild.top := y;
    self.bild.Visible := True;


  end;

  procedure Tkanguru.attack();
  begin

  end;

end.

