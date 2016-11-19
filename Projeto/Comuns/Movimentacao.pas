unit Movimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, Data.DB, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox,
  UPersistentObject, Padrao;

type
  TfrmMovimentacao = class(TForm)
    Panel: TPanel;
    dtsMovimentacao: TDataSource;
    gridDBTableView: TcxGridDBTableView;
    gridLevel: TcxGridLevel;
    grid: TcxGrid;
    PanelBotoes: TPanel;
    btnInserir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnFechar: TSpeedButton;
    btnAjuda: TSpeedButton;
    btnExtras: TSpeedButton;
    lblInsert: TcxLabel;
    lblEditar: TcxLabel;
    lblDeletar: TcxLabel;
    lblFechar: TcxLabel;
    lblAjuda: TcxLabel;
    lblExtras: TcxLabel;
    btnStatus: TSpeedButton;
    lblStatus: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnExtrasClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridDBTableViewDblClick(Sender: TObject);
  private
    { Private declarations }
    FStatus: String;
    FTemStatus: Boolean;
    procedure ConfigurarGrid;
    procedure GridCustomDraw(Sender: TcxCustomGridTableView;
     ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean); virtual;
    procedure SetStatus(const Value: String);
  protected
    { Protected declarations }
    procedure PerformObjectInsert;
    procedure PerformObjectEdit;

    class function GetPersistentClass: TPersistentObjectClass; virtual;
    class function GetFormClass: TfrmPadraoClass; virtual;

    procedure Inicializacao; virtual;
    procedure Destruicao; virtual;
  public
    { Public declarations }
    property Status: String read FStatus write SetStatus;
  end;

var
  frmMovimentacao: TfrmMovimentacao;

implementation

uses
  UDialogFunctions, UdmComuns, StrUtils, UStringFunctions;

{$R *.dfm}

procedure TfrmMovimentacao.btnDeletarClick(Sender: TObject);
begin
 if dtsMovimentacao.DataSet.RecordCount = 0 then
  begin
   TDialogFunctions.Erro('Não há registros para serem excluídos!');
   Exit;
  end;

 if TDialogFunctions.Pergunta('Deseja realmente excluir o registro selecionado ?', MB_ICONQUESTION) then
  dtsMovimentacao.DataSet.Delete;
end;

procedure TfrmMovimentacao.btnEditarClick(Sender: TObject);
begin
  if (Self.GetFormClass <> nil) and (Self.GetPersistentClass <> nil) then
   PerformObjectEdit;
end;

procedure TfrmMovimentacao.btnExtrasClick(Sender: TObject);
begin
  if btnExtras.PopupMenu <> nil then
   btnExtras.PopupMenu.Popup(btnExtras.ClientOrigin.X, btnExtras.ClientOrigin.Y - btnExtras.Height);
end;

procedure TfrmMovimentacao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMovimentacao.btnInserirClick(Sender: TObject);
begin
  if (Self.GetFormClass <> nil) and (Self.GetPersistentClass <> nil) then
   PerformObjectInsert;
end;

procedure TfrmMovimentacao.btnStatusClick(Sender: TObject);
begin
 if dtsMovimentacao.DataSet.RecordCount > 0 then
  begin
   if TDialogFunctions.Pergunta('Deseja ' + IfThen(dtsMovimentacao.DataSet.FieldByName(FStatus).AsString = 'A', 'desativar', 'reativar') + ' esse registro?') then
    begin
     dtsMovimentacao.DataSet.Tag := 1;
     dtsMovimentacao.DataSet.Edit;
     dtsMovimentacao.DataSet.FieldByName(FStatus).AsString := IfThen(dtsMovimentacao.DataSet.FieldByName(FStatus).AsString = 'A','I','A');
     dtsMovimentacao.DataSet.Post;
    end;
  end;
end;

procedure TfrmMovimentacao.ConfigurarGrid;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
   if (Self.Components[i] is TcxGridDBTableView) then
    (Self.Components[i] as TcxGridDBTableView).OnCustomDrawCell  := GridCustomDraw;
end;

procedure TfrmMovimentacao.Destruicao;
begin
//
end;

procedure TfrmMovimentacao.FormActivate(Sender: TObject);
begin
  if not dtsMovimentacao.DataSet.Active then
   dtsMovimentacao.DataSet.Open;
end;

procedure TfrmMovimentacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmComuns.RemoveFromWindowsList(TForm(Pointer(TComponent(Sender))));
  Application.OnHint := nil;
  Release;
end;

procedure TfrmMovimentacao.FormCreate(Sender: TObject);
begin
  Self.ConfigurarGrid;
end;

procedure TfrmMovimentacao.FormDestroy(Sender: TObject);
begin
  Destruicao;
end;

procedure TfrmMovimentacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {$IFDEF DEBUG}
   if Shift = [ssShift] then
    begin
     if Key = VK_UP then
      TDialogFunctions.Atencao(Self.Name);
    end;
  {$ENDIF}

   case Key of
    VK_INSERT: if btnInserir.Enabled then btnInserir.Click;
    VK_RETURN: if btnEditar.Enabled then btnEditar.Click else Perform(WM_NextDlgCtl, 0, 0);
    VK_DELETE: if btnDeletar.Enabled then btnDeletar.Click;
    VK_ESCAPE: if btnFechar.Enabled then btnFechar.Click;
    VK_F1    : if btnAjuda.Enabled then btnAjuda.Click;
    VK_F5    : dtsMovimentacao.DataSet.Refresh;
    VK_F6    : if btnStatus.Enabled then btnStatus.Click;
    VK_F10   : if btnExtras.Enabled then btnExtras.Click
   end;
end;

procedure TfrmMovimentacao.FormShow(Sender: TObject);
begin
  Inicializacao;

  btnStatus.Visible  := FTemStatus;
  lblStatus.Visible  := FTemStatus;
end;

class function TfrmMovimentacao.GetFormClass: TfrmPadraoClass;
begin
  Result := nil;
end;

class function TfrmMovimentacao.GetPersistentClass: TPersistentObjectClass;
begin
  Result := nil;
end;

procedure TfrmMovimentacao.GridCustomDraw(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if (FTemStatus) then
   if Copy(Trim(VarToStr(AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName(FStatus).Index])), 1, 1) = 'I' then
    ACanvas.Font.Color := clRed;
end;

procedure TfrmMovimentacao.gridDBTableViewDblClick(Sender: TObject);
begin
  if btnEditar.Enabled then btnEditar.Click;
end;

procedure TfrmMovimentacao.Inicializacao;
begin
//
end;

procedure TfrmMovimentacao.PerformObjectEdit;
var
  PersistentObject: TPersistentObject;
  BookMark : Pointer;
begin
  if dtsMovimentacao.DataSet.RecordCount = 0 then
   begin
    btnInserir.Click;
    Exit;
   end;

  PersistentObject := Self.GetPersistentClass.Create(dmComuns.SQLConnection);

  try
   Self.GetPersistentClass.FromDataSet(dtsMovimentacao.DataSet, PersistentObject, nil);

   PersistentObject.New := False;
   BookMark             := dtsMovimentacao.DataSet.GetBookmark;

   if Self.GetFormClass.Execute(PersistentObject, nil) then
    dtsMovimentacao.DataSet.Refresh;

   dtsMovimentacao.DataSet.GotoBookmark(BookMark);
   dtsMovimentacao.DataSet.FreeBookmark(BookMark);
  finally
   PersistentObject.Free;
  end;
end;

procedure TfrmMovimentacao.PerformObjectInsert;
var
  PersistentObject: TPersistentObject;
  bIncluiu: Boolean;
begin
  PersistentObject := Self.GetPersistentClass.Create(dmComuns.SQLConnection);

  try
   bIncluiu := Self.GetFormClass.Execute(PersistentObject, nil);

   if dtsMovimentacao.DataSet.State = dsInsert then
    dtsMovimentacao.DataSet.Cancel;

   dtsMovimentacao.DataSet.Refresh;
  finally
   PersistentObject.Free;
  end;
end;

procedure TfrmMovimentacao.SetStatus(const Value: String);
begin
  FStatus    := Value;
  FTemStatus := TStringFunctions.IsFull(FStatus);
end;

end.
