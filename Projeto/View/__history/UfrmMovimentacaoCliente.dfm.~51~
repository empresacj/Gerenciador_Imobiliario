inherited frmMovimentacaoCliente: TfrmMovimentacaoCliente
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel: TPanel
    inherited grid: TcxGrid
      inherited gridDBTableView: TcxGridDBTableView
        object gridDBTableViewIDCLIENTE: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'IDCLIENTE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '#'
          Width = 40
        end
        object gridDBTableViewNOMECLIENTE: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOMECLIENTE'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 225
        end
        object gridDBTableViewTIPOINSCRICAO: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'TIPOINSCRICAO'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 25
        end
        object gridDBTableViewINSCRICAO: TcxGridDBColumn
          Caption = 'Inscri'#231#227'o'
          DataBinding.FieldName = 'INSCRICAO'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 77
        end
        object gridDBTableViewDATANASCIMENTO: TcxGridDBColumn
          Caption = 'Data de Nascimento'
          DataBinding.FieldName = 'DATANASCIMENTO'
          PropertiesClassName = 'TcxDateEditProperties'
          Width = 97
        end
        object gridDBTableViewSEXO: TcxGridDBColumn
          Caption = 'Sexo'
          DataBinding.FieldName = 'SEXO'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 29
        end
        object gridDBTableViewEMAILPESSOAL: TcxGridDBColumn
          Caption = 'Email'
          DataBinding.FieldName = 'EMAILPESSOAL'
          Width = 125
        end
        object gridDBTableViewSTATUSCLIENTE: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'STATUSCLIENTE'
          Width = 23
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
    CommandText = 'SELECT * FROM CLIENTES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmComuns.SQLConnection
    Left = 418
    Top = 32
    object sdsMovimentacaoIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Required = True
    end
    object sdsMovimentacaoNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Required = True
      Size = 100
    end
    object sdsMovimentacaoTIPOINSCRICAO: TIntegerField
      FieldName = 'TIPOINSCRICAO'
      Required = True
    end
    object sdsMovimentacaoINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Required = True
      Size = 18
    end
    object sdsMovimentacaoIDTIPOLOGRADOURO: TIntegerField
      FieldName = 'IDTIPOLOGRADOURO'
      Required = True
    end
    object sdsMovimentacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 80
    end
    object sdsMovimentacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 10
    end
    object sdsMovimentacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 80
    end
    object sdsMovimentacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 50
    end
    object sdsMovimentacaoIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
    end
    object sdsMovimentacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object sdsMovimentacaoDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Required = True
    end
    object sdsMovimentacaoSEXO: TStringField
      FieldName = 'SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sdsMovimentacaoESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sdsMovimentacaoEMAILPESSOAL: TStringField
      FieldName = 'EMAILPESSOAL'
      Size = 100
    end
    object sdsMovimentacaoEMAILCOMERCIAL: TStringField
      FieldName = 'EMAILCOMERCIAL'
      Size = 100
    end
    object sdsMovimentacaoRACA: TStringField
      FieldName = 'RACA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sdsMovimentacaoCODIGOAGENCIA: TStringField
      FieldName = 'CODIGOAGENCIA'
      Size = 10
    end
    object sdsMovimentacaoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
    end
    object sdsMovimentacaoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 3
    end
    object sdsMovimentacaoTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      FixedChar = True
      Size = 1
    end
    object sdsMovimentacaoCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object sdsMovimentacaoDIGITOVERIFICADOR: TStringField
      FieldName = 'DIGITOVERIFICADOR'
      FixedChar = True
      Size = 2
    end
    object sdsMovimentacaoSTATUSCLIENTE: TStringField
      FieldName = 'STATUSCLIENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsMovimentacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovimentacao'
    AfterDelete = cdsMovimentacaoAfterDelete
    Left = 530
    Top = 32
    object cdsMovimentacaoIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Required = True
    end
    object cdsMovimentacaoNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Required = True
      Size = 100
    end
    object cdsMovimentacaoTIPOINSCRICAO: TIntegerField
      FieldName = 'TIPOINSCRICAO'
      Required = True
      OnGetText = cdsMovimentacaoTIPOINSCRICAOGetText
    end
    object cdsMovimentacaoINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Required = True
      Size = 18
    end
    object cdsMovimentacaoIDTIPOLOGRADOURO: TIntegerField
      FieldName = 'IDTIPOLOGRADOURO'
      Required = True
    end
    object cdsMovimentacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 80
    end
    object cdsMovimentacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 10
    end
    object cdsMovimentacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 80
    end
    object cdsMovimentacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 50
    end
    object cdsMovimentacaoIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
    end
    object cdsMovimentacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsMovimentacaoDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Required = True
    end
    object cdsMovimentacaoSEXO: TStringField
      FieldName = 'SEXO'
      Required = True
      OnGetText = cdsMovimentacaoSEXOGetText
      FixedChar = True
      Size = 1
    end
    object cdsMovimentacaoESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsMovimentacaoEMAILPESSOAL: TStringField
      FieldName = 'EMAILPESSOAL'
      Size = 100
    end
    object cdsMovimentacaoEMAILCOMERCIAL: TStringField
      FieldName = 'EMAILCOMERCIAL'
      Size = 100
    end
    object cdsMovimentacaoRACA: TStringField
      FieldName = 'RACA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsMovimentacaoCODIGOAGENCIA: TStringField
      FieldName = 'CODIGOAGENCIA'
      Size = 10
    end
    object cdsMovimentacaoIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
    end
    object cdsMovimentacaoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 3
    end
    object cdsMovimentacaoTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      FixedChar = True
      Size = 1
    end
    object cdsMovimentacaoCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsMovimentacaoDIGITOVERIFICADOR: TStringField
      FieldName = 'DIGITOVERIFICADOR'
      FixedChar = True
      Size = 2
    end
    object cdsMovimentacaoSTATUSCLIENTE: TStringField
      FieldName = 'STATUSCLIENTE'
      Required = True
      OnGetText = cdsMovimentacaoSTATUSCLIENTEGetText
      FixedChar = True
      Size = 1
    end
  end
  object dspMovimentacao: TDataSetProvider
    DataSet = sdsMovimentacao
    Left = 474
    Top = 32
  end
end
