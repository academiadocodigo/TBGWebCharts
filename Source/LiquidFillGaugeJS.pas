unit LiquidFillGaugeJS;

Interface

uses Interfaces, Classes;

type
  TLiquidFillGaugeJS = class(TInterfacedObject, iModelJS)
  private
    FCDN: Boolean;
    FPack: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelJS;
    procedure LiquidFillGauge_1;

    function PackJS: String;
    function CDN(Value: Boolean): iModelJS;
    function Credenciais(Value: iModelCredenciais): iModelJS;
  end;

implementation

uses
  SysUtils,
  Utilities.Encoder;

{ TLiquidFillGaugeJS }

function TLiquidFillGaugeJS.CDN(Value: Boolean): iModelJS;
begin
  Result := Self;
  FCDN := Value;
end;

constructor TLiquidFillGaugeJS.Create;
begin
  FPack := TStringList.Create;
end;

function TLiquidFillGaugeJS.Credenciais(Value: iModelCredenciais): iModelJS;
begin
  Result := Self;
end;

destructor TLiquidFillGaugeJS.Destroy;
begin
  FreeAndNil(FPack);
  inherited;
end;

class function TLiquidFillGaugeJS.New: iModelJS;
begin
  Result := Self.Create;
end;

procedure TLiquidFillGaugeJS.LiquidFillGauge_1;
begin
  FPack.Add(
    'PHNjcmlwdD4NCi8qIQ0KICogQGxpY2Vuc2UgT3BlbiBzb3VyY2UgdW5kZXIgQlNEIDItY2xhdXNlIChodHRwOi8vY2hvb3NlYWxpY2Vuc2UuY29tL2xpY2Vuc2VzL2JzZC0yLWNsYXVzZS8pDQogKiBDb3B5cmlnaHQgKGMpIDIwMTUsIEN1cnRpcyBCcmF0dG9uDQog');
  FPack.Add(
    'KiBBbGwgcmlnaHRzIHJlc2VydmVkLg0KICoNCiAqIExpcXVpZCBGaWxsIEdhdWdlIHYxLjENCiAqLw0KZnVuY3Rpb24gbGlxdWlkRmlsbEdhdWdlRGVmYXVsdFNldHRpbmdzKCl7cmV0dXJue21pblZhbHVlOjAsbWF4VmFsdWU6MTAwLGNpcmNsZVRoaWNrbmVzczou');
  FPack.Add(
    'MDUsY2lyY2xlRmlsbEdhcDouMDUsY2lyY2xlQ29sb3I6IiMxNzhCQ0EiLHdhdmVIZWlnaHQ6LjA1LHdhdmVDb3VudDoxLHdhdmVSaXNlVGltZToxZTMsd2F2ZUFuaW1hdGVUaW1lOjE4ZTMsd2F2ZVJpc2U6ITAsd2F2ZUhlaWdodFNjYWxpbmc6ITAsd2F2ZUFuaW1h');
  FPack.Add(
    'dGU6ITAsd2F2ZUNvbG9yOiIjMTc4QkNBIix3YXZlT2Zmc2V0OjAsdGV4dFZlcnRQb3NpdGlvbjouNSx0ZXh0U2l6ZToxLHZhbHVlQ291bnRVcDohMCxkaXNwbGF5UGVyY2VudDohMCx0ZXh0Q29sb3I6IiMwNDU2ODEiLHdhdmVUZXh0Q29sb3I6IiNBNERCZjgifX1m');
  FPack.Add(
    'dW5jdGlvbiBsb2FkTGlxdWlkRmlsbEdhdWdlKHQsYSxlKXtudWxsPT1lJiYoZT1saXF1aWRGaWxsR2F1Z2VEZWZhdWx0U2V0dGluZ3MoKSk7dmFyIG4scj1kMy5zZWxlY3QoIiMiK3QpLGk9TWF0aC5taW4ocGFyc2VJbnQoci5zdHlsZSgid2lkdGgiKSkscGFyc2VJ');
  FPack.Add(
    'bnQoci5zdHlsZSgiaGVpZ2h0IikpKS8yLGw9cGFyc2VJbnQoci5zdHlsZSgid2lkdGgiKSkvMi1pLG89cGFyc2VJbnQoci5zdHlsZSgiaGVpZ2h0IikpLzItaSxzPU1hdGgubWF4KGUubWluVmFsdWUsTWF0aC5taW4oZS5tYXhWYWx1ZSxhKSkvZS5tYXhWYWx1ZTtu');
  FPack.Add(
    'PWUud2F2ZUhlaWdodFNjYWxpbmc/ZDMuc2NhbGUubGluZWFyKCkucmFuZ2UoWzAsZS53YXZlSGVpZ2h0LDBdKS5kb21haW4oWzAsNTAsMTAwXSk6ZDMuc2NhbGUubGluZWFyKCkucmFuZ2UoW2Uud2F2ZUhlaWdodCxlLndhdmVIZWlnaHRdKS5kb21haW4oWzAsMTAw');
  FPack.Add(
    'XSk7dmFyIHU9ZS50ZXh0U2l6ZSppLzIsZD1wYXJzZUZsb2F0KGEpLnRvRml4ZWQoMiksYz1lLnZhbHVlQ291bnRVcD9lLm1pblZhbHVlOmQsbT1lLmRpc3BsYXlQZXJjZW50PyIlIjoiIix2PWUuY2lyY2xlVGhpY2tuZXNzKmkscD12K2UuY2lyY2xlRmlsbEdhcCpp');
  FPack.Add(
    'LGY9aS1wLHg9ZipuKDEwMCpzKSxoPTIqZi9lLndhdmVDb3VudCx3PTErZS53YXZlQ291bnQsZz1oKncsRj1mdW5jdGlvbih0KXtyZXR1cm4gTWF0aC5yb3VuZCh0KX07cGFyc2VGbG9hdChkKSE9cGFyc2VGbG9hdChGKGQpKSYmKEY9ZnVuY3Rpb24odCl7cmV0dXJu');
  FPack.Add(
    'IHBhcnNlRmxvYXQodCkudG9GaXhlZCgxKX0pLHBhcnNlRmxvYXQoZCkhPXBhcnNlRmxvYXQoRihkKSkmJihGPWZ1bmN0aW9uKHQpe3JldHVybiBwYXJzZUZsb2F0KHQpLnRvRml4ZWQoMil9KTtmb3IodmFyIFQ9W10sQz0wO0M8PTQwKnc7QysrKVQucHVzaCh7eDpD');
  FPack.Add(
    'Lyg0MCp3KSx5OkMvNDB9KTt2YXIgeT1kMy5zY2FsZS5saW5lYXIoKS5yYW5nZShbMCwyKk1hdGguUEldKS5kb21haW4oWzAsMV0pLE09ZDMuc2NhbGUubGluZWFyKCkucmFuZ2UoWzAsaV0pLmRvbWFpbihbMCxpXSksQT1kMy5zY2FsZS5saW5lYXIoKS5yYW5nZShb');
  FPack.Add(
    'MCxnXSkuZG9tYWluKFswLDFdKSxQPWQzLnNjYWxlLmxpbmVhcigpLnJhbmdlKFswLHhdKS5kb21haW4oWzAsMV0pLFI9ZDMuc2NhbGUubGluZWFyKCkucmFuZ2UoW3ArMipmK3gscC14XSkuZG9tYWluKFswLDFdKSxWPWQzLnNjYWxlLmxpbmVhcigpLnJhbmdlKFsw');
  FPack.Add(
    'LGctMipmXSkuZG9tYWluKFswLDFdKSxJPWQzLnNjYWxlLmxpbmVhcigpLnJhbmdlKFtwKzIqZixwKy43KnVdKS5kb21haW4oWzAsMV0pLEc9ci5hcHBlbmQoImciKS5hdHRyKCJ0cmFuc2Zvcm0iLCJ0cmFuc2xhdGUoIitsKyIsIitvKyIpIiksSD1kMy5zdmcuYXJj');
  FPack.Add(
    'KCkuc3RhcnRBbmdsZSh5KDApKS5lbmRBbmdsZSh5KDEpKS5vdXRlclJhZGl1cyhNKGkpKS5pbm5lclJhZGl1cyhNKGktdikpO0cuYXBwZW5kKCJwYXRoIikuYXR0cigiZCIsSCkuc3R5bGUoImZpbGwiLGUuY2lyY2xlQ29sb3IpLmF0dHIoInRyYW5zZm9ybSIsInRy');
  FPack.Add(
    'YW5zbGF0ZSgiK2krIiwiK2krIikiKTt2YXIgUz1HLmFwcGVuZCgidGV4dCIpLnRleHQoRihjKSttKS5hdHRyKCJjbGFzcyIsImxpcXVpZEZpbGxHYXVnZVRleHQiKS5hdHRyKCJ0ZXh0LWFuY2hvciIsIm1pZGRsZSIpLmF0dHIoImZvbnQtc2l6ZSIsdSsicHgiKS5z');
  FPack.Add(
    'dHlsZSgiZmlsbCIsZS50ZXh0Q29sb3IpLmF0dHIoInRyYW5zZm9ybSIsInRyYW5zbGF0ZSgiK2krIiwiK0koZS50ZXh0VmVydFBvc2l0aW9uKSsiKSIpLHE9ZDMuc3ZnLmFyZWEoKS54KGZ1bmN0aW9uKHQpe3JldHVybiBBKHQueCl9KS55MChmdW5jdGlvbih0KXty');
  FPack.Add(
    'ZXR1cm4gUChNYXRoLnNpbigyKk1hdGguUEkqZS53YXZlT2Zmc2V0Ki0xKzIqTWF0aC5QSSooMS1lLndhdmVDb3VudCkrMip0LnkqTWF0aC5QSSkpfSkueTEoZnVuY3Rpb24odCl7cmV0dXJuIDIqZit4fSksej1HLmFwcGVuZCgiZGVmcyIpLmFwcGVuZCgiY2xpcFBh');
  FPack.Add(
    'dGgiKS5hdHRyKCJpZCIsImNsaXBXYXZlIit0KSxCPXouYXBwZW5kKCJwYXRoIikuZGF0dW0oVCkuYXR0cigiZCIscSkuYXR0cigiVCIsMCksRD1HLmFwcGVuZCgiZyIpLmF0dHIoImNsaXAtcGF0aCIsInVybCgjY2xpcFdhdmUiK3QrIikiKTtELmFwcGVuZCgiY2ly');
  FPack.Add(
    'Y2xlIikuYXR0cigiY3giLGkpLmF0dHIoImN5IixpKS5hdHRyKCJyIixmKS5zdHlsZSgiZmlsbCIsZS53YXZlQ29sb3IpO3ZhciBPPUQuYXBwZW5kKCJ0ZXh0IikudGV4dChGKGMpK20pLmF0dHIoImNsYXNzIiwibGlxdWlkRmlsbEdhdWdlVGV4dCIpLmF0dHIoInRl');
  FPack.Add(
    'eHQtYW5jaG9yIiwibWlkZGxlIikuYXR0cigiZm9udC1zaXplIix1KyJweCIpLnN0eWxlKCJmaWxsIixlLndhdmVUZXh0Q29sb3IpLmF0dHIoInRyYW5zZm9ybSIsInRyYW5zbGF0ZSgiK2krIiwiK0koZS50ZXh0VmVydFBvc2l0aW9uKSsiKSIpO2lmKGUudmFsdWVD');
  FPack.Add(
    'b3VudFVwKXt2YXIgVT1mdW5jdGlvbigpe3ZhciB0PWQzLmludGVycG9sYXRlKHRoaXMudGV4dENvbnRlbnQsZCk7cmV0dXJuIGZ1bmN0aW9uKGEpe3RoaXMudGV4dENvbnRlbnQ9Rih0KGEpKSttfX07Uy50cmFuc2l0aW9uKCkuZHVyYXRpb24oZS53YXZlUmlzZVRp');
  FPack.Add(
    'bWUpLnR3ZWVuKCJ0ZXh0IixVKSxPLnRyYW5zaXRpb24oKS5kdXJhdGlvbihlLndhdmVSaXNlVGltZSkudHdlZW4oInRleHQiLFUpfXZhciBrPXArMipmLWc7ZnVuY3Rpb24gVygpe0IuYXR0cigidHJhbnNmb3JtIiwidHJhbnNsYXRlKCIrVihCLmF0dHIoIlQiKSkr');
  FPack.Add(
    'IiwwKSIpLEIudHJhbnNpdGlvbigpLmR1cmF0aW9uKGUud2F2ZUFuaW1hdGVUaW1lKigxLUIuYXR0cigiVCIpKSkuZWFzZSgibGluZWFyIikuYXR0cigidHJhbnNmb3JtIiwidHJhbnNsYXRlKCIrVigxKSsiLDApIikuYXR0cigiVCIsMSkuZWFjaCgiZW5kIixmdW5j');
  FPack.Add(
    'dGlvbigpe0IuYXR0cigiVCIsMCksVyhlLndhdmVBbmltYXRlVGltZSl9KX1yZXR1cm4gZS53YXZlUmlzZT96LmF0dHIoInRyYW5zZm9ybSIsInRyYW5zbGF0ZSgiK2srIiwiK1IoMCkrIikiKS50cmFuc2l0aW9uKCkuZHVyYXRpb24oZS53YXZlUmlzZVRpbWUpLmF0');
  FPack.Add(
    'dHIoInRyYW5zZm9ybSIsInRyYW5zbGF0ZSgiK2srIiwiK1IocykrIikiKS5lYWNoKCJzdGFydCIsZnVuY3Rpb24oKXtCLmF0dHIoInRyYW5zZm9ybSIsInRyYW5zbGF0ZSgxLDApIil9KTp6LmF0dHIoInRyYW5zZm9ybSIsInRyYW5zbGF0ZSgiK2srIiwiK1Iocykr');
  FPack.Add(
    'IikiKSxlLndhdmVBbmltYXRlJiZXKCksbmV3IGZ1bmN0aW9uKCl7dGhpcy51cGRhdGU9ZnVuY3Rpb24odCl7dmFyIGE9cGFyc2VGbG9hdCh0KS50b0ZpeGVkKDIpLHI9ZnVuY3Rpb24odCl7cmV0dXJuIE1hdGgucm91bmQodCl9O3BhcnNlRmxvYXQoYSkhPXBhcnNl');
  FPack.Add(
    'RmxvYXQocihhKSkmJihyPWZ1bmN0aW9uKHQpe3JldHVybiBwYXJzZUZsb2F0KHQpLnRvRml4ZWQoMSl9KSxwYXJzZUZsb2F0KGEpIT1wYXJzZUZsb2F0KHIoYSkpJiYocj1mdW5jdGlvbih0KXtyZXR1cm4gcGFyc2VGbG9hdCh0KS50b0ZpeGVkKDIpfSk7dmFyIGk9');
  FPack.Add(
    'ZnVuY3Rpb24oKXt2YXIgYT1kMy5pbnRlcnBvbGF0ZSh0aGlzLnRleHRDb250ZW50LHBhcnNlRmxvYXQodCkudG9GaXhlZCgyKSk7cmV0dXJuIGZ1bmN0aW9uKHQpe3RoaXMudGV4dENvbnRlbnQ9cihhKHQpKSttfX07Uy50cmFuc2l0aW9uKCkuZHVyYXRpb24oZS53');
  FPack.Add(
    'YXZlUmlzZVRpbWUpLnR3ZWVuKCJ0ZXh0IixpKSxPLnRyYW5zaXRpb24oKS5kdXJhdGlvbihlLndhdmVSaXNlVGltZSkudHdlZW4oInRleHQiLGkpO3ZhciBsLG89TWF0aC5tYXgoZS5taW5WYWx1ZSxNYXRoLm1pbihlLm1heFZhbHVlLHQpKS9lLm1heFZhbHVlLHM9');
  FPack.Add(
    'ZipuKDEwMCpvKSx1PWQzLnNjYWxlLmxpbmVhcigpLnJhbmdlKFtwKzIqZitzLHAtc10pLmRvbWFpbihbMCwxXSkobyksZD1kMy5zY2FsZS5saW5lYXIoKS5yYW5nZShbMCxnXSkuZG9tYWluKFswLDFdKSxjPWQzLnNjYWxlLmxpbmVhcigpLnJhbmdlKFswLHNdKS5k');
  FPack.Add(
    'b21haW4oWzAsMV0pO2w9ZS53YXZlSGVpZ2h0U2NhbGluZz9kMy5zdmcuYXJlYSgpLngoZnVuY3Rpb24odCl7cmV0dXJuIGQodC54KX0pLnkwKGZ1bmN0aW9uKHQpe3JldHVybiBjKE1hdGguc2luKDIqTWF0aC5QSSplLndhdmVPZmZzZXQqLTErMipNYXRoLlBJKigx');
  FPack.Add(
    'LWUud2F2ZUNvdW50KSsyKnQueSpNYXRoLlBJKSl9KS55MShmdW5jdGlvbih0KXtyZXR1cm4gMipmK3N9KTpxO3ZhciB2PWUud2F2ZUFuaW1hdGU/VigxKTowO0IudHJhbnNpdGlvbigpLmR1cmF0aW9uKDApLnRyYW5zaXRpb24oKS5kdXJhdGlvbihlLndhdmVBbmlt');
  FPack.Add(
    'YXRlP2Uud2F2ZUFuaW1hdGVUaW1lKigxLUIuYXR0cigiVCIpKTplLndhdmVSaXNlVGltZSkuZWFzZSgibGluZWFyIikuYXR0cigiZCIsbCkuYXR0cigidHJhbnNmb3JtIiwidHJhbnNsYXRlKCIrdisiLDApIikuYXR0cigiVCIsIjEiKS5lYWNoKCJlbmQiLGZ1bmN0');
  FPack.Add(
    'aW9uKCl7ZS53YXZlQW5pbWF0ZSYmKEIuYXR0cigidHJhbnNmb3JtIiwidHJhbnNsYXRlKCIrVigwKSsiLDApIiksVyhlLndhdmVBbmltYXRlVGltZSkpfSksei50cmFuc2l0aW9uKCkuZHVyYXRpb24oZS53YXZlUmlzZVRpbWUpLmF0dHIoInRyYW5zZm9ybSIsInRy');
  FPack.Add('YW5zbGF0ZSgiK2srIiwiK3UrIikiKX19fQ0KPC9zY3JpcHQ+DQo=');
end;

function TLiquidFillGaugeJS.PackJS: String;
var
  I: Integer;
begin
  if FCDN then
    Result := '<script src="https://thuliobittencourt.com/tbgwebcharts/liquidFillGauge.min.js"></script>'
  else
  begin
    LiquidFillGauge_1;

    for I := 0 to Pred(FPack.Count) do
      Result := Result + TUtilitiesEncoder.Base64Decode(FPack[I]);
  end;
end;

end.
