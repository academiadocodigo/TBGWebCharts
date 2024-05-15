unit Charts.Title;

interface

uses
  Interfaces;

type
  TModelHTMLChartsTitle<T : IInterface> = class(TInterfacedObject, iModelHTMLTitle<T>)
    private
      FParent : T;
      Fdisplay : Boolean;
      Ftext : String;
      Fposition : String;
      FfontSize : Integer;
      FfontFamily : String;
      FfontColorHEX : String;
      FfontStyle : String;
      Fpadding : Integer;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelHTMLTitle<T>;
      function display ( Value : Boolean ) :  iModelHTMLTitle<T>; overload;
      function display : Boolean; overload;
      function text ( Value : String ) : iModelHTMLTitle<T>; overload;
      function text : string; overload;
      function position ( Value : String ) : iModelHTMLTitle<T>; overload;
      function position : String; overload;
      function fontSize ( Value : Integer ) : iModelHTMLTitle<T>; overload;
      function fontSize : Integer; overload;
      function fontFamily ( Value : String ) : iModelHTMLTitle<T>; overload;
      function fontFamily : String; overload;
      function fontColorHEX ( Value : String ) : iModelHTMLTitle<T>; overload;
      function fontColorHEX : String; overload;
      function fontStyle ( Value : String ) : iModelHTMLTitle<T>; overload;
      function fontStyle : String; overload;
      function padding ( Value : Integer ) : iModelHTMLTitle<T>; overload;
      function padding : Integer; overload;
      function Result : String;
      function &End : T;
  end;

implementation

uses
  System.SysUtils, Injection;

{ TModelHTMLChartsTitle<T> }

function TModelHTMLChartsTitle<T>.&End: T;
begin
  Result := FParent;
end;

function TModelHTMLChartsTitle<T>.fontColorHEX: String;
begin
  Result := FfontColorHEX;
end;

function TModelHTMLChartsTitle<T>.fontColorHEX(
  Value: String): iModelHTMLTitle<T>;
begin
  Result := Self;
  FfontColorHEX := Value;
end;

function TModelHTMLChartsTitle<T>.fontFamily: String;
begin
  Result := FfontFamily;
end;

function TModelHTMLChartsTitle<T>.fontFamily(Value: String): iModelHTMLTitle<T>;
begin
  Result := Self;
  FfontFamily := Value;
end;

function TModelHTMLChartsTitle<T>.fontSize: Integer;
begin
  Result := FfontSize;
end;

function TModelHTMLChartsTitle<T>.fontStyle: String;
begin
  Result := FfontStyle;
end;

function TModelHTMLChartsTitle<T>.fontStyle(Value: String): iModelHTMLTitle<T>;
begin
  Result := Self;
  FfontStyle := Value;
end;

function TModelHTMLChartsTitle<T>.fontSize(Value: Integer): iModelHTMLTitle<T>;
begin
  Result := Self;
  FfontSize := Value;
end;

constructor TModelHTMLChartsTitle<T>.Create(Parent : T);
begin
  {$IF RTLVERSION > 27  }
    TInjection.Weak(@FParent, Parent);
  {$ELSE}
    FParent := Parent;
  {$IFEND}
  Fdisplay := True;
  Ftext := '';
  Fposition := 'top';
  FfontSize := 12;
  FfontFamily := 'Arial';
  FfontColorHEX := '#666';
  FfontStyle := 'bold';
  Fpadding := 10;
end;

destructor TModelHTMLChartsTitle<T>.Destroy;
begin

  inherited;
end;

function TModelHTMLChartsTitle<T>.display(Value: Boolean): iModelHTMLTitle<T>;
begin
  Result := Self;
  Fdisplay := Value;
end;

function TModelHTMLChartsTitle<T>.display: Boolean;
begin
  Result := Fdisplay;
end;

class function TModelHTMLChartsTitle<T>.New(Parent : T): iModelHTMLTitle<T>;
begin
    Result := Self.Create(Parent);
end;

function TModelHTMLChartsTitle<T>.padding: Integer;
begin
  Result := Fpadding;
end;

function TModelHTMLChartsTitle<T>.padding(Value: Integer): iModelHTMLTitle<T>;
begin
  Result := Self;
  Fpadding := Value;
end;

function TModelHTMLChartsTitle<T>.position: String;
begin
  Result := Fposition;
end;

function TModelHTMLChartsTitle<T>.position(Value: String): iModelHTMLTitle<T>;
begin
  Result := Self;
  Fposition := Value;
end;

function TModelHTMLChartsTitle<T>.Result: String;
begin
  Result := '';
  Result := Result + 'title : {';
  Result := Result + 'text : "'+ Ftext +'", ';
  Result := Result + 'position: "'+ Fposition +'", ';
  Result := Result + 'fontSize: '+ IntToStr(FfontSize) +', ';
  Result := Result + 'fontFamily: "'+ FfontFamily +'", ';
  Result := Result + 'fontColor: "'+ FfontColorHEX +'", ';
  Result := Result + 'fontStyle: "'+ FfontStyle +'", ';
  Result := Result + 'padding: '+ IntToStr(Fpadding) +', ';
  if Fdisplay then Result := Result + 'display: true ' else Result := Result + 'display: false ';
  Result := Result + '},';
end;

function TModelHTMLChartsTitle<T>.text: string;
begin
  Result := Ftext;
end;

function TModelHTMLChartsTitle<T>.text(Value: String): iModelHTMLTitle<T>;
begin
  Result := Self;
  Ftext := Value;
end;

end.
