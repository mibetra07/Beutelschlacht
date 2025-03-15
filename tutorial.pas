unit tutorial;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus;


type

  { TForm7 }

  TForm7 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    currentslide: integer;
  end;

var
  Form7: TForm7;

implementation

uses Menu;
{$R *.lfm}

{ TForm7 }




procedure TForm7.FormCreate(Sender: TObject);
begin
     currentslide := 0;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
     inc(currentslide);
     if currentslide < 5 then
     image1.picture.loadFromFile('Images\Tutorial-'+inttostr(currentslide)+'.png');
end;


end.

