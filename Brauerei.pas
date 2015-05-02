unit Brauerei;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, Menus, ExtCtrls, jpeg, TeeProcs, TeEngine,
  Chart, DbChart, ComCtrls, Grids, Series, OleCtrls, SHDocVw, ShellApi,
  Printers,synaser, Buttons, Timer, AppEvnts;

type
  FT_Result = Integer;
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
    Panel2: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    CheckBox32: TCheckBox;
    Panel3: TPanel;
    Edit53: TEdit;
    Label60: TLabel;
    Gauge11: TGauge;
    CheckBox34: TCheckBox;
    Button17: TButton;
    Panel4: TPanel;
    Label63: TLabel;
    Label64: TLabel;
    Button18: TButton;
    Button19: TButton;
    SimulationTimer: TTimer;
    Label66: TLabel;
    Button23: TButton;
    LogUpdateTimer: TTimer;
    Button24: TButton;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    ProgressBar4: TProgressBar;
    ProgressBar5: TProgressBar;
    ProgressBar6: TProgressBar;
    ProgressBar7: TProgressBar;
    ProgressBar8: TProgressBar;
    ProgressBar9: TProgressBar;
    ProgressBar10: TProgressBar;
    Label61: TLabel;
    CheckBox33: TCheckBox;
    Ueberwachungstimer: TTimer;
    PrintDialog1: TPrintDialog;
    USB_Update_Tmr: TTimer;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    Label62: TLabel;
    Label65: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    Edit57: TEdit;
    Edit58: TEdit;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit61: TEdit;
    Label73: TLabel;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    Label74: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    GroupBox3: TGroupBox;
    Label75: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    GroupBox4: TGroupBox;
    Label88: TLabel;
    ComboBox13: TComboBox;
    Label90: TLabel;
    Label81: TLabel;
    Label86: TLabel;
    ComboBox14: TComboBox;
    Label87: TLabel;
    ComboBox15: TComboBox;
    Label89: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    ComboBox17: TComboBox;
    ComboBox18: TComboBox;
    Label96: TLabel;
    Label97: TLabel;
    Label100: TLabel;
    ComboBox19: TComboBox;
    ComboBox20: TComboBox;
    ComboBox21: TComboBox;
    ComboBox22: TComboBox;
    Label102: TLabel;
    Label104: TLabel;
    ComboBox23: TComboBox;
    ComboBox24: TComboBox;
    Label107: TLabel;
    ComboBox25: TComboBox;
    Label109: TLabel;
    Label110: TLabel;
    ComboBox16: TComboBox;
    Label111: TLabel;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Batch_Update_Tmr: TTimer;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    Edit62: TEdit;
    TimerDlgMove: TTimer;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    StartTimer: TTimer;
    Button31: TButton;
    GesUpdateTimer: TTimer;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    Label59: TLabel;
    ComboBox27: TComboBox;
    Label116: TLabel;
    GroupBox6: TGroupBox;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    TimerDialogTimer: TTimer;
    TimerTimer: TTimer;
    Timer3: TTimer;
    Button1: TButton;
    TrackBar1: TTrackBar;
    GroupBox7: TGroupBox;
    Label112: TLabel;
    Label113: TLabel;
    ComboBox26: TComboBox;
    Panel6: TPanel;
    Button29: TButton;
    Button30: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn16: TBitBtn;
    Panel7: TPanel;
    BitBtn9: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Panel8: TPanel;
    Edit82: TEdit;
    Edit81: TEdit;
    Edit80: TEdit;
    Edit79: TEdit;
    Edit78: TEdit;
    Edit77: TEdit;
    Edit76: TEdit;
    Edit75: TEdit;
    Edit74: TEdit;
    Edit73: TEdit;
    Panel10: TPanel;
    Edit63: TEdit;
    Edit70: TEdit;
    Edit65: TEdit;
    Edit66: TEdit;
    Edit67: TEdit;
    Edit68: TEdit;
    Edit69: TEdit;
    Edit64: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Label115: TLabel;
    Panel11: TPanel;
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
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
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
    Edit15: TEdit;
    CheckBox8: TCheckBox;
    Edit16: TEdit;
    Edit17: TEdit;
    CheckBox9: TCheckBox;
    Edit18: TEdit;
    Edit19: TEdit;
    CheckBox10: TCheckBox;
    Edit20: TEdit;
    Panel9: TPanel;
    Label23: TLabel;
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
    Label53: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Edit33: TEdit;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    Edit31: TEdit;
    Edit32: TEdit;
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
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    Panel12: TPanel;
    Button9: TButton;
    Button8: TButton;
    Button10: TButton;
    Button11: TButton;
    Button20: TButton;
    Panel13: TPanel;
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
    Gauge8: TGauge;
    Gauge9: TGauge;
    Gauge10: TGauge;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    TimerKSet: TTimer;
    TimerKEin: TTimer;
    TimerKAus: TTimer;
    ComboBox29: TComboBox;
    Label95: TLabel;
    Label98: TLabel;
    GroupBox8: TGroupBox;
    ComboBox28: TComboBox;
    Label99: TLabel;
    Panel14: TPanel;
    Label101: TLabel;
    Label103: TLabel;
    ComboBox31: TComboBox;
    ComboBox30: TComboBox;
    ComboBox32: TComboBox;
    Label105: TLabel;
    ComboBox33: TComboBox;
    Label106: TLabel;
    CheckBox31: TCheckBox;
    Panel15: TPanel;
    ComboBox34: TComboBox;
    Label108: TLabel;
    ComboBox35: TComboBox;
    ComboBox36: TComboBox;
    ComboBox37: TComboBox;
    ComboBox38: TComboBox;
    ComboBox39: TComboBox;
    ComboBox40: TComboBox;
    ComboBox41: TComboBox;
    ComboBox42: TComboBox;
    ComboBox43: TComboBox;
    Button2: TButton;
    ApplicationEvents1: TApplicationEvents;
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
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
    procedure LogTimerTimer(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Edit55KeyPress(Sender: TObject; var Key: Char);
    procedure Edit54KeyPress(Sender: TObject; var Key: Char);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure SimulationTimerTimer(Sender: TObject);
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
    procedure Button23Click(Sender: TObject);
    procedure LogUpdateTimerTimer(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure UeberwachungstimerTimer(Sender: TObject);
    procedure USB_Update_TmrTimer(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox16Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure ComboBox12Change(Sender: TObject);
    procedure Edit54Exit(Sender: TObject);
    procedure Edit55Exit(Sender: TObject);
    procedure Edit56Exit(Sender: TObject);
    procedure Edit57Exit(Sender: TObject);
    procedure Edit58Exit(Sender: TObject);
    procedure Edit59Exit(Sender: TObject);
    procedure Edit60Exit(Sender: TObject);
    procedure Edit61Exit(Sender: TObject);
    procedure ComboBox13Change(Sender: TObject);
    procedure ComboBox14Change(Sender: TObject);
    procedure ComboBox15Change(Sender: TObject);
    procedure ComboBox17Change(Sender: TObject);
    procedure ComboBox18Change(Sender: TObject);
    procedure ComboBox19Change(Sender: TObject);
    procedure ComboBox20Change(Sender: TObject);
    procedure ComboBox21Change(Sender: TObject);
    procedure ComboBox22Change(Sender: TObject);
    procedure ComboBox24Change(Sender: TObject);
    procedure ComboBox23Change(Sender: TObject);
    procedure ComboBox25Change(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure CheckBox35Click(Sender: TObject);
    procedure Batch_Update_TmrTimer(Sender: TObject);
    procedure ComboBox26Change(Sender: TObject);
    procedure Edit62Exit(Sender: TObject);
    procedure OpenDialog1Show(Sender: TObject);
    procedure TimerDlgMoveTimer(Sender: TObject);
    procedure PrintDialog1Show(Sender: TObject);
    procedure SaveDialog1Show(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure CheckBox38Click(Sender: TObject);
    procedure CheckBox39Click(Sender: TObject);
    procedure CheckBox40Click(Sender: TObject);
    procedure StartTimerTimer(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure GesUpdateTimerTimer(Sender: TObject);
    procedure ComboBox27Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure TimerDialogTimerTimer(Sender: TObject);
    procedure TimerTimerTimer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox28Change(Sender: TObject);
    procedure TimerKSetTimer(Sender: TObject);
    procedure TimerKEinTimer(Sender: TObject);
    procedure TimerKAusTimer(Sender: TObject);
    procedure ComboBox29Change(Sender: TObject);
    procedure ComboBox31Change(Sender: TObject);
    procedure ComboBox30Change(Sender: TObject);
    procedure ComboBox32Change(Sender: TObject);
    procedure ComboBox33Change(Sender: TObject);
    procedure CheckBox31Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ApplicationEvents1ShowHint(var HintStr: String;
      var CanShow: Boolean; var HintInfo: THintInfo);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

const
  Version = 'V01.52';

var
  Form1: TForm1;
  sl,sl2: TStringList;
  Temperatur,xwert,Graphic,LogName,Steuerung,BHEin,BHAus,BREin,BRAus,BPEin,BPAus,
  BAEin,BAAus,TimeTempStr,TimeTempStore,USBPort,USBTyp,pfad, tempdateiname,
  sensorverzoegerung,Relais4,Rezeptname: String;
  Tempfloat,Solltemp,Deltatemp,Deltatemp2,SimTemp,TWert,Gradient, GradientWert,
  GradientUebergabe, Hysterese, Hysterese2, Aufheizrate: Extended;
  Ruehrwerk,Heizung,Alarm,Pumpe,HWert,RWert,PWert,AWert,RStore,PStore,HStore,
  AStore,LPTCode,restrastzeit,zeit2,zeit3,zeitpause,fortschritt,rast,Intdummy,
  CountLines,restrastgauge,gesrastzeit, startpunkt,endpunkt,Ein60,Aus60,Ein70,
  Aus70,Ein80,Aus80,Ein90,Aus90,Ein100,Aus100,EinIst,AusIst,USBHIntWert,
  USBRIntWert,USBPIntWert,USBAIntWert,DeviceIndex,sensorreset,
  StartTemp,maxsolltemp,gesheizzeit,restheizzeit,gesprozesszeit,restprozesszeit,
  restheizgauge,restprozessgauge,Timerstartbatstatus,spanne,Temperaturrast: integer;
  LPTPort: word;
  myFile,myLogFile,SimFile,mySetup,myDisplay: TextFile;
  pause,start,stop,AlarmEin,Rasttemp1,Rasttemp2,Rasttemp3,Rasttemp4,Rasttemp5,
  Rasttemp6,Rasttemp7,Rasttemp8,Rasttemp9,Rasttemp10,Rastnull1,Rastnull2,
  Rastnull3,Rastnull4,Rastnull5,Rastnull6,Rastnull7,Rastnull8,Rastnull9,
  Rastnull10,Rastende,PauseLogTimerHEin,PauseLogTimerHAus,PauseLogTimerHSet,
  PauseLogTimerREin,PauseLogTimerRAus,PauseLogTimerKEin,PauseLogTimerKAus,
  PauseLogTimerKSet,Rastnullges: boolean;
  USBHWert,USBRWert,USBPWert,USBAWert: char;
  Gradientgetter: Array[1..60] of Extended;
  ser: TBlockSerial;
  FT_HANDLE : DWord = 0;
  FT_Out : Byte;
  FT_OUT_INT,RESULT,Write_Result,Charint,Description  : Integer;


implementation


{$R *.dfm}


function MyMessageDlgPos(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; Captions: array of string; xPos: Integer; yPos: Integer ): Integer;
var
  aMsgDlg: TForm;
  i: Integer;
  dlgButton: TButton;
  CaptionIndex: Integer;
begin
  aMsgDlg := CreateMessageDialog(Msg, DlgType, Buttons);
  captionIndex := 0;
  for i := 0 to aMsgDlg.ComponentCount - 1 do
  begin
    aMsgDlg.Left := xPos;
    aMsgDlg.Top := yPos;
    if (aMsgDlg.Components[i] is TButton) then
    begin
      dlgButton := TButton(aMsgDlg.Components[i]);
      if CaptionIndex > High(Captions) then Break;
      dlgButton.Caption := Captions[CaptionIndex];
      Inc(CaptionIndex);
    end;
  end;
  Result := aMsgDlg.ShowModal;
end;

procedure gesamtanzeigegeaendert;
begin
  if Form1.Button31.Caption='ETA' then
  begin
    Form1.Gauge11.Visible:=false;
    Form1.Edit53.Visible:=false;
    Form1.Label60.Visible:=false;
    Form1.Panel5.Visible:=true;
  end
  else
  begin
    Form1.Gauge11.Visible:=true;
    Form1.Edit53.Visible:=true;
    Form1.Label60.Visible:=true;
    Form1.Panel5.Visible:=false;
  end;
end;

procedure TForm1.BitBtn10Click(Sender: TObject);
begin
   Panel6.Visible:=false;
   Panel8.Visible:=false;
   Panel10.Visible:=false;
   Panel12.Visible:=true;
   Panel13.Visible:=false;
   Panel15.Visible:=false;
   BitBtn10.Visible:=false;
   BitBtn11.Visible:=true;
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
begin
   Panel6.Visible:=true;
   Panel8.Visible:=false;
   Panel10.Visible:=false;
   Panel12.Visible:=false;
   Panel13.Visible:=true;
   Button29.Visible:=true;
   Button30.Visible:=false;
   BitBtn10.Visible:=true;
   BitBtn11.Visible:=false;
   if start=false then Form1.ComboBox31Change(Sender);
end;

//LPT:
procedure Out32(wAddr:word;bOut:byte);stdcall; external 'inpout32.dll'    // Parallelportausgabe
function Inp32(wAddr:word):integer;stdcall; external 'inpout32.dll'       // Parallelporteingabe

//Denkovi:
function FT_Open(Index:Integer; ftHandle:Pointer):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_Open';
Function FT_OpenEx(pArg1:Pointer; Flags:DWORD; ftHandle:Pointer):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_OpenEx';
function FT_Close(ftHandle:Dword):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_Close';
function FT_Write(ftHandle:Dword; FTOutBuf:Pointer; BufferSize:LongInt; ResultPtr:Pointer):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_Write';
function FT_SetBaudRate(ftHandle:Dword; BaudRate:DWord):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_SetBaudRate';
function FT_SetBitMode(ftHandle:Dword; Mask,Enable:Byte):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_SetBitMode';
procedure USB2OUT;
begin
  FT_OUT_INT:=0;
  if (Ruehrwerk<>0) then FT_OUT_INT:=FT_OUT_INT+USBRIntWert;
  if (Heizung<>0) then FT_OUT_INT:=FT_OUT_INT+USBHIntWert;
  if (Alarm<>0) then FT_OUT_INT:=FT_OUT_INT+USBAIntWert;
  if (Pumpe<>0) then FT_OUT_INT:=FT_OUT_INT+USBPIntWert;
  FT_OUT:=FT_OUT_INT;
  RESULT:=FT_Close(FT_HANDLE);
  RESULT:=FT_Open(DeviceIndex,@FT_Handle);
  if RESULT <> 0  then begin Form1.Edit51.Text:='Err'; exit; end else Form1.Edit51.Text:=inttostr(DeviceIndex);
  RESULT:=FT_SetBaudRate(FT_Handle,921600);
  if RESULT <> 0  then begin Form1.Edit51.Text:='Err'; exit; end else Form1.Edit51.Text:=inttostr(DeviceIndex);
  RESULT:=FT_SetBitMode(FT_Handle,255,4);
  if RESULT <> 0  then begin Form1.Edit51.Text:='Err'; exit; end else Form1.Edit51.Text:=inttostr(DeviceIndex);
  RESULT:=FT_Write(FT_Handle,@FT_OUT,1,@Write_Result);
  if RESULT <> 0  then begin Form1.Edit51.Text:='Err'; exit; end else Form1.Edit51.Text:=inttostr(DeviceIndex);
  RESULT:=FT_Close(FT_HANDLE);
  if RESULT <> 0  then begin Form1.Edit51.Text:='Err'; exit; end else Form1.Edit51.Text:=inttostr(DeviceIndex);
end;

//KMTronic:
procedure USBOpenLine ;
begin with Form1 do begin
  ser.Connect(USBPort);
  if ser.LastError<>sOK then begin Edit51.Text:='Err' ; exit ; end else Form1.Edit51.Text:=USBPort;
  ser.Config({Baud}9600, {Bits}8, {Parity}'N', {StopBits}0, {Xon/Xoff}false, {DTR/CTS}false);
  if ser.LastError<>sOK then begin Edit51.Text:='Err' ; exit ; end else Form1.Edit51.Text:=USBPort;
end ; end ;

procedure USBCloseLine ;
begin with Form1 do begin
  ser.CloseSocket ;
end ; end ;

procedure USBOut ;
begin
  USBOpenLine;
  if (Ruehrwerk<>0) then ser.SendString(char($FF)+char(USBRWert)+char($01)) else ser.SendString(char($FF)+char(USBRWert)+char($00));
  if (Heizung<>0) then ser.SendString(char($FF)+char(USBHWert)+char($01)) else ser.SendString(char($FF)+char(USBHWert)+char($00));
  if (Alarm<>0) then ser.SendString(char($FF)+char(USBAWert)+char($01)) else ser.SendString(char($FF)+char(USBAWert)+char($00));
  if (Pumpe<>0) then ser.SendString(char($FF)+char(USBPWert)+char($01)) else ser.SendString(char($FF)+char(USBPWert)+char($00));
  USBCloseLine;
end;

//Batch:
procedure BatchOut;
begin
  if (Ruehrwerk<>0) and (Ruehrwerk<>RStore) then
    if ShellExecute(Application.Handle,'open',PChar(BREin),nil, nil, SW_HIDE) <= 32 then
    ShowMessagePos('Es ist ein Fehler beim ausführen von '+BREin+' aufgetreten', Form1.Left+350, Form1.Top+250) else
    RStore:=Ruehrwerk;
  if (Ruehrwerk=0) and (Ruehrwerk<>RStore) then
    if ShellExecute(Application.Handle,'open',PChar(BRAus),nil, nil, SW_HIDE) <= 32 then
    ShowMessagePos('Es ist ein Fehler beim ausführen von '+BRAus+' aufgetreten', Form1.Left+350, Form1.Top+250) else
    RStore:=Ruehrwerk;
  if (Heizung<>0) and (Heizung<>HStore) then
    if ShellExecute(Application.Handle,'open',PChar(BHEin),nil, nil, SW_HIDE) <= 32 then
    ShowMessagePos('Es ist ein Fehler beim ausführen von '+BHEin+' aufgetreten', Form1.Left+350, Form1.Top+250) else
    HStore:=Heizung;
  if (Heizung=0) and (Heizung<>HStore) then
    if ShellExecute(Application.Handle,'open',PChar(BHAus),nil, nil, SW_HIDE) <= 32 then
    ShowMessagePos('Es ist ein Fehler beim ausführen von '+BHAus+' aufgetreten', Form1.Left+350, Form1.Top+250) else
    HStore:=Heizung;
  if (Alarm<>0) and (Alarm<>AStore) then
    if ShellExecute(Application.Handle,'open',PChar(BAEin),nil, nil, SW_HIDE) <= 32 then
    ShowMessagePos('Es ist ein Fehler beim ausführen von '+BAEin+' aufgetreten', Form1.Left+350, Form1.Top+250) else
    AStore:=Alarm;
  if (Alarm=0) and (Alarm<>AStore) then
    if ShellExecute(Application.Handle,'open',PChar(BAAus),nil, nil, SW_HIDE) <= 32 then
    ShowMessagePos('Es ist ein Fehler beim ausführen von '+BAAus+' aufgetreten', Form1.Left+350, Form1.Top+250) else
    AStore:=Alarm;
  if (Pumpe<>0) and (Pumpe<>PStore) then
    if ShellExecute(Application.Handle,'open',PChar(BPEin),nil, nil, SW_HIDE) <= 32 then
    ShowMessagePos('Es ist ein Fehler beim ausführen von '+BPEin+' aufgetreten', Form1.Left+350, Form1.Top+250) else
    PStore:=Pumpe;
  if (Pumpe=0) and (Pumpe<>PStore) then
    if ShellExecute(Application.Handle,'open',PChar(BPAus),nil, nil, SW_HIDE) <= 32 then
    ShowMessagePos('Es ist ein Fehler beim ausführen von '+BPAus+' aufgetreten', Form1.Left+350, Form1.Top+250) else
    PStore:=Pumpe;
end;

procedure Schalten(Form:TForm1);
begin
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;  //LPT-Code errechnen
  if steuerung='LPT' then begin Form1.Edit52.Text:=inttostr(LPTCode);  Form1.Edit51.Text:=inttostr(LPTPort); Out32(LPTPort,LPTCode); end; //LPT-Code an LPT-Port ausgeben
  if steuerung='BATCH' then begin Form1.Edit52.Text:='off'; BatchOut;  Form1.Edit51.Text:=''; end; //LPT-Code als Batch ausgeben
  if (steuerung='USB') and (usbtyp='KMTronic') then begin Form1.Edit52.Text:='USB'; Form1.Edit51.Text:=USBPort; USBOut; end; //LPT-Code an USB-Port ausgeben
  if (steuerung='USB') and (usbtyp='Denkovi') then begin Form1.Edit52.Text:='USB'; Form1.Edit51.Text:=inttostr(DeviceIndex); USB2Out; end; //LPT-Code an USB-Port ausgeben
end;

procedure speichern(Form:TForm1; filename:string);
begin
  AssignFile(myFile, filename);                // Rezeptdaten speichern
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
  WriteLn(myFile, Form.Edit63.Text);
  WriteLn(myFile, Form.Edit64.Text);
  WriteLn(myFile, Form.Edit65.Text);
  WriteLn(myFile, Form.Edit66.Text);
  WriteLn(myFile, Form.Edit67.Text);
  WriteLn(myFile, Form.Edit68.Text);
  WriteLn(myFile, Form.Edit69.Text);
  WriteLn(myFile, Form.Edit70.Text);
  WriteLn(myFile, Form.Edit71.Text);
  WriteLn(myFile, Form.Edit72.Text);
  WriteLn(myFile, Form.Edit73.Text);
  WriteLn(myFile, Form.Edit74.Text);
  WriteLn(myFile, Form.Edit75.Text);
  WriteLn(myFile, Form.Edit76.Text);
  WriteLn(myFile, Form.Edit77.Text);
  WriteLn(myFile, Form.Edit78.Text);
  WriteLn(myFile, Form.Edit79.Text);
  WriteLn(myFile, Form.Edit80.Text);
  WriteLn(myFile, Form.Edit81.Text);
  WriteLn(myFile, Form.Edit82.Text);
  WriteLn(myFile, Form.ComboBox34.Text);
  WriteLn(myFile, Form.ComboBox35.Text);
  WriteLn(myFile, Form.ComboBox36.Text);
  WriteLn(myFile, Form.ComboBox37.Text);
  WriteLn(myFile, Form.ComboBox38.Text);
  WriteLn(myFile, Form.ComboBox39.Text);
  WriteLn(myFile, Form.ComboBox40.Text);
  WriteLn(myFile, Form.ComboBox41.Text);
  WriteLn(myFile, Form.ComboBox42.Text);
  WriteLn(myFile, Form.ComboBox43.Text);
end;

procedure settings_speichern(Form:TForm1; filename:string);
begin
  WriteLn(myFile, Form.Button1.Caption);        // zusätzliche Settingsdate speichern (nur mit Rezeptdaten)
  WriteLn(myFile, Form.CheckBox32.Checked);
  WriteLn(myFile, Form.CheckBox33.Checked);
  WriteLn(myFile, Form.CheckBox34.Checked);
  WriteLn(myFile, Form.CheckBox36.Checked);
  WriteLn(myFile, Form.CheckBox37.Checked);
  WriteLn(myFile, Form.Button31.Caption);
  WriteLn(myFile, Form2.CheckBox1.Checked);
  WriteLn(myFile, Form2.CheckBox2.Checked);
  WriteLn(myFile, Form2.CheckBox3.Checked);
  WriteLn(myFile, Form2.Edit2.Text);
end;

procedure laden(Form:TForm1; filename:string);
begin
  AssignFile(myFile, filename);                          // Rezeptdaten laden
  Reset(myFile);
  ReadLn(myFile, xwert); Form.Edit1.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit2.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit3.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit4.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit5.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit6.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit7.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit8.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit9.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit10.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit11.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit12.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit13.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit14.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit15.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit16.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit17.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit18.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit19.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit20.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit31.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit32.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit33.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit34.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit35.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit36.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit37.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit38.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit39.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit40.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit41.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit42.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit43.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit44.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit45.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit46.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit47.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit48.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit49.Text:=xwert;
  ReadLn(myFile, xwert); Form.Edit50.Text:=xwert;
  ReadLn(myFile, xwert); Form.CheckBox1.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox2.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox3.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox4.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox5.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox6.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox7.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox8.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox9.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox10.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox11.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox12.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox13.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox14.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox15.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox16.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox17.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox18.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox19.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox20.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox21.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox22.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox23.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox24.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox25.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox26.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox27.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox28.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox29.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox30.Checked:=strtobool(xwert);
  try ReadLn(myFile, xwert); Form.Edit63.Text:=xwert; except Form.Edit63.Text:='' end;
  try ReadLn(myFile, xwert); Form.Edit64.Text:=xwert; except Form.Edit64.Text:='' end;
  try ReadLn(myFile, xwert); Form.Edit65.Text:=xwert; except Form.Edit65.Text:='' end;
  try ReadLn(myFile, xwert); Form.Edit66.Text:=xwert; except Form.Edit66.Text:='' end;
  try ReadLn(myFile, xwert); Form.Edit67.Text:=xwert; except Form.Edit67.Text:='' end;
  try ReadLn(myFile, xwert); Form.Edit68.Text:=xwert; except Form.Edit68.Text:='' end;
  try ReadLn(myFile, xwert); Form.Edit69.Text:=xwert; except Form.Edit69.Text:='' end;
  try ReadLn(myFile, xwert); Form.Edit70.Text:=xwert; except Form.Edit70.Text:='' end;
  try ReadLn(myFile, xwert); Form.Edit71.Text:=xwert; except Form.Edit71.Text:='' end;
  try ReadLn(myFile, xwert); Form.Edit72.Text:=xwert; except Form.Edit72.Text:='' end;
  try ReadLn(myFile, xwert); except xwert:='Rast 1'; end;
  if xwert='' then xwert:='Rast 1'; Form.Edit73.Text:=xwert; Form.CheckBox1.Caption:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Rast 2'; end;
  if xwert='' then xwert:='Rast 2'; Form.Edit74.Text:=xwert; Form.CheckBox2.Caption:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Rast 3'; end;
  if xwert='' then xwert:='Rast 3'; Form.Edit75.Text:=xwert; Form.CheckBox3.Caption:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Rast 4'; end;
  if xwert='' then xwert:='Rast 4'; Form.Edit76.Text:=xwert; Form.CheckBox4.Caption:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Rast 5'; end;
  if xwert='' then xwert:='Rast 5'; Form.Edit77.Text:=xwert; Form.CheckBox5.Caption:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Rast 6'; end;
  if xwert='' then xwert:='Rast 6'; Form.Edit78.Text:=xwert; Form.CheckBox6.Caption:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Rast 7'; end;
  if xwert='' then xwert:='Rast 7'; Form.Edit79.Text:=xwert; Form.CheckBox7.Caption:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Rast 8'; end;
  if xwert='' then xwert:='Rast 8'; Form.Edit80.Text:=xwert; Form.CheckBox8.Caption:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Rast 9'; end;
  if xwert='' then xwert:='Rast 9'; Form.Edit81.Text:=xwert; Form.CheckBox9.Caption:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Rast 10'; end;
  if xwert='' then xwert:='Rast 10'; Form.Edit82.Text:=xwert; Form.CheckBox10.Caption:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end;
  if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; Form.ComboBox34.Text:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end;
  if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; Form.ComboBox35.Text:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end;
  if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; Form.ComboBox36.Text:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end;
  if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; Form.ComboBox37.Text:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end;
  if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; Form.ComboBox38.Text:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end;
  if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; Form.ComboBox39.Text:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end;
  if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; Form.ComboBox40.Text:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end;
  if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; Form.ComboBox41.Text:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end;
  if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; Form.ComboBox42.Text:=xwert;
  try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end;
  if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; Form.ComboBox43.Text:=xwert;
end;

procedure settings_laden(Form:TForm1; filename:string);
begin
  Timerstartbatstatus:=0;
  ReadLn(myFile, xwert); Form.Button1.Caption:=xwert;    // zusätzliche Settingsdate laden (nur mit Rezeptdaten)
  ReadLn(myFile, xwert); Form.CheckBox32.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox33.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox34.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox36.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox37.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.Button31.Caption:=xwert;
  ReadLn(myFile, xwert); if strtobool(xwert)=true then Timerstartbatstatus:=1;
  ReadLn(myFile, xwert); if strtobool(xwert)=true then Timerstartbatstatus:=2;
  ReadLn(myFile, xwert); if strtobool(xwert)=true then Timerstartbatstatus:=3;
  ReadLn(myFile, xwert); sensorverzoegerung:=xwert;
  gesamtanzeigegeaendert;
end;

procedure setup_speichern(Form:TForm1; filename:string);
var dummyfilename:string;
begin
  AssignFile(mySetup, filename);                // Setup speichern
  ReWrite(mySetup);
  WriteLn(mySetup,'Installationsverzeichnis;Standard');
  WriteLn(mySetup,'Steuerung über "BATCH", "USB oder "LPT";'+Form.ComboBox1.Text);
  WriteLn(mySetup,'LPT-Port;'+Form.ComboBox8.Text);
  WriteLn(mySetup,'LPT-Heizung;'+Form.ComboBox9.Text);
  WriteLn(mySetup,'LPT-Ruehrwerk;'+Form.ComboBox10.Text);
  WriteLn(mySetup,'LPT-Pumpe;'+Form.ComboBox11.Text);
  WriteLn(mySetup,'LPT-Alarm;'+Form.ComboBox12.Text);
  WriteLn(mySetup,'USB-Karten-Typ "Denkovi" oder "KMTronic";'+Form.ComboBox2.Text);
  WriteLn(mySetup,'Denkovi-Device-Index;'+Form.ComboBox16.Text);
  WriteLn(mySetup,'USB-Port;'+Form.ComboBox7.Text);
  WriteLn(mySetup,'USB-Heizung;'+Form.ComboBox3.Text);
  WriteLn(mySetup,'USB-Ruehrwerk;'+Form.ComboBox4.Text);
  WriteLn(mySetup,'USB-Pumpe;'+Form.ComboBox5.Text);
  WriteLn(mySetup,'USB-Alarm;'+Form.ComboBox6.Text);
  dummyfilename:=stringreplace(Form.Edit54.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Batch-Heizung-Ein;'+dummyfilename);
  dummyfilename:=stringreplace(Form.Edit55.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Batch-Heizung-Aus;'+dummyfilename);
  dummyfilename:=stringreplace(Form.Edit56.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Batch-Ruehrwerk-Ein;'+dummyfilename);
  dummyfilename:=stringreplace(Form.Edit57.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Batch-Ruehrwerk-Aus;'+dummyfilename);
  dummyfilename:=stringreplace(Form.Edit58.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Batch-Pumpe-Ein;'+dummyfilename);
  dummyfilename:=stringreplace(Form.Edit59.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Batch-Pumpe-Aus;'+dummyfilename);
  dummyfilename:=stringreplace(Form.Edit60.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Batch-Alarm-Ein;'+dummyfilename);
  dummyfilename:=stringreplace(Form.Edit61.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Batch-Alarm-Aus;'+dummyfilename);
  WriteLn(mySetup,'Taktungstemperatur;'+Form.ComboBox13.Text);
  WriteLn(mySetup,'Einschaltpuls bis 60°C;'+Form.ComboBox14.Text);
  WriteLn(mySetup,'Ausschaltpuls bis 60°C;'+Form.ComboBox15.Text);
  WriteLn(mySetup,'Einschaltpuls bis 70°C;'+Form.ComboBox17.Text);
  WriteLn(mySetup,'Ausschaltpuls bis 70°C;'+Form.ComboBox18.Text);
  WriteLn(mySetup,'Einschaltpuls bis 80°C;'+Form.ComboBox19.Text);
  WriteLn(mySetup,'Ausschaltpuls bis 80°C;'+Form.ComboBox20.Text);
  WriteLn(mySetup,'Einschaltpuls bis 90°C;'+Form.ComboBox21.Text);
  WriteLn(mySetup,'Ausschaltpuls bis 90°C;'+Form.ComboBox22.Text);
  WriteLn(mySetup,'Einschaltpuls bis 100°C;'+Form.ComboBox24.Text);
  WriteLn(mySetup,'Ausschaltpuls bis 100°C;'+Form.ComboBox23.Text);
  WriteLn(mySetup,'Überschwingungsdämpfung;'+Form.ComboBox25.Text);
  WriteLn(mySetup,'Schalthysterese Heizung;'+Form.ComboBox26.Text);
  if Form.CheckBox35.Checked=true then WriteLn(mySetup,'Batchwiederholung;1') else WriteLn(mySetup,'Batchwiederholung;0');
  dummyfilename:=stringreplace(Form.Edit62.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Temperatur-Textdatei;'+dummyfilename);
  if Form.CheckBox38.Checked=true then WriteLn(mySetup,'Autostart Digitemp.bat;1') else WriteLn(mySetup,'Autostart Digitemp.bat;0');
  if Form.CheckBox39.Checked=true then WriteLn(mySetup,'Autostart Digitemp_variabel.bat;1') else WriteLn(mySetup,'Autostart Digitemp_variabel.bat;0');
  if Form.CheckBox40.Checked=true then WriteLn(mySetup,'Autostart Externe_Sensorsoftware.bat;1') else WriteLn(mySetup,'Autostart Externe_Sensorsoftware.bat;0');
  WriteLn(mySetup,'Aufheizrate pro Minute;'+Form.ComboBox27.Text);
  WriteLn(mySetup,'Relais4;'+Relais4);
  WriteLn(mySetup,'Schalthysterese Kühlung;'+Form.ComboBox29.Text);
  WriteLn(mySetup,'Rastbegin temperaturabhängig;'+inttostr(Temperaturrast));
  WriteLn(mySetup,'Rastzeiteinheit;'+Form.ComboBox30.Text);
  WriteLn(mySetup,'Rührzeiteinheit;'+Form.ComboBox32.Text);
  WriteLn(mySetup,'Logging-Takt;'+stringreplace(Form.ComboBox33.Text,' ','€€€',[rfReplaceAll]));
  CloseFile(mySetup);
  Steuerung:=Form.ComboBox1.Text;
  LPTPort:=strtoint(Form.ComboBox8.Text);
  HWert:=strtoint(Form.ComboBox9.Text);
  RWert:=strtoint(Form.ComboBox10.Text);
  PWert:=strtoint(Form.ComboBox11.Text);
  AWert:=strtoint(Form.ComboBox12.Text);
  USBTyp:=Form.ComboBox2.Text;
  DeviceIndex:=strtoint(Form.ComboBox16.Text);
  USBPort:=Form.ComboBox7.Text;
  USBHWert:=Form.ComboBox3.Text[1]; dec(USBHWert, $30);
  USBRWert:=Form.ComboBox4.Text[1]; dec(USBRWert, $30);
  USBPWert:=Form.ComboBox5.Text[1]; dec(USBPWert, $30);
  USBAWert:=Form.ComboBox6.Text[1]; dec(USBAWert, $30);
  BHEin:=Form.Edit54.Text;
  BHAus:=Form.Edit55.Text;
  BREin:=Form.Edit56.Text;
  BRAus:=Form.Edit57.Text;
  BPEin:=Form.Edit58.Text;
  BPAus:=Form.Edit59.Text;
  BAEin:=Form.Edit60.Text;
  BAAus:=Form.Edit61.Text;
  tempdateiname:=Form.Edit62.Text;
  TWert:=strtofloat(Form.ComboBox13.Text);
  Ein60:=strtoint(Form.ComboBox14.Text);
  Aus60:=strtoint(Form.ComboBox15.Text);
  Ein70:=strtoint(Form.ComboBox17.Text);
  Aus70:=strtoint(Form.ComboBox18.Text);
  Ein80:=strtoint(Form.ComboBox19.Text);
  Aus80:=strtoint(Form.ComboBox20.Text);
  Ein90:=strtoint(Form.ComboBox21.Text);
  Aus90:=strtoint(Form.ComboBox22.Text);
  Ein100:=strtoint(Form.ComboBox24.Text);
  Aus100:=strtoint(Form.ComboBox23.Text);
  GradientWert:=strtofloat(Form.ComboBox25.Text);
  Hysterese:=strtofloat(Form.ComboBox26.Text);
  Hysterese2:=strtofloat(Form.ComboBox29.Text);
  Aufheizrate:=strtofloat(Form.ComboBox27.Text);
  If Steuerung='USB' then Form1.USB_Update_Tmr.Enabled:=true else Form1.USB_Update_Tmr.Enabled:=true;
  If Steuerung='BATCH' then Form1.Batch_Update_Tmr.Enabled:=true else Form1.Batch_Update_Tmr.Enabled:=true;
  Aufheizrate:=strtofloat(Form.ComboBox27.Text);
end;

procedure setup_laden(Form:TForm1; filename:string);
begin
  try
    sl:=TStringList.Create; //Objekt erzeugen
    sl.LoadFromFile(filename);  //Datei in Stringliste laden
    sl2:=TStringList.Create;
    sl2.Delimiter:=';';
    try
      sl2.DelimitedText:=sl[0];
      try if sl2[sl2.Count-1]<>'Standard' then pfad:=sl2[sl2.Count-1]; except ; end;
      sl2.DelimitedText:=sl[1];
      try Steuerung:=sl2[sl2.Count-1]; Form.ComboBox1.Text:=sl2[sl2.Count-1]; except Steuerung:='LPT'; end;
      sl2.DelimitedText:=sl[2];
      try LPTPort:=strtoint(sl2[sl2.Count-1]); Form.ComboBox8.Text:=sl2[sl2.Count-1]; except LPTPort:=888; end;
      sl2.DelimitedText:=sl[3];
      try HWert:=strtoint(sl2[sl2.Count-1]); Form.ComboBox9.Text:=sl2[sl2.Count-1]; except HWert:=1; end;
      sl2.DelimitedText:=sl[4];
      try RWert:=strtoint(sl2[sl2.Count-1]); Form.ComboBox10.Text:=sl2[sl2.Count-1]; except RWert:=2; end;
      sl2.DelimitedText:=sl[5];
      try PWert:=strtoint(sl2[sl2.Count-1]); Form.ComboBox11.Text:=sl2[sl2.Count-1]; except PWert:=8; end;
      sl2.DelimitedText:=sl[6];
      try AWert:=strtoint(sl2[sl2.Count-1]); Form.ComboBox12.Text:=sl2[sl2.Count-1]; except AWert:=128; end;
      sl2.DelimitedText:=sl[7];
      try USBTyp:=sl2[sl2.Count-1]; Form.ComboBox2.Text:=sl2[sl2.Count-1]; except USBTyp:='Denkovi'; end;
      sl2.DelimitedText:=sl[8];
      try DeviceIndex:=strtoint(sl2[sl2.Count-1]); Form.ComboBox16.Text:=sl2[sl2.Count-1]; except DeviceIndex:=0; end;
      sl2.DelimitedText:=sl[9];
      try USBPort:=sl2[sl2.Count-1]; Form.ComboBox7.Text:=sl2[sl2.Count-1]; except USBPort:='COM3'; end;
      sl2.DelimitedText:=sl[10];
      try USBHWert:=sl2[sl2.Count-1][1]; Form.ComboBox3.Text:=sl2[sl2.Count-1]; dec(USBHWert, $30); except USBHWert:=char($01); end;
      sl2.DelimitedText:=sl[11];
      try USBRWert:=sl2[sl2.Count-1][1]; Form.ComboBox4.Text:=sl2[sl2.Count-1]; dec(USBRWert, $30); except USBRWert:=char($02); end;
      sl2.DelimitedText:=sl[12];
      try USBPWert:=sl2[sl2.Count-1][1]; Form.ComboBox5.Text:=sl2[sl2.Count-1]; dec(USBPWert, $30); except USBPWert:=char($03); end;
      sl2.DelimitedText:=sl[13];
      try USBAWert:=sl2[sl2.Count-1][1]; Form.ComboBox6.Text:=sl2[sl2.Count-1]; dec(USBAWert, $30); except USBAWert:=char($04); end;
      sl2.DelimitedText:=sl[14];
      try BHEin:=sl2[sl2.Count-1]; BHEin:=stringreplace(BHEin,'€€€',' ',[rfReplaceAll]); Form.Edit54.Text:=BHEin; except BHEin:='none'; end;
      sl2.DelimitedText:=sl[15];
      try BHAus:=sl2[sl2.Count-1]; BHAus:=stringreplace(BHAus,'€€€',' ',[rfReplaceAll]); Form.Edit55.Text:=BHAus; except BHAus:='none'; end;
      sl2.DelimitedText:=sl[16];
      try BREin:=sl2[sl2.Count-1]; BREin:=stringreplace(BREin,'€€€',' ',[rfReplaceAll]); Form.Edit56.Text:=BREin; except BREin:='none'; end;
      sl2.DelimitedText:=sl[17];
      try BRAus:=sl2[sl2.Count-1]; BRAus:=stringreplace(BRAus,'€€€',' ',[rfReplaceAll]); Form.Edit57.Text:=BRAus; except BRAus:='none'; end;
      sl2.DelimitedText:=sl[18];
      try BPEin:=sl2[sl2.Count-1]; BPEin:=stringreplace(BPEin,'€€€',' ',[rfReplaceAll]); Form.Edit58.Text:=BPEin; except BPEin:='none'; end;
      sl2.DelimitedText:=sl[19];
      try BPAus:=sl2[sl2.Count-1]; BPAus:=stringreplace(BPAus,'€€€',' ',[rfReplaceAll]); Form.Edit59.Text:=BPAus; except BPAus:='none'; end;
      sl2.DelimitedText:=sl[20];
      try BAEin:=sl2[sl2.Count-1]; BAEin:=stringreplace(BAEin,'€€€',' ',[rfReplaceAll]); Form.Edit60.Text:=BAEin; except BAEin:='none'; end;
      sl2.DelimitedText:=sl[21];
      try BAAus:=sl2[sl2.Count-1]; BAAus:=stringreplace(BAAus,'€€€',' ',[rfReplaceAll]); Form.Edit61.Text:=BAAus; except BAAus:='none'; end;
      sl2.DelimitedText:=sl[22];
      try TWert:=strtofloat(sl2[sl2.Count-1]); Form.ComboBox13.Text:=sl2[sl2.Count-1]; except TWert:=2.0; end;
      sl2.DelimitedText:=sl[23];
      try Ein60:=strtoint(sl2[sl2.Count-1]); Form.ComboBox14.Text:=sl2[sl2.Count-1]; except Ein60:=5; end;
      sl2.DelimitedText:=sl[24];
      try Aus60:=strtoint(sl2[sl2.Count-1]); Form.ComboBox15.Text:=sl2[sl2.Count-1]; except Aus60:=10; end;
      sl2.DelimitedText:=sl[25];
      try Ein70:=strtoint(sl2[sl2.Count-1]); Form.ComboBox17.Text:=sl2[sl2.Count-1]; except Ein70:=8; end;
      sl2.DelimitedText:=sl[26];
      try Aus70:=strtoint(sl2[sl2.Count-1]); Form.ComboBox18.Text:=sl2[sl2.Count-1]; except Aus70:=10; end;
      sl2.DelimitedText:=sl[27];
      try Ein80:=strtoint(sl2[sl2.Count-1]); Form.ComboBox19.Text:=sl2[sl2.Count-1]; except Ein80:=10; end;
      sl2.DelimitedText:=sl[28];
      try Aus80:=strtoint(sl2[sl2.Count-1]); Form.ComboBox20.Text:=sl2[sl2.Count-1]; except Aus80:=10; end;
      sl2.DelimitedText:=sl[29];
      try Ein90:=strtoint(sl2[sl2.Count-1]); Form.ComboBox21.Text:=sl2[sl2.Count-1]; except Ein90:=10; end;
      sl2.DelimitedText:=sl[30];
      try Aus90:=strtoint(sl2[sl2.Count-1]); Form.ComboBox22.Text:=sl2[sl2.Count-1]; except Aus90:=5; end;
      sl2.DelimitedText:=sl[31];
      try Ein100:=strtoint(sl2[sl2.Count-1]); Form.ComboBox24.Text:=sl2[sl2.Count-1]; except Ein100:=10; end;
      sl2.DelimitedText:=sl[32];
      try Aus100:=strtoint(sl2[sl2.Count-1]); Form.ComboBox23.Text:=sl2[sl2.Count-1]; except Aus100:=0; end;
      sl2.DelimitedText:=sl[33];
      try GradientWert:=strtofloat(sl2[sl2.Count-1]); Form.ComboBox25.Text:=sl2[sl2.Count-1]; except GradientWert:=0.5; end;
      sl2.DelimitedText:=sl[34];
      try GradientWert:=strtofloat(sl2[sl2.Count-1]); Form.ComboBox26.Text:=sl2[sl2.Count-1]; except GradientWert:=0.5; end;
      sl2.DelimitedText:=sl[35];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox35.Checked:=true else Form.CheckBox35.Checked:=false; except Form.CheckBox35.Checked:=false end;
      sl2.DelimitedText:=sl[36];
      try tempdateiname:=sl2[sl2.Count-1]; tempdateiname:=stringreplace(tempdateiname,'€€€',' ',[rfReplaceAll]); Form.Edit62.Text:=tempdateiname; except tempdateiname:='none'; end;
      sl2.DelimitedText:=sl[37];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox38.Checked:=true else Form.CheckBox38.Checked:=false; except Form.CheckBox38.Checked:=false end;
      sl2.DelimitedText:=sl[38];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox39.Checked:=true else Form.CheckBox39.Checked:=false; except Form.CheckBox39.Checked:=false end;
      sl2.DelimitedText:=sl[39];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox40.Checked:=true else Form.CheckBox40.Checked:=false; except Form.CheckBox40.Checked:=false end;
      sl2.DelimitedText:=sl[40];
      try Aufheizrate:=strtofloat(sl2[sl2.Count-1]); Form.ComboBox27.Text:=sl2[sl2.Count-1]; except Aufheizrate:=1.0; end;
      sl2.DelimitedText:=sl[41];
      try Relais4:=sl2[sl2.Count-1]; except Relais4:='Kühlung'; end;
      Form.ComboBox28.Text:='Heizung, Rührwerk, '+Relais4+', Alarm';
      sl2.DelimitedText:=sl[42];
      try Hysterese2:=strtofloat(sl2[sl2.Count-1]); Form.ComboBox29.Text:=sl2[sl2.Count-1]; except Hysterese2:=1.0; end;
      sl2.DelimitedText:=sl[43];
      try Temperaturrast:=strtoint(sl2[sl2.Count-1]);
      if Temperaturrast=1 then Form.ComboBox31.Text:='Bei Rasttemperaturüberschreitung'
      else if Temperaturrast=2 then Form.ComboBox31.Text:='Bei Rasttemperaturunterschreitung'
      else if Temperaturrast=3 then Form.ComboBox31.Text:='Rastspezifisch'
      else Form.ComboBox31.Text:='Temperaturunabhängig';
      except Form.ComboBox31.Text:='Bei Rasttemperaturüberschreitung'; end;
      Form1.ComboBox31Change(Form1);
      sl2.DelimitedText:=sl[44];
      try Form.ComboBox30.Text:=sl2[sl2.Count-1]; except Form.ComboBox30.Text:='Minuten'; end;
      sl2.DelimitedText:=sl[45];
      try Form.ComboBox32.Text:=sl2[sl2.Count-1]; except Form.ComboBox32.Text:='Sekunden'; end;
      sl2.DelimitedText:=sl[46];
      try Form.ComboBox33.Text:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox33.Text:='5 Sekunden'; end;
      AusIst:=Aus60;
      EinIst:=Ein60;
      If Steuerung='USB' then Form1.USB_Update_Tmr.Enabled:=true;
      If Steuerung='BATCH' then Form1.Batch_Update_Tmr.Enabled:=true;
      If USBHWert=char(1) then USBHIntWert:=2 else if USBHWert=char(2) then USBHIntWert:=8 else if USBHWert=char(3) then USBHIntWert:=32 else USBHIntWert:=128;
      If USBRWert=char(1) then USBRIntWert:=2 else if USBRWert=char(2) then USBRIntWert:=8 else if USBRWert=char(3) then USBRIntWert:=32 else USBRIntWert:=128;
      If USBAWert=char(1) then USBAIntWert:=2 else if USBAWert=char(2) then USBAIntWert:=8 else if USBAWert=char(3) then USBAIntWert:=32 else USBAIntWert:=128;
      If USBPWert=char(1) then USBPIntWert:=2 else if USBPWert=char(2) then USBPIntWert:=8 else if USBPWert=char(3) then USBPIntWert:=32 else USBPIntWert:=128;
    finally
      sl2.Free;
    end;
  finally
    sl.Free;
  end;
end;

procedure Display(Form:TForm1; filename:string);
var strcopy:String;
begin
  try
    AssignFile(myDisplay, filename);                // Displaydaten speichern
    ReWrite(myDisplay);
    strcopy:=copy(Form1.Panel1.Caption, 1, Length(Form1.Panel1.Caption)- 3);
    WriteLn(myDisplay, strcopy);
    strcopy:=copy(Form1.Panel4.Caption, 1, Length(Form1.Panel4.Caption)- 3);
    WriteLn(myDisplay, strcopy);
    if (Heizung<>0) then WriteLn(myDisplay, '1') else WriteLn(myDisplay, '0');
    if (Ruehrwerk<>0) then WriteLn(myDisplay, '1') else WriteLn(myDisplay, '0');
    if (Pumpe<>0) then WriteLn(myDisplay, '1') else WriteLn(myDisplay, '0');
    if (Alarm<>0) then WriteLn(myDisplay, '1') else WriteLn(myDisplay, '0');
    if (Start=true) then WriteLn(myDisplay, 'aktiv');
    if (Stop=true) then WriteLn(myDisplay, 'inaktiv');
    if (Pause=true) then WriteLn(myDisplay, 'pausiert');
    CloseFile(myDisplay);
  except
    exit;
  end;
end;

procedure writechart(Form:TForm1);
var
  I: Integer;
  s,t: TLineSeries;
  s2: TAreaSeries;
begin
  try
    with Form.Chart1 do
    begin
      s := Form.Series1;  // Kurve erstellen Ist-Temperatur
      t := Form.Series2;  // Kurve erstellen Soll-Temperatur
      s.Clear;  // Inhalt von der Kurve loeschen
      t.Clear;
      s.ParentChart := Form.Chart1; // Kurve an Chart festbinden
      s.XValues.DateTime := True;  // X-Achse auf Datum umstellen
      BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
      BottomAxis.Minimum := 0;
      BottomAxis.Maximum := StrToDate(Form.StringGrid1.Cells[0,endpunkt-1])+StrToTime(Form.StringGrid1.Cells[1,endpunkt-1]); // X-Achse Startpunkt
      BottomAxis.Minimum := StrToDate(Form.StringGrid1.Cells[0,startpunkt])+StrToTime(Form.StringGrid1.Cells[1,startpunkt]); // X-Achse Endpunkt
      LeftAxis.Minimum := 0;
      LeftAxis.Maximum := StrToFloat(Form.StringGrid1.Cells[6,startpunkt])+1; // Y-Achse Reset max
      LeftAxis.Minimum := StrToFloat(Form.StringGrid1.Cells[6,startpunkt]); // Y-Achse Reset min
      BottomAxis.Automatic := False;
      LeftAxis.Automatic := False;
      for i:= startpunkt to endpunkt-1 do
      begin
        s.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[6,i]));  // Wert in Chart einfägen
        if LeftAxis.Maximum<StrToFloat(Form.StringGrid1.Cells[6,i])+2 then LeftAxis.Maximum:=StrToFloat(Form.StringGrid1.Cells[6,i])+2; // Y-Achse Korrektur max
        if LeftAxis.Minimum>StrToFloat(Form.StringGrid1.Cells[6,i])-2 then LeftAxis.Minimum:=StrToFloat(Form.StringGrid1.Cells[6,i])-2; // Y-Achse Korrektur min
      end;
      t.ParentChart := Form.Chart1;
      for i:= startpunkt to endpunkt-1 do
      begin
        t.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[7,i]));
        if LeftAxis.Maximum<StrToFloat(Form.StringGrid1.Cells[7,i])+2 then LeftAxis.Maximum:=StrToFloat(Form.StringGrid1.Cells[7,i])+2;
        if LeftAxis.Minimum>StrToFloat(Form.StringGrid1.Cells[7,i])-2 then LeftAxis.Minimum:=StrToFloat(Form.StringGrid1.Cells[7,i])-2;
      end;
    end;
    with Form.Chart2 do
    begin
      s2 := form.series3; // Kurve erstellen Heizung
      s2.Clear;
      s2.ParentChart := Form.Chart2;
      s2.XValues.DateTime := True;
      BottomAxis.DateTimeFormat := 'hh:mm:ss';
      BottomAxis.Minimum := 0;
      BottomAxis.Maximum := StrToDate(Form.StringGrid1.Cells[0,endpunkt-1])+StrToTime(Form.StringGrid1.Cells[1,endpunkt-1]);
      BottomAxis.Minimum := StrToDate(Form.StringGrid1.Cells[0,startpunkt])+StrToTime(Form.StringGrid1.Cells[1,startpunkt]);
      LeftAxis.Maximum := 1.05;
      LeftAxis.Minimum := -0.05;
      BottomAxis.Automatic := False;
      LeftAxis.Automatic := False;
      for i:= startpunkt to endpunkt-1 do
      begin
        if i>0 then s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[2,i-1]));
        s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[2,i]));
      end;
    end;
    with Form.Chart3 do
    begin
      s2 := Form.series4;  // Kurve erstellen Rührwerk
      s2.Clear;
      s2.ParentChart := Form.Chart3;
      s2.XValues.DateTime := True;
      BottomAxis.DateTimeFormat := 'hh:mm:ss';
      BottomAxis.Minimum := 0;
      BottomAxis.Maximum := StrToDate(Form.StringGrid1.Cells[0,endpunkt-1])+StrToTime(Form.StringGrid1.Cells[1,endpunkt-1]);
      BottomAxis.Minimum := StrToDate(Form.StringGrid1.Cells[0,startpunkt])+StrToTime(Form.StringGrid1.Cells[1,startpunkt]);
      BottomAxis.DateTimeFormat := 'hh:mm:ss'; // bzw: 'dd-mm-yy hh:mm:ss'
      LeftAxis.Maximum := 1.05;
      LeftAxis.Minimum := -0.05;
      BottomAxis.Automatic := False;
      LeftAxis.Automatic := False;
      for i:= startpunkt to endpunkt-1 do
      begin
        if i>0 then s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[3,i-1]));
        s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[3,i]));
      end;
    end;
    with Form.Chart4 do
    begin
      s2 := Form.series5;  // Kurve erstellen Pumpe
      s2.Clear;
      s2.ParentChart := Form.Chart4;
      s2.XValues.DateTime := True;
      BottomAxis.DateTimeFormat := 'hh:mm:ss';
      BottomAxis.Minimum := 0;
      BottomAxis.Maximum := StrToDate(Form.StringGrid1.Cells[0,endpunkt-1])+StrToTime(Form.StringGrid1.Cells[1,endpunkt-1]);
      BottomAxis.Minimum := StrToDate(Form.StringGrid1.Cells[0,startpunkt])+StrToTime(Form.StringGrid1.Cells[1,startpunkt]);
      LeftAxis.Maximum := 1.05;
      LeftAxis.Minimum := -0.05;
      BottomAxis.Automatic := False;
      LeftAxis.Automatic := False;
      for i:= startpunkt to endpunkt-1 do
      begin
        if i>0 then s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[4,i-1]));
        s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[4,i]));
      end;
    end;
    with Form.Chart5 do
    begin
      s2 := Form.series6;  // Kurve erstellen Alarm
      s2.Clear;
      s2.ParentChart := Form.Chart5;
      s2.XValues.DateTime := True;
      BottomAxis.DateTimeFormat := 'hh:mm:ss';
      BottomAxis.Minimum := 0;
      BottomAxis.Maximum := StrToDate(Form.StringGrid1.Cells[0,endpunkt-1])+StrToTime(Form.StringGrid1.Cells[1,endpunkt-1]);
      BottomAxis.Minimum := StrToDate(Form.StringGrid1.Cells[0,startpunkt])+StrToTime(Form.StringGrid1.Cells[1,startpunkt]);
      LeftAxis.Maximum := 1.05;
      LeftAxis.Minimum := -0.05;
      BottomAxis.Automatic := False;
      LeftAxis.Automatic := False;
      for i:= startpunkt to endpunkt-1 do
      begin
        if i>0 then s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[5,i-1]));
        s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[5,i]));
      end;
    end;
  except
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
  try
    Les_Strings := TStringList.Create;
    Les_Strings.LoadFromFile(FN);                        // Datei laden
    CountLines := Les_Strings.Count + SG.FixedRows;      // Anzahl der Zeilen ermitteln
    SG.RowCount := CountLines;                           // Anpassung der Grid-Größe
    SG.ColCount := 8;
    InitialCol := SG.FixedCols - 1;                      // Initialisierung
    Ligne := SG.FixedRows - 1;
    for i := 0 to Les_Strings.Count - 1 do               // Alle Zeilen der Datei durchlaufen
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
    Les_Strings.Free;
  except
  end;
end;

procedure GetGradient(Sender: TObject);
var
  i: integer;
begin
  for i:=1 to 59 do Gradientgetter[i]:=Gradientgetter[i+1];
  Gradientgetter[60]:=Tempfloat;
  Gradient:=Gradientgetter[60]-Gradientgetter[1];
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if Button8.Caption='Rührwerk Ein' then
  begin
    Button8.Caption:='Rührwerk Aus';
    Ruehrwerk:=RWert;
    Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-ein.bmp');
  end
  else
  begin
    Button8.Caption:='Rührwerk Ein';
    Ruehrwerk:=0;
    Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-aus.bmp');
  end;
  Schalten(Form1);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if Button9.Caption='Heizung Ein' then
  begin
    Button9.Caption:='Heizung Aus';
    Heizung:=HWert;
    Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-ein.bmp');
  end
  else
  begin
    Button9.Caption:='Heizung Ein';
    Heizung:=0;
    Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-aus.bmp');
  end;
  Schalten(Form1);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  if Button10.Caption=Relais4+' Ein' then
  begin
    Button10.Caption:=Relais4+' Aus';
    Pumpe:=PWert;
    Image4.Picture.LoadFromFile(pfad + 'Graphics\'+Relais4+'-ein.bmp');
  end
  else
  begin
    Button10.Caption:=Relais4+' Ein';
    Pumpe:=0;
    Image4.Picture.LoadFromFile(pfad + 'Graphics\'+Relais4+'-aus.bmp');
  end;
  Schalten(Form1);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  if Button11.Caption='Alarm Ein' then
  begin
    Button11.Caption:='Alarm Aus';
    Alarm:=AWert;
    Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-ein.bmp')
  end
  else
  begin
    Button11.Caption:='Alarm Ein';
    Alarm:=0;
    Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-aus.bmp');
  end;
  Schalten(Form1);
end;

procedure TForm1.Timer1Timer(Sender: TObject);            // Timer für Temperaturmessung
var
  tf:extended;
  tfs:string;
  sl3:TStringList;
  TempFile:textfile;
  linecounter:integer;
begin
  linecounter:=0;
  DecimalSeparator:='.';
  if FileExists(pfad+'Temperatur\' + tempdateiname) then else
  begin
    AssignFile(myFile, pfad+'Temperatur\' + tempdateiname);
    ReWrite(myFile);
    Writeln(myFile, '01-01-2000 00:00:00;21.0');
    CloseFile(myFile);
  end;
  try
    AssignFile (TempFile,pfad + 'Temperatur\' + tempdateiname);
    reset (TempFile);
    while not EOF (TempFile) do
    begin
      readln (TempFile, TimeTempStr);
      linecounter:=linecounter+1;
    end;
    CloseFile(TempFile);
    if linecounter>100 then
    begin
      linecounter:=0;
      DeleteFile(pfad+'Temperatur\' + tempdateiname);
      AssignFile(myFile, pfad+'Temperatur\' + tempdateiname);
      ReWrite(myFile);
      Writeln(myFile, TimeTempStr);
      CloseFile(myFile);
    end;
  except
    exit;
  end;
  sl3:=TStringList.Create;
  sl3.Delimiter:=';';
  sl3.DelimitedText:=TimeTempStr;
  tfs:=sl3[sl3.Count-1];
  Tempfloat:=strtofloat(tfs);
  tf:=strtofloat(tfs);
  tfs:=FloatToStrF(tf, ffFixed, 3, 1);
  Temperatur:=tfs+' °C';
  tfs:=floattostr(round(tf));
  if tf<0 then tfs:='0';
  if tf>100 then tfs:='100';
  Graphic:=pfad + 'Graphics\Thermo'+tfs+'.jpg';
  Image1.Picture.LoadFromFile(Graphic);
  panel1.Caption:=Temperatur;
  GetGradient(Sender);
  Display(Form1, pfad + 'Display\display.txt');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  Rezeptname:='noname';
  Relais4:='Kühlung';
  rast:=0;
  Form1.Top:=20;
  Form1.Left:=20;
  pfad:=ExtractFilePath(ParamStr(0));
  OpenDialog1.InitialDir:=pfad+'Rezepte';
  SaveDialog1.InitialDir:=pfad+'Rezepte';
  ser:=TBlockserial.Create;
  ser.RaiseExcept:=False;
  self.DoubleBuffered:=true;
  PageControl1.ActivePage:=TabSheet1;
  Application.HintHidePause := 5000;
  if FileExists(pfad+'Setup\settings.txt') then
  begin
    laden(Form1, pfad+'Setup\settings.txt');
    settings_laden(Form1, pfad+'Setup\settings.txt');
    CloseFile(myFile);
  end;
  Form1.Button30Click(Sender);
  AlarmEin:=false;
  pause:=false;
  stop:=true;
  start:=false;
  DecimalSeparator:='.';
  setup_laden(Form1, pfad+'Setup\Setup.txt');
  Form1.ComboBox2Change(Sender);
  if DeleteFile(pfad+'Temperatur\' + tempdateiname) then
  begin
    AssignFile(myFile, pfad+'Temperatur\' + tempdateiname);
    ReWrite(myFile);
    Writeln(myFile, '01-01-2000 00:00:00;21.0');
    CloseFile(myFile);
  end;
  Timer1.Enabled:=true;
  Ruehrwerk:=0;
  Heizung:=0;
  Alarm:=0;
  Pumpe:=0;
  LPTCode:=0;
  RStore:=1;
  HStore:=1;
  AStore:=1;
  PStore:=1;
  sensorreset:=0;
  Schalten(Form1);
  Form1.Timer1Timer(Sender);
  for i:=1 to 60 do Gradientgetter[i]:=Tempfloat;
  Gradient:=0.0;
  Display(Form1, pfad + 'Display\display.txt');
  StartTimer.Enabled:=true;
  Form1.ComboBox28Change(Sender);
  Form1.ComboBox1Change(Sender);
  Form1.ComboBox30Change(Sender);
  Form1.ComboBox32Change(Sender);
  Form1.ComboBox33Change(Sender);
  form1.Caption:='Brauerei '+ Version
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if DeleteFile(SaveDialog1.FileName) then MessageDlgPos('Rezept wurde überschrieben !', mtInformation, [mbOK], 0, Form1.Left+350, Form1.Top+250);
    speichern(Form1, SaveDialog1.FileName);
  	Rezeptname:= changefileext(ExtractFileName(SaveDialog1.FileName),'');   //hinzu
    form1.Caption:='Brauerei '+ Version + ' - ' +  Rezeptname; //Ausgabe des gespeicherten Rezepts
    CloseFile(myFile);
  end;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
begin
  OpenDialog1.FileName:='';
  if OpenDialog1.Execute then
  begin;
    laden(Form1, OpenDialog1.FileName);
  	Rezeptname:= changefileext(ExtractFileName(OpenDialog1.FileName),'');   //hinzu
    form1.Caption:='Brauerei '+ Version + ' - ' +  Rezeptname; //Ausgabe des gespeicherten Rezepts
    CloseFile(myFile);
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i: integer;
begin
  if (CheckBox1.Checked=false) and (CheckBox2.Checked=false) and (CheckBox3.Checked=false) and (CheckBox4.Checked=false) and (CheckBox5.Checked=false) and (CheckBox6.Checked=false) and
  (CheckBox7.Checked=false) and (CheckBox8.Checked=false) and (CheckBox9.Checked=false) and (CheckBox10.Checked=false) then exit;
  TimerHEin.Interval:=1000;
  TimerHAus.Interval:=1000;
  TimerHSet.Enabled:=true;
  TimerKEin.Interval:=1000;
  TimerKAus.Interval:=1000;
  if relais4='Kühlung' then TimerKSet.Enabled:=true;
  BitBtn16.Enabled:=false;
  Form1.Button30Click(Sender);
  if start=false then
  begin
    if pause=false then
    begin
      PauseLogTimerHEin:=false;
      PauseLogTimerHAus:=false;
      PauseLogTimerHSet:=false;
      PauseLogTimerKEin:=false;
      PauseLogTimerKAus:=false;
      PauseLogTimerKSet:=false;
      PauseLogTimerREin:=false;
      PauseLogTimerRAus:=false;
      if Relais4='Kühlung' then Image4.Picture.LoadFromFile(pfad + 'Graphics\Kühlung-aus.bmp');
      Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-aus.bmp');
      Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-aus.bmp');
      Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-aus.bmp');
      Schalten(Form1);
      if checkbox32.Checked=true then
      begin
        LogName:=Rezeptname+'_'+FormatDateTime('ddmmyyyyhhnnss', now);
        LogTimer.Enabled:=true;
        LogName:=pfad + 'log\log_'+LogName+'.log';
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
      Rastnullges:=false;
      if (CheckBox1.Checked=true) and (Edit2.Text='0') then begin Rastnull1:=true; Rastnullges:=true; end else Rastnull1:=false;
      if (CheckBox2.Checked=true) and (Edit4.Text='0') then begin Rastnull2:=true; Rastnullges:=true; end else Rastnull2:=false;
      if (CheckBox3.Checked=true) and (Edit6.Text='0') then begin Rastnull3:=true; Rastnullges:=true; end else Rastnull3:=false;
      if (CheckBox4.Checked=true) and (Edit8.Text='0') then begin Rastnull4:=true; Rastnullges:=true; end else Rastnull4:=false;
      if (CheckBox5.Checked=true) and (Edit10.Text='0') then begin Rastnull5:=true; Rastnullges:=true; end else Rastnull5:=false;
      if (CheckBox6.Checked=true) and (Edit12.Text='0') then begin Rastnull6:=true; Rastnullges:=true; end else Rastnull6:=false;
      if (CheckBox7.Checked=true) and (Edit14.Text='0') then begin Rastnull7:=true; Rastnullges:=true; end else Rastnull7:=false;
      if (CheckBox8.Checked=true) and (Edit16.Text='0') then begin Rastnull8:=true; Rastnullges:=true; end else Rastnull8:=false;
      if (CheckBox9.Checked=true) and (Edit18.Text='0') then begin Rastnull9:=true; Rastnullges:=true; end else Rastnull9:=false;
      if (CheckBox10.Checked=true) and (Edit20.Text='0') then begin Rastnull10:=true; Rastnullges:=true; end else Rastnull10:=false;
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
      StartTemp:=round(TempFloat);
      if ComboBox31.Text='Rastspezifisch' then
      begin
        for i:= 1 to 10 do
        begin
          if (FindComponent('ComboBox' + IntToStr(33+i)) as TComboBox).Text = 'Bei Rasttemperaturüberschreitung' then
             (FindComponent('Gauge' + IntToStr(i)) as TGauge).BackColor := clRed
          else if (FindComponent('ComboBox' + IntToStr(33+i)) as TComboBox).Text = 'Bei Rasttemperaturunterschreitung' then
             (FindComponent('Gauge' + IntToStr(i)) as TGauge).BackColor := clSkyBlue
          else
             (FindComponent('Gauge' + IntToStr(i)) as TGauge).BackColor := clWhite
        end;
      end;
    end
    else
    begin
      zeit3:=zeit3-zeitpause+GetTickCount;
      if PauseLogTimerKEin=true then begin PauseLogTimerKEin:=false; TimerKEin.Enabled:=true; end;
      if PauseLogTimerKAus=true then begin PauseLogTimerKAus:=false; TimerKAus.Enabled:=true; end;
      if PauseLogTimerKSet=true then begin PauseLogTimerKSet:=false; TimerKSet.Enabled:=true; end;
      if PauseLogTimerHEin=true then begin PauseLogTimerHEin:=false; TimerHEin.Enabled:=true; end;
      if PauseLogTimerHAus=true then begin PauseLogTimerHAus:=false; TimerHAus.Enabled:=true; end;
      if PauseLogTimerHSet=true then begin PauseLogTimerHSet:=false; TimerHSet.Enabled:=true; end;
      if PauseLogTimerREin=true then begin PauseLogTimerREin:=false; Form1.TimerREinTimer(Sender); end;
      if PauseLogTimerRAus=true then begin PauseLogTimerRAus:=false; Form1.TimerREinTimer(Sender); end;
    end;
    restrastzeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
    if (restrastzeit<>0) or (rastnullges=true) then
    begin
      Timer2.Enabled:=true;
      Panel9.Enabled:=false;
      Panel11.Enabled:=false;
      Panel15.Visible:=false;
      CheckBox32.Enabled:=false;
      Button8.Enabled:=false;
      Button9.Enabled:=false;
      if relais4='Kühlung' then Button10.Enabled:=false;
      Button11.Enabled:=false;
      BitBtn8.Enabled:=false;
      BitBtn9.Enabled:=false;
      BitBtn12.Enabled:=false;
      TabSheet4.TabVisible:=false;
      if checkbox32.checked=true then Button18.Enabled:=true;
      if checkbox32.checked=true then Button23.Enabled:=true;
      Graphic:=pfad + 'Graphics\Automatik-aktiv.bmp';
      Image5.Picture.LoadFromFile(Graphic);
      stop:=false;
      pause:=false;
      Form1.Timer2Timer(Sender);
      start:=true;
    end;
  end;
  GesUpdateTimer.Enabled:=true;
  restrastzeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
  if (restrastzeit=0) and (Rastnullges=false) then Form1.BitBtn3Click(Sender);
end;


procedure TForm1.Timer2Timer(Sender: TObject);
var i,zeitfaktor,ruehrzeitfaktor:integer;
begin
  if Combobox30.Text='Minuten' then zeitfaktor:=1 else zeitfaktor:=60;
  if Combobox32.Text='Sekunden' then ruehrzeitfaktor:=1 else if Combobox32.Text='Minuten' then ruehrzeitfaktor:=60 else ruehrzeitfaktor:=3600;
  DecimalSeparator:='.';
  if AlarmEin=true then
  else if (Edit21.Text<>'0') or (Rastnull1=true) then
  begin
    if (Combobox31.Text='Rastspezifisch') and (Combobox34.Text='Bei Rasttemperaturüberschreitung') then Temperaturrast:=1;
    if (Combobox31.Text='Rastspezifisch') and (Combobox34.Text='Temperaturunabhängig') then Temperaturrast:=0;
    if (Combobox31.Text='Rastspezifisch') and (Combobox34.Text='Bei Rasttemperaturunterschreitung') then Temperaturrast:=2;
    if rast<>1 then
    begin
      TimerREin.Interval:=100+strtoint(Edit41.Text)*1000*ruehrzeitfaktor; TimerRAus.Interval:=100+strtoint(Edit31.Text)*1000*ruehrzeitfaktor;
      if CheckBox21.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    end;
    if Rasttemp1=false then
    begin
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit1.Text);
      if Temperaturrast=0 then Rasttemp1:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit1.Text) then Rasttemp1:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit1.Text) then Rasttemp1:=true;// else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit2.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp1=true) then Edit21.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull1=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge1.Progress:=fortschritt;
    rast:=1;
    CheckBox1.Color:=clInfoBk;
   if rasttemp1=true then rastnull1:=false;
    if (Edit21.Text='0') and (CheckBox11.Checked=true) and (rastnull1=false) then AlarmEin:=true;
  end
  else if (Edit22.Text<>'0') or (Rastnull2=true) then
  begin
    if (Combobox31.Text='Rastspezifisch') and (Combobox35.Text='Bei Rasttemperaturüberschreitung') then Temperaturrast:=1;
    if (Combobox31.Text='Rastspezifisch') and (Combobox35.Text='Temperaturunabhängig') then Temperaturrast:=0;
    if (Combobox31.Text='Rastspezifisch') and (Combobox35.Text='Bei Rasttemperaturunterschreitung') then Temperaturrast:=2;
    if rast<>2 then
    begin
      TimerREin.Interval:=100+strtoint(Edit42.Text)*1000*ruehrzeitfaktor; TimerRAus.Interval:=100+strtoint(Edit32.Text)*1000*ruehrzeitfaktor;
      if CheckBox22.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    end;
    if Rasttemp2=false then
    begin
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit3.Text);
      if Temperaturrast=0 then Rasttemp2:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit3.Text) then Rasttemp2:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit3.Text) then Rasttemp2:=true;// else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit4.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp2=true) then Edit22.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull2=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge2.Progress:=fortschritt;
    rast:=2;
    CheckBox2.Color:=clInfoBk;
    if rasttemp2=true then rastnull2:=false;
    if (Edit22.Text='0') and (CheckBox12.Checked=true) and (rastnull2=false) then AlarmEin:=true;
  end
  else if (Edit23.Text<>'0') or (Rastnull3=true) then
  begin
    if (Combobox31.Text='Rastspezifisch') and (Combobox36.Text='Bei Rasttemperaturüberschreitung') then Temperaturrast:=1;
    if (Combobox31.Text='Rastspezifisch') and (Combobox36.Text='Temperaturunabhängig') then Temperaturrast:=0;
    if (Combobox31.Text='Rastspezifisch') and (Combobox36.Text='Bei Rasttemperaturunterschreitung') then Temperaturrast:=2;
    if rast<>3 then
    begin
      TimerREin.Interval:=100+strtoint(Edit43.Text)*1000*ruehrzeitfaktor; TimerRAus.Interval:=100+strtoint(Edit33.Text)*1000*ruehrzeitfaktor;
      if CheckBox23.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    end;
    if Rasttemp3=false then
    begin
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit5.Text);
      if Temperaturrast=0 then Rasttemp3:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit5.Text) then Rasttemp3:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit5.Text) then Rasttemp3:=true;// else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit6.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp3=true) then Edit23.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull3=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge3.Progress:=fortschritt;
    rast:=3;
    CheckBox3.Color:=clInfoBk;
    if rasttemp3=true then rastnull3:=false;
    if (Edit23.Text='0') and (CheckBox13.Checked=true) and (rastnull3=false) then AlarmEin:=true;
  end
  else if (Edit24.Text<>'0') or (Rastnull4=true) then
  begin
    if (Combobox31.Text='Rastspezifisch') and (Combobox37.Text='Bei Rasttemperaturüberschreitung') then Temperaturrast:=1;
    if (Combobox31.Text='Rastspezifisch') and (Combobox37.Text='Temperaturunabhängig') then Temperaturrast:=0;
    if (Combobox31.Text='Rastspezifisch') and (Combobox37.Text='Bei Rasttemperaturunterschreitung') then Temperaturrast:=2;
    if rast<>4 then
    begin
      TimerREin.Interval:=100+strtoint(Edit44.Text)*1000*ruehrzeitfaktor; TimerRAus.Interval:=100+strtoint(Edit34.Text)*1000*ruehrzeitfaktor;
      if CheckBox24.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    end;
    if Rasttemp4=false then
    begin
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit7.Text);
      if Temperaturrast=0 then Rasttemp4:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit7.Text) then Rasttemp4:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit7.Text) then Rasttemp4:=true;// else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit8.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp4=true) then Edit24.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull4=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge4.Progress:=fortschritt;
    rast:=4;
    CheckBox4.Color:=clInfoBk;
    if rasttemp4=true then rastnull4:=false;
    if (Edit24.Text='0') and (CheckBox14.Checked=true) and (rastnull4=false) then AlarmEin:=true;
  end
  else if (Edit25.Text<>'0') or (Rastnull5=true) then
  begin
    if (Combobox31.Text='Rastspezifisch') and (Combobox38.Text='Bei Rasttemperaturüberschreitung') then Temperaturrast:=1;
    if (Combobox31.Text='Rastspezifisch') and (Combobox38.Text='Temperaturunabhängig') then Temperaturrast:=0;
    if (Combobox31.Text='Rastspezifisch') and (Combobox38.Text='Bei Rasttemperaturunterschreitung') then Temperaturrast:=2;
    if rast<>5 then
    begin
      TimerREin.Interval:=100+strtoint(Edit45.Text)*1000*ruehrzeitfaktor; TimerRAus.Interval:=100+strtoint(Edit35.Text)*1000*ruehrzeitfaktor;
      if CheckBox25.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    end;
    if Rasttemp5=false then
    begin
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit9.Text);
      if Temperaturrast=0 then Rasttemp5:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit9.Text) then Rasttemp5:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit9.Text) then Rasttemp5:=true;// else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit10.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp5=true) then Edit25.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull5=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge5.Progress:=fortschritt;
    rast:=5;
    CheckBox5.Color:=clInfoBk;
    if rasttemp5=true then rastnull5:=false;
    if (Edit25.Text='0') and (CheckBox15.Checked=true) and (rastnull5=false) then AlarmEin:=true;
  end
  else if (Edit26.Text<>'0') or (Rastnull6=true) then
  begin
    if (Combobox31.Text='Rastspezifisch') and (Combobox39.Text='Bei Rasttemperaturüberschreitung') then Temperaturrast:=1;
    if (Combobox31.Text='Rastspezifisch') and (Combobox39.Text='Temperaturunabhängig') then Temperaturrast:=0;
    if (Combobox31.Text='Rastspezifisch') and (Combobox39.Text='Bei Rasttemperaturunterschreitung') then Temperaturrast:=2;
    if rast<>6 then
    begin
      TimerREin.Interval:=100+strtoint(Edit46.Text)*1000*ruehrzeitfaktor; TimerRAus.Interval:=100+strtoint(Edit36.Text)*1000*ruehrzeitfaktor;
      if CheckBox26.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    end;
    if Rasttemp6=false then
    begin
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit11.Text);
      if Temperaturrast=0 then Rasttemp6:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit11.Text) then Rasttemp6:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit11.Text) then Rasttemp6:=true;// else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit12.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp6=true) then Edit26.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull6=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge6.Progress:=fortschritt;
    rast:=6;
    CheckBox6.Color:=clInfoBk;
    if rasttemp6=true then rastnull6:=false;
    if (Edit26.Text='0') and (CheckBox16.Checked=true) and (rastnull6=false) then AlarmEin:=true;
  end
  else if (Edit27.Text<>'0') or (Rastnull7=true) then
  begin
    if (Combobox31.Text='Rastspezifisch') and (Combobox40.Text='Bei Rasttemperaturüberschreitung') then Temperaturrast:=1;
    if (Combobox31.Text='Rastspezifisch') and (Combobox40.Text='Temperaturunabhängig') then Temperaturrast:=0;
    if (Combobox31.Text='Rastspezifisch') and (Combobox40.Text='Bei Rasttemperaturunterschreitung') then Temperaturrast:=2;
    if rast<>7 then
    begin
      TimerREin.Interval:=100+strtoint(Edit47.Text)*1000*ruehrzeitfaktor; TimerRAus.Interval:=100+strtoint(Edit37.Text)*1000*ruehrzeitfaktor;
      if CheckBox27.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    end;
    if Rasttemp7=false then
    begin
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit13.Text);
      if Temperaturrast=0 then Rasttemp7:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit13.Text) then Rasttemp7:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit13.Text) then Rasttemp7:=true;// else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit14.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp7=true) then Edit27.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull7=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge7.Progress:=fortschritt;
    rast:=7;
    CheckBox7.Color:=clInfoBk;
    if rasttemp7=true then rastnull7:=false;
    if (Edit27.Text='0') and (CheckBox17.Checked=true) and (rastnull7=false) then AlarmEin:=true;
  end
  else if (Edit28.Text<>'0') or (Rastnull8=true) then
  begin
    if (Combobox31.Text='Rastspezifisch') and (Combobox41.Text='Bei Rasttemperaturüberschreitung') then Temperaturrast:=1;
    if (Combobox31.Text='Rastspezifisch') and (Combobox41.Text='Temperaturunabhängig') then Temperaturrast:=0;
    if (Combobox31.Text='Rastspezifisch') and (Combobox41.Text='Bei Rasttemperaturunterschreitung') then Temperaturrast:=2;
    if rast<>8 then
    begin
      TimerREin.Interval:=100+strtoint(Edit48.Text)*1000*ruehrzeitfaktor; TimerRAus.Interval:=100+strtoint(Edit38.Text)*1000*ruehrzeitfaktor;
      if CheckBox28.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    end;
    if Rasttemp8=false then
    begin
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit15.Text);
      if Temperaturrast=0 then Rasttemp8:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit15.Text) then Rasttemp8:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit15.Text) then Rasttemp8:=true;// else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit16.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp8=true) then Edit28.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull8=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge8.Progress:=fortschritt;
    rast:=8;
    CheckBox8.Color:=clInfoBk;
    if rasttemp8=true then rastnull8:=false;
    if (Edit28.Text='0') and (CheckBox18.Checked=true) and (rastnull8=false) then AlarmEin:=true;
  end
  else if (Edit29.Text<>'0') or (Rastnull9=true) then
  begin
    if (Combobox31.Text='Rastspezifisch') and (Combobox42.Text='Bei Rasttemperaturüberschreitung') then Temperaturrast:=1;
    if (Combobox31.Text='Rastspezifisch') and (Combobox42.Text='Temperaturunabhängig') then Temperaturrast:=0;
    if (Combobox31.Text='Rastspezifisch') and (Combobox42.Text='Bei Rasttemperaturunterschreitung') then Temperaturrast:=2;
    if rast<>9 then
    begin
      TimerREin.Interval:=100+strtoint(Edit49.Text)*1000*ruehrzeitfaktor; TimerRAus.Interval:=100+strtoint(Edit39.Text)*1000*ruehrzeitfaktor;
      if CheckBox29.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    end;
    if Rasttemp9=false then
    begin
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit17.Text);
      if Temperaturrast=0 then Rasttemp9:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit17.Text) then Rasttemp9:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit17.Text) then Rasttemp9:=true;// else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit18.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp9=true) then Edit29.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull9=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge9.Progress:=fortschritt;
    rast:=9;
    CheckBox9.Color:=clInfoBk;
    if rasttemp9=true then rastnull9:=false;
    if (Edit29.Text='0') and (CheckBox19.Checked=true) and (rastnull9=false) then AlarmEin:=true;
  end
  else if (Edit30.Text<>'0') or (Rastnull10=true) then
  begin
    if (Combobox31.Text='Rastspezifisch') and (Combobox43.Text='Bei Rasttemperaturüberschreitung') then Temperaturrast:=1;
    if (Combobox31.Text='Rastspezifisch') and (Combobox43.Text='Temperaturunabhängig') then Temperaturrast:=0;
    if (Combobox31.Text='Rastspezifisch') and (Combobox43.Text='Bei Rasttemperaturunterschreitung') then Temperaturrast:=2;
    if rast<>10 then
    begin
      TimerREin.Interval:=100+strtoint(Edit50.Text)*1000*ruehrzeitfaktor; TimerRAus.Interval:=100+strtoint(Edit40.Text)*1000*ruehrzeitfaktor;
      if CheckBox30.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    end;
    if Rasttemp10=false then
    begin
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit19.Text);
      if Temperaturrast=0 then Rasttemp10:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit19.Text) then Rasttemp10:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit19.Text) then Rasttemp10:=true;// else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit20.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp10=true) then Edit30.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull10=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge10.Progress:=fortschritt;
    rast:=10;
    CheckBox10.Color:=clInfoBk;
    if rasttemp10=true then rastnull10:=false;
    if (Edit30.Text='0') and (CheckBox20.Checked=true) and (rastnull10=false) then AlarmEin:=true;
  end
  else
  begin
    Form1.TimerRAusTimer(Sender);
    TimerREin.Enabled:=false;
    Rastende:=true;
  end;
  if rast<10 then CheckBox10.Color:=clBtnFace;
  if rast<9 then CheckBox9.Color:=clBtnFace;
  if rast<8 then CheckBox8.Color:=clBtnFace;
  if rast<7 then CheckBox7.Color:=clBtnFace;
  if rast<6 then CheckBox6.Color:=clBtnFace;
  if rast<5 then CheckBox5.Color:=clBtnFace;
  if rast<4 then CheckBox4.Color:=clBtnFace;
  if rast<3 then CheckBox3.Color:=clBtnFace;
  if rast<2 then CheckBox2.Color:=clBtnFace;
  Form1.GesUpdateTimerTimer(Sender);
  if solltemp<60 then
  begin EinIst:=Ein60; AusIst:=Aus60; end
  else if solltemp<70 then
  begin EinIst:=Ein70; AusIst:=Aus70; end
  else if solltemp<80 then
  begin EinIst:=Ein80; AusIst:=Aus80; end
  else if solltemp<90 then
  begin EinIst:=Ein90; AusIst:=Aus90; end
  else
  begin EinIst:=Ein100; AusIst:=Aus100; end;
  Panel4.Caption:=FloatToStrF(solltemp,ffFixed,10,1)+' °C';
  if (restrastzeit=0) and (start=true) and (Rastende=true) then Form1.BitBtn3Click(Sender);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var i:integer;
begin
  if Relais4='Kühlung' then Form1.TimerKAusTimer(Sender);
  Form1.PageControl1Change(Sender);
  Form1.TimerHAusTimer(Sender);
  Form1.TimerRAusTimer(Sender);
  BitBtn16.Enabled:=true;
  Timer2.Enabled:=false;
  TimerKEin.Enabled:=false;
  TimerKAus.Enabled:=false;
  TimerKSet.Enabled:=false;
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
  Panel9.Enabled:=true;
  Panel11.Enabled:=true;
  Form1.ComboBox31Change(Sender);
  CheckBox32.Enabled:=true;
  Button8.Enabled:=true;
  Button9.Enabled:=true;
  Button10.Enabled:=true;
  Button11.Enabled:=true;
  BitBtn8.Enabled:=true;
  BitBtn9.Enabled:=true;
  BitBtn12.Enabled:=true;
  Button18.Enabled:=false;
  Button23.Enabled:=false;
  for i:= 21 to 30 do (FindComponent('Edit' + IntToStr(i)) as TEdit).Visible := true;
  for i:= 26 to 35 do (FindComponent('Label' + IntToStr(i)) as TLabel).Visible := true;
  for i:= 1 to 10 do (FindComponent('Gauge' + IntToStr(i)) as TGauge).Visible := true;
  TabSheet4.TabVisible:=true;
  Graphic:=pfad + 'Graphics\Automatik-inaktiv.bmp';
  Image5.Picture.LoadFromFile(Graphic);
  BitBtn1.Enabled:=true;
  BitBtn2.Enabled:=true;
  TimerTimer.Enabled:=false;
  Timer3.Enabled:=false;
  Form2.Label5.Caption:='false';
  Form1.GesUpdateTimer.Enabled:=false;
  GesUpdateTimerTimer(Sender);
  for i:= 1 to 10 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clBtnFace;
  for i:= 1 to 10 do (FindComponent('Gauge' + IntToStr(i)) as TGauge).BackColor := clWhite;
  if stop=false then
  begin
    LogTimer.Enabled:=false;
    LogUpdateTimer.Enabled:=false;
    Button23.Caption:='AutoUpdate Ein';
    if checkbox32.Checked=true then CloseFile(myLogFile);
    MessageDlgPos('Brauvorgang wurde beendet ' + #13 + '- mit OK fortsetzen!', mtInformation, [mbOK], 0, Form1.Left+350, Form1.Top+250);
  end;
  stop:=true;
  pause:=false;
  start:=false;
  rast:=0;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if start=true then
  begin
    Form1.TimerHAusTimer(Sender);
    if TimerKEin.Enabled=true then begin PauseLogTimerKEin:=true; TimerKEin.Enabled:=false; end;
    if TimerKAus.Enabled=true then begin PauseLogTimerKAus:=true; TimerKAus.Enabled:=false; end;
    if TimerKSet.Enabled=true then begin PauseLogTimerKSet:=true; TimerKSet.Enabled:=false; end;
    if TimerHEin.Enabled=true then begin PauseLogTimerHEin:=true; TimerHEin.Enabled:=false; end;
    if TimerHAus.Enabled=true then begin PauseLogTimerHAus:=true; TimerHAus.Enabled:=false; end;
    if TimerHSet.Enabled=true then begin PauseLogTimerHSet:=true; TimerHSet.Enabled:=false; end;
    if TimerREin.Enabled=true then begin PauseLogTimerREin:=true; Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
    if TimerRAus.Enabled=true then begin PauseLogTimerRAus:=true; Form1.TimerRAusTimer(Sender); TimerRAus.Enabled:=false; end;
    if Relais4='Kühlung' then Form1.TimerKAusTimer(Sender);
    zeitpause:=GetTickCount;
    Timer2.Enabled:=false;
    stop:=false;
    pause:=true;
    start:=false;
    Graphic:=pfad + 'Graphics\Automatik-pause.bmp';
    Image5.Picture.LoadFromFile(Graphic);
  end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  zeit3:=zeit3+60000;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
  zeit3:=zeit3-60000;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  if (start=true) then
  begin
    if rasttemp1=false then begin rasttemp1:=true; zeit3:=GetTickCount; end
    else if (Edit21.Text<>'0') or (Rastnull1=true) then begin Edit21.Text:='0'; Gauge1.Progress:=100; Rasttemp1:=true; Rastnull1:=false; end
    else if rasttemp2=false then begin rasttemp2:=true; zeit3:=GetTickCount; end
    else if (Edit22.Text<>'0') or (Rastnull2=true) then begin Edit22.Text:='0'; Gauge2.Progress:=100; Rasttemp2:=true; Rastnull2:=false; end
    else if rasttemp3=false then begin rasttemp3:=true; zeit3:=GetTickCount; end
    else if (Edit23.Text<>'0') or (Rastnull3=true) then begin Edit23.Text:='0'; Gauge3.Progress:=100; Rasttemp3:=true; Rastnull3:=false; end
    else if rasttemp4=false then begin rasttemp4:=true; zeit3:=GetTickCount; end
    else if (Edit24.Text<>'0') or (Rastnull4=true) then begin Edit24.Text:='0'; Gauge4.Progress:=100; Rasttemp4:=true; Rastnull4:=false; end
    else if rasttemp5=false then begin rasttemp5:=true; zeit3:=GetTickCount; end
    else if (Edit25.Text<>'0') or (Rastnull5=true) then begin Edit25.Text:='0'; Gauge5.Progress:=100; Rasttemp5:=true; Rastnull5:=false; end
    else if rasttemp6=false then begin rasttemp6:=true; zeit3:=GetTickCount; end
    else if (Edit26.Text<>'0') or (Rastnull6=true) then begin Edit26.Text:='0'; Gauge6.Progress:=100; Rasttemp6:=true; Rastnull6:=false; end
    else if rasttemp7=false then begin rasttemp7:=true; zeit3:=GetTickCount; end
    else if (Edit27.Text<>'0') or (Rastnull7=true) then begin Edit27.Text:='0'; Gauge7.Progress:=100; Rasttemp7:=true; Rastnull7:=false; end
    else if rasttemp8=false then begin rasttemp8:=true; zeit3:=GetTickCount; end
    else if (Edit28.Text<>'0') or (Rastnull8=true) then begin Edit28.Text:='0'; Gauge8.Progress:=100; Rasttemp8:=true; Rastnull8:=false; end
    else if rasttemp9=false then begin rasttemp9:=true; zeit3:=GetTickCount; end
    else if (Edit29.Text<>'0') or (Rastnull9=true) then begin Edit29.Text:='0'; Gauge9.Progress:=100; Rasttemp9:=true; Rastnull9:=false; end
    else if rasttemp10=false then begin rasttemp10:=true; zeit3:=GetTickCount; end
    else if (Edit30.Text<>'0') or (Rastnull10=true) then begin Edit30.Text:='0'; Gauge10.Progress:=100; Rasttemp10:=true; Rastnull10:=false; end;
    restrastzeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
    if restrastzeit=0 then Form1.BitBtn3Click(Sender);
    if restrastzeit=0 then begin Form1.BitBtn3Click(Sender); Edit53.Text:='0'; Gauge11.Progress:=100; end else Timer2.Enabled:=true;
  end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  if (start=true) then
  begin
    if (CheckBox10.Checked=true) and (Edit20.Text='0') and (Rastnull10=false) then begin Edit30.Text:=Edit20.Text; Gauge10.Progress:=0; Rasttemp10:=false; Rastnull10:=true; end
    else if (CheckBox10.Checked=true) and (Gauge10.Progress<>0) then begin Edit30.Text:=Edit20.Text; Gauge10.Progress:=0; Rasttemp10:=false; end
    else if (CheckBox9.Checked=true) and (Edit18.Text='0') and (Rastnull9=false) then begin Edit29.Text:=Edit18.Text; Gauge9.Progress:=0; Rasttemp9:=false; Rastnull9:=true; CheckBox10.Color:=clBtnFace; end
    else if (CheckBox9.Checked=true) and (Gauge9.Progress<>0) then begin Edit29.Text:=Edit18.Text; Gauge9.Progress:=0; Rasttemp9:=false; CheckBox10.Color:=clBtnFace; end
    else if (CheckBox8.Checked=true) and (Edit16.Text='0') and (Rastnull8=false) then begin Edit28.Text:=Edit16.Text; Gauge8.Progress:=0; Rasttemp8:=false; Rastnull8:=true; CheckBox9.Color:=clBtnFace; end
    else if (CheckBox8.Checked=true) and (Gauge8.Progress<>0) then begin Edit28.Text:=Edit16.Text; Gauge8.Progress:=0; Rasttemp8:=false; CheckBox9.Color:=clBtnFace; end
    else if (CheckBox7.Checked=true) and (Edit14.Text='0') and (Rastnull7=false) then begin Edit27.Text:=Edit14.Text; Gauge7.Progress:=0; Rasttemp7:=false; Rastnull7:=true; CheckBox8.Color:=clBtnFace; end
    else if (CheckBox7.Checked=true) and (Gauge7.Progress<>0) then begin Edit27.Text:=Edit14.Text; Gauge7.Progress:=0; Rasttemp7:=false; CheckBox8.Color:=clBtnFace; end
    else if (CheckBox6.Checked=true) and (Edit12.Text='0') and (Rastnull6=false) then begin Edit26.Text:=Edit12.Text; Gauge6.Progress:=0; Rasttemp6:=false; Rastnull6:=true; CheckBox7.Color:=clBtnFace; end
    else if (CheckBox6.Checked=true) and (Gauge6.Progress<>0) then begin Edit26.Text:=Edit12.Text; Gauge6.Progress:=0; Rasttemp6:=false; CheckBox7.Color:=clBtnFace; end
    else if (CheckBox5.Checked=true) and (Edit10.Text='0') and (Rastnull5=false) then begin Edit25.Text:=Edit10.Text; Gauge5.Progress:=0; Rasttemp5:=false; Rastnull5:=true; CheckBox6.Color:=clBtnFace; end
    else if (CheckBox5.Checked=true) and (Gauge5.Progress<>0) then begin Edit25.Text:=Edit10.Text; Gauge5.Progress:=0; Rasttemp5:=false; CheckBox6.Color:=clBtnFace; end
    else if (CheckBox4.Checked=true) and (Edit8.Text='0') and (Rastnull4=false) then begin Edit24.Text:=Edit8.Text; Gauge4.Progress:=0; Rasttemp4:=false; Rastnull4:=true; CheckBox5.Color:=clBtnFace; end
    else if (CheckBox4.Checked=true) and (Gauge4.Progress<>0) then begin Edit24.Text:=Edit8.Text; Gauge4.Progress:=0; Rasttemp4:=false; CheckBox5.Color:=clBtnFace; end
    else if (CheckBox3.Checked=true) and (Edit6.Text='0') and (Rastnull3=false) then begin Edit23.Text:=Edit6.Text; Gauge3.Progress:=0; Rasttemp3:=false; Rastnull3:=true; CheckBox4.Color:=clBtnFace; end
    else if (CheckBox3.Checked=true) and (Gauge3.Progress<>0) then begin Edit23.Text:=Edit6.Text; Gauge3.Progress:=0; Rasttemp3:=false; CheckBox4.Color:=clBtnFace; end
    else if (CheckBox2.Checked=true) and (Edit4.Text='0') and (Rastnull2=false) then begin Edit22.Text:=Edit4.Text; Gauge2.Progress:=0; Rasttemp2:=false; Rastnull2:=true; CheckBox3.Color:=clBtnFace; end
    else if (CheckBox2.Checked=true) and (Gauge2.Progress<>0) then begin Edit22.Text:=Edit4.Text; Gauge2.Progress:=0; Rasttemp2:=false; CheckBox3.Color:=clBtnFace; end
    else if (CheckBox1.Checked=true) and (Edit2.Text='0') and (Rastnull1=false) then begin Edit21.Text:=Edit2.Text; Gauge1.Progress:=0; Rasttemp1:=false; Rastnull1:=true; CheckBox2.Color:=clBtnFace; end
    else if (CheckBox1.Checked=true) and (Gauge1.Progress<>0) then begin Edit21.Text:=Edit2.Text; Gauge1.Progress:=0; Rasttemp1:=false; CheckBox2.Color:=clBtnFace; end;
    Form1.Timer2Timer(Sender);
  end;
end;

procedure TForm1.TimerREinTimer(Sender: TObject);
begin
  Ruehrwerk:=RWert;
  Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-ein.bmp');
  Schalten(Form1);
  TimerREin.Enabled:=false;
  TimerRAus.Enabled:=true;
end;

procedure TForm1.TimerRAusTimer(Sender: TObject);
begin
  Ruehrwerk:=0;
  Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-aus.bmp');
  Schalten(Form1);
  TimerRAus.Enabled:=false;
  TimerREin.Enabled:=true;
end;

procedure TForm1.TimerHEinTimer(Sender: TObject);
begin
  Heizung:=HWert;
  Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-ein.bmp');
  Schalten(Form1);
  TimerHEin.Enabled:=false;
  TimerHAus.Enabled:=true;
end;

procedure TForm1.TimerHAusTimer(Sender: TObject);
begin
  Heizung:=0;
  Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-aus.bmp');
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  Schalten(Form1);
  TimerHAus.Enabled:=false;
  TimerHEin.Enabled:=true;
end;

procedure TForm1.TimerHSetTimer(Sender: TObject);
begin
  Deltatemp:=Solltemp-Tempfloat;
  if (TimerHEin.Interval=999) and (CheckBox37.Checked=true) then Deltatemp:=Deltatemp-Hysterese;
  if CheckBox36.Checked=true then GradientUebergabe:=GradientWert else GradientUebergabe:=999.9;
  if Deltatemp>TWert then
  begin
    if TimerHEin.Interval<>900 then
    begin
      TimerHEin.Interval:=900;   
      TimerHAus.Interval:=9999999;
      Form1.TimerHEinTimer(Sender);
    end;
  end
  else if (Deltatemp>0) and (Gradient<GradientUebergabe) then
  begin
    if CheckBox34.Checked=true then
    begin
      if TimerHEin.Interval<>AusIst*1000 then
      begin
        TimerHEin.Interval:=AusIst*1000;
        TimerHAus.Interval:=EinIst*1000;
        if TimerHEin.Interval=0 then begin TimerHEin.Interval:=800; TimerHAus.Interval:=9999999; end;
        if TimerHAus.Interval=0 then begin TimerHAus.Interval:=800; TimerHEin.Interval:=9999999; end;
        Form1.TimerHEinTimer(Sender);
      end;
    end
    else
    begin
      if TimerHEin.Interval<>900 then
      begin
        TimerHEin.Interval:=900;
        TimerHAus.Interval:=9999999;
        Form1.TimerHEinTimer(Sender);
      end;
    end;
  end
  else if (Deltatemp>0) and (Gradient>=GradientUebergabe) then
  begin
      if TimerHEin.Interval<>9999999 then
      begin
        TimerHEin.Interval:=9999999;
        TimerHAus.Interval:=900;
        Form1.TimerHAusTimer(Sender);
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
    //Timer2.Enabled:=true;
    end;
  end;
end;

procedure TForm1.TimerAAusTimer(Sender: TObject);
begin
  Alarm:=0;
  Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-aus.bmp');
  Schalten(Form1);
  TimerAAus.Enabled:=false;
  TimerAEin.Enabled:=true;
end;

procedure TForm1.TimerAEinTimer(Sender: TObject);
begin
  Alarm:=AWert;
  Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-ein.bmp');
  Schalten(Form1);
  TimerAEin.Enabled:=false;
  TimerAAus.Enabled:=true;
end;

procedure TForm1.MessageTimerTimer(Sender: TObject);
var
  buttonSelected, position:integer;
  rasttext, alarmspeicher:string;
begin
  if rast=1 then rasttext:=Edit63.Text
  else if rast=2 then rasttext:=Edit64.Text
  else if rast=3 then rasttext:=Edit65.Text
  else if rast=4 then rasttext:=Edit66.Text
  else if rast=5 then rasttext:=Edit67.Text
  else if rast=6 then rasttext:=Edit68.Text
  else if rast=7 then rasttext:=Edit69.Text
  else if rast=8 then rasttext:=Edit70.Text
  else if rast=9 then rasttext:=Edit71.Text
  else if rast=10 then rasttext:=Edit72.Text;
  if AlarmEin=true then
  begin
    Alarmspeicher:=button1.Caption;
    repeat
    begin
      Form1.TimerAEinTimer(Sender);
      MessageTimer.Enabled:=false;
      if length(rasttext)<50 then position:=350 else if length(rasttext)<70 then position:=265 else if length(rasttext)<90 then position:=180 else position:=100;
      if rasttext<>'' then rasttext:=#13 + rasttext + #13;
      if button1.Caption='Alarm pulsen' then buttonSelected:=MyMessageDlgPos('Rast wurde beendet !' +#13 + rasttext + #13 + '- OK um Brauvorgang fortzusetzen.', mtInformation, [mbOK, mbAbort], ['OK', 'Alarm still'], Form1.Left+Position, Form1.Top+250);
      if button1.Caption='Alarm still' then buttonSelected:=MyMessageDlgPos('Rast wurde beendet !' +#13 + rasttext + #13 + '- OK um Brauvorgang fortzusetzen.', mtInformation, [mbOK, mbAbort], ['OK', 'Alarm aktiv'], Form1.Left+Position, Form1.Top+250);
      if button1.Caption='Alarm aktiv' then buttonSelected:=MyMessageDlgPos('Rast wurde beendet !' +#13 + rasttext +#13 + '- OK um Brauvorgang fortzusetzen.', mtInformation, [mbOK, mbAbort], ['OK', 'Alarm pulsen'], Form1.Left+Position, Form1.Top+250);
      if buttonSelected = mrAbort then Form1.Button1Click(Sender);
    end;
    until buttonSelected = mrOK;
    repeat Form1.Button1Click(Sender) until button1.Caption=Alarmspeicher;
    AlarmEin:=false;
    MessageTimer.Enabled:=true;
    Form1.TimerAAusTimer(Sender);
    TimerAEin.Enabled:=false;
    TimerAAus.Enabled:=false;
  end;
end;

procedure TForm1.LogTimerTimer(Sender: TObject);
begin
  try
  Write(myLogFile, FormatDateTime('dd.mm.yyyy', now));
  Write(myLogFile, ';');
  Write(myLogFile, FormatDateTime('hh:nn:ss', now));
  Write(myLogFile, ';');
  if Heizung>0 then Write(myLogFile, '1;') else Write(myLogFile, '0;');
  if Ruehrwerk>0 then Write(myLogFile, '1;') else Write(myLogFile, '0;');
  if Pumpe>0 then Write(myLogFile, '1;') else Write(myLogFile, '0;');
  if AlarmEin=true then Write(myLogFile, '1;') else Write(myLogFile, '0;');
  DecimalSeparator:='.';
  Write(myLogFile, floattostr(tempfloat));
  Write(myLogFile, ';');
  Write(myLogFile, floattostr(solltemp));
  WriteLn(myLogFile, ';');
  except
  end;
end;

procedure TForm1.BitBtn12Click(Sender: TObject);
begin
  BitBtn15.Enabled:=false;
  BitBtn14.Enabled:=false;
  Button19.Caption:='Zoom out';
  Button24.Caption:='Zoom in';
  OpenDialog1.FileName:='';
  OpenDialog1.Filter:='Log-Datei|*.log|Alle Dateien|*.*';
  OpenDialog1.InitialDir:=pfad + 'log';
  if OpenDialog1.Execute then ReadTabFile(OpenDialog1.FileName, ';', StringGrid1);
  OpenDialog1.Filter:='Rezept-Datei|*.rzt|Alle Dateien|*.*';
  OpenDialog1.InitialDir:=pfad + 'Rezepte';
  startpunkt:=1;
  endpunkt:=StringGrid1.RowCount-1;
  writechart(Form1);
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  DecimalSeparator:='.';
  Button19.Enabled:=false;
  BitBtn15.Enabled:=false;
  BitBtn14.Enabled:=false;
  try
    if (start=true) and (CheckBox32.Checked=true) then
    begin
      DeleteFile(PChar(pfad + 'log\temp.log'));
      CopyFile(PChar(LogName),PChar(pfad + 'log\temp.log'),true);
      ReadTabFile(pfad + 'log\temp.log', ';', StringGrid1);
      if StringGrid1.RowCount>=2 then begin startpunkt:=1; endpunkt:=StringGrid1.RowCount-1; writechart(Form1); end;
      Progressbar1.Visible:=Gauge1.Visible;
      Progressbar2.Visible:=Gauge2.Visible;
      Progressbar3.Visible:=Gauge3.Visible;
      Progressbar4.Visible:=Gauge4.Visible;
      Progressbar5.Visible:=Gauge5.Visible;
      Progressbar6.Visible:=Gauge6.Visible;
      Progressbar7.Visible:=Gauge7.Visible;
      Progressbar8.Visible:=Gauge8.Visible;
      Progressbar9.Visible:=Gauge9.Visible;
      Progressbar10.Visible:=Gauge10.Visible;
      Label61.Visible:=true;
      Progressbar1.Position:=Gauge1.Progress;
      Progressbar2.Position:=Gauge2.Progress;
      Progressbar3.Position:=Gauge3.Progress;
      Progressbar4.Position:=Gauge4.Progress;
      Progressbar5.Position:=Gauge5.Progress;
      Progressbar6.Position:=Gauge6.Progress;
      Progressbar7.Position:=Gauge7.Progress;
      Progressbar8.Position:=Gauge8.Progress;
      Progressbar9.Position:=Gauge9.Progress;
      Progressbar10.Position:=Gauge10.Progress;
    end
    else
    begin
      if StringGrid1.RowCount<10 then ReadTabFile(pfad + 'log\Test-Log.log', ';', StringGrid1);
      startpunkt:=1;
      endpunkt:=StringGrid1.RowCount-1;
      writechart(Form1);
      Progressbar1.Visible:=false;
      Progressbar2.Visible:=false;
      Progressbar3.Visible:=false;
      Progressbar4.Visible:=false;
      Progressbar5.Visible:=false;
      Progressbar6.Visible:=false;
      Progressbar7.Visible:=false;
      Progressbar8.Visible:=false;
      Progressbar9.Visible:=false;
      Progressbar10.Visible:=false;
      Label61.Visible:=false;
    end;
    if StringGrid1.RowCount>=21 then Button24.Enabled:=true else Button24.Enabled:=false;
    webbrowser1.Navigate(pfad + 'Help\Help.html');
  except
  end;
  Form1.ComboBox1Change(Sender);
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
  if DeleteFile(pfad + 'Setup\settings.txt') then MessageDlgPos('Settings wurden überschrieben !', mtInformation, [mbOK], 0, Form1.Left+350, Form1.Top+250);
  speichern(Form1, pfad + 'Setup\settings.txt');
  settings_speichern(Form1, pfad + 'Setup\settings.txt');
  CloseFile(myFile);
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  Form1.PageControl1Change(Sender);
end;

procedure TForm1.BitBtn14Click(Sender: TObject);
begin
  spanne:=endpunkt-startpunkt;
  startpunkt:=startpunkt+round(spanne/2);
  endpunkt:=endpunkt+round(spanne/2);
  if StringGrid1.RowCount-1<endpunkt then begin startpunkt:=StringGrid1.RowCount-1-spanne; endpunkt:=StringGrid1.RowCount-1; end;
  if StringGrid1.RowCount-1=endpunkt then BitBtn14.Enabled:=false;
  if startpunkt>1 then BitBtn15.Enabled:=true else BitBtn15.Enabled:=false;
  writechart(Form1);
end;

procedure TForm1.BitBtn15Click(Sender: TObject);
begin
  spanne:=endpunkt-startpunkt;
  startpunkt:=startpunkt-round(spanne/2);
  endpunkt:=endpunkt-round(spanne/2);
  if startpunkt<=1 then begin endpunkt:=spanne+1; startpunkt:=1; end;
  if startpunkt<=1 then BitBtn15.Enabled:=false;
  if endpunkt<StringGrid1.RowCount-1 then BitBtn14.Enabled:=true else BitBtn14.Enabled:=false;
  writechart(Form1);
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  if Button20.Caption='Simulation Ein' then
  begin
    Button20.Caption:='Simulation Aus';
    SimulationTimer.Enabled:=true;
    Label66.Visible:=true;
    TrackBar1.Visible:=true;
    SimTemp:=21.0;
  end
  else
  begin
    Button20.Caption:='Simulation Ein';
    SimulationTimer.Enabled:=false;
    Label66.Visible:=false;
    TrackBar1.Visible:=false;
  end;
end;

procedure TForm1.SimulationTimerTimer(Sender: TObject);
begin
  try
    if FileExists(pfad+'Temperatur\' + tempdateiname) then else
    begin
      AssignFile(myFile, pfad+'Temperatur\' + tempdateiname);
      ReWrite(myFile);
      Writeln(myFile, '01-01-2000 00:00:00;21.0');
      CloseFile(myFile);
    end;
    SimTemp:=(1000-Trackbar1.Position)/10;
    AssignFile(SimFile, pfad + 'Temperatur\' + tempdateiname);
    Append(SimFile);
    Writeln(SimFile, 'Simulation;'+FloatToStrF(SimTemp,ffFixed,10,1));
    CloseFile(SimFile);
  except
  end;
end;

procedure editcheck(changededit: TEdit; min:integer; max:integer; fail:string);
begin
  try Intdummy:=strtoint(changededit.Text) except begin changededit.Text:=fail; ShowMessagePos('Unerlaubte Eingabe!', Form1.Left+350, Form1.Top+250); end; end;
  if (Intdummy>max) or (Intdummy<min) then begin changededit.Text:=fail; ShowMessagePos('Unerlaubte Eingabe!', Form1.Left+350, Form1.Top+250); end;
end;

procedure TForm1.Edit1Exit(Sender: TObject); begin editcheck(Edit1,0,100,'20'); end;
procedure TForm1.Edit2Exit(Sender: TObject); begin editcheck(Edit2,0,9999,'60'); end;
procedure TForm1.Edit3Exit(Sender: TObject); begin editcheck(Edit3,0,100,'20'); end;
procedure TForm1.Edit4Exit(Sender: TObject); begin editcheck(Edit4,0,9999,'60'); end;
procedure TForm1.Edit5Exit(Sender: TObject); begin editcheck(Edit5,0,100,'20'); end;
procedure TForm1.Edit6Exit(Sender: TObject); begin editcheck(Edit6,0,9999,'60'); end;
procedure TForm1.Edit7Exit(Sender: TObject); begin editcheck(Edit7,0,100,'20'); end;
procedure TForm1.Edit8Exit(Sender: TObject); begin editcheck(Edit8,0,9999,'60'); end;
procedure TForm1.Edit9Exit(Sender: TObject); begin editcheck(Edit9,0,100,'20'); end;
procedure TForm1.Edit10Exit(Sender: TObject); begin editcheck(Edit10,0,9999,'60'); end;
procedure TForm1.Edit11Exit(Sender: TObject); begin editcheck(Edit11,0,100,'20'); end;
procedure TForm1.Edit12Exit(Sender: TObject); begin editcheck(Edit12,0,9999,'60'); end;
procedure TForm1.Edit13Exit(Sender: TObject); begin editcheck(Edit13,0,100,'20'); end;
procedure TForm1.Edit14Exit(Sender: TObject); begin editcheck(Edit14,0,9999,'60'); end;
procedure TForm1.Edit15Exit(Sender: TObject); begin editcheck(Edit15,0,100,'20'); end;
procedure TForm1.Edit16Exit(Sender: TObject); begin editcheck(Edit16,0,9999,'60'); end;
procedure TForm1.Edit17Exit(Sender: TObject); begin editcheck(Edit17,0,100,'20'); end;
procedure TForm1.Edit18Exit(Sender: TObject); begin editcheck(Edit18,0,9999,'60'); end;
procedure TForm1.Edit19Exit(Sender: TObject); begin editcheck(Edit19,0,100,'20'); end;
procedure TForm1.Edit20Exit(Sender: TObject); begin editcheck(Edit20,0,9999,'60'); end;
procedure TForm1.Edit31Exit(Sender: TObject); begin editcheck(Edit31,0,9999,'60'); end;
procedure TForm1.Edit32Exit(Sender: TObject); begin editcheck(Edit32,0,9999,'60'); end;
procedure TForm1.Edit33Exit(Sender: TObject); begin editcheck(Edit33,0,9999,'60'); end;
procedure TForm1.Edit34Exit(Sender: TObject); begin editcheck(Edit34,0,9999,'60'); end;
procedure TForm1.Edit35Exit(Sender: TObject); begin editcheck(Edit35,0,9999,'60'); end;
procedure TForm1.Edit36Exit(Sender: TObject); begin editcheck(Edit36,0,9999,'60'); end;
procedure TForm1.Edit37Exit(Sender: TObject); begin editcheck(Edit37,0,9999,'60'); end;
procedure TForm1.Edit38Exit(Sender: TObject); begin editcheck(Edit38,0,9999,'60'); end;
procedure TForm1.Edit39Exit(Sender: TObject); begin editcheck(Edit39,0,9999,'60'); end;
procedure TForm1.Edit40Exit(Sender: TObject); begin editcheck(Edit40,0,9999,'60'); end;
procedure TForm1.Edit41Exit(Sender: TObject); begin editcheck(Edit41,0,9999,'60'); end;
procedure TForm1.Edit42Exit(Sender: TObject); begin editcheck(Edit42,0,9999,'60'); end;
procedure TForm1.Edit43Exit(Sender: TObject); begin editcheck(Edit43,0,9999,'60'); end;
procedure TForm1.Edit44Exit(Sender: TObject); begin editcheck(Edit44,0,9999,'60'); end;
procedure TForm1.Edit45Exit(Sender: TObject); begin editcheck(Edit45,0,9999,'60'); end;
procedure TForm1.Edit46Exit(Sender: TObject); begin editcheck(Edit46,0,9999,'60'); end;
procedure TForm1.Edit47Exit(Sender: TObject); begin editcheck(Edit47,0,9999,'60') ;end;
procedure TForm1.Edit48Exit(Sender: TObject); begin editcheck(Edit48,0,9999,'60'); end;
procedure TForm1.Edit49Exit(Sender: TObject); begin editcheck(Edit49,0,9999,'60'); end;
procedure TForm1.Edit50Exit(Sender: TObject); begin editcheck(Edit50,0,9999,'60'); end;

procedure TForm1.Button23Click(Sender: TObject);
begin
  If Button23.Caption='AutoUpdate Ein' then
  begin
    Button23.Caption:='AutoUpdate Aus';
    LogUpdateTimer.Enabled:=true;
  end
  else
  begin
    Button23.Caption:='AutoUpdate Ein';
    LogUpdateTimer.Enabled:=false;
  end;
end;

procedure TForm1.LogUpdateTimerTimer(Sender: TObject);
begin
  Form1.PageControl1Change(Sender);
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  spanne:=endpunkt-startpunkt;
  if (startpunkt>1) or (endpunkt<StringGrid1.RowCount-1) then
  begin
    startpunkt:=startpunkt-(round(spanne/2));
    endpunkt:=endpunkt+(round(spanne/2));
    if startpunkt<1 then begin endpunkt:=endpunkt-startpunkt; startpunkt:=1; end;
    if endpunkt>StringGrid1.RowCount-1 then begin startpunkt:=startpunkt-endpunkt+StringGrid1.RowCount-1; endpunkt:=StringGrid1.RowCount-1; end;
    if startpunkt<1 then startpunkt:=1;
    if endpunkt-startpunkt>20 then Button24.Enabled:=true;
    if (startpunkt=1) and (endpunkt=StringGrid1.RowCount-1) then begin Button19.Enabled:=false; BitBtn15.Enabled:=false; BitBtn14.Enabled:=false; end;
    writechart(Form1);
    if endpunkt<StringGrid1.RowCount-1 then BitBtn14.Enabled:=true else BitBtn14.Enabled:=false;
    if startpunkt>1 then BitBtn15.Enabled:=true else BitBtn15.Enabled:=false;
  end;
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  spanne:=endpunkt-startpunkt;
  if spanne>20 then
  begin
    BitBtn15.Enabled:=true;
    BitBtn14.Enabled:=true;
    startpunkt:=startpunkt+(round(spanne/4));
    endpunkt:=endpunkt-(round((spanne)/4));
    Button19.Enabled:=true;
    writechart(Form1);
    if endpunkt-startpunkt<20 then Button24.Enabled:=false;
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var buttonSelected:integer;
begin
  buttonSelected:=MessageDlgPos('Programm wirklich beenden?', mtWarning, [mbOK, mbAbort], 0, Form1.Left+350, Form1.Top+250);
  if buttonSelected = mrOK then
  begin
    LPTCode:=0;
    Ruehrwerk:=0;
    Heizung:=0;
    Alarm:=0;
    Pumpe:=0;
    Schalten(Form1);
    application.terminate;
  end
  else CanClose:=false;
end;

procedure TForm1.UeberwachungstimerTimer(Sender: TObject);
var buttonSelected:integer;
begin
  if (start=true) and (CheckBox33.Checked=true) and (SimulationTimer.enabled=false) then
  begin
    if TimeTempStore=TimeTempStr then
    begin
      buttonSelected:=MessageDlgPos('Seit min. 1 Minute kein neuer Temperaturmesswert', mtWarning, [mbOK, mbAbort], 0, Form1.Left+350, Form1.Top+250);
      if buttonSelected = mrAbort then CheckBox33.Checked:=false;
    end;
    TimeTempStore:=TimeTempStr;
  end;
end;

procedure TForm1.BitBtn13Click(Sender: TObject);
var RPage, RChart: TRect;
    ResX, ResY, Y: Integer;
begin
  if PrintDialog1.execute then
  begin
    Printer.Orientation := poPortrait;
    printer.BeginDoc;
    try
    printer.canvas.font.Name := 'Arial';
    // get physical page dimensions
    RPage := Rect( 0,0,GetDeviceCaps(Printer.handle, PHYSICALWIDTH),GetDeviceCaps(Printer.handle, PHYSICALHEIGHT));
    // get printer resolution, in dots per inch
    ResX := GetDeviceCaps(Printer.handle, LOGPIXELSX);
    ResY := GetDeviceCaps(Printer.handle, LOGPIXELSY);
    // Apply some margins
    RPage.Left := ResX div 2; // left margin 0,5 inch
    RPage.Right := RPage.Right - ResX div 2; // right margin 0.5 inch
    RPage.Top := ResX div 2; // top margin 0,5 inch
    RPage.Bottom := RPage.Bottom - ResY div 2; // bottom margin 0,5 inch
    // move to origin of printer coordinate system, which is the top left
    // corner of the printable area, not of the physical page
    OffsetRect(Rpage, GetDeviceCaps(Printer.handle, PHYSICALOFFSETY),GetDeviceCaps(Printer.handle, PHYSICALOFFSETY));
    // print a title for the page
    printer.canvas.font.Size := 18;
    printer.canvas.font.Style := [fsBold,fsUnderline];
    Y:= RPage.Top;
    printer.canvas.TextOut(RPage.Left+ResX div 4, Y, 'Dokumentation des Brauvorgangs vom '+StringGrid1.Cells[0,startpunkt]);
    Y:= Y + printer.canvas.TextHeight('Üy') +ResX div 4;
    // print the chart, assuming ResX = ResY here for simplicities sake
    // set up a rect that places the chart on the left half of the
    // page, with some gutter space between left and right half.
    // Hight of rect is calculated to preserve the aspect ratio of the
    // chart.
    RChart := Rect(RPage.Left, Y,(RPage.Right-RPage.Left-60) + RPage.Left, Y);
    RChart.Bottom := RChart.Top + Round( Chart1.Height / Chart1.Width * (RChart.Right-RChart.Left));
    Chart1.PrintPartialCanvas(Printer.canvas, RChart);
    // print second chart
    RChart.Top := RChart.Bottom + ResX div 10;
    RChart.Bottom := RChart.Top + Round( Chart2.Height / Chart2.Width * (RChart.Right-RChart.Left));
    Chart2.PrintPartialCanvas(Printer.canvas, RChart);
    // print third chart
    RChart.Top := RChart.Bottom + ResX div 10;
    RChart.Bottom := RChart.Top + Round( Chart3.Height / Chart3.Width * (RChart.Right-RChart.Left));
    Chart3.PrintPartialCanvas(Printer.canvas, RChart);
    // print fourth chart
    RChart.Top := RChart.Bottom + ResX div 10;
    RChart.Bottom := RChart.Top + Round( Chart4.Height / Chart4.Width * (RChart.Right-RChart.Left));
    Chart4.PrintPartialCanvas(Printer.canvas, RChart);
    // print fifth chart
    RChart.Top := RChart.Bottom + ResX div 10;
    RChart.Bottom := RChart.Top + Round( Chart5.Height / Chart5.Width * (RChart.Right-RChart.Left));
    Chart5.PrintPartialCanvas(Printer.canvas, RChart);
    // place a one line description below the chart
    printer.canvas.font.Size := 10;
    printer.canvas.font.Style := [];
    Y:= RChart.Bottom + ResY div 5;
    printer.canvas.TextOut(RChart.Left+ResX div 4, Y, 'Aufzeichnung vom '+StringGrid1.Cells[0,startpunkt]+', '+StringGrid1.Cells[1,startpunkt]+' bis '+StringGrid1.Cells[0,endpunkt-1]+', '+StringGrid1.Cells[1,endpunkt-1]);
    finally
    Printer.EndDoc;
  end;
end;
end;

procedure TForm1.USB_Update_TmrTimer(Sender: TObject);
begin
  if Steuerung<>'USB' then begin USB_Update_Tmr.Enabled:=false; exit; end;
  if usbtyp='Denkovi' then USB2Out else USBOut;
end;

procedure TForm1.Batch_Update_TmrTimer(Sender: TObject);
begin
  if Steuerung<>'Batch' then begin Batch_Update_Tmr.Enabled:=false; exit; end;
  BatchOut;
end;

procedure setupgeaendert;
begin
  setup_speichern(Form1, pfad+'Setup\setup.txt');
  Schalten(Form1);
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  if ComboBox2.Text='Denkovi' then
  begin
    ComboBox7.Visible:=false;
    ComboBox16.Visible:=true;
    Label76.Visible:=false;
    Label111.Visible:=true;
  end
  else
  begin
    ComboBox16.Visible:=false;
    ComboBox7.Visible:=true;
    Label111.Visible:=false;
    Label76.Visible:=true;
  end;
  setupgeaendert;
end;

procedure TForm1.ComboBox7Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox16Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox3Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox4Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox5Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox6Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox8Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox9Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox10Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox11Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox12Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.Edit54Exit(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.Edit55Exit(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.Edit56Exit(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.Edit57Exit(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.Edit58Exit(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.Edit59Exit(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.Edit60Exit(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.Edit61Exit(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.Edit62Exit(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox13Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox14Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox15Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox17Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox18Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox19Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox20Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox21Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox22Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox24Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox23Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox25Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.CheckBox35Click(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.ComboBox27Change(Sender: TObject); begin setupgeaendert; end;

procedure TForm1.ComboBox26Change(Sender: TObject); begin setupgeaendert; Hysterese:=strtofloat(Form1.ComboBox26.Text); end;
procedure TForm1.ComboBox29Change(Sender: TObject); begin setupgeaendert; Hysterese2:=strtofloat(Form1.ComboBox29.Text); end;

procedure TForm1.ComboBox30Change(Sender: TObject);
var i:integer;
    labelstr:string;
begin
  if ComboBox30.Text='Stunden' then
  begin
    for i:= 4 to 60 do
    begin
      if (FindComponent('Label' + IntToStr(i)) as TLabel).Caption = 'min.' then
      (FindComponent('Label' + IntToStr(i)) as TLabel).Caption := 'std.';
    end;
  end
  else
  begin
    for i:= 4 to 60 do
    begin
      if (FindComponent('Label' + IntToStr(i)) as TLabel).Caption = 'std.' then
      (FindComponent('Label' + IntToStr(i)) as TLabel).Caption := 'min.';
    end;
  end;
  Button31.Caption:='ETA';
  Form1.Button31Click(Sender);
  setupgeaendert;
end;

procedure TForm1.ComboBox32Change(Sender: TObject);
var i:integer;
    labelstr:string;
begin
  if ComboBox32.Text='Stunden' then
    for i:= 37 to 46 do (FindComponent('Label' + IntToStr(i)) as TLabel).Caption := 'std.'
  else if ComboBox32.Text='Minuten' then
    for i:= 37 to 46 do (FindComponent('Label' + IntToStr(i)) as TLabel).Caption := 'min.'
  else
    for i:= 37 to 46 do (FindComponent('Label' + IntToStr(i)) as TLabel).Caption := 'sek.';
  setupgeaendert;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.Text='USB' then
  begin
    GroupBox1.Visible:=false;
    GroupBox2.Visible:=true;
    GroupBox3.Visible:=false;
  end
  else if ComboBox1.Text='LPT' then
  begin
    GroupBox1.Visible:=false;
    GroupBox2.Visible:=false;
    GroupBox3.Visible:=true;
  end
  else
  begin
    GroupBox1.Visible:=true;
    GroupBox2.Visible:=false;
    GroupBox3.Visible:=false;
  end;
  setupgeaendert;
end;


procedure TForm1.Button26Click(Sender: TObject);
begin
  if ShellExecute(Application.Handle,'open',PChar(pfad+'Digitemp\Digitemp.bat'),nil,PChar(pfad+'Digitemp\'), SW_MINIMIZE) <= 32 then
  ShowMessagePos('Es ist ein Fehler beim ausführen von Digitemp aufgetreten', Form1.Left+350, Form1.Top+250) else ;
  sensorreset:=1;
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  if ShellExecute(Application.Handle,'open',PChar(pfad+'Digitemp\Digitemp_variabel.bat'),nil,PChar(pfad+'Digitemp\'), SW_SHOWNORMAL) <= 32 then
  ShowMessagePos('Es ist ein Fehler beim ausführen von Digitemp aufgetreten', Form1.Left+350, Form1.Top+250) else ;
  Sensorreset:=2;
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
  if ShellExecute(Application.Handle,'open',PChar(pfad+'Digitemp\Externe_Sensorsoftware.bat'),nil,PChar(pfad+'Digitemp\'), SW_MINIMIZE) <= 32 then
  ShowMessagePos('Es ist ein Fehler beim ausführen von Digitemp aufgetreten', Form1.Left+350, Form1.Top+250) else ;
  sensorreset:=3;
end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
  if sensorreset=1 then Form1.Button26Click(Sender);
  if sensorreset=2 then Form1.Button27Click(Sender);
  if sensorreset=3 then Form1.Button28Click(Sender);
end;

procedure TForm1.OpenDialog1Show(Sender: TObject);
begin
  TimerDlgMove.Enabled:=true;
end;

procedure TForm1.SaveDialog1Show(Sender: TObject);
begin
  TimerDlgMove.Enabled:=true;
end;

procedure TForm1.PrintDialog1Show(Sender: TObject);
begin
  TimerDlgMove.Enabled:=true;
end;

procedure TForm1.TimerDlgMoveTimer(Sender: TObject);
begin
  SetWindowPos(GetParent(OpenDialog1.Handle), 0, Form1.Left+200, Form1.Top+100, 0, 0, SWP_NOSIZE);
  SetWindowPos(GetParent(SaveDialog1.Handle), 0, Form1.Left+200, Form1.Top+100, 0, 0, SWP_NOSIZE);
  SetWindowPos(PrintDialog1.Handle, 0, Form1.Left+200, Form1.Top+100, 0, 0, SWP_NOSIZE);
  TimerDlgMove.Enabled:=false;
end;

procedure TForm1.Button29Click(Sender: TObject);
begin
   Button29.Visible:=false;
   Button30.Visible:=true;
   Panel8.Visible:=true;
   Panel10.Visible:=true;
end;

procedure TForm1.Button30Click(Sender: TObject);
begin
   CheckBox1.Caption:=Edit73.Text;
   CheckBox2.Caption:=Edit74.Text;
   CheckBox3.Caption:=Edit75.Text;
   CheckBox4.Caption:=Edit76.Text;
   CheckBox5.Caption:=Edit77.Text;
   CheckBox6.Caption:=Edit78.Text;
   CheckBox7.Caption:=Edit79.Text;
   CheckBox8.Caption:=Edit80.Text;
   CheckBox9.Caption:=Edit81.Text;
   CheckBox10.Caption:=Edit82.Text;
   Button29.Visible:=true;
   Button30.Visible:=false;
   Panel8.Visible:=false;
   Panel10.Visible:=false;
end;

procedure TForm1.CheckBox38Click(Sender: TObject);
begin
  if Checkbox38.Checked=true then
    begin
      Checkbox39.Checked:=false;
      Checkbox40.Checked:=false;
    end;
  setupgeaendert;
end;

procedure TForm1.CheckBox39Click(Sender: TObject);
begin
  if Checkbox39.Checked=true then
    begin
      Checkbox38.Checked:=false;
      Checkbox40.Checked:=false;
    end;
  setupgeaendert;
end;

procedure TForm1.CheckBox40Click(Sender: TObject);
begin
  if Checkbox40.Checked=true then
    begin
      Checkbox38.Checked:=false;
      Checkbox39.Checked:=false;
    end;
  setupgeaendert;
end;

procedure TForm1.StartTimerTimer(Sender: TObject);
begin
  if Checkbox38.Checked=true then Form1.Button26Click(Sender);
  if Checkbox39.Checked=true then Form1.Button27Click(Sender);
  if Checkbox40.Checked=true then Form1.Button28Click(Sender);
  StartTimer.Enabled:=false;
end;

procedure TForm1.Button31Click(Sender: TObject);
begin
  if (Button31.Caption='Gesamtrast') and (ComboBox30.Text='Stunden') then Button31.Caption:='ETA'
  else if (Button31.Caption='Gesamtrast') then Button31.Caption:='Gesamtheizzeit'
  else if Button31.Caption='Gesamtheizzeit' then Button31.Caption:='Gesamtprozeß'
  else if Button31.Caption='Gesamtprozeß' then Button31.Caption:='ETA'
  else if Button31.Caption='ETA' then Button31.Caption:='Gesamtrast';
  gesamtanzeigegeaendert;
  Form1.GesUpdateTimerTimer(Sender);
end;

procedure TForm1.GesUpdateTimerTimer(Sender: TObject);
var eta:extended;
    zeitfaktor,i:integer;
begin
  if Combobox30.Text='Minuten' then zeitfaktor:=1 else zeitfaktor:=60;
  restrastzeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
  gesrastzeit:=0;
  restrastgauge:=0;
  for i:= 1 to 10 do if (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Checked = true then
  begin
    gesrastzeit:=gesrastzeit+strtoint((FindComponent('Edit' + IntToStr(i*2)) as TEdit).Text);
    restrastgauge:=restrastgauge+(FindComponent('Gauge' + IntToStr(i)) as TGauge).Progress*strtoint((FindComponent('Edit' + IntToStr(i*2)) as TEdit).Text);
    if strtoint((FindComponent('Edit' + IntToStr(i*2-1)) as TEdit).Text)>maxsolltemp then maxsolltemp:=strtoint((FindComponent('Edit' + IntToStr(i*2-1)) as TEdit).Text);
  end;
  gesheizzeit:=round((maxsolltemp-StartTemp)/Aufheizrate);
  restheizzeit:=round((maxsolltemp-TempFloat)/Aufheizrate);
  if gesheizzeit<0 then gesheizzeit:=0;
  if restheizzeit<0 then restheizzeit:=0;
  if gesrastzeit>0 then restrastgauge:=round(restrastgauge/gesrastzeit-0.5) else restrastgauge:=100;
  gesprozesszeit:=gesheizzeit+gesrastzeit;
  restprozesszeit:=restheizzeit+restrastzeit;
  if gesheizzeit>0 then restheizgauge:=round((gesheizzeit-restheizzeit)/gesheizzeit*100) else restheizgauge:=100;
  if gesprozesszeit>0 then restprozessgauge:=round(((gesprozesszeit-restprozesszeit)/gesprozesszeit*100)-0.5) else restprozessgauge:=100;
  if start=true then
  begin
    if Button31.Caption='Gesamtrast' then
    begin
      Edit53.Text:=inttostr(restrastzeit);
      Gauge11.progress:=restrastgauge;
    end
    else if Button31.Caption='Gesamtheizzeit' then
    begin
      Edit53.Text:=inttostr(restheizzeit);
      Gauge11.progress:=restheizgauge;
    end
    else if Button31.Caption='Gesamtprozeß' then
    begin
      Edit53.Text:=inttostr(restprozesszeit);
      Gauge11.progress:=restprozessgauge;
    end
    else if Button31.Caption='ETA' then
    begin
      if Temperaturrast=1 then eta:=now+restprozesszeit/24/60*zeitfaktor else eta:=now+restrastzeit/24/60*zeitfaktor;
      Panel5.Caption:=FormatDateTime('dd.mm.yyyy hh:nn', eta);
    end;
  end;
end;

procedure TForm1.BitBtn16Click(Sender: TObject);
begin
  if Timerstartbatstatus=1 then Form2.CheckBox1.Checked:=true else Form2.CheckBox1.Checked:=false;
  if Timerstartbatstatus=2 then Form2.CheckBox2.Checked:=true else Form2.CheckBox2.Checked:=false;
  if Timerstartbatstatus=3 then Form2.CheckBox3.Checked:=true else Form2.CheckBox3.Checked:=false;
  Form2.Edit2.Text:=sensorverzoegerung;
  Form2.Top:=Form1.Top+250;
  Form2.Left:=Form1.Left+250;
  if Form2.Label5.Caption='false' then
  begin
    Form2.DateTimePicker1.Date:=now;
    Form2.DateTimePicker2.Time:=now;
  end;
  Form2.Visible:=true;
  Form1.Enabled:=false;
  TimerDialogTimer.Enabled:=true;
end;

procedure TForm1.TimerDialogTimerTimer(Sender: TObject);
begin
  if Form2.Visible=false then
  begin
    Timerstartbatstatus:=0;
    if Form2.CheckBox1.Checked=true then Timerstartbatstatus:=1;
    if Form2.CheckBox2.Checked=true then Timerstartbatstatus:=2;
    if Form2.CheckBox3.Checked=true then Timerstartbatstatus:=3;
    sensorverzoegerung:=Form2.Edit2.Text;
    TimerDialogTimer.Enabled:=false;
    Form1.Enabled:=true;
    If Form2.Label5.Caption='true' then
    begin
      BitBtn1.Enabled:=false;
      BitBtn2.Enabled:=false;
      Graphic:=pfad + 'Graphics\Automatik-timer.bmp';
      Image5.Picture.LoadFromFile(Graphic);
      TimerTimer.Enabled:=true;
    end
    else
    begin
      Form1.BitBtn3Click(Sender);
    end;
  end;
end;

procedure TForm1.TimerTimerTimer(Sender: TObject);
begin
  Form2.DateTimePicker2.Date:=now;
  if (Form2.DateTimePicker1.Date<=now) and (Form2.DateTimePicker2.Time<=now) then
  begin
    if Form2.Checkbox1.Checked=true then Form1.Button26Click(Sender);
    if Form2.Checkbox2.Checked=true then Form1.Button27Click(Sender);
    if Form2.Checkbox3.Checked=true then Form1.Button28Click(Sender);
    Timer3.Interval:=strtoint(Form2.Edit2.Text)*1000;
    Timer3.Enabled:=true;
    TimerTimer.Enabled:=false;
  end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  BitBtn3Click(Sender);
  BitBtn1Click(Sender);
  Timer3.Enabled:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Button1.Caption='Alarm pulsen' then
  begin
    Button1.Caption:='Alarm still';
    TimerAEin.Interval:=9999999;
    TimerAAus.Interval:=1;
  end
  else if Button1.Caption='Alarm still' then
  begin
    Button1.Caption:='Alarm aktiv';
    TimerAEin.Interval:=1;
    TimerAAus.Interval:=9999999;
  end
  else if Button1.Caption='Alarm aktiv' then
  begin
    Button1.Caption:='Alarm pulsen';
    TimerAEin.Interval:=4000;
    TimerAAus.Interval:=1000;
  end;
end;

procedure TForm1.ComboBox28Change(Sender: TObject);
var s2: TAreaSeries;
begin
  s2 := Form1.series5;
  if ComboBox28.Text='Heizung, Rührwerk, Kühlung, Alarm' then
  begin
    Relais4:='Kühlung';
    s2.Title:='Kühlung     ';
  end
  else
  begin
    Relais4:='Pumpe';
    s2.Title:='Pumpe       ';
  end;
  if Pumpe=0 then
  begin
    Image4.Picture.LoadFromFile(pfad + 'Graphics\'+Relais4+'-Aus.bmp');
    Button10.Caption:=Relais4+' Ein';
  end
  else
  begin
    Image4.Picture.LoadFromFile(pfad + 'Graphics\'+Relais4+'-Ein.bmp');
    Button10.Caption:=Relais4+' Aus';
  end;
  Label69.Caption:=Relais4+' Ein:';
  Label70.Caption:=Relais4+' Aus:';
  Label78.Caption:=Relais4+' Relais:';
  Label83.Caption:=Relais4+' Relais:';
  setupgeaendert;
end;

procedure TForm1.ComboBox31Change(Sender: TObject);
begin
  if ComboBox31.Text='Bei Rasttemperaturüberschreitung' then
  begin
    Temperaturrast:=1;
    Panel15.Visible:=false;
    Panel3.Enabled:=true;
  end
  else if ComboBox31.Text='Bei Rasttemperaturunterschreitung' then
  begin
    Temperaturrast:=2;
    Panel15.Visible:=false;
    Panel3.Enabled:=false;
  end
  else if ComboBox31.Text='Rastspezifisch' then
  begin
    Temperaturrast:=3;
    Panel15.Visible:=true;
    Panel3.Enabled:=false;
  end
  else
  begin
    Temperaturrast:=0;
    Panel15.Visible:=false;
    Panel3.Enabled:=false;
  end;
  Button31.Caption:='ETA';
  Form1.Button31Click(Sender);
  setupgeaendert;
end;

procedure TForm1.TimerKSetTimer(Sender: TObject);
begin
  Deltatemp2:=Tempfloat-Solltemp;
  if (TimerKEin.Interval=999) and (CheckBox37.Checked=true) then Deltatemp2:=Deltatemp2-Hysterese2;
  if Deltatemp2<=0 then
  begin
    if TimerKEin.Interval<>999 then
    begin
      TimerKEin.Interval:=999;
      TimerKAus.Interval:=999;
      Form1.TimerKAusTimer(Sender);
      TimerKEin.Enabled:=false;
      //Timer2.Enabled:=true;
    end;
  end
  else if Deltatemp2<TWert then
  begin
    if TimerKEin.Interval<>900 then
    begin
      TimerKEin.Interval:=900;
      TimerKAus.Interval:=9999999;
      Form1.TimerKEinTimer(Sender);
    end;
  end
  else
  begin
    if TimerKEin.Interval<>900 then
    begin
      TimerKEin.Interval:=900;
      TimerKAus.Interval:=9999999;
      Form1.TimerKEinTimer(Sender);
    end;
  end;
end;

procedure TForm1.TimerKEinTimer(Sender: TObject);
begin
  Pumpe:=PWert;
  Image4.Picture.LoadFromFile(pfad + 'Graphics\Kühlung-ein.bmp');
  Schalten(Form1);
  TimerKEin.Enabled:=false;
  TimerKAus.Enabled:=true;
end;

procedure TForm1.TimerKAusTimer(Sender: TObject);
begin
  Pumpe:=0;
  Image4.Picture.LoadFromFile(pfad + 'Graphics\Kühlung-aus.bmp');
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
  Schalten(Form1);
  TimerKAus.Enabled:=false;
  TimerKEin.Enabled:=true;
end;



procedure TForm1.ComboBox33Change(Sender: TObject);
begin
  if ComboBox33.Text='30 Sekunden' then
  begin
    LogTimer.Interval:=30000;
  end
  else if ComboBox33.Text='1 Minute' then
  begin
    LogTimer.Interval:=60000;
  end
  else if ComboBox33.Text='5 Minuten' then
  begin
    LogTimer.Interval:=500000;
  end
  else
  begin
    LogTimer.Interval:=5000;
  end;
  setupgeaendert;
end;

procedure TForm1.CheckBox31Click(Sender: TObject);
begin
  if CheckBox31.Checked=true then
  begin
    Panel14.Visible:=true;
    ShowMessagePos('    Im normalen Maischeprozeß sind hier keine Änderungen erforderlich !!!    ', Form1.Left+30, Form1.Top+450);
  end
  else
  Panel14.Visible:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  buttonSelected, position:integer;
begin
  buttonSelected:=MessageDlgPos('Einstellungen auf Standardeinstellungen zurücksetzen?', mtWarning, [mbOK, mbAbort], 0, Form1.Left+350, Form1.Top+250);
  if buttonSelected = mrOK then
  begin
    setup_laden(Form1, pfad+'Setup\Standard_Setup.txt');
    Form1.PageControl1Change(Sender);
    CheckBox31.Checked:=false;
    Form1.CheckBox31Click(Sender);
  end;
end;

procedure TForm1.ApplicationEvents1ShowHint(var HintStr: String;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  HintInfo.HideTimeout:=Length(HintStr)*50;
end;


end.






