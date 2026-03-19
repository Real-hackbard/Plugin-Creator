library FormDLL;

uses
  SysUtils,
  DLLForm in 'DLLForm.pas' {Form1};

{$R *.res}

procedure ShowForm; stdcall;
var
  Form: TForm1;
begin
  Form := TForm1.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

exports
  ShowForm;

begin
end.