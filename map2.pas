unit map2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Buttons, Path, Pinguin, wave, kanguru;

type

  { TForm6 }
  TForm6 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
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
    Label13: TLabel;
    Label15: TLabel;
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
    TrackBar2: TTrackBar;
  procedure Button1Click(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure Image2Click(Sender: TObject);
  procedure Timer1Timer(Sender: TObject);
  private

  public
  ticksPassed, slowedTick : integer;
    Path: array[1..30] of Tpath;
    Pinguin: array[1..100] of TPinguin;
    HelmPinguin: array[1..100] of THelmPinguin;
    SchildPinguin: array[1..100] of TSchildPinguin;
    BossPinguin: array[1..100] of TBossPinguin;
    TarnPinguin: array[1..100] of TTarnPinguin;
    AllPinguin: array [1..300] of TPinguin;
    IndexOfKilled: array[1..5, 1..100] of integer;
    AmountKilled: array[1..5] of integer;
    KilledCount: integer;
    Pinguincount: integer;
    wave: array [1..100] of Twave;
    waveParams: array[1..100, 1..6] of integer;
    currentWave: integer;
    coins: integer;
    placable: boolean;
    Kanguru : array[1..100] of TBoxerkanguru;
    Bogenkanguru : array[1..100] of TBogenkanguru;
    Zauberkanguru : array[1..100] of TZauberkanguru;
    Ninjakanguru : array[1..100] of TNinjakanguru;
    Eiskanguru : array[1..100] of TEiskanguru;
    switch: TPinguin;
    switch1: THelmPinguin;
    switch2: TSchildPinguin;
    switch3: TTarnPinguin;
    switch4: TBossPinguin;
    var Kanguruzahl, Bogenkanguruzahl, Eiskanguruzahl, Ninjakanguruzahl, Zauberkanguruzahl : integer;
    playerHealth: integer;
  end;

var
  Form6: TForm6;

implementation
uses Menu;
{$R *.lfm}

{ TForm6 }

procedure TForm6.FormCreate(Sender: TObject);
var i: integer;
begin
  //Weg der Map erstellen (dir, left, top, breit, hoch, map: integer)
   Path[1] := TPath.create(1, 0, 300, 350, 100, 2);
   Path[2] := Tpath.create(2, 350, 300, 100, 550, 2);
   Path[3] := Tpath.create(1, 350, 850, 1000, 100, 2);
   Path[4] := Tpath.create(4, 1350, 520, 100, 450, 2);
   Path[5] := Tpath.create(3, 1100, 450, 350, 100, 2);
   Path[6] := Tpath.create(4, 1000, 200, 100, 350, 2);
   Path[7] := Tpath.create(1, 1000, 100, 450, 100, 2);
   Path[20] := TPath.create(1, 0, 0, 180, 100, 2);
   Path[21] := Tpath.create(1, 180, 0, 90, 20, 2);
   Path[22] := Tpath.create(1, 1290, 0, 180, 100,2);
   Path[23] := Tpath.create(1, 0, 650, 80, 430, 2);
   Path[24] := Tpath.create(1, 80, 800, 120, 330, 2);
   Path[25] := Tpath.create(1, 200, 1000, 1200, 120, 2);
  //Path[26] := Tpath.create(1, 1180, 690, 300, 400, 2);
   //Path[27] := Tpath.create(1, 1120, 860, 100, 80, 2);
   //Path[28] := Tpath.create(1, 1385, 550, 80, 80, 2);
    wave[1] := Twave.create(5, 5, 0, 0, 0, 2, 80);
   Timer1.Enabled := false;
   Timer1.interval := 5;
end;

procedure TForm6.Image2Click(Sender: TObject);
begin
  Form1.show;
  Form6.hide;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
  tick(2, Pinguin[1]);
end;

 procedure TForm6.Button1Click(Sender: TObject);
begin
     Timer1.enabled := true;
     Pinguin[10] := Tpinguin.create(2, 0);
end;



end.

