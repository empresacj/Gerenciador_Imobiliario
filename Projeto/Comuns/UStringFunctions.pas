unit UStringFunctions;

interface

type
  TStringFunctions = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
  published
    { published declarations }
    class function ExtractNotNumbers(Value: String): String;
    class function IsEmpty(const Value: String; Trim: Boolean = True): Boolean;
    class function IsFull(const Value: String; Trim: Boolean = True): Boolean;
    class function IsNumber(const Char: String): Boolean;
  end;

implementation

uses
  StrUtils, SysUtils;

{ TStringFunctions }

class function TStringFunctions.ExtractNotNumbers(Value: String): String;
var
  i: integer;
begin
  i := 1;

  while i <= Length(Value) do
   begin
    if not IsNumber(Value[i]) then
     begin
      Delete(Value, i, 1);
      i := 0;
     end;
    Inc(i);
   end;

  Result := IfThen(IsFull(Value), Value);
end;

class function TStringFunctions.IsEmpty(const Value: String;
  Trim: Boolean): Boolean;
begin
  if Trim then
   Result := SysUtils.Trim(Value) = ''
  else Result := Value = '';
end;

class function TStringFunctions.IsFull(const Value: String;
  Trim: Boolean): Boolean;
begin
  Result := not IsEmpty(Value, Trim);
end;

class function TStringFunctions.IsNumber(const Char: String): Boolean;
var
 iChr: integer;
begin
  Result := True;

  for iChr := 1 to length(Char) do
   if not (Char[iChr] in ['0'..'9']) then
    begin
     Result := False;
     Break;
    end;
end;

end.
