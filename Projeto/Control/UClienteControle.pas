unit UClienteControle;

interface

uses
  Classes, UControle, SQLExpr, DBClient, SysUtils;

type
  TClienteControle = class(TControle)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    function GetCollectionTelefonesCliente(const CodigoCliente: Integer): TClientDataSet;
    function GetCollectionTipoLogradouro: TClientDataSet;

    function DisplayFields_Codigo_Nome: TStringList;

    function ResultFields_CodigoCidade_NomeCidade: TStringList;

    function DisplayFields_CodigoBanco_NomeBanco_SiteBanco: TStringList;
    function ResultFields_CodigoBanco_NomeBanco_SiteBanco: TStringList;

    function ResultFields_CodigoAgencia_NomeAgencia: TStringList;
  published
    { published declarations }
  end;

var
  ClienteControle: TClienteControle;

implementation

{ TClienteControle }
function TClienteControle.DisplayFields_CodigoBanco_NomeBanco_SiteBanco: TStringList;
begin
  Result := TStringList.Create;

  Result.Add('Código');
  Result.Add('Nome');
  Result.Add('Site');
end;

function TClienteControle.DisplayFields_Codigo_Nome: TStringList;
begin
  Result := TStringList.Create;

  Result.Add('Código');
  Result.Add('Nome');
end;

function TClienteControle.GetCollectionTelefonesCliente(
  const CodigoCliente: Integer): TClientDataSet;
begin
  Result := inherited BringCollectionToDataSet('TELEFONES', Format('IDCLIENTE = %d',[CodigoCliente]));
end;

function TClienteControle.GetCollectionTipoLogradouro: TClientDataSet;
begin
  Result := inherited BringCollectionToDataSet('TIPOLOGRADOURO');
end;

function TClienteControle.ResultFields_CodigoAgencia_NomeAgencia: TStringList;
begin
  Result := TStringList.Create;

  Result.Add('CODIGOAGENCIA');
  Result.Add('NOMEAGENCIA');
end;

function TClienteControle.ResultFields_CodigoBanco_NomeBanco_SiteBanco: TStringList;
begin
  Result := TStringList.Create;

  Result.Add('IDBANCO');
  Result.Add('NOMEBANCO');
  Result.Add('SITEBANCO');
end;

function TClienteControle.ResultFields_CodigoCidade_NomeCidade: TStringList;
begin
  Result := TStringList.Create;

  Result.Add('IDCIDADE');
  Result.Add('NOMECIDADE');
end;

initialization
  ClienteControle := TClienteControle.Create(nil);

finalization
  ClienteControle.Free;

end.
