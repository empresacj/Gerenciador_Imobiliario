unit UfrmMovimentacaoBancos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Movimentacao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, cxLabel,
  Vcl.Buttons, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Padrao, UPersistentObject,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  cxCurrencyEdit, cxTextEdit;

type
  TfrmMovimentacaoBancos = class(TfrmMovimentacao)
    sdsMovimentacao: TSQLDataSet;
    dspMovimentacao: TDataSetProvider;
    cdsMovimentacao: TClientDataSet;
    sdsMovimentacaoIDBANCO: TIntegerField;
    sdsMovimentacaoNOMEBANCO: TStringField;
    sdsMovimentacaoSITEBANCO: TStringField;
    cdsMovimentacaoIDBANCO: TIntegerField;
    cdsMovimentacaoNOMEBANCO: TStringField;
    cdsMovimentacaoSITEBANCO: TStringField;
    gridDBTableViewIDBANCO: TcxGridDBColumn;
    gridDBTableViewNOMEBANCO: TcxGridDBColumn;
    gridDBTableViewSITEBANCO: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsMovimentacaoAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    { Protected declarations }
    class function GetPersistentClass: TPersistentObjectClass; override;
    class function GetFormClass: TfrmPadraoClass; override;
  public
    { Public declarations }
  end;

var
  frmMovimentacaoBancos: TfrmMovimentacaoBancos;

implementation

uses
  UBanco, UdmComuns, UfrmCadastroBancos;

{$R *.dfm}

procedure TfrmMovimentacaoBancos.cdsMovimentacaoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  cdsMovimentacao.ApplyUpdates(0);
end;

procedure TfrmMovimentacaoBancos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMovimentacaoBancos := nil;
  inherited;
end;

class function TfrmMovimentacaoBancos.GetFormClass: TfrmPadraoClass;
begin
  Result := TfrmCadastroBancos;
end;

class function TfrmMovimentacaoBancos.GetPersistentClass: TPersistentObjectClass;
begin
  Result := TBanco;
end;

end.
