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
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public
    currentslide: integer;
    sentences: array[1..7, 1..7] of string;
    temp: array[1..200] of char;
    i, j, tick, display: integer;
    displaynow: boolean;
  end;

var
  Form7: TForm7;

implementation

uses Menu;
{$R *.lfm}

{ TForm7 }




procedure TForm7.FormCreate(Sender: TObject);
var ii, jj: integer;
begin
     for ii := 1 to 7 do
         for jj := 1 to 7 do
             sentences[ii, jj] := '';
     for ii := 1 to 200 do
         temp[ii] := '$';
     currentslide := 0;
     sentences[1, 1] := 'Die Pinguine wollen an unser schönes Dorf heran';
     sentences[1, 2] := 'Du musst sie aufhalten, $$$$aber wie?';
     sentences[2, 1] := 'Du hast eine Auswahl an verschiedenen Kängurus';
     sentences[2, 2] := 'Diese haben unterschiedliche Fähigkeiten, Stärken $$$$$$$und Schwächen';
     sentences[2, 3] := 'Man kann sie per drag & drop auf das Spielfeld ziehen';
     sentences[3, 1] := 'Auf dem Spielfeld können sie dann Pinguine in bestimmten Entfernungen angreifen';
     sentences[3, 2] := 'Du kannst sowohl den Schaden, $$ als auch die Range dann upgraden';
     sentences[3, 3] := ' Dazu klickst du auf das Känguru und kaufst etwas im Menü';
     sentences[3, 4] := 'Bitte kauf viele Upgrades $$$$$ ich werd dadurch finanziert';
     sentences[4, 1] := 'Oben links kannst du jederzeit über den Pfeil zurückkehren';
     sentences[4, 2] := 'Daneben siehst du deine Leben';
     sentences[4, 3] := 'Kommen zu viele Pinguine,$$$ mit zu viel Leben übrig durch, verlierst du';
     sentences[4, 4] := 'Damit du aber auch was vom besiegen der Pinguine hast, $$gibt es Geld dafür';
     sentences[4, 5] := 'Deinen Kontostand siehst du oben rechts';
     sentences[4, 6] := 'Damit kannst du dann neue Kängurus und Upgrades kaufen';
     sentences[4, 7] := 'Aus betriebsinternen Gründen, darf ich dir noch nicht verraten, $$welche Kängurus was können';
     i := 1;
     j := 1;
     tick := 1;
     displaynow := false;
     display := 0;
end;

procedure TForm7.Image1Click(Sender: TObject);
begin

end;

procedure TForm7.Timer1Timer(Sender: TObject);
var ii, jj: integer;
begin
     inc(display);
     inc(tick);
     if (sentences[i, j] <> '') and (tick mod 150 = 0) and (j <= 8) then
     begin
          displaynow := true;
     end
     else if tick mod 150 = 0 then
     begin
       inc(currentslide);
       i := currentslide;
       j := 1;
       tick := 140;
       if currentslide < 5 then
       image1.picture.loadFromFile('Images\Tutorial-'+inttostr(currentslide)+'.png')
       else
           exit;
       for ii := 1 to 100 do
           temp[ii] := '$';
       displaynow := false;
     end;
     if displaynow then
     begin
       display := 0;
       Panel1.caption := '';
       for ii := 1 to 100 do
           temp[ii] := '$';
       for ii := 1 to Length(sentences[i, j]) do
           temp[ii] := sentences[i,j][ii];
       displaynow := false;
       inc(j);
     end;
     if(temp[display] <> '$') and (display <= 200) then
        Panel1.caption := Panel1.caption + temp[display];
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
     timer1.enabled := true;
     currentslide := 1;
     image1.picture.loadFromFile('Images\Tutorial-1.png');
     Button1.visible := false;
     {inc(currentslide);
     i := currentslide;
     j := 1;
     tick := 190;
     if currentslide < 5 then
     image1.picture.loadFromFile('Images\Tutorial-'+inttostr(currentslide)+'.png');
     timer1.enabled := true;}
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
     currentslide := 1;
     image1.picture.loadFromFile('Images\Tutorial-1.png');
     i := 1;
     j := 1;
     tick := 1;
     displaynow := false;
     display := 0;
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
   Form7.hide;
   Form1.show;
end;


end.

