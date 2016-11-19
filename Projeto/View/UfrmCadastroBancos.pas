unit UfrmCadastroBancos;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, Vcl.Buttons, Vcl.ExtCtrls,
  dxBevel, UBanco, cxTextEdit, cxGroupBox, cxCurrencyEdit;

type
  TfrmCadastroBancos = class(TfrmPadrao)
    gpbNumero: TcxGroupBox;
    gpbSite: TcxGroupBox;
    tedSite: TcxTextEdit;
    cedCodigo: TcxCurrencyEdit;
    gpbNome: TcxGroupBox;
    tedNome: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function GetObjBanco: TBanco;
    { Private declarations }
  protected
    { Protected declarations }
    function LoadObject: Boolean; override;
    function SaveObject: Boolean; override;
  public
    { Public declarations }
    property ObjBanco: TBanco read GetObjBanco;
  end;

var
  frmCadastroBancos: TfrmCadastroBancos;

implementation

uses
  UDialogFunctions;

{$R *.dfm}

procedure TfrmCadastroBancos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmCadastroBancos := nil;
  inherited;
end;

function TfrmCadastroBancos.GetObjBanco: TBanco;
begin
  Result := Self.PersistentObject as TBanco;
end;

function TfrmCadastroBancos.LoadObject: Boolean;
begin
  cedCodigo.Value   := ObjBanco.CodigoBanco;
  cedCodigo.Enabled := False;
  tedNome.Text      := ObjBanco.NomeBanco;
  tedSite.Text      := ObjBanco.SiteBanco;

  Result := True;
end;

function TfrmCadastroBancos.SaveObject: Boolean;
begin
  if ObjBanco.New then
   ObjBanco.CodigoBanco := cedCodigo.EditValue;

  ObjBanco.NomeBanco    := tedNome.Text;
  ObjBanco.SiteBanco    := tedSite.Text;

  try
   Result := inherited SaveObject;
  except
   on E: Exception do
    begin
     if (Pos('VIOLATION', UpperCase(E.Message)) > 0) then
	    TDialogFunctions.Atencao('J� existe um banco cadastrado com os dados informados.');
    end;
  end;

  StayOpen := not Result;
end;

end.
