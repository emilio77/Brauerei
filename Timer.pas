unit Timer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls ;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label4: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

uses Brauerei;

{$R *.dfm}

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked=true then
  begin
    CheckBox2.Checked:=false;
    CheckBox3.Checked:=false;
  end;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked=true then
  begin
    CheckBox1.Checked:=false;
    CheckBox3.Checked:=false;
  end;
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked=true then
  begin
    CheckBox1.Checked:=false;
    CheckBox2.Checked:=false;
  end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Label5.Caption:='false';
  Form2.Visible:=false;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Form2.Visible:=false;
  Label5.Caption:='true';
  DateTimePicker1.Time:=DateTimePicker2.Time;
  DateTimePicker2.Date:=DateTimePicker1.Date;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
var Intdummy: integer;
begin
  try Intdummy:=strtoint(form2.edit2.Text) except begin form2.edit2.Text:='10'; ShowMessagePos('Unerlaubte Eingabe!', Form2.Left+50, Form2.Top+50); end; end;
  if (Intdummy>99) or (Intdummy<0) then begin form2.edit2.Text:='10'; ShowMessagePos('Unerlaubte Eingabe!', Form2.Left+50, Form2.Top+50); end;
end;



procedure TForm2.FormShow(Sender: TObject);
var wfaktor:extended;
begin
  wfaktor:=strtofloat(form1.Edit95.Text);
  scaleby(round(wfaktor*100 * (296 / Form2.Width)),100);
  Form2.Width := round(296 * wfaktor);
  Form2.Height := round(246 * wfaktor);
end;

end.
