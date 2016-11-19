unit UAttribute;

interface

type
  TTableName = class(TCustomAttribute)
  private
    { private declarations }
    FName: String;
  public
    { public declarations }
    property Name: String read FName write FName;
    constructor Create(const TableName: String);
  end;

  FieldName = class(TCustomAttribute)
  private
    { private declarations }
    FName:       String;
    FPrimaryKey: Boolean;
    FAutoInc:    Boolean;
    FForeignKey: Boolean;
  public
    { public declarations }
    property Name:       String  read FName       write FName;
    property PrimaryKey: Boolean read FPrimaryKey write FPrimaryKey;
    property AutoInc:    Boolean read FAutoInc    write FAutoInc;
    property ForeignKey: Boolean read FForeignKey write FForeignKey;
    constructor Create(const FieldName: String; const PrimaryKey: Boolean = False;
                       const AutoInc: Boolean = False; const ForeignKey: Boolean = False);
  end;

implementation

{ TTableName }

constructor TTableName.Create(const TableName: String);
begin
  FName := TableName;
end;

{ FieldName }

constructor FieldName.Create(const FieldName: String; const PrimaryKey, AutoInc,
  ForeignKey: Boolean);
begin
  FName       := FieldName;
  FPrimaryKey := PrimaryKey;
  FAutoInc    := AutoInc;
  FForeignKey := ForeignKey;
end;

end.
