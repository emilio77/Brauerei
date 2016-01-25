unit Funktionsbezeichnungen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form4: TForm4;

implementation

uses Brauerei;

{$R *.dfm}

procedure TForm4.BitBtn1Click(Sender: TObject);
var i,j:integer;
begin
  Form4.Visible:=false;
  Brauerei.Funktionstextuebernahme;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
  Form4.Visible:=false;
end;

procedure TForm4.FormShow(Sender: TObject);
var wfaktor:extended;
    i:integer;
begin
  for i:= 1 to 10 do (FindComponent('Edit' + IntToStr(i)) as TEdit).Text:=Brauerei.Form1.ZF_HA1.Items.Strings[i];
  wfaktor:=strtofloat(form1.Edit95.Text);
  scaleby(round(wfaktor*100 * (500 / Form4.Width)),100);
  Form4.Width := round(500 * wfaktor);
  Form4.Height := round(250 * wfaktor);
end;

procedure TForm4.FormHide(Sender: TObject);
begin
  Brauerei.Form1.Enabled:=true;
end;

end.
