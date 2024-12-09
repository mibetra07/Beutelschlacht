unit kanguru;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Path;

type TKanguru = class
  public
    x, y, width, height : integer;
    bild: Timage;
    attackspeed, damage, range : integer;
    cancamo : boolean;

    constructor create();
    procedure attack();
  private

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
  constructor Tkanguru.create();
  begin
    inherited create();

  end;

  procedure Tkanguru.attack();
  begin

  end;

end.

