unit tutorial;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, Buttons, Path, Pinguin, wave, kanguru, Collision;

type

  { TForm7 }

  TForm7 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Image1: TImage;
    Image10: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public
  var time: integer;
      sentences: array [1..100] of string;
      Pinguin: array[1..100] of TPinguin;
      HelmPinguin: array[1..100] of THelmPinguin;
      wave: array [1..3] of Twave;
      Pinguincount: integer;
      Path: array[1..30] of Tpath;
      PlayerHealth: integer;
      currentsentence: integer;
  end;

var
  Form7: TForm7;

implementation

uses Menu;
{$R *.lfm}

{ TForm7 }

procedure TForm7.Image1Click(Sender: TObject);
begin
  //Form1.show;
  //Form7.hide;
end;



procedure TForm7.FormCreate(Sender: TObject);
var i: integer;
begin
 for i := 1 to length(sentences) do
     sentences[i] := '';
  Timer1.interval := 20;
  time := 0;
  currentsentence := 1;
  sentences[1] := ' Welch schöne Landschaft ';
  sentences[2] := ' und so schön ruhig ';
  sentences[6] := ' oh nein ';
  sentences[7] := ' Sie kommen ';


  //Weg der Map erstellen(dir, left, top, breit, hoch, map: integer)
   Path[1] := TPath.create(1, 0, 320, 620, 75, 1);
   Path[2] := Tpath.create(2, 620, 320, 75, 320, 1);
   Path[3] := Tpath.create(3, 300, 650, 400, 75, 1);
   Path[4] := Tpath.create(4, 250, 90, 75, 620, 1);
   Path[5] := Tpath.create(1, 250, 30, 740, 75, 1);
   Path[6] := Tpath.create(2, 990, 30, 75, 350, 1);
   Path[7] := Tpath.create(1, 990, 380, 400, 75, 1);
   //Paths, nur für Hindernisse (Platzierbarkeit Kängurus einschränken)
   Path[20] := TPath.create(1, 0, 0, 180, 100, 1);
   Path[21] := Tpath.create(1, 180, 0, 90, 20, 1);
   Path[22] := Tpath.create(1, 1290, 0, 180, 100,1);
   Path[23] := Tpath.create(1, 0, 650, 80, 430, 1);
   Path[24] := Tpath.create(1, 80, 800, 120, 330, 1);
   Path[25] := Tpath.create(1, 200, 900, 1200, 120, 1);
   Path[26] := Tpath.create(1, 1180, 690, 300, 400, 1);
   Path[27] := Tpath.create(1, 1120, 860, 100, 80, 1);
   Path[28] := Tpath.create(1, 1385, 550, 80, 80, 1);
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
     Timer1.enabled := true;
end;

procedure TForm7.Timer1Timer(Sender: TObject);
var i: integer;
begin
 if (time < 351) or (time > 352) then
 inc(time);
 if ((time > 50) and (time < 401)) or ((time > 501) and (time < 701)) and (sentences[time div 50] <> '') then
 begin
    Panel17.caption := sentences[currentsentence];
    if(time mod 50 = 0) then
            inc(currentsentence);
 end;
 if time = 300 then
    begin
         Pinguin[1] := TPinguin.create(0, 0);
         Pinguin[1].speed := 1;
    end;
 if (time > 301) and (time < 350) then
    for i := 1 to 10 do
    Pinguin[1].laufen(0)
 else if (time > 351) then
    begin
         shape6.visible := true;

    end;
end;

end.

