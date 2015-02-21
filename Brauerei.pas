unit Brauerei;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, Menus, ExtCtrls, jpeg, TeeProcs, TeEngine,
  Chart, DbChart, ComCtrls, Grids, Series, OleCtrls, SHDocVw, ShellApi,
  Printers,synaser;

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
    Panel4: TPanel;
    Label63: TLabel;
    Label64: TLabel;
    Button18: TButton;
    Button19: TButton;
    Button21: TButton;
    Button22: TButton;
    Button20: TButton;
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
    Button25: TButton;
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
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    ComboBox19: TComboBox;
    ComboBox20: TComboBox;
    ComboBox21: TComboBox;
    ComboBox22: TComboBox;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    ComboBox23: TComboBox;
    ComboBox24: TComboBox;
    Label107: TLabel;
    Label108: TLabel;
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
    Label112: TLabel;
    ComboBox26: TComboBox;
    Label113: TLabel;
    Label114: TLabel;
    Edit62: TEdit;
    TimerDlgMove: TTimer;
    Edit63: TEdit;
    Edit64: TEdit;
    Edit65: TEdit;
    Edit66: TEdit;
    Edit67: TEdit;
    Edit68: TEdit;
    Edit69: TEdit;
    Edit70: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Button29: TButton;
    Button30: TButton;
    Label115: TLabel;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    StartTimer: TTimer;
    Edit73: TEdit;
    Edit74: TEdit;
    Edit75: TEdit;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit78: TEdit;
    Edit79: TEdit;
    Edit80: TEdit;
    Edit81: TEdit;
    Edit82: TEdit;
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
    procedure Button25Click(Sender: TObject);
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
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  sl,sl2: TStringList;
  Temperatur,x,Graphic,LogName,Steuerung,BHEin,BHAus,BREin,BRAus,BPEin,BPAus,
  BAEin,BAAus,TimeTempStr,TimeTempStore,USBPort,USBTyp,pfad, tempdateiname: String;
  Tempfloat,Solltemp,Deltatemp,SimTemp,TWert,Gradient, GradientWert,
  GradientUebergabe, Hysterese: Extended;
  Ruehrwerk,Heizung,Alarm,Pumpe,HWert,RWert,PWert,AWert,RStore,PStore,HStore,
  AStore,LPTCode,zeit,zeit2,zeit3,zeitpause,fortschritt,rast,Intdummy,
  CountLines,gesfortschritt,rastzahl, startpunkt,endpunkt,y,Ein60,Aus60,Ein70,
  Aus70,Ein80,Aus80,Ein90,Aus90,Ein100,Aus100,EinIst,AusIst,USBHIntWert,
  USBRIntWert,USBPIntWert,USBAIntWert,DeviceIndex,sensorreset: integer;
  LPTPort: word;
  myFile,myLogFile,SimFile,mySetup,myDisplay: TextFile;
  pause,start,stop,AlarmEin,Rasttemp1,Rasttemp2,Rasttemp3,Rasttemp4,Rasttemp5,
  Rasttemp6,Rasttemp7,Rasttemp8,Rasttemp9,Rasttemp10,Rastnull1,Rastnull2,
  Rastnull3,Rastnull4,Rastnull5,Rastnull6,Rastnull7,Rastnull8,Rastnull9,
  Rastnull10,Rastende,PauseLogTimerHEin,PauseLogTimerHAus,PauseLogTimerHSet,
  PauseLogTimerREin,PauseLogTimerRAus: boolean;
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

procedure TForm1.Button7Click(Sender: TObject);
begin
   Button1.Visible:=false;         // Alle Bedieneinheiten für den Automodus einschalten
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
   Button29.Visible:=false;
   Button30.Visible:=false;
   Edit63.Visible:=false;
   Edit64.Visible:=false;
   Edit65.Visible:=false;
   Edit66.Visible:=false;
   Edit67.Visible:=false;
   Edit68.Visible:=false;
   Edit69.Visible:=false;
   Edit70.Visible:=false;
   Edit71.Visible:=false;
   Edit72.Visible:=false;
   Label1.Visible:=true;
   Label3.Visible:=true;
   Label23.Visible:=true;
   Label36.Visible:=true;
   Label115.Visible:=false;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   Button1.Visible:=true;          // Alle Bedieneinheiten für den Manuellmodus einschalten
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
   if (start=false) or ((CheckBox10.Checked=true) and (Edit20.Text<>'0')) then begin Gauge10.Visible:=true; Edit30.Visible:=true; Label35.Visible:=true; end;    // Gauge und Edit einschalten wenn Automodus nicht gestartet oder Rast aktiv
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
   Button29.Visible:=true;
   Label115.Visible:=false;
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
end;

procedure settings_speichern(Form:TForm1; filename:string);
begin
  WriteLn(myFile, Form.CheckBox31.Checked);        // zusätzliche Settingsdate speichern (nur mit Rezeptdaten)
  WriteLn(myFile, Form.CheckBox32.Checked);
  WriteLn(myFile, Form.CheckBox33.Checked);
  WriteLn(myFile, Form.CheckBox34.Checked);
  WriteLn(myFile, Form.CheckBox36.Checked);
  WriteLn(myFile, Form.CheckBox37.Checked);
end;

procedure laden(Form:TForm1; filename:string);
begin
  AssignFile(myFile, filename);                          // Rezeptdaten laden
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
  try ReadLn(myFile, x); Form.Edit63.Text:=x; except Form.Edit63.Text:='' end;
  try ReadLn(myFile, x); Form.Edit64.Text:=x; except Form.Edit64.Text:='' end;
  try ReadLn(myFile, x); Form.Edit65.Text:=x; except Form.Edit65.Text:='' end;
  try ReadLn(myFile, x); Form.Edit66.Text:=x; except Form.Edit66.Text:='' end;
  try ReadLn(myFile, x); Form.Edit67.Text:=x; except Form.Edit67.Text:='' end;
  try ReadLn(myFile, x); Form.Edit68.Text:=x; except Form.Edit68.Text:='' end;
  try ReadLn(myFile, x); Form.Edit69.Text:=x; except Form.Edit69.Text:='' end;
  try ReadLn(myFile, x); Form.Edit70.Text:=x; except Form.Edit70.Text:='' end;
  try ReadLn(myFile, x); Form.Edit71.Text:=x; except Form.Edit71.Text:='' end;
  try ReadLn(myFile, x); Form.Edit72.Text:=x; except Form.Edit72.Text:='' end;
  try ReadLn(myFile, x); except x:='Rast 1'; end;
  if x='' then x:='Rast 1'; Form.Edit73.Text:=x; Form.CheckBox1.Caption:=x;
  try ReadLn(myFile, x); except x:='Rast 2'; end;
  if x='' then x:='Rast 2'; Form.Edit74.Text:=x; Form.CheckBox2.Caption:=x;
  try ReadLn(myFile, x); except x:='Rast 3'; end;
  if x='' then x:='Rast 3'; Form.Edit75.Text:=x; Form.CheckBox3.Caption:=x;
  try ReadLn(myFile, x); except x:='Rast 4'; end;
  if x='' then x:='Rast 4'; Form.Edit76.Text:=x; Form.CheckBox4.Caption:=x;
  try ReadLn(myFile, x); except x:='Rast 5'; end;
  if x='' then x:='Rast 5'; Form.Edit77.Text:=x; Form.CheckBox5.Caption:=x;
  try ReadLn(myFile, x); except x:='Rast 6'; end;
  if x='' then x:='Rast 6'; Form.Edit78.Text:=x; Form.CheckBox6.Caption:=x;
  try ReadLn(myFile, x); except x:='Rast 7'; end;
  if x='' then x:='Rast 7'; Form.Edit79.Text:=x; Form.CheckBox7.Caption:=x;
  try ReadLn(myFile, x); except x:='Rast 8'; end;
  if x='' then x:='Rast 8'; Form.Edit80.Text:=x; Form.CheckBox8.Caption:=x;
  try ReadLn(myFile, x); except x:='Rast 9'; end;
  if x='' then x:='Rast 9'; Form.Edit81.Text:=x; Form.CheckBox9.Caption:=x;
  try ReadLn(myFile, x); except x:='Rast 10'; end;
  if x='' then x:='Rast 10'; Form.Edit82.Text:=x; Form.CheckBox10.Caption:=x;
end;

procedure settings_laden(Form:TForm1; filename:string);
begin
  ReadLn(myFile, x); Form.CheckBox31.Checked:=strtobool(x);    // zusätzliche Settingsdate laden (nur mit Rezeptdaten)
  ReadLn(myFile, x); Form.CheckBox32.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox33.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox34.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox36.Checked:=strtobool(x);
  ReadLn(myFile, x); Form.CheckBox37.Checked:=strtobool(x);
end;

procedure setup_speichern(Form:TForm1);
var dummyfilename:string;
begin
  AssignFile(mySetup, pfad+'Setup\setup.txt');                // Setup speichern
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
  WriteLn(mySetup,'Schalthysterese;'+Form.ComboBox26.Text);
  if Form.CheckBox35.Checked=true then WriteLn(mySetup,'Batchwiederholung;1') else WriteLn(mySetup,'Batchwiederholung;0');
  dummyfilename:=stringreplace(Form.Edit62.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Temperatur-Textdatei;'+dummyfilename);
  if Form.CheckBox38.Checked=true then WriteLn(mySetup,'Autostart Digitemp.bat;1') else WriteLn(mySetup,'Autostart Digitemp.bat;0');
  if Form.CheckBox39.Checked=true then WriteLn(mySetup,'Autostart Digitemp_variabel.bat;1') else WriteLn(mySetup,'Autostart Digitemp_variabel.bat;0');
  if Form.CheckBox40.Checked=true then WriteLn(mySetup,'Autostart Externe_Sensorsoftware.bat;1') else WriteLn(mySetup,'Autostart Externe_Sensorsoftware.bat;0');
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
  If Steuerung='USB' then Form1.USB_Update_Tmr.Enabled:=true else Form1.USB_Update_Tmr.Enabled:=true;
  If Steuerung='BATCH' then Form1.Batch_Update_Tmr.Enabled:=true else Form1.Batch_Update_Tmr.Enabled:=true;
end;

procedure setup_laden(Form:TForm1);
var dummyfilename:string;
begin
  try
    sl:=TStringList.Create; //Objekt erzeugen
    sl.LoadFromFile(pfad+'Setup\Setup.txt');  //Datei in Stringliste laden
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
    Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-ein.jpg');
  end
  else
  begin
    Button8.Caption:='Rührwerk Ein';
    Ruehrwerk:=0;
    Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-aus.jpg');
  end;
  Schalten(Form1);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if Button9.Caption='Heizung Ein' then
  begin
    Button9.Caption:='Heizung Aus';
    Heizung:=HWert;
    Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-ein.jpg');
  end
  else
  begin
    Button9.Caption:='Heizung Ein';
    Heizung:=0;
    Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-aus.jpg');
  end;
  Schalten(Form1);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  if Button10.Caption='Pumpe Ein' then
  begin
    Button10.Caption:='Pumpe Aus';
    Pumpe:=PWert;
    Image4.Picture.LoadFromFile(pfad + 'Graphics\Pumpe-ein.jpg');
  end
  else
  begin
    Button10.Caption:='Pumpe Ein';
    Pumpe:=0;
    Image4.Picture.LoadFromFile(pfad + 'Graphics\Pumpe-aus.jpg');
  end;
  Schalten(Form1);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  if Button11.Caption='Alarm Ein' then
  begin
    Button11.Caption:='Alarm Aus';
    Alarm:=AWert;
    Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-ein.jpg')
  end
  else
  begin
    Button11.Caption:='Alarm Ein';
    Alarm:=0;
    Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-aus.jpg');
  end;
  Schalten(Form1);
end;

procedure TForm1.Timer1Timer(Sender: TObject);            // Timer für Temperaturmessung
var
  tf:extended;
  tfs:string;
  sl3:TStringList;
  TempFile:textfile;
  ZeilenAnzahl:integer;
begin
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
      ZeilenAnzahl := ZeilenAnzahl + 1;
      readln (TempFile, TimeTempStr);
    end;
    CloseFile(TempFile);
  except
    exit;
  end;
  sl3:=TStringList.Create;
  sl3.Delimiter:=';';
  sl3.DelimitedText:=TimeTempStr;
  tfs:=sl3[sl3.Count-1];
  Temperatur:=tfs+' °C';
  Tempfloat:=strtofloat(tfs);
  tf:=strtofloat(tfs);
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
  setup_laden(Form1);
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
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if DeleteFile(SaveDialog1.FileName) then MessageDlgPos('Rezept wurde überschrieben !', mtInformation, [mbOK], 0, Form1.Left+350, Form1.Top+250);
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
  Form1.Button30Click(Sender);
  if start=false then
  begin
    if pause=false then
    begin
      PauseLogTimerHEin:=false;
      PauseLogTimerHAus:=false;
      PauseLogTimerHSet:=false;
      PauseLogTimerREin:=false;
      PauseLogTimerRAus:=false;
      Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-aus.jpg');
      Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-aus.jpg');
      Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-aus.jpg');
      Schalten(Form1);
      if checkbox32.Checked=true then
      begin
        LogName:=FormatDateTime('ddmmyyyyhhnnss', now);
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
    else
    begin
      zeit3:=zeit3-zeitpause+GetTickCount;
      if PauseLogTimerHEin=true then begin PauseLogTimerHEin:=false; TimerHEin.Enabled:=true; end;
      if PauseLogTimerHAus=true then begin PauseLogTimerHAus:=false; TimerHAus.Enabled:=true; end;
      if PauseLogTimerHSet=true then begin PauseLogTimerHSet:=false; TimerHSet.Enabled:=true; end;
      if PauseLogTimerREin=true then begin PauseLogTimerREin:=false; Form1.TimerREinTimer(Sender); end;
      if PauseLogTimerRAus=true then begin PauseLogTimerRAus:=false; Form1.TimerRAusTimer(Sender); end;
    end;
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
      Button20.Enabled:=false;
      TabSheet4.TabVisible:=false;
      if checkbox32.checked=true then Button18.Enabled:=true;
      if checkbox32.checked=true then Button23.Enabled:=true;
      Graphic:=pfad + 'Graphics\Automatik-aktiv.jpg';
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
  DecimalSeparator:='.';
  if AlarmEin=true then
  else if (Edit21.Text<>'0') or (Rastnull1=true) then
  begin
    if Rasttemp1=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=100+strtoint(Edit41.Text)*1000; TimerRAus.Interval:=100+strtoint(Edit31.Text)*1000;
      if CheckBox21.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit1.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit1.Text)) or (Rasttemp1=true) then Rasttemp1:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit2.Text)*60000;
    if (start=true) and (Rasttemp1=true) then Edit21.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull1=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge1.Progress:=fortschritt;
    rast:=1;
    if rasttemp1=true then rastnull1:=false;
    if (Edit21.Text='0') and (CheckBox11.Checked=true) and (rastnull1=false) then AlarmEin:=true;
  end
  else if (Edit22.Text<>'0') or (Rastnull2=true) then
  begin
    if Rasttemp2=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=100+strtoint(Edit42.Text)*1000; TimerRAus.Interval:=100+strtoint(Edit32.Text)*1000;
      if CheckBox22.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit3.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit3.Text)) or (Rasttemp2=true) then Rasttemp2:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit4.Text)*60000;
    if (start=true) and (Rasttemp2=true) then Edit22.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull2=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge2.Progress:=fortschritt;
    rast:=2;
    if rasttemp2=true then rastnull2:=false;
    if (Edit22.Text='0') and (CheckBox12.Checked=true) and (rastnull2=false) then AlarmEin:=true;
  end
  else if (Edit23.Text<>'0') or (Rastnull3=true) then
  begin
    if Rasttemp3=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=100+strtoint(Edit43.Text)*1000; TimerRAus.Interval:=100+strtoint(Edit33.Text)*1000;
      if CheckBox23.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit5.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit5.Text)) or (Rasttemp3=true) then Rasttemp3:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit6.Text)*60000;
    if (start=true) and (Rasttemp3=true) then Edit23.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull3=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge3.Progress:=fortschritt;
    rast:=3;
    if rasttemp3=true then rastnull3:=false;
    if (Edit23.Text='0') and (CheckBox13.Checked=true) and (rastnull3=false) then AlarmEin:=true;
  end
  else if (Edit24.Text<>'0') or (Rastnull4=true) then
  begin
    if Rasttemp4=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=100+strtoint(Edit44.Text)*1000; TimerRAus.Interval:=100+strtoint(Edit34.Text)*1000;
      if CheckBox24.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit7.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit7.Text)) or (Rasttemp4=true) then Rasttemp4:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit8.Text)*60000;
    if (start=true) and (Rasttemp4=true) then Edit24.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull4=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge4.Progress:=fortschritt;
    rast:=4;
    if rasttemp4=true then rastnull4:=false;
    if (Edit24.Text='0') and (CheckBox14.Checked=true) and (rastnull4=false) then AlarmEin:=true;
  end
  else if (Edit25.Text<>'0') or (Rastnull5=true) then
  begin
    if Rasttemp5=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=100+strtoint(Edit45.Text)*1000; TimerRAus.Interval:=100+strtoint(Edit35.Text)*1000;
      if CheckBox25.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit9.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit9.Text)) or (Rasttemp5=true) then Rasttemp5:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit10.Text)*60000;
    if (start=true) and (Rasttemp5=true) then Edit25.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull5=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge5.Progress:=fortschritt;
    rast:=5;
    if rasttemp5=true then rastnull5:=false;
    if (Edit25.Text='0') and (CheckBox15.Checked=true) and (rastnull5=false) then AlarmEin:=true;
  end
  else if (Edit26.Text<>'0') or (Rastnull6=true) then
  begin
    if Rasttemp6=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=100+strtoint(Edit46.Text)*1000; TimerRAus.Interval:=100+strtoint(Edit36.Text)*1000;
      if CheckBox26.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit11.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit11.Text)) or (Rasttemp6=true) then Rasttemp6:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit12.Text)*60000;
    if (start=true) and (Rasttemp6=true) then Edit26.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull6=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge6.Progress:=fortschritt;
    rast:=6;
    if rasttemp6=true then rastnull6:=false;
    if (Edit26.Text='0') and (CheckBox16.Checked=true) and (rastnull6=false) then AlarmEin:=true;
  end
  else if (Edit27.Text<>'0') or (Rastnull7=true) then
  begin
    if Rasttemp7=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=100+strtoint(Edit47.Text)*1000; TimerRAus.Interval:=100+strtoint(Edit37.Text)*1000;
      if CheckBox27.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit13.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit13.Text)) or (Rasttemp7=true) then Rasttemp7:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit14.Text)*60000;
    if (start=true) and (Rasttemp7=true) then Edit27.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull7=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge7.Progress:=fortschritt;
    rast:=7;
    if rasttemp7=true then rastnull7:=false;
    if (Edit27.Text='0') and (CheckBox17.Checked=true) and (rastnull7=false) then AlarmEin:=true;
  end
  else if (Edit28.Text<>'0') or (Rastnull8=true) then
  begin
    if Rasttemp8=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=100+strtoint(Edit48.Text)*1000; TimerRAus.Interval:=100+strtoint(Edit38.Text)*1000;
      if CheckBox28.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit15.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit15.Text)) or (Rasttemp8=true) then Rasttemp8:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit16.Text)*60000;
    if (start=true) and (Rasttemp8=true) then Edit28.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull8=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge8.Progress:=fortschritt;
    rast:=8;
    if rasttemp8=true then rastnull8:=false;
    if (Edit28.Text='0') and (CheckBox18.Checked=true) and (rastnull8=false) then AlarmEin:=true;
  end
  else if (Edit29.Text<>'0') or (Rastnull9=true) then
  begin
    if Rasttemp9=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=100+strtoint(Edit49.Text)*1000; TimerRAus.Interval:=100+strtoint(Edit39.Text)*1000;
      if CheckBox29.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit17.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit17.Text)) or (Rasttemp9=true) then Rasttemp9:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit18.Text)*60000;
    if (start=true) and (Rasttemp9=true) then Edit29.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull9=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge9.Progress:=fortschritt;
    rast:=9;
    if rasttemp9=true then rastnull9:=false;
    if (Edit29.Text='0') and (CheckBox19.Checked=true) and (rastnull9=false) then AlarmEin:=true;
  end
  else if (Edit30.Text<>'0') or (Rastnull10=true) then
  begin
    if Rasttemp10=false then
    begin
      zeit3:=GetTickCount;
      TimerREin.Interval:=100+strtoint(Edit50.Text)*1000; TimerRAus.Interval:=100+strtoint(Edit40.Text)*1000;
      if CheckBox30.Checked=true then Form1.TimerREinTimer(Sender) else begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
      Solltemp:=strtoint(Edit19.Text);
    end;
    zeit:=GetTickCount-zeit3;
    if (TempFloat>=strtoint(Edit19.Text)) or (Rasttemp10=true) then Rasttemp10:=true else Timer2.Enabled:=false;
    zeit2:=strtoint(Edit20.Text)*60000;
    if (start=true) and (Rasttemp10=true) then Edit30.Text:=inttostr(round((zeit2-zeit+29999)/60000));
    if Rastnull10=false then fortschritt:=round(zeit/zeit2*100) else fortschritt:=0;
    Gauge10.Progress:=fortschritt;
    rast:=10;
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
  Button23.Enabled:=false;
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
  TabSheet4.TabVisible:=true;
  Graphic:=pfad + 'Graphics\Automatik-inaktiv.jpg';
  Image5.Picture.LoadFromFile(Graphic);
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

procedure TForm1.Button2Click(Sender: TObject);
begin
  if start=true then
  begin
    Form1.TimerHAusTimer(Sender);
    Form1.TimerRAusTimer(Sender);
    if TimerHEin.Enabled=true then begin PauseLogTimerHEin:=true; TimerHEin.Enabled:=false; end;
    if TimerHAus.Enabled=true then begin PauseLogTimerHAus:=true; TimerHAus.Enabled:=false; end;
    if TimerHSet.Enabled=true then begin PauseLogTimerHSet:=true; TimerHSet.Enabled:=false; end;
    if TimerREin.Enabled=true then begin PauseLogTimerREin:=true; TimerREin.Enabled:=false; end;
    if TimerRAus.Enabled=true then begin PauseLogTimerRAus:=true; TimerRAus.Enabled:=false; end;
    zeitpause:=GetTickCount;
    Timer2.Enabled:=false;
    stop:=false;
    pause:=true;
    start:=false;
    Graphic:=pfad + 'Graphics\Automatik-pause.jpg';
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
  if (start=true) and ((Edit21.Text<>'0') or (Rastnull1=true)) then begin Edit21.Text:='0'; Gauge1.Progress:=100; Rasttemp1:=true; Rastnull1:=false; end
  else if (start=true) and ((Edit22.Text<>'0') or (Rastnull2=true)) then begin Edit22.Text:='0'; Gauge2.Progress:=100; Rasttemp2:=true; Rastnull2:=false; end
  else if (start=true) and ((Edit23.Text<>'0') or (Rastnull3=true)) then begin Edit23.Text:='0'; Gauge3.Progress:=100; Rasttemp3:=true; Rastnull3:=false; end
  else if (start=true) and ((Edit24.Text<>'0') or (Rastnull4=true)) then begin Edit24.Text:='0'; Gauge4.Progress:=100; Rasttemp4:=true; Rastnull4:=false; end
  else if (start=true) and ((Edit25.Text<>'0') or (Rastnull5=true)) then begin Edit25.Text:='0'; Gauge5.Progress:=100; Rasttemp5:=true; Rastnull5:=false; end
  else if (start=true) and ((Edit26.Text<>'0') or (Rastnull6=true)) then begin Edit26.Text:='0'; Gauge6.Progress:=100; Rasttemp6:=true; Rastnull6:=false; end
  else if (start=true) and ((Edit27.Text<>'0') or (Rastnull7=true)) then begin Edit27.Text:='0'; Gauge7.Progress:=100; Rasttemp7:=true; Rastnull7:=false; end
  else if (start=true) and ((Edit28.Text<>'0') or (Rastnull8=true)) then begin Edit28.Text:='0'; Gauge8.Progress:=100; Rasttemp8:=true; Rastnull8:=false; end
  else if (start=true) and ((Edit29.Text<>'0') or (Rastnull9=true)) then begin Edit29.Text:='0'; Gauge9.Progress:=100; Rasttemp9:=true; Rastnull9:=false; end
  else if (start=true) and ((Edit30.Text<>'0') or (Rastnull10=true)) then begin Edit30.Text:='0'; Gauge10.Progress:=100; Rasttemp10:=true; Rastnull10:=false; end;
  zeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
  if zeit=0 then Form1.Button3Click(Sender);
  if zeit=0 then begin Form1.Button3Click(Sender); Edit53.Text:='0'; Gauge11.Progress:=100; end else Timer2.Enabled:=true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if (start=true) and (CheckBox10.Checked=true) and (Edit20.Text='0') and (Rastnull10=false) then begin Edit30.Text:=Edit20.Text; Gauge10.Progress:=0; Rasttemp10:=false; Rastnull10:=true; end
  else if (start=true) and (CheckBox10.Checked=true) and (Gauge10.Progress<>0) then begin Edit30.Text:=Edit20.Text; Gauge10.Progress:=0; Rasttemp10:=false; end
  else if (start=true) and (CheckBox9.Checked=true) and (Edit18.Text='0') and (Rastnull9=false) then begin Edit29.Text:=Edit18.Text; Gauge9.Progress:=0; Rasttemp9:=false; Rastnull9:=true; end
  else if (start=true) and (CheckBox9.Checked=true) and (Gauge9.Progress<>0) then begin Edit29.Text:=Edit18.Text; Gauge9.Progress:=0; Rasttemp9:=false; end
  else if (start=true) and (CheckBox8.Checked=true) and (Edit16.Text='0') and (Rastnull8=false) then begin Edit28.Text:=Edit16.Text; Gauge8.Progress:=0; Rasttemp8:=false; Rastnull8:=true; end
  else if (start=true) and (CheckBox8.Checked=true) and (Gauge8.Progress<>0) then begin Edit28.Text:=Edit16.Text; Gauge8.Progress:=0; Rasttemp8:=false; end
  else if (start=true) and (CheckBox7.Checked=true) and (Edit14.Text='0') and (Rastnull7=false) then begin Edit27.Text:=Edit14.Text; Gauge7.Progress:=0; Rasttemp7:=false; Rastnull7:=true; end
  else if (start=true) and (CheckBox7.Checked=true) and (Gauge7.Progress<>0) then begin Edit27.Text:=Edit14.Text; Gauge7.Progress:=0; Rasttemp7:=false; end
  else if (start=true) and (CheckBox6.Checked=true) and (Edit12.Text='0') and (Rastnull6=false) then begin Edit26.Text:=Edit12.Text; Gauge6.Progress:=0; Rasttemp6:=false; Rastnull6:=true; end
  else if (start=true) and (CheckBox6.Checked=true) and (Gauge6.Progress<>0) then begin Edit26.Text:=Edit12.Text; Gauge6.Progress:=0; Rasttemp6:=false; end
  else if (start=true) and (CheckBox5.Checked=true) and (Edit10.Text='0') and (Rastnull5=false) then begin Edit25.Text:=Edit10.Text; Gauge5.Progress:=0; Rasttemp5:=false; Rastnull5:=true; end
  else if (start=true) and (CheckBox5.Checked=true) and (Gauge5.Progress<>0) then begin Edit25.Text:=Edit10.Text; Gauge5.Progress:=0; Rasttemp5:=false; end
  else if (start=true) and (CheckBox4.Checked=true) and (Edit8.Text='0') and (Rastnull4=false) then begin Edit24.Text:=Edit8.Text; Gauge4.Progress:=0; Rasttemp4:=false; Rastnull4:=true; end
  else if (start=true) and (CheckBox4.Checked=true) and (Gauge4.Progress<>0) then begin Edit24.Text:=Edit8.Text; Gauge4.Progress:=0; Rasttemp4:=false; end
  else if (start=true) and (CheckBox3.Checked=true) and (Edit6.Text='0') and (Rastnull3=false) then begin Edit23.Text:=Edit6.Text; Gauge3.Progress:=0; Rasttemp3:=false; Rastnull3:=true; end
  else if (start=true) and (CheckBox3.Checked=true) and (Gauge3.Progress<>0) then begin Edit23.Text:=Edit6.Text; Gauge3.Progress:=0; Rasttemp3:=false; end
  else if (start=true) and (CheckBox2.Checked=true) and (Edit4.Text='0') and (Rastnull2=false) then begin Edit22.Text:=Edit4.Text; Gauge2.Progress:=0; Rasttemp2:=false; Rastnull2:=true; end
  else if (start=true) and (CheckBox2.Checked=true) and (Gauge2.Progress<>0) then begin Edit22.Text:=Edit4.Text; Gauge2.Progress:=0; Rasttemp2:=false; end
  else if (start=true) and (CheckBox1.Checked=true) and (Edit2.Text='0') and (Rastnull1=false) then begin Edit21.Text:=Edit2.Text; Gauge1.Progress:=0; Rasttemp1:=false; Rastnull1:=true; end
  else if (start=true) and (CheckBox1.Checked=true) and (Gauge1.Progress<>0) then begin Edit21.Text:=Edit2.Text; Gauge1.Progress:=0; Rasttemp1:=false; end;
  Timer2.Enabled:=true;
end;

procedure TForm1.TimerREinTimer(Sender: TObject);
begin
  Ruehrwerk:=RWert;
  Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-ein.jpg');
  Schalten(Form1);
  TimerREin.Enabled:=false;
  TimerRAus.Enabled:=true;
end;

procedure TForm1.TimerRAusTimer(Sender: TObject);
begin
  Ruehrwerk:=0;
  Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-aus.jpg');
  Schalten(Form1);
  TimerRAus.Enabled:=false;
  TimerREin.Enabled:=true;
end;

procedure TForm1.TimerHEinTimer(Sender: TObject);
begin
  Heizung:=HWert;
  Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-ein.jpg');
  Schalten(Form1);
  TimerHEin.Enabled:=false;
  TimerHAus.Enabled:=true;
end;

procedure TForm1.TimerHAusTimer(Sender: TObject);
begin
  Heizung:=0;
  Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-aus.jpg');
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
      TimerHAus.Interval:=1500000;
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
        if TimerHEin.Interval=0 then begin TimerHEin.Interval:=800; TimerHAus.Interval:=1500000; end;
        if TimerHAus.Interval=0 then begin TimerHAus.Interval:=800; TimerHEin.Interval:=1500000; end;
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
  else if (Deltatemp>0) and (Gradient>=GradientUebergabe) then
  begin
      if TimerHEin.Interval<>1500000 then
      begin
        TimerHEin.Interval:=1500000;
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
    Timer2.Enabled:=true;
    end;
  end;
end;

procedure TForm1.TimerAAusTimer(Sender: TObject);
begin
  Alarm:=0;
  Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-aus.jpg');
  Schalten(Form1);
  TimerAAus.Enabled:=false;
  TimerAEin.Enabled:=true;
end;

procedure TForm1.TimerAEinTimer(Sender: TObject);
begin
  Alarm:=AWert;
  Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-ein.jpg');
  Schalten(Form1);
  TimerAEin.Enabled:=false;
  TimerAAus.Enabled:=true;
end;

procedure TForm1.MessageTimerTimer(Sender: TObject);
var
  buttonSelected, position:integer;
  rasttext:string;
begin
  if rast=1 then rasttext:=Edit63.Text
  else if rast=2 then rasttext:=Edit64.Text
  else if rast=3 then rasttext:=Edit65.Text
  else if rast=4 then rasttext:=Edit66.Text
  else if rast=5 then rasttext:=Edit67.Text
  else if rast=6 then rasttext:=Edit68.Text
  else if rast=7 then rasttext:=Edit69.Text
  else if rast=8 then rasttext:=Edit70.Text
  else if rast=9 then rasttext:=Edit61.Text
  else if rast=10 then rasttext:=Edit62.Text;
  if AlarmEin=true then
  begin
    repeat
    begin
    Form1.TimerAEinTimer(Sender);
    MessageTimer.Enabled:=false;
    if length(rasttext)<50 then position:=350 else if length(rasttext)<70 then position:=265 else if length(rasttext)<90 then position:=180 else position:=100;
    buttonSelected:=MyMessageDlgPos('Rast wurde beendet !' + #13 +#13 + rasttext + #13 +#13 + '- OK um Brauvorgang fortzusetzen.', mtInformation, [mbOK, mbAbort], ['OK', 'stiller Alarm'], Form1.Left+Position, Form1.Top+250);
    if buttonSelected = mrAbort then
    begin
      TimerAEin.Interval:=1500000;
      TimerAAus.Interval:=900;
      buttonSelected:=MyMessageDlgPos('Rast wurde beendet !' + #13 +#13 + rasttext + #13 +#13 + '- OK um Brauvorgang fortzusetzen.', mtInformation, [mbOK, mbAbort], ['OK', 'lauter Alarm'], Form1.Left+Position, Form1.Top+250);
      TimerAEin.Interval:=4000;
      TimerAAus.Interval:=1000;
    end;
    end
    until buttonSelected = mrOK;
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

procedure TForm1.Button16Click(Sender: TObject);
begin
  Button21.Enabled:=false;
  Button22.Enabled:=false;
  Button19.Caption:='1h Zoom';
  Button24.Caption:='30min Zoom';
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
var
  ueberschreiben:boolean;
begin
  DecimalSeparator:='.';
  Button21.Enabled:=false;
  Button22.Enabled:=false;
  Button19.Caption:='1h Zoom';
  Button24.Caption:='30min Zoom';
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
    if StringGrid1.RowCount>=720 then Button19.Enabled:=true else Button19.Enabled:=false;
    if StringGrid1.RowCount>=360 then Button24.Enabled:=true else Button24.Enabled:=false;
    webbrowser1.Navigate(pfad + 'Help\Help.html');
  except
  end;
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

procedure TForm1.Button19Click(Sender: TObject);
begin
  if Button19.Caption='1h Zoom' then
  begin
    Button24.Caption:='30min Zoom';
    Button21.Enabled:=true;
    Button22.Enabled:=true;
    Button19.Caption:='Zoom out';
    startpunkt:=1;
    endpunkt:=720;
    writechart(Form1);
  end
  else
  begin
    Button21.Enabled:=false;
    Button22.Enabled:=false;
    Button19.Caption:='1h Zoom';
    Form1.PageControl1Change(Sender);
  end;
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  startpunkt:=startpunkt+120;
  endpunkt:=endpunkt+120;
  if StringGrid1.RowCount-1<endpunkt then begin endpunkt:=StringGrid1.RowCount-1; if button24.caption='Zoom out' then startpunkt:=endpunkt-359 else startpunkt:=endpunkt-719; end;
  writechart(Form1);
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  startpunkt:=startpunkt-120;
  endpunkt:=endpunkt-120;
  if startpunkt<1 then begin if button24.caption='Zoom out' then endpunkt:=360 else endpunkt:=720; startpunkt:=1; end;
  writechart(Form1);
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  if Button20.Caption='Simulation Ein' then
  begin
    if CheckBox34.Checked=true or CheckBox34.Checked=true
    then ShowMessagePos('Vorsicht! Damit die Simulation richtig'+ #13 +'funktioniert sollte der Gradient sowie'+ #13 +'die Pulsung ausgeschaltet sein!', Form1.Left+350, Form1.Top+250);
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
  try
    if FileExists(pfad+'Temperatur\' + tempdateiname) then else
    begin
      AssignFile(myFile, pfad+'Temperatur\' + tempdateiname);
      ReWrite(myFile);
      Writeln(myFile, '01-01-2000 00:00:00;21.0');
      CloseFile(myFile);
    end;
    if Heizung=HWert then
    begin
      if SimTemp<100 then SimTemp:=SimTemp+0.1;
    end
    else
    begin
      if SimTemp>21 then SimTemp:=SimTemp-0.05;
    end;
    AssignFile(SimFile, pfad + 'Temperatur\' + tempdateiname);
    Append(SimFile);
    Writeln(SimFile, 'Simulation;'+FloatToStrF(SimTemp,ffFixed,10,1));
    CloseFile(SimFile);
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

procedure TForm1.Button24Click(Sender: TObject);
begin
  if Button24.Caption='30min Zoom' then
  begin
    Button19.Caption:='1h Zoom';
    Button21.Enabled:=true;
    Button22.Enabled:=true;
    Button24.Caption:='Zoom out';
    startpunkt:=1;
    endpunkt:=360;
    writechart(Form1);
  end
  else
  begin
    Button21.Enabled:=false;
    Button22.Enabled:=false;
    Button24.Caption:='30min Zoom';
    Form1.PageControl1Change(Sender);
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

procedure TForm1.Button25Click(Sender: TObject);
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
  setup_speichern(Form1);
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

procedure TForm1.ComboBox1Change(Sender: TObject); begin setupgeaendert; end;
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
procedure TForm1.ComboBox26Change(Sender: TObject); begin setupgeaendert; end;
procedure TForm1.CheckBox35Click(Sender: TObject); begin setupgeaendert; end;

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
   Edit63.Visible:=true;
   Edit64.Visible:=true;
   Edit65.Visible:=true;
   Edit66.Visible:=true;
   Edit67.Visible:=true;
   Edit68.Visible:=true;
   Edit69.Visible:=true;
   Edit70.Visible:=true;
   Edit71.Visible:=true;
   Edit72.Visible:=true;
   Edit73.Visible:=true;
   Edit74.Visible:=true;
   Edit75.Visible:=true;
   Edit76.Visible:=true;
   Edit77.Visible:=true;
   Edit78.Visible:=true;
   Edit79.Visible:=true;
   Edit80.Visible:=true;
   Edit81.Visible:=true;
   Edit82.Visible:=true;
   Label1.Visible:=false;
   Label3.Visible:=false;
   Label23.Visible:=false;
   Label24.Visible:=false;
   Label25.Visible:=false;
   Label36.Visible:=false;
   Label115.Visible:=true;
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
   Edit63.Visible:=false;
   Edit64.Visible:=false;
   Edit65.Visible:=false;
   Edit66.Visible:=false;
   Edit67.Visible:=false;
   Edit68.Visible:=false;
   Edit69.Visible:=false;
   Edit70.Visible:=false;
   Edit71.Visible:=false;
   Edit72.Visible:=false;
   Edit73.Visible:=false;
   Edit74.Visible:=false;
   Edit75.Visible:=false;
   Edit76.Visible:=false;
   Edit77.Visible:=false;
   Edit78.Visible:=false;
   Edit79.Visible:=false;
   Edit80.Visible:=false;
   Edit81.Visible:=false;
   Edit82.Visible:=false;
   Label1.Visible:=true;
   Label3.Visible:=true;
   Label23.Visible:=true;
   Label24.Visible:=true;
   Label25.Visible:=true;
   Label36.Visible:=true;
   Label115.Visible:=false;
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

end.






