object Form2: TForm2
  Left = 1214
  Top = 161
  BorderStyle = bsDialog
  Caption = 'Timer-Steuerung'
  ClientHeight = 215
  ClientWidth = 288
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  PrintScale = poNone
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 40
    Height = 15
    Caption = 'Datum:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 160
    Top = 24
    Width = 23
    Height = 15
    Caption = 'Zeit:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 243
    Top = 56
    Width = 23
    Height = 15
    Caption = 'sek.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 56
    Width = 142
    Height = 15
    Caption = 'Vorlaufzeit f'#252'r Sensorstart:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 176
    Width = 27
    Height = 15
    Caption = 'false'
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 168
    Width = 121
    Height = 33
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 168
    Width = 121
    Height = 33
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkAbort
  end
  object DateTimePicker1: TDateTimePicker
    Left = 64
    Top = 16
    Width = 89
    Height = 23
    Date = 42064.743327962960000000
    Time = 42064.743327962960000000
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker
    Left = 192
    Top = 16
    Width = 81
    Height = 23
    Date = 42064.743327962960000000
    Time = 42064.743327962960000000
    Kind = dtkTime
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 88
    Width = 249
    Height = 17
    Caption = 'Digitemp.bat mit starten'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 16
    Top = 112
    Width = 249
    Height = 17
    Caption = 'Digitemp_variabel.bat mit starten'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 16
    Top = 136
    Width = 249
    Height = 17
    Caption = 'Externe_Sensorsoftware.bat mit starten'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = CheckBox3Click
  end
  object Edit2: TEdit
    Left = 193
    Top = 50
    Width = 41
    Height = 23
    TabOrder = 7
    Text = '10'
    OnExit = Edit2Exit
  end
end
