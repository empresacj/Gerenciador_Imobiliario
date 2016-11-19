unit UcxGridFunctions;

interface

uses  cxGridDBTableView, cxGrid, cxTL;

type
  TcxGridFunctions = class
  public
    class function CheckColumnChecked(Column: TcxGridDBColumn): Boolean; overload;
    class function CheckColumnChecked(Column: TcxTreeListColumn): Boolean; overload;
    class procedure CheckUncheckAllNodes(Column: TcxTreeListColumn);
  published
    class procedure ColumnOrder(Column: TcxGridDBColumn; const Shift: boolean);
    class procedure CreateColumn(View: TcxGridDBTableView; FieldName: string);
    class function  GetFieldName(Column: TcxGridDBColumn): string;
    class procedure MarkCheckColumn(Sender: TObject; Column: Integer);
  end;

implementation

uses cxCheckBox, StrUtils, cxCustomData, dxCore, DB;

{ TcxGridFunctions }

class procedure TcxGridFunctions.MarkCheckColumn(Sender: TObject; Column: Integer);
begin
  TcxGridDBTableView(Sender).OptionsBehavior.IncSearch := Column <> 0;
end;

class procedure TcxGridFunctions.CreateColumn(View: TcxGridDBTableView;
  FieldName: string);
var
  col: TcxGridDBColumn;
begin
  col                       := View.CreateColumn;
  col.DataBinding.FieldName := FieldName;
end;

class function TcxGridFunctions.CheckColumnChecked(Column: TcxGridDBColumn): Boolean;
begin
  Column.DataBinding.Field.DataSet.First;

  while not(Column.DataBinding.Field.DataSet.Eof) and (Column.DataBinding.Field.DataSet.FieldByName(Column.DataBinding.Field.FieldName).AsString = TcxCheckBoxProperties(Column.Properties).ValueUnchecked) do
   Column.DataBinding.Field.DataSet.Next;

  Result := not Column.DataBinding.Field.DataSet.Eof;
end;

class function TcxGridFunctions.CheckColumnChecked(
  Column: TcxTreeListColumn): Boolean;
begin

end;

class procedure TcxGridFunctions.CheckUncheckAllNodes(
  Column: TcxTreeListColumn);
var
  i: Integer;
  Selected: string;
begin
  if Column.Properties is TcxCheckBoxProperties then
  begin
    Selected := IfThen(Column.TreeList.Items[0].Values[0] = TcxCheckBoxProperties(Column.Properties).ValueChecked, TcxCheckBoxProperties(Column.Properties).ValueUnchecked, TcxCheckBoxProperties(Column.Properties).ValueChecked);
    Column.TreeList.BeginUpdate;
    try
     for i := 0 to Column.TreeList.Count - 1 do
       Column.TreeList.Items[i].Values[Column.ItemIndex] := Selected;
    finally
     Column.TreeList.EndUpdate;
    end;
    Column.TreeList.Refresh;
  end;
end;

class procedure TcxGridFunctions.ColumnOrder(Column: TcxGridDBColumn;
  const Shift: boolean);
var
  Old : TcxDataSortOrder;
begin
  if Column.DataBinding.Field.FieldKind = fkLookup then Exit;

  Old := Column.SortOrder;

  if not Shift then
   Column.GridView.DataController.ClearSorting(true);

  if Old = soAscending then
   Column.SortOrder := soDescending
  else Column.SortOrder := soAscending;
end;

class function TcxGridFunctions.GetFieldName(
  Column: TcxGridDBColumn): string;
begin
  with Column.DataBinding.Field.DataSet.FieldByName(Column.DataBinding.FieldName) do
   begin
    if FieldKind = fkLookup then Result := KeyFields
    else Result := FieldName;
   end;
end;

end.


