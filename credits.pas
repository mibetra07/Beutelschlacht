unit Credits;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Memo1: TMemo;
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;

implementation
uses Menu;
{$R *.lfm}

{ TForm4 }

procedure TForm4.Image1Click(Sender: TObject);
begin
  Form1.show;
  Form4.hide;
end;

end.

