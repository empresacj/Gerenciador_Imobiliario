unit UfrmMovimentacaoCliente;

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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Padrao, UPersistentObject,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, cxContainer, cxLabel,
  Vcl.Buttons, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Data.FMTBcd,
  SqlExpr, DBClient, Provider, cxCurrencyEdit, cxTextEdit, cxCalendar;

type
  TfrmMovimentacaoCliente = class(TfrmMovimentacao)
    sdsMovimentacao: TSQLDataSet;
    cdsMovimentacao: TClientDataSet;
    dspMovimentacao: TDataSetProvider;
    gridDBTableViewIDCLIENTE: TcxGridDBColumn;
    gridDBTableViewNOMECLIENTE: TcxGridDBColumn;
    gridDBTableViewTIPOINSCRICAO: TcxGridDBColumn;
    gridDBTableViewINSCRICAO: TcxGridDBColumn;
    gridDBTableViewDATANASCIMENTO: TcxGridDBColumn;
    gridDBTableViewSEXO: TcxGridDBColumn;
    gridDBTableViewEMAILPESSOAL: TcxGridDBColumn;
    gridDBTableViewSTATUSCLIENTE: TcxGridDBColumn;
    sdsMovimentacaoIDCLIENTE: TIntegerField;
    sdsMovimentacaoNOMECLIENTE: TStringField;
    sdsMovimentacaoTIPOINSCRICAO: TIntegerField;
    sdsMovimentacaoINSCRICAO: TStringField;
    sdsMovimentacaoIDTIPOLOGRADOURO: TIntegerField;
    sdsMovimentacaoENDERECO: TStringField;
    sdsMovimentacaoNUMERO: TStringField;
    sdsMovimentacaoCOMPLEMENTO: TStringField;
    sdsMovimentacaoBAIRRO: TStringField;
    sdsMovimentacaoIDCIDADE: TIntegerField;
    sdsMovimentacaoCEP: TStringField;
    sdsMovimentacaoDATANASCIMENTO: TDateField;
    sdsMovimentacaoSEXO: TStringField;
    sdsMovimentacaoESTADOCIVIL: TStringField;
    sdsMovimentacaoEMAILPESSOAL: TStringField;
    sdsMovimentacaoEMAILCOMERCIAL: TStringField;
    sdsMovimentacaoRACA: TStringField;
    sdsMovimentacaoCODIGOAGENCIA: TStringField;
    sdsMovimentacaoIDBANCO: TIntegerField;
    sdsMovimentacaoOPERACAO: TStringField;
    sdsMovimentacaoTIPOCONTA: TStringField;
    sdsMovimentacaoCONTA: TStringField;
    sdsMovimentacaoDIGITOVERIFICADOR: TStringField;
    sdsMovimentacaoSTATUSCLIENTE: TStringField;
    cdsMovimentacaoIDCLIENTE: TIntegerField;
    cdsMovimentacaoNOMECLIENTE: TStringField;
    cdsMovimentacaoTIPOINSCRICAO: TIntegerField;
    cdsMovimentacaoINSCRICAO: TStringField;
    cdsMovimentacaoIDTIPOLOGRADOURO: TIntegerField;
    cdsMovimentacaoENDERECO: TStringField;
    cdsMovimentacaoNUMERO: TStringField;
    cdsMovimentacaoCOMPLEMENTO: TStringField;
    cdsMovimentacaoBAIRRO: TStringField;
    cdsMovimentacaoIDCIDADE: TIntegerField;
    cdsMovimentacaoCEP: TStringField;
    cdsMovimentacaoDATANASCIMENTO: TDateField;
    cdsMovimentacaoSEXO: TStringField;
    cdsMovimentacaoESTADOCIVIL: TStringField;
    cdsMovimentacaoEMAILPESSOAL: TStringField;
    cdsMovimentacaoEMAILCOMERCIAL: TStringField;
    cdsMovimentacaoRACA: TStringField;
    cdsMovimentacaoCODIGOAGENCIA: TStringField;
    cdsMovimentacaoIDBANCO: TIntegerField;
    cdsMovimentacaoOPERACAO: TStringField;
    cdsMovimentacaoTIPOCONTA: TStringField;
    cdsMovimentacaoCONTA: TStringField;
    cdsMovimentacaoDIGITOVERIFICADOR: TStringField;
    cdsMovimentacaoSTATUSCLIENTE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsMovimentacaoSEXOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsMovimentacaoTIPOINSCRICAOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsMovimentacaoAfterDelete(DataSet: TDataSet);
    procedure cdsMovimentacaoSTATUSCLIENTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    class function GetFormClass: TfrmPadraoClass; override;
    class function GetPersistentClass: TPersistentObjectClass; override;
  public
    { Public declarations }
  end;

var
  frmMovimentacaoCliente: TfrmMovimentacaoCliente;

implementation

uses
  UdmComuns, UCliente, UfrmCadastroCliente;

{$R *.dfm}

procedure TfrmMovimentacaoCliente.btnStatusClick(Sender: TObject);
begin
  inherited;
  if cdsMovimentacao.ChangeCount > 0 then
   cdsMovimentacao.ApplyUpdates(0);
end;

procedure TfrmMovimentacaoCliente.cdsMovimentacaoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  cdsMovimentacao.ApplyUpdates(0);
end;

procedure TfrmMovimentacaoCliente.cdsMovimentacaoSEXOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if SameText(Sender.AsString, 'F') then
   Text := 'Feminino'
  else Text := 'Masculino';
end;

procedure TfrmMovimentacaoCliente.cdsMovimentacaoSTATUSCLIENTEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if SameText(Sender.AsString, 'A') then
   Text := 'Ativo'
  else Text := 'Inativo';
end;

procedure TfrmMovimentacaoCliente.cdsMovimentacaoTIPOINSCRICAOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  case Sender.AsInteger of
   1: Text := 'CEI';
   2: Text := 'CNPJ';
   3: Text := 'CPF';
  end;

end;

procedure TfrmMovimentacaoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMovimentacaoCliente := nil;
  inherited;
end;

procedure TfrmMovimentacaoCliente.FormShow(Sender: TObject);
begin
  Status := cdsMovimentacaoSTATUSCLIENTE.FieldName;
  inherited;
end;

class function TfrmMovimentacaoCliente.GetFormClass: TfrmPadraoClass;
begin
  Result := TfrmCadastroCliente;
end;

class function TfrmMovimentacaoCliente.GetPersistentClass: TPersistentObjectClass;
begin
  Result := TCliente;
end;

end.
