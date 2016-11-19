inherited frmDialogoPesquisa: TfrmDialogoPesquisa
  Caption = 'Pesquisa'
  ExplicitWidth = 570
  ExplicitHeight = 328
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
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
    AnchorX = 529
    AnchorY = 47
  end
  object grid: TcxGrid
    Left = 0
    Top = 56
    Width = 564
    Height = 243
    Align = alClient
    TabOrder = 3
    object gridDBTableView: TcxGridDBTableView
      OnDblClick = gridDBTableViewDblClick
      Navigator.Buttons.CustomButtons = <>
      DataController.DataModeController.GridMode = True
      DataController.DataSource = dtsGrid
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.Indicator = True
    end
    object gridLevel: TcxGridLevel
      GridView = gridDBTableView
    end
  end
  object dtsGrid: TDataSource
    DataSet = cdsGrid
    Left = 464
    Top = 160
  end
  object cdsGrid: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 160
  end
end
