unit Charts.Legends.Labels;

interface

uses
  Interfaces;

type
  TModelHTMLLegendsLabels<T : IInterface> = class(TInterfacedObject, iModelHTMLLegendLabels<T>)
    private
      FParent : T;
      FfontSize : Integer;
      FfontStyle : String;
      FfontColorHEX : String;
      FfontFamily : String;
      Fpadding : Integer;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLLegendLabels<T>;
      function fontSize (Value : Integer) : iModelHTMLLegendLabels<T>; overload;
      function fontSize : Integer; overload;
      function fontStyle ( Value : String ) : iModelHTMLLegendLabels<T>; overload;
      function fontStyle : String; overload;
      function fontColorHEX ( Value : String ) : iModelHTMLLegendLabels<T>; overload;
      function fontColorHEX : String; overload;
      function fontFamily ( Value : String ) : iModelHTMLLegendLabels<T>; overload;
      function fontFamily : String; overload;
      function padding ( Value : Integer ) : iModelHTMLLegendLabels<T>; overload;
      function padding : Integer; overload;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  System.SysUtils, Injection;

{ TModelHTMLLegendsLabels }

function TModelHTMLLegendsLabels<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLLegendsLabels<T>.fontColorHEX: String;
begin
  Result := FfontColorHEX;
end;

function TModelHTMLLegendsLabels<T>.fontFamily: String;
begin
  Result := FfontFamily;
end;

function TModelHTMLLegendsLabels<T>.fontFamily(
  Value: String): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  FfontFamily := Value;
end;

function TModelHTMLLegendsLabels<T>.fontColorHEX(
  Value: String): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  FfontColorHEX := Value;
end;

function TModelHTMLLegendsLabels<T>.fontSize: Integer;
begin
  Result := FfontSize;
end;

function TModelHTMLLegendsLabels<T>.fontStyle: String;
begin
  Result := FfontStyle;
end;

function TModelHTMLLegendsLabels<T>.fontStyle(
  Value: String): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  FfontStyle := Value;
end;

function TModelHTMLLegendsLabels<T>.fontSize(
  Value: Integer): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  FfontSize := Value;
end;

constructor TModelHTMLLegendsLabels<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  FfontSize := 12;
  FfontStyle := 'normal';
  FfontColorHEX := '#666';
  FfontFamily := 'Arial';
  Fpadding := 10;
end;

destructor TModelHTMLLegendsLabels<T>.Destroy;
begin

  inherited;
end;

class function TModelHTMLLegendsLabels<T>.New(Parent : T): iModelHTMLLegendLabels<T>;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLLegendsLabels<T>.padding: Integer;
begin
  Result := Fpadding;
end;

function TModelHTMLLegendsLabels<T>.padding(
  Value: Integer): iModelHTMLLegendLabels<T>;
begin
  Result := Self;
  Fpadding := Value;
end;

function TModelHTMLLegendsLabels<T>.Result: String;
begin
  Result := '';
  Result := Result + 'labels : { ';
  Result := Result + 'fontSize : ' + IntToStr(FfontSize) + ', ';
  Result := Result + 'fontColor : "'+FfontColorHEX+'",';
  Result := Result + 'fontFamily : "'+FfontFamily+'",';
  Result := Result + 'padding : ' + IntToStr(Fpadding) + ', ';
  Result := Result + 'fontStyle : "'+FfontStyle+'"';
  Result := Result + '},';
end;

end.
