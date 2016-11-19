unit UCliente;

interface

uses
  UPersistentObject, UAttribute;

type
  [TTableName('CLIENTES')]
  TCliente = class(TPersistentObject)
  private
    FCodigoCliente:     Integer;
    FNomeCliente:       String;
    FTipoInscricao:     Integer;
    FInscricao:         String;
    FCodigoLogradouro:  Integer;
    FEnderecoCliente:   String;
    FNumeroCliente:     String;
    FComplemento:       String;
    FBairro:            String;
    FCodigoCidade:      Integer;
    FCEPCliente:        String;
    FDataNascimento:    TDateTime;
    FSexo:              String;
    FEstadoCivil:       String;
    FEmailPessoal:      String;
    FEmailComercial:    String;
    FRaca:              String;
    FCodigoAgencia:     String;
    FCodigoBanco:       Integer;
    FOperacao:          String;
    FTipoConta:         String;
    FConta:             String;
    FDigitoVerificador: String;
    FStatus:            String;
    { private declarations }
  public
    { public declarations }
  published
    { published declarations }
    [FieldName('IDCLIENTE', True, True)]
    property CodigoCliente:     Integer   read FCodigoCliente     write FCodigoCliente;
    [FieldName('NOMECLIENTE')]
    property NomeCliente:       String    read FNomeCliente       write FNomeCliente;
    [FieldName('TIPOINSCRICAO')]
    property TipoInscricao:     Integer   read FTipoInscricao     write FTipoInscricao;
    [FieldName('INSCRICAO')]
    property Inscricao:         String    read FInscricao         write FInscricao;
    [FieldName('IDTIPOLOGRADOURO', False, False, True)]
    property CodigoLogradouro:  Integer   read FCodigoLogradouro  write FCodigoLogradouro;
    [FieldName('ENDERECO')]
    property EnderecoCliente:   String    read FEnderecoCliente   write FEnderecoCliente;
    [FieldName('NUMERO')]
    property NumeroCliente:     String    read FNumeroCliente     write FNumeroCliente;
    [FieldName('COMPLEMENTO')]
    property Complemento:       String    read FComplemento       write FComplemento;
    [FieldName('BAIRRO')]
    property Bairro:            String    read FBairro            write FBairro;
    [FieldName('IDCIDADE', False, False, True)]
    property CodigoCidade:      Integer   read FCodigoCidade      write FCodigoCidade;
    [FieldName('CEP')]
    property CEPCliente:        String    read FCEPCliente        write FCEPCliente;
    [FieldName('DATANASCIMENTO')]
    property DataNascimento:    TDateTime read FDataNascimento    write FDataNascimento;
    [FieldName('SEXO')]
    property Sexo:              String    read FSexo              write FSexo;
    [FieldName('ESTADOCIVIL')]
    property EstadoCivil:       String    read FEstadoCivil       write FEstadoCivil;
    [FieldName('EMAILPESSOAL')]
    property EmailPessoal:      String    read FEmailPessoal      write FEmailPessoal;
    [FieldName('EMAILCOMERCIAL')]
    property EmailComercial:    String    read FEmailComercial    write FEmailComercial;
    [FieldName('RACA')]
    property Raca:              String    read FRaca              write FRaca;
    [FieldName('CODIGOAGENCIA', False, False, True)]
    property CodigoAgencia:     String    read FCodigoAgencia     write FCodigoAgencia;
    [FieldName('IDBANCO', False, False, True)]
    property CodigoBanco:       Integer   read FCodigoBanco       write FCodigoBanco;
    [FieldName('OPERACAO')]
    property Operacao:          String    read FOperacao          write FOperacao;
    [FieldName('TIPOCONTA')]
    property TipoConta:         String    read FTipoConta         write FTipoConta;
    [FieldName('CONTA')]
    property Conta:             String    read FConta             write FConta;
    [FieldName('DIGITOVERIFICADOR')]
    property DigitoVerificador: String    read FDigitoVerificador write FDigitoVerificador;
    [FieldName('STATUSCLIENTE')]
    property Status:            String    read FStatus            write FStatus;
  end;

implementation

end.
