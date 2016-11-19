unit UCidade;

interface

uses
  UPersistentObject, UAttribute;

type
  [TTableName('CIDADES')]
  TCidade = class(TPersistentObject)
  private
    { private declarations }
    FCodigoCidade: Integer;
    FNomeCidade:   String;
    FCodigoEstado: Integer;
  public
    { public declarations }
  published
    { published declarations }
    [FieldName('IDCIDADE', True, True)]
    property CodigoCidade: Integer read FCodigoCidade write FCodigoCidade;
    [FieldName('NOMECIDADE')]
    property NomeCidade:   String  read FNomeCidade   write FNomeCidade;
    [FieldName('IDESTADO', False, False, True)]
    property CodigoEstado: Integer read FCodigoEstado write FCodigoEstado;
  end;

implementation

end.
