inherited frmMovimentacaoBancos: TfrmMovimentacaoBancos
  Caption = 'Cadastro de Bancos'
  ExplicitWidth = 731
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel: TPanel
    inherited grid: TcxGrid
      inherited gridDBTableView: TcxGridDBTableView
        object gridDBTableViewIDBANCO: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'IDBANCO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#'
        end
        object gridDBTableViewNOMEBANCO: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOMEBANCO'
          PropertiesClassName = 'TcxTextEditProperties'
        end
        object gridDBTableViewSITEBANCO: TcxGridDBColumn
          Caption = 'Site'
          DataBinding.FieldName = 'SITEBANCO'
          PropertiesClassName = 'TcxTextEditProperties'
        end
      end
    end
  end
  inherited PanelBotoes: TPanel
    inherited lblInsert: TcxLabel
      AnchorX = 29
      AnchorY = 47
    end
    inherited lblEditar: TcxLabel
      AnchorX = 29
      AnchorY = 103
    end
    inherited lblDeletar: TcxLabel
      AnchorX = 29
      AnchorY = 159
    end
    inherited lblFechar: TcxLabel
      AnchorX = 29
      AnchorY = 382
    end
    inherited lblAjuda: TcxLabel
      AnchorX = 29
      AnchorY = 326
    end
    inherited lblExtras: TcxLabel
      AnchorX = 29
      AnchorY = 270
    end
    inherited lblStatus: TcxLabel
      AnchorX = 29
      AnchorY = 215
    end
  end
  inherited dtsMovimentacao: TDataSource
    DataSet = cdsMovimentacao
  end
  object sdsMovimentacao: TSQLDataSet
    CommandText = 'SELECT * FROM BANCOS'#13#10'ORDER BY NOMEBANCO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmComuns.SQLConnection
    Left = 394
    Top = 32
    object sdsMovimentacaoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      Required = True
    end
    object sdsMovimentacaoNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Required = True
      Size = 100
    end
    object sdsMovimentacaoSITEBANCO: TStringField
      FieldName = 'SITEBANCO'
      Size = 80
    end
  end
  object dspMovimentacao: TDataSetProvider
    DataSet = sdsMovimentacao
    Left = 458
    Top = 32
  end
  object cdsMovimentacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovimentacao'
    AfterDelete = cdsMovimentacaoAfterDelete
    Left = 522
    Top = 32
    object cdsMovimentacaoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      Required = True
    end
    object cdsMovimentacaoNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Required = True
      Size = 100
    end
    object cdsMovimentacaoSITEBANCO: TStringField
      FieldName = 'SITEBANCO'
      Size = 80
    end
  end
end
