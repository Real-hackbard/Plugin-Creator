object Form2: TForm2
  Left = 376
  Top = 413
  BorderStyle = bsDialog
  Caption = 'Plugin'
  ClientHeight = 252
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 160
    Width = 71
    Height = 13
    Caption = 'File PluginDLL:'
  end
  object Label2: TLabel
    Left = 112
    Top = 160
    Width = 32
    Height = 13
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 17
    Top = 48
    Width = 208
    Height = 13
    Caption = 'This is the content of the "FormUnit.pas" file'
  end
  object Label4: TLabel
    Left = 17
    Top = 21
    Width = 155
    Height = 13
    Caption = 'Plugin successfully loaded.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 17
    Top = 67
    Width = 102
    Height = 13
    Caption = 'In the Creator project.'
  end
  object Label6: TLabel
    Left = 17
    Top = 104
    Width = 250
    Height = 13
    Caption = 'To change the plugin driver , start the Creator Project'
  end
  object Label7: TLabel
    Left = 17
    Top = 123
    Width = 270
    Height = 13
    Caption = 'and manually load the "FormUnit.pas" file into the project.'
  end
  object Button1: TButton
    Left = 200
    Top = 184
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Close'
    TabOrder = 0
    TabStop = False
    OnClick = Button1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 233
    Width = 296
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitLeft = 128
    ExplicitTop = 216
    ExplicitWidth = 0
  end
end
