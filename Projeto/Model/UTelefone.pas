unit UTelefone;

interface

uses
  UPersistentObject, UAttribute;

type
  [TTableName('TELEFONES')]
  TTelefone = class(TPersistentObject)
  private
    FCodigoTelefone: Integer;
    FTipoTelefone:   String;
    FNumeroTelefone: String;
    FCodigoCliente:  Integer;
    FCodigoAgencia:  String;
    FCodigoBanco:    Integer;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
  published
    { published declarations }
    [FieldName('IDTELEFONE', True, True)]
    property CodigoTelefone:  Integer read FCodigoTelefone  write FCodigoTelefone;
    [FieldName('TIPOTELEFONE')]
    property TipoTelefone:   String  read FTipoTelefone   write FTipoTelefone;
    [FieldName('NUMEROTELEFONE')]
    property NumeroTelefone: String  read FNumeroTelefone write FNumeroTelefone;
    [FieldName('IDCLIENTE', True, False, True)]
    property CodigoCliente:  Integer read FCodigoCliente  write FCodigoCliente;
    [FieldName('CODIGOAGENCIA', True, False, True)]
    property CodigoAgencia:  String  read FCodigoAgencia  write FCodigoAgencia;
    [FieldName('IDBANCO', True, False, True)]
    property CodigoBanco:    Integer read FCodigoBanco    write FCodigoBanco;
  end;

implementation

end.
