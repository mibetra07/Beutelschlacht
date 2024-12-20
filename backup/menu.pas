unit Menu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, chooseMap, map1, map2, options, credits, tutorial;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    firstactivate : boolean;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

//Kartenauswahl
procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.show;
  Form1.hide;
end;

//Tutorial
procedure TForm1.Button2Click(Sender: TObject);
begin
  Form7.show;
  Form1.hide;
end;

//Einstellungen
procedure TForm1.Button3Click(Sender: TObject);
begin
  Form3.show;
  Form1.hide;
end;

//Credits
procedure TForm1.Button4Click(Sender: TObject);
begin
  Form4.show;
  Form1.hide;
end;

//Schließt das Programm
procedure TForm1.Button5Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  firstactivate:=true;
end;

//alle Forms laden und schließen
procedure TForm1.FormActivate(Sender: TObject);
begin
  if firstactivate=true then
  begin
    Form2.show;
    Form3.show;
    Form4.show;
    Form5.show;
    Form6.show;
    Form7.show;

    Form2.hide;
    Form3.hide;
    Form4.hide;
    Form5.hide;
    Form6.hide;
    Form7.hide;

    firstactivate:=false;
  end;
end;
end.


