unit UBanco;

interface

uses
  UPersistentObject, UAttribute;

type
  [TTableName('BANCOS')]
  TBanco = class(TPersistentObject)
  private
    { private declarations }
    FCodigoBanco: Integer;
    FNomeBanco:   String;
    FSiteBanco:   String;
  protected
    { protected declarations }
  public
    { public declarations }
  published
    { published declarations }
    [FieldName('IDBANCO', True)]
    property CodigoBanco: Integer read FCodigoBanco write FCodigoBanco;
    [FieldName('NOMEBANCO')]
    property NomeBanco:   String  read FNomeBanco   write FNomeBanco;
    [FieldName('SITEBANCO')]
    property SiteBanco:   String  read FSiteBanco   write FSiteBanco;
  end;

implementation

end.
