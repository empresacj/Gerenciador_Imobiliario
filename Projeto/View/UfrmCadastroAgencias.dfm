inherited frmCadastroAgencias: TfrmCadastroAgencias
  Caption = 'Cadastro de Ag'#234'ncias'
  ClientHeight = 255
  ClientWidth = 570
  ExplicitWidth = 576
  ExplicitHeight = 284
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel: TdxBevel
    Width = 570
    Height = 199
    ExplicitWidth = 570
    ExplicitHeight = 199
  end
  inherited pnlBotoes: TPanel
    Width = 570
    TabOrder = 9
    ExplicitWidth = 570
    inherited btnImprimir: TSpeedButton
      Left = 510
      ExplicitLeft = 510
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
    Left = 510
    ExplicitLeft = 510
    AnchorX = 535
    AnchorY = 47
  end
  object gpbBanco: TcxGroupBox
    Left = 10
    Top = 60
    Caption = ' &Banco '
    TabOrder = 0
    Height = 44
    Width = 550
    object btnCadastrarBanco: TSpeedButton
      Left = 520
      Top = 12
      Width = 26
      Height = 27
      Hint = 'Inserir (INSERT)'
      Flat = True
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000120B0000120B00000000000000000000CCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCB6C0B0B6C0B0B6C0
        B0B6C0B0CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        B7B7B7B7B7B7B7B7B7B7B7B7CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC1
        C6BE94B0858CAD7B9BBD8EA2C697A2C6979BBD8E8CAD7B94B085C1C6BECCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCC2C2C2999999929292A3A3A3ACACACACACACA3A3A392929299
        9999C2C2C2CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCC9FB59292B381B4D8AEBDE0BABDE0BABDE0BABDE0
        BABDE0BABDE0BAB4D8AE91B4839FB592CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCA3A3A3999999C0C0C0CACACA
        CACACACACACACACACACACACACACACAC0C0C0999999A3A3A3CCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC95AF85A2C597BD
        E0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BAA2C597
        95AF85CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CC999999ABABABCACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACAABABAB999999CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCC9FB592A2C597BDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0
        BABDE0BABDE0BABDE0BABDE0BABDE0BAA2C5979FB592CCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCA3A3A3ABABABCACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACAABABABA3A3A3CCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC1C6BE92B381BDE0BABDE0BABD
        E0BABDE0BABDE0BABDE0BAE2F2E1E2F2E1BDE0BABDE0BABDE0BABDE0BABDE0BA
        BDE0BA92B381C1C6BECCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC2C2C29999
        99CACACACACACACACACACACACACACACACACACAE8E8E8E8E8E8CACACACACACACA
        CACACACACACACACACACACA999999C2C2C2CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCC94B085B4D8AEBDE0BABDE0BABDE0BABDE0BABDE0BABDE0BAEFF8EEEFF8
        EEBDE0BABDE0BABDE0BABDE0BABDE0BABDE0BAB4D8AE94B085CCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCC999999C0C0C0CACACACACACACACACACACACACACACA
        CACACAF2F2F2F2F2F2CACACACACACACACACACACACACACACACACACAC0C0C09999
        99CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC92B282BDE0BABDE0BABDE0BABD
        E0BABDE0BABDE0BABDE0BAEFF8EEEFF8EEBDE0BABDE0BABDE0BABDE0BABDE0BA
        BDE0BABDE0BA8CAD7BCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC989898CACA
        CACACACACACACACACACACACACACACACACACACAF2F2F2F2F2F2CACACACACACACA
        CACACACACACACACACACACACACACA929292CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        B6C0B09ABC8CBDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BAEFF8EEEFF8
        EEBDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BA9ABC8CB6C0B0CCCCCCCC
        CCCCCCCCCCCCCCCCB7B7B7A2A2A2CACACACACACACACACACACACACACACACACACA
        CACACAF2F2F2F2F2F2CACACACACACACACACACACACACACACACACACACACACAA2A2
        A2B7B7B7CCCCCCCCCCCCCCCCCCCCCCCCB6C0B0A2C797BDE0BABDE0BABDE0BAE2
        F2E1EFF8EEEFF8EEEFF8EEFBFEFBFBFEFBEFF8EEEFF8EEEFF8EEE2F2E1BDE0BA
        BDE0BABDE0BA9EC291B6C0B0CCCCCCCCCCCCCCCCCCCCCCCCB7B7B7ACACACCACA
        CACACACACACACAE8E8E8F2F2F2F2F2F2F2F2F2FCFCFCFCFCFCF2F2F2F2F2F2F2
        F2F2E8E8E8CACACACACACACACACAA7A7A7B7B7B7CCCCCCCCCCCCCCCCCCCCCCCC
        B6C0B0A2C797BDE0BABDE0BABDE0BAE2F2E1EEF7EEEEF7EEEEF7EEFBFDFBFBFD
        FBEEF7EEEEF7EEEEF7EEE2F2E1BDE0BABDE0BABDE0BA9EC291B6C0B0CCCCCCCC
        CCCCCCCCCCCCCCCCB7B7B7ACACACCACACACACACACACACAE8E8E8F2F2F2F2F2F2
        F2F2F2FCFCFCFCFCFCF2F2F2F2F2F2F2F2F2E8E8E8CACACACACACACACACAA7A7
        A7B7B7B7CCCCCCCCCCCCCCCCCCCCCCCCB6C0B09ABC8CBDE0BABDE0BABDE0BABD
        E0BABDE0BABDE0BABDE0BAEFF8EEEFF8EEBDE0BABDE0BABDE0BABDE0BABDE0BA
        BDE0BABDE0BA9ABD8DB6C0B0CCCCCCCCCCCCCCCCCCCCCCCCB7B7B7A2A2A2CACA
        CACACACACACACACACACACACACACACACACACACAF2F2F2F2F2F2CACACACACACACA
        CACACACACACACACACACACACACACAA3A3A3B7B7B7CCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCC92B282BDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BAEFF8EEEFF8
        EEBDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BA8CAD7BCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCC989898CACACACACACACACACACACACACACACACACACA
        CACACAF2F2F2F2F2F2CACACACACACACACACACACACACACACACACACACACACA9292
        92CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC94B085B4D8AEBDE0BABDE0BABD
        E0BABDE0BABDE0BABDE0BAEFF8EEEFF8EEBDE0BABDE0BABDE0BABDE0BABDE0BA
        BDE0BAB4D8AE94B085CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC999999C0C0
        C0CACACACACACACACACACACACACACACACACACAF2F2F2F2F2F2CACACACACACACA
        CACACACACACACACACACACAC0C0C0999999CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCC1C6BE92B381BDE0BABDE0BABDE0BABDE0BABDE0BABDE0BAE2F2E1E2F2
        E1BDE0BABDE0BABDE0BABDE0BABDE0BABDE0BA91B483C1C6BECCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCC2C2C2999999CACACACACACACACACACACACACACACA
        CACACAE8E8E8E8E8E8CACACACACACACACACACACACACACACACACACA999999C2C2
        C2CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC9FB592A2C697BDE0BABD
        E0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BABDE0BA
        A2C6979FB592CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCA3A3
        A3ACACACCACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACAACACACA3A3A3CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCC99B28CA2C697BDE0BABDE0BABDE0BABDE0BABDE0BABDE0
        BABDE0BABDE0BABDE0BABDE0BAA2C69795AF85CCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC9E9E9EACACACCACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACAACACAC999999CCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC9FB59291
        B483B4D8AEBDE0BABDE0BABDE0BABDE0BABDE0BABDE0BAB4D8AE91B4839FB592
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCA3A3A3999999C0C0C0CACACACACACACACACACACACACACACACACACAC0
        C0C0999999A3A3A3CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC1C6BE93AF858DAE7C9ABD8DA2C797A2C7
        979ABD8D8DAE7C94B085C1C6BECCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC2C2C2999999949494
        A3A3A3ACACACACACACA3A3A3949494999999C2C2C2CCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCB6C0B0B7C1B1B7C1B1B7C1B1CCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCB7B7B7B8B8B8B8B8B8B8B8B8CCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object bteBanco: TcxButtonEdit
      Tag = 1
      Left = 10
      Top = 16
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClearKey = 16430
      Properties.ReadOnly = True
      Properties.OnButtonClick = bteBancoPropertiesButtonClick
      TabOrder = 0
      Width = 500
    end
  end
  object gpbNumero: TcxGroupBox
    Left = 10
    Top = 108
    Caption = ' N'#250'mero &Ag'#234'ncia '
    TabOrder = 1
    Height = 44
    Width = 100
    object cedNumero: TcxCurrencyEdit
      Tag = 1
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      Properties.DisplayFormat = '#'
      Properties.ReadOnly = False
      TabOrder = 0
      Width = 80
    end
  end
  object gpbNome: TcxGroupBox
    Left = 120
    Top = 108
    Caption = ' &Nome '
    ParentBackground = False
    TabOrder = 2
    Height = 44
    Width = 380
    object tedNome: TcxTextEdit
      Tag = 1
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      Properties.MaxLength = 80
      TabOrder = 0
      Width = 360
    end
  end
  object gpbDigito: TcxGroupBox
    Left = 510
    Top = 108
    Caption = ' &DV '
    TabOrder = 3
    Height = 44
    Width = 50
    object tedDigito: TcxTextEdit
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      Properties.MaxLength = 1
      TabOrder = 0
      Width = 30
    end
  end
  object gpbEndereco: TcxGroupBox
    Left = 10
    Top = 204
    Caption = ' &Endere'#231'o '
    TabOrder = 5
    Height = 44
    Width = 220
    object tedEndereco: TcxTextEdit
      Tag = 1
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      Properties.MaxLength = 50
      TabOrder = 0
      Width = 200
    end
  end
  object gpbNumeroEndereco: TcxGroupBox
    Left = 240
    Top = 204
    Caption = ' N&'#250'mero '
    TabOrder = 6
    Height = 44
    Width = 60
    object tedNumero: TcxTextEdit
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      Properties.MaxLength = 10
      TabOrder = 0
      Width = 40
    end
  end
  object gpbBairro: TcxGroupBox
    Left = 310
    Top = 204
    Caption = ' Bai&rro '
    TabOrder = 7
    Height = 44
    Width = 120
    object tedBairro: TcxTextEdit
      Tag = 1
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      Properties.MaxLength = 80
      TabOrder = 0
      Width = 100
    end
  end
  object gpbCidade: TcxGroupBox
    Left = 440
    Top = 204
    Caption = ' &Cidade '
    TabOrder = 8
    Height = 44
    Width = 120
    object bteCidade: TcxButtonEdit
      Tag = 1
      Left = 10
      Top = 16
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClearKey = 16430
      Properties.ReadOnly = True
      Properties.OnButtonClick = bteCidadePropertiesButtonClick
      TabOrder = 0
      Width = 100
    end
  end
  object gpbEmail: TcxGroupBox
    Left = 10
    Top = 156
    Caption = ' E&mail '
    TabOrder = 4
    Height = 44
    Width = 550
    object tedEmail: TcxTextEdit
      Left = 10
      Top = 16
      Properties.ClearKey = 16430
      Properties.MaxLength = 50
      TabOrder = 0
      Width = 530
    end
  end
end