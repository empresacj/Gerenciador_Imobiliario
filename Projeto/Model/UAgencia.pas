unit UAgencia;

interface

uses
  UPersistentObject, UAttribute;

type
  [TTableName('AGENCIAS')]
  TAgencia = class(TPersistentObject)
  private
    { private declarations }
    FCodigoAgencia:     String;
    FCodigoBanco:       Integer;
    FNomeAgencia:       String;
    FDigitoVerificador: String;
    FEndereco:          String;
    FNumero:            String;
    FBairro:            String;
    FCodigoCidade:      Integer;
    FEmailAgencia:      String;
  protected
    { protected declarations }
  public
    { public declarations }
  published
    { published declarations }
    [FieldName('CODIGOAGENCIA', True)]
    property CodigoAgencia:     String  read FCodigoAgencia     write FCodigoAgencia;
    [FieldName('IDBANCO', True, False, True)]
    property CodigoBanco:       Integer read FCodigoBanco       write FCodigoBanco;
    [FieldName('NOMEAGENCIA')]
    property NomeAgencia:       String  read FNomeAgencia       write FNomeAgencia;
    [FieldName('DIGITOVERIFICADORAGENCIA')]
    property DigitoVerificador: String  read FDigitoVerificador write FDigitoVerificador;
    [FieldName('ENDERECOAGENCIA')]
    property Endereco:          String  read FEndereco          write FEndereco;
    [FieldName('NUMEROAGENCIA')]
    property Numero:            String  read FNumero            write FNumero;
    [FieldName('BAIRROAGENCIA')]
    property Bairro:            String  read FBairro            write FBairro;
    [FieldName('IDCIDADE', False, False, True)]
    property CodigoCidade:      Integer read FCodigoCidade      write FCodigoCidade;
    [FieldName('EMAILAGENCIA')]
    property EmailAgencia:      String  read FEmailAgencia      write FEmailAgencia;
  end;

implementation

end.
