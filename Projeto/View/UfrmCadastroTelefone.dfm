inherited frmCadastroTelefone: TfrmCadastroTelefone
  Caption = 'Cadastro de Telefone'
  ClientHeight = 113
  ClientWidth = 360
  ExplicitWidth = 366
  ExplicitHeight = 142
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel: TdxBevel
    Width = 360
    Height = 57
    ExplicitLeft = 0
    ExplicitTop = 62
    ExplicitWidth = 360
    ExplicitHeight = 243
  end
  inherited pnlBotoes: TPanel
    Width = 360
    TabOrder = 2
    ExplicitWidth = 360
    inherited btnImprimir: TSpeedButton
      Left = 300
      ExplicitLeft = 300
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
    Left = 300
    ExplicitLeft = 300
    AnchorX = 325
    AnchorY = 47
  end
  object gpbTipo: TcxGroupBox
    Left = 10
    Top = 60
    Caption = ' &Tipo '
    TabOrder = 0
    Height = 44
    Width = 130
    object cboTipo: TcxComboBox
      Tag = 1
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        'Celular'
        'Fixo'
        'Rural'
        'Fax')
      Properties.OnEditValueChanged = cboTipoPropertiesEditValueChanged
      TabOrder = 0
      Width = 110
    end
  end
  object gpbNumero: TcxGroupBox
    Left = 150
    Top = 60
    Caption = ' &N'#250'mero '
    TabOrder = 1
    Height = 44
    Width = 200
    object mskNumero: TcxMaskEdit
      Tag = 1
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      Properties.MaxLength = 0
      Properties.ValidationOptions = []
      TabOrder = 0
      Width = 180
    end
  end
end
