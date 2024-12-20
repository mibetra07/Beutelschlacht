unit tutorial;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm7 }

  TForm7 = class(TForm)
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  Form7: TForm7;

implementation

uses Menu;
{$R *.lfm}

{ TForm7 }

procedure TForm7.Image1Click(Sender: TObject);
begin
  Form1.show;
  Form7.hide;
end;

end.

