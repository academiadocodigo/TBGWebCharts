unit Charts.Axes.ScaleLabel;

interface

uses
  Interfaces;

type
  TModelHTMLAxesScaleLabel<T : IInterface> = class(TInterfacedObject, iModelHTMLChatsAxesScaleLabel<T>)
    private
      FParent : T;
      Fdisplay : Boolean;
      FlabelString : String;
      FfontColorHEX : String;
      FfontFamily : String;
      FfontSize : Integer;
      FfontStyle : String;
      Fpadding : Integer;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLChatsAxesScaleLabel<T>;
      function display (Value : Boolean) : iModelHTMLChatsAxesScaleLabel<T>; overload;
      function display : Boolean; overload;
      function labelString ( Value : String ) : iModelHTMLChatsAxesScaleLabel<T>; overload;
      function labelString : String; overload;
      function fontColorHEX ( Value : String ) : iModelHTMLChatsAxesScaleLabel<T>; overload;
      function fontColorHEX  : String; overload;
      function fontFamily ( Value : String ) : iModelHTMLChatsAxesScaleLabel<T>; overload;
      function fontFamily : String; overload;
      function fontSize ( Value : Integer) : iModelHTMLChatsAxesScaleLabel<T>; overload;
      function fontSize : Integer; overload;
      function fontStyle ( Value : String) : iModelHTMLChatsAxesScaleLabel<T>; overload;
      function fontStyle : String; overload;
      function padding ( Value : Integer ) : iModelHTMLChatsAxesScaleLabel<T>; overload;
      function padding : Integer; overload;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  System.SysUtils, Injection;

{ TModelHTMLAxesScaleLabel<T> }

function TModelHTMLAxesScaleLabel<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLAxesScaleLabel<T>.fontColorHEX: String;
begin
  Result := FfontColorHEX;
end;

function TModelHTMLAxesScaleLabel<T>.fontFamily: String;
begin
  Result := FfontFamily;
end;

function TModelHTMLAxesScaleLabel<T>.fontSize: Integer;
begin
  Result := FfontSize;
end;

function TModelHTMLAxesScaleLabel<T>.fontStyle: String;
begin
  Result := FfontStyle;
end;

function TModelHTMLAxesScaleLabel<T>.fontStyle(
  Value: String): iModelHTMLChatsAxesScaleLabel<T>;
begin
  Result := Self;
  FfontStyle := Value;
end;

function TModelHTMLAxesScaleLabel<T>.fontSize(
  Value: Integer): iModelHTMLChatsAxesScaleLabel<T>;
begin
  Result := Self;
  FfontSize := Value;
end;

function TModelHTMLAxesScaleLabel<T>.fontFamily(
  Value: String): iModelHTMLChatsAxesScaleLabel<T>;
begin
  Result := Self;
  FfontFamily := Value;
end;

function TModelHTMLAxesScaleLabel<T>.fontColorHEX(
  Value: String): iModelHTMLChatsAxesScaleLabel<T>;
begin
  Result := Self;
  FfontColorHEX := Value;
end;

function TModelHTMLAxesScaleLabel<T>.labelString: String;
begin
  Result := FlabelString;
end;

function TModelHTMLAxesScaleLabel<T>.labelString(
  Value: String): iModelHTMLChatsAxesScaleLabel<T>;
begin
  Result := Self;
  FlabelString := Value;
end;

constructor TModelHTMLAxesScaleLabel<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  Fdisplay := False;
  FlabelString := '';
  FfontColorHEX := '#666';
  FfontFamily := 'Arial';
  FfontSize := 12;
  FfontStyle := 'normal';
  Fpadding := 4;
end;

destructor TModelHTMLAxesScaleLabel<T>.Destroy;
begin

  inherited;
end;

function TModelHTMLAxesScaleLabel<T>.display: Boolean;
begin
  Result := Fdisplay;
end;

function TModelHTMLAxesScaleLabel<T>.display(
  Value: Boolean): iModelHTMLChatsAxesScaleLabel<T>;
begin
  Result := Self;
  Fdisplay := Value;
end;

class function TModelHTMLAxesScaleLabel<T>.New(Parent : T): iModelHTMLChatsAxesScaleLabel<T>;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLAxesScaleLabel<T>.padding: Integer;
begin
  Result := Fpadding;
end;

function TModelHTMLAxesScaleLabel<T>.padding(
  Value: Integer): iModelHTMLChatsAxesScaleLabel<T>;
begin
  Result := Self;
  Fpadding := Value;
end;

function TModelHTMLAxesScaleLabel<T>.Result: String;
begin
  Result := '';
  Result := Result + 'scaleLabel : { ';
  Result := Result + 'labelString : "'+FlabelString+'", ';
  Result := Result + 'fontColor : "'+FfontColorHEX+'", ';
  Result := Result + 'fontFamily : "'+FfontFamily+'", ';
  Result := Result + 'fontSize : '+ IntToStr(FfontSize)+', ';
  Result := Result + 'fontStyle : "'+ FfontStyle + '", ';
  Result := Result + 'padding : '+ IntToStr(Fpadding) + ', ';
  if Fdisplay then Result := Result + 'display : true, ' else Result := Result + 'display : false ';
  Result := Result + '},';
end;

end.
