unit Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPersistentObject, DB, Vcl.ExtCtrls,
  Vcl.Buttons, dxBevel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Contnrs,
  dxSkinXmas2008Blue, cxLabel, cxGroupBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, Generics.Collections,
  cxCurrencyEdit, StdCtrls, cxButtonEdit, cxPC, cxRadioGroup;

type
  TfrmPadrao = class;
  TfrmPadraoClass = class of TfrmPadrao;

  TDataSetItem = class
  private
    FDataSet: TDataSet;
    FActive: Boolean;
    FFiltered: Boolean;
    FFilter: String;
  public
    constructor Create(DataSet: TDataSet);
    property Active: Boolean  read FActive write FActive;
    property DataSet: TDataSet read FDataSet write FDataSet;
    property Filter: String read FFilter write FFilter;
    property Filtered: Boolean  read FFiltered write FFiltered;
  end;

  TfrmPadrao = class(TForm)
    pnlBotoes: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Bevel: TdxBevel;
    btnImprimir: TSpeedButton;
    lblSalvar: TcxLabel;
    lblCancelar: TcxLabel;
    lblImprmir: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FState            : TDataSetState;
    iQtdCmp           : Integer;
    FDataSet          : TDataSet;
    FStayOpen         : Boolean;
    BAssigned         : Boolean;
    FTemDataSet       : Boolean;
    FAskOnCancel      : Boolean;
    DObjectEvents     : TObjectDictionary<TObject, TNotifyEvent>;
    FControlsToCheck  : TObjectList;
    FPersistentObject : TPersistentObject;
    procedure SetDataSet(DataSet: TDataSet);
    procedure LookupExit(Sender: TObject);
    function CanChangeFocus: Boolean;
    procedure AssignExitEvent(Sender: TObject);
    procedure SetFocusObject(Obj: TObject);
    procedure AddControlToCheck(ObjectControl: TObject);
    procedure ConfigurarComponentes(Owner: TComponent);
  protected
    { Protected declarations }
    stlComponent : TStringList;

    function LoadObject: Boolean; virtual; abstract;
    function SaveObject: boolean; virtual;
    function VerificarObrigatorios: Boolean; virtual;

    procedure Inicializacao; virtual;
    procedure Destruicao; virtual;
  public
    { Public declarations }
    procedure ConfigurarObrigatoriedade; dynamic;

    property State            : TDataSetState     read FState            write FState;
    property DataSet          : TDataSet          read FDataSet          write SetDataSet;
    property StayOpen         : Boolean           read FStayOpen         write FStayOpen;
    property AskOnCancel      : Boolean           read FAskOnCancel      write FAskOnCancel;
    property PersistentObject : TPersistentObject read FPersistentObject write FPersistentObject;
  published
    { Public declarations }
    class function Execute(PersistentObject: TPersistentObject; DataSet: TDataSet; AOwner: TComponent = nil): Boolean; overload; virtual;
  end;

var
  frmPadrao: TfrmPadrao;

implementation

uses
  TypInfo, UDialogFunctions;

{$R *.dfm}

{ TfrmPadrao }

procedure TfrmPadrao.AddControlToCheck(ObjectControl: TObject);
begin
  if ObjectControl is TcxCustomEdit then
   FControlsToCheck.Add(ObjectControl)
  else
   begin
    TDialogFunctions.Erro('Controle n�o adicionado: ' + ObjectControl.ClassName);
    PostMessage(Handle, WM_CLOSE, 0, 0);
    Exit;
   end;
end;

procedure TfrmPadrao.AssignExitEvent(Sender: TObject);
begin
  if Assigned(TcxCustomLookupComboBox(Sender).OnExit) then
   DObjectEvents.Add(Sender, TcxCustomLookupComboBox(Sender).OnExit);

  TcxCustomLookupComboBox(Sender).OnExit := Self.LookupExit;
end;

procedure TfrmPadrao.btnCancelarClick(Sender: TObject);
begin
  if FAskOnCancel and not TDialogFunctions.Pergunta('Deseja cancelar as altera��es?', 1) then Exit;

  Self.ModalResult := mrCancel;
end;

procedure TfrmPadrao.btnSalvarClick(Sender: TObject);
begin
  if not VerificarObrigatorios then Abort;

  if Assigned(Self.PersistentObject) then
   Self.SaveObject();

  if not FStayOpen then ModalResult := mrOk;
end;

function TfrmPadrao.CanChangeFocus: Boolean;
begin
  Result := True;

  if Assigned(ActiveControl.Parent) then
   if ActiveControl.Parent.Parent is TcxGridSite then
    Result := False;
end;

procedure TfrmPadrao.ConfigurarComponentes(Owner: TComponent);
var
  i: Integer;
begin
  for i := 0 to Owner.ComponentCount - 1 do
   begin
    // Resetando a cor dos group boxes
    if Owner.Components[i] is TcxGroupBox then
     TcxGroupBox(Owner.Components[i]).Style.RestoreDefaults;

    // Adicionando o evento OnExit aos lookups
    if ((Owner.Components[i] is TcxLookupComboBox) or
        (Owner.Components[i] is TcxComboBox)) and not BAssigned then
       AssignExitEvent(Self.Components[i]);

    // Contando os componentes
    if (((Owner.Components[i] is TWinControl)       and
         (TWinControl(Owner.Components[i]).TabStop) and
         (TWinControl(Owner.Components[i]).Enabled) or not
         (Owner.Components[i] is TButtonControl))   or
         (Owner.Components[i] is TFrame)            or
         (Owner.Components[i] is TRadioGroup))    then
     Inc(iQtdCmp);

    if (Owner.Components[i] is TWinControl) then
     if not TWinControl(Owner.Components[i]).Enabled then Continue;

{1} if (Owner.Components[i].Tag > 0) and (Owner.Components[i].Tag < 20) then
     begin
      if (Owner.Components[i] is TFrame) then
       Self.ConfigurarComponentes(Owner.Components[i]);
{2}
      if (TWinControl(Owner.Components[i]).Parent is TcxGroupBox) or (Owner.Components[i] is TcxRadioGroup) then
       begin
        if not((Owner.Components[i] is TcxCustomButtonEdit) or (Owner.Components[i] is TSpeedButton)) and IsPublishedProp(TcxCustomEditProperties(TcxTextEdit(Owner.Components[i]).Properties), 'ReadOnly') then
         if (GetOrdProp(TcxCustomEditProperties(TcxTextEdit(Owner.Components[i]).Properties), 'ReadOnly') = 1) then
          Continue;

        // A cor dos GroupBoxes que armazenam campos obrigat�rios e diferenciada
        if Owner.Components[i] is TcxRadioGroup then
         begin
          TcxRadioGroup(Owner.Components[i]).Style.TextColor  := clMaroon;
          TcxRadioGroup(Owner.Components[i]).Style.Font.Color := clMaroon;
         end
        else
         begin
          TcxGroupBox(TWinControl(Owner.Components[i]).Parent).Style.TextColor    := clMaroon;
          TcxGroupBox(TWinControl(Owner.Components[i]).Parent).Style.Font.Color   := clMaroon;
         end;

        // Os indices dos componentes obrigat�rio s�o guardados nesta StringList. Para que mais tarde
        // estes possam ser usados para setar o foco para o campo de preenchimento obrigat�rio.
        stlComponent.AddObject(IntToStr(i), Owner.Components[i]);

        if (Owner.Components[i] is TcxMaskEdit) or (Owner.Components[i] is TcxDateEdit) then
         Self.AddControlToCheck(Owner.Components[i]);
       end;{2}
     end;{1}
   end;
end;

procedure TfrmPadrao.ConfigurarObrigatoriedade;
begin
  stlComponent.Clear;
  iQtdCmp := 0;

  Self.ConfigurarComponentes(Self);
  BAssigned := True;
end;

procedure TfrmPadrao.Destruicao;
begin
//
end;

class function TfrmPadrao.Execute(PersistentObject: TPersistentObject;
  DataSet: TDataSet; AOwner: TComponent): Boolean;
var
  ObjForm: TfrmPadrao;
begin
  ObjForm := Self.Create(AOwner);

  try
   ObjForm.PersistentObject := PersistentObject;
   ObjForm.DataSet          := DataSet;

   Result := ObjForm.ShowModal = mrOK;
  finally
   ObjForm.Free;
  end;
end;

procedure TfrmPadrao.FormActivate(Sender: TObject);
begin
  if FTemDataSet then
   if not(FDataSet.Active) then FDataSet.Open;
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.Destruicao;
  FControlsToCheck := nil;
  Release;
  frmPadrao        := nil;
  DObjectEvents    := nil;
end;

procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
  FPersistentObject := nil;
  stlComponent      := TStringList.Create;
  DObjectEvents     := TObjectDictionary<TObject, TNotifyEvent>.Create;
  FControlsToCheck  := TObjectList.Create;
  FControlsToCheck.OwnsObjects := False;
end;

procedure TfrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
  sAux: String;
  Control: TWinControl;
begin
  case Key of
   VK_RETURN :
    begin
     if (ActiveControl <> nil) then
      begin
       Control := ActiveControl;
       i   := Control.TabOrder;

       while not (Control.Parent is TForm) do
        begin
         Control := Control.Parent;
         i   := Control.TabOrder;
        end;

       if (ActiveControl is TcxCustomMaskEdit) then
        begin
         if TcxCustomMaskEdit(ActiveControl).ModifiedAfterEnter then
          begin
           Key := 0;
           Exit;
          end;
        end
       else if ActiveControl is TcxCustomDateEdit then
        begin
         if TcxCustomDateEdit(ActiveControl).ModifiedAfterEnter then
          begin
           Key := 0;
           Exit;
          end;
        end
       else if (ActiveControl.Parent is TcxCustomLookupComboBox) or (ActiveControl.Parent is TcxCustomComboBox) then
        if TcxCustomLookupComboBox(ActiveControl.Parent).DroppedDown then
         Exit;


       if CanChangeFocus then
        begin
         if Shift = [ssCtrl] then Exit;

         Key := 0;

         Control := ActiveControl;

         // Passando para o pr�ximo componente
         Perform(WM_NextDlgCtl, 0, 0);

         if (ActiveControl <> nil) then
          begin
           if Assigned(ActiveControl.Parent) and (ActiveControl.Parent is TcxCustomTextEdit) and TcxCustomTextEdit(ActiveControl.Parent).ModifiedAfterEnter and (ActiveControl = Control) then
            begin
             sAux := TcxCustomTextEdit(ActiveControl.Parent).Text;
             TcxCustomTextEdit(ActiveControl.Parent).Reset;

             if not SameText(sAux, TcxCustomTextEdit(ActiveControl.Parent).Text) then
              begin
               TcxCustomTextEdit(ActiveControl.Parent).Text     := sAux;
               TcxCustomTextEdit(ActiveControl.Parent).ModifiedAfterEnter := True;
               Exit;
              end
            end;

           Control := ActiveControl;
          end;

          while not (Control.Parent is TForm) do
           Control := Control.Parent;

          if not(Control.Parent is TForm) then
           begin
            if (Control.Parent.TabOrder < i) or ((Control.Parent.TabOrder = i) and (iQtdCmp <= 1)) then
             if btnSalvar.Enabled then btnSalvar.Click
             else if btnImprimir.Enabled then btnImprimir.Click;
           end
          else if((Control.TabOrder = i) and (iQtdCmp = 1)) or (Control.TabOrder < i) then
           if btnSalvar.Enabled then btnSalvar.Click
           else if btnImprimir.Enabled then
            btnImprimir.Click;
        end;

       Control := nil;
      end;
    end;

   VK_F11    : if btnSalvar.Enabled then btnSalvar.Click;
   VK_ESCAPE : if btnCancelar.Enabled then btnCancelar.Click;
  end;

 if Shift = [ssCtrl] then
  if Key = 80 then
   if btnImprimir.Enabled then btnImprimir.Click;
end;

procedure TfrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
var
  i  : Integer;
  Control: TWinControl;
begin
  if Key = #13 then
   begin
    if (ActiveControl is TcxCustomMaskEdit) or (ActiveControl is TcxCustomDateEdit) then
     begin
      Control := ActiveControl;
      i       := Control.TabOrder;

      while not (Control.Parent is TForm) do
       begin
        Control := Control.Parent;
        i   := Control.TabOrder;
       end;
     end;

    if ActiveControl is TcxCustomDateEdit then
     begin
      Key := #0;

      if TcxCustomDateEdit(ActiveControl).ModifiedAfterEnter then
       begin
        //Key := #0;
        TcxCustomDateEdit(ActiveControl).ValidateEdit(True);
        if not TcxCustomDateEdit(ActiveControl).ModifiedAfterEnter then
         Perform(WM_NEXTDLGCTL, 0, 0);
       end;
     end
    else if (ActiveControl is TcxCustomMaskEdit) then
     begin
      if TcxCustomMaskEdit(ActiveControl).ModifiedAfterEnter then
       begin
        Key := #0;
        TcxCustomMaskEdit(ActiveControl).ValidateEdit(True);
        if (ActiveControl <> nil) and not TcxCustomMaskEdit(ActiveControl).ModifiedAfterEnter then
         Perform(WM_NEXTDLGCTL, 0, 0);
       end;
     end;

    if (ActiveControl is TcxCustomMaskEdit) or (ActiveControl is TcxCustomDateEdit) then
     begin
      if not(Control.Parent is TForm) then
       begin
        if (Control.Parent.TabOrder < i) or ((Control.Parent.TabOrder = i) and (iQtdCmp <= 1)) then
         if btnSalvar.Enabled then btnSalvar.Click
         else if TSpeedButton(FindComponent('btnImprimir')).Enabled then TSpeedButton(FindComponent('btnImprimir')).Click;
       end
      else if((Control.TabOrder = i) and (iQtdCmp = 1)) or (Control.TabOrder < i) then
       if btnSalvar.Enabled then btnSalvar.Click
       else if Assigned(FindComponent('btnImprimir')) and TSpeedButton(FindComponent('btnImprimir')).Enabled then
        TSpeedButton(FindComponent('btnImprimir')).Click;
     end;
   end;
end;

procedure TfrmPadrao.FormShow(Sender: TObject);
begin
  Self.Inicializacao;

  Self.ConfigurarObrigatoriedade;

  if Assigned(Self.PersistentObject) then
   begin
    if Self.PersistentObject.New then
     Self.State := dsInsert
    else
     begin
      Self.State := dsEdit;
      Self.LoadObject;
     end;
   end;

  case Self.State of
   dsBrowse: Caption := Caption + ' - [Navegando]';
   dsEdit  : Caption := Caption + ' - [Alterando]';
   dsInsert: Caption := Caption + ' - [Inserindo]';
  end;
end;

procedure TfrmPadrao.Inicializacao;
begin
//
end;

procedure TfrmPadrao.LookupExit(Sender: TObject);
begin
  TcxLookupComboBox(Sender).SetSelection(0,0);

  TcxLookupComboBox(Sender).Repaint;


  if DObjectEvents.ContainsKey(TcxLookupComboBox(Sender)) then
   DObjectEvents.Items[TcxLookupComboBox(Sender)](Sender);
end;

function TfrmPadrao.SaveObject: boolean;
begin
  Result := Self.PersistentObject.Save;

  if Result and Assigned(Self.DataSet) then
   Self.DataSet.Refresh;
end;

procedure TfrmPadrao.SetDataSet(DataSet: TDataSet);
begin
  FTemDataSet := DataSet <> nil;
  FDataSet    := DataSet;
end;

procedure TfrmPadrao.SetFocusObject(Obj: TObject);
begin
  if Obj is TcxTextEdit then
   TcxTextEdit(Obj).SetFocus
  else  if Obj is TcxLookupComboBox then
   TcxLookupComboBox(Obj).SetFocus
  else if Obj is TcxButtonEdit then
   TcxButtonEdit(Obj).SetFocus
  else TWinControl(Obj).SetFocus;
end;

function TfrmPadrao.VerificarObrigatorios: Boolean;
var
  i: Integer;
  sMsg, sCaption: String;
  objStl: TStringList;
  FirstObj: TObject;
begin
  Result        := False;
  ActiveControl := nil;

  objStl        := TStringList.Create;
  objStl.Sorted := True;
  try
   for i := 0 to FControlsToCheck.Count - 1 do
    if TcxCustomEdit(FControlsToCheck.Items[i]).ModifiedAfterEnter then Abort;

   for i:= 0 to stlComponent.Count - 1 do
    begin
     if (SameText(TcxTextEdit(stlComponent.Objects[i]).Text, '') or
        ((stlComponent.Objects[i] is TcxCustomMaskEdit) and (TcxCustomMaskEdit(stlComponent.Objects[i]).Text = '')) or
        ((stlComponent.Objects[i] is TcxRadioGroup) and (TcxRadioGroup(stlComponent.Objects[i]).ItemIndex = -1)) or
        ((stlComponent.Objects[i] is TcxCurrencyEdit) and (TcxCurrencyEdit(stlComponent.Objects[i]).Value = 0.0))) and
         (TComponent(stlComponent.Objects[i]).Tag <> 100 ) then
      begin
       if (stlComponent.Objects[i] is TcxRadioGroup) then
        sCaption := Trim(StringReplace(TcxRadioGroup(TWinControl(stlComponent.Objects[i])).Caption,'&','', [rfReplaceAll]))
       else
        sCaption := Trim(StringReplace(TcxGroupBox(TWinControl(stlComponent.Objects[i]).Parent).Caption,'&','', [rfReplaceAll]));

       //ARMAZENO O PRIMEIRO OBJETO ENCONTRADO
       if not Assigned(FirstObj) then
        FirstObj := stlComponent.Objects[i];

       if objStl.IndexOf(sCaption) = -1 then
        begin
         objStl.Add(sCaption);
         sMsg := sMsg + #13 + sCaption;
        end;
      end;
    end;

   if not SameText(sMsg, '') then
    begin
     TDialogFunctions.Erro('O(s) seguinte(s) campo(s) precisa(m) ser preenchido(s): ' + #13 + sMsg);
     Self.SetFocusObject(FirstObj);
     Exit;
    end;

   Result := True;
  finally
   objStl.Free;
  end;
end;

{ TDataSetItem }

constructor TDataSetItem.Create(DataSet: TDataSet);
begin
  Self.DataSet  := DataSet;
  Self.Active   := DataSet.Active;
  Self.Filter   := DataSet.Filter;
  Self.Filtered := DataSet.Filtered;
end;

end.
