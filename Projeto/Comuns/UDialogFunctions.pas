unit UDialogFunctions;

interface

uses Windows, Classes;

type
  TDialogFunctions = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
  published
    { published declarations }
    class procedure Atencao(const Mensagem: String);
    class procedure Erro(const Mensagem: String);
    class function Pergunta(const Mensagem: String;
      Flags: Integer = MB_ICONQUESTION + MB_DEFBUTTON2): Boolean;
    class procedure BroadcastMessage(const Message: Cardinal;
      const wParam: Cardinal = 0; const lParam: Cardinal = 0;
      const BySend: Boolean = False);
  end;

implementation

uses
  Forms, SysUtils;

{ TDialogFunctions }

class procedure TDialogFunctions.Atencao(const Mensagem: String);
begin
  Application.MessageBox(PChar(Mensagem),
    PChar(Format('%s - Atenção', [Application.Title])), MB_ICONWARNING + MB_OK);
end;

class procedure TDialogFunctions.BroadcastMessage(const Message, wParam,
  lParam: Cardinal; const BySend: Boolean);
var
  i: integer;
begin
  for i := Screen.FormCount - 1 downto 0 do
   if BySend then
    SendMessage(Screen.Forms[i].Handle, Message, wParam, lParam)
   else PostMessage(Screen.Forms[i].Handle, Message, wParam, lParam);
end;

class procedure TDialogFunctions.Erro(const Mensagem: String);
begin
  Application.MessageBox(PChar(Mensagem),
    PChar(Format('%s - Erro', [Application.Title])), MB_ICONERROR + MB_OK);
end;

class function TDialogFunctions.Pergunta(const Mensagem: String;
  Flags: Integer): Boolean;
begin
  Result := Application.MessageBox(PChar(Mensagem),
    PChar(Format('%s - Pergunta', [Application.Title])),
    MB_YESNO + Flags) = ID_YES;
end;

end.
