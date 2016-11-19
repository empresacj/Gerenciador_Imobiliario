unit UfrmDialogoPesquisa;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLabel, Vcl.Buttons,
  Vcl.ExtCtrls, dxBevel, Datasnap.DBClient, UPersistentObject;

type
  TfrmDialogoPesquisa = class(TfrmPadrao)
    gridDBTableView: TcxGridDBTableView;
    gridLevel: TcxGridLevel;
    grid: TcxGrid;
    dtsGrid: TDataSource;
    cdsGrid: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridDBTableViewDblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    class function Execute(const Table, Where, Order: String; DisplayFields, ResultFields: TStringList;  PersistentObject: TPersistentObject): Boolean; overload;
  end;

var
  frmDialogoPesquisa: TfrmDialogoPesquisa;

implementation

uses
  SqlExpr, UDBFunctions, UdmComuns, UDialogFunctions;

{$R *.dfm}

procedure TfrmDialogoPesquisa.btnSalvarClick(Sender: TObject);
begin
  if cdsGrid.RecordCount = 0 then
   TDialogFunctions.Erro('N�o registros para selecionar...')
  else inherited;
end;

class function TfrmDialogoPesquisa.Execute(const Table, Where, Order: String;
  DisplayFields, ResultFields: TStringList;
  PersistentObject: TPersistentObject): Boolean;
var
  i: Integer;
  ObjQry: TSQLQuery;
  ObjForm: TfrmDialogoPesquisa;
  sFields: String;
begin
  ObjForm       := TfrmDialogoPesquisa.Create(nil);
  ObjQry        := TDBFunctions.SQLDataSet(TSQLQuery, dmComuns.SQLConnection) as TSQLQuery;
  sFields       := '';

  for i := 0 to ResultFields.Count - 1 do
   begin
    if SameText(sFields, '') then
     sFields := ResultFields[i]
    else
     sFields := sFields + ',' + ResultFields[i];
   end;


  try
   objQry.SQL.Add(Format('SELECT %s FROM %s', [sFields, Table]));

   if not SameText(Where, '') then
    ObjQry.SQL.Add(Format('WHERE %s', [Where]));

   if not SameText(Order, '') then
    ObjQry.SQL.Add(Format('ORDER BY %s', [Order]));

   TDBFunctions.GetClientDataSet(ObjQry, ObjForm.cdsGrid);

   for i := 0 to DisplayFields.Count - 1 do
    begin
     ObjForm.cdsGrid.FieldByName(ResultFields[i]).DisplayLabel := DisplayFields[i];
     ObjForm.cdsGrid.FieldByName(ResultFields[i]).Visible      := True;
     ObjForm.gridDBTableView.DataController.CreateItemByField(ObjForm.cdsGrid.FieldByName(ResultFields[i]));
    end;

//   if Assigned(PersistentObject) then
//    ObjForm.Caption := ObjForm.Caption + PersistentObject.AsString;

   Result := objForm.ShowModal = mrOk;

   if Result then
    TPersistentObject.FromDataSet(ObjForm.cdsGrid, PersistentObject, nil);

  finally
   ObjQry.Free;
   ObjForm.Free;
  end;
end;

procedure TfrmDialogoPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmDialogoPesquisa := nil;
  inherited;
end;

procedure TfrmDialogoPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_RETURN: btnSalvar.Click;
   else inherited;
  end;
end;

procedure TfrmDialogoPesquisa.gridDBTableViewDblClick(Sender: TObject);
begin
  inherited;
  btnSalvar.Click;
end;

end.
