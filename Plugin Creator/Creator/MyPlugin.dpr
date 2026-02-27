library MyPlugin;

uses
  SysUtils, Classes, FormUnit;

{$R *.res}

const
  MENUCAP = 'my first Plugin';

function MenuCaption(pStr: PChar; iStrLen: Integer): Integer; stdcall;
var
  s: String;
begin
  s := MENUCAP;
  Result := length(s);
  StrLCopy(pStr, PChar(s), Result);
end;

procedure LoadPlugin; stdcall;
begin
  // Displayed form
  FormShowModal(nil);
end;

exports
  LoadPlugin,
  MenuCaption;

end.

