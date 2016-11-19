unit UfrmMovimentacaoAgencias;

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
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, cxCurrencyEdit, cxTextEdit,
  Padrao, UPersistentObject;

type
  TfrmMovimentacaoAgencias = class(TfrmMovimentacao)
    sdsMovimentacao: TSQLDataSet;
    dspMovimentacao: TDataSetProvider;
    cdsMovimentacao: TClientDataSet;
    sdsMovimentacaoCODIGOAGENCIA: TStringField;
    sdsMovimentacaoIDBANCO: TIntegerField;
    sdsMovimentacaoNOMEAGENCIA: TStringField;
    sdsMovimentacaoDIGITOVERIFICADORAGENCIA: TStringField;
    sdsMovimentacaoENDERECOAGENCIA: TStringField;
    sdsMovimentacaoNUMEROAGENCIA: TStringField;
    sdsMovimentacaoBAIRROAGENCIA: TStringField;
    sdsMovimentacaoIDCIDADE: TIntegerField;
    sdsMovimentacaoEMAILAGENCIA: TStringField;
    sdsMovimentacaoNOMEBANCO: TStringField;
    cdsMovimentacaoCODIGOAGENCIA: TStringField;
    cdsMovimentacaoIDBANCO: TIntegerField;
    cdsMovimentacaoNOMEAGENCIA: TStringField;
    cdsMovimentacaoDIGITOVERIFICADORAGENCIA: TStringField;
    cdsMovimentacaoENDERECOAGENCIA: TStringField;
    cdsMovimentacaoNUMEROAGENCIA: TStringField;
    cdsMovimentacaoBAIRROAGENCIA: TStringField;
    cdsMovimentacaoIDCIDADE: TIntegerField;
    cdsMovimentacaoEMAILAGENCIA: TStringField;
    cdsMovimentacaoNOMEBANCO: TStringField;
    gridDBTableViewCODIGOAGENCIA: TcxGridDBColumn;
    gridDBTableViewNOMEAGENCIA: TcxGridDBColumn;
    gridDBTableViewENDERECOAGENCIA: TcxGridDBColumn;
    gridDBTableViewNUMEROAGENCIA: TcxGridDBColumn;
    gridDBTableViewBAIRROAGENCIA: TcxGridDBColumn;
    gridDBTableViewEMAILAGENCIA: TcxGridDBColumn;
    gridDBTableViewNOMEBANCO: TcxGridDBColumn;
    sdsMovimentacaoNOMECIDADE: TStringField;
    cdsMovimentacaoNOMECIDADE: TStringField;
    gridDBTableViewNOMECIDADE: TcxGridDBColumn;
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
  frmMovimentacaoAgencias: TfrmMovimentacaoAgencias;

implementation

uses
  UAgencia, UdmComuns, UfrmCadastroAgencias;

{$R *.dfm}

{ TfrmMovimentacaoAgencias }

procedure TfrmMovimentacaoAgencias.cdsMovimentacaoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  cdsMovimentacao.ApplyUpdates(0);
end;

procedure TfrmMovimentacaoAgencias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMovimentacaoAgencias := nil;
  inherited;
end;

class function TfrmMovimentacaoAgencias.GetFormClass: TfrmPadraoClass;
begin
  Result := TfrmCadastroAgencias;
end;

class function TfrmMovimentacaoAgencias.GetPersistentClass: TPersistentObjectClass;
begin
  Result := TAgencia;
end;

end.
