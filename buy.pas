unit buy;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, kanguru, map1, map2;

implementation

procedure buykanguru(map : integer);
begin
  if map = 1 then
  begin
    Form5.kanguru[1] := Tkanguru.create(1);

  end;
end;

end.

