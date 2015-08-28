unit Multi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm3 = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form3: TForm3;

implementation

uses Brauerei;

{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
var Rezeptname:String;
begin
  Form3.Visible:=false;
  Form3.BitBtn1.HelpKeyWord:='true';
  Form1.BitBtn1Click(Sender);
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  Form3.Visible:=false;
  Form3.BitBtn2.HelpKeyWord:='true';
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  Edit2.Text:='';
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  Edit3.Text:='';
end;

procedure TForm3.Button7Click(Sender: TObject);
begin
  Edit4.Text:='';
end;

procedure TForm3.Button9Click(Sender: TObject);
begin
  Edit5.Text:='';
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  Form1.OpenDialog1.FileName:='';
  if Form1.OpenDialog1.Execute then Edit1.Text:=Form1.OpenDialog1.FileName;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  Form1.OpenDialog1.FileName:='';
  if Form1.OpenDialog1.Execute then Edit2.Text:=Form1.OpenDialog1.FileName;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  Form1.OpenDialog1.FileName:='';
  if Form1.OpenDialog1.Execute then Edit3.Text:=Form1.OpenDialog1.FileName;
end;

procedure TForm3.Button8Click(Sender: TObject);
begin
  Form1.OpenDialog1.FileName:='';
  if Form1.OpenDialog1.Execute then Edit4.Text:=Form1.OpenDialog1.FileName;
end;

procedure TForm3.Button10Click(Sender: TObject);
begin
  Form1.OpenDialog1.FileName:='';
  if Form1.OpenDialog1.Execute then Edit5.Text:=Form1.OpenDialog1.FileName;
end;

procedure TForm3.FormShow(Sender: TObject);
var wfaktor:extended;
begin
  wfaktor:=strtofloat(form1.Edit95.Text);
  scaleby(round(wfaktor*100 * (582 / Form3.Width)),100);
  Form3.Width := round(582 * wfaktor);
  Form3.Height := round(265 * wfaktor);
end;

end.
