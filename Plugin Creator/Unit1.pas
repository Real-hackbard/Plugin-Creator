{*******************************************************************************

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.
 3. The name(s) of the copyright holder(s) may not be used to endorse or
    promote products derived from this software without specific prior written
    permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*******************************************************************************}

{------------------------------------------------------------------------------}
{                                                                              }
{  Hinweis - Beschreibung der Schnittstelle:                                   }
{                                                                              }
{  Die Plugin-DLL muss eine Funktion und eine Prozedur exportieren. Die        }
{  Funktion ist für den Menüeintrag verantwortlich, muss "MenuCaption"         }
{  heißen und ist wie folgt deklariert:                                        }
{  function MenuCaption(pStr: PChar; iStrLen: Integer): Integer; stdcall;      }
{  Die exportierte Prozedur muss "LoadPlugin" heißen und ist wie folgt         }
{  deklariert:                                                                 }
{  procedure LoadPlugin; stdcall;                                              }
{  Diese Prozedur enthält den ausführbaren Code des Plugins.                   }
{                                                                              }
{------------------------------------------------------------------------------}


unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, Vcl.Menus, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    mnuFile: TMenuItem;
    mnuClose: TMenuItem;
    mnuPlugins: TMenuItem;
    Label1: TLabel;
    procedure mnuCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuOnClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadPlugins;
  public
    { Public declarations }
  end;

var
  Form1        : TForm1;

implementation

{$R *.dfm}

type
  TMenuCaption = function(pStr: PAnsiChar; iStrLen: Integer): Integer; stdcall;
  TLoadPlugin = procedure; stdcall;

const
  PLUGIN_PATH  = 'creator';

var
  MenuCaption  : TMenuCaption = nil;
  PluginArray  : array of TLoadPlugin;

procedure TForm1.MenuOnClick(Sender: TObject);
begin
  PluginArray[(Sender as TMenuItem).Tag];
end;

procedure TForm1.LoadPlugins;
var
  Path         : string;
  PluginFile   : string;
  sr           : TSearchRec;
  lib          : THandle;
  s            : string;
  NewItem      : TMenuItem;
  ItemCount    : Cardinal;
begin
  ItemCount := 0;
  // Specify the name for certain drivers
  Path := ExtractFilepath(ParamStr(0)) + PLUGIN_PATH + '\*.dll';
  if FindFirst(Path, faAnyFile, sr) = 0 then
  begin
    repeat
      PluginFile := ExtractFilepath(ParamStr(0)) + PLUGIN_PATH + '\' + sr.Name;
      Lib := LoadLibrary(PChar(PluginFile));
      if Lib <> 0 then
      begin
        // build menu item
        @MenuCaption := GetProcAddress(Lib, 'MenuCaption');
        SetLength(PluginArray, ItemCount + 1);
        @PluginArray[ItemCount] := GetProcAddress(Lib, 'LoadPlugin');
        if (Assigned(MenuCaption)) and (Assigned(PluginArray[ItemCount])) then
        begin
          NewItem := TMenuItem.Create(self);
          SetLength(s, 1024);
          SetLength(s, MenuCaption(PAnsiChar(s), 1024));
          NewItem.Caption := PChar(s);
          NewItem.Tag := ItemCount;
          NewItem.OnClick := MenuOnClick;
          mnuPlugins.Add(NewItem);
          Inc(ItemCount);
        end;
      end;
    until FindNext(sr) <> 0;
  end;
end;

procedure TForm1.mnuCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LoadPlugins();
end;

end.

