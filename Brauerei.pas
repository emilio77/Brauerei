unit Brauerei;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, Menus, ExtCtrls, jpeg, TeeProcs, TeEngine,
  Chart, DbChart, ComCtrls, Grids, Series, OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    TimerHAus: TTimer;
    TimerREin: TTimer;
    TimerRAus: TTimer;
    TimerHEin: TTimer;
    TimerAAus: TTimer;
    TimerAEin: TTimer;
    MessageTimer: TTimer;
    TimerHSet: TTimer;
    Timer2: TTimer;
    Image1: TImage;
    Panel1: TPanel;
    Edit51: TEdit;
    Edit52: TEdit;
    Label58: TLabel;
    Label57: TLabel;
    LogTimer: TTimer;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet2: TTabSheet;
    Button16: TButton;
    Chart1: TChart;
    StringGrid1: TStringGrid;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Chart2: TChart;
    Series3: TAreaSeries;
    Chart3: TChart;
    Series4: TAreaSeries;
    Chart4: TChart;
    Chart5: TChart;
    Series5: TAreaSeries;
    Series6: TAreaSeries;
    WebBrowser1: TWebBrowser;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label23: TLabel;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Gauge4: TGauge;
    Gauge5: TGauge;
    Gauge6: TGauge;
    Gauge7: TGauge;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Gauge8: TGauge;
    Gauge9: TGauge;
    Gauge10: TGauge;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Edit3: TEdit;
    CheckBox2: TCheckBox;
    Edit4: TEdit;
    Edit5: TEdit;
    CheckBox3: TCheckBox;
    Edit6: TEdit;
    Edit7: TEdit;
    CheckBox4: TCheckBox;
    Edit8: TEdit;
    Edit9: TEdit;
    CheckBox5: TCheckBox;
    Edit10: TEdit;
    Edit11: TEdit;
    CheckBox6: TCheckBox;
    Edit12: TEdit;
    Edit13: TEdit;
    CheckBox7: TCheckBox;
    Edit14: TEdit;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button14: TButton;
    Button15: TButton;
    CheckBox31: TCheckBox;
    Edit15: TEdit;
    CheckBox8: TCheckBox;
    Edit16: TEdit;
    Edit17: TEdit;
    CheckBox9: TCheckBox;
    Edit18: TEdit;
    Edit19: TEdit;
    CheckBox10: TCheckBox;
    Edit20: TEdit;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Button6: TButton;
    Button7: TButton;
    Button12: TButton;
    Button13: TButton;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    CheckBox32: TCheckBox;
    Panel3: TPanel;
    Label59: TLabel;
    Edit53: TEdit;
    Label60: TLabel;
    Gauge11: TGauge;
    CheckBox34: TCheckBox;
    Button17: TButton;
    Edit54: TEdit;
    Edit55: TEdit;
    Label61: TLabel;
    Label62: TLabel;
    Panel4: TPanel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Button18: TButton;
    Button19: TButton;
    Button21: TButton;
    Button22: TButton;
    Button20: TButton;
    SimulationTimer: TTimer;
    Label66: TLabel;
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TimerREinTimer(Sender: TObject);
    procedure TimerRAusTimer(Sender: TObject);
    procedure TimerHEinTimer(Sender: TObject);
    procedure TimerHAusTimer(Sender: TObject);
    procedure TimerHSetTimer(Sender: TObject);
    procedure TimerAAusTimer(Sender: TObject);
    procedure TimerAEinTimer(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit31Exit(Sender: TObject);
    procedure Edit41Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit33Exit(Sender: TObject);
    procedure Edit43Exit(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit32Exit(Sender: TObject);
    procedure Edit42Exit(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure Edit34Exit(Sender: TObject);
    procedure Edit44Exit(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure CheckBox31Click(Sender: TObject);
    procedure LogTimerTimer(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Edit55KeyPress(Sender: TObject; var Key: Char);
    procedure Edit54KeyPress(Sender: TObject; var Key: Char);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure SimulationTimerTimer(Sender: TObject);
    procedure Edit54Change(Sender: TObject);
    procedure Edit55Change(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
    procedure Edit17Exit(Sender: TObject);
    procedure Edit19Exit(Sender: TObject);
    procedure Edit38Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit14Exit(Sender: TObject);
    procedure Edit16Exit(Sender: TObject);
    procedure Edit18Exit(Sender: TObject);
    procedure Edit20Exit(Sender: TObject);
    procedure Edit47Exit(Sender: TObject);
    procedure Edit35Exit(Sender: TObject);
    procedure Edit36Exit(Sender: TObject);
    procedure Edit37Exit(Sender: TObject);
    procedure Edit39Exit(Sender: TObject);
    procedure Edit40Exit(Sender: TObject);
    procedure Edit45Exit(Sender: TObject);
    procedure Edit46Exit(Sender: TObject);
    procedure Edit48Exit(Sender: TObject);
    procedure Edit49Exit(Sender: TObject);
    procedure Edit50Exit(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  sl,sl2: TStringList;
  Temperatur,x,Graphic,Steuerung,LogName: String;
  Tempfloat,Solltemp,Deltatemp,SimTemp: Extended;
  zeilennr,Ruehrwerk,Heizung,Alarm,Pumpe,HWert,RWert,PWert,AWert,LPTCode,
  zeit,zeit2,zeit3,zeitpause,fortschritt,rast,REin,RAus,Intdummy,
  CountLines, gesfortschritt, rastzahl, startpunkt, endpunkt, y: integer;
  Port: word;
  myFile,myLogFile,SimFile: TextFile;
  pause,start,stop,AlarmEin,Rasttemp1,Rasttemp2,Rasttemp3,Rasttemp4,Rasttemp5,
  Rasttemp6,Rasttemp7,Rasttemp8,Rasttemp9,Rasttemp10,Rastnull1,Rastnull2,
  Rastnull3,Rastnull4,Rastnull5,Rastnull6,Rastnull7,Rastnull8,Rastnull9,
  Rastnull10,Rastende: boolean;

implementation

{$R *.dfm}



procedure TForm1.Button7Click(Sender: TObject);
begin
   Button1.Visible:=false;
   Button2.Visible:=false;
   Button3.Visible:=false;
   Button4.Visible:=false;
   Button5.Visible:=false;
   Button6.Visible:=true;
   Button7.Visible:=false;
   Button14.Visible:=false;
   Button15.Visible:=false;
   Label24.Visible:=false;
   Label25.Visible:=false;
   Label26.Visible:=false;
   Label27.Visible:=false;
   Label28.Visible:=false;
   Label29.Visible:=false;
   Label30.Visible:=false;
   Label31.Visible:=false;
   Label32.Visible:=false;
   Label33.Visible:=false;
   Label34.Visible:=false;
   Label35.Visible:=false;
   Gauge10.Visible:=false;
   Gauge1.Visible:=false;
   Gauge2.Visible:=false;
   Gauge3.Visible:=false;
   Gauge4.Visible:=false;
   Gauge5.Visible:=false;
   Gauge6.Visible:=false;
   Gauge7.Visible:=false;
   Gauge8.Visible:=false;
   Gauge9.Visible:=false;
   Edit21.Visible:=false;
   Edit22.Visible:=false;
   Edit23.Visible:=false;
   Edit24.Visible:=false;
   Edit25.Visible:=false;
   Edit26.Visible:=false;
   Edit27.Visible:=false;
   Edit28.Visible:=false;
   Edit29.Visible:=false;
   Edit30.Visible:=false;
   Button8.Visible:=true;
   Button9.Visible:=true;
   Button10.Visible:=true;
   Button11.Visible:=true;
   Button20.Visible:=true;
   Steuerung:='Auto';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   Button1.Visible:=true;
   Button2.Visible:=true;
   Button3.Visible:=true;
   Button4.Visible:=true;
   Button5.Visible:=true;
   Button6.Visible:=false;
   Button7.Visible:=true;
   Button14.Visible:=true;
   Button15.Visible:=true;
   Label24.Visible:=true;
   Label25.Visible:=true;
   if (start=false) or ((CheckBox10.Checked=true) and (Edit20.Text<>'0')) then begin Gauge10.Visible:=true; Edit30.Visible:=true; Label35.Visible:=true; end;
   if (start=false) or ((CheckBox1.Checked=true) and (Edit2.Text<>'0')) then begin Gauge1.Visible:=true; Edit21.Visible:=true; Label26.Visible:=true; end;
   if (start=false) or ((CheckBox2.Checked=true) and (Edit4.Text<>'0')) then begin Gauge2.Visible:=true; Edit22.Visible:=true; Label27.Visible:=true; end;
   if (start=false) or ((CheckBox3.Checked=true) and (Edit6.Text<>'0')) then begin Gauge3.Visible:=true; Edit23.Visible:=true; Label28.Visible:=true; end;
   if (start=false) or ((CheckBox4.Checked=true) and (Edit8.Text<>'0')) then begin Gauge4.Visible:=true; Edit24.Visible:=true; Label29.Visible:=true; end;
   if (start=false) or ((CheckBox5.Checked=true) and (Edit10.Text<>'0')) then begin Gauge5.Visible:=true; Edit25.Visible:=true; Label30.Visible:=true; end;
   if (start=false) or ((CheckBox6.Checked=true) and (Edit12.Text<>'0')) then begin Gauge6.Visible:=true; Edit26.Visible:=true; Label31.Visible:=true; end;
   if (start=false) or ((CheckBox7.Checked=true) and (Edit14.Text<>'0')) then begin Gauge7.Visible:=true; Edit27.Visible:=true; Label32.Visible:=true; end;
   if (start=false) or ((CheckBox8.Checked=true) and (Edit16.Text<>'0')) then begin Gauge8.Visible:=true; Edit28.Visible:=true; Label33.Visible:=true; end;
   if (start=false) or ((CheckBox9.Checked=true) and (Edit18.Text<>'0')) then begin Gauge9.Visible:=true; Edit29.Visible:=true; Label34.Visible:=true; end;
   Button8.Visible:=false;
   Button9.Visible:=false;
   Button10.Visible:=false;
   Button11.Visible:=false;
   Button20.Visible:=false;
   Steuerung:='Manuell';
end;

procedure Out32(wAddr:word;bOut:byte); stdcall; external 'inpout32.dll'

function Inp32(wAddr:word):integer; stdcall; external 'inpout32.dll'

procedure speichern(Form:TForm1; filename:string);
begin
  AssignFile(myFile, filename);
  ReWrite(myFile);
  WriteLn(myFile, Form.Edit1.Text);
  WriteLn(myFile, Form.Edit2.Text);
  WriteLn(myFile, Form.Edit3.Text);
  WriteLn(myFile, Form.Edit4.Text);
  WriteLn(myFile, Form.Edit5.Text);
  WriteLn(myFile, Form.Edit6.Text);
  WriteLn(myFile, Form.Edit7.Text);
  WriteLn(myFile, Form.Edit8.Text);
  WriteLn(myFile, Form.Edit9.Text);
  WriteLn(myFile, Form.Edit10.Text);
  WriteLn(myFile, Form.Edit11.Text);
  WriteLn(myFile, Form.Edit12.Text);
  WriteLn(myFile, Form.Edit13.Text);
  WriteLn(myFile, Form.Edit14.Text);
  WriteLn(myFile, Form.Edit15.Text);
  WriteLn(myFile, Form.Edit16.Text);
  WriteLn(myFile, Form.Edit17.Text);
  WriteLn(myFile, Form.Edit18.Text);
  WriteLn(myFile, Form.Edit19.Text);
  WriteLn(myFile, Form.Edit20.Text);
  WriteLn(myFile, Form.Edit31.Text);
  WriteLn(myFile, Form.Edit32.Text);
  WriteLn(myFile, Form.Edit33.Text);
  WriteLn(myFile, Form.Edit34.Text);
  WriteLn(myFile, Form.Edit35.Text);
  WriteLn(myFile, Form.Edit36.Text);
  WriteLn(myFile, Form.Edit37.Text);
  WriteLn(myFile, Form.Edit38.Text);
  WriteLn(myFile, Form.Edit39.Text);
  WriteLn(myFile, Form.Edit40.Text);
  WriteLn(myFile, Form.Edit41.Text);
  WriteLn(myFile, Form.Edit42.Text);
  WriteLn(myFile, Form.Edit43.Text);
  WriteLn(myFile, Form.Edit44.Text);
  WriteLn(myFile, Form.Edit45.Text);
  WriteLn(myFile, Form.Edit46.Text);
  WriteLn(myFile, Form.Edit47.Text);
  WriteLn(myFile, Form.Edit48.Text);
  WriteLn(myFile, Form.Edit49.Text);
  WriteLn(myFile, Form.Edit50.Text);
  WriteLn(myFile, Form.CheckBox1.Checked);
  WriteLn(myFile, Form.CheckBox2.Checked);
  WriteLn(myFile, Form.CheckBox3.Checked);
  WriteLn(myFile, Form.CheckBox4.Checked);
  WriteLn(myFile, Form.CheckBox5.Checked);
  WriteLn(myFile, Form.CheckBox6.Checked);
  WriteLn(myFile, Form.CheckBox7.Checked);
  WriteLn(myFile, Form.CheckBox8.Checked);
  WriteLn(myFile, Form.CheckBox9.Checked);
  WriteLn(myFile, Form.CheckBox10.Checked);
  WriteLn(myFile, Form.CheckBox11.Checked);
  WriteLn(myFile, Form.CheckBox12.Checked);
  WriteLn(myFile, Form.CheckBox13.Checked);
  WriteLn(myFile, Form.CheckBox14.Checked);
  WriteLn(myFile, Form.CheckBox15.Checked);
  WriteLn(myFile, Form.CheckBox16.Checked);
  WriteLn(myFile, Form.CheckBox17.Checked);
  WriteLn(myFile, Form.CheckBox18.Checked);
  WriteLn(myFile, Form.CheckBox19.Checked);
  WriteLn(myFile, Form.CheckBox20.Checked);
  WriteLn(myFile, Form.CheckBox21.Checked);
  WriteLn(myFile, Form.CheckBox22.Checked);
  WriteLn(myFile, Form.CheckBox23.Checked);
  WriteLn(myFile, Form.CheckBox24.Checked);
  WriteLn(myFile, Form.CheckBox25.Checked);
  WriteLn(myFile, Form.CheckBox26.Checked);
  WriteLn(myFile, Form.CheckBox27.Checked);
  WriteLn(myFile, Form.CheckBox28.Checked);
  WriteLn(myFile, Form.CheckBox29.Checked);
  WriteLn(myFile, Form.CheckBox30.Checked);
end;

procedure settings_speichern(Form:TForm1; filename:string);
begin
  WriteLn(myFile, Form.Edit54.Text);
  WriteLn(myFile, Form.Edit55.Text);
  WriteLn(myFile, Form.CheckBox31.Checked);
  WriteLn(myFile, Form.CheckBox32.Checked);
  WriteLn(myFile, Form.CheckBox34.Checked);
end;

procedure laden(Form:TForm1; filename:string);
begin
  AssignFile(myFile, filename);
  Reset(myFile);
  ReadLn(myFile, x); Form.Edit1.Text:=x;
  ReadLn(myFile, x); Form.Edit2.Text:=x;
  ReadLn(myFile, x); Form.Edit3.Text:=x;
  ReadLn(myFile, x); Form.Edit4.Text:=x;
  ReadLn(myFile, x); Form.Edit5.Text:=x;
  ReadLn(myFile, x); Form.Edit6.Text:=x;
  ReadLn(myFile, x); Form.Edit7.Text:=x;
  ReadLn(myFile, x); Form.Edit8.Text:=x;
  ReadLn(myFile, x); Form.Edit9.Text:=x;
  ReadLn(myFile, x); Form.Edit10.Text:=x;
  ReadLn(myFile, x); Form.Edit11.Text:=x;
  ReadLn(myFile, x); Form.Edit12.Text:=x;
  ReadLn(myFile, x); Form.Edit13.Text:=x;
  ReadLn(myFile, x); Form.Edit14.Text:=x;
  ReadLn(myFile, x); Form.Edit15.Text:=x;
  ReadLn(myFile, x); Form.Edit16.Text:=x;
  ReadLn(myFile, x); Form.Edit17.Text:=x;
  ReadLn(myFile, x); Form.Edit18.Text:=x;
  ReadLn(myFile, x); Form.Edit19.Text:=x;
  ReadLn(myFile, x); Form.Edit20.Text:=x;
  ReadLn(myFile, x); Form.Edit31.Text:=x;
  ReadLn(myFile, x); Form.Edit32.Text:=x;
  ReadLn(myFile, x); Form.Edit33.Text:=x;
  ReadLn(myFile, x); Form.Edit34.Text:=x;
  ReadLn(myFile, x); Form.Edit35.Text:=x;
  ReadLn(myFile, x); Form.Edit36.Text:=x;
  ReadLn(myFile, x); Form.Edit37.Text:=x;
  ReadLn(myFile, x); Form.Edit38.Text:=x;
  ReadLn(myFile, x); Form.Edit39.Text:=x;
  ReadLn(myFile, x); Form.Edit40.Text:=x;
  ReadLn(myFile, x); Form.Edit41.Text:=x;
  ReadLn(myFile, x); Form.Edit42.Text:=x;
  ReadLn(myFile, x); Form.Edit43.Text:=x;
  ReadLn(myFile, x); Form.Edit44.Text:=x;
  ReadLn(myFile, x); Form.Edit45.Text:=x;
  ReadLn(myFile, x); Form.Edit46.Text:=x;
  ReadLn(myFile, x); Form.Edit47.Text:=x;
  ReadLn(myFile, x); Form.Edit48.Text:=x;
  ReadLn(myFile, x); Form.Edit49.Text:=x;
  ReadLn(myFile, x); Form.Edit50.Text:=x;
  ReadLn(myFile, x); Form.CheckBox1.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox2.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox3.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox4.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox5.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox6.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox7.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox8.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox9.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox10.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox11.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox12.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox13.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox14.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox15.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox16.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox17.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox18.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox19.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox20.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox21.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox22.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox23.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox24.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox25.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox26.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox27.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox28.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox29.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox30.Checked:=strtobool(x);
end;

procedure settings_laden(Form:TForm1; filename:string);
begin
  ReadLn(myFile, x); Form.Edit54.Text:=x;
  ReadLn(myFile, x); Form.Edit55.Text:=x;
  ReadLn(myFile, x); Form.CheckBox31.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox32.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox34.Checked:=strtobool(x);
end;

procedure writechart(Form:TForm1; zoom:boolean);
var
  I:Integer;
  s,t: TLineSeries;
  s2: TAreaSeries;
begin
  if zoom=false then
  begin
    startpunkt:=0;
    endpunkt:=CountLines;
  end;
  with Form.Chart1 do
  begin
    s := Form.Series1;  // Kurve erstellen
    t := Form.Series2;  // Kurve erstellen
    s.Clear;  // Inhalt von der Kurve loeschen
    t.Clear;
    s.ParentChart := Form.Chart1; // Kurve an Chart festbinden
    s.XValues.DateTime := True;
    BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
    BottomAxis.Minimum := 0;
    BottomAxis.Maximum := StrToTime(Form.StringGrid1.Cells[1,endpunkt-1]);
    BottomAxis.Minimum := StrToTime(Form.StringGrid1.Cells[1,startpunkt]);
    LeftAxis.Minimum := 0;
    LeftAxis.Maximum := StrToFloat(Form.StringGrid1.Cells[6,startpunkt])+1;
    LeftAxis.Minimum := StrToFloat(Form.StringGrid1.Cells[6,startpunkt]);
    BottomAxis.Automatic := False;
    LeftAxis.Automatic := False;
    for i:= startpunkt to endpunkt-1 do
    begin
       s.AddXY(StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[6,i]));
       if LeftAxis.Maximum<StrToFloat(Form.StringGrid1.Cells[6,i])+2 then LeftAxis.Maximum:=StrToFloat(Form.StringGrid1.Cells[6,i])+2;
       if LeftAxis.Minimum>StrToFloat(Form.StringGrid1.Cells[6,i])-2 then LeftAxis.Minimum:=StrToFloat(Form.StringGrid1.Cells[6,i])-2;
    end;
    t.ParentChart := Form.Chart1; // Kurve an Chart festbinden
    for i:= startpunkt to endpunkt-1 do
    begin
       t.AddXY(StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[7,i]));
       if LeftAxis.Maximum<StrToFloat(Form.StringGrid1.Cells[7,i])+2 then LeftAxis.Maximum:=StrToFloat(Form.StringGrid1.Cells[7,i])+2;
       if LeftAxis.Minimum>StrToFloat(Form.StringGrid1.Cells[7,i])-2 then LeftAxis.Minimum:=StrToFloat(Form.StringGrid1.Cells[7,i])-2;
    end;
  end;
  with Form.Chart2 do
  begin
    s2 := form.series3;  // Kurve erstellen
    s2.Clear;  // Inhalt von der Kurve loeschen
    s2.ParentChart := Form.Chart2; // Kurve an Chart festbinden
    s2.XValues.DateTime := True;
    BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
    BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
    BottomAxis.Minimum := 0;
    BottomAxis.Maximum := StrToTime(Form.StringGrid1.Cells[1,endpunkt-1]);
    BottomAxis.Minimum := StrToTime(Form.StringGrid1.Cells[1,startpunkt]);
    LeftAxis.Maximum := 1.05;
    LeftAxis.Minimum := -0.05;
    BottomAxis.Automatic := False;
    LeftAxis.Automatic := False;
    for i:= startpunkt to endpunkt-1 do
    begin
      if i>0 then s2.AddXY(StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[2,i-1]));
      s2.AddXY(StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[2,i]));
    end;
  end;
  with Form.Chart3 do
  begin
    s2 := Form.series4;  // Kurve erstellen
    s2.Clear;  // Inhalt von der Kurve loeschen
    s2.ParentChart := Form.Chart3; // Kurve an Chart festbinden
    s2.XValues.DateTime := True;
    BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
    BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
    BottomAxis.Minimum := 0;
    BottomAxis.Maximum := StrToTime(Form.StringGrid1.Cells[1,endpunkt-1]);
    BottomAxis.Minimum := StrToTime(Form.StringGrid1.Cells[1,startpunkt]);    BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
    LeftAxis.Maximum := 1.05;
    LeftAxis.Minimum := -0.05;
    BottomAxis.Automatic := False;
    LeftAxis.Automatic := False;
    for i:= startpunkt to endpunkt-1 do
    begin
      if i>0 then s2.AddXY(StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[3,i-1]));
      s2.AddXY(StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[3,i]));
    end;
  end;
  with Form.Chart4 do
  begin
    s2 := Form.series5;  // Kurve erstellen
    s2.Clear;  // Inhalt von der Kurve loeschen
    s2.ParentChart := Form.Chart4; // Kurve an Chart festbinden
    s2.XValues.DateTime := True;
    BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
    BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
    BottomAxis.Minimum := 0;
    BottomAxis.Maximum := StrToTime(Form.StringGrid1.Cells[1,endpunkt-1]);
    BottomAxis.Minimum := StrToTime(Form.StringGrid1.Cells[1,startpunkt]);
    LeftAxis.Maximum := 1.05;
    LeftAxis.Minimum := -0.05;
    BottomAxis.Automatic := False;
    LeftAxis.Automatic := False;
    for i:= startpunkt to endpunkt-1 do
    begin
      if i>0 then s2.AddXY(StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[4,i-1]));
      s2.AddXY(StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[4,i]));
    end;
  end;
  with Form.Chart5 do
  begin
    s2 := Form.series6;  // Kurve erstellen
    s2.Clear;  // Inhalt von der Kurve loeschen
    s2.ParentChart := Form.Chart5; // Kurve an Chart festbinden
    s2.XValues.DateTime := True;
    BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
    BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
    BottomAxis.Minimum := 0;
    BottomAxis.Maximum := StrToTime(Form.StringGrid1.Cells[1,endpunkt-1]);
    BottomAxis.Minimum := StrToTime(Form.StringGrid1.Cells[1,startpunkt]);
    LeftAxis.Maximum := 1.05;
    LeftAxis.Minimum := -0.05;
    BottomAxis.Automatic := False;
    LeftAxis.Automatic := False;
    for i:= startpunkt to endpunkt-1 do
    begin
      if i>0 then s2.AddXY(StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[5,i-1]));
      s2.AddXY(StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[5,i]));
    end;
  end;

end;

procedure ReadTabFile(FN: TFileName; FieldSeparator: Char; SG: TStringGrid);
var
  i: Integer;
  S: string;
  Colonne, ligne: Integer;
  Les_Strings: TStringList;
  TabPos: Integer;
  StartPos: Integer;
  InitialCol: Integer;
begin
  Les_Strings := TStringList.Create;
  try
    Les_Strings.LoadFromFile(FN);                        // Load the file, Datei laden
    CountLines := Les_Strings.Count + SG.FixedRows;      // Get the number of rows, Anzahl der Zeilen ermitteln
    SG.RowCount := CountLines;                           // Adjust Grid dimensions, Anpassung der Grid-Gr��e
    SG.ColCount := 8;
    InitialCol := SG.FixedCols - 1;                      // Initialisierung
    Ligne := SG.FixedRows - 1;
    for i := 0 to Les_Strings.Count - 1 do               // Iterate through all rows of the table
    begin
      Colonne := InitialCol;
      Inc(Ligne);
      StartPos := 1;
      S := Les_Strings[i];
      TabPos := Pos(FieldSeparator, S);
      repeat
        Inc(Colonne);
        SG.Cells[Colonne, Ligne] := Copy(S, StartPos, TabPos - 1);
        S := Copy(S, TabPos + 1, 999);
        TabPos := Pos(FieldSeparator, S);
      until TabPos = 0;
    end;
  finally
    Les_Strings.Free;
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if Button8.Caption='R�hrwerk Ein' then begin Button8.Caption:='R�hrwerk Aus'; Ruehrwerk:=RWert; Image3.Picture.LoadFromFile('C:\Brauerei\Graphics\Ruehrwerk-ein.jpg'); end else begin Button8.Caption:='R�hrwerk Ein'; Ruehrwerk:=0; Image3.Picture.LoadFromFile('C:\Brauerei\Graphics\Ruehrwerk-aus.jpg'); end;
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  try Edit52.Text:=inttostr(LPTCode); finally end;
  Out32(Port,LPTCode);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if Button9.Caption='Heizung Ein' then begin Button9.Caption:='Heizung Aus'; Heizung:=HWert; Image2.Picture.LoadFromFile('C:\Brauerei\Graphics\Feuer-ein.jpg') end else begin Button9.Caption:='Heizung Ein'; Heizung:=0; Image2.Picture.LoadFromFile('C:\Brauerei\Graphics\Feuer-aus.jpg') end;
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  try Edit52.Text:=inttostr(LPTCode); finally end;
  Out32(Port,LPTCode);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  if Button10.Caption='Pumpe Ein' then begin Button10.Caption:='Pumpe Aus'; Pumpe:=PWert; Image4.Picture.LoadFromFile('C:\Brauerei\Graphics\Pumpe-ein.jpg') end else begin Button10.Caption:='Pumpe Ein'; Pumpe:=0; Image4.Picture.LoadFromFile('C:\Brauerei\Graphics\Pumpe-aus.jpg') end;
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  try Edit52.Text:=inttostr(LPTCode); finally end;
  Out32(Port,LPTCode);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  if Button11.Caption='Alarm Ein' then begin Button11.Caption:='Alarm Aus'; Alarm:=AWert; Image6.Picture.LoadFromFile('C:\Brauerei\Graphics\Alarm-ein.jpg') end else begin Button11.Caption:='Alarm Ein'; Alarm:=0; Image6.Picture.LoadFromFile('C:\Brauerei\Graphics\Alarm-aus.jpg') end;
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  try Edit52.Text:=inttostr(LPTCode); finally end;
  Out32(Port,LPTCode);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  buttonSelected:integer;
  tf:extended;
  tfs:string;
begin
  try
    sl:=TStringList.Create; //Objekt erzeugen
    sl.LoadFromFile('C:\Brauerei\Temperatur\log.txt');  //Datei in Stringliste laden
    sl2:=TStringList.Create;
    try
      sl2.Delimiter:=';';
      sl2.DelimitedText:=sl[sl.Count-1];
      Temperatur:=sl2[sl2.Count-1]+' �C';
      try
        Tempfloat:=strtofloat(sl2[sl2.Count-1]);
      except
        Tempfloat:=0;
        Temperatur:='0.0 �C';
      end;
      try
        tf:=strtofloat(sl2[sl2.Count-1]);
        tfs:=floattostr(round(tf));
        Graphic:='C:\Brauerei\Graphics\Thermo'+tfs+'.jpg';
        Image1.Picture.LoadFromFile(Graphic);
      except
        Timer1.Enabled:=false;
        buttonSelected:=MessageDlg('Unzul�ssiger Temperaturwert ' + #13 + '- Temperaturmessung fortsetzen?', mtWarning, [mbAbort,mbRetry], 0);
        if buttonSelected = mrRetry then Timer1.Enabled:=true;
      end;
    finally
      sl2.Free;
    end;
  finally
    sl.free; //Objekt wieder freigeben
  end;
  panel1.Caption:=Temperatur;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  self.DoubleBuffered:=true;
  PageControl1.ActivePage:=TabSheet1;
  if FileExists('C:\Brauerei\Setup\settings.txt') then
  begin
    laden(Form1, 'C:\Brauerei\Setup\settings.txt');
    settings_laden(Form1, 'C:\Brauerei\Setup\settings.txt');
    CloseFile(myFile);
  end;
  AlarmEin:=false;
  pause:=false;
  stop:=true;
  start:=false;
  if DeleteFile('C:\Brauerei\Temperatur\log.txt') then ;
  AssignFile(myFile, 'C:\Brauerei\Temperatur\log.txt');
  ReWrite(myFile);
  Writeln(myFile, '01-01-2000 00:00:00;21.0');
  CloseFile(myFile);
  Timer1.Enabled:=true;
  DecimalSeparator:='.';
  Steuerung:='Auto';
  try
    sl:=TStringList.Create; //Objekt erzeugen
    sl.LoadFromFile('C:\Brauerei\Setup\Setup.txt');  //Datei in Stringliste laden
    sl2:=TStringList.Create;
    sl2.Delimiter:=';';
    try
      sl2.DelimitedText:=sl[0];
      Port:=strtoint(sl2[sl2.Count-1]);
      sl2.DelimitedText:=sl[1];
      HWert:=strtoint(sl2[sl2.Count-1]);
      sl2.DelimitedText:=sl[2];
      RWert:=strtoint(sl2[sl2.Count-1]);
      sl2.DelimitedText:=sl[3];
      PWert:=strtoint(sl2[sl2.Count-1]);
      sl2.DelimitedText:=sl[4];
      AWert:=strtoint(sl2[sl2.Count-1]);
    finally
      sl2.Free;
    end;
  finally
    sl.Free;
  end;
  Edit51.Text:=inttostr(Port);
  Ruehrwerk:=0;
  Heizung:=0;
  Alarm:=0;
  Pumpe:=0;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if DeleteFile(SaveDialog1.FileName) then MessageDlg('Rezept wurde �berschrieben !', mtInformation, [mbOK], 0);
    speichern(Form1, SaveDialog1.FileName);
    CloseFile(myFile);
  end;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  OpenDialog1.FileName:='';
  if OpenDialog1.Execute then
  begin;
    laden(Form1, OpenDialog1.FileName);
    CloseFile(myFile);
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  TimerHEin.Interval:=1000;
  TimerHAus.Interval:=1000;
  TimerHSet.Enabled:=true;
  if start=false then
  begin
    if pause=false then
    begin
      Image3.Picture.LoadFromFile('C:\Brauerei\Graphics\Ruehrwerk-aus.jpg');
      Image2.Picture.LoadFromFile('C:\Brauerei\Graphics\Feuer-aus.jpg');
      Image6.Picture.LoadFromFile('C:\Brauerei\Graphics\Alarm-aus.jpg');
      LPTCode:=Pumpe;
      try Edit52.Text:=inttostr(LPTCode); finally end;
      Out32(Port,LPTCode);
      if checkbox32.Checked=true then
      begin
        LogName:=FormatDateTime('ddmmyyyyhhnnss', now);
        LogTimer.Enabled:=true;
        LogName:='C:\Brauerei\log\log_'+LogName+'.log';
        AssignFile(myLogFile, LogName);
        rewrite(myLogFile);
      end;
      if CheckBox1.Checked=true then Edit21.Text:=Edit2.Text else Edit21.Text:='0';
      if CheckBox2.Checked=true then Edit22.Text:=Edit4.Text else Edit22.Text:='0';
      if CheckBox3.Checked=true then Edit23.Text:=Edit6.Text else Edit23.Text:='0';
      if CheckBox4.Checked=true then Edit24.Text:=Edit8.Text else Edit24.Text:='0';
      if CheckBox5.Checked=true then Edit25.Text:=Edit10.Text else Edit25.Text:='0';
      if CheckBox6.Checked=true then Edit26.Text:=Edit12.Text else Edit26.Text:='0';
      if CheckBox7.Checked=true then Edit27.Text:=Edit14.Text else Edit27.Text:='0';
      if CheckBox8.Checked=true then Edit28.Text:=Edit16.Text else Edit28.Text:='0';
      if CheckBox9.Checked=true then Edit29.Text:=Edit18.Text else Edit29.Text:='0';
      if CheckBox10.Checked=true then Edit30.Text:=Edit20.Text else Edit30.Text:='0';
      if (CheckBox1.Checked=true) and (Edit2.Text='0') then Rastnull1:=true else Rastnull1:=false;
      if (CheckBox2.Checked=true) and (Edit4.Text='0') then Rastnull2:=true else Rastnull2:=false;
      if (CheckBox3.Checked=true) and (Edit6.Text='0') then Rastnull3:=true else Rastnull3:=false;
      if (CheckBox4.Checked=true) and (Edit8.Text='0') then Rastnull4:=true else Rastnull4:=false;
      if (CheckBox5.Checked=true) and (Edit10.Text='0') then Rastnull5:=true else Rastnull5:=false;
      if (CheckBox6.Checked=true) and (Edit12.Text='0') then Rastnull6:=true else Rastnull6:=false;
      if (CheckBox7.Checked=true) and (Edit14.Text='0') then Rastnull7:=true else Rastnull7:=false;
      if (CheckBox8.Checked=true) and (Edit16.Text='0') then Rastnull8:=true else Rastnull8:=false;
      if (CheckBox9.Checked=true) and (Edit18.Text='0') then Rastnull9:=true else Rastnull9:=false;
      if (CheckBox10.Checked=true) and (Edit20.Text='0') then Rastnull10:=true else Rastnull10:=false;
      if (CheckBox1.Checked=false) or (Edit2.Text='0') then begin Edit21.Visible:=false; Label26.Visible:=false; Gauge1.Visible:=false; end;
      if (CheckBox2.Checked=false) or (Edit4.Text='0') then begin Edit22.Visible:=false; Label27.Visible:=false; Gauge2.Visible:=false; end;
      if (CheckBox3.Checked=false) or (Edit6.Text='0') then begin Edit23.Visible:=false; Label28.Visible:=false; Gauge3.Visible:=false; end;
      if (CheckBox4.Checked=false) or (Edit8.Text='0') then begin Edit24.Visible:=false; Label29.Visible:=false; Gauge4.Visible:=false; end;
      if (CheckBox5.Checked=false) or (Edit10.Text='0') then begin Edit25.Visible:=false; Label30.Visible:=false; Gauge5.Visible:=false; end;
      if (CheckBox6.Checked=false) or (Edit12.Text='0') then begin Edit26.Visible:=false; Label31.Visible:=false; Gauge6.Visible:=false; end;
      if (CheckBox7.Checked=false) or (Edit14.Text='0') then begin Edit27.Visible:=false; Label32.Visible:=false; Gauge7.Visible:=false; end;
      if (CheckBox8.Checked=false) or (Edit16.Text='0') then begin Edit28.Visible:=false; Label33.Visible:=false; Gauge8.Visible:=false; end;
      if (CheckBox9.Checked=false) or (Edit18.Text='0') then begin Edit29.Visible:=false; Label34.Visible:=false; Gauge9.Visible:=false; end;
      if (CheckBox10.Checked=false) or (Edit20.Text='0') then begin Edit30.Visible:=false; Label35.Visible:=false; Gauge10.Visible:=false; end;
      Gauge1.Progress:=0;
      Gauge2.Progress:=0;
      Gauge3.Progress:=0;
      Gauge4.Progress:=0;
      Gauge5.Progress:=0;
      Gauge6.Progress:=0;
      Gauge7.Progress:=0;
      Gauge8.Progress:=0;
      Gauge9.Progress:=0;
      Gauge10.Progress:=0;
      Rasttemp1:=false;
      Rasttemp2:=false;
      Rasttemp3:=false;
      Rasttemp4:=false;
      Rasttemp5:=false;
      Rasttemp6:=false;
      Rasttemp7:=false;
      Rasttemp8:=false;
      Rasttemp9:=false;
      Rasttemp10:=false;
      Rastende:=false;
    end
    else zeit3:=zeit3-zeitpause+GetTickCount;
    zeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
    if zeit<>0 then
    begin
      Timer2.Enabled:=true;
      Edit1.Enabled:=false;
      Edit2.Enabled:=false;
      Edit3.Enabled:=false;
      Edit4.Enabled:=false;
      Edit5.Enabled:=false;
      Edit6.Enabled:=false;
      Edit7.Enabled:=false;
      Edit8.Enabled:=false;
      Edit9.Enabled:=false;
      Edit10.Enabled:=false;
      Edit11.Enabled:=false;
      Edit12.Enabled:=false;
      Edit13.Enabled:=false;
      Edit14.Enabled:=false;
      Edit15.Enabled:=false;
      Edit16.Enabled:=false;
      Edit17.Enabled:=false;
      Edit18.Enabled:=false;
      Edit19.Enabled:=false;
      Edit20.Enabled:=false;
      Edit31.Enabled:=false;
      Edit32.Enabled:=false;
      Edit33.Enabled:=false;
      Edit34.Enabled:=false;
      Edit35.Enabled:=false;
      Edit36.Enabled:=false;
      Edit37.Enabled:=false;
      Edit38.Enabled:=false;
      Edit39.Enabled:=false;
      Edit40.Enabled:=false;
      Edit41.Enabled:=false;
      Edit42.Enabled:=false;
      Edit43.Enabled:=false;
      Edit44.Enabled:=false;
      Edit45.Enabled:=false;
      Edit46.Enabled:=false;
      Edit47.Enabled:=false;
      Edit48.Enabled:=false;
      Edit49.Enabled:=false;
      Edit50.Enabled:=false;
      CheckBox1.Enabled:=false;
      CheckBox2.Enabled:=false;
      CheckBox3.Enabled:=false;
      CheckBox4.Enabled:=false;
      CheckBox5.Enabled:=false;
      CheckBox6.Enabled:=false;
      CheckBox7.Enabled:=false;
      CheckBox8.Enabled:=false;
      CheckBox9.Enabled:=false;
      CheckBox10.Enabled:=false;
      CheckBox11.Enabled:=false;
      CheckBox12.Enabled:=false;
      CheckBox13.Enabled:=false;
      CheckBox14.Enabled:=false;
      CheckBox15.Enabled:=false;
      CheckBox16.Enabled:=false;
      CheckBox17.Enabled:=false;
      CheckBox18.Enabled:=false;
      CheckBox19.Enabled:=false;
      CheckBox20.Enabled:=false;
      CheckBox21.Enabled:=false;
      CheckBox22.Enabled:=false;
      CheckBox23.Enabled:=false;
      CheckBox24.Enabled:=false;
      CheckBox25.Enabled:=false;
      CheckBox26.Enabled:=false;
      CheckBox27.Enabled:=false;
      CheckBox28.Enabled:=false;
      CheckBox29.Enabled:=false;
      CheckBox30.Enabled:=false;
      CheckBox32.Enabled:=false;
      Button8.Enabled:=false;
      Button9.Enabled:=false;
      Button11.Enabled:=false;
      Button12.Enabled:=false;
      Button13.Enabled:=false;
      Button16.Enabled:=false;
      Button18.Enabled:=true;
      Button20.Enabled:=false;
      Graphic:='C:\Brauerei\Graphics\Automatik-aktiv.jpg';
      Image5.Picture.LoadFromFile(Graphic);
      stop:=false;
      pause:=false;
      Form1.Timer2Timer(Sender);
      start:=true;
    end;
  end;
  zeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
  if zeit=0 then Form1.Button3Click(Sender);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if AlarmEin=true then
  else if (Edit21.Text<>'0') or (Rastnull1=true) then
  begin
    if Rasttemp1=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=strtoint(Edit41.Text)*1000; TimerRAus.Interval:=strtoint(Edit31.Text)*1000;
      if CheckBox21.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit1.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit1.Text)) or (Rasttemp1=true) then Rasttemp1:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit2.Text)*60000;
    if (start=true) and (Rasttemp1=true) then Edit21.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull1=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge1.Progress:=fortschritt;
    if rasttemp1=true then rastnull1:=false;
    if (Edit21.Text='0') and (CheckBox11.Checked=true) and (rastnull1=false) then AlarmEin:=true;
  end
  else if (Edit22.Text<>'0') or (Rastnull2=true) then
  begin
    if Rasttemp2=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=strtoint(Edit42.Text)*1000; TimerRAus.Interval:=strtoint(Edit32.Text)*1000;
      if CheckBox22.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit3.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit3.Text)) or (Rasttemp2=true) then Rasttemp2:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit4.Text)*60000;
    if (start=true) and (Rasttemp2=true) then Edit22.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull2=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge2.Progress:=fortschritt;
    if rasttemp2=true then rastnull2:=false;
    if (Edit22.Text='0') and (CheckBox12.Checked=true) and (rastnull2=false) then AlarmEin:=true;
  end
  else if (Edit23.Text<>'0') or (Rastnull3=true) then
  begin
    if Rasttemp3=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=strtoint(Edit43.Text)*1000; TimerRAus.Interval:=strtoint(Edit33.Text)*1000;
      if CheckBox23.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit5.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit5.Text)) or (Rasttemp3=true) then Rasttemp3:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit6.Text)*60000;
    if (start=true) and (Rasttemp3=true) then Edit23.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull3=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge3.Progress:=fortschritt;
    if rasttemp3=true then rastnull3:=false;
    if (Edit23.Text='0') and (CheckBox13.Checked=true) and (rastnull3=false) then AlarmEin:=true;
  end
  else if (Edit24.Text<>'0') or (Rastnull4=true) then
  begin
    if Rasttemp4=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=strtoint(Edit44.Text)*1000; TimerRAus.Interval:=strtoint(Edit34.Text)*1000;
      if CheckBox24.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit7.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit7.Text)) or (Rasttemp4=true) then Rasttemp4:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit8.Text)*60000;
    if (start=true) and (Rasttemp4=true) then Edit24.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull4=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge4.Progress:=fortschritt;
    if rasttemp4=true then rastnull4:=false;
    if (Edit24.Text='0') and (CheckBox14.Checked=true) and (rastnull4=false) then AlarmEin:=true;
  end
  else if (Edit25.Text<>'0') or (Rastnull5=true) then
  begin
    if Rasttemp5=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=strtoint(Edit45.Text)*1000; TimerRAus.Interval:=strtoint(Edit35.Text)*1000;
      if CheckBox25.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit9.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit9.Text)) or (Rasttemp5=true) then Rasttemp5:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit10.Text)*60000;
    if (start=true) and (Rasttemp5=true) then Edit25.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull5=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge5.Progress:=fortschritt;
    if rasttemp5=true then rastnull5:=false;
    if (Edit25.Text='0') and (CheckBox15.Checked=true) and (rastnull5=false) then AlarmEin:=true;
  end
  else if (Edit26.Text<>'0') or (Rastnull6=true) then
  begin
    if Rasttemp6=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=strtoint(Edit46.Text)*1000; TimerRAus.Interval:=strtoint(Edit36.Text)*1000;
      if CheckBox26.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit11.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit11.Text)) or (Rasttemp6=true) then Rasttemp6:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit12.Text)*60000;
    if (start=true) and (Rasttemp6=true) then Edit26.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull6=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge6.Progress:=fortschritt;
    if rasttemp6=true then rastnull6:=false;
    if (Edit26.Text='0') and (CheckBox16.Checked=true) and (rastnull6=false) then AlarmEin:=true;
  end
  else if (Edit27.Text<>'0') or (Rastnull7=true) then
  begin
    if Rasttemp7=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=strtoint(Edit47.Text)*1000; TimerRAus.Interval:=strtoint(Edit37.Text)*1000;
      if CheckBox27.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit13.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit13.Text)) or (Rasttemp7=true) then Rasttemp7:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit14.Text)*60000;
    if (start=true) and (Rasttemp7=true) then Edit27.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull7=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge7.Progress:=fortschritt;
    if rasttemp7=true then rastnull7:=false;
    if (Edit27.Text='0') and (CheckBox17.Checked=true) and (rastnull7=false) then AlarmEin:=true;
  end
  else if (Edit28.Text<>'0') or (Rastnull8=true) then
  begin
    if Rasttemp8=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=strtoint(Edit48.Text)*1000; TimerRAus.Interval:=strtoint(Edit38.Text)*1000;
      if CheckBox28.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit15.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit15.Text)) or (Rasttemp8=true) then Rasttemp8:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit16.Text)*60000;
    if (start=true) and (Rasttemp8=true) then Edit28.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull8=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge8.Progress:=fortschritt;
    if rasttemp8=true then rastnull8:=false;
    if (Edit28.Text='0') and (CheckBox18.Checked=true) and (rastnull8=false) then AlarmEin:=true;
  end
  else if (Edit29.Text<>'0') or (Rastnull9=true) then
  begin
    if Rasttemp9=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=strtoint(Edit49.Text)*1000; TimerRAus.Interval:=strtoint(Edit39.Text)*1000;
      if CheckBox29.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit17.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit17.Text)) or (Rasttemp9=true) then Rasttemp9:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit18.Text)*60000;
    if (start=true) and (Rasttemp9=true) then Edit29.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull9=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge9.Progress:=fortschritt;
    if rasttemp9=true then rastnull9:=false;
    if (Edit29.Text='0') and (CheckBox19.Checked=true) and (rastnull9=false) then AlarmEin:=true;
  end
  else if (Edit30.Text<>'0') or (Rastnull10=true) then
  begin
    if Rasttemp10=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=strtoint(Edit50.Text)*1000; TimerRAus.Interval:=strtoint(Edit40.Text)*1000;
      if CheckBox30.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit19.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit19.Text)) or (Rasttemp10=true) then Rasttemp10:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit20.Text)*60000;
    if (start=true) and (Rasttemp10=true) then Edit30.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull10=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge10.Progress:=fortschritt;
    if rasttemp10=true then rastnull10:=false;
    if (Edit30.Text='0') and (CheckBox20.Checked=true) and (rastnull10=false) then AlarmEin:=true;
  end
  else
  begin
    Form1.TimerRAusTimer(Sender);
    TimerREin.Enabled:=false;
    Rastende:=true;
  end;
  zeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
  rastzahl:=0;
  gesfortschritt:=0;
  if CheckBox1.checked=true then begin gesfortschritt:=gesfortschritt+(Gauge1.Progress*strtoint(Edit2.Text)); rastzahl:=rastzahl+strtoint(Edit2.Text); end;
  if CheckBox2.checked=true then begin gesfortschritt:=gesfortschritt+(Gauge2.Progress*strtoint(Edit4.Text)); rastzahl:=rastzahl+strtoint(Edit4.Text); end;
  if CheckBox3.checked=true then begin gesfortschritt:=gesfortschritt+(Gauge3.Progress*strtoint(Edit6.Text)); rastzahl:=rastzahl+strtoint(Edit6.Text); end;
  if CheckBox4.checked=true then begin gesfortschritt:=gesfortschritt+(Gauge4.Progress*strtoint(Edit8.Text)); rastzahl:=rastzahl+strtoint(Edit8.Text); end;
  if CheckBox5.checked=true then begin gesfortschritt:=gesfortschritt+(Gauge5.Progress*strtoint(Edit10.Text)); rastzahl:=rastzahl+strtoint(Edit10.Text); end;
  if CheckBox6.checked=true then begin gesfortschritt:=gesfortschritt+(Gauge6.Progress*strtoint(Edit12.Text)); rastzahl:=rastzahl+strtoint(Edit12.Text); end;
  if CheckBox7.checked=true then begin gesfortschritt:=gesfortschritt+(Gauge7.Progress*strtoint(Edit14.Text)); rastzahl:=rastzahl+strtoint(Edit14.Text); end;
  if CheckBox8.checked=true then begin gesfortschritt:=gesfortschritt+(Gauge8.Progress*strtoint(Edit16.Text)); rastzahl:=rastzahl+strtoint(Edit16.Text); end;
  if CheckBox9.checked=true then begin gesfortschritt:=gesfortschritt+(Gauge9.Progress*strtoint(Edit18.Text)); rastzahl:=rastzahl+strtoint(Edit18.Text); end;
  if CheckBox10.checked=true then begin gesfortschritt:=gesfortschritt+(Gauge10.Progress*strtoint(Edit20.Text)); rastzahl:=rastzahl+strtoint(Edit20.Text); end;
  gesfortschritt:=round(gesfortschritt/rastzahl-0.5);
  Edit53.Text:=inttostr(zeit);
  Gauge11.progress:=gesfortschritt;
  Panel4.Caption:=FloatToStrF(solltemp,ffFixed,10,1)+' �C';
  if (zeit=0) and (start=true) and (Rastende=true) then Form1.Button3Click(Sender);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form1.TimerHAusTimer(Sender);
  Form1.TimerRAusTimer(Sender);
  Timer2.Enabled:=false;
  TimerHEin.Enabled:=false;
  TimerHAus.Enabled:=false;
  TimerHSet.Enabled:=false;
  TimerREin.Enabled:=false;
  TimerRAus.Enabled:=false;
  Rasttemp1:=false;
  Rasttemp2:=false;
  Rasttemp3:=false;
  Rasttemp4:=false;
  Rasttemp5:=false;
  Rasttemp6:=false;
  Rasttemp7:=false;
  Rasttemp8:=false;
  Rasttemp9:=false;
  Rasttemp10:=false;
  Edit1.Enabled:=true;
  Edit2.Enabled:=true;
  Edit3.Enabled:=true;
  Edit4.Enabled:=true;
  Edit5.Enabled:=true;
  Edit6.Enabled:=true;
  Edit7.Enabled:=true;
  Edit8.Enabled:=true;
  Edit9.Enabled:=true;
  Edit10.Enabled:=true;
  Edit11.Enabled:=true;
  Edit12.Enabled:=true;
  Edit13.Enabled:=true;
  Edit14.Enabled:=true;
  Edit15.Enabled:=true;
  Edit16.Enabled:=true;
  Edit17.Enabled:=true;
  Edit18.Enabled:=true;
  Edit19.Enabled:=true;
  Edit20.Enabled:=true;
  Edit31.Enabled:=true;
  Edit32.Enabled:=true;
  Edit33.Enabled:=true;
  Edit34.Enabled:=true;
  Edit35.Enabled:=true;
  Edit36.Enabled:=true;
  Edit37.Enabled:=true;
  Edit38.Enabled:=true;
  Edit39.Enabled:=true;
  Edit40.Enabled:=true;
  Edit41.Enabled:=true;
  Edit42.Enabled:=true;
  Edit43.Enabled:=true;
  Edit44.Enabled:=true;
  Edit45.Enabled:=true;
  Edit46.Enabled:=true;
  Edit47.Enabled:=true;
  Edit48.Enabled:=true;
  Edit49.Enabled:=true;
  Edit50.Enabled:=true;
  CheckBox1.Enabled:=true;
  CheckBox2.Enabled:=true;
  CheckBox3.Enabled:=true;
  CheckBox4.Enabled:=true;
  CheckBox5.Enabled:=true;
  CheckBox6.Enabled:=true;
  CheckBox7.Enabled:=true;
  CheckBox8.Enabled:=true;
  CheckBox9.Enabled:=true;
  CheckBox10.Enabled:=true;
  CheckBox11.Enabled:=true;
  CheckBox12.Enabled:=true;
  CheckBox13.Enabled:=true;
  CheckBox14.Enabled:=true;
  CheckBox15.Enabled:=true;
  CheckBox16.Enabled:=true;
  CheckBox17.Enabled:=true;
  CheckBox18.Enabled:=true;
  CheckBox19.Enabled:=true;
  CheckBox20.Enabled:=true;
  CheckBox21.Enabled:=true;
  CheckBox22.Enabled:=true;
  CheckBox23.Enabled:=true;
  CheckBox24.Enabled:=true;
  CheckBox25.Enabled:=true;
  CheckBox26.Enabled:=true;
  CheckBox27.Enabled:=true;
  CheckBox28.Enabled:=true;
  CheckBox29.Enabled:=true;
  CheckBox30.Enabled:=true;
  CheckBox32.Enabled:=true;
  Button8.Enabled:=true;
  Button9.Enabled:=true;
  Button11.Enabled:=true;
  Button12.Enabled:=true;
  Button13.Enabled:=true;
  Button16.Enabled:=true;
  Button18.Enabled:=false;
  Button20.Enabled:=true;
  Edit21.Visible:=true;
  Label26.Visible:=true;
  Gauge1.Visible:=true;
  Edit22.Visible:=true;
  Label27.Visible:=true;
  Gauge2.Visible:=true;
  Edit23.Visible:=true;
  Label28.Visible:=true;
  Gauge3.Visible:=true;
  Edit24.Visible:=true;
  Label29.Visible:=true;
  Gauge4.Visible:=true;
  Edit25.Visible:=true;
  Label30.Visible:=true;
  Gauge5.Visible:=true;
  Edit26.Visible:=true;
  Label31.Visible:=true;
  Gauge6.Visible:=true;
  Edit27.Visible:=true;
  Label32.Visible:=true;
  Gauge7.Visible:=true;
  Edit28.Visible:=true;
  Label33.Visible:=true;
  Gauge8.Visible:=true;
  Edit29.Visible:=true;
  Label34.Visible:=true;
  Gauge9.Visible:=true;
  Edit30.Visible:=true;
  Label35.Visible:=true;
  Gauge10.Visible:=true;
  Graphic:='C:\Brauerei\Graphics\Automatik-inaktiv.jpg';
  Image5.Picture.LoadFromFile(Graphic);
  if stop=false then begin MessageDlg('Brauvorgang wurde beendet ' + #13 + '- mit OK fortsetzen!', mtInformation, [mbOK], 0); LogTimer.Enabled:=false; if checkbox32.Checked=true then CloseFile(myLogFile) end;
  stop:=true;
  pause:=false;
  start:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if start=true then
  begin
    zeitpause:=GetTickCount;
    Timer2.Enabled:=false;
    stop:=false;
    pause:=true;
    start:=false;
    Graphic:='C:\Brauerei\Graphics\Automatik-pause.jpg';
    Image5.Picture.LoadFromFile(Graphic);
  end;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  zeit3:=zeit3+60000;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  zeit3:=zeit3-60000;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (start=true) and (CheckBox1.Checked=true) and (Edit21.Text<>'0') then begin Edit21.Text:='0'; Gauge1.Progress:=100; Rasttemp2:=false; end
  else if (start=true) and (CheckBox2.Checked=true) and (Edit22.Text<>'0') then begin Edit22.Text:='0'; Gauge2.Progress:=100; Rasttemp3:=false; end
  else if (start=true) and (CheckBox3.Checked=true) and (Edit23.Text<>'0') then begin Edit23.Text:='0'; Gauge3.Progress:=100; Rasttemp4:=false;  end
  else if (start=true) and (CheckBox4.Checked=true) and (Edit24.Text<>'0') then begin Edit24.Text:='0'; Gauge4.Progress:=100; Rasttemp5:=false;  end
  else if (start=true) and (CheckBox5.Checked=true) and (Edit25.Text<>'0') then begin Edit25.Text:='0'; Gauge5.Progress:=100; Rasttemp6:=false;  end
  else if (start=true) and (CheckBox6.Checked=true) and (Edit26.Text<>'0') then begin Edit26.Text:='0'; Gauge6.Progress:=100; Rasttemp7:=false;  end
  else if (start=true) and (CheckBox7.Checked=true) and (Edit27.Text<>'0') then begin Edit27.Text:='0'; Gauge7.Progress:=100; Rasttemp8:=false;  end
  else if (start=true) and (CheckBox8.Checked=true) and (Edit28.Text<>'0') then begin Edit28.Text:='0'; Gauge8.Progress:=100; Rasttemp9:=false;  end
  else if (start=true) and (CheckBox9.Checked=true) and (Edit29.Text<>'0') then begin Edit29.Text:='0'; Gauge9.Progress:=100; Rasttemp10:=false;  end
  else if (start=true) and (CheckBox10.Checked=true) and (Edit30.Text<>'0') then begin Edit30.Text:='0'; Gauge10.Progress:=100; end;
  zeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
  if zeit=0 then Form1.Button3Click(Sender);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if (start=true) and (CheckBox10.Checked=true) and (Gauge10.Progress<>0) then begin Edit30.Text:=Edit20.Text; Gauge10.Progress:=0; Rasttemp10:=false; end
  else if (start=true) and (CheckBox9.Checked=true) and (Gauge9.Progress<>0) then begin Edit29.Text:=Edit18.Text; Gauge9.Progress:=0; Gauge10.Progress:=0; Rasttemp9:=false; end
  else if (start=true) and (CheckBox8.Checked=true) and (Gauge8.Progress<>0) then begin Edit28.Text:=Edit16.Text; Gauge8.Progress:=0; Gauge9.Progress:=0; Rasttemp8:=false; end
  else if (start=true) and (CheckBox7.Checked=true) and (Gauge7.Progress<>0) then begin Edit27.Text:=Edit14.Text; Gauge7.Progress:=0; Gauge8.Progress:=0; Rasttemp7:=false; end
  else if (start=true) and (CheckBox6.Checked=true) and (Gauge6.Progress<>0) then begin Edit26.Text:=Edit12.Text; Gauge6.Progress:=0; Gauge7.Progress:=0; Rasttemp6:=false; end
  else if (start=true) and (CheckBox5.Checked=true) and (Gauge5.Progress<>0) then begin Edit25.Text:=Edit10.Text; Gauge5.Progress:=0; Gauge6.Progress:=0; Rasttemp5:=false; end
  else if (start=true) and (CheckBox4.Checked=true) and (Gauge4.Progress<>0) then begin Edit24.Text:=Edit8.Text; Gauge4.Progress:=0; Gauge5.Progress:=0; Rasttemp4:=false; end
  else if (start=true) and (CheckBox3.Checked=true) and (Gauge3.Progress<>0) then begin Edit23.Text:=Edit6.Text; Gauge3.Progress:=0; Gauge4.Progress:=0; Rasttemp3:=false; end
  else if (start=true) and (CheckBox2.Checked=true) and (Gauge2.Progress<>0) then begin Edit22.Text:=Edit4.Text; Gauge2.Progress:=0; Gauge3.Progress:=0; Rasttemp2:=false; end
  else if (start=true) and (CheckBox1.Checked=true) and (Gauge1.Progress<>0) then begin Edit21.Text:=Edit2.Text; Gauge1.Progress:=0; Gauge2.Progress:=0; Rasttemp1:=false; end;
end;

procedure TForm1.TimerREinTimer(Sender: TObject);
begin
  Ruehrwerk:=RWert;
  Image3.Picture.LoadFromFile('C:\Brauerei\Graphics\Ruehrwerk-ein.jpg');
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  try Edit52.Text:=inttostr(LPTCode); finally end;
  Out32(Port,LPTCode);
  TimerREin.Enabled:=false;
  TimerRAus.Enabled:=true;
end;

procedure TForm1.TimerRAusTimer(Sender: TObject);
begin
  Ruehrwerk:=0;
  Image3.Picture.LoadFromFile('C:\Brauerei\Graphics\Ruehrwerk-aus.jpg');
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  try Edit52.Text:=inttostr(LPTCode); finally end;
  Out32(Port,LPTCode);
  TimerRAus.Enabled:=false;
  TimerREin.Enabled:=true;
end;

procedure TForm1.TimerHEinTimer(Sender: TObject);
begin
  Heizung:=HWert;
  Image2.Picture.LoadFromFile('C:\Brauerei\Graphics\Feuer-ein.jpg');
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  try Edit52.Text:=inttostr(LPTCode); finally end;
  Out32(Port,LPTCode);
  TimerHEin.Enabled:=false;
  TimerHAus.Enabled:=true;
end;

procedure TForm1.TimerHAusTimer(Sender: TObject);
begin
  Heizung:=0;
  Image2.Picture.LoadFromFile('C:\Brauerei\Graphics\Feuer-aus.jpg');
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  try Edit52.Text:=inttostr(LPTCode); finally end;
  Out32(Port,LPTCode);
  TimerHAus.Enabled:=false;
  TimerHEin.Enabled:=true;
end;

procedure TForm1.TimerHSetTimer(Sender: TObject);
begin
  Deltatemp:=Solltemp-Tempfloat;
  if Deltatemp>2 then
  begin
    if TimerHEin.Interval<>900 then
    begin
      TimerHEin.Interval:=900;
      TimerHAus.Interval:=1500000;
      Form1.TimerHEinTimer(Sender);
    end;
  end
  else if Deltatemp>0 then
  begin
    if CheckBox34.Checked=true then
    begin
      if TimerHEin.Interval<>strtoint(Edit55.Text)*1000 then
      begin
        TimerHEin.Interval:=strtoint(Edit55.Text)*1000;
        TimerHAus.Interval:=strtoint(Edit54.Text)*1000;
        Form1.TimerHEinTimer(Sender);
      end;
    end
    else
    begin
      if TimerHEin.Interval<>900 then
      begin
        TimerHEin.Interval:=900;
        TimerHAus.Interval:=1500000;
        Form1.TimerHEinTimer(Sender);
      end;
    end;
  end
  else
  begin
    if TimerHEin.Interval<>999 then
    begin
    TimerHEin.Interval:=999;
    TimerHAus.Interval:=999;
    Form1.TimerHAusTimer(Sender);
    TimerHEin.Enabled:=false;
    Timer2.Enabled:=true;
    end
  end;
end;

procedure TForm1.TimerAAusTimer(Sender: TObject);
begin
  Alarm:=0;
  Image6.Picture.LoadFromFile('C:\Brauerei\Graphics\Alarm-aus.jpg');
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  try Edit52.Text:=inttostr(LPTCode); finally end;
  Out32(Port,LPTCode);
  TimerAAus.Enabled:=false;
  TimerAEin.Enabled:=true;
end;

procedure TForm1.TimerAEinTimer(Sender: TObject);
begin
  Alarm:=AWert;
  Image6.Picture.LoadFromFile('C:\Brauerei\Graphics\Alarm-ein.jpg');
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  try Edit52.Text:=inttostr(LPTCode); finally end;
  Out32(Port,LPTCode);
  TimerAEin.Enabled:=false;
  TimerAAus.Enabled:=true;
end;

procedure TForm1.MessageTimerTimer(Sender: TObject);
var
  buttonSelected:integer;
begin
  if AlarmEin=true then
  begin
    Form1.TimerAEinTimer(Sender);
    MessageTimer.Enabled:=false;
    buttonSelected:=MessageDlg('Rast wurde beendet !' + #13 + '- Abbrechen f�r stillen Alarm ' + #13 + '- OK um Brauvorgang fortzusetzen.', mtInformation, [mbOK, mbAbort], 0);
    if buttonSelected = mrAbort then
    begin
      TimerAEin.Interval:=1500000;
      TimerAAus.Interval:=900;
      MessageDlg('Rast wurde beendet !' + #13 + '- OK um Brauvorgang fortzusetzen.', mtInformation, [mbOK], 0);
      TimerAEin.Interval:=4000;
      TimerAAus.Interval:=1000;
    end;
    AlarmEin:=false;
    MessageTimer.Enabled:=true;
    Form1.TimerAAusTimer(Sender);
    TimerAEin.Enabled:=false;
    TimerAAus.Enabled:=false;
  end;
end;

procedure TForm1.CheckBox31Click(Sender: TObject);
begin
  if checkbox31.Checked=true then
  begin
    TimerAEin.Interval:=4000;
    TimerAAus.Interval:=1000;
  end
  else
  begin
    TimerAEin.Interval:=1;
    TimerAAus.Interval:=9999999;
  end;
end;

procedure TForm1.LogTimerTimer(Sender: TObject);
begin
  Write(myLogFile, FormatDateTime('dd.mm.yyyy', now));
  Write(myLogFile, ';');
  Write(myLogFile, FormatDateTime('hh:nn:ss', now));
  Write(myLogFile, ';');
  if Heizung>0 then Write(myLogFile, '1;') else Write(myLogFile, '0;');
  if Ruehrwerk>0 then Write(myLogFile, '1;') else Write(myLogFile, '0;');
  if Pumpe>0 then Write(myLogFile, '1;') else Write(myLogFile, '0;');
  if AlarmEin=true then Write(myLogFile, '1;') else Write(myLogFile, '0;');
  Write(myLogFile, floattostr(tempfloat));
  Write(myLogFile, ';');
  Write(myLogFile, floattostr(solltemp));
  WriteLn(myLogFile, ';');
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  Button21.Enabled:=false;
  Button22.Enabled:=false;
  Button19.Caption:='1h Zoom';
  OpenDialog1.FileName:='';
  OpenDialog1.Filter:='Log-Datei|*.log|Alle Dateien|*.*';
  OpenDialog1.InitialDir:='C:\Brauerei\log';
  if OpenDialog1.Execute then ReadTabFile(OpenDialog1.FileName, ';', StringGrid1);
  OpenDialog1.Filter:='Rezept-Datei|*.rzt|Alle Dateien|*.*';
  OpenDialog1.InitialDir:='C:\Brauerei\Rezepte';
  writechart(Form1, false);
end;

procedure TForm1.PageControl1Change(Sender: TObject);
var
  ueberschreiben:boolean;
begin
  Button21.Enabled:=false;
  Button22.Enabled:=false;
  Button19.Caption:='1h Zoom';
  if (start=true) and (CheckBox32.Checked=true) then
  begin
    DeleteFile(PChar('C:\Brauerei\log\temp.log'));
    CopyFile(PChar(LogName),PChar('C:\Brauerei\log\temp.log'),true);
    ReadTabFile('C:\Brauerei\log\temp.log', ';', StringGrid1);
    if StringGrid1.RowCount>=2 then begin StringGrid1.RowCount:=StringGrid1.RowCount -1; CountLines:= StringGrid1.RowCount; writechart(Form1, false); end;
  end
  else
  begin
    if StringGrid1.RowCount<10 then ReadTabFile('C:\Brauerei\log\Test-Log.log', ';', StringGrid1);
    writechart(Form1, false);
  end;
  if StringGrid1.RowCount>=720 then Button19.Enabled:=true else Button19.Enabled:=false;
  webbrowser1.Navigate('C:\Brauerei\Help\Help.html');
end;

procedure TForm1.Edit55KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then Key := #0;
end;

procedure TForm1.Edit54KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then Key := #0;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  if DeleteFile('C:\Brauerei\Setup\settings.txt') then MessageDlg('Settings wurden �berschrieben !', mtInformation, [mbOK], 0);
  speichern(Form1, 'C:\Brauerei\Setup\settings.txt');
  settings_speichern(Form1, 'C:\Brauerei\Setup\settings.txt');
  CloseFile(myFile);
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  Form1.PageControl1Change(Sender);
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  if Button19.Caption='1h Zoom' then
  begin
    Button21.Enabled:=true;
    Button22.Enabled:=true;
    Button19.Caption:='Zoom out';
    startpunkt:=1;
    endpunkt:=720;
    writechart(Form1, true);
  end
  else
  begin
    Button21.Enabled:=false;
    Button22.Enabled:=false;
    Button19.Caption:='1h Zoom';
    writechart(Form1, false);
  end;
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  startpunkt:=startpunkt+120;
  endpunkt:=endpunkt+120;
  if StringGrid1.RowCount<endpunkt then begin endpunkt:=StringGrid1.RowCount; startpunkt:=endpunkt-719; end;
  writechart(Form1, true);
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  startpunkt:=startpunkt-120;
  endpunkt:=endpunkt-120;
  if startpunkt<1 then begin endpunkt:=720; startpunkt:=1; end;
  writechart(Form1, true);
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  if Button20.Caption='Simulation Ein' then
  begin
    Button20.Caption:='Simulation Aus';
    SimulationTimer.Enabled:=true;
    Label66.Visible:=true;
    SimTemp:=21.0;
  end
  else
  begin
    Button20.Caption:='Simulation Ein';
    SimulationTimer.Enabled:=false;
    Label66.Visible:=false;
  end;
end;

procedure TForm1.SimulationTimerTimer(Sender: TObject);
begin
  if Heizung=HWert then
  begin
    if SimTemp<100 then SimTemp:=SimTemp+0.1;
  end
  else
  begin
    if SimTemp>21 then SimTemp:=SimTemp-0.05;
  end;
  AssignFile(SimFile, 'C:\Brauerei\Temperatur\log.txt');
  Append(SimFile);
  Writeln(SimFile, 'Simulation;'+FloatToStrF(SimTemp,ffFixed,10,1));
  CloseFile(SimFile);
end;

procedure TForm1.Edit54Change(Sender: TObject);
begin
  y:=strtoint(Edit54.Text);
  if y>100 then Edit54.Text:='100';
  Edit54.SelStart := Length(Edit54.Text);
end;

procedure TForm1.Edit55Change(Sender: TObject);
begin
  y:=strtoint(Edit55.Text);
  if y>100 then Edit55.Text:='100';
  Edit54.SelStart := Length(Edit54.Text);
end;

procedure TForm1.Edit9Exit(Sender: TObject);
begin
try Intdummy:=strtoint(Edit9.Text) except begin Edit9.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>100 then begin Edit9.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit11Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit11.Text) except begin Edit11.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>100 then begin Edit11.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit13Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit13.Text) except begin Edit13.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>100 then begin Edit13.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit15Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit15.Text) except begin Edit15.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>100 then begin Edit15.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit17Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit17.Text) except begin Edit17.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>100 then begin Edit17.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit19Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit19.Text) except begin Edit19.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>100 then begin Edit19.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit38Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit38.Text) except begin Edit38.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit38.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit10Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit10.Text) except begin Edit10.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit10.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit12Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit12.Text) except begin Edit12.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit12.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit14Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit14.Text) except begin Edit14.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit14.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit16Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit16.Text) except begin Edit16.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit16.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit18Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit18.Text) except begin Edit18.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit18.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit20Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit20.Text) except begin Edit20.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit20.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit47Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit47.Text) except begin Edit47.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit47.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit35Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit35.Text) except begin Edit35.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit35.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit36Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit36.Text) except begin Edit36.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit36.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit37Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit37.Text) except begin Edit37.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit37.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit39Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit39.Text) except begin Edit39.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit39.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit40Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit40.Text) except begin Edit40.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit40.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit45Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit45.Text) except begin Edit45.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit45.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit46Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit46.Text) except begin Edit46.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit46.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit48Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit48.Text) except begin Edit48.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit48.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit49Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit49.Text) except begin Edit49.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit49.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit50Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit50.Text) except begin Edit50.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit50.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit1.Text) except begin Edit1.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>100 then begin Edit1.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit2Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit2.Text) except begin Edit2.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit2.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit31Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit31.Text) except begin Edit31.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit31.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit41Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit41.Text) except begin Edit41.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit41.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit3Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit3.Text) except begin Edit3.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>100 then begin Edit3.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit4Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit4.Text) except begin Edit4.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit4.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit33Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit33.Text) except begin Edit33.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit33.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit43Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit43.Text) except begin Edit43.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit43.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit7Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit7.Text) except begin Edit7.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>100 then begin Edit7.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit5Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit5.Text) except begin Edit5.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>100 then begin Edit5.Text:='20'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit6Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit6.Text) except begin Edit6.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit6.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit32Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit32.Text) except begin Edit32.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit32.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit42Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit42.Text) except begin Edit42.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit42.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit8Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit8.Text) except begin Edit8.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit8.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit34Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit34.Text) except begin Edit34.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit34.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

procedure TForm1.Edit44Exit(Sender: TObject);
begin
  try Intdummy:=strtoint(Edit44.Text) except begin Edit44.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end; end;
  if Intdummy>999 then begin Edit44.Text:='60'; ShowMessage('Unerlaubte Eingabe!'); end;
end;

end.
