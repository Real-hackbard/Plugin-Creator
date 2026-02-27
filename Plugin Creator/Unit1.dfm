object Form1: TForm1
  Left = 394
  Top = 373
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Plugin-Demo'
  ClientHeight = 280
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 32
    Width = 178
    Height = 39
    Caption = 'PlugIn Loader'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Impact'
    Font.Style = []
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    Left = 360
    Top = 8
    object mnuFile: TMenuItem
      Caption = '&File'
      object mnuClose: TMenuItem
        Caption = '&Close'
        OnClick = mnuCloseClick
      end
    end
    object mnuPlugins: TMenuItem
      Caption = '&PlugIns'
    end
  end
end
