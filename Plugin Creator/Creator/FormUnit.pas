unit FormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

procedure FormShowModal(Parent: Pointer); stdcall;

implementation

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  pc: PChar;
resourcestring
  rsNoModuleName = 'Could not determine module name';
begin
  GetMem(pc, MAX_PATH);
  if Assigned(pc) then
  try
    ZeroMemory(pc, MAX_PATH);
    GetModuleFileName(hInstance, pc, MAX_PATH);
    Label2.Caption := ExtractFilename(string(pc));
  finally
    FreeMem(pc);
  end
  else
    Label1.Caption := rsNoModuleName;
end;

procedure FormShowModal(Parent: Pointer); stdcall;
begin
  Form2 := TForm2.Create(nil);
  if Assigned(Parent) then
    Form2.SetParent(Parent);
  Form2.ShowModal;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
