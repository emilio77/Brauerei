unit Brauerei;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, Menus, ExtCtrls, jpeg, TeeProcs, TeEngine,
  Chart, DbChart, ComCtrls, Grids, Series, OleCtrls, SHDocVw, ShellApi,
  Printers,synaser, Buttons, Timer, AppEvnts, SQLiteTable3, MMSystem,
  IdUDPServer, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  IdSocketHandle, IdTCPConnection, IdTCPClient, IdHTTP;


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
    Batch_Update_Tmr: TTimer;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    Edit62: TEdit;
    TimerDlgMove: TTimer;
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
    Panel15: TPanel;
    Button2: TButton;
    ApplicationEvents1: TApplicationEvents;
    Edit83: TEdit;
    Edit84: TEdit;
    Edit85: TEdit;
    Edit86: TEdit;
    Edit87: TEdit;
    Edit88: TEdit;
    Label114: TLabel;
    Label117: TLabel;
    ComboBox44: TComboBox;
    CheckBox41: TCheckBox;
    TimerRSet: TTimer;
    TabSheet5: TTabSheet;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    btnOpen: TButton;
    memMaisch: TMemo;
    ebName: TEdit;
    ebID: TEdit;
    Edit89: TEdit;
    Edit90: TEdit;
    Button3: TButton;
    ScrollBar1: TScrollBar;
    OpenDialog2: TOpenDialog;
    SaveDialog2: TSaveDialog;
    Button4: TButton;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    Button5: TButton;
    Button6: TButton;
    ComboBox34: TComboBox;
    Label108: TLabel;
    Label123: TLabel;
    Edit91: TEdit;
    CheckBox44: TCheckBox;
    Label124: TLabel;
    Edit92: TEdit;
    Label125: TLabel;
    Label126: TLabel;
    Button7: TButton;
    Button12: TButton;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    ComboBox28: TComboBox;
    Label99: TLabel;
    Label101: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    ComboBox30: TComboBox;
    ComboBox32: TComboBox;
    ComboBox33: TComboBox;
    CheckBox32: TCheckBox;
    CheckBox42: TCheckBox;
    ComboBox45: TComboBox;
    CheckBox43: TCheckBox;
    Edit93: TEdit;
    Label127: TLabel;
    Label128: TLabel;
    Edit94: TEdit;
    SpeedButton1: TSpeedButton;
    Image7: TImage;
    ComboBox31: TComboBox;
    Label103: TLabel;
    Edit95: TEdit;
    Label129: TLabel;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    BitBtn45: TBitBtn;
    BitBtn46: TBitBtn;
    BitBtn47: TBitBtn;
    BitBtn48: TBitBtn;
    BitBtn49: TBitBtn;
    BitBtn50: TBitBtn;
    BitBtn51: TBitBtn;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    BitBtn54: TBitBtn;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    BitBtn59: TBitBtn;
    BitBtn60: TBitBtn;
    BitBtn61: TBitBtn;
    BitBtn62: TBitBtn;
    BitBtn63: TBitBtn;
    BitBtn64: TBitBtn;
    CheckBox31: TCheckBox;
    Panel14: TPanel;
    Label135: TLabel;
    ComboBox46: TComboBox;
    ComboBox47: TComboBox;
    ComboBox48: TComboBox;
    ComboBox49: TComboBox;
    ComboBox50: TComboBox;
    ComboBox51: TComboBox;
    ComboBox52: TComboBox;
    ComboBox53: TComboBox;
    ComboBox54: TComboBox;
    ComboBox55: TComboBox;
    ComboBox56: TComboBox;
    ComboBox57: TComboBox;
    ComboBox58: TComboBox;
    ComboBox59: TComboBox;
    ComboBox60: TComboBox;
    ComboBox61: TComboBox;
    ComboBox62: TComboBox;
    ComboBox63: TComboBox;
    ComboBox64: TComboBox;
    ComboBox65: TComboBox;
    ComboBox66: TComboBox;
    ComboBox67: TComboBox;
    ComboBox68: TComboBox;
    ComboBox69: TComboBox;
    ComboBox70: TComboBox;
    ComboBox71: TComboBox;
    ComboBox72: TComboBox;
    ComboBox73: TComboBox;
    ComboBox74: TComboBox;
    ComboBox75: TComboBox;
    BitBtn65: TBitBtn;
    BitBtn66: TBitBtn;
    BitBtn67: TBitBtn;
    Label136: TLabel;
    TabSheet8: TTabSheet;
    Label73: TLabel;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    IdUDPClient1: TIdUDPClient;
    Tmr_Rcv: TTimer;
    IdUDPServer1: TIdUDPServer;
    ComboBox35: TComboBox;
    Label137: TLabel;
    ComboBox36: TComboBox;
    Label138: TLabel;
    ComboBox37: TComboBox;
    Edit96: TEdit;
    Label139: TLabel;
    ComboBox38: TComboBox;
    ComboBox39: TComboBox;
    Label140: TLabel;
    ComboBox40: TComboBox;
    Label141: TLabel;
    CheckBox45: TCheckBox;
    ArduinoTimer: TTimer;
    GroupBox8: TGroupBox;
    CheckBox46: TCheckBox;
    CheckBox47: TCheckBox;
    CheckBox48: TCheckBox;
    CheckBox49: TCheckBox;
    Edit97: TEdit;
    Edit98: TEdit;
    Edit99: TEdit;
    Edit100: TEdit;
    Edit101: TEdit;
    Edit102: TEdit;
    Edit103: TEdit;
    Edit104: TEdit;
    Edit105: TEdit;
    Edit106: TEdit;
    Edit107: TEdit;
    Edit108: TEdit;
    Label142: TLabel;
    Button27: TButton;
    Button26: TButton;
    Button28: TButton;
    CheckBox39: TCheckBox;
    CheckBox38: TCheckBox;
    CheckBox40: TCheckBox;
    Label143: TLabel;
    GroupBox9: TGroupBox;
    ComboBox41: TComboBox;
    ComboBox76: TComboBox;
    ComboBox42: TComboBox;
    Label144: TLabel;
    DigitempTimer: TTimer;
    UpDown1: TUpDown;
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
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
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
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Batch_Update_TmrTimer(Sender: TObject);
    procedure ComboBox26Change(Sender: TObject);
    procedure OpenDialog1Show(Sender: TObject);
    procedure TimerDlgMoveTimer(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure CheckBox38Click(Sender: TObject);
    procedure CheckBox39Click(Sender: TObject);
    procedure CheckBox40Click(Sender: TObject);
    procedure StartTimerTimer(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure GesUpdateTimerTimer(Sender: TObject);
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
    procedure Button2Click(Sender: TObject);
    procedure ApplicationEvents1ShowHint(var HintStr: String;
    var CanShow: Boolean; var HintInfo: THintInfo);
    procedure Edit83Exit(Sender: TObject);
    procedure Edit84Exit(Sender: TObject);
    procedure Edit85Exit(Sender: TObject);
    procedure Edit86Exit(Sender: TObject);
    procedure TimerRSetTimer(Sender: TObject);
    procedure CheckBox42Click(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox43Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit91Exit(Sender: TObject);
    procedure Edit92Exit(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure BitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit93Exit(Sender: TObject);
    procedure Edit94Exit(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit95Exit(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure BitBtn50Click(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);
    procedure BitBtn54Click(Sender: TObject);
    procedure BitBtn56Click(Sender: TObject);
    procedure BitBtn58Click(Sender: TObject);
    procedure BitBtn60Click(Sender: TObject);
    procedure BitBtn62Click(Sender: TObject);
    procedure BitBtn64Click(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn53Click(Sender: TObject);
    procedure BitBtn55Click(Sender: TObject);
    procedure BitBtn57Click(Sender: TObject);
    procedure BitBtn59Click(Sender: TObject);
    procedure BitBtn61Click(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure CheckBox31Click(Sender: TObject);
    procedure BitBtn65Click(Sender: TObject);
    procedure BitBtn66Click(Sender: TObject);
    procedure BitBtn67Click(Sender: TObject);
    procedure ComboBox38Change(Sender: TObject);
    procedure ComboBox39Change(Sender: TObject);
    procedure ComboBox40Change(Sender: TObject);
    procedure ComboBox36Change(Sender: TObject);
    procedure ComboBox37Change(Sender: TObject);
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure Tmr_RcvTimer(Sender: TObject);
    procedure Edit96Exit(Sender: TObject);
    procedure CheckBox45Click(Sender: TObject);
    procedure ArduinoTimerTimer(Sender: TObject);
    procedure ComboBox41Change(Sender: TObject);
    procedure DigitempTimerTimer(Sender: TObject);
    procedure ComboBox42Change(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure ComboBox76Change(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

procedure TimerDialogClose;
procedure Funktionstextuebernahme;

const
  Version = 'V01.60';

var
  Form1: TForm1;
  sl,sl2: TStringList;
  rasttemp, rastnull, funktionsinfo: Array of Boolean;
  Temperatur,xwert,Graphic,LogName,Steuerung,BHEin,BHAus,BREin,BRAus,BPEin,BPAus,
  BAEin,BAAus,TimeTempStr,TimeTempStore,USBPort,USBTyp,pfad,tempdateiname,
  sensorverzoegerung,Relais4,Rezeptname,pfad2,pfad3,RecText,arduinotfs: String;
  Tempfloat,Solltemp,Deltatemp,Deltatemp2,TWert,Gradient,GradientWert,
  GradientUebergabe,Hysterese,Hysterese2,Aufheizrate,Abkuehlrate,
  alarmtemp,kwert,kfaktor,htime,rtime,ptime,atime,gtime,Tempfloatold,
  arduinofloattempalt,arduinofloattemp,arduinotempdelta: Extended;
  Ruehrwerk,Heizung,Alarm,Pumpe,HWert,RWert,PWert,AWert,RStore,PStore,HStore,
  AStore,LPTCode,restrastzeit,zeit2,zeit3,zeitpause,fortschritt,rast,Intdummy,
  CountLines,restrastgauge,gesrastzeit, startpunkt,endpunkt,Ein1,Aus1,Ein2,
  Aus2,Ein3,Aus3,Ein4,Aus4,Ein100,Aus100,EinIst,AusIst,USBHIntWert,
  USBRIntWert,USBPIntWert,USBAIntWert,DeviceIndex,sensorreset,geskuehlzeit,
  StartTemp,maxsolltemp,gesheizzeit,restheizzeit,gesprozesszeit,restprozesszeit,
  restheizgauge,restprozessgauge,Timerstartbatstatus,spanne,Temperaturrast,
  restkuehlzeit,restkuehlgauge,heizcounter,HEin,HAus,Datensatz,k,
  Multistart,Alarmheizstatus,warnungaus: integer;
  LPTPort: word;
  myFile,myLogFile,SimFile,mySetup,myDisplay,myImportFile: TextFile;
  pause,start,stop,AlarmEin,Rastende,PauseLogTimerHEin,PauseLogTimerHAus,
  PauseLogTimerHSet,PauseLogTimerREin,PauseLogTimerRAus,PauseLogTimerKEin,
  PauseLogTimerKAus,PauseLogTimerKSet,Rastnullges,USBStarted,LANStarted: boolean;
  USBHWert,USBRWert,USBPWert,USBAWert: char;
  Gradientgetter: Array[1..60] of Extended;
  ser: TBlockSerial;
  FT_HANDLE : DWord = 0;
  FT_Out : Byte;
  FT_OUT_INT,RESULT,Write_Result,Charint,Description  : Integer;


implementation

uses Multi, Funktionsbezeichnungen;


{$R *.dfm}


procedure OpenLine ;
begin with Form1 do begin
  ser.Connect(ComboBox40.Text) ;
  if ser.LastError<>sOK then begin Memo1.Lines.Append('No '+ComboBox40.Text) ; exit ; end ;
  ser.Config({Baud}19200, {Bits}8, {Parity}'N', {StopBits}SB1, {Xon/Xoff}false, {DTR/CTS}false);
  if ser.LastError<>sOK then begin Memo1.Lines.Append('Config fail') ; exit ; end ;
  Memo1.Lines.Append('Connected');
  Tmr_Rcv.Interval := 200 ; Tmr_Rcv.Enabled := true ;
end ; end ;

procedure CloseLine ;
begin with Form1 do begin
  Tmr_Rcv.Enabled := false ;
  ser.CloseSocket ;
end ; end ;

function RastendeMessageDlgPos(Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; Captions: array of string; xPos: Integer; yPos: Integer ): Integer;
var
  aMsgDlg: TForm;
  i: Integer;
  dlgButton: TButton;
  dlgLabel: TLabel;
  CaptionIndex,bc: Integer;
  wfaktor:extended;
begin
  bc := 0;
  wfaktor:=strtofloat(Form1.Edit95.Text);
  aMsgDlg := CreateMessageDialog(Msg, DlgType, Buttons);
  aMsgDlg.Font.Name:='Arial';
  aMsgDlg.Font.Size:=9;
  if length(MSG)<100 then aMsgDlg.Width:=417 else aMsgDlg.Width:=817;
  if aMsgDlg.Width=417 then aMsgDlg.Left := xPos+240 else aMsgDlg.Left := xPos+100;
  aMsgDlg.Top := yPos+250;
  captionIndex := 0;
  for i := 0 to aMsgDlg.ComponentCount - 1 do
  begin
    if (aMsgDlg.Components[i] is TButton) then
    begin
      bc := bc + 1;
      dlgButton := TButton(aMsgDlg.Components[i]);
      if CaptionIndex > High(Captions) then Break;
      dlgButton.Caption := Captions[CaptionIndex];
      Inc(CaptionIndex);
      if aMsgDlg.Width=417 then
      begin
        dlgButton.Width:=90;
        dlgButton.Left:=bc*10+(bc-1)*90;
      end
      else
      begin
        dlgButton.Width:=190;
        dlgButton.Left:=bc*10+(bc-1)*190;
      end;
    end;
  end;
  for i := 0 to aMsgDlg.ComponentCount - 1 do
  begin
    if (aMsgDlg.Components[i] is TLabel) then
    begin
      dlgLabel := TLabel(aMsgDlg.Components[i]);
      dlgLabel.Width := aMsgDlg.Width -80;
    end;
  end;
  aMsgDlg.scaleby(round(wfaktor*100),100);
  Result := aMsgDlg.ShowModal;
end;

function MyMessageDlgPos(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; Captions: array of string; xPosForm, xPosMessage, yPosForm, yPosMessage: Integer ): Integer;
var
  aMsgDlg: TForm;
  wfaktor:extended;
begin
  wfaktor:=strtofloat(Form1.Edit95.Text);
  aMsgDlg := CreateMessageDialog(Msg, DlgType, Buttons);
  aMsgDlg.Font.Name:='Arial';
  aMsgDlg.Font.Size:=9;
  aMsgDlg.Left := xPosForm + round(xPosMessage*wfaktor);
  aMsgDlg.Top := yPosForm + round(yPosMessage*wfaktor);
  aMsgDlg.scaleby(round(wfaktor*100),100);
  Result := aMsgDlg.ShowModal;
end;

function MyShowMessagePos(const Msg: string; xPosForm, xPosMessage, yPosForm, yPosMessage: Integer ): Integer;
var
  aMsgDlg: TForm;
  wfaktor:extended;
begin
  wfaktor:=strtofloat(Form1.Edit95.Text);
  aMsgDlg := CreateMessageDialog(Msg, mtInformation, [mbOK]);
  aMsgDlg.Font.Name:='Arial';
  aMsgDlg.Font.Size:=9;
  aMsgDlg.Left := xPosForm + round(xPosMessage*wfaktor);
  aMsgDlg.Top := yPosForm + round(yPosMessage*wfaktor);
  aMsgDlg.scaleby(round(wfaktor*100),100);
  Result := aMsgDlg.ShowModal;
end;

procedure ButtonChanged(Sender: TBitBtn);
begin
  if Sender.HelpKeyword='Bei Rasttemperaturüberschreitung' then
    Sender.glyph.LoadFromFile(pfad + 'Graphics\Feuer.bmp')
  else if Sender.HelpKeyword='Bei Rasttemperaturunterschreitung' then
    Sender.glyph.LoadFromFile(pfad + 'Graphics\Eis.bmp')
  else
    Sender.glyph.LoadFromFile(pfad + 'Graphics\Uhr.bmp')
end;

procedure ButtonPressed(Sender: TBitBtn);
begin
  if Sender.HelpKeyword='Bei Rasttemperaturüberschreitung' then
    Sender.HelpKeyword:='Bei Rasttemperaturunterschreitung'
  else if Sender.HelpKeyword='Bei Rasttemperaturunterschreitung' then
    Sender.HelpKeyword:='Temperaturunabhängig'
  else
    Sender.HelpKeyword:='Bei Rasttemperaturüberschreitung';
  ButtonChanged(Sender);
end;

procedure ButtonPlus(Rastnummer: Integer);
var i:integer;
begin
  for i := 9 downto Rastnummer do
  begin
    (Form1.FindComponent('Edit' + IntToStr(73+i)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(72+i)) as TEdit).Text;
    (Form1.FindComponent('Edit' + IntToStr(63+i)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(62+i)) as TEdit).Text;
    (Form1.FindComponent('CheckBox' + IntToStr(1+i)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Checked;
    (Form1.FindComponent('CheckBox' + IntToStr(1+i)) as TCheckBox).Caption := (Form1.FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Caption;
    (Form1.FindComponent('Edit' + IntToStr(2*i+1)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(2*i-1)) as TEdit).Text;
    (Form1.FindComponent('Edit' + IntToStr(2*i+2)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(2*i)) as TEdit).Text;
    (Form1.FindComponent('CheckBox' + IntToStr(11+i)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(10+i)) as TCheckBox).Checked;
    (Form1.FindComponent('CheckBox' + IntToStr(21+i)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(20+i)) as TCheckBox).Checked;
    (Form1.FindComponent('Edit' + IntToStr(31+i)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(30+i)) as TEdit).Text;
    (Form1.FindComponent('Edit' + IntToStr(41+i)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(40+i)) as TEdit).Text;
    Repeat ButtonPressed((Form1.FindComponent('BitBtn' + IntToStr(17+i)) as TBitBtn)) until (Form1.FindComponent('BitBtn' + IntToStr(17+i)) as TBitBtn).HelpKeyword = (Form1.FindComponent('BitBtn' + IntToStr(16+i)) as TBitBtn).HelpKeyword;
  end;
  (Form1.FindComponent('Edit' + IntToStr(72+Rastnummer)) as TEdit).Text := 'neue Rast';
  (Form1.FindComponent('Edit' + IntToStr(62+Rastnummer)) as TEdit).Text := '';
  (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer)) as TCheckBox).Checked := true;
  (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer)) as TCheckBox).Caption := 'neue Rast';
  (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer-1)) as TEdit).Text := '20';
  (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer)) as TEdit).Text := '60';
  (Form1.FindComponent('CheckBox' + IntToStr(10+Rastnummer)) as TCheckBox).Checked := false;
  (Form1.FindComponent('CheckBox' + IntToStr(20+Rastnummer)) as TCheckBox).Checked := Form1.CheckBox44.Checked;
  (Form1.FindComponent('Edit' + IntToStr(30+Rastnummer)) as TEdit).Text := Form1.Edit91.Text;
  (Form1.FindComponent('Edit' + IntToStr(40+Rastnummer)) as TEdit).Text := Form1.Edit92.Text;
  Repeat ButtonPressed((Form1.FindComponent('BitBtn' + IntToStr(16+Rastnummer)) as TBitBtn)) until (Form1.FindComponent('BitBtn' + IntToStr(16+Rastnummer)) as TBitBtn).HelpKeyword = 'Bei Rasttemperaturüberschreitung';
end;

procedure ButtonMinus(Rastnummer: Integer);
var i,buttonSelected:integer;
begin
  buttonSelected:=MyMessageDlgPos('Rast wirklich löschen?', mtWarning, [mbOK, mbAbort], ['Ok', 'Abbruch'], Form1.Left, 350, Form1.Top, 250);
  if buttonSelected = mrOK then
  begin
    for i := Rastnummer to 9 do
    begin
      (Form1.FindComponent('Edit' + IntToStr(72+i)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(73+i)) as TEdit).Text;
      (Form1.FindComponent('Edit' + IntToStr(62+i)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(63+i)) as TEdit).Text;
      (Form1.FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(i+1)) as TCheckBox).Checked;
      (Form1.FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Caption := (Form1.FindComponent('CheckBox' + IntToStr(i+1)) as TCheckBox).Caption;
      (Form1.FindComponent('Edit' + IntToStr(2*i-1)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(2*i+1)) as TEdit).Text;
      (Form1.FindComponent('Edit' + IntToStr(2*i)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(2*i+2)) as TEdit).Text;
      (Form1.FindComponent('CheckBox' + IntToStr(10+i)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(11+i)) as TCheckBox).Checked;
      (Form1.FindComponent('CheckBox' + IntToStr(20+i)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(21+i)) as TCheckBox).Checked;
      (Form1.FindComponent('Edit' + IntToStr(30+i)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(31+i)) as TEdit).Text;
      (Form1.FindComponent('Edit' + IntToStr(40+i)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(41+i)) as TEdit).Text;
      Repeat ButtonPressed((Form1.FindComponent('BitBtn' + IntToStr(16+i)) as TBitBtn)) until (Form1.FindComponent('BitBtn' + IntToStr(16+i)) as TBitBtn).HelpKeyword = (Form1.FindComponent('BitBtn' + IntToStr(17+i)) as TBitBtn).HelpKeyword;
    end;
    Form1.Edit82.Text := 'neue Rast';
    Form1.Edit72.Text := '';
    Form1.CheckBox10.Checked := true;
    Form1.CheckBox10.Caption := 'neue Rast';
    Form1.Edit19.Text := '20';
    Form1.Edit20.Text := '60';
    Form1.CheckBox20.Checked := false;
    Form1.CheckBox30.Checked := Form1.CheckBox44.Checked;
    Form1.Edit40.Text := Form1.Edit91.Text;
    Form1.Edit50.Text := Form1.Edit92.Text;
    Repeat ButtonPressed(Form1.BitBtn26) until Form1.BitBtn26.HelpKeyword = 'Bei Rasttemperaturüberschreitung';
  end;
end;

procedure RastPlus(Rastnummer: Integer);
var x:string;
    y:boolean;
begin
  x := (Form1.FindComponent('Edit' + IntToStr(73+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(73+Rastnummer)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(72+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(72+Rastnummer)) as TEdit).Text := x;
  x := (Form1.FindComponent('Edit' + IntToStr(63+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(63+Rastnummer)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(62+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(62+Rastnummer)) as TEdit).Text := x;
  y := (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer+1)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer+1)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer)) as TCheckBox).Checked := y;
  x := (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer)) as TCheckBox).Caption;
  (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer)) as TCheckBox).Caption := (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer+1)) as TCheckBox).Caption;
  (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer+1)) as TCheckBox).Caption := x;
  x := (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer-1)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer-1)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer+1)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer+1)) as TEdit).Text := x;
  x := (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer+2)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer+2)) as TEdit).Text := x;
  y := (Form1.FindComponent('CheckBox' + IntToStr(10+Rastnummer)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(10+Rastnummer)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(11+Rastnummer)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(11+Rastnummer)) as TCheckBox).Checked := y;
  y := (Form1.FindComponent('CheckBox' + IntToStr(20+Rastnummer)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(20+Rastnummer)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(21+Rastnummer)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(21+Rastnummer)) as TCheckBox).Checked := y;
  x := (Form1.FindComponent('Edit' + IntToStr(30+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(30+Rastnummer)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(31+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(31+Rastnummer)) as TEdit).Text := x;
  x := (Form1.FindComponent('Edit' + IntToStr(40+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(40+Rastnummer)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(41+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(41+Rastnummer)) as TEdit).Text := x;
  x := (Form1.FindComponent('BitBtn' + IntToStr(16+Rastnummer)) as TBitBtn).HelpKeyword;
  Repeat ButtonPressed((Form1.FindComponent('BitBtn' + IntToStr(16+Rastnummer)) as TBitBtn)) until (Form1.FindComponent('BitBtn' + IntToStr(16+Rastnummer)) as TBitBtn).HelpKeyword = (Form1.FindComponent('BitBtn' + IntToStr(17+Rastnummer)) as TBitBtn).HelpKeyword;
  Repeat ButtonPressed((Form1.FindComponent('BitBtn' + IntToStr(17+Rastnummer)) as TBitBtn)) until (Form1.FindComponent('BitBtn' + IntToStr(17+Rastnummer)) as TBitBtn).HelpKeyword = x;
end;

procedure RastMinus(Rastnummer: Integer);
var x:string;
    y:boolean;
begin
  x := (Form1.FindComponent('Edit' + IntToStr(72+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(72+Rastnummer)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(73+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(73+Rastnummer)) as TEdit).Text := x;
  x := (Form1.FindComponent('Edit' + IntToStr(62+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(62+Rastnummer)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(63+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(63+Rastnummer)) as TEdit).Text := x;
  y := (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer+1)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer+1)) as TCheckBox).Checked := y;
  x := (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer+1)) as TCheckBox).Caption;
  (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer+1)) as TCheckBox).Caption := (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer)) as TCheckBox).Caption;
  (Form1.FindComponent('CheckBox' + IntToStr(Rastnummer)) as TCheckBox).Caption := x;
  x := (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer+1)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer+1)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer-1)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer-1)) as TEdit).Text := x;
  x := (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer+2)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer+2)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(2*Rastnummer)) as TEdit).Text := x;
  y := (Form1.FindComponent('CheckBox' + IntToStr(11+Rastnummer)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(11+Rastnummer)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(10+Rastnummer)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(10+Rastnummer)) as TCheckBox).Checked := y;
  y := (Form1.FindComponent('CheckBox' + IntToStr(21+Rastnummer)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(21+Rastnummer)) as TCheckBox).Checked := (Form1.FindComponent('CheckBox' + IntToStr(20+Rastnummer)) as TCheckBox).Checked;
  (Form1.FindComponent('CheckBox' + IntToStr(20+Rastnummer)) as TCheckBox).Checked := y;
  x := (Form1.FindComponent('Edit' + IntToStr(31+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(31+Rastnummer)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(30+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(30+Rastnummer)) as TEdit).Text := x;
  x := (Form1.FindComponent('Edit' + IntToStr(41+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(41+Rastnummer)) as TEdit).Text := (Form1.FindComponent('Edit' + IntToStr(40+Rastnummer)) as TEdit).Text;
  (Form1.FindComponent('Edit' + IntToStr(40+Rastnummer)) as TEdit).Text := x;
  x := (Form1.FindComponent('BitBtn' + IntToStr(17+Rastnummer)) as TBitBtn).HelpKeyword;
  Repeat ButtonPressed((Form1.FindComponent('BitBtn' + IntToStr(17+Rastnummer)) as TBitBtn)) until (Form1.FindComponent('BitBtn' + IntToStr(17+Rastnummer)) as TBitBtn).HelpKeyword = (Form1.FindComponent('BitBtn' + IntToStr(16+Rastnummer)) as TBitBtn).HelpKeyword;
  Repeat ButtonPressed((Form1.FindComponent('BitBtn' + IntToStr(16+Rastnummer)) as TBitBtn)) until (Form1.FindComponent('BitBtn' + IntToStr(16+Rastnummer)) as TBitBtn).HelpKeyword = x;
end;

procedure ImportSettings;
begin with Form1 do begin
  AssignFile(myImportFile, pfad+'Import\file.txt');
  ReWrite(myImportFile);
  WriteLn(myImportFile,Edit90.Text);
  WriteLn(myImportFile,pfad2);
  if Form1.CheckBox44.Checked=true then WriteLn(myImportFile,'TRUE') else WriteLn(myImportFile,'FALSE');
  WriteLn(myImportFile,Edit91.Text);
  WriteLn(myImportFile,Edit92.Text);
  CloseFile(myImportFile);
end; end;

procedure SQLBrowse;
var slDBpath: string;
    sldb: TSQLiteDatabase;
    sltb: TSQLIteTable;
    MemText: String;
    ID,i,k,gk: integer;
begin with Form1 do begin
  Edit90.Text := OpenDialog2.FileName;
  slDBPath := OpenDialog2.FileName;
  sldb := TSQLiteDatabase.Create(slDBPath);
  try
    if sldb.TableExists('Sud') then
    begin
      //query the data
      sltb := slDb.GetTable('SELECT * FROM Sud');
      try
        if sltb.Count > 0 then
        begin
          if Datensatz > sltb.Count-1 then Datensatz:=sltb.Count-1;
          ScrollBar1.Max:=sltb.Count-1;
          ScrollBar1.Position:=Datensatz;
          if Datensatz < 0 then Datensatz:=0;
          for i:=1 to Datensatz do sltb.Next;
          Edit89.Text:=inttostr(Datensatz+1)+' / '+inttostr(sltb.Count);
          ebName.Text := UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['Sudname']));
          ID := sltb.FieldAsInteger(sltb.FieldIndex['ID']);
          ebID.Text := inttostr(ID);
          memMaisch.Text := 'Einmaischen - '+floattostr(sltb.FieldAsDouble(sltb.FieldIndex['EinmaischenTemp']))+chr(176)+'C - 0 min.';
        end;
      except
        MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
      end;
      sltb := slDb.GetTable('SELECT * FROM Rasten WHERE SudID = '+inttostr(ID));
      try
        if sltb.Count > 0 then
        begin
          for i:=1 to sltb.Count do
          begin
            MemText:=UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['RastName']));
            Delete(MemText, Pos(' ', MemText), 99);
            MemText:=MemText+' - '+UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['RastTemp']))+chr(176)+'C - ';
            MemText:=MemText+UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['RastDauer'])+' min.');
            memMaisch.Lines.Add(MemText);
            sltb.Next;
          end;
        end;
      except
        MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
      end;

      // *** Hopfengaben aus DB lesen ***
      memMaisch.Lines.Add('');
      memMaisch.Lines.Add('');
      memMaisch.Lines.Add('==========================================================');
      memMaisch.Lines.Add('');
      sltb := slDb.GetTable('SELECT * FROM Sud');
      try
        if sltb.Count > 0 then for i:=1 to Datensatz do sltb.Next;
        memMaisch.Lines.Add('Gesamtkochdauer - '+floattostr(sltb.FieldAsDouble(sltb.FieldIndex['KochdauerNachBitterhopfung']))+' min.');
        gk:=round(sltb.FieldAsDouble(sltb.FieldIndex['KochdauerNachBitterhopfung']));
      except
        MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
      end;
      sltb := slDb.GetTable('SELECT * FROM Hopfengaben WHERE SudID = '+inttostr(ID));
      try
        memMaisch.Lines.Add('');
        memMaisch.Lines.Add('Vorderwürzhopfen :');
        if sltb.Count > 0 then
        begin
          for i:=1 to sltb.Count do
          begin
            if sltb.FieldAsString(sltb.FieldIndex['Vorderwuerze'])='1' then
            begin
              MemText:=UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['erg_Menge']))+ ' g';
              MemText:=MemText+' - '+UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['Name']));
              memMaisch.Lines.Add(MemText);
            end;
            sltb.Next;
          end;
        end;
      except
        MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
      end;
      sltb := slDb.GetTable('SELECT * FROM Hopfengaben ORDER BY Zeit DESC');
      try
        memMaisch.Lines.Add('');
        memMaisch.Lines.Add('Hopfengabe nach :');
        if sltb.Count > 0 then
        begin
          for i:=1 to sltb.Count do
          begin
            if (sltb.FieldAsString(sltb.FieldIndex['Vorderwuerze'])='0') and (sltb.FieldAsString(sltb.FieldIndex['SudID'])=inttostr(ID)) then
            begin
              k:=gk-round(sltb.FieldAsDouble(sltb.FieldIndex['Zeit']));
              MemText:=inttostr(k)+' min. - ';
              MemText:=MemText+UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['erg_Menge']))+ ' g';
              MemText:=MemText+' - '+UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['Name']));
              memMaisch.Lines.Add(MemText);
            end;
            sltb.Next;
          end;
        end;
      except
        MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
      end;
    // *** Ende Hopfengaben aus DB lesen ***
      memMaisch.Lines.Add('');
      sltb := slDb.GetTable('SELECT * FROM Sud');
      try
        if sltb.Count > 0 then for i:=1 to Datensatz do sltb.Next;
        if sltb.FieldAsDouble(sltb.FieldIndex['Nachisomerisierungszeit']) <> 0 then
        memMaisch.Lines.Add('Nachisomerisierungszeit - '+floattostr(sltb.FieldAsDouble(sltb.FieldIndex['Nachisomerisierungszeit']))+' min.');
      except
        MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
      end;
    end;
  finally
    sltb.Free;
  end;
end; end;

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
   Panel14.Visible:=false;
   Panel12.Visible:=true;
   Panel13.Visible:=false;
   Panel15.Visible:=false;
   BitBtn10.Visible:=false;
   BitBtn11.Visible:=true;
   if stop=false then
   begin
     Button13.Enabled:=true;
     Button14.Enabled:=true;
     Button15.Enabled:=true;
     Button16.Enabled:=true;
   end
   else
   begin
     Button13.Enabled:=false;
     Button14.Enabled:=false;
     Button15.Enabled:=false;
     Button16.Enabled:=false;
   end;
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
begin
  Panel6.Visible:=true;
  Panel8.Visible:=false;
  Panel10.Visible:=false;
  Panel14.Visible:=false;
  Panel12.Visible:=false;
  Panel13.Visible:=true;
  Button29.Visible:=true;
  Button30.Visible:=false;
  BitBtn10.Visible:=true;
  BitBtn11.Visible:=false;
  if (stop=true) and (Panel12.Visible=false) then Panel15.Visible:=true;
  if start=true then
  begin
    Button13.Caption:='Auto';
    Form1.Button13Click(Form1);
    Button14.Caption:='Auto';
    Form1.Button14Click(Form1);
    Button15.Caption:='Auto';
    Form1.Button15Click(Form1);
    Button16.Caption:='Auto';
    Form1.Button16Click(Form1);
  end;
end;

//LPT:
procedure Out32(wAddr:word;bOut:byte);stdcall; external 'inpout32.dll'    // Parallelportausgabe
function Inp32(wAddr:word):integer;stdcall; external 'inpout32.dll'       // Parallelporteingabe

//Denkovi+SainSmart:
function FT_Open(Index:Integer; ftHandle:Pointer):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_Open';
Function FT_OpenEx(pArg1:Pointer; Flags:DWORD; ftHandle:Pointer):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_OpenEx';
function FT_Close(ftHandle:Dword):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_Close';
function FT_Write(ftHandle:Dword; FTOutBuf:Pointer; BufferSize:LongInt; ResultPtr:Pointer):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_Write';
function FT_SetBaudRate(ftHandle:Dword; BaudRate:DWord):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_SetBaudRate';
function FT_SetBitMode(ftHandle:Dword; Mask,Enable:Byte):FT_Result; stdcall; External 'FTD2XX.DLL' name 'FT_SetBitMode';

//Denkovi:
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

//SainSmart:
procedure USB3OUT;
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
    MyShowMessagePos('Es ist ein Fehler beim ausführen von '+BREin+' aufgetreten', Form1.Left, 350, Form1.Top, 250) else
    RStore:=Ruehrwerk;
  if (Ruehrwerk=0) and (Ruehrwerk<>RStore) then
    if ShellExecute(Application.Handle,'open',PChar(BRAus),nil, nil, SW_HIDE) <= 32 then
    MyShowMessagePos('Es ist ein Fehler beim ausführen von '+BRAus+' aufgetreten', Form1.Left, 350, Form1.Top, 250) else
    RStore:=Ruehrwerk;
  if (Heizung<>0) and (Heizung<>HStore) then
    if ShellExecute(Application.Handle,'open',PChar(BHEin),nil, nil, SW_HIDE) <= 32 then
    MyShowMessagePos('Es ist ein Fehler beim ausführen von '+BHEin+' aufgetreten', Form1.Left, 350, Form1.Top, 250) else
    HStore:=Heizung;
  if (Heizung=0) and (Heizung<>HStore) then
    if ShellExecute(Application.Handle,'open',PChar(BHAus),nil, nil, SW_HIDE) <= 32 then
    MyShowMessagePos('Es ist ein Fehler beim ausführen von '+BHAus+' aufgetreten', Form1.Left, 350, Form1.Top, 250) else
    HStore:=Heizung;
  if (Alarm<>0) and (Alarm<>AStore) then
    if ShellExecute(Application.Handle,'open',PChar(BAEin),nil, nil, SW_HIDE) <= 32 then
    MyShowMessagePos('Es ist ein Fehler beim ausführen von '+BAEin+' aufgetreten', Form1.Left, 350, Form1.Top, 250) else
    AStore:=Alarm;
  if (Alarm=0) and (Alarm<>AStore) then
    if ShellExecute(Application.Handle,'open',PChar(BAAus),nil, nil, SW_HIDE) <= 32 then
    MyShowMessagePos('Es ist ein Fehler beim ausführen von '+BAAus+' aufgetreten', Form1.Left, 350, Form1.Top, 250) else
    AStore:=Alarm;
  if (Pumpe<>0) and (Pumpe<>PStore) then
    if ShellExecute(Application.Handle,'open',PChar(BPEin),nil, nil, SW_HIDE) <= 32 then
    MyShowMessagePos('Es ist ein Fehler beim ausführen von '+BPEin+' aufgetreten', Form1.Left, 350, Form1.Top, 250) else
    PStore:=Pumpe;
  if (Pumpe=0) and (Pumpe<>PStore) then
    if ShellExecute(Application.Handle,'open',PChar(BPAus),nil, nil, SW_HIDE) <= 32 then
    MyShowMessagePos('Es ist ein Fehler beim ausführen von '+BPAus+' aufgetreten', Form1.Left, 350, Form1.Top, 250) else
    PStore:=Pumpe;
end;

procedure WLANOut;
var
  i: integer;
  xml,user,password,ip: string;
begin
  for i:= 0 to 3 do
  begin
    if i=0 then if Heizung<>0 then xml:='ON.xml' else xml:='OFF.xml';;
    if i=1 then if Ruehrwerk<>0 then xml:='ON.xml' else xml:='OFF.xml';;
    if i=2 then if Pumpe<>0 then xml:='ON.xml' else xml:='OFF.xml';;
    if i=3 then if Alarm<>0 then xml:='ON.xml' else xml:='OFF.xml';;
    user:=(Form1.FindComponent('Edit' + IntToStr(101+i)) as TEdit).Text;
    ip:=(Form1.FindComponent('Edit' + IntToStr(97+i)) as TEdit).Text;
    password:=(Form1.FindComponent('Edit' + IntToStr(105+i)) as TEdit).Text;
    if (Form1.FindComponent('CheckBox' + IntToStr(46+i)) as TCheckBox).Checked=true then
    begin
      xml:='-d @'+xml+' http://'+user+':'+password+'@'+ip+':10000/smartplug.cgi';
      ShellExecute(Application.Handle,'open',PChar(pfad+'curl\curl'),PChar(xml),PChar(pfad+'curl'), SW_HIDE);
    end;
  end;
end;

procedure Schalten(Form:TForm1);
begin
  LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;  //LPT-Code errechnen
  if usbtyp='SainSmart' then               //USB-Code errechnen
  begin
    If USBHWert=char(1) then USBHIntWert:=1 else if USBHWert=char(2) then USBHIntWert:=2 else if USBHWert=char(3) then USBHIntWert:=4 else USBHIntWert:=8;
    If USBRWert=char(1) then USBRIntWert:=1 else if USBRWert=char(2) then USBRIntWert:=2 else if USBRWert=char(3) then USBRIntWert:=4 else USBRIntWert:=8;
    If USBAWert=char(1) then USBAIntWert:=1 else if USBAWert=char(2) then USBAIntWert:=2 else if USBAWert=char(3) then USBAIntWert:=4 else USBAIntWert:=8;
    If USBPWert=char(1) then USBPIntWert:=1 else if USBPWert=char(2) then USBPIntWert:=2 else if USBPWert=char(3) then USBPIntWert:=4 else USBPIntWert:=8;
  end
  else
  begin
    If USBHWert=char(1) then USBHIntWert:=2 else if USBHWert=char(2) then USBHIntWert:=8 else if USBHWert=char(3) then USBHIntWert:=32 else USBHIntWert:=128;
    If USBRWert=char(1) then USBRIntWert:=2 else if USBRWert=char(2) then USBRIntWert:=8 else if USBRWert=char(3) then USBRIntWert:=32 else USBRIntWert:=128;
    If USBAWert=char(1) then USBAIntWert:=2 else if USBAWert=char(2) then USBAIntWert:=8 else if USBAWert=char(3) then USBAIntWert:=32 else USBAIntWert:=128;
    If USBPWert=char(1) then USBPIntWert:=2 else if USBPWert=char(2) then USBPIntWert:=8 else if USBPWert=char(3) then USBPIntWert:=32 else USBPIntWert:=128;
  end;
  if steuerung='LPT' then begin Form1.Edit52.Text:=inttostr(LPTCode);  Form1.Edit51.Text:=inttostr(LPTPort); Out32(LPTPort,LPTCode); end; //LPT-Code an LPT-Port ausgeben
  if steuerung='BATCH' then begin Form1.Edit52.Text:='off'; BatchOut;  Form1.Edit51.Text:=''; end; //LPT-Code als Batch ausgeben
  if steuerung='WLAN' then begin Form1.Edit52.Text:='off'; WLANOut;  Form1.Edit51.Text:=''; end; //LPT-Code als Batch ausgeben
  if steuerung='ARDUINO' then begin Form1.Edit52.Text:='off'; Form1.Edit51.Text:=''; end; //LPT-Code als Batch ausgeben
  if (steuerung='USB') and (usbtyp='KMTronic') then begin Form1.Edit52.Text:='USB'; Form1.Edit51.Text:=USBPort; USBOut; end; //USB-Code an USB-Port ausgeben
  if (steuerung='USB') and (usbtyp='Denkovi') then begin Form1.Edit52.Text:='USB'; Form1.Edit51.Text:=inttostr(DeviceIndex); USB2Out; end; //USB-Code an USB-Port ausgeben
  if (steuerung='USB') and (usbtyp='SainSmart') then begin Form1.Edit52.Text:='USB'; Form1.Edit51.Text:=inttostr(DeviceIndex); USB3Out; end; //USB-Code an USB-Port ausgeben
end;

procedure speichern(Form:TForm1; filename:string);
var i:integer;
begin
  AssignFile(myFile, filename);                // Rezeptdaten speichern
  ReWrite(myFile);
  for i:= 1 to 20 do WriteLn(myFile, (Form.FindComponent('Edit' + IntToStr(i)) as TEdit).Text);
  for i:= 31 to 50 do WriteLn(myFile, (Form.FindComponent('Edit' + IntToStr(i)) as TEdit).Text);
  for i:= 1 to 30 do WriteLn(myFile, (Form.FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Checked);
  for i:= 63 to 82 do WriteLn(myFile, (Form.FindComponent('Edit' + IntToStr(i)) as TEdit).Text);
  for i:= 17 to 26 do WriteLn(myFile, (Form.FindComponent('BitBtn' + IntToStr(i)) as TBitBtn).HelpKeyword);
  for i:= 46 to 75 do WriteLn(myFile, inttostr((Form.FindComponent('ComboBox' + IntToStr(i)) as TComboBox).Itemindex));
end;

procedure settings_speichern(Form:TForm1; filename:string);
begin
  WriteLn(myFile, Form.Button1.Caption);        // zusätzliche Settingsdate speichern (nur mit Rezeptdaten)
  WriteLn(myFile, Form.CheckBox33.Checked);
  WriteLn(myFile, Form.CheckBox34.Checked);
  WriteLn(myFile, Form.CheckBox36.Checked);
  WriteLn(myFile, Form.CheckBox37.Checked);
  WriteLn(myFile, Form.Button31.Caption);
  WriteLn(myFile, Form2.CheckBox1.Checked);
  WriteLn(myFile, Form2.CheckBox2.Checked);
  WriteLn(myFile, Form2.CheckBox3.Checked);
  WriteLn(myFile, Form2.Edit2.Text);
  WriteLn(myFile, Form.CheckBox41.Checked);
end;

procedure laden(Form:TForm1; filename:string);
var i: integer;
begin
  AssignFile(myFile, filename);                          // Rezeptdaten laden
  Reset(myFile);
  for i:= 1 to 20 do begin ReadLn(myFile, xwert); (Form.FindComponent('Edit' + IntToStr(i)) as TEdit).Text:=xwert; end;
  for i:= 31 to 50 do begin ReadLn(myFile, xwert); (Form.FindComponent('Edit' + IntToStr(i)) as TEdit).Text:=xwert; end;
  for i:= 1 to 30 do begin ReadLn(myFile, xwert); (Form.FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Checked:=strtobool(xwert); end;
  for i:= 63 to 72 do begin try ReadLn(myFile, xwert); except xwert:=''; end; (Form.FindComponent('Edit' + IntToStr(i)) as TEdit).Text:=xwert; end;
  for i:= 73 to 82 do begin try ReadLn(myFile, xwert); except xwert:='Rast '+inttostr(i-72); end; (Form.FindComponent('Edit' + IntToStr(i)) as TEdit).Text:=xwert; end;
  for i:= 17 to 26 do begin try ReadLn(myFile, xwert); except xwert:='Bei Rasttemperaturüberschreitung'; end; if xwert='' then xwert:='Bei Rasttemperaturüberschreitung'; (Form.FindComponent('BitBtn' + IntToStr(i)) as TBitBtn).HelpKeyword := xwert; ButtonChanged((Form.FindComponent('BitBtn' + IntToStr(i)) as TBitBtn)); end;
  for i:= 46 to 75 do begin try ReadLn(myFile, xwert); except xwert:='0'; end; if xwert='' then xwert:='0'; (Form.FindComponent('ComboBox' + IntToStr(i)) as TComboBox).Itemindex:=strtoint(xwert); end;
end;

procedure settings_laden(Form:TForm1; filename:string);
begin
  Timerstartbatstatus:=0;
  ReadLn(myFile, xwert); Form.Button1.Caption:=xwert;    // zusätzliche Settingsdate laden (nur mit Rezeptdaten)
  ReadLn(myFile, xwert); Form.CheckBox33.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox34.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox36.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.CheckBox37.Checked:=strtobool(xwert);
  ReadLn(myFile, xwert); Form.Button31.Caption:=xwert;
  ReadLn(myFile, xwert); if strtobool(xwert)=true then Timerstartbatstatus:=1;
  ReadLn(myFile, xwert); if strtobool(xwert)=true then Timerstartbatstatus:=2;
  ReadLn(myFile, xwert); if strtobool(xwert)=true then Timerstartbatstatus:=3;
  ReadLn(myFile, xwert); sensorverzoegerung:=xwert;
  ReadLn(myFile, xwert); Form.CheckBox41.Checked:=strtobool(xwert);
  gesamtanzeigegeaendert;
end;

procedure setup_speichern(Form:TForm1; filename:string);
var dummyfilename:string;
begin
  AssignFile(mySetup, filename);                // Setup speichern
  ReWrite(mySetup);
  WriteLn(mySetup,'Installationsverzeichnis;Standard');
  WriteLn(mySetup,'Steuerung über "BATCH", "USB", "LPT" oder "ARDUINO";'+Form.ComboBox1.Text);
  WriteLn(mySetup,'LPT-Port;'+Form.ComboBox8.Text);
  WriteLn(mySetup,'LPT-Heizung;'+Form.ComboBox9.Text);
  WriteLn(mySetup,'LPT-Ruehrwerk;'+Form.ComboBox10.Text);
  WriteLn(mySetup,'LPT-Pumpe;'+Form.ComboBox11.Text);
  WriteLn(mySetup,'LPT-Alarm;'+Form.ComboBox12.Text);
  WriteLn(mySetup,'USB-Karten-Typ "Denkovi", "KMTronic" oder "SainSmart";'+Form.ComboBox2.Text);
  WriteLn(mySetup,'Device-Index;'+Form.ComboBox16.Text);
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
  WriteLn(mySetup,'Einschaltpuls Stufe 1;'+Form.ComboBox14.Text);
  WriteLn(mySetup,'Ausschaltpuls Stufe 1;'+Form.ComboBox15.Text);
  WriteLn(mySetup,'Einschaltpuls Stufe 2;'+Form.ComboBox17.Text);
  WriteLn(mySetup,'Ausschaltpuls Stufe 2;'+Form.ComboBox18.Text);
  WriteLn(mySetup,'Einschaltpuls Stufe 3;'+Form.ComboBox19.Text);
  WriteLn(mySetup,'Ausschaltpuls Stufe 3;'+Form.ComboBox20.Text);
  WriteLn(mySetup,'Einschaltpuls Stufe 4;'+Form.ComboBox21.Text);
  WriteLn(mySetup,'Ausschaltpuls Stufe 4;'+Form.ComboBox22.Text);
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
  WriteLn(mySetup,'Pulstemperatur Stufe 1;'+Form.Edit83.Text);
  WriteLn(mySetup,'Pulstemperatur Stufe 2;'+Form.Edit84.Text);
  WriteLn(mySetup,'Pulstemperatur Stufe 3;'+Form.Edit85.Text);
  WriteLn(mySetup,'Pulstemperatur Stufe 4;'+Form.Edit86.Text);
  WriteLn(mySetup,'Abkühlrate pro Minute;'+Form.ComboBox44.Text);
  if Form.CheckBox32.Checked=true then WriteLn(mySetup,'Log-Datei schreiben;1') else WriteLn(mySetup,'Log-Datei schreiben;0');
  if Form.CheckBox42.Checked=true then WriteLn(mySetup,'Rührwerk mit Heizung koppeln;1') else WriteLn(mySetup,'Rührwerk mit Heizung koppeln;0');
  if Form.CheckBox43.Checked=true then WriteLn(mySetup,'Rührwerk bei Heizung durchgehend AN;1') else WriteLn(mySetup,'Rührwerk bei Heizung durchgehend AN;0');
  WriteLn(mySetup,'Rührwerk-Zeitabstand;'+stringreplace(Form.ComboBox45.Text,' ','€€€',[rfReplaceAll]));
  WriteLn(mySetup,'Kochtemperatur;'+Form.ComboBox34.Text);
  WriteLn(mySetup,'Temperaturkorrekturwert;'+Form.Edit93.Text);
  WriteLn(mySetup,'Temperaturkorrekturfaktor;'+Form.Edit94.Text);
  WriteLn(mySetup,'Fensterskalierungsfaktor;'+Form.Edit95.Text);
  if Form.CheckBox31.Checked=true then WriteLn(mySetup,'Arduino-Zusatzfunktionen;1') else WriteLn(mySetup,'Arduino-Zusatzfunktionen;0');
  dummyfilename:=stringreplace(Form.ComboBox46.Items.Strings[1],' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Funktionsbeschreibung 1;'+dummyfilename);
  dummyfilename:=stringreplace(Form.ComboBox46.Items.Strings[2],' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Funktionsbeschreibung 2;'+dummyfilename);
  dummyfilename:=stringreplace(Form.ComboBox46.Items.Strings[3],' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Funktionsbeschreibung 3;'+dummyfilename);
  dummyfilename:=stringreplace(Form.ComboBox46.Items.Strings[4],' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Funktionsbeschreibung 4;'+dummyfilename);
  dummyfilename:=stringreplace(Form.ComboBox46.Items.Strings[5],' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Funktionsbeschreibung 5;'+dummyfilename);
  dummyfilename:=stringreplace(Form.ComboBox46.Items.Strings[6],' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Funktionsbeschreibung 6;'+dummyfilename);
  dummyfilename:=stringreplace(Form.ComboBox46.Items.Strings[7],' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Funktionsbeschreibung 7;'+dummyfilename);
  dummyfilename:=stringreplace(Form.ComboBox46.Items.Strings[8],' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Funktionsbeschreibung 8;'+dummyfilename);
  dummyfilename:=stringreplace(Form.ComboBox46.Items.Strings[9],' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Funktionsbeschreibung 9;'+dummyfilename);
  dummyfilename:=stringreplace(Form.ComboBox46.Items.Strings[10],' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'Funktionsbeschreibung 10;'+dummyfilename);
  WriteLn(mySetup,'Temperaturmessung;'+Form.ComboBox39.Text);
  WriteLn(mySetup,'Arduino-Sensor-Typ;'+Form.ComboBox35.Text);
  WriteLn(mySetup,'Arduino-Port-Typ;'+Form.ComboBox38.Text);
  WriteLn(mySetup,'Arduino-USB-Port-Nummer;'+Form.ComboBox30.Text);
  WriteLn(mySetup,'Arduino-IP-Port-Nummer;'+Form.Edit96.Text);
  WriteLn(mySetup,'Arduino-UDP-Port-OUT;'+Form.ComboBox36.Text);
  WriteLn(mySetup,'Arduino-UDP-Port-IN;'+Form.ComboBox37.Text);
  if Form.CheckBox45.Checked=true then WriteLn(mySetup,'Arduino Parallelbetrieb;1') else WriteLn(mySetup,'Arduino Parallelbetrieb;0');
  if Form.CheckBox46.Checked=true then WriteLn(mySetup,'IP-Heizung;1') else WriteLn(mySetup,'IP-Heizung;0');
  if Form.CheckBox47.Checked=true then WriteLn(mySetup,'IP-Ruehrwerk;1') else WriteLn(mySetup,'IP-Ruehrwerk;0');
  if Form.CheckBox48.Checked=true then WriteLn(mySetup,'IP-Pumpe;1') else WriteLn(mySetup,'IP-Pumpe;0');
  if Form.CheckBox49.Checked=true then WriteLn(mySetup,'IP-Alarm;1') else WriteLn(mySetup,'IP-Alarm;0');
  WriteLn(mySetup,'IP-Heizung;'+Form.Edit97.Text);
  WriteLn(mySetup,'IP-Ruehrwerk;'+Form.Edit98.Text);
  WriteLn(mySetup,'IP-Pumpe;'+Form.Edit99.Text);
  WriteLn(mySetup,'IP-Alarm;'+Form.Edit100.Text);
  WriteLn(mySetup,'User-Name-Heizung;'+Form.Edit101.Text);
  WriteLn(mySetup,'User-Name-Ruehrwerk;'+Form.Edit102.Text);
  WriteLn(mySetup,'User-Name-Pumpe;'+Form.Edit103.Text);
  WriteLn(mySetup,'User-Name-Alarm;'+Form.Edit104.Text);
  WriteLn(mySetup,'Password-Heizung;'+Form.Edit105.Text);
  WriteLn(mySetup,'Password-Ruehrwerk;'+Form.Edit106.Text);
  WriteLn(mySetup,'Password-Pumpe;'+Form.Edit107.Text);
  WriteLn(mySetup,'Password-Alarm;'+Form.Edit108.Text);
  WriteLn(mySetup,'DIGITEMP-Port;'+Form.ComboBox42.Text);
  dummyfilename:=stringreplace(Form.ComboBox41.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'DIGITEMP-Takt;'+dummyfilename);
  dummyfilename:=stringreplace(Form.ComboBox76.Text,' ','€€€',[rfReplaceAll]);
  WriteLn(mySetup,'DIGITEMP-Takt;'+dummyfilename);
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
  Ein1:=strtoint(Form.ComboBox14.Text);
  Aus1:=strtoint(Form.ComboBox15.Text);
  Ein2:=strtoint(Form.ComboBox17.Text);
  Aus2:=strtoint(Form.ComboBox18.Text);
  Ein3:=strtoint(Form.ComboBox19.Text);
  Aus3:=strtoint(Form.ComboBox20.Text);
  Ein4:=strtoint(Form.ComboBox21.Text);
  Aus4:=strtoint(Form.ComboBox22.Text);
  Ein100:=strtoint(Form.ComboBox24.Text);
  Aus100:=strtoint(Form.ComboBox23.Text);
  GradientWert:=strtofloat(Form.ComboBox25.Text);
  Hysterese:=strtofloat(Form.ComboBox26.Text);
  Hysterese2:=strtofloat(Form.ComboBox29.Text);
  Aufheizrate:=strtofloat(Form.ComboBox27.Text);
  Abkuehlrate:=strtofloat(Form.ComboBox44.Text);
  If Steuerung='USB' then Form1.USB_Update_Tmr.Enabled:=true else Form1.USB_Update_Tmr.Enabled:=true;
  If Steuerung='BATCH' then Form1.Batch_Update_Tmr.Enabled:=true else Form1.Batch_Update_Tmr.Enabled:=true;
end;

procedure setup_laden(Form:TForm1; filename:string);
var i:integer;
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
      try Steuerung:=sl2[sl2.Count-1]; Form.Combobox1.ItemIndex := Form.Combobox1.Items.IndexOf(sl2[sl2.Count-1]); except Steuerung:='LPT'; end;
      Form1.ComboBox1Change(Form1);
      sl2.DelimitedText:=sl[2];
      try LPTPort:=strtoint(sl2[sl2.Count-1]); Form.Combobox8.ItemIndex := Form.Combobox8.Items.IndexOf(sl2[sl2.Count-1]); except LPTPort:=888; end;
      sl2.DelimitedText:=sl[3];
      try HWert:=strtoint(sl2[sl2.Count-1]); Form.Combobox9.ItemIndex := Form.Combobox9.Items.IndexOf(sl2[sl2.Count-1]); except HWert:=1; end;
      sl2.DelimitedText:=sl[4];
      try RWert:=strtoint(sl2[sl2.Count-1]); Form.Combobox10.ItemIndex := Form.Combobox10.Items.IndexOf(sl2[sl2.Count-1]); except RWert:=2; end;
      sl2.DelimitedText:=sl[5];
      try PWert:=strtoint(sl2[sl2.Count-1]); Form.Combobox11.ItemIndex := Form.Combobox11.Items.IndexOf(sl2[sl2.Count-1]); except PWert:=8; end;
      sl2.DelimitedText:=sl[6];
      try AWert:=strtoint(sl2[sl2.Count-1]); Form.Combobox12.ItemIndex := Form.Combobox12.Items.IndexOf(sl2[sl2.Count-1]); except AWert:=128; end;
      sl2.DelimitedText:=sl[7];
      try USBTyp:=sl2[sl2.Count-1]; Form.Combobox2.ItemIndex := Form.Combobox2.Items.IndexOf(sl2[sl2.Count-1]); except USBTyp:='Denkovi'; end;
      sl2.DelimitedText:=sl[8];
      try DeviceIndex:=strtoint(sl2[sl2.Count-1]); Form.Combobox16.ItemIndex := Form.Combobox16.Items.IndexOf(sl2[sl2.Count-1]); except DeviceIndex:=0; end;
      sl2.DelimitedText:=sl[9];
      try USBPort:=sl2[sl2.Count-1]; Form.Combobox7.ItemIndex := Form.Combobox7.Items.IndexOf(sl2[sl2.Count-1]); except USBPort:='COM3'; end;
      sl2.DelimitedText:=sl[10];
      try USBHWert:=sl2[sl2.Count-1][1]; Form.Combobox3.ItemIndex := Form.Combobox3.Items.IndexOf(sl2[sl2.Count-1]); dec(USBHWert, $30); except USBHWert:=char($01); end;
      sl2.DelimitedText:=sl[11];
      try USBRWert:=sl2[sl2.Count-1][1]; Form.Combobox4.ItemIndex := Form.Combobox4.Items.IndexOf(sl2[sl2.Count-1]); dec(USBRWert, $30); except USBRWert:=char($02); end;
      sl2.DelimitedText:=sl[12];
      try USBPWert:=sl2[sl2.Count-1][1]; Form.Combobox5.ItemIndex := Form.Combobox5.Items.IndexOf(sl2[sl2.Count-1]); dec(USBPWert, $30); except USBPWert:=char($03); end;
      sl2.DelimitedText:=sl[13];
      try USBAWert:=sl2[sl2.Count-1][1]; Form.Combobox6.ItemIndex := Form.Combobox6.Items.IndexOf(sl2[sl2.Count-1]); dec(USBAWert, $30); except USBAWert:=char($04); end;
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
      try TWert:=strtofloat(sl2[sl2.Count-1]); Form.Combobox13.ItemIndex := Form.Combobox13.Items.IndexOf(sl2[sl2.Count-1]); except TWert:=2.0; end;
      sl2.DelimitedText:=sl[23];
      try Ein1:=strtoint(sl2[sl2.Count-1]); Form.Combobox14.ItemIndex := Form.Combobox14.Items.IndexOf(sl2[sl2.Count-1]); except Ein1:=5; end;
      sl2.DelimitedText:=sl[24];
      try Aus1:=strtoint(sl2[sl2.Count-1]); Form.Combobox15.ItemIndex := Form.Combobox15.Items.IndexOf(sl2[sl2.Count-1]); except Aus1:=10; end;
      sl2.DelimitedText:=sl[25];
      try Ein2:=strtoint(sl2[sl2.Count-1]); Form.Combobox17.ItemIndex := Form.Combobox17.Items.IndexOf(sl2[sl2.Count-1]); except Ein2:=8; end;
      sl2.DelimitedText:=sl[26];
      try Aus2:=strtoint(sl2[sl2.Count-1]); Form.Combobox18.ItemIndex := Form.Combobox18.Items.IndexOf(sl2[sl2.Count-1]); except Aus2:=10; end;
      sl2.DelimitedText:=sl[27];
      try Ein3:=strtoint(sl2[sl2.Count-1]); Form.Combobox19.ItemIndex := Form.Combobox19.Items.IndexOf(sl2[sl2.Count-1]); except Ein3:=10; end;
      sl2.DelimitedText:=sl[28];
      try Aus3:=strtoint(sl2[sl2.Count-1]); Form.Combobox20.ItemIndex := Form.Combobox20.Items.IndexOf(sl2[sl2.Count-1]); except Aus3:=10; end;
      sl2.DelimitedText:=sl[29];
      try Ein4:=strtoint(sl2[sl2.Count-1]); Form.Combobox21.ItemIndex := Form.Combobox21.Items.IndexOf(sl2[sl2.Count-1]); except Ein4:=10; end;
      sl2.DelimitedText:=sl[30];
      try Aus4:=strtoint(sl2[sl2.Count-1]); Form.Combobox22.ItemIndex := Form.Combobox22.Items.IndexOf(sl2[sl2.Count-1]); except Aus4:=5; end;
      sl2.DelimitedText:=sl[31];
      try Ein100:=strtoint(sl2[sl2.Count-1]); Form.Combobox24.ItemIndex := Form.Combobox24.Items.IndexOf(sl2[sl2.Count-1]); except Ein100:=10; end;
      sl2.DelimitedText:=sl[32];
      try Aus100:=strtoint(sl2[sl2.Count-1]); Form.Combobox23.ItemIndex := Form.Combobox23.Items.IndexOf(sl2[sl2.Count-1]); except Aus100:=0; end;
      sl2.DelimitedText:=sl[33];
      try GradientWert:=strtofloat(sl2[sl2.Count-1]); Form.Combobox25.ItemIndex := Form.Combobox25.Items.IndexOf(sl2[sl2.Count-1]); except GradientWert:=0.5; end;
      sl2.DelimitedText:=sl[34];
      try GradientWert:=strtofloat(sl2[sl2.Count-1]); Form.Combobox26.ItemIndex := Form.Combobox26.Items.IndexOf(sl2[sl2.Count-1]); except GradientWert:=0.5; end;
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
      try Aufheizrate:=strtofloat(sl2[sl2.Count-1]); Form.Combobox27.ItemIndex := Form.Combobox27.Items.IndexOf(sl2[sl2.Count-1]); except Aufheizrate:=1.0; end;
      sl2.DelimitedText:=sl[41];
      try Relais4:=sl2[sl2.Count-1]; except Relais4:='Kühlung'; end;
      Form.Combobox28.ItemIndex := Form.Combobox28.Items.IndexOf('Heizung, Rührwerk, '+Relais4+', Alarm');
      sl2.DelimitedText:=sl[42];
      try Hysterese2:=strtofloat(sl2[sl2.Count-1]); Form.Combobox29.ItemIndex := Form.Combobox29.Items.IndexOf(sl2[sl2.Count-1]); except Hysterese2:=1.0; end;
      sl2.DelimitedText:=sl[43];
      try Temperaturrast:=strtoint(sl2[sl2.Count-1]);
      if Temperaturrast=1 then Form.Combobox31.ItemIndex := 0
      else if Temperaturrast=2 then Form.Combobox31.ItemIndex := 2
      else Form.Combobox31.ItemIndex := 1;
      except Form.Combobox31.ItemIndex := 0; end;
      Form1.ComboBox31Change(Form1);
      sl2.DelimitedText:=sl[44];
      try Form.Combobox30.ItemIndex := Form.Combobox30.Items.IndexOf(sl2[sl2.Count-1]); except Form.Combobox30.ItemIndex := 0; end;
      sl2.DelimitedText:=sl[45];
      try Form.Combobox32.ItemIndex := Form.Combobox32.Items.IndexOf(sl2[sl2.Count-1]); except Form.Combobox32.ItemIndex := 0; end;
      sl2.DelimitedText:=sl[46];
      try Form.Combobox33.ItemIndex := Form.Combobox33.Items.IndexOf(stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll])); except Form.Combobox33.ItemIndex := 0; end;
      sl2.DelimitedText:=sl[47];
      try Form.Edit83.Text:=sl2[sl2.Count-1]; except Form.Edit83.Text:='60'; end;
      sl2.DelimitedText:=sl[48];
      try Form.Edit84.Text:=sl2[sl2.Count-1]; except Form.Edit84.Text:='70'; end;
      sl2.DelimitedText:=sl[49];
      try Form.Edit85.Text:=sl2[sl2.Count-1]; except Form.Edit85.Text:='80'; end;
      sl2.DelimitedText:=sl[50];
      try Form.Edit86.Text:=sl2[sl2.Count-1]; except Form.Edit86.Text:='90'; end;
      sl2.DelimitedText:=sl[51];
      try Abkuehlrate:=strtofloat(sl2[sl2.Count-1]); Form.Combobox44.ItemIndex := Form.Combobox44.Items.IndexOf(sl2[sl2.Count-1]); except Abkuehlrate:=0.5; end;
      sl2.DelimitedText:=sl[52];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox32.Checked:=true else Form.CheckBox32.Checked:=false; except Form.CheckBox32.Checked:=false end;
      sl2.DelimitedText:=sl[53];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox42.Checked:=true else Form.CheckBox42.Checked:=false; except Form.CheckBox42.Checked:=false end;
      sl2.DelimitedText:=sl[54];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox43.Checked:=true else Form.CheckBox43.Checked:=false; except Form.CheckBox43.Checked:=false end;
      sl2.DelimitedText:=sl[55];
      try Form.Combobox45.ItemIndex := Form.Combobox45.Items.IndexOf(stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll])); except Form.ComboBox45.Text:='5 Sekunden'; end;
      sl2.DelimitedText:=sl[56];
      try Form.Combobox34.ItemIndex := Form.Combobox34.Items.IndexOf(sl2[sl2.Count-1]); except Form.Combobox7.ItemIndex := 1; end;
      sl2.DelimitedText:=sl[57];
      try Form.Edit93.Text := sl2[sl2.Count-1]; except Form.Edit93.Text := '0.0'; end;
      Form1.Edit93Exit(Form1);
      sl2.DelimitedText:=sl[58];
      try Form.Edit94.Text := sl2[sl2.Count-1]; except Form.Edit94.Text := '1.0'; end;
      Form1.Edit94Exit(Form1);
      sl2.DelimitedText:=sl[59];
      try Form.Edit95.Text := sl2[sl2.Count-1]; except Form.Edit95.Text := '1.0'; end;
      Form1.Edit95Exit(Form1);
      sl2.DelimitedText:=sl[60];
      try if sl2[sl2.Count-1]='1' then begin Form.BitBtn65.Visible:=true; Form.CheckBox31.Checked:=true end else begin Form.CheckBox31.Checked:=false; Form.BitBtn65.Visible:=false; end; except Form.CheckBox31.Checked:=false; Form.BitBtn65.Visible:=false; end;
      sl2.DelimitedText:=sl[61];
      try Form.ComboBox46.Items.Strings[1]:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox46.Items.Strings[1]:='Funktion 1'; end;
      sl2.DelimitedText:=sl[62];
      try Form.ComboBox46.Items.Strings[2]:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox46.Items.Strings[2]:='Funktion 2'; end;
      sl2.DelimitedText:=sl[63];
      try Form.ComboBox46.Items.Strings[3]:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox46.Items.Strings[3]:='Funktion 3'; end;
      sl2.DelimitedText:=sl[64];
      try Form.ComboBox46.Items.Strings[4]:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox46.Items.Strings[4]:='Funktion 4'; end;
      sl2.DelimitedText:=sl[65];
      try Form.ComboBox46.Items.Strings[5]:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox46.Items.Strings[5]:='Funktion 5'; end;
      sl2.DelimitedText:=sl[66];
      try Form.ComboBox46.Items.Strings[6]:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox46.Items.Strings[6]:='Funktion 6'; end;
      sl2.DelimitedText:=sl[67];
      try Form.ComboBox46.Items.Strings[7]:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox46.Items.Strings[7]:='Funktion 7'; end;
      sl2.DelimitedText:=sl[68];
      try Form.ComboBox46.Items.Strings[8]:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox46.Items.Strings[8]:='Funktion 8'; end;
      sl2.DelimitedText:=sl[69];
      try Form.ComboBox46.Items.Strings[9]:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox46.Items.Strings[9]:='Funktion 9'; end;
      sl2.DelimitedText:=sl[70];
      try Form.ComboBox46.Items.Strings[10]:=stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll]); except Form.ComboBox46.Items.Strings[10]:='Funktion 10'; end;
      for i:=47 to 75 do
      begin
        (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[1]:=Form.ComboBox46.Items.Strings[1];
        (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[2]:=Form.ComboBox46.Items.Strings[2];
        (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[3]:=Form.ComboBox46.Items.Strings[3];
        (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[4]:=Form.ComboBox46.Items.Strings[4];
        (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[5]:=Form.ComboBox46.Items.Strings[5];
        (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[6]:=Form.ComboBox46.Items.Strings[6];
        (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[7]:=Form.ComboBox46.Items.Strings[7];
        (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[8]:=Form.ComboBox46.Items.Strings[8];
        (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[9]:=Form.ComboBox46.Items.Strings[9];
        (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[10]:=Form.ComboBox46.Items.Strings[10];
      end;
      sl2.DelimitedText:=sl[71];
      try Steuerung:=sl2[sl2.Count-1]; Form.Combobox39.ItemIndex := Form.Combobox39.Items.IndexOf(sl2[sl2.Count-1]); except Form.ComboBox39.ItemIndex:=0; end;
      Form1.ComboBox39Change(Form1);
      sl2.DelimitedText:=sl[72];
      try Steuerung:=sl2[sl2.Count-1]; Form.Combobox35.ItemIndex := Form.Combobox35.Items.IndexOf(sl2[sl2.Count-1]); except Form.ComboBox35.ItemIndex:=0; end;
      sl2.DelimitedText:=sl[73];
      try Steuerung:=sl2[sl2.Count-1]; Form.Combobox38.ItemIndex := Form.Combobox38.Items.IndexOf(sl2[sl2.Count-1]); except Form.ComboBox38.ItemIndex:=0; end;
      sl2.DelimitedText:=sl[74];
      try Steuerung:=sl2[sl2.Count-1]; Form.Combobox30.ItemIndex := Form.Combobox30.Items.IndexOf(sl2[sl2.Count-1]); except Form.ComboBox30.ItemIndex:=0; end;
      sl2.DelimitedText:=sl[75];
      try Form.Edit96.Text := sl2[sl2.Count-1]; except Form.Edit96.Text := '192.168.178.222'; end;
      sl2.DelimitedText:=sl[76];
      try Steuerung:=sl2[sl2.Count-1]; Form.Combobox36.ItemIndex := Form.Combobox36.Items.IndexOf(sl2[sl2.Count-1]); except Form.ComboBox36.ItemIndex:=0; end;
      sl2.DelimitedText:=sl[77];
      try Steuerung:=sl2[sl2.Count-1]; Form.Combobox37.ItemIndex := Form.Combobox37.Items.IndexOf(sl2[sl2.Count-1]); except Form.ComboBox37.ItemIndex:=0; end;
      sl2.DelimitedText:=sl[78];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox45.Checked:=true else Form.CheckBox45.Checked:=false; except Form.CheckBox45.Checked:=false end;
      sl2.DelimitedText:=sl[79];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox46.Checked:=true else Form.CheckBox46.Checked:=false; except Form.CheckBox45.Checked:=false end;
      sl2.DelimitedText:=sl[80];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox47.Checked:=true else Form.CheckBox47.Checked:=false; except Form.CheckBox45.Checked:=false end;
      sl2.DelimitedText:=sl[81];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox48.Checked:=true else Form.CheckBox48.Checked:=false; except Form.CheckBox45.Checked:=false end;
      sl2.DelimitedText:=sl[82];
      try if sl2[sl2.Count-1]='1' then Form.CheckBox49.Checked:=true else Form.CheckBox49.Checked:=false; except Form.CheckBox45.Checked:=false end;
      sl2.DelimitedText:=sl[83];
      try Form.Edit97.Text := sl2[sl2.Count-1]; except Form.Edit97.Text := '192.168.178.56'; end;
      sl2.DelimitedText:=sl[84];
      try Form.Edit98.Text := sl2[sl2.Count-1]; except Form.Edit98.Text := '192.168.178.56'; end;
      sl2.DelimitedText:=sl[85];
      try Form.Edit99.Text := sl2[sl2.Count-1]; except Form.Edit99.Text := '192.168.178.56'; end;
      sl2.DelimitedText:=sl[86];
      try Form.Edit100.Text := sl2[sl2.Count-1]; except Form.Edit100.Text := '192.168.178.56'; end;
      sl2.DelimitedText:=sl[87];
      try Form.Edit101.Text := sl2[sl2.Count-1]; except Form.Edit101.Text := 'admin'; end;
      sl2.DelimitedText:=sl[88];
      try Form.Edit102.Text := sl2[sl2.Count-1]; except Form.Edit102.Text := 'admin'; end;
      sl2.DelimitedText:=sl[89];
      try Form.Edit103.Text := sl2[sl2.Count-1]; except Form.Edit103.Text := 'admin'; end;
      sl2.DelimitedText:=sl[90];
      try Form.Edit104.Text := sl2[sl2.Count-1]; except Form.Edit104.Text := 'admin'; end;
      sl2.DelimitedText:=sl[91];
      try Form.Edit105.Text := sl2[sl2.Count-1]; except Form.Edit105.Text := '1234'; end;
      sl2.DelimitedText:=sl[92];
      try Form.Edit106.Text := sl2[sl2.Count-1]; except Form.Edit106.Text := '1234'; end;
      sl2.DelimitedText:=sl[93];
      try Form.Edit107.Text := sl2[sl2.Count-1]; except Form.Edit107.Text := '1234'; end;
      sl2.DelimitedText:=sl[94];
      try Form.Edit108.Text := sl2[sl2.Count-1]; except Form.Edit108.Text := '1234'; end;
      sl2.DelimitedText:=sl[95];
      try Form.Combobox42.ItemIndex := Form.Combobox42.Items.IndexOf(sl2[sl2.Count-1]); except Form.Combobox42.ItemIndex := 0; end;
      sl2.DelimitedText:=sl[96];
      try Form.Combobox41.ItemIndex := Form.Combobox41.Items.IndexOf(stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll])); except Form.Combobox41.ItemIndex := 0; end;
      sl2.DelimitedText:=sl[97];
      try Form.Combobox76.ItemIndex := Form.Combobox76.Items.IndexOf(stringreplace(sl2[sl2.Count-1],'€€€',' ',[rfReplaceAll])); except Form.Combobox76.ItemIndex := 0; end;
      AusIst:=Aus1;
      EinIst:=Ein1;
      If Steuerung='USB' then Form1.USB_Update_Tmr.Enabled:=true;
      If Steuerung='BATCH' then Form1.Batch_Update_Tmr.Enabled:=true;
    finally
      sl2.Free;
    end;
  finally
    sl.Free;
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
      htime:=0;
      for i:= startpunkt to endpunkt-1 do
      begin
        if i>0 then s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[2,i-1]));
        s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[2,i]));
        if (i>startpunkt) and (StrToFloat(Form.StringGrid1.Cells[2,i])>0) then htime:=htime+StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i])-StrToDate(Form.StringGrid1.Cells[0,i-1])-StrToTime(Form.StringGrid1.Cells[1,i-1]);
      end;
      gtime:=StrToDate(Form.StringGrid1.Cells[0,endpunkt-1])+StrToTime(Form.StringGrid1.Cells[1,endpunkt-1])-StrToDate(Form.StringGrid1.Cells[0,startpunkt])-StrToTime(Form.StringGrid1.Cells[1,startpunkt]);
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
      rtime:=0;
      for i:= startpunkt to endpunkt-1 do
      begin
        if i>0 then s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[3,i-1]));
        s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[3,i]));
        if (i>startpunkt) and (StrToFloat(Form.StringGrid1.Cells[3,i])>0) then rtime:=rtime+StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i])-StrToDate(Form.StringGrid1.Cells[0,i-1])-StrToTime(Form.StringGrid1.Cells[1,i-1]);
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
      ptime:=0;
      for i:= startpunkt to endpunkt-1 do
      begin
        if i>0 then s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[4,i-1]));
        s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[4,i]));
        if (i>startpunkt) and (StrToFloat(Form.StringGrid1.Cells[4,i])>0) then ptime:=ptime+StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i])-StrToDate(Form.StringGrid1.Cells[0,i-1])-StrToTime(Form.StringGrid1.Cells[1,i-1]);
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
      atime:=0;
      for i:= startpunkt to endpunkt-1 do
      begin
        if i>0 then s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[5,i-1]));
        s2.AddXY(StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i]),StrToFloat(Form.StringGrid1.Cells[5,i]));
        if (i>startpunkt) and (StrToFloat(Form.StringGrid1.Cells[5,i])>0) then atime:=atime+StrToDate(Form.StringGrid1.Cells[0,i])+StrToTime(Form.StringGrid1.Cells[1,i])-StrToDate(Form.StringGrid1.Cells[0,i-1])-StrToTime(Form.StringGrid1.Cells[1,i-1]);
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
  if ComboBox39.Text='ARDUINO' then
  begin
    tfs:=arduinotfs;
  end
  else
  begin
    if FileExists(pfad+'Temperatur\' + tempdateiname) then else
    begin
      AssignFile(myFile, pfad+'Temperatur\' + tempdateiname);
      ReWrite(myFile);
      Writeln(myFile, '01.01.00 00:00:00;0;21.0');
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
    if ((sl3[sl3.Count-1]='85.0') or (sl3[sl3.Count-1]='85.00'))and ((Tempfloatold<84.0) or (Tempfloatold>86.0)) then
    begin
      warnungaus:=0;
      image7.Visible:=true;
      exit;
    end
    else if warnungaus<60 then
    begin
      warnungaus:=warnungaus+1;
    end
    else
    begin
      image7.Visible:=false;
    end;
    tfs:=sl3[sl3.Count-1];
  end;
  if Button20.Caption='Simulation Aus' then tfs:=FloatToStrF(((1000-Trackbar1.Position)/10),ffFixed,10,1);
  Tempfloatold:=strtofloat(tfs);
  Tempfloat:=strtofloat(tfs)*kfaktor+kwert;
  tf:=strtofloat(tfs)*kfaktor+kwert;
  tfs:=FloatToStrF(tf, ffFixed, 3, 1);
  Temperatur:=tfs+' °C';
  tfs:=floattostr(round(tf));
  if tf<0 then tfs:='0';
  if tf>100 then tfs:='100';
  Graphic:=pfad + 'Graphics\Thermo'+tfs+'.jpg';
  Image1.Picture.LoadFromFile(Graphic);
  panel1.Caption:=Temperatur;
  GetGradient(Sender);
  setup_speichern(Form1, pfad+'Setup\setup.txt');
  Schalten(Form1);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  SetLength(rasttemp, 10);
  SetLength(rastnull, 10);
  SetLength(funktionsinfo, 10);
  Alarmheizstatus:=0;
  arduinotfs:='21.0';
  Rezeptname:='noname';
  Relais4:='Kühlung';
  rast:=0;
  Form1.Top:=20;
  Form1.Left:=20;
  kwert:=0;
  kfaktor:=1;
  pfad:=ExtractFilePath(ParamStr(0));
  OpenDialog1.InitialDir:=pfad+'Rezepte';
  SaveDialog1.InitialDir:=pfad+'Rezepte';
  ser:=TBlockserial.Create;
  ser.RaiseExcept:=False;
  self.DoubleBuffered:=true;
  PageControl1.ActivePage:=TabSheet1;
  PageControl2.ActivePage:=TabSheet6;
  Application.HintHidePause := 5000;
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
    Writeln(myFile, '01.01.00 00:00:00;0;21.0');
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
  StartTimer.Enabled:=true;
  Form1.ComboBox28Change(Sender);
  Form1.ComboBox1Change(Sender);
  Form1.ComboBox30Change(Sender);
  Form1.ComboBox32Change(Sender);
  Form1.ComboBox33Change(Sender);
  form1.Caption:='Brauerei '+ Version;
  if FileExists(pfad+'Setup\settings.txt') then
  begin
    laden(Form1, pfad+'Setup\settings.txt');
    settings_laden(Form1, pfad+'Setup\settings.txt');
    CloseFile(myFile);
  end;
  PageControl1Change(Sender);
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if DeleteFile(SaveDialog1.FileName) then MyMessageDlgPos('Rezept wurde überschrieben!', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
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
  Form1.Button30Click(Sender);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i: integer;
begin
  if (Form3.BitBtn1.HelpKeyword='true') and (start=false) and (pause=false) then
  begin
    if (FileExists(Form3.Edit1.Text)) then
    begin
      laden(Form1, Form3.Edit1.Text);
     	Rezeptname:= changefileext(ExtractFileName(Form3.Edit1.Text),'');   //hinzu
      form1.Caption:='Brauerei '+ Version + ' - ' +  Rezeptname; //Ausgabe des gespeicherten Rezepts
      CloseFile(myFile);
      Form3.Edit1.Text:='';
    end
    else if (FileExists(Form3.Edit2.Text)) then
    begin
      laden(Form1, Form3.Edit2.Text);
     	Rezeptname:= changefileext(ExtractFileName(Form3.Edit2.Text),'');   //hinzu
      form1.Caption:='Brauerei '+ Version + ' - ' +  Rezeptname; //Ausgabe des gespeicherten Rezepts
      CloseFile(myFile);
      Form3.Edit2.Text:='';
    end
    else if (FileExists(Form3.Edit3.Text)) then
    begin
      laden(Form1, Form3.Edit3.Text);
     	Rezeptname:= changefileext(ExtractFileName(Form3.Edit3.Text),'');   //hinzu
      form1.Caption:='Brauerei '+ Version + ' - ' +  Rezeptname; //Ausgabe des gespeicherten Rezepts
      CloseFile(myFile);
      Form3.Edit3.Text:='';
    end
    else if (FileExists(Form3.Edit4.Text)) then
    begin
      laden(Form1, Form3.Edit4.Text);
     	Rezeptname:= changefileext(ExtractFileName(Form3.Edit4.Text),'');   //hinzu
      form1.Caption:='Brauerei '+ Version + ' - ' +  Rezeptname; //Ausgabe des gespeicherten Rezepts
      CloseFile(myFile);
      Form3.Edit4.Text:='';
    end
    else if (FileExists(Form3.Edit5.Text)) then
    begin
      laden(Form1, Form3.Edit5.Text);
     	Rezeptname:= changefileext(ExtractFileName(Form3.Edit5.Text),'');   //hinzu
      form1.Caption:='Brauerei '+ Version + ' - ' +  Rezeptname; //Ausgabe des gespeicherten Rezepts
      CloseFile(myFile);
      Form3.Edit5.Text:='';
    end
    else
    begin
      Form1.BitBtn3Click(Sender);
      exit;
    end;
  end;
  if (CheckBox1.Checked=false) and (CheckBox2.Checked=false) and (CheckBox3.Checked=false) and (CheckBox4.Checked=false) and (CheckBox5.Checked=false) and (CheckBox6.Checked=false) and
  (CheckBox7.Checked=false) and (CheckBox8.Checked=false) and (CheckBox9.Checked=false) and (CheckBox10.Checked=false) then exit;
  TimerHEin.Interval:=1000;
  TimerHAus.Interval:=1000;
  TimerHSet.Enabled:=true;
  TimerKEin.Interval:=1000;
  TimerKAus.Interval:=1000;
  TimerRSet.Enabled:=true;
  TimerREin.Interval:=1000;
  TimerRAus.Interval:=1000;
  if relais4='Kühlung' then TimerKSet.Enabled:=true;
  BitBtn16.Enabled:=false;
  Form1.Button30Click(Sender);
  if start=false then
  begin
    if pause=false then
    begin
      For i:=1 to 10 do Funktionsinfo[i]:=false;
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
      if (CheckBox1.Checked=true) and (Edit2.Text='0') then begin Rastnull[1]:=true; Rastnullges:=true; end else Rastnull[1]:=false;
      if (CheckBox2.Checked=true) and (Edit4.Text='0') then begin Rastnull[2]:=true; Rastnullges:=true; end else Rastnull[2]:=false;
      if (CheckBox3.Checked=true) and (Edit6.Text='0') then begin Rastnull[3]:=true; Rastnullges:=true; end else Rastnull[3]:=false;
      if (CheckBox4.Checked=true) and (Edit8.Text='0') then begin Rastnull[4]:=true; Rastnullges:=true; end else Rastnull[4]:=false;
      if (CheckBox5.Checked=true) and (Edit10.Text='0') then begin Rastnull[5]:=true; Rastnullges:=true; end else Rastnull[5]:=false;
      if (CheckBox6.Checked=true) and (Edit12.Text='0') then begin Rastnull[6]:=true; Rastnullges:=true; end else Rastnull[6]:=false;
      if (CheckBox7.Checked=true) and (Edit14.Text='0') then begin Rastnull[7]:=true; Rastnullges:=true; end else Rastnull[7]:=false;
      if (CheckBox8.Checked=true) and (Edit16.Text='0') then begin Rastnull[8]:=true; Rastnullges:=true; end else Rastnull[8]:=false;
      if (CheckBox9.Checked=true) and (Edit18.Text='0') then begin Rastnull[9]:=true; Rastnullges:=true; end else Rastnull[9]:=false;
      if (CheckBox10.Checked=true) and (Edit20.Text='0') then begin Rastnull[10]:=true; Rastnullges:=true; end else Rastnull[10]:=false;
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
      for i:= 1 to 10 do (FindComponent('Gauge' + IntToStr(i)) as TGauge).Progress := 0;
      for i:= 1 to 10 do Rasttemp[1]:=false;
      Rastende:=false;
      StartTemp:=round(TempFloat);
      for i:= 1 to 10 do
      begin
        if (FindComponent('BitBtn' + IntToStr(16+i)) as TBitBtn).HelpKeyword = 'Bei Rasttemperaturüberschreitung' then
           (FindComponent('Gauge' + IntToStr(i)) as TGauge).BackColor := clRed
        else if (FindComponent('BitBtn' + IntToStr(16+i)) as TBitBtn).HelpKeyword = 'Bei Rasttemperaturunterschreitung' then
           (FindComponent('Gauge' + IntToStr(i)) as TGauge).BackColor := clSkyBlue
        else
           (FindComponent('Gauge' + IntToStr(i)) as TGauge).BackColor := clWhite
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
    end;
    restrastzeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
    if (restrastzeit<>0) or (rastnullges=true) then
    begin
      Timer2.Enabled:=true;
      Panel9.Enabled:=false;
      Panel11.Enabled:=false;
      Panel15.Visible:=false;
      Button8.Enabled:=false;
      Button9.Enabled:=false;
      if relais4='Kühlung' then Button10.Enabled:=false;
      Button11.Enabled:=false;
      BitBtn8.Enabled:=false;
      BitBtn9.Enabled:=false;
      BitBtn12.Enabled:=false;
      TabSheet4.TabVisible:=false;
      TabSheet5.TabVisible:=false;
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
var i,zeitfaktor,buttonSelected:integer;
begin
  if CheckBox41.Checked=true then
  begin
    if heizung<>0 then heizcounter:=heizcounter+1 else heizcounter:=0;
    if heizcounter=1 then alarmtemp:=tempfloat
    else if heizcounter>1 then
    begin
      if tempfloat<alarmtemp-2 then
      begin
        Form1.BitBtn2Click(Sender);
        Form1.TimerAEinTimer(Sender);
        buttonSelected:=MyMessageDlgPos('Heizung scheint ausgefallen zu sein!', mtWarning, [mbOK,mbAbort], ['Ok', 'Abbruch'], Form1.Left, 320, Form1.Top, 250);
        heizcounter:=0;
        Form1.BitBtn1Click(Sender);
        Form1.TimerAAusTimer(Sender);
        TimerAEin.Enabled:=false;
        TimerAAus.Enabled:=false;
        if buttonSelected=mrAbort then CheckBox41.Checked:=false;
      end;
      if tempfloat>alarmtemp then alarmtemp:=tempfloat;
    end;
  end;
  if Combobox30.Text='Minuten' then zeitfaktor:=1 else zeitfaktor:=60;
  DecimalSeparator:='.';
  if AlarmEin=true then
  else if (Edit21.Text<>'0') or (Rastnull[1]=true) then
  begin
    if BitBtn17.HelpKeyword='Bei Rasttemperaturüberschreitung' then Temperaturrast:=1;
    if BitBtn17.HelpKeyword='Temperaturunabhängig' then Temperaturrast:=0;
    if BitBtn17.HelpKeyword='Bei Rasttemperaturunterschreitung' then Temperaturrast:=2;
    if Rasttemp[1]=false then
    begin
      if ComboBox46.ItemIndex>0 then Funktionsinfo[ComboBox46.ItemIndex]:=true;
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit1.Text);
      if Temperaturrast=0 then Rasttemp[1]:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit1.Text) then Rasttemp[1]:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit1.Text) then Rasttemp[1]:=true;// else Timer2.Enabled:=false;
    if (Rasttemp[1]=true) and (ComboBox56.ItemIndex>0) then Funktionsinfo[ComboBox56.ItemIndex]:=true;
    zeit2:=strtoint(Edit2.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp[1]=true) then Edit21.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull[1]=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge1.Progress:=fortschritt;
    rast:=1;
    CheckBox1.Color:=clInfoBk;
    if Rasttemp[1]=true then Rastnull[1]:=false;
    if (Edit21.Text='0') and (Rastnull[1]=false) and (ComboBox66.ItemIndex>0) then Funktionsinfo[ComboBox66.ItemIndex]:=true;
    if (Edit21.Text='0') and (CheckBox11.Checked=true) and (Rastnull[1]=false) then AlarmEin:=true;
  end
  else if (Edit22.Text<>'0') or (Rastnull[2]=true) then
  begin
    if BitBtn18.HelpKeyword='Bei Rasttemperaturüberschreitung' then Temperaturrast:=1;
    if BitBtn18.HelpKeyword='Temperaturunabhängig' then Temperaturrast:=0;
    if BitBtn18.HelpKeyword='Bei Rasttemperaturunterschreitung' then Temperaturrast:=2;
    if Rasttemp[2]=false then
    begin
      if ComboBox47.ItemIndex>0 then Funktionsinfo[ComboBox47.ItemIndex]:=true;
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit3.Text);
      if Temperaturrast=0 then Rasttemp[2]:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit3.Text) then Rasttemp[2]:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit3.Text) then Rasttemp[2]:=true;// else Timer2.Enabled:=false;
    if (Rasttemp[2]=true) and (ComboBox57.ItemIndex>0) then Funktionsinfo[ComboBox57.ItemIndex]:=true;
    zeit2:=strtoint(Edit4.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp[2]=true) then Edit22.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull[2]=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge2.Progress:=fortschritt;
    rast:=2;
    CheckBox2.Color:=clInfoBk;
    for i:= 1 to rast-1 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clMoneyGreen;
    if Rasttemp[2]=true then Rastnull[2]:=false;
    if (Edit22.Text='0') and (Rastnull[2]=false) and (ComboBox67.ItemIndex>0) then Funktionsinfo[ComboBox67.ItemIndex]:=true;
    if (Edit22.Text='0') and (CheckBox12.Checked=true) and (Rastnull[2]=false) then AlarmEin:=true;
  end
  else if (Edit23.Text<>'0') or (Rastnull[3]=true) then
  begin
    if BitBtn19.HelpKeyword='Bei Rasttemperaturüberschreitung' then Temperaturrast:=1;
    if BitBtn19.HelpKeyword='Temperaturunabhängig' then Temperaturrast:=0;
    if BitBtn19.HelpKeyword='Bei Rasttemperaturunterschreitung' then Temperaturrast:=2;
    if Rasttemp[3]=false then
    begin
      if ComboBox48.ItemIndex>0 then Funktionsinfo[ComboBox48.ItemIndex]:=true;
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit5.Text);
      if Temperaturrast=0 then Rasttemp[3]:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit5.Text) then Rasttemp[3]:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit5.Text) then Rasttemp[3]:=true;// else Timer2.Enabled:=false;
    if (Rasttemp[3]=true) and (ComboBox58.ItemIndex>0) then Funktionsinfo[ComboBox58.ItemIndex]:=true;
    zeit2:=strtoint(Edit6.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp[3]=true) then Edit23.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull[3]=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge3.Progress:=fortschritt;
    rast:=3;
    CheckBox3.Color:=clInfoBk;
    for i:= 1 to rast-1 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clMoneyGreen;
    if Rasttemp[3]=true then Rastnull[3]:=false;
    if (Edit23.Text='0') and (Rastnull[3]=false) and (ComboBox68.ItemIndex>0) then Funktionsinfo[ComboBox68.ItemIndex]:=true;
    if (Edit23.Text='0') and (CheckBox13.Checked=true) and (Rastnull[3]=false) then AlarmEin:=true;
  end
  else if (Edit24.Text<>'0') or (Rastnull[4]=true) then
  begin
    if BitBtn20.HelpKeyword='Bei Rasttemperaturüberschreitung' then Temperaturrast:=1;
    if BitBtn20.HelpKeyword='Temperaturunabhängig' then Temperaturrast:=0;
    if BitBtn20.HelpKeyword='Bei Rasttemperaturunterschreitung' then Temperaturrast:=2;
    if Rasttemp[4]=false then
    begin
      if ComboBox49.ItemIndex>0 then Funktionsinfo[ComboBox49.ItemIndex]:=true;
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit7.Text);
      if Temperaturrast=0 then Rasttemp[4]:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit7.Text) then Rasttemp[4]:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit7.Text) then Rasttemp[4]:=true;// else Timer2.Enabled:=false;
    if (Rasttemp[4]=true) and (ComboBox59.ItemIndex>0) then Funktionsinfo[ComboBox59.ItemIndex]:=true;
    zeit2:=strtoint(Edit8.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp[4]=true) then Edit24.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull[4]=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge4.Progress:=fortschritt;
    rast:=4;
    CheckBox4.Color:=clInfoBk;
    for i:= 1 to rast-1 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clMoneyGreen;
    if Rasttemp[4]=true then Rastnull[4]:=false;
    if (Edit24.Text='0') and (Rastnull[4]=false) and (ComboBox69.ItemIndex>0) then Funktionsinfo[ComboBox69.ItemIndex]:=true;
    if (Edit24.Text='0') and (CheckBox14.Checked=true) and (Rastnull[4]=false) then AlarmEin:=true;
  end
  else if (Edit25.Text<>'0') or (Rastnull[5]=true) then
  begin
    if BitBtn21.HelpKeyword='Bei Rasttemperaturüberschreitung' then Temperaturrast:=1;
    if BitBtn21.HelpKeyword='Temperaturunabhängig' then Temperaturrast:=0;
    if BitBtn21.HelpKeyword='Bei Rasttemperaturunterschreitung' then Temperaturrast:=2;
    if Rasttemp[5]=false then
    begin
      if ComboBox50.ItemIndex>0 then Funktionsinfo[ComboBox50.ItemIndex]:=true;
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit9.Text);
      if Temperaturrast=0 then Rasttemp[5]:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit9.Text) then Rasttemp[5]:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit9.Text) then Rasttemp[5]:=true;// else Timer2.Enabled:=false;
    if (Rasttemp[5]=true) and (ComboBox60.ItemIndex>0) then Funktionsinfo[ComboBox60.ItemIndex]:=true;
    zeit2:=strtoint(Edit10.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp[5]=true) then Edit25.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull[5]=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge5.Progress:=fortschritt;
    rast:=5;
    CheckBox5.Color:=clInfoBk;
    for i:= 1 to rast-1 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clMoneyGreen;
    if Rasttemp[5]=true then Rastnull[5]:=false;
    if (Edit25.Text='0') and (Rastnull[5]=false) and (ComboBox70.ItemIndex>0) then Funktionsinfo[ComboBox70.ItemIndex]:=true;
    if (Edit25.Text='0') and (CheckBox15.Checked=true) and (Rastnull[5]=false) then AlarmEin:=true;
  end
  else if (Edit26.Text<>'0') or (Rastnull[6]=true) then
  begin
    if BitBtn22.HelpKeyword='Bei Rasttemperaturüberschreitung' then Temperaturrast:=1;
    if BitBtn22.HelpKeyword='Temperaturunabhängig' then Temperaturrast:=0;
    if BitBtn22.HelpKeyword='Bei Rasttemperaturunterschreitung' then Temperaturrast:=2;
    if Rasttemp[6]=false then
    begin
      if ComboBox51.ItemIndex>0 then Funktionsinfo[ComboBox51.ItemIndex]:=true;
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit11.Text);
      if Temperaturrast=0 then Rasttemp[6]:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit11.Text) then Rasttemp[6]:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit11.Text) then Rasttemp[6]:=true;// else Timer2.Enabled:=false;
    if (Rasttemp[6]=true) and (ComboBox61.ItemIndex>0) then Funktionsinfo[ComboBox61.ItemIndex]:=true;
    zeit2:=strtoint(Edit12.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp[6]=true) then Edit26.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull[6]=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge6.Progress:=fortschritt;
    rast:=6;
    CheckBox6.Color:=clInfoBk;
    for i:= 1 to rast-1 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clMoneyGreen;
    if Rasttemp[6]=true then Rastnull[6]:=false;
    if (Edit26.Text='0') and (Rastnull[6]=false) and (ComboBox71.ItemIndex>0) then Funktionsinfo[ComboBox71.ItemIndex]:=true;
    if (Edit26.Text='0') and (CheckBox16.Checked=true) and (Rastnull[6]=false) then AlarmEin:=true;
  end
  else if (Edit27.Text<>'0') or (Rastnull[7]=true) then
  begin
    if BitBtn23.HelpKeyword='Bei Rasttemperaturüberschreitung' then Temperaturrast:=1;
    if BitBtn23.HelpKeyword='Temperaturunabhängig' then Temperaturrast:=0;
    if BitBtn23.HelpKeyword='Bei Rasttemperaturunterschreitung' then Temperaturrast:=2;
    if Rasttemp[7]=false then
    begin
      if ComboBox52.ItemIndex>0 then Funktionsinfo[ComboBox52.ItemIndex]:=true;
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit13.Text);
      if Temperaturrast=0 then Rasttemp[7]:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit13.Text) then Rasttemp[7]:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit13.Text) then Rasttemp[7]:=true;// else Timer2.Enabled:=false;
    if (Rasttemp[7]=true) and (ComboBox62.ItemIndex>0) then Funktionsinfo[ComboBox62.ItemIndex]:=true;
    zeit2:=strtoint(Edit14.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp[7]=true) then Edit27.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull[7]=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge7.Progress:=fortschritt;
    rast:=7;
    CheckBox7.Color:=clInfoBk;
    for i:= 1 to rast-1 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clMoneyGreen;
    if Rasttemp[7]=true then Rastnull[7]:=false;
    if (Edit27.Text='0') and (Rastnull[7]=false) and (ComboBox72.ItemIndex>0) then Funktionsinfo[ComboBox72.ItemIndex]:=true;
    if (Edit27.Text='0') and (CheckBox17.Checked=true) and (Rastnull[7]=false) then AlarmEin:=true;
  end
  else if (Edit28.Text<>'0') or (Rastnull[8]=true) then
  begin
    if BitBtn24.HelpKeyword='Bei Rasttemperaturüberschreitung' then Temperaturrast:=1;
    if BitBtn24.HelpKeyword='Temperaturunabhängig' then Temperaturrast:=0;
    if BitBtn24.HelpKeyword='Bei Rasttemperaturunterschreitung' then Temperaturrast:=2;
    if Rasttemp[8]=false then
    begin
      if ComboBox53.ItemIndex>0 then Funktionsinfo[ComboBox53.ItemIndex]:=true;
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit15.Text);
      if Temperaturrast=0 then Rasttemp[8]:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit15.Text) then Rasttemp[8]:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit15.Text) then Rasttemp[8]:=true;// else Timer2.Enabled:=false;
    if (Rasttemp[8]=true) and (ComboBox63.ItemIndex>0) then Funktionsinfo[ComboBox63.ItemIndex]:=true;
    zeit2:=strtoint(Edit16.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp[8]=true) then Edit28.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull[8]=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge8.Progress:=fortschritt;
    rast:=8;
    CheckBox8.Color:=clInfoBk;
    for i:= 1 to rast-1 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clMoneyGreen;
    if Rasttemp[8]=true then Rastnull[8]:=false;
    if (Edit28.Text='0') and (Rastnull[8]=false) and (ComboBox73.ItemIndex>0) then Funktionsinfo[ComboBox73.ItemIndex]:=true;
    if (Edit28.Text='0') and (CheckBox18.Checked=true) and (Rastnull[8]=false) then AlarmEin:=true;
  end
  else if (Edit29.Text<>'0') or (Rastnull[9]=true) then
  begin
    if BitBtn25.HelpKeyword='Bei Rasttemperaturüberschreitung' then Temperaturrast:=1;
    if BitBtn25.HelpKeyword='Temperaturunabhängig' then Temperaturrast:=0;
    if BitBtn25.HelpKeyword='Bei Rasttemperaturunterschreitung' then Temperaturrast:=2;
    if Rasttemp[9]=false then
    begin
      if ComboBox54.ItemIndex>0 then Funktionsinfo[ComboBox54.ItemIndex]:=true;
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit17.Text);
      if Temperaturrast=0 then Rasttemp[9]:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit17.Text) then Rasttemp[9]:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit17.Text) then Rasttemp[9]:=true;// else Timer2.Enabled:=false;
    if (Rasttemp[9]=true) and (ComboBox64.ItemIndex>0) then Funktionsinfo[ComboBox64.ItemIndex]:=true;
    zeit2:=strtoint(Edit18.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp[9]=true) then Edit29.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull[9]=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge9.Progress:=fortschritt;
    rast:=9;
    CheckBox9.Color:=clInfoBk;
    for i:= 1 to rast-1 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clMoneyGreen;
    if Rasttemp[9]=true then Rastnull[9]:=false;
    if (Edit29.Text='0') and (Rastnull[9]=false) and (ComboBox74.ItemIndex>0) then Funktionsinfo[ComboBox74.ItemIndex]:=true;
    if (Edit29.Text='0') and (CheckBox19.Checked=true) and (Rastnull[9]=false) then AlarmEin:=true;
  end
  else if (Edit30.Text<>'0') or (Rastnull[10]=true) then
  begin
    if BitBtn26.HelpKeyword='Bei Rasttemperaturüberschreitung' then Temperaturrast:=1;
    if BitBtn26.HelpKeyword='Temperaturunabhängig' then Temperaturrast:=0;
    if BitBtn26.HelpKeyword='Bei Rasttemperaturunterschreitung' then Temperaturrast:=2;
    if Rasttemp[10]=false then
    begin
      if ComboBox55.ItemIndex>0 then Funktionsinfo[ComboBox55.ItemIndex]:=true;
      zeit3:=GetTickCount;
      Solltemp:=strtoint(Edit19.Text);
      if Temperaturrast=0 then Rasttemp[10]:=true;
    end;
    restrastzeit:=GetTickCount-zeit3;
    if Temperaturrast=1 then if TempFloat>=strtoint(Edit19.Text) then Rasttemp[10]:=true;// else Timer2.Enabled:=false;
    if Temperaturrast=2 then if TempFloat<=strtoint(Edit19.Text) then Rasttemp[10]:=true;// else Timer2.Enabled:=false;
    if (Rasttemp[10]=true) and (ComboBox65.ItemIndex>0) then Funktionsinfo[ComboBox65.ItemIndex]:=true;
    zeit2:=strtoint(Edit20.Text)*60000*zeitfaktor;
    if (start=true) and (Rasttemp[10]=true) then Edit30.Text:=inttostr(round((zeit2-restrastzeit+29999)/60000/zeitfaktor));
    if Rastnull[10]=false then fortschritt:=round(restrastzeit/zeit2*100) else fortschritt:=0;
    Gauge10.Progress:=fortschritt;
    rast:=10;
    CheckBox10.Color:=clInfoBk;
    for i:= 1 to rast-1 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clMoneyGreen;
    if Rasttemp[10]=true then Rastnull[10]:=false;
    if (Edit30.Text='0') and (Rastnull[10]=false) and (ComboBox75.ItemIndex>0) then Funktionsinfo[ComboBox75.ItemIndex]:=true;
    if (Edit30.Text='0') and (CheckBox20.Checked=true) and (Rastnull[10]=false) then AlarmEin:=true;
  end
  else
  begin
    Form1.TimerRAusTimer(Sender);
    TimerREin.Enabled:=false;
    restrastzeit:=0;
    Rastende:=true;
  end;
  for i:= 1 to rast-1 do Rasttemp[i]:=true;
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
  if solltemp<strtoint(Edit83.Text) then
  begin EinIst:=Ein1; AusIst:=Aus1; end
  else if solltemp<strtoint(Edit84.Text) then
  begin EinIst:=Ein2; AusIst:=Aus2; end
  else if solltemp<strtoint(Edit85.Text) then
  begin EinIst:=Ein3; AusIst:=Aus3; end
  else if solltemp<strtoint(Edit86.Text) then
  begin EinIst:=Ein4; AusIst:=Aus4; end
  else
  begin EinIst:=Ein100; AusIst:=Aus100; end;
  Panel4.Caption:=FloatToStrF(solltemp,ffFixed,10,1)+' °C';
  if (restrastzeit<=0) and (start=true) and (Rastende=true) then Form1.BitBtn3Click(Sender);
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
  TimerRSet.Enabled:=false;
  for i:=1 to 10 do Rasttemp[i]:=false;
  Panel9.Enabled:=true;
  Panel11.Enabled:=true;
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
  Label136.Visible:=false;
  TabSheet4.TabVisible:=true;
  TabSheet5.TabVisible:=true;
  Graphic:=pfad + 'Graphics\Automatik-inaktiv.bmp';
  Image5.Picture.LoadFromFile(Graphic);
  BitBtn1.Enabled:=true;
  BitBtn2.Enabled:=true;
  TimerTimer.Enabled:=false;
  Timer3.Enabled:=false;
  Form2.Label5.Caption:='false';
  Form1.GesUpdateTimer.Enabled:=false;
  GesUpdateTimerTimer(Sender);
  if (stop=false) and (Form3.BitBtn1.HelpKeyword='false') then
  begin
    LogTimer.Enabled:=false;
    LogUpdateTimer.Enabled:=false;
    Button23.Caption:='AutoUpdate Ein';
    if checkbox32.Checked=true then CloseFile(myLogFile);
    MyMessageDlgPos('Brauvorgang wurde beendet ' + #13 + '- mit OK fortsetzen!', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
  end;
  for i:= 1 to 10 do (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Color := clBtnFace;
  for i:= 1 to 10 do (FindComponent('Gauge' + IntToStr(i)) as TGauge).BackColor := clWhite;
  Panel15.Visible:=true;
  stop:=true;
  pause:=false;
  start:=false;
  for i:= 1 to 10 do Funktionsinfo[i]:=false;
  rast:=0;
  Form1.BitBtn11Click(Form1);
  if (Form3.BitBtn1.HelpKeyword='true') and (Multistart<5) then
  begin
    Multistart:=Multistart+1;
    Form1.BitBtn1Click(Sender);
  end
  else if (Form3.BitBtn1.HelpKeyword='true') and (Multistart>=5) then
  begin
    Form3.BitBtn1.HelpKeyword:='false';
    LogTimer.Enabled:=false;
    LogUpdateTimer.Enabled:=false;
    Button23.Caption:='AutoUpdate Ein';
    if checkbox32.Checked=true then CloseFile(myLogFile);
    MyMessageDlgPos('Brauvorgang wurde beendet ' + #13 + '- mit OK fortsetzen!', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
    Form3.Edit1.Text:='';
    Form3.Edit2.Text:='';
    Form3.Edit3.Text:='';
    Form3.Edit4.Text:='';
    Form3.Edit5.Text:='';
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if start=true then
  begin
    Form1.TimerHAusTimer(Sender);
    if Relais4='Kühlung' then Form1.TimerKAusTimer(Sender);
    if TimerKEin.Enabled=true then begin PauseLogTimerKEin:=true; TimerKEin.Enabled:=false; end;
    if TimerKAus.Enabled=true then begin PauseLogTimerKAus:=true; TimerKAus.Enabled:=false; end;
    if TimerKSet.Enabled=true then begin PauseLogTimerKSet:=true; TimerKSet.Enabled:=false; end;
    if TimerHEin.Enabled=true then begin PauseLogTimerHEin:=true; TimerHEin.Enabled:=false; end;
    if TimerHAus.Enabled=true then begin PauseLogTimerHAus:=true; TimerHAus.Enabled:=false; end;
    if TimerHSet.Enabled=true then begin PauseLogTimerHSet:=true; TimerHSet.Enabled:=false; end;
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
    if Rasttemp[1]=false then begin Rasttemp[1]:=true; zeit3:=GetTickCount; end
    else if (Edit21.Text<>'0') or (Rastnull[1]=true) then begin Edit21.Text:='0'; Gauge1.Progress:=100; Rasttemp[1]:=true; Rastnull[1]:=false; if CheckBox11.checked=true then AlarmEin:=true; if ComboBox66.ItemIndex>0 then Funktionsinfo[ComboBox66.ItemIndex]:=true; end
    else if Rasttemp[2]=false then begin Rasttemp[2]:=true; zeit3:=GetTickCount; end
    else if (Edit22.Text<>'0') or (Rastnull[2]=true) then begin Edit22.Text:='0'; Gauge2.Progress:=100; Rasttemp[2]:=true; Rastnull[2]:=false; if CheckBox12.checked=true then AlarmEin:=true; if ComboBox67.ItemIndex>0 then Funktionsinfo[ComboBox67.ItemIndex]:=true; end
    else if Rasttemp[3]=false then begin Rasttemp[3]:=true; zeit3:=GetTickCount; end
    else if (Edit23.Text<>'0') or (Rastnull[3]=true) then begin Edit23.Text:='0'; Gauge3.Progress:=100; Rasttemp[3]:=true; Rastnull[3]:=false; if CheckBox13.checked=true then AlarmEin:=true; if ComboBox68.ItemIndex>0 then Funktionsinfo[ComboBox68.ItemIndex]:=true; end
    else if Rasttemp[4]=false then begin Rasttemp[4]:=true; zeit3:=GetTickCount; end
    else if (Edit24.Text<>'0') or (Rastnull[4]=true) then begin Edit24.Text:='0'; Gauge4.Progress:=100; Rasttemp[4]:=true; Rastnull[4]:=false; if CheckBox14.checked=true then AlarmEin:=true; if ComboBox69.ItemIndex>0 then Funktionsinfo[ComboBox69.ItemIndex]:=true; end
    else if Rasttemp[5]=false then begin Rasttemp[5]:=true; zeit3:=GetTickCount; end
    else if (Edit25.Text<>'0') or (Rastnull[5]=true) then begin Edit25.Text:='0'; Gauge5.Progress:=100; Rasttemp[5]:=true; Rastnull[5]:=false; if CheckBox15.checked=true then AlarmEin:=true; if ComboBox70.ItemIndex>0 then Funktionsinfo[ComboBox70.ItemIndex]:=true; end
    else if Rasttemp[6]=false then begin Rasttemp[6]:=true; zeit3:=GetTickCount; end
    else if (Edit26.Text<>'0') or (Rastnull[6]=true) then begin Edit26.Text:='0'; Gauge6.Progress:=100; Rasttemp[6]:=true; Rastnull[6]:=false; if CheckBox16.checked=true then AlarmEin:=true; if ComboBox71.ItemIndex>0 then Funktionsinfo[ComboBox71.ItemIndex]:=true; end
    else if Rasttemp[7]=false then begin Rasttemp[7]:=true; zeit3:=GetTickCount; end
    else if (Edit27.Text<>'0') or (Rastnull[7]=true) then begin Edit27.Text:='0'; Gauge7.Progress:=100; Rasttemp[7]:=true; Rastnull[7]:=false; if CheckBox17.checked=true then AlarmEin:=true; if ComboBox72.ItemIndex>0 then Funktionsinfo[ComboBox72.ItemIndex]:=true; end
    else if Rasttemp[8]=false then begin Rasttemp[8]:=true; zeit3:=GetTickCount; end
    else if (Edit28.Text<>'0') or (Rastnull[8]=true) then begin Edit28.Text:='0'; Gauge8.Progress:=100; Rasttemp[8]:=true; Rastnull[8]:=false; if CheckBox18.checked=true then AlarmEin:=true; if ComboBox73.ItemIndex>0 then Funktionsinfo[ComboBox73.ItemIndex]:=true; end
    else if Rasttemp[9]=false then begin Rasttemp[9]:=true; zeit3:=GetTickCount; end
    else if (Edit29.Text<>'0') or (Rastnull[9]=true) then begin Edit29.Text:='0'; Gauge9.Progress:=100; Rasttemp[9]:=true; Rastnull[9]:=false; if CheckBox19.checked=true then AlarmEin:=true; if ComboBox74.ItemIndex>0 then Funktionsinfo[ComboBox74.ItemIndex]:=true; end
    else if Rasttemp[10]=false then begin Rasttemp[10]:=true; zeit3:=GetTickCount; end
    else if (Edit30.Text<>'0') or (Rastnull[10]=true) then begin Edit30.Text:='0'; Gauge10.Progress:=100; Rasttemp[10]:=true; Rastnull[10]:=false; if CheckBox20.checked=true then AlarmEin:=true; if ComboBox75.ItemIndex>0 then Funktionsinfo[ComboBox75.ItemIndex]:=true; end;
    restrastzeit:=strtoint(Edit21.Text)+strtoint(Edit22.Text)+strtoint(Edit23.Text)+strtoint(Edit24.Text)+strtoint(Edit25.Text)+strtoint(Edit26.Text)+strtoint(Edit27.Text)+strtoint(Edit28.Text)+strtoint(Edit29.Text)+strtoint(Edit30.Text);
    if restrastzeit=0 then Form1.BitBtn3Click(Sender);
    if restrastzeit=0 then begin Form1.BitBtn3Click(Sender); Edit53.Text:='0'; Gauge11.Progress:=100; end else Timer2.Enabled:=true;
  end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  if (start=true) then
  begin
    if (CheckBox10.Checked=true) and (Edit20.Text='0') and (Rastnull[10]=false) then begin Edit30.Text:=Edit20.Text; Gauge10.Progress:=0; Rasttemp[10]:=false; Rastnull[10]:=true; end
    else if (CheckBox10.Checked=true) and (Gauge10.Progress<>0) then begin Edit30.Text:=Edit20.Text; Gauge10.Progress:=0; Rasttemp[10]:=false; end
    else if (CheckBox9.Checked=true) and (Edit18.Text='0') and (Rastnull[9]=false) then begin Edit29.Text:=Edit18.Text; Gauge9.Progress:=0; Rasttemp[9]:=false; Rastnull[9]:=true; CheckBox10.Color:=clBtnFace; end
    else if (CheckBox9.Checked=true) and (Gauge9.Progress<>0) then begin Edit29.Text:=Edit18.Text; Gauge9.Progress:=0; Rasttemp[9]:=false; CheckBox10.Color:=clBtnFace; end
    else if (CheckBox8.Checked=true) and (Edit16.Text='0') and (Rastnull[8]=false) then begin Edit28.Text:=Edit16.Text; Gauge8.Progress:=0; Rasttemp[8]:=false; Rastnull[8]:=true; CheckBox9.Color:=clBtnFace; end
    else if (CheckBox8.Checked=true) and (Gauge8.Progress<>0) then begin Edit28.Text:=Edit16.Text; Gauge8.Progress:=0; Rasttemp[8]:=false; CheckBox9.Color:=clBtnFace; end
    else if (CheckBox7.Checked=true) and (Edit14.Text='0') and (Rastnull[7]=false) then begin Edit27.Text:=Edit14.Text; Gauge7.Progress:=0; Rasttemp[7]:=false; Rastnull[7]:=true; CheckBox8.Color:=clBtnFace; end
    else if (CheckBox7.Checked=true) and (Gauge7.Progress<>0) then begin Edit27.Text:=Edit14.Text; Gauge7.Progress:=0; Rasttemp[7]:=false; CheckBox8.Color:=clBtnFace; end
    else if (CheckBox6.Checked=true) and (Edit12.Text='0') and (Rastnull[6]=false) then begin Edit26.Text:=Edit12.Text; Gauge6.Progress:=0; Rasttemp[6]:=false; Rastnull[6]:=true; CheckBox7.Color:=clBtnFace; end
    else if (CheckBox6.Checked=true) and (Gauge6.Progress<>0) then begin Edit26.Text:=Edit12.Text; Gauge6.Progress:=0; Rasttemp[6]:=false; CheckBox7.Color:=clBtnFace; end
    else if (CheckBox5.Checked=true) and (Edit10.Text='0') and (Rastnull[5]=false) then begin Edit25.Text:=Edit10.Text; Gauge5.Progress:=0; Rasttemp[5]:=false; Rastnull[5]:=true; CheckBox6.Color:=clBtnFace; end
    else if (CheckBox5.Checked=true) and (Gauge5.Progress<>0) then begin Edit25.Text:=Edit10.Text; Gauge5.Progress:=0; Rasttemp[5]:=false; CheckBox6.Color:=clBtnFace; end
    else if (CheckBox4.Checked=true) and (Edit8.Text='0') and (Rastnull[4]=false) then begin Edit24.Text:=Edit8.Text; Gauge4.Progress:=0; Rasttemp[4]:=false; Rastnull[4]:=true; CheckBox5.Color:=clBtnFace; end
    else if (CheckBox4.Checked=true) and (Gauge4.Progress<>0) then begin Edit24.Text:=Edit8.Text; Gauge4.Progress:=0; Rasttemp[4]:=false; CheckBox5.Color:=clBtnFace; end
    else if (CheckBox3.Checked=true) and (Edit6.Text='0') and (Rastnull[3]=false) then begin Edit23.Text:=Edit6.Text; Gauge3.Progress:=0; Rasttemp[3]:=false; Rastnull[3]:=true; CheckBox4.Color:=clBtnFace; end
    else if (CheckBox3.Checked=true) and (Gauge3.Progress<>0) then begin Edit23.Text:=Edit6.Text; Gauge3.Progress:=0; Rasttemp[3]:=false; CheckBox4.Color:=clBtnFace; end
    else if (CheckBox2.Checked=true) and (Edit4.Text='0') and (Rastnull[2]=false) then begin Edit22.Text:=Edit4.Text; Gauge2.Progress:=0; Rasttemp[2]:=false; Rastnull[2]:=true; CheckBox3.Color:=clBtnFace; end
    else if (CheckBox2.Checked=true) and (Gauge2.Progress<>0) then begin Edit22.Text:=Edit4.Text; Gauge2.Progress:=0; Rasttemp[2]:=false; CheckBox3.Color:=clBtnFace; end
    else if (CheckBox1.Checked=true) and (Edit2.Text='0') and (Rastnull[1]=false) then begin Edit21.Text:=Edit2.Text; Gauge1.Progress:=0; Rasttemp[1]:=false; Rastnull[1]:=true; CheckBox2.Color:=clBtnFace; end
    else if (CheckBox1.Checked=true) and (Gauge1.Progress<>0) then begin Edit21.Text:=Edit2.Text; Gauge1.Progress:=0; Rasttemp[1]:=false; CheckBox2.Color:=clBtnFace; end;
    Form1.Timer2Timer(Sender);
  end;
end;

procedure TForm1.TimerREinTimer(Sender: TObject);
begin
  if Button14.Caption='Manuell' then
  begin
    Ruehrwerk:=RWert;
    Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-ein.bmp');
    Schalten(Form1);
  end;
  TimerREin.Enabled:=false;
  TimerRAus.Enabled:=true;
end;

procedure TForm1.TimerRAusTimer(Sender: TObject);
begin
  if (CheckBox43.Checked=false) or ((CheckBox43.Checked=true) and (Heizung=0)) then
  begin
    if Button14.Caption='Manuell' then
    begin
      Ruehrwerk:=0;
      Image3.Picture.LoadFromFile(pfad + 'Graphics\Ruehrwerk-aus.bmp');
      Schalten(Form1);
    end;
  end;
  TimerRAus.Enabled:=false;
  TimerREin.Enabled:=true;
end;

procedure TForm1.TimerHEinTimer(Sender: TObject);
begin
  if Button13.Caption='Manuell' then
  begin
    Heizung:=HWert;
    Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-ein.bmp');
    Schalten(Form1);
  end;
  TimerHEin.Enabled:=false;
  TimerHAus.Enabled:=true;
end;

procedure TForm1.TimerHAusTimer(Sender: TObject);
begin
  if Button13.Caption='Manuell' then
  begin
    Heizung:=0;
    Image2.Picture.LoadFromFile(pfad + 'Graphics\Feuer-aus.bmp');
    LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
    Schalten(Form1);
  end;
  TimerHAus.Enabled:=false;
  TimerHEin.Enabled:=true;
end;

procedure TForm1.TimerHSetTimer(Sender: TObject);
begin
  Deltatemp:=Solltemp-Tempfloat;
  if (TimerHEin.Interval=999) and (CheckBox37.Checked=true) and (Rasttemp[Rast]=true) then Deltatemp:=Deltatemp-Hysterese;
  if CheckBox36.Checked=true then GradientUebergabe:=GradientWert else GradientUebergabe:=999.9;
  if Alarmheizstatus=1 then
  begin
    TimerHEin.Interval:=9999999;
    TimerHAus.Interval:=900;
    Form1.TimerHAusTimer(Sender);
  end
  else if Alarmheizstatus=2 then
  begin
    TimerHEin.Interval:=900;
    TimerHAus.Interval:=9999999;
    Form1.TimerHEinTimer(Sender);
  end
  else if Deltatemp>TWert then
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
    end;
  end;
end;

procedure TForm1.TimerAAusTimer(Sender: TObject);
begin
  if Button16.Caption='Manuell' then
  begin
    Alarm:=0;
    Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-aus.bmp');
    Schalten(Form1);
    sndPlaySound(nil,0);
  end;
  TimerAAus.Enabled:=false;
  TimerAEin.Enabled:=true;
end;

procedure TForm1.TimerAEinTimer(Sender: TObject);
begin
  if Button16.Caption='Manuell' then
  begin
    Alarm:=AWert;
    Image6.Picture.LoadFromFile(pfad + 'Graphics\Alarm-ein.bmp');
    sndPlaySound(PChar(pfad+'Sound\alarm.wav'),SND_ASYNC + SND_LOOP);
    Schalten(Form1);
  end;
  TimerAEin.Enabled:=false;
  TimerAAus.Enabled:=true;
end;

procedure TForm1.MessageTimerTimer(Sender: TObject);
var
  buttonSelected:integer;
  rasttext, alarmspeicher, ruehrspeicher, heizspeicher:string;
  ruehrstart:boolean;
begin
  Ueberwachungstimer.Enabled:=false;
  rasttext:=(FindComponent('Edit' + IntToStr(62+rast)) as TEdit).Text;
  if (FindComponent('CheckBox' + IntToStr(20+rast)) as TCheckBox).Checked =true then ruehrstart:=true else ruehrstart:=false;
  if ruehrstart=true then Ruehrspeicher:='Aus' else Ruehrspeicher:='Ein';
  Heizspeicher:='Aus';
  if AlarmEin=true then
  begin
    Alarmspeicher:=button1.Caption;
    if rasttext<>'' then rasttext:=#13 + rasttext + #13;
    repeat
    begin
      Form1.TimerAEinTimer(Sender);
      MessageTimer.Enabled:=false;
      if button1.Caption='Alarm pulsen' then buttonSelected:=RastendeMessageDlgPos('Rast wurde beendet!' +#13 + rasttext + #13 + '- OK um Brauvorgang fortzusetzen.', mtInformation, [mbOK, mbAbort, mbYes, mbNo], ['OK', 'Alarm still', 'Rührwerk '+ Ruehrspeicher, 'Heizung '+ Heizspeicher], Form1.Left, Form1.Top);
      if button1.Caption='Alarm still' then buttonSelected:=RastendeMessageDlgPos('Rast wurde beendet!' +#13 + rasttext + #13 + '- OK um Brauvorgang fortzusetzen.', mtInformation, [mbOK, mbAbort, mbYes, mbNo], ['OK', 'Alarm aktiv', 'Rührwerk '+ Ruehrspeicher, 'Heizung '+ Heizspeicher], Form1.Left, Form1.Top);
      if button1.Caption='Alarm aktiv' then buttonSelected:=RastendeMessageDlgPos('Rast wurde beendet!' +#13 + rasttext +#13 + '- OK um Brauvorgang fortzusetzen.', mtInformation, [mbOK, mbAbort, mbYes, mbNo], ['OK', 'Alarm pulsen', 'Rührwerk '+ Ruehrspeicher, 'Heizung '+ Heizspeicher], Form1.Left, Form1.Top);
      if buttonSelected = mrNo then Form1.Button1Click(Sender);
      if (buttonSelected = mrOk) and (Ruehrspeicher='Aus') then begin Form1.TimerRAusTimer(Sender); TimerRSet.Enabled:=false; TimerREin.Enabled:=false; Ruehrspeicher:='Ein'; end
      else if (buttonSelected = mrOk) and (Ruehrspeicher='Ein') and (ruehrstart=true) then begin Form1.TimerREinTimer(Sender); TimerRSet.Enabled:=false; TimerRAus.Enabled:=false; Ruehrspeicher:='Auto';  end
      else if (buttonSelected = mrOk) and (Ruehrspeicher='Ein') and (ruehrstart=false) then begin Form1.TimerREinTimer(Sender); TimerRSet.Enabled:=false; TimerRAus.Enabled:=false; Ruehrspeicher:='Aus'; end
      else if (buttonSelected = mrOk) and (Ruehrspeicher='Auto') then begin Form1.TimerREinTimer(Sender); TimerRSet.Enabled:=true; Ruehrspeicher:='Aus'; end
      else if (buttonSelected = mrAbort) and (Heizspeicher='Aus') then begin Heizspeicher:='Ein'; Alarmheizstatus:=1; end
      else if (buttonSelected = mrAbort) and (Heizspeicher='Ein') then begin Heizspeicher:='Auto'; Alarmheizstatus:=2; end
      else if (buttonSelected = mrAbort) and (Heizspeicher='Auto') then begin Heizspeicher:='Aus'; Alarmheizstatus:=0; end;
    end;
    until buttonSelected = mrYes;
    repeat Form1.Button1Click(Sender) until button1.Caption=Alarmspeicher;
    AlarmEin:=false;
    Alarmheizstatus:=0;
    MessageTimer.Enabled:=true;
    Form1.TimerAAusTimer(Sender);
    TimerRSet.Enabled:=true;
    TimerAEin.Enabled:=false;
    TimerAAus.Enabled:=false;
  end;
  Ueberwachungstimer.Enabled:=true;
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
var tempstr:string;
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
  if PageControl1.ActivePage=TabSheet5 then
  begin
  Datensatz:=99999;
  if FileExists(pfad+'import\file.txt') then
  begin
    AssignFile(myImportFile, pfad+'import\file.txt');
    Reset(myImportFile);
    ReadLn(myImportFile, tempstr);
    if FileExists(tempstr) then else tempstr:=pfad+'import\no.sqlite';
    ReadLn(myImportFile, pfad2);
    OpenDialog2.FileName:=tempstr;
    SaveDialog2.InitialDir:=pfad2;
    ReadLn(myImportFile, tempstr);
    if tempstr='TRUE' then CheckBox44.Checked:=true else CheckBox44.Checked:=false;
    ReadLn(myImportFile, tempstr);
    Edit91.Text:=tempstr;
    ReadLn(myImportFile, tempstr);
    Edit92.Text:=tempstr;
    CloseFile(myImportFile);
    SQLBrowse;
  end;
  end;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  if DeleteFile(pfad + 'Setup\settings.txt') then MyMessageDlgPos('Settings wurden überschrieben!', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
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
    Label66.Visible:=true;
    TrackBar1.Visible:=true;
  end
  else
  begin
    Button20.Caption:='Simulation Ein';
    Label66.Visible:=false;
    TrackBar1.Visible:=false;
  end;
end;

procedure editcheck(changededit: TEdit; min:integer; max:integer; fail:string);
begin
  try Intdummy:=strtoint(changededit.Text) except begin changededit.Text:=fail; MyShowMessagePos('Unerlaubte Eingabe!', Form1.Left, 350, Form1.Top, 250); end; end;
  if (Intdummy>max) or (Intdummy<min) then begin changededit.Text:=fail; MyShowMessagePos('Unerlaubte Eingabe!', Form1.Left, 350, Form1.Top, 250); end;
end;

procedure editcheck2(changededit: TEdit; changededit2: TEdit; changededit3: TEdit);
begin
  intdummy:=round((strtoint(changededit3.Text)+strtoint(changededit2.Text))/2);
  if changededit.Text='fail' then changededit.Text:= inttostr(intdummy)
  else
  begin
    if (strtoint(changededit.Text)<strtoint(changededit2.Text)) then begin changededit.Text:=inttostr(intdummy); MyShowMessagePos('Unerlaubte Eingabe!', Form1.Left, 350, Form1.Top, 250); end;
    if (strtoint(changededit.Text)>strtoint(changededit3.Text)) then begin changededit.Text:=inttostr(intdummy); MyShowMessagePos('Unerlaubte Eingabe!', Form1.Left, 350, Form1.Top, 250); end;
  end;
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
    hw:hwnd;
begin
  buttonSelected:=MyMessageDlgPos('Programm wirklich beenden?', mtWarning, [mbOK, mbAbort], ['Ok', 'Abbruch'], Form1.Left, 350, Form1.Top, 250);
  if buttonSelected = mrOK then
  begin
    LPTCode:=0;
    Ruehrwerk:=0;
    Heizung:=0;
    Alarm:=0;
    Pumpe:=0;
    Schalten(Form1);
    repeat hw:= FindWindow(nil, 'Administrator:  Digitemp_variabel'); SendMessage(hw, WM_CLOSE, 0, 0); until hw=0;
    repeat hw:= FindWindow(nil, 'Digitemp_variabel');SendMessage(hw, WM_CLOSE, 0, 0); until hw=0;
    repeat hw:= FindWindow(nil, 'Administrator:  Externe_Sensorsoftware'); SendMessage(hw, WM_CLOSE, 0, 0); until hw=0;
    repeat hw:= FindWindow(nil, 'Externe_Sensorsoftware');SendMessage(hw, WM_CLOSE, 0, 0); until hw=0;
    repeat hw:= FindWindow(nil, 'Administrator:  Digitemp'); SendMessage(hw, WM_CLOSE, 0, 0); until hw=0;
    repeat hw:= FindWindow(nil, 'Digitemp'); SendMessage(hw, WM_CLOSE, 0, 0); until hw=0;
    repeat hw:= FindWindow(nil, 'Auto-Starter'); SendMessage(hw, WM_CLOSE, 0, 0); until hw=0;
    repeat hw:= FindWindow(nil, 'Brauerei Arduino LAN Server'); SendMessage(hw, WM_CLOSE, 0, 0); until hw=0;
    repeat hw:= FindWindow(nil, 'Brauerei Arduino USB Server'); SendMessage(hw, WM_CLOSE, 0, 0); until hw=0;
    application.terminate;
  end
  else CanClose:=false;
end;

procedure TForm1.UeberwachungstimerTimer(Sender: TObject);
var buttonSelected:integer;
begin
  if (start=true) and (CheckBox33.Checked=true) and (Button20.Caption='Simulation Ein') then
  begin
    if TimeTempStore=TimeTempStr then
    begin
      Form1.BitBtn2Click(Sender);
      Form1.TimerAEinTimer(Sender);
      MessageTimer.Enabled:=false;
      buttonSelected:=MyMessageDlgPos('Seit min. 1 Minute kein neuer Temperaturmesswert!', mtWarning, [mbOK, mbAbort], ['Ok', 'Abbruch'], Form1.Left, 320, Form1.Top, 250);
      if buttonSelected = mrAbort then CheckBox33.Checked:=false;
      Form1.BitBtn1Click(Sender);
      MessageTimer.Enabled:=true;
      Form1.TimerAAusTimer(Sender);
      TimerAEin.Enabled:=false;
      TimerAAus.Enabled:=false;
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
  if usbtyp='Denkovi' then USB2Out else if usbtyp='SainSmart' then USB3Out else USBOut;
end;

procedure TForm1.Batch_Update_TmrTimer(Sender: TObject);
begin
  if Steuerung<>'Batch' then begin Batch_Update_Tmr.Enabled:=false; exit; end;
  BatchOut;
end;

procedure Funktionstextuebernahme;
var i:integer;
begin
  for i:=46 to 75 do
  begin
    (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[1]:=Form4.Edit1.Text;
    (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[2]:=Form4.Edit2.Text;
    (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[3]:=Form4.Edit3.Text;
    (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[4]:=Form4.Edit4.Text;
    (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[5]:=Form4.Edit5.Text;
    (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[6]:=Form4.Edit6.Text;
    (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[7]:=Form4.Edit7.Text;
    (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[8]:=Form4.Edit8.Text;
    (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[9]:=Form4.Edit9.Text;
    (Form1.FindComponent('ComboBox' + inttostr(i)) as TComboBox).Items.Strings[10]:=Form4.Edit10.Text;
  end;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  if Combobox2.Text = 'Denkovi' then
  begin
    usbtyp:='Denkovi';
    ComboBox7.Visible:=false;
    ComboBox16.Visible:=true;
    Label76.Visible:=false;
    Label111.Visible:=true;
  end
  else if Combobox2.Text = 'SainSmart' then
  begin
    usbtyp:='SainSmart';
    ComboBox7.Visible:=false;
    ComboBox16.Visible:=true;
    Label76.Visible:=false;
    Label111.Visible:=true;
  end
  else
  begin
    usbtyp:='KMTronic';
    ComboBox16.Visible:=false;
    ComboBox7.Visible:=true;
    Label111.Visible:=false;
    Label76.Visible:=true;
  end;
end;

procedure TForm1.CheckBox31Click(Sender: TObject); begin  if CheckBox31.Checked=true then BitBtn65.Visible:=true else BitBtn65.Visible:=false; end;
procedure TForm1.CheckBox42Click(Sender: TObject); begin If CheckBox42.Checked=true then CheckBox43.Checked:=false; end;
procedure TForm1.ComboBox40Change(Sender: TObject); begin CloseLine; OpenLine; end;

procedure TForm1.ComboBox26Change(Sender: TObject); begin Hysterese:=strtofloat(Form1.ComboBox26.Text); end;
procedure TForm1.ComboBox29Change(Sender: TObject); begin Hysterese2:=strtofloat(Form1.ComboBox29.Text); end;

procedure TForm1.ComboBox30Change(Sender: TObject);
var i:integer;
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
end;

procedure TForm1.ComboBox32Change(Sender: TObject);
var i:integer;
begin
  if ComboBox32.Text='Stunden' then
  begin
    for i:= 37 to 46 do (FindComponent('Label' + IntToStr(i)) as TLabel).Caption := 'std.';
    Label125.Caption := 'std.';
  end
  else if ComboBox32.Text='Minuten' then
  begin
    for i:= 37 to 46 do (FindComponent('Label' + IntToStr(i)) as TLabel).Caption := 'min.';
    Label125.Caption := 'min.';
  end
  else
  begin
    for i:= 37 to 46 do (FindComponent('Label' + IntToStr(i)) as TLabel).Caption := 'sek.';
    Label125.Caption := 'sek.';
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.Text='USB' then
  begin
    GroupBox1.Visible:=false;
    GroupBox2.Visible:=true;
    GroupBox3.Visible:=false;
    GroupBox8.Visible:=false;
    if (ComboBox39.Text<>'ARDUINO') and (CheckBox45.Checked=false) then TabSheet8.TabVisible:=false;
  end
  else if ComboBox1.Text='LPT' then
  begin
    GroupBox1.Visible:=false;
    GroupBox2.Visible:=false;
    GroupBox3.Visible:=true;
    GroupBox8.Visible:=false;
    if (ComboBox39.Text<>'ARDUINO') and (CheckBox45.Checked=false) then TabSheet8.TabVisible:=false;
  end
  else if ComboBox1.Text='BATCH' then
  begin
    GroupBox1.Visible:=true;
    GroupBox2.Visible:=false;
    GroupBox3.Visible:=false;
    GroupBox8.Visible:=false;
    if (ComboBox39.Text<>'ARDUINO') and (CheckBox45.Checked=false) then TabSheet8.TabVisible:=false;
  end
  else if ComboBox1.Text='WLAN' then
  begin
    GroupBox1.Visible:=false;
    GroupBox2.Visible:=false;
    GroupBox3.Visible:=false;
    GroupBox8.Visible:=true;
    if (ComboBox39.Text<>'ARDUINO') and (CheckBox45.Checked=false) then TabSheet8.TabVisible:=false;
  end
  else
  begin
    GroupBox1.Visible:=false;
    GroupBox2.Visible:=false;
    GroupBox3.Visible:=false;
    GroupBox8.Visible:=false;
    TabSheet8.TabVisible:=true;
  end;
end;


procedure TForm1.Button26Click(Sender: TObject);
begin
  if ShellExecute(Application.Handle,'open',PChar(pfad+'Digitemp\Digitemp.bat'),nil,PChar(pfad+'Digitemp\'), SW_MINIMIZE) <= 32 then
  MyShowMessagePos('Es ist ein Fehler beim ausführen von Digitemp aufgetreten', Form1.Left, 350, Form1.Top, 250) else ;
  sensorreset:=1;
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  if ShellExecute(Application.Handle,'open',PChar(pfad+'Digitemp\Digitemp_variabel.bat'),nil,PChar(pfad+'Digitemp\'), SW_SHOWNORMAL) <= 32 then
  MyShowMessagePos('Es ist ein Fehler beim ausführen von Digitemp aufgetreten', Form1.Left, 350, Form1.Top, 250) else ;
  Sensorreset:=2;
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
  if ShellExecute(Application.Handle,'open',PChar(pfad+'Digitemp\Externe_Sensorsoftware.bat'),nil,PChar(pfad+'Digitemp\'), SW_MINIMIZE) <= 32 then
  MyShowMessagePos('Es ist ein Fehler beim ausführen von Digitemp aufgetreten', Form1.Left, 350, Form1.Top, 250) else ;
  sensorreset:=3;
end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
  if (sensorreset=1) and (ComboBox39.Text='Textdatei') then Form1.Button26Click(Sender);
  if (sensorreset=2) and (ComboBox39.Text='Textdatei') then Form1.Button27Click(Sender);
  if (sensorreset=3) and (ComboBox39.Text='Textdatei') then Form1.Button28Click(Sender);
  if ComboBox39.Text='DIGITEMP' then DigitempTimer.Enabled:=true;
end;

procedure TForm1.OpenDialog1Show(Sender: TObject);
begin
  TimerDlgMove.Enabled:=true;
end;

procedure TForm1.TimerDlgMoveTimer(Sender: TObject);
var dlgWnd  : HWND;
begin
  TimerDlgMove.Enabled:=false;
  dlgWnd := FindWindow('#32770', Pansichar(OpenDialog1.Title));     {Find the dialog window}
  if dlgWnd <> 0 then SetWindowPos(GetParent(OpenDialog1.Handle), 0, Form1.Left+200, Form1.Top+100, 0, 0, SWP_NOSIZE);
  dlgWnd := FindWindow('#32770', Pansichar(SaveDialog1.Title));     {Find the dialog window}
  if dlgWnd <> 0 then SetWindowPos(GetParent(SaveDialog1.Handle), 0, Form1.Left+200, Form1.Top+100, 0, 0, SWP_NOSIZE);
  dlgWnd := FindWindow('#32770', Pansichar(OpenDialog2.Title));     {Find the dialog window}
  if dlgWnd <> 0 then SetWindowPos(GetParent(OpenDialog2.Handle), 0, Form1.Left+200, Form1.Top+100, 0, 0, SWP_NOSIZE);
  dlgWnd := FindWindow('#32770', Pansichar(SaveDialog2.Title));     {Find the dialog window}
  if dlgWnd <> 0 then SetWindowPos(GetParent(SaveDialog2.Handle), 0, Form1.Left+200, Form1.Top+100, 0, 0, SWP_NOSIZE);
  dlgWnd := FindWindow('#32770', Pansichar('Drucken'));     {Find the dialog window}
  if dlgWnd <> 0 then SetWindowPos(PrintDialog1.Handle, 0, Form1.Left+200, Form1.Top+100, 0, 0, SWP_NOSIZE);
end;

procedure TForm1.Button29Click(Sender: TObject);
begin
  Button29.Visible:=false;
  Button30.Visible:=true;
  Panel8.Visible:=true;
  Panel14.Visible:=false;
  Panel10.Visible:=true;
end;

procedure TForm1.Button30Click(Sender: TObject);
begin
  Button30.Visible:=false;
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
  Panel8.Visible:=false;
  Panel10.Visible:=false;
  Panel14.Visible:=false;
end;

procedure TForm1.CheckBox38Click(Sender: TObject);
begin
  if Checkbox38.Checked=true then
    begin
      Checkbox39.Checked:=false;
      Checkbox40.Checked:=false;
    end;
end;

procedure TForm1.CheckBox39Click(Sender: TObject);
begin
  if Checkbox39.Checked=true then
    begin
      Checkbox38.Checked:=false;
      Checkbox40.Checked:=false;
    end;
end;

procedure TForm1.CheckBox40Click(Sender: TObject);
begin
  if Checkbox40.Checked=true then
    begin
      Checkbox38.Checked:=false;
      Checkbox39.Checked:=false;
    end;
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
  if (Button31.Caption='Gesamtrast') then Button31.Caption:='Gesamtheizzeit'
  else if Button31.Caption='Gesamtheizzeit' then Button31.Caption:='Gesamtkühlzeit'
  else if Button31.Caption='Gesamtkühlzeit' then Button31.Caption:='Gesamtprozeß'
  else if Button31.Caption='Gesamtprozeß' then Button31.Caption:='ETA'
  else if Button31.Caption='ETA' then Button31.Caption:='Gesamtrast';
  gesamtanzeigegeaendert;
  Form1.GesUpdateTimerTimer(Sender);
end;

procedure TForm1.GesUpdateTimerTimer(Sender: TObject);
var eta,RastStartTemp:extended;
    zeitfaktor,i,temptime:integer;

begin
  if Combobox30.Text='Minuten' then zeitfaktor:=1 else zeitfaktor:=60;
//Berechnung:
//Rast:
  restrastzeit:=0;
  gesrastzeit:=0;
  restrastgauge:=0;
  for i:= 1 to 10 do
  begin
    restrastzeit:=restrastzeit+strtoint((FindComponent('Edit' + IntToStr(20+i)) as TEdit).Text);
    restrastgauge:= restrastgauge + (FindComponent('Gauge' + IntToStr(i)) as TGauge).Progress * strtoint((FindComponent('Edit' + IntToStr(i*2)) as TEdit).Text);
    if (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Checked = true then
    begin
      gesrastzeit:=gesrastzeit+strtoint((FindComponent('Edit' + IntToStr(i*2)) as TEdit).Text);
    end;
  end;
  if gesrastzeit>0 then restrastgauge:=round(restrastgauge/gesrastzeit) else restrastgauge:=0;

//Heiz/Kühl gesamt:
  RastStartTemp:=StartTemp;
  gesheizzeit:=0;
  geskuehlzeit:=0;
  for i:= 1 to 10 do
  begin
    if (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Checked = true then
    begin
      if (FindComponent('BitBtn' + IntToStr(16+i)) as TBitBtn).HelpKeyword = 'Bei Rasttemperaturüberschreitung' then
      begin
        temptime:=round((strtoint((FindComponent('Edit' + IntToStr(i*2-1)) as TEdit).Text)-RastStartTemp)/Aufheizrate);
        if temptime < 0 then temptime := 0;
        gesheizzeit:=round((gesheizzeit+temptime)/zeitfaktor);
      end
      else if (FindComponent('BitBtn' + IntToStr(16+i)) as TBitBtn).HelpKeyword = 'Bei Rasttemperaturunterschreitung' then
      begin
        temptime:=round((RastStartTemp-strtoint((FindComponent('Edit' + IntToStr(i*2-1)) as TEdit).Text))/Abkuehlrate);
        if temptime < 0 then temptime := 0;
        geskuehlzeit:=round((geskuehlzeit+temptime)/zeitfaktor);
      end;
      RastStartTemp:=strtoint((FindComponent('Edit' + IntToStr(i*2-1)) as TEdit).Text);
    end;
  end;

//Heiz/Kühl rest:
  RastStartTemp:=Tempfloat;
  restheizzeit:=0;
  restkuehlzeit:=0;
  for i:= 1 to 10 do
  begin
    if rast=i then RastStartTemp:= Tempfloat;
    if (FindComponent('CheckBox' + IntToStr(i)) as TCheckBox).Checked = true then
    begin
      if (FindComponent('BitBtn' + IntToStr(16+i)) as TBitBtn).HelpKeyword = 'Bei Rasttemperaturüberschreitung' then
      begin
        if  Rasttemp[i]=false then
        begin
          temptime:=round((strtoint((FindComponent('Edit' + IntToStr(i*2-1)) as TEdit).Text)-RastStartTemp)/Aufheizrate);
          if temptime < 0 then temptime := 0;
          restheizzeit:=round((restheizzeit+temptime)/zeitfaktor);
        end;
      end
      else if (FindComponent('BitBtn' + IntToStr(16+i)) as TBitBtn).HelpKeyword = 'Bei Rasttemperaturunterschreitung' then
      begin
        if  Rasttemp[i]=false then
        begin
          temptime:=round((RastStartTemp-strtoint((FindComponent('Edit' + IntToStr(i*2-1)) as TEdit).Text))/Abkuehlrate);
          if temptime < 0 then temptime := 0;
          restkuehlzeit:=round((restkuehlzeit+temptime)/zeitfaktor);
        end;
      end;
      RastStartTemp:=strtoint((FindComponent('Edit' + IntToStr(i*2-1)) as TEdit).Text);
    end;
  end;

  if Gesheizzeit>0 then Restheizgauge:=round((Gesheizzeit-Restheizzeit)/Gesheizzeit*100) else Restheizgauge:=100;
  if Geskuehlzeit>0 then Restkuehlgauge:=round((Geskuehlzeit-Restkuehlzeit)/Geskuehlzeit*100) else Restkuehlgauge:=100;

//Prozess:
  Restprozesszeit:=Restheizzeit+Restkuehlzeit+Restrastzeit;
  Gesprozesszeit:=Gesheizzeit+Geskuehlzeit+Gesrastzeit;
  if Gesprozesszeit>0 then Restprozessgauge:=round((Restkuehlgauge*Geskuehlzeit+Restheizgauge*Gesheizzeit+Restrastgauge*Gesrastzeit)/Gesprozesszeit) else Restprozessgauge:=100;

//Ausgabe:
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
    else if Button31.Caption='Gesamtkühlzeit' then
    begin
      Edit53.Text:=inttostr(restkuehlzeit);
      Gauge11.progress:=restkuehlgauge;
    end
    else if Button31.Caption='Gesamtprozeß' then
    begin
      Edit53.Text:=inttostr(restprozesszeit);
      Gauge11.progress:=restprozessgauge;
    end
    else if Button31.Caption='ETA' then
    begin
      eta:=now+restrastzeit/24/60*zeitfaktor;
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
end;

procedure TimerDialogClose;
begin
  Timerstartbatstatus:=0;
  if Form2.CheckBox1.Checked=true then Timerstartbatstatus:=1;
  if Form2.CheckBox2.Checked=true then Timerstartbatstatus:=2;
  if Form2.CheckBox3.Checked=true then Timerstartbatstatus:=3;
  sensorverzoegerung:=Form2.Edit2.Text;
  Form1.Enabled:=true;
  If Form2.Label5.Caption='true' then
  begin
    Form1.BitBtn1.Enabled:=false;
    Form1.BitBtn2.Enabled:=false;
    Graphic:=pfad + 'Graphics\Automatik-timer.bmp';
    Form1.Image5.Picture.LoadFromFile(Graphic);
    Form1.TimerTimer.Enabled:=true;
  end
  else
  begin
    Form1.BitBtn3Click(Form1);
  end;
end;

procedure TForm1.TimerTimerTimer(Sender: TObject);
begin
  Form2.DateTimePicker2.Date:=now;
  Label136.Caption:=inttostr(round(Form2.DateTimePicker1.Date-now-0.5))+':'+timetostr(Form2.DateTimePicker1.DateTime-now);
  Label136.Visible:=true;
  if (Form2.DateTimePicker1.Date<=now) and (Form2.DateTimePicker2.Time<=now) then
  begin
    if Form2.Checkbox1.Checked=true then Form1.Button26Click(Sender);
    if Form2.Checkbox2.Checked=true then Form1.Button27Click(Sender);
    if Form2.Checkbox3.Checked=true then Form1.Button28Click(Sender);
    Timer3.Interval:=strtoint(Form2.Edit2.Text)*1000;
    Timer3.Enabled:=true;
    TimerTimer.Enabled:=false;
    Label136.Visible:=false;
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
    Checkbox48.Caption:='Kühlung';
  end
  else
  begin
    Relais4:='Pumpe';
    s2.Title:='Pumpe       ';
    Checkbox48.Caption:='Pumpe';
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
end;

procedure TForm1.ComboBox31Change(Sender: TObject);
var i: integer;
begin
  if ComboBox31.Text='Bei Rasttemperaturüberschreitung' then
  begin
    Temperaturrast:=1;
    for i:= 17 to 26 do
    begin
      (FindComponent('BitBtn' + IntToStr(i)) as TBitBtn).HelpKeyword := ComboBox31.Text;
      ButtonChanged((FindComponent('BitBtn' + IntToStr(i)) as TBitBtn));
    end;
    for i:= 17 to 26 do ButtonChanged((FindComponent('BitBtn' + IntToStr(i)) as TBitBtn));
  end
  else if ComboBox31.Text='Bei Rasttemperaturunterschreitung' then
  begin
    Temperaturrast:=2;
    for i:= 17 to 26 do
    begin
      (FindComponent('BitBtn' + IntToStr(i)) as TBitBtn).HelpKeyword := ComboBox31.Text;
      ButtonChanged((FindComponent('BitBtn' + IntToStr(i)) as TBitBtn));
    end;
    for i:= 17 to 26 do ButtonChanged((FindComponent('BitBtn' + IntToStr(i)) as TBitBtn));
  end
  else
  begin
    Temperaturrast:=0;
    for i:= 17 to 26 do
    begin
      (FindComponent('BitBtn' + IntToStr(i)) as TBitBtn).HelpKeyword := ComboBox31.Text;
      ButtonChanged((FindComponent('BitBtn' + IntToStr(i)) as TBitBtn));
    end;
  end;
  Button31.Caption:='ETA';
  Form1.Button31Click(Sender);
end;

procedure TForm1.TimerKSetTimer(Sender: TObject);
begin
  Deltatemp2:=Tempfloat-Solltemp;
  if (TimerKEin.Interval=999) and (CheckBox37.Checked=true) and (Rasttemp[Rast]=true) then Deltatemp2:=Deltatemp2-Hysterese2;
  if Alarmheizstatus<>0 then
  begin
    TimerKEin.Interval:=9999999;
    TimerKAus.Interval:=900;
    Form1.TimerKAusTimer(Sender);
  end
  else if Deltatemp2<=0 then
  begin
    if TimerKEin.Interval<>999 then
    begin
      TimerKEin.Interval:=999;
      TimerKAus.Interval:=999;
      Form1.TimerKAusTimer(Sender);
      TimerKEin.Enabled:=false;
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
  if Button15.Caption='Manuell' then
  begin
    Pumpe:=PWert;
    Image4.Picture.LoadFromFile(pfad + 'Graphics\Kühlung-ein.bmp');
    Schalten(Form1);
  end;
  TimerKEin.Enabled:=false;
  TimerKAus.Enabled:=true;
end;

procedure TForm1.TimerKAusTimer(Sender: TObject);
begin
  if Button13.Caption='Manuell' then
  begin
    Pumpe:=0;
    Image4.Picture.LoadFromFile(pfad + 'Graphics\Kühlung-aus.bmp');
    LPTCode:=Ruehrwerk+Heizung+Pumpe+Alarm;
    Schalten(Form1);
  end;
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
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  buttonSelected:integer;
begin
  buttonSelected:=MyMessageDlgPos('Einstellungen auf Standardeinstellungen zurücksetzen?', mtWarning, [mbOK, mbAbort], ['Ok', 'Abbruch'], Form1.Left, 350, Form1.Top, 250);
  if buttonSelected = mrOK then
  begin
    setup_laden(Form1, pfad+'Setup\Standard_Setup.txt');
    Form1.PageControl1Change(Sender);
    Form1.PageControl2Change(Sender);
  end;
end;

procedure TForm1.ApplicationEvents1ShowHint(var HintStr: String;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  HintInfo.HideTimeout:=Length(HintStr)*50;
end;

procedure TForm1.Edit83Exit(Sender: TObject); begin editcheck(Edit83,0,99,'fail'); editcheck2(Edit83,Edit88,Edit84); end;
procedure TForm1.Edit84Exit(Sender: TObject); begin editcheck(Edit84,0,99,'fail'); editcheck2(Edit84,Edit83,Edit85); end;
procedure TForm1.Edit85Exit(Sender: TObject); begin editcheck(Edit85,0,99,'fail'); editcheck2(Edit85,Edit84,Edit86); end;
procedure TForm1.Edit86Exit(Sender: TObject); begin editcheck(Edit86,0,99,'fail'); editcheck2(Edit86,Edit85,Edit87); end;

procedure TForm1.TimerRSetTimer(Sender: TObject);
var ruehrzeitfaktor, verzoegerung:integer;
begin
  if Combobox32.Text='Sekunden' then ruehrzeitfaktor:=1
  else if Combobox32.Text='Minuten' then ruehrzeitfaktor:=60
  else ruehrzeitfaktor:=3600;
  if Combobox45.Text='5 Sekunden' then verzoegerung:=5
  else if Combobox45.Text='10 Sekunden' then verzoegerung:=10
  else if Combobox45.Text='30 Sekunden' then verzoegerung:=30
  else if Combobox45.Text='1 Minute' then verzoegerung:=60
  else if Combobox45.Text='2 Minuten' then verzoegerung:=120
  else if Combobox45.Text='5 Minuten' then verzoegerung:=300
  else verzoegerung:=0;
  TimerREin.Interval:=100+strtoint((FindComponent('Edit' + inttostr(40+Rast)) as TEdit).Text)*1000*ruehrzeitfaktor;
  TimerRAus.Interval:=100+strtoint((FindComponent('Edit' + inttostr(30+Rast)) as TEdit).Text)*1000*ruehrzeitfaktor;
  if Heizung=0 then begin HAus:=HAus+1; HEin:=0; end;
  If Heizung<>0 then begin HEin:=HEin+1; HAus:=0; end;
  if CheckBox42.Checked=true then
  begin
    if ((FindComponent('CheckBox' + inttostr(20+Rast)) as TCheckBox).Checked=true) and (TimerRAus.Enabled=false) and (TimerREin.Enabled=false) and (HEin>verzoegerung) then Form1.TimerREinTimer(Sender);
    if ((FindComponent('CheckBox' + inttostr(20+Rast)) as TCheckBox).Checked=false) or (HAus>verzoegerung) then begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
  end
  else
  begin
    if ((FindComponent('CheckBox' + inttostr(20+Rast)) as TCheckBox).Checked=true) and (TimerRAus.Enabled=false) and (TimerREin.Enabled=false) then Form1.TimerREinTimer(Sender);
    if ((FindComponent('CheckBox' + inttostr(20+Rast)) as TCheckBox).Checked=false) then begin Form1.TimerRAusTimer(Sender); TimerREin.Enabled:=false; end;
  end;
  if ((CheckBox43.Checked=true) and (Heizung=1)) then begin TimerRAus.Enabled:=false; TimerRAus.Enabled:=true; end;
end;

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  Datensatz:=99999;
  if (OpenDialog2.Execute) then
  begin
    SQLBrowse;
    ImportSettings;
    ScrollBar1.Min:=0;
  end;
end;

procedure exportieren(Form:TForm1; filename:string);
var slDBpath: string;
    sldb: TSQLiteDatabase;
    sltb: TSQLIteTable;
    Tempstr: String;
    ID,i,j: integer;
begin
  AssignFile(myImportFile, filename);
  ReWrite(myImportFile);
  try
    slDBPath := Form.OpenDialog2.FileName;
    sldb := TSQLiteDatabase.Create(slDBPath);
    sltb := slDb.GetTable('SELECT * FROM Sud');
    try
      if sltb.Count > 0 then
      begin
        if Datensatz > sltb.Count-1 then Datensatz:=sltb.Count-1;
        if Datensatz < 0 then Datensatz:=0;
        for i:=1 to Datensatz do sltb.Next;
        Tempstr := floattostr(sltb.FieldAsDouble(sltb.FieldIndex['EinmaischenTemp']));
        WriteLn(myImportFile, Tempstr);
        WriteLn(myImportFile, '0');
        ID := sltb.FieldAsInteger(sltb.FieldIndex['ID']);
      end;
    except
      MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
    end;
    sltb := slDb.GetTable('SELECT * FROM Rasten WHERE SudID = '+inttostr(ID));
    j := sltb.Count+1;
    try
      if sltb.Count > 0 then
      begin
        for i:=1 to 9 do
        begin
          if i<=sltb.Count then
          begin
            Tempstr:=UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['RastTemp']));
            WriteLn(myImportFile, Tempstr);
            Tempstr:=UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['RastDauer']));
            WriteLn(myImportFile, Tempstr);
            sltb.Next;
          end
          else
          begin
            WriteLn(myImportFile, '20');
            WriteLn(myImportFile, '60');
          end;
        end;
      end;
    except
      MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
    end;

    if j>10 then j:=10;

    for i := 1 to 10 do WriteLn(myImportFile, Form1.Edit91.Text);

    for i := 1 to 10 do WriteLn(myImportFile, Form1.Edit92.Text);

    for i := 1 to j do WriteLn(myImportFile, 'TRUE');
    for i := j to 9 do WriteLn(myImportFile, 'FALSE');

    WriteLn(myImportFile, 'TRUE');
    for i := 2 to j-1 do WriteLn(myImportFile, 'FALSE');
    WriteLn(myImportFile, 'TRUE');
    for i := j to 9 do WriteLn(myImportFile, 'FALSE');

    if Form1.CheckBox44.Checked=true then for i := 1 to j do WriteLn(myImportFile, 'TRUE') else for i := 1 to j do WriteLn(myImportFile, 'FALSE');
    for i := j to 9 do WriteLn(myImportFile, 'FALSE');

    WriteLn(myImportFile, 'Malz einfüllen');
    for i := 2 to j-1 do WriteLn(myImportFile, '');
    WriteLn(myImportFile, 'Maischeprozess beendet - Abmaischen');
    for i := j to 9 do WriteLn(myImportFile, '');

    WriteLn(myImportFile, 'Einmaischen');
    slDBPath := Form.OpenDialog2.FileName;
    sldb := TSQLiteDatabase.Create(slDBPath);

    sltb := slDb.GetTable('SELECT * FROM Rasten WHERE SudID = '+inttostr(ID));
    try
      if sltb.Count > 0 then
      begin
        for i:=1 to 9 do
        begin
          if i<=sltb.Count then
          begin
            Tempstr:=UTF8ToAnsi(sltb.FieldAsString(sltb.FieldIndex['RastName']));
            Delete(Tempstr, Pos(' ', Tempstr), 99);
            WriteLn(myImportFile, Tempstr);
            sltb.Next;
          end
          else WriteLn(myImportFile, 'ungenutzte Rast');
        end;
      end;
    except
      MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
    end;

    for i := 1 to 10 do WriteLn(myImportFile, 'Bei Rasttemperaturüberschreitung');

  finally
    sltb.Free;
    CloseFile(myImportFile);
  end;
end;

procedure exportieren2(Form:TForm1; filename:string);
var slDBpath: string;
    sldb: TSQLiteDatabase;
    sltb: TSQLIteTable;
    Tempstr,Nachiso: String;
    i,gk,vw,k,c,ks: integer;
begin
  AssignFile(myImportFile, filename);
  ReWrite(myImportFile);
  try
    slDBPath := Form.OpenDialog2.FileName;
    sldb := TSQLiteDatabase.Create(slDBPath);
    sltb := slDb.GetTable('SELECT * FROM Sud');
    try
      if sltb.Count > 0 then for i:=1 to Datensatz do sltb.Next;
      gk:=round(sltb.FieldAsDouble(sltb.FieldIndex['KochdauerNachBitterhopfung']));
      Nachiso := floattostr(sltb.FieldAsDouble(sltb.FieldIndex['Nachisomerisierungszeit']));
    except
      MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
    end;
    sltb := slDb.GetTable('SELECT * FROM Hopfengaben WHERE SudID = '+Form1.ebID.Text);
    try
      if sltb.Count > 0 then
      begin
        for i:=1 to sltb.Count do
        begin
          if (sltb.FieldAsString(sltb.FieldIndex['Vorderwuerze'])='1') and (vw=0) then
          begin
            c:=1;
            vw:=1;
            WriteLn(myImportFile, Form1.ComboBox34.Text);
            WriteLn(myImportFile, '0');
          end;
          sltb.Next;
        end;
      end;
    except
      MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
    end;
    k:=-1;
    sltb := slDb.GetTable('SELECT * FROM Hopfengaben ORDER BY Zeit DESC');
    try
      if sltb.Count > 0 then
      begin
        for i:=1 to sltb.Count do
        begin
          if (sltb.FieldAsString(sltb.FieldIndex['Vorderwuerze'])='0') and (sltb.FieldAsString(sltb.FieldIndex['SudID'])=Form1.ebID.Text) then
          begin
            if (gk-round(sltb.FieldAsDouble(sltb.FieldIndex['Zeit']))<>k) and (c<10) then
            begin
              k:=gk-round(sltb.FieldAsDouble(sltb.FieldIndex['Zeit']));
              c:=c+1;
              WriteLn(myImportFile, Form1.ComboBox34.Text);
              WriteLn(myImportFile, inttostr(k-ks));
              ks:=k;
            end;
          end;
          sltb.Next;
        end;
        if k<gk then
        begin
          c:=c+1;
          WriteLn(myImportFile, Form1.ComboBox34.Text);
          WriteLn(myImportFile, inttostr(gk-k));
        end;
        if (c<9) and (Nachiso<>'0') then
        begin
          c:=c+1;
          WriteLn(myImportFile, '78');
          WriteLn(myImportFile, Nachiso);
        end;
        for i:=c to 9 do begin WriteLn(myImportFile, '20'); WriteLn(myImportFile, '0'); end;
      end;
    except
      MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
    end;
    for i:=1 to 10 do WriteLn(myImportFile, Form1.Edit91.Text);
    for i:=1 to 10 do WriteLn(myImportFile, Form1.Edit92.Text);
    for i:=1 to c do WriteLn(myImportFile, 'true');
    for i:=c to 9 do WriteLn(myImportFile, 'false');
    for i:=1 to c do WriteLn(myImportFile, 'true');
    for i:=c to 9 do WriteLn(myImportFile, 'false');
    if Form1.CheckBox44.Checked=true then for i:=1 to c do WriteLn(myImportFile, 'true') else for i:=1 to c do WriteLn(myImportFile, 'false');
    for i:=c to 9 do WriteLn(myImportFile, 'false');
    c:=0;
    sltb := slDb.GetTable('SELECT * FROM Hopfengaben WHERE SudID = '+Form1.ebID.Text);
    try
      if sltb.Count > 0 then
      begin
        for i:=1 to sltb.Count do
        begin
          if (sltb.FieldAsString(sltb.FieldIndex['Vorderwuerze'])='1') then
          begin
            if c=1 then Tempstr:=Tempstr+' - ';
            c:=1;
            Tempstr:=Tempstr+sltb.FieldAsString(sltb.FieldIndex['erg_Menge'])+' g ';
            Tempstr:=Tempstr+sltb.FieldAsString(sltb.FieldIndex['Name']);
          end;
          sltb.Next;
        end;
        if c>0 then WriteLn(myImportFile, Tempstr);
      end;
    except
      MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
    end;
    k:=-1;
    Tempstr:='';
    sltb := slDb.GetTable('SELECT * FROM Hopfengaben ORDER BY Zeit DESC');
    try
      if sltb.Count > 0 then
      begin
        Tempstr:='';
        for i:=1 to sltb.Count do
        begin
          if (sltb.FieldAsString(sltb.FieldIndex['Vorderwuerze'])='0') and (sltb.FieldAsString(sltb.FieldIndex['SudID'])=Form1.ebID.Text) then
          begin
            if (gk-round(sltb.FieldAsDouble(sltb.FieldIndex['Zeit']))<>k) and (c<10) and (Tempstr<>'') then
            begin
              c:=c+1;
              WriteLn(myImportFile, Tempstr);
              Tempstr:='';
            end;
            if Tempstr>'' then Tempstr:=Tempstr+' - ';
            Tempstr:=Tempstr+sltb.FieldAsString(sltb.FieldIndex['erg_Menge'])+' g ';
            Tempstr:=Tempstr+sltb.FieldAsString(sltb.FieldIndex['Name']);
            k:=gk-round(sltb.FieldAsDouble(sltb.FieldIndex['Zeit']));
          end;
          sltb.Next;
        end;
        WriteLn(myImportFile, Tempstr);
        c:=c+1;
        if k<gk then WriteLn(myImportFile, 'Restkochzeit abgeschlossen');
        if Nachiso <> '0' then WriteLn(myImportFile, 'Nachisomerisierungszeit abgeschlossen') else WriteLn(myImportFile, '');
        if k<gk then for i:=c to 7 do WriteLn(myImportFile, '') else for i:=c to 8 do WriteLn(myImportFile, '');
      end;
    except
      MyMessageDlgPos('Kein Eintrag in DB vorhanden.', mtInformation, [mbOK], ['Ok'], Form1.Left, 350, Form1.Top, 250);
    end;
    if vw=1 then WriteLn(myImportFile, 'Vorderwürze') else WriteLn(myImportFile, 'Hopfengabe');
    for i:= 2 to c do WriteLn(myImportFile, 'Hopfengabe');
    if (c<9) and (k<gk) then begin WriteLn(myImportFile, 'Restkochzeit'); c:=c+1; end;
    if (c<9) and (Nachiso<>'0') then begin WriteLn(myImportFile, 'Isomerisierung'); c:=c+1; end
    else if (c<9) then begin WriteLn(myImportFile, 'ungenutzte Rast'); c:=c+1; end;
    if (c<9) and (k>=gk) then begin WriteLn(myImportFile, 'ungenutzte Rast'); c:=c+1; end;
    for i:= c to 9 do WriteLn(myImportFile, 'ungenutzte Rast');
    if vw=1 then WriteLn(myImportFile, 'Temperaturunabhängig') else WriteLn(myImportFile, 'Bei Rasttemperaturüberschreitung');
    if vw=1 then WriteLn(myImportFile, 'Bei Rasttemperaturüberschreitung') else WriteLn(myImportFile, 'Temperaturunabhängig');
    for i:= 2 to 9 do WriteLn(myImportFile, 'Temperaturunabhängig');
  finally
    sltb.Free;
    CloseFile(myImportFile);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  exportieren(Form1, pfad+'Import\temp.rzt');
  laden(Form1, pfad+'Import\temp.rzt');
  Rezeptname:= 'temp';
  Form1.Caption:='Brauerei '+ Version + ' - ' +  Rezeptname; //Ausgabe des gespeicherten Rezepts
  CloseFile(myFile);
  Form1.Button30Click(Sender);
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Datensatz:=ScrollBar1.Position;
  SQLBrowse;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SaveDialog2.FileName := ebName.Text+'.rzt';
  if SaveDialog2.Execute then
  begin
    if DeleteFile(SaveDialog2.FileName) then MyMessageDlgPos('Rezept wurde überschrieben!', mtInformation, [mbOK], ['Ok'], Form1.Left, 50, Form1.Top, 50);
    exportieren(Form1, SaveDialog2.FileName);
  end;
  pfad2:= ExtractFileDir(SaveDialog2.FileName);
  SaveDialog2.InitialDir:= pfad2;
  ImportSettings;
end;

procedure TForm1.CheckBox43Click(Sender: TObject);
begin
  If CheckBox43.Checked=true then begin CheckBox42.Checked:=false; end;
end;

procedure TForm1.BitBtn17Click(Sender: TObject); begin ButtonPressed(BitBtn17); end;
procedure TForm1.BitBtn18Click(Sender: TObject); begin ButtonPressed(BitBtn18); end;
procedure TForm1.BitBtn19Click(Sender: TObject); begin ButtonPressed(BitBtn19); end;
procedure TForm1.BitBtn20Click(Sender: TObject); begin ButtonPressed(BitBtn20); end;
procedure TForm1.BitBtn21Click(Sender: TObject); begin ButtonPressed(BitBtn21); end;
procedure TForm1.BitBtn22Click(Sender: TObject); begin ButtonPressed(BitBtn22); end;
procedure TForm1.BitBtn23Click(Sender: TObject); begin ButtonPressed(BitBtn23); end;
procedure TForm1.BitBtn24Click(Sender: TObject); begin ButtonPressed(BitBtn24); end;
procedure TForm1.BitBtn25Click(Sender: TObject); begin ButtonPressed(BitBtn25); end;
procedure TForm1.BitBtn26Click(Sender: TObject); begin ButtonPressed(BitBtn26); end;


procedure TForm1.Button5Click(Sender: TObject);
begin
  SaveDialog2.FileName := ebName.Text+'-Kochen.rzt';
  if SaveDialog2.Execute then
  begin
    if DeleteFile(SaveDialog2.FileName) then MyMessageDlgPos('Rezept wurde überschrieben!', mtInformation, [mbOK], ['Ok'], Form1.Left, 50, Form1.Top, 50);
    exportieren2(Form1, SaveDialog2.FileName);
  end;
  pfad2:= ExtractFileDir(SaveDialog2.FileName);
  SaveDialog2.InitialDir:= pfad2;
  ImportSettings;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  exportieren2(Form1, pfad+'Import\temp2.rzt');
  laden(Form1, pfad+'Import\temp2.rzt');
  Rezeptname:= 'temp';
  Form1.Caption:='Brauerei '+ Version + ' - ' +  Rezeptname; //Ausgabe des gespeicherten Rezepts
  CloseFile(myFile);
  Form1.Button30Click(Sender);
end;

procedure TForm1.Edit91Exit(Sender: TObject); begin editcheck(Edit91,0,9999,'60'); ImportSettings; end;
procedure TForm1.Edit92Exit(Sender: TObject); begin editcheck(Edit92,0,9999,'60'); ImportSettings; end;

procedure exportieren3(Form:TForm1; filename:string);
var count,i,k: integer;
    TempFile1,TempFile2,Tempfile3: TextFile;
begin
  exportieren(Form1, pfad+'Import\temp.rzt');
  exportieren2(Form1, pfad+'Import\temp2.rzt');
  AssignFile(myFile, pfad+'Import\temp.rzt');
  Reset(myFile);
  for i:= 1 to 40 do ReadLn(myFile, xwert);
  count:=0;
  for i:= 1 to 10 do begin ReadLn(myFile, xwert); if xwert='TRUE' then count:=count+1; end;
  CloseFile(myFile);
  AssignFile(TempFile1, pfad+'Import\temp.rzt');
  Reset(TempFile1);
  AssignFile(TempFile2, pfad+'Import\temp2.rzt');
  Reset(TempFile2);
  AssignFile(TempFile3, FileName);
  ReWrite(TempFile3);
  for k := 1 to 2*count do begin ReadLn(TempFile1, xwert); WriteLn(TempFile3, xwert); end;
  for k := 2*count to 19 do ReadLn(TempFile1, xwert);
  for k := 2*count to 19 do begin ReadLn(TempFile2, xwert); WriteLn(TempFile3, xwert); end;
  for k := 1 to 2*count do ReadLn(TempFile2, xwert);
  for i:= 1 to 8 do
  begin
    for k := 1 to count do begin ReadLn(TempFile1, xwert); WriteLn(TempFile3, xwert); end;
    for k := count to 9 do ReadLn(TempFile1, xwert);
    for k := count to 9 do begin ReadLn(TempFile2, xwert); WriteLn(TempFile3, xwert); end;
    for k := 1 to count do ReadLn(TempFile2, xwert);
  end;
  CloseFile(TempFile1);
  CloseFile(TempFile2);
  CloseFile(TempFile3);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  SaveDialog2.FileName := ebName.Text+'-Gesamt.rzt';
  if SaveDialog2.Execute then
  begin
    if DeleteFile(SaveDialog2.FileName) then MyMessageDlgPos('Rezept wurde überschrieben!', mtInformation, [mbOK], ['Ok'], Form1.Left, 50, Form1.Top, 50);
    exportieren3(Form1, SaveDialog2.FileName);
  end;
  pfad2:= ExtractFileDir(SaveDialog2.FileName);
  SaveDialog2.InitialDir:= pfad2;
  ImportSettings;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  exportieren3(Form1, pfad+'Import\temp3.rzt');
  laden(Form1, pfad+'Import\temp3.rzt');
  Rezeptname:= 'temp';
  Form1.Caption:='Brauerei '+ Version + ' - ' +  Rezeptname; //Ausgabe des gespeicherten Rezepts
  CloseFile(myFile);
  Form1.Button30Click(Sender);
end;

procedure TForm1.BitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbRight) and (stop=true) then
  begin
    Multistart:=1;
    Form3.Top:=Form1.Top+50;
    Form3.Left:=Form1.Left+50;
    Form3.BitBtn1.HelpKeyWord:='false';
    Form3.BitBtn1.HelpKeyWord:='false';
    Form3.Visible:=true;
  end;
end;

procedure TForm1.BitBtn3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Multistart:=6;
  Form1.BitBtn3Click(Sender);
end;

procedure TForm1.Edit93Exit(Sender: TObject);
begin
  try kwert:=strtofloat(Edit93.Text) except begin Edit93.Text:='0.0'; kwert:=0; MyShowMessagePos('Unerlaubte Eingabe!', Form1.Left, 350, Form1.Top, 250); end; end;
  if (kwert>5) or (kwert<-5) then begin Edit93.Text:='0.0'; kwert:=0; MyShowMessagePos('Unerlaubte Eingabe!', Form1.Left, 350, Form1.Top, 250); end;
end;

procedure TForm1.Edit94Exit(Sender: TObject);
begin
  try kfaktor:=strtofloat(Edit94.Text) except begin Edit94.Text:='1.0'; kfaktor:=1; MyShowMessagePos('Unerlaubte Eingabe!', Form1.Left, 350, Form1.Top, 250); end; end;
  if (kfaktor>2) or (kfaktor<0.5) then begin Edit94.Text:='1.0'; kfaktor:=1; MyShowMessagePos('Unerlaubte Eingabe!', Form1.Left, 350, Form1.Top, 250); end;
end;

procedure TForm1.PageControl2Change(Sender: TObject);
begin
  if PageControl2.ActivePage=TabSheet7 then MyShowMessagePos('    Im normalen Maischeprozeß sind hier keine Änderungen erforderlich!!!    ', Form1.Left, 30, Form1.Top, 90);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  MyShowMessagePos('Einschaltzeiten (hh:mm:ss):' + #13 + #13 +
  'Heizung: ' + Chr(9) + Chr(9) + FormatDateTime('hh:nn:ss', htime) + #13 +
  'Rührwerk: ' + Chr(9) + Chr(9) + FormatDateTime('hh:nn:ss', rtime) + #13 +
  Relais4 + ':    ' + Chr(9) + Chr(9) + FormatDateTime('hh:nn:ss', ptime) + #13 +
  'Alarm:      ' + Chr(9) + Chr(9) + FormatDateTime('hh:nn:ss', atime) + #13 + #13 +
  'Gesamt:     ' + Chr(9) + Chr(9) + FormatDateTime('hh:nn:ss', gtime) ,Form1.Left, 300, Form1.Top, 180);
end;

procedure TForm1.Edit95Exit(Sender: TObject);
var wfaktor: extended;
begin
  try wfaktor:=strtofloat(Edit95.Text) except begin Edit95.Text:='1.0'; wfaktor:=1; MyShowMessagePos('Unerlaubte Eingabe!', Form1.Left, 350, Form1.Top, 250); end; end;
  if (wfaktor>1.6) or (wfaktor<0.6) then begin Edit95.Text:='1.0'; wfaktor:=1; MyShowMessagePos('Unerlaubte Eingabe!', Form1.Left, 350, Form1.Top, 250); end;
  scaleby(round(wfaktor*100 * (985 / Form1.Width)),100);
  Form1.Width := round(985 * wfaktor);
  Form1.Height := round(663 * wfaktor);
  if wfaktor=1 then Form1.Refresh;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  if Button14.Caption='Manuell' then
  begin
    Button14.Caption:='Auto';
    Button8.Enabled:=true;
    Button8.Caption:='Rührwerk Aus';
    Form1.Button8Click(Form1);
  end
  else
  begin
    Button14.Caption:='Manuell';
    Button8.Enabled:=false;
    Button8.Caption:='Rührwerk Aus';
    Form1.Button8Click(Form1);
    TimerRAus.Enabled:=false;
    TimerREin.Enabled:=false;
    Form1.TimerRSetTimer(Sender);
  end;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  if Button13.Caption='Manuell' then
  begin
    Button13.Caption:='Auto';
    Button9.Enabled:=true;
    Button9.Caption:='Heizung Aus';
    Form1.Button9Click(Form1);
  end
  else
  begin
    Button13.Caption:='Manuell';
    Button9.Enabled:=false;
    Button9.Caption:='Heizung Aus';
    Form1.Button9Click(Form1);
    TimerHEin.Interval:=0;
    Form1.TimerHSetTimer(Sender);
  end;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  if Button15.Caption='Manuell' then
  begin
    Button15.Caption:='Auto';
    Button10.Enabled:=true;
    Button10.Caption:=Relais4+' Aus';
    Form1.Button10Click(Form1);
  end
  else
  begin
    Button15.Caption:='Manuell';
    Button10.Enabled:=false;
    Button10.Caption:=Relais4+' Aus';
    Form1.Button10Click(Form1);
    TimerKEin.Interval:=0;
    Form1.TimerKSetTimer(Sender);
  end;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  if Button16.Caption='Manuell' then
  begin
    Button16.Caption:='Auto';
    Button11.Enabled:=true;
    Button11.Caption:='Alarm Aus';
    Form1.Button11Click(Form1);
  end
  else
  begin
    Button16.Caption:='Manuell';
    Button11.Enabled:=false;
    Button11.Caption:='Alarm Aus';
    Form1.Button11Click(Form1);
  end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char); begin If Key=#13 then begin Key:=#0; SendMessage(Handle, WM_NEXTDLGCTL, 0, 0); end; end;

procedure TForm1.BitBtn27Click(Sender: TObject); begin ButtonPlus(1); end;
procedure TForm1.BitBtn29Click(Sender: TObject); begin ButtonPlus(2); end;
procedure TForm1.BitBtn31Click(Sender: TObject); begin ButtonPlus(3); end;
procedure TForm1.BitBtn33Click(Sender: TObject); begin ButtonPlus(4); end;
procedure TForm1.BitBtn35Click(Sender: TObject); begin ButtonPlus(5); end;
procedure TForm1.BitBtn37Click(Sender: TObject); begin ButtonPlus(6); end;
procedure TForm1.BitBtn39Click(Sender: TObject); begin ButtonPlus(7); end;
procedure TForm1.BitBtn41Click(Sender: TObject); begin ButtonPlus(8); end;
procedure TForm1.BitBtn43Click(Sender: TObject); begin ButtonPlus(9); end;
procedure TForm1.BitBtn45Click(Sender: TObject); begin ButtonPlus(10); end;

procedure TForm1.BitBtn28Click(Sender: TObject); begin ButtonMinus(1); end;
procedure TForm1.BitBtn30Click(Sender: TObject); begin ButtonMinus(2); end;
procedure TForm1.BitBtn32Click(Sender: TObject); begin ButtonMinus(3); end;
procedure TForm1.BitBtn34Click(Sender: TObject); begin ButtonMinus(4); end;
procedure TForm1.BitBtn36Click(Sender: TObject); begin ButtonMinus(5); end;
procedure TForm1.BitBtn38Click(Sender: TObject); begin ButtonMinus(6); end;
procedure TForm1.BitBtn40Click(Sender: TObject); begin ButtonMinus(7); end;
procedure TForm1.BitBtn42Click(Sender: TObject); begin ButtonMinus(8); end;
procedure TForm1.BitBtn44Click(Sender: TObject); begin ButtonMinus(9); end;
procedure TForm1.BitBtn46Click(Sender: TObject); begin ButtonMinus(10); end;

procedure TForm1.BitBtn47Click(Sender: TObject); begin RastPlus(1); end;
procedure TForm1.BitBtn50Click(Sender: TObject); begin RastPlus(2); end;
procedure TForm1.BitBtn52Click(Sender: TObject); begin RastPlus(3); end;
procedure TForm1.BitBtn54Click(Sender: TObject); begin RastPlus(4); end;
procedure TForm1.BitBtn56Click(Sender: TObject); begin RastPlus(5); end;
procedure TForm1.BitBtn58Click(Sender: TObject); begin RastPlus(6); end;
procedure TForm1.BitBtn60Click(Sender: TObject); begin RastPlus(7); end;
procedure TForm1.BitBtn62Click(Sender: TObject); begin RastPlus(8); end;
procedure TForm1.BitBtn64Click(Sender: TObject); begin RastPlus(9); end;

procedure TForm1.BitBtn48Click(Sender: TObject); begin RastMinus(1); end;
procedure TForm1.BitBtn49Click(Sender: TObject); begin RastMinus(2); end;
procedure TForm1.BitBtn51Click(Sender: TObject); begin RastMinus(3); end;
procedure TForm1.BitBtn53Click(Sender: TObject); begin RastMinus(4); end;
procedure TForm1.BitBtn55Click(Sender: TObject); begin RastMinus(5); end;
procedure TForm1.BitBtn57Click(Sender: TObject); begin RastMinus(6); end;
procedure TForm1.BitBtn59Click(Sender: TObject); begin RastMinus(7); end;
procedure TForm1.BitBtn61Click(Sender: TObject); begin RastMinus(8); end;
procedure TForm1.BitBtn63Click(Sender: TObject); begin RastMinus(9); end;

procedure TForm1.BitBtn65Click(Sender: TObject);
begin
  Panel14.Visible:=true;
end;

procedure TForm1.BitBtn66Click(Sender: TObject);
begin
  Panel14.Visible:=false;
end;

procedure TForm1.BitBtn67Click(Sender: TObject);
begin
  Form4.Top:=Form1.Top+150;
  Form4.Left:=Form1.Left+250;
  Form4.Visible:=true;
  Form1.Enabled:=false;
end;

procedure TForm1.ComboBox38Change(Sender: TObject);
begin
  if ComboBox38.Text = 'LAN' then
  begin
    Label138.Visible:=true;
    edit96.Visible:=true;
    Label141.Visible:=false;
    ComboBox36.Visible:=true;
    ComboBox37.Visible:=true;
    ComboBox40.Visible:=false;
    Tmr_Rcv.Interval:=1000;
  end
  else
  begin
    Label138.Visible:=false;
    edit96.Visible:=false;
    Label141.Visible:=true;
    ComboBox36.Visible:=false;
    ComboBox37.Visible:=false;
    ComboBox40.Visible:=true;
    Tmr_Rcv.Interval:=200;
  end;
end;

procedure TForm1.ComboBox39Change(Sender: TObject);
begin
  if ComboBox39.Text='ARDUINO' then
  begin
    TabSheet8.TabVisible:=true;
    GroupBox5.Visible:=false;
    GroupBox9.Visible:=false;
    UpDown1.Visible:=false;
    Label63.Caption:='IST';
    DigitempTimer.Enabled:=false;
  end
  else if ComboBox39.Text='DIGITEMP' then
  begin
    if (ComboBox1.Text<>'ARDUINO') and (CheckBox45.Checked=false) then TabSheet8.TabVisible:=false;
    GroupBox5.Visible:=false;
    GroupBox9.Visible:=true;
    UpDown1.Visible:=true;
    UpDown1.Position:=ComboBox76.ItemIndex;
    Label63.Caption:='IST S'+IntToStr(ComboBox76.ItemIndex);
    DigitempTimer.Enabled:=true;
    Form1.DigitempTimerTimer(Sender);
  end
  else
  begin
    if (ComboBox1.Text<>'ARDUINO') and (CheckBox45.Checked=false) then TabSheet8.TabVisible:=false;
    GroupBox5.Visible:=true;
    GroupBox9.Visible:=false;
    UpDown1.Visible:=false;
    Label63.Caption:='IST';
    DigitempTimer.Enabled:=false;
  end;
end;

procedure TForm1.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
begin
  SetLength(RecText, AData.Size);
  AData.ReadBuffer(PChar(RecText)^, AData.Size);
  DecimalSeparator := '.';
  if (((ComboBox35.Text='NTC10000') or (ComboBox35.Text='DS18B20')) and (RecText[1]='T') and (RecText[6]='t'))then
  begin
    Memo1.Lines.Append('');
    arduinofloattempalt:=arduinofloattemp;
    try arduinotfs:= copy(RecText, 2, 4); arduinofloattemp:=strtofloat(arduinotfs); except end;
    arduinotempdelta:=arduinofloattemp-arduinofloattempalt;
    if (arduinofloattemp<0) or (arduinofloattemp>=100) or (arduinotempdelta<-5) or (arduinotempdelta>5) then
    begin
      Memo1.Lines.Strings[Memo1.Lines.Count-1]:='Temperaturwert unplausibel';
    end
    else
    begin
      Memo1.Lines.Strings[Memo1.Lines.Count-1]:=('UDP-IN - '+datetimetostr(now)+' - '+arduinotfs+' °C'); //Text hinzufügen
    end;
  end;
end;

procedure TForm1.Tmr_RcvTimer(Sender: TObject);
var line2, temp: string;
    itemp,iisttemp,isolltemp,i:integer;
    Ch: Byte ;
begin
  Tmr_Rcv.Enabled := false ;
  DecimalSeparator := '.';
  if ComboBox38.Text='LAN' then
  begin
    try
      iisttemp:=round(Tempfloat*10);
      isolltemp:=round(solltemp);
      if Heizung<>0 then itemp:=1 else itemp:=0;
      if Ruehrwerk<>0 then itemp:=itemp+2;
      if Pumpe<>0 then itemp:=itemp+4;
      if Alarm<>0 then itemp:=itemp+8;
      line2:='C'+char(itemp);
      if Start=true then itemp:=1 else if Pause=true then itemp:=2 else itemp:=4;
      itemp:=itemp+16;
      if ComboBox35.Text='Display' then itemp:=itemp+32 else if ComboBox35.Text='DS18B20' then itemp:=itemp+64 else itemp:=itemp+128;
      if iisttemp>255 then repeat begin iisttemp:=iisttemp-256; i:=i+1; end until iisttemp<256;
      line2:=line2+char(itemp)+char(isolltemp)+char(i)+char(iisttemp);
      if Funktionsinfo[1]=true then itemp:=128 else itemp:=0;
      if Funktionsinfo[2]=true then itemp:=itemp+64;
      if Funktionsinfo[3]=true then itemp:=itemp+32;
      if Funktionsinfo[4]=true then itemp:=itemp+16;
      if Funktionsinfo[5]=true then itemp:=itemp+8;
      if Funktionsinfo[6]=true then itemp:=itemp+4;
      if Funktionsinfo[7]=true then itemp:=itemp+2;
      if Funktionsinfo[8]=true then itemp:=itemp+1;
      line2:=line2+char(itemp);
      if Funktionsinfo[9]=true then itemp:=2 else itemp:=0;
      if Funktionsinfo[10]=true then itemp:=itemp+1;
      line2:=line2+char(itemp)+('----------c');
      IdUDPClient1.Active := true;
      IdUDPClient1.Send(line2);
      IdUDPClient1.Active := false;
    except
      Memo1.Lines.Append('');
      Memo1.Lines.Strings[Memo1.Lines.Count-1]:='IP antwortet nicht';
    end;
  end
  else
  begin
    if ((ComboBox35.Text='NTC10000') or (ComboBox35.Text='DS18B20') and (ser.WaitingData>0)) then
    begin
      temp:='';
      repeat
      begin
        Ch := Ser.RecvByte(2) ;
        if ser.LastError<>ErrTimeout then
        begin
          if (Ch=13) then
          begin
              arduinofloattempalt:=arduinofloattemp;
              try arduinotfs:=temp; arduinofloattemp:=strtofloat(temp); except end;
              arduinotempdelta:=arduinofloattemp-arduinofloattempalt;
              if (arduinofloattemp<0) or (arduinofloattemp>=100) or (arduinotempdelta<-5) or (arduinotempdelta>5) then
              begin
                Memo1.Lines.Append('');
                Memo1.Lines.Strings[Memo1.Lines.Count-1]:='Temperaturwert unplausibel';
              end
              else
              begin
                Memo1.Lines.Append('');
                Memo1.Lines.Strings[Memo1.Lines.Count-1]:=('USB-IN - '+DateTimeToStr(Now)+' - '+temp+' °C'); //Text hinzufügen
              end;
           end
          else if (Ch<>13)and(Ch<>10) then
          temp := temp + chr(Ch);
        end;
      end
      until (ser.LastError=ErrTimeout) or (ser.WaitingData>0) ;
    end;
    iisttemp:=round(Tempfloat*10);
    isolltemp:=round(solltemp);
    if Heizung<>0 then itemp:=1 else itemp:=0;
    if Ruehrwerk<>0 then itemp:=itemp+2;
    if Pumpe<>0 then itemp:=itemp+4;
    if Alarm<>0 then itemp:=itemp+8;
    line2:='C'+char(itemp);
    if Start=true then itemp:=1 else if Pause=true then itemp:=2 else itemp:=4;
    itemp:=itemp+16;
    if ComboBox35.Text='Display' then itemp:=itemp+32 else if ComboBox35.Text='DS18B20' then itemp:=itemp+64 else itemp:=itemp+128;
    if iisttemp>255 then repeat begin iisttemp:=iisttemp-256; i:=i+1; end until iisttemp<256;
    line2:=line2+char(itemp)+char(isolltemp)+char(i)+char(iisttemp);
    if Funktionsinfo[1]=true then itemp:=128 else itemp:=0;
    if Funktionsinfo[2]=true then itemp:=itemp+64;
    if Funktionsinfo[3]=true then itemp:=itemp+32;
    if Funktionsinfo[4]=true then itemp:=itemp+16;
    if Funktionsinfo[5]=true then itemp:=itemp+8;
    if Funktionsinfo[6]=true then itemp:=itemp+4;
    if Funktionsinfo[7]=true then itemp:=itemp+2;
    if Funktionsinfo[8]=true then itemp:=itemp+1;
    line2:=line2+char(itemp);
    if Funktionsinfo[9]=true then itemp:=2 else itemp:=0;
    if Funktionsinfo[10]=true then itemp:=itemp+1;
    line2:=line2+char(itemp)+('----------c');
    ser.SendString(line2);
  end;
  Tmr_Rcv.Enabled := true ;
end;


procedure TForm1.Edit96Exit(Sender: TObject);
begin
  IdUDPClient1.Active:=false;
  IdUDPClient1.Host:=Edit96.Text;
  IdUDPClient1.Active:=true;
  Tmr_Rcv.Enabled := true ;
end;

procedure TForm1.ComboBox36Change(Sender: TObject);
begin
  LANStarted:=false;
end;

procedure TForm1.ComboBox37Change(Sender: TObject);
begin
  LANStarted:=false;
end;

procedure TForm1.CheckBox45Click(Sender: TObject);
begin
  if CheckBox45.Checked=true then TabSheet8.TabVisible:=true
  else if (ComboBox1.Text<>'ARDUINO') and (ComboBox39.Text<>'ARDUINO') then TabSheet8.TabVisible:=false;
end;

procedure TForm1.ArduinoTimerTimer(Sender: TObject);
begin
  if (ComboBox39.Text='ARDUINO') or (ComboBox1.Text='ARDUINO') or (CheckBox45.Checked=true) then
  begin
    if (ComboBox38.Text='LAN') and (LANStarted=false) then
    begin
      if USBStarted=true then CloseLine;
      USBStarted:=false;
      LANStarted:=true;
      Tmr_Rcv.Enabled:=true;
      IdUDPClient1.Active:=False;
      IdUDPClient1.Port:=strtoint(ComboBox36.Text);
      IdUDPServer1.Active:=False;
      IdUDPServer1.Bindings.Clear;
      IdUDPServer1.DefaultPort:= strtoint(ComboBox37.Text);         //Electronic device port
      IdUDPServer1.Active:=true;
      IdUDPClient1.Active:=true;
    end
    else if (ComboBox38.Text='USB') and (USBStarted=false) then
    begin
      LANStarted:=false;
      USBStarted:=true;
      ser:=TBlockserial.Create;
      ser.RaiseExcept:=False;
      OpenLine;
      Tmr_Rcv.Enabled:=true;
      IdUDPServer1.Active:=false;
      IdUDPClient1.Active:=false;
    end;
  end
  else
  begin
    if USBStarted=true then CloseLine;
    USBStarted:=false;
    LANStarted:=false;
    Tmr_Rcv.Enabled:=false;
    IdUDPServer1.Active:=false;
    IdUDPClient1.Active:=false;
  end;
end;

procedure TForm1.ComboBox41Change(Sender: TObject);
begin
  if ComboBox41.Text='5 Sekunde Takt' then DigitempTimer.Interval:=5000
  else if ComboBox41.Text='10 Sekunde Takt' then DigitempTimer.Interval:=10000
  else if ComboBox41.Text='30 Sekunde Takt' then DigitempTimer.Interval:=30000
  else if ComboBox41.Text='60 Sekunde Takt' then DigitempTimer.Interval:=60000
  else if ComboBox41.Text='5 Minuten Takt' then DigitempTimer.Interval:=300000
  else if ComboBox41.Text='10 Minuten Takt' then DigitempTimer.Interval:=600000
  else if ComboBox41.Text='30 Minuten Takt' then DigitempTimer.Interval:=1800000
  else if ComboBox41.Text='60 Minuten Takt' then DigitempTimer.Interval:=3600000
end;

procedure TForm1.DigitempTimerTimer(Sender: TObject);
var temp:string;
begin
  if ComboBox76.ItemIndex<>0 then
  begin
    temp:=inttostr(ComboBox42.ItemIndex+1)+' '+inttostr(ComboBox76.ItemIndex-1);
    if ShellExecute(Application.Handle,'open',PChar(pfad+'digitemp\digitemp_one.bat'),PChar(temp), PChar(pfad+'digitemp'), SW_HIDE) <= 32 then
    begin
      DigitempTimer.Enabled:=false;
      ShowMessage('Es ist ein Fehler beim ausführen von Digitemp aufgetreten');
    end;
  end;
end;

procedure TForm1.ComboBox42Change(Sender: TObject);
begin
  DigitempTimer.Enabled:=true;
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  ComboBox76.ItemIndex:=UpDown1.Position;              
  Label63.Caption:='IST S'+IntToStr(ComboBox76.ItemIndex);
end;

procedure TForm1.ComboBox76Change(Sender: TObject);
begin
  UpDown1.Position:=ComboBox76.ItemIndex;
  Label63.Caption:='IST S'+IntToStr(ComboBox76.ItemIndex);
end;

end.




