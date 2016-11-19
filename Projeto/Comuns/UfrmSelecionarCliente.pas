unit UfrmSelecionarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, DBClient, SqlExpr, cxCurrencyEdit, cxTextEdit;

type
  TfrmSelecionarCliente = class(TForm)
    ActionList: TActionList;
    Panel1: TPanel;
    gridDBTableView: TcxGridDBTableView;
    gridLevel: TcxGridLevel;
    grid: TcxGrid;
    cdsCliente: TClientDataSet;
    dtsCliente: TDataSource;
    ActionListConfirm: TAction;
    ActionListClose: TAction;
    gridDBTableViewColumn1: TcxGridDBColumn;
    gridDBTableViewColumn2: TcxGridDBColumn;
    gridDBTableViewColumn3: TcxGridDBColumn;
    cdsClienteINSCRICAO: TStringField;
    cdsClienteIDCLIENTE: TIntegerField;
    cdsClienteNOMECLIENTE: TStringField;
    cdsClienteTIPOINSCRICAO: TIntegerField;
    cdsClienteIDTIPOLOGRADOURO: TIntegerField;
    cdsClienteENDERECO: TStringField;
    cdsClienteNUMERO: TStringField;
    cdsClienteCOMPLEMENTO: TStringField;
    cdsClienteBAIRRO: TStringField;
    cdsClienteIDCIDADE: TIntegerField;
    cdsClienteCEP: TStringField;
    cdsClienteDATANASCIMENTO: TDateField;
    cdsClienteSEXO: TStringField;
    cdsClienteESTADOCIVIL: TStringField;
    cdsClienteEMAILPESSOAL: TStringField;
    cdsClienteEMAILCOMERCIAL: TStringField;
    cdsClienteRACA: TStringField;
    cdsClienteCODIGOAGENCIA: TStringField;
    cdsClienteIDBANCO: TIntegerField;
    cdsClienteOPERACAO: TStringField;
    cdsClienteTIPOCONTA: TStringField;
    cdsClienteCONTA: TStringField;
    cdsClienteDIGITOVERIFICADOR: TStringField;
    cdsClienteSTATUSCLIENTE: TStringField;
    procedure gridDBTableViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure gridDBTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gridDBTableViewDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionListConfirmExecute(Sender: TObject);
    procedure ActionListCloseExecute(Sender: TObject);
    procedure gridDBTableViewKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridDBTableViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridDBTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FCodigoCliente: Integer;
    FCurrentColumn: Integer;
    FNotifyMessage: Cardinal;
    FHasMessage: Boolean;
    class function CreateForm(const CodigoCliente: Integer): TfrmSelecionarCliente;
    procedure CarregarDados;
    procedure SetNotifyMessage(const Value: Cardinal);
    function GetSQLConnection: TSQLConnection;
    property CurrentColumn: Integer read FCurrentColumn write FCurrentColumn;
    property HasMessage: boolean read FHasMessage;
  protected
    { Protected declarations }
    function GetSQL: String;
    procedure DefinirOrdem(Coluna: TcxGridDBColumn; IgnorarColuna: Boolean = False);
    property NotifyMessage: Cardinal read FNotifyMessage write SetNotifyMessage;
  public
    { Public declarations }
    procedure Initialize;
  published
    { Published declaration }
    function Confirm: Boolean;

    class function DialogSelect(var CodigoCliente: Integer): Boolean;
    class function PopupSelect(const StartPoint: TPoint; var CodigoCliente: Integer): Boolean;

    property SQLConnection: TSQLConnection read GetSQLConnection;
    property CodigoCliente: Integer read FCodigoCliente write FCodigoCliente;
  end;

var
  frmSelecionarCliente: TfrmSelecionarCliente;

implementation

uses
  UDBFunctions, UDialogFunctions, UcxGridFunctions, UdmComuns;

{$R *.dfm}

{ TfrmSelecionarCliente }

procedure TfrmSelecionarCliente.ActionListCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSelecionarCliente.ActionListConfirmExecute(Sender: TObject);
begin
  if Self.Confirm then
   ModalResult := mrOK;
end;

procedure TfrmSelecionarCliente.CarregarDados;
var
  ObjQry: TSQLQuery;
begin
  ObjQry := TDBFunctions.SQLDataSet(TSQLQuery, Self.SQLConnection) as TSQLQuery;

  if cdsCliente.Active then cdsCliente.Close;

  try
   ObjQry.SQL.Add(Self.GetSQL);

   TDBFunctions.GetClientDataSet(ObjQry, cdsCliente);
  finally
   ObjQry.Free;
  end;
end;

function TfrmSelecionarCliente.Confirm: Boolean;
var
  sErrorText: string;
  iCodigoCliente: integer;
begin
  Result := True;

  if Result then
   begin
    iCodigoCliente := cdsCliente.FieldByName('IDCLIENTE').AsInteger;

    if Result then
     begin
      Self.CodigoCliente := iCodigoCliente;
      Application.MainForm.Caption := Format('%s - %s', [Application.Title, cdsCliente.FieldByName('NOMECLIENTE').AsString]);
     end
    else if not SameText(sErrorText, '') then
     TDialogFunctions.Erro(sErrorText);
   end;
end;

class function TfrmSelecionarCliente.CreateForm(
  const CodigoCliente: Integer): TfrmSelecionarCliente;
begin
  Result := Self.Create(nil);
  Result.gridDBTableView.OptionsSelection.CellSelect := True;
  Result.CodigoCliente := CodigoCliente;
end;

procedure TfrmSelecionarCliente.DefinirOrdem(Coluna: TcxGridDBColumn;
  IgnorarColuna: Boolean);
begin
  if IgnorarColuna or (Coluna.Index <> Self.CurrentColumn) then
   begin
    TDBFunctions.DefineOrder(cdsCliente, Coluna.DataBinding.FieldName, False);
    TcxGridFunctions.ColumnOrder(Coluna, False);
   end;

  Self.CurrentColumn := Coluna.Index;
end;

class function TfrmSelecionarCliente.DialogSelect(
  var CodigoCliente: Integer): Boolean;
var
  ObjForm: TfrmSelecionarCliente;
begin
  ObjForm := Self.CreateForm(CodigoCliente);
  Result  := ObjForm.ShowModal = mrOK;

  if Result then
   CodigoCliente := ObjForm.CodigoCliente;

  ObjForm.Free;
end;

procedure TfrmSelecionarCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (ModalResult = mrOK) and Self.HasMessage then
   TDialogFunctions.BroadcastMessage(Self.NotifyMessage, CodigoCliente, 0, True);

  frmSelecionarCliente := nil;
end;

procedure TfrmSelecionarCliente.FormShow(Sender: TObject);
begin
  Self.Initialize;
end;

function TfrmSelecionarCliente.GetSQL: String;
begin
  Result := 'SELECT C.*                    '+
            'FROM CLIENTES C               '+
            'WHERE C.STATUSCLIENTE = ''A'' '+
            'ORDER BY C.NOMECLIENTE        ';
end;

function TfrmSelecionarCliente.GetSQLConnection: TSQLConnection;
begin
  Result := dmComuns.SQLConnection;
end;

procedure TfrmSelecionarCliente.gridDBTableViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  gridDBTableView.Controller.FocusedItemIndex := AColumn.Index;
  Self.DefinirOrdem(AColumn as TcxGridDBColumn, True);
end;

procedure TfrmSelecionarCliente.gridDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if not AViewInfo.Selected and (Sender.Controller.FocusedRecord.Values[2] = 'I') then
   ACanvas.Font.Color := clRed;
end;

procedure TfrmSelecionarCliente.gridDBTableViewDblClick(Sender: TObject);
begin
  ActionListConfirm.Execute;
end;

procedure TfrmSelecionarCliente.gridDBTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
   VK_RETURN: ActionListConfirm.Execute;
  end;
end;

procedure TfrmSelecionarCliente.gridDBTableViewKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_LEFT, VK_RIGHT] then
   Self.DefinirOrdem(gridDBTableView.Columns[gridDBTableView.Controller.FocusedItemIndex]);
end;

procedure TfrmSelecionarCliente.gridDBTableViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(gridDBTableView.Controller.FocusedColumn) and (gridDBTableView.Controller.FocusedColumnIndex <> -1) and
     (gridDBTableView.Controller.FocusedRowIndex <> -1) and Assigned(gridDBTableView.Controller.FocusedItem) then
   Sleep(1);

  Self.DefinirOrdem(gridDBTableView.Columns[gridDBTableView.Controller.FocusedColumnIndex]);
end;

procedure TfrmSelecionarCliente.Initialize;
begin
  Self.NotifyMessage := WM_USER + 4;
  Self.CarregarDados;
  Self.DefinirOrdem(gridDBTableView.Columns[0], True);

  if Self.CodigoCliente > 0 then
   cdsCliente.FindKey([Self.CodigoCliente]);
end;

class function TfrmSelecionarCliente.PopupSelect(const StartPoint: TPoint;
  var CodigoCliente: Integer): Boolean;
var
  ObjForm: TfrmSelecionarCliente;
begin
  ObjForm := Self.CreateForm(CodigoCliente);

  try
   ObjForm.Position := poDesigned;
   ObjForm.Left     := StartPoint.X;
   ObjForm.Top      := StartPoint.Y - objForm.Height;

   Result := ObjForm.ShowModal = mrOK;

   if Result then
    CodigoCliente := ObjForm.CodigoCliente;
  finally
   ObjForm.Free;
  end;
end;

procedure TfrmSelecionarCliente.SetNotifyMessage(const Value: Cardinal);
begin
  FNotifyMessage   := Value;
  Self.FHasMessage := Value > WM_USER;
end;

end.
