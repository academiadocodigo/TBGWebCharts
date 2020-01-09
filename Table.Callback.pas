unit Table.Callback;

interface

uses
  Interfaces,
  injection;

type
  TModelTableCallback = class (TInterfacedObject, iModeltableCallback)
    private
      [weak]
      FParent : iModelTable;
      FFormatNumber : String;
    public
      constructor Create(Parent : iModelTable);
      destructor Destroy; override;
      class function New(Parent : iModelTable) : iModeltableCallback;
      function formatNumber(aCampo, aFormat : String) : iModelTableCallback;
      function Result : String;
      function &End : iModelTable;
  end;

implementation

uses
  System.SysUtils;

{ TModelTableCallback }

function TModelTableCallback.&End: iModelTable;
begin
  Result := FParent;
end;

constructor TModelTableCallback.Create(Parent : iModelTable);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
end;

destructor TModelTableCallback.Destroy;
begin

  inherited;
end;

function TModelTableCallback.formatNumber(aCampo, aFormat : String) : iModelTableCallback;
begin
  Result := Self;
  FFormatNumber := 'number: {'+
    'data:' + QuotedStr(aCampo) + ','+
    'render: $.fn.dataTable.render.number('+aFormat+',R$)}';
end;

class function TModelTableCallback.New(Parent : iModelTable) : iModeltableCallback;
begin
  Result := Self.Create(Parent);
end;

function TModelTableCallback.Result: String;
begin

end;

end.
