unit chooseMap;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  map1, map2;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation


{$R *.lfm}

{ TForm2 }

//map1
procedure TForm2.Image1Click(Sender: TObject);
begin
  Form5.show;
  Form2.hide;
end;

//zurück zu Mainmenu
procedure TForm2.Button1Click(Sender: TObject);
begin
  Form1.show;
  Form2.hide;
end;

//map2
procedure TForm2.Image2Click(Sender: TObject);
begin
  Form6.show;
  Form2.hide;
end;

end.
