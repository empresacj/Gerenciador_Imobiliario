inherited frmCadastroBancos: TfrmCadastroBancos
  Caption = 'Cadastro de Bancos'
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
    TabOrder = 3
    ExplicitWidth = 410
    inherited btnImprimir: TSpeedButton
      Left = 350
      ExplicitLeft = 350
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
    Left = 350
    ExplicitLeft = 350
    AnchorX = 375
    AnchorY = 47
  end
  object gpbNumero: TcxGroupBox
    Left = 10
    Top = 60
    Caption = ' &N'#250'mero '
    TabOrder = 0
    Height = 44
    Width = 100
    object cedCodigo: TcxCurrencyEdit
      Tag = 1
      Left = 10
      Top = 16
      Hint = 'Preencha com o c'#243'digo do banco'
      Properties.ClearKey = 16430
      Properties.DisplayFormat = '#'
      TabOrder = 0
      Width = 80
    end
  end
  object gpbSite: TcxGroupBox
    Left = 10
    Top = 108
    Caption = ' &Site do Banco '
    TabOrder = 2
    Height = 44
    Width = 390
    object tedSite: TcxTextEdit
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      TabOrder = 0
      Width = 370
    end
  end
  object gpbNome: TcxGroupBox
    Left = 120
    Top = 60
    Caption = ' N&ome '
    TabOrder = 1
    Height = 44
    Width = 280
    object tedNome: TcxTextEdit
      Tag = 1
      Left = 10
      Top = 16
      Hint = 'Preencha com o nome do banco'
      Properties.ClearKey = 16430
      Properties.MaxLength = 100
      TabOrder = 0
      Width = 260
    end
  end
end
