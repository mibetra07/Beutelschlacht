unit chooseMap;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, map1, map2;

type

  { TForm2 }

  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel1: TPanel;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

uses Menu;

{$R *.lfm}

{ TForm2 }

//map1
procedure TForm2.Image1Click(Sender: TObject);
begin
  Form5.show;
  Form1.timer1.enabled:=false;  //Musik aus
  Form5.ConstructForm();
  Form2.hide;
end;



//map2
procedure TForm2.Image2Click(Sender: TObject);
begin
  Form6.show;
  Form1.timer1.enabled:=false; //Musik aus
  //Form6.ConstructForm();
  Form2.hide;
end;

//zurück zu Main
procedure TForm2.Image3Click(Sender: TObject);
begin
  Form1.show;
  Form2.hide;
end;

end.

