inherited frmCadastroCidades: TfrmCadastroCidades
  Caption = 'Cadastro de Cidades'
  ClientHeight = 160
  ClientWidth = 410
  ExplicitWidth = 416
  ExplicitHeight = 189
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel: TdxBevel
    Width = 410
    Height = 104
    ExplicitWidth = 410
    ExplicitHeight = 104
  end
  inherited pnlBotoes: TPanel
    Width = 410
    TabOrder = 2
    ExplicitWidth = 410
    inherited btnImprimir: TSpeedButton
      Left = 777
      ExplicitLeft = 777
    end
    inherited lblSalvar: TcxLabel
      AnchorX = 35
      AnchorY = 47
    end
  end
  inherited lblCancelar: TcxLabel
    AnchorX = 95
    AnchorY = 47
  end
  inherited lblImprmir: TcxLabel
    Left = 777
    ExplicitLeft = 777
    AnchorX = 802
    AnchorY = 47
  end
  object gpbNome: TcxGroupBox
    Left = 10
    Top = 60
    Caption = ' &Nome da Cidade '
    TabOrder = 0
    Height = 44
    Width = 390
    object tedNome: TcxTextEdit
      Tag = 1
      Left = 10
      Top = 16
      Hint = 'Preencha com o nome da cidade'
      Properties.ClearKey = 16430
      Properties.MaxLength = 100
      TabOrder = 0
      Width = 370
    end
  end
  object gpbEstado: TcxGroupBox
    Left = 10
    Top = 108
    Caption = ' &Estado '
    TabOrder = 1
    Height = 44
    Width = 190
    object lkeEstado: TcxLookupComboBox
      Tag = 1
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      Properties.KeyFieldNames = 'IDESTADO'
      Properties.ListColumns = <
        item
          FieldName = 'NOMEESTADO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dtsEstado
      Properties.OnEditValueChanged = lkeEstadoPropertiesEditValueChanged
      TabOrder = 0
      Width = 170
    end
  end
  object gpbPais: TcxGroupBox
    Left = 210
    Top = 108
    Caption = ' &Pa'#237's '
    TabOrder = 3
    Height = 44
    Width = 190
    object tedPais: TcxTextEdit
      Left = 10
      Top = 16
      Enabled = False
      TabOrder = 0
      Width = 170
    end
  end
  object dtsEstado: TDataSource
    DataSet = cdsEstado
    Left = 186
    Top = 116
  end
  object cdsEstado: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 130
    Top = 116
    object cdsEstadoIDESTADO: TIntegerField
      FieldName = 'IDESTADO'
      Required = True
    end
    object cdsEstadoNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Required = True
      Size = 80
    end
    object cdsEstadoUNIDADEFEDERACAO: TStringField
      FieldName = 'UNIDADEFEDERACAO'
      Required = True
      Size = 2
    end
    object cdsEstadoIDPAIS: TIntegerField
      FieldName = 'IDPAIS'
      Required = True
    end
    object cdsEstadoNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Required = True
      Size = 80
    end
  end
end
