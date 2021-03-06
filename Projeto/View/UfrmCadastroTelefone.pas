unit UfrmCadastroTelefone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Padrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxLabel, Vcl.Buttons,
  Vcl.ExtCtrls, dxBevel, cxTextEdit, cxMaskEdit, cxDropDownEdit, UTelefone;

type
  TfrmCadastroTelefone = class(TfrmPadrao)
    gpbTipo: TcxGroupBox;
    gpbNumero: TcxGroupBox;
    cboTipo: TcxComboBox;
    mskNumero: TcxMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboTipoPropertiesEditValueChanged(Sender: TObject);
  private
    function GetObjTelefone: TTelefone;
    { Private declarations }
    function GetTipoTelefone(const Tipo: Integer): String;
    function SetTipoTelefone(const Tipo: String): Integer;
  protected
    { Protected declarations }
    function LoadObject: Boolean; override;
    function SaveObject: Boolean; override;
  public
    { Public declarations }
    property ObjTelefone: TTelefone read GetObjTelefone;
  end;

var
  frmCadastroTelefone: TfrmCadastroTelefone;

implementation

{$R *.dfm}

procedure TfrmCadastroTelefone.cboTipoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if cboTipo.ItemIndex = 0 then
   mskNumero.Properties.EditMask := '(99\)00000-0000;1;_'
  else
   mskNumero.Properties.EditMask := '(99\)0000-0000;1;_';
end;

procedure TfrmCadastroTelefone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmCadastroTelefone := nil;
  inherited;
end;

function TfrmCadastroTelefone.GetObjTelefone: TTelefone;
begin
  Result := Self.PersistentObject as TTelefone;
end;

function TfrmCadastroTelefone.GetTipoTelefone(const Tipo: Integer): String;
begin
  case Tipo of
   0: Result := 'C';
   1: Result := 'F';
   2: Result := 'R';
   3: Result := 'X';
  end;
end;

function TfrmCadastroTelefone.LoadObject: Boolean;
begin
  cboTipo.ItemIndex := SetTipoTelefone(ObjTelefone.TipoTelefone);
  mskNumero.Text    := ObjTelefone.NumeroTelefone;

  Result := True;
end;

function TfrmCadastroTelefone.SaveObject: Boolean;
begin
  ObjTelefone.TipoTelefone   := GetTipoTelefone(cboTipo.ItemIndex);
  ObjTelefone.NumeroTelefone := mskNumero.Text;

  StayOpen := False;
end;

function TfrmCadastroTelefone.SetTipoTelefone(const Tipo: String): Integer;
begin
  if SameText(Tipo, 'C') then
   Result := 0
  else if SameText(Tipo, 'F') then
   Result := 1
  else if SameText(Tipo, 'R') then
   Result := 2
  else if SameText(Tipo, 'X') then
   Result := 3
end;

end.
