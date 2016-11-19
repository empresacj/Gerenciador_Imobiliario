unit UfrmCadastroCliente;

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
  dxBevel, UCliente, cxGroupBox, cxRadioGroup, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DBClient, FMTBcd, Provider, SqlExpr, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxButtonEdit, UCidade, UBanco, UAgencia, UdmComuns, UTelefone, Data.DB;

type
  TfrmCadastroCliente = class(TfrmPadrao)
    gpbNome: TcxGroupBox;
    rdgTipoInscricao: TcxRadioGroup;
    gpbInscricao: TcxGroupBox;
    tedNome: TcxTextEdit;
    tedInscricao: TcxMaskEdit;
    gpbTipoLogradorou: TcxGroupBox;
    lkeTipoLogradouro: TcxLookupComboBox;
    cdsTipoLogradouro: TClientDataSet;
    dtsTipoLogradouro: TDataSource;
    cdsTipoLogradouroIDTIPOLOGRADOURO: TIntegerField;
    cdsTipoLogradouroTIPOLOGRADOURO: TStringField;
    cdsTipoLogradouroABREVIATURA: TStringField;
    gpbEndereco: TcxGroupBox;
    tedEndereco: TcxTextEdit;
    gpbNumero: TcxGroupBox;
    tedNumero: TcxTextEdit;
    gpbComplemento: TcxGroupBox;
    tedComplemento: TcxTextEdit;
    gpbBairro: TcxGroupBox;
    tedBairro: TcxTextEdit;
    gpbCidade: TcxGroupBox;
    gpbCep: TcxGroupBox;
    mskCep: TcxMaskEdit;
    gpbDataNascimento: TcxGroupBox;
    rdgSexo: TcxRadioGroup;
    rdgEstadoCivil: TcxRadioGroup;
    dteNascimento: TcxDateEdit;
    rdgRaca: TcxRadioGroup;
    gpbEmailPessoal: TcxGroupBox;
    gpbEmailComercial: TcxGroupBox;
    tedEmailPessoal: TcxTextEdit;
    tedEmailComercial: TcxTextEdit;
    gpbTelefone: TcxGroupBox;
    Panel1: TPanel;
    gridTelefoneDBTableView: TcxGridDBTableView;
    gridTelefoneLevel: TcxGridLevel;
    gridTelefone: TcxGrid;
    btnInserirTelefone: TSpeedButton;
    btnEditarTelefone: TSpeedButton;
    btnDeletarTelefone: TSpeedButton;
    cdsTelefones: TClientDataSet;
    dtsTelefones: TDataSource;
    gridTelefoneDBTableViewTIPOTELEFONE: TcxGridDBColumn;
    gridTelefoneDBTableViewNUMEROTELEFONE: TcxGridDBColumn;
    gpbBanco: TcxGroupBox;
    bteCidade: TcxButtonEdit;
    bteBanco: TcxButtonEdit;
    btnCadastrarBanco: TSpeedButton;
    gpbAgencia: TcxGroupBox;
    bteAgencia: TcxButtonEdit;
    btnCadastrarAgencia: TSpeedButton;
    gpbOperacao: TcxGroupBox;
    gpbTipoConta: TcxGroupBox;
    gpbConta: TcxGroupBox;
    gpbDv: TcxGroupBox;
    tedOperacao: TcxTextEdit;
    cboTipoConta: TcxComboBox;
    tedDV: TcxTextEdit;
    tedConta: TcxTextEdit;
    sdsTipoLogradouro: TSQLDataSet;
    sdsTipoLogradouroIDTIPOLOGRADOURO: TIntegerField;
    sdsTipoLogradouroTIPOLOGRADOURO: TStringField;
    sdsTipoLogradouroABREVIATURA: TStringField;
    dspTipoLogradouro: TDataSetProvider;
    sdsTelefones: TSQLDataSet;
    dspTelefones: TDataSetProvider;
    sdsTelefonesIDTELEFONE: TIntegerField;
    sdsTelefonesTIPOTELEFONE: TStringField;
    sdsTelefonesNUMEROTELEFONE: TStringField;
    sdsTelefonesIDCLIENTE: TIntegerField;
    sdsTelefonesCODIGOAGENCIA: TStringField;
    sdsTelefonesIDBANCO: TIntegerField;
    cdsTelefonesIDTELEFONE: TIntegerField;
    cdsTelefonesTIPOTELEFONE: TStringField;
    cdsTelefonesNUMEROTELEFONE: TStringField;
    cdsTelefonesIDCLIENTE: TIntegerField;
    cdsTelefonesCODIGOAGENCIA: TStringField;
    cdsTelefonesIDBANCO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridTelefoneDBTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bteBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bteAgenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bteCidadePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rdgTipoInscricaoPropertiesEditValueChanged(Sender: TObject);
    procedure bteBancoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bteBancoPropertiesEditValueChanged(Sender: TObject);
    procedure bteAgenciaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnCadastrarBancoClick(Sender: TObject);
    procedure btnCadastrarAgenciaClick(Sender: TObject);
    procedure btnInserirTelefoneClick(Sender: TObject);
    procedure cdsTelefonesTIPOTELEFONEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnDeletarTelefoneClick(Sender: TObject);
  private
    { Private declarations }
    FObjCidade:  TCidade;
    FObjBanco:   TBanco;
    FObjAgencia: TAgencia;
    FObjTelefone: TTelefone;
    function GetObjCliente: TCliente;

    procedure ConfigurarInformacoesBanco(const Obrigatorio: Boolean);
  protected
    { Protected declarations }
    procedure Inicializacao; override;
    function LoadObject: Boolean; override;
    function SaveObject: Boolean; override;
    procedure Destruicao; override;
  public
    { Public declarations }
    property ObjCliente:  TCliente  read GetObjCliente;
    property ObjCidade:   TCidade   read FObjCidade   write FObjCidade;
    property ObjBanco:    TBanco    read FObjBanco    write FObjBanco;
    property ObjAgencia:  TAgencia  read FObjAgencia  write FObjAgencia;
    property ObjTelefone: TTelefone read FObjTelefone write FObjTelefone;
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

uses
  UDBFunctions, UClienteControle, UfrmDialogoPesquisa, UStringFunctions, StrUtils,
  Math, UfrmCadastroBancos, UfrmCadastroAgencias, UfrmCadastroTelefone,
  UDialogFunctions;

{$R *.dfm}

procedure TfrmCadastroCliente.bteAgenciaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_INSERT) Then btnCadastrarAgencia.Click;
end;

procedure TfrmCadastroCliente.bteAgenciaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  DisplayFields, ResultFields: TStringList;
begin
  inherited;
  DisplayFields := ClienteControle.DisplayFields_Codigo_Nome;
  ResultFields  := ClienteControle.ResultFields_CodigoAgencia_NomeAgencia;

  if TfrmDialogoPesquisa.Execute('AGENCIAS', Format('IDBANCO = %d', [ObjBanco.CodigoBanco]), '', DisplayFields, ResultFields, ObjAgencia) then
   bteAgencia.Text := Format('%s - %s', [ObjAgencia.CodigoAgencia, ObjAgencia.NomeAgencia]);
end;

procedure TfrmCadastroCliente.bteBancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_INSERT) Then btnCadastrarBanco.Click;
end;

procedure TfrmCadastroCliente.bteBancoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  DisplayFields, ResultFields: TStringList;
begin
  inherited;
  DisplayFields := ClienteControle.DisplayFields_CodigoBanco_NomeBanco_SiteBanco;
  ResultFields  := ClienteControle.ResultFields_CodigoBanco_NomeBanco_SiteBanco;

  if TfrmDialogoPesquisa.Execute('BANCOS', '', '', DisplayFields, ResultFields, ObjBanco) then
   bteBanco.Text := Format('%d - %s', [ObjBanco.CodigoBanco, ObjBanco.NomeBanco]);
end;

procedure TfrmCadastroCliente.bteBancoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  ConfigurarInformacoesBanco(TStringFunctions.IsFull(bteBanco.Text));
end;

procedure TfrmCadastroCliente.bteCidadePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  DisplayFields, ResultFields: TStringList;
begin
  inherited;
  DisplayFields := ClienteControle.DisplayFields_Codigo_Nome;
  ResultFields  := ClienteControle.ResultFields_CodigoCidade_NomeCidade;

  if TfrmDialogoPesquisa.Execute('CIDADES', '', '', DisplayFields, ResultFields, ObjCidade) then
   bteCidade.Text := ObjCidade.NomeCidade;
end;

procedure TfrmCadastroCliente.btnCadastrarAgenciaClick(Sender: TObject);
var
  ObjCadastroAgencia: TAgencia;
begin
  inherited;
  ObjCadastroAgencia := TAgencia.Create(dmComuns.SQLConnection);

  try
   if TfrmCadastroAgencias.Execute(ObjCadastroAgencia, nil) then
    begin
     if ObjAgencia.Find(Format('CODIGOAGENCIA = %s AND IDBANCO = %d', [ObjCadastroAgencia.CodigoAgencia, ObjCadastroAgencia.CodigoBanco])) then
      bteAgencia.Text := Format('%s - %s', [ObjAgencia.CodigoAgencia, ObjAgencia.NomeAgencia]);
    end;
  finally
   ObjCadastroAgencia.Free;
  end;
end;

procedure TfrmCadastroCliente.btnCadastrarBancoClick(Sender: TObject);
var
  ObjCadastroBanco: TBanco;
begin
  inherited;
  ObjCadastroBanco := TBanco.Create(dmComuns.SQLConnection);

  try
   if TfrmCadastroBancos.Execute(ObjCadastroBanco, nil) then
    begin
     if ObjBanco.Find(Format('IDBANCO = %d', [ObjCadastroBanco.CodigoBanco])) then
      bteBanco.Text := Format('%d - %s', [ObjBanco.CodigoBanco, ObjBanco.NomeBanco]);
    end;
  finally
   ObjCadastroBanco.Free;
  end;
end;

procedure TfrmCadastroCliente.btnDeletarTelefoneClick(Sender: TObject);
begin
  inherited;
  if cdsTelefones.RecordCount > 0 then
   cdsTelefones.Delete
  else TDialogFunctions.Erro('N�o h� registros para serem exclu�dos!');
end;

procedure TfrmCadastroCliente.btnInserirTelefoneClick(Sender: TObject);
begin
  inherited;
  if Sender = btnEditarTelefone then
   begin
    ObjTelefone.FromDataSet(cdsTelefones, ObjTelefone, nil);
    ObjTelefone.New := False;
   end
  else if ObjCliente.CodigoCliente > 0 then
   ObjTelefone.CodigoCliente := ObjCliente.CodigoCliente
  else
   ObjTelefone.CodigoCliente := TDBFunctions.GetSequence('GNRCLIENTES');

  try
   if TfrmCadastroTelefone.Execute(ObjTelefone, nil) then
    begin
     if Sender = btnEditarTelefone then
      begin
       cdsTelefones.Edit;
       cdsTelefones.FieldByName('IDTELEFONE').AsInteger  := ObjTelefone.CodigoTelefone;
      end
     else
      begin
       cdsTelefones.Append;
       cdsTelefones.FieldByName('IDTELEFONE').AsInteger  := TDBFunctions.GetSequence('GNRTELEFONES');
      end;

     cdsTelefones.FieldByName('IDCLIENTE').AsInteger     := ObjTelefone.CodigoCliente;
     cdsTelefones.FieldByName('TIPOTELEFONE').AsString   := ObjTelefone.TipoTelefone;
     cdsTelefones.FieldByName('NUMEROTELEFONE').AsString := ObjTelefone.NumeroTelefone;
     cdsTelefones.Post;
    end;
  finally
  end;
end;

procedure TfrmCadastroCliente.cdsTelefonesTIPOTELEFONEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if SameText(Sender.AsString, 'F') then
   Text := 'Fixo'
  else if SameText(Sender.AsString, 'C') then
   Text := 'Celular'
  else if SameText(Sender.AsString, 'R') then
   Text := 'Rural'
  else if SameText(Sender.AsString, 'X') then
   Text := 'Fax';
end;

procedure TfrmCadastroCliente.ConfigurarInformacoesBanco(
  const Obrigatorio: Boolean);
begin
  if Obrigatorio then
   begin
    bteBanco.Tag     := 1;
    bteAgencia.Tag   := 1;
    cboTipoConta.Tag := 1;
    tedConta.Tag     := 1;
   end
  else
   begin
    bteBanco.Tag     := 0;
    bteAgencia.Tag   := 0;
    cboTipoConta.Tag := 0;
    tedConta.Tag     := 0;
   end;

  Self.ConfigurarObrigatoriedade;
end;

procedure TfrmCadastroCliente.Destruicao;
begin
  inherited;
  ObjBanco.Free;
  ObjCidade.Free;
  ObjAgencia.Free;
  ObjTelefone.Free;
end;

procedure TfrmCadastroCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmCadastroCliente := nil;
  inherited;
end;

function TfrmCadastroCliente.GetObjCliente: TCliente;
begin
  Result := Self.PersistentObject as TCliente;
end;

procedure TfrmCadastroCliente.gridTelefoneDBTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
   VK_INSERT: btnInserirTelefone.Click;
   VK_RETURN: btnEditarTelefone.Click;
   VK_DELETE: btnDeletarTelefone.Click;
  end;
end;

procedure TfrmCadastroCliente.Inicializacao;
begin
  inherited;
  ObjTelefone := TTelefone.Create(dmComuns.SQLConnection);
  ObjAgencia  := TAgencia.Create(dmComuns.SQLConnection);
  ObjCidade   := TCidade.Create(dmComuns.SQLConnection);
  ObjBanco    := TBanco.Create(dmComuns.SQLConnection);

  ClienteControle.Create(dmComuns.SQLConnection);
  cdsTipoLogradouro.Open;
end;

function TfrmCadastroCliente.LoadObject: Boolean;
begin
  rdgTipoInscricao.ItemIndex  := ObjCliente.TipoInscricao + 1;
  tedInscricao.EditValue      := ObjCliente.Inscricao;
  tedNome.EditValue           := ObjCliente.NomeCliente;
  lkeTipoLogradouro.EditValue := ObjCliente.CodigoLogradouro;
  tedEndereco.EditValue       := ObjCliente.EnderecoCliente;
  tedNumero.EditValue         := ObjCliente.NumeroCliente;
  tedComplemento.EditValue    := ObjCliente.Complemento;
  tedBairro.EditValue         := ObjCliente.Bairro;

  if ObjCidade.Find(Format('IDCIDADE = %d', [ObjCliente.CodigoCidade])) then
   bteCidade.Text := ObjCidade.NomeCidade;

  mskCep.EditValue            := ObjCliente.CEPCliente;
  dteNascimento.Date          := ObjCliente.DataNascimento;
  rdgSexo.EditValue           := ObjCliente.Sexo;
  rdgEstadoCivil.EditValue    := ObjCliente.EstadoCivil;
  rdgRaca.EditValue           := ObjCliente.Raca;
  tedEmailPessoal.EditValue   := ObjCliente.EmailPessoal;
  tedEmailComercial.EditValue := ObjCliente.EmailComercial;

  cdsTelefones.Params.ParamByName('iCliente').AsInteger := ObjCliente.CodigoCliente;
  cdsTelefones.Open;

  if ObjCliente.CodigoBanco > 0 then
   begin
    if ObjBanco.Find(Format('IDBANCO = %d', [ObjCliente.CodigoBanco])) then
     bteBanco.Text := Format('%d - %s', [ObjBanco.CodigoBanco, ObjBanco.NomeBanco]);

    if ObjAgencia.Find(Format('CODIGOAGENCIA = %s AND IDBANCO = %d', [ObjCliente.CodigoAgencia, ObjCliente.CodigoBanco])) then
     bteAgencia.Text := Format('%s - %s', [ObjAgencia.CodigoAgencia, ObjAgencia.NomeAgencia]);

    tedOperacao.EditValue       := ObjCliente.Operacao;
    cboTipoConta.ItemIndex      := IfThen(ObjCliente.TipoConta = 'C', 0, 1);
    tedDV.EditValue             := ObjCliente.DigitoVerificador;
    tedConta.EditValue          := ObjCliente.Conta;
   end;

  Result := True;
end;

procedure TfrmCadastroCliente.rdgTipoInscricaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  case rdgTipoInscricao.ItemIndex of
   0: tedInscricao.Properties.EditMask := '99999999999-99;1; ';
   1: tedInscricao.Properties.EditMask := '99.999.999/9999-99;1; ';
   2: tedInscricao.Properties.EditMask := '999.999.999-99;1; ';
  end;
end;

function TfrmCadastroCliente.SaveObject: Boolean;
begin
  if ObjCliente.New then
   ObjCliente.Status := 'A';

  ObjCliente.TipoInscricao       := rdgTipoInscricao.ItemIndex + 1;
  ObjCliente.Inscricao           := tedInscricao.EditValue;
  ObjCliente.NomeCliente         := tedNome.EditValue;
  ObjCliente.CodigoLogradouro    := lkeTipoLogradouro.EditValue;
  ObjCliente.EnderecoCliente     := tedEndereco.EditValue;
  ObjCliente.NumeroCliente       := tedNumero.EditValue;
  ObjCliente.Complemento         := tedComplemento.Text;

  ObjCliente.Bairro              := tedBairro.EditValue;
  ObjCliente.CodigoCidade        := ObjCidade.CodigoCidade;

  if not SameText(mskCep.Text, '') then
   ObjCliente.CEPCliente         := TStringFunctions.ExtractNotNumbers(mskCep.EditValue);

  ObjCliente.DataNascimento      := dteNascimento.Date;
  ObjCliente.Sexo                := rdgSexo.EditValue;
  ObjCliente.EstadoCivil         := rdgEstadoCivil.EditValue;
  ObjCliente.Raca                := rdgRaca.EditValue;

  if cdsTelefones.ChangeCount > 0 then
   cdsTelefones.ApplyUpdates(0);

  ObjCliente.EmailPessoal        := tedEmailPessoal.Text;
  ObjCliente.EmailComercial      := tedEmailComercial.Text;

  if not SameText(bteBanco.Text, '') then
   begin
    ObjCliente.CodigoBanco       := ObjBanco.CodigoBanco;
    ObjCliente.CodigoAgencia     := ObjAgencia.CodigoAgencia;
    ObjCliente.Operacao          := tedOperacao.Text;
    ObjCliente.TipoConta         := IfThen(cboTipoConta.ItemIndex = 0, 'C', 'P');
    ObjCliente.DigitoVerificador := tedDV.Text;
    ObjCliente.Conta             := tedConta.Text;
   end;

  Result := inherited SaveObject;
  StayOpen := not Result;
end;

end.
