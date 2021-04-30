unit Chart.Easy.PieJS;

interface

uses
  Interfaces, Classes;

type
  TChartEasyPieJS = class (TInterfacedObject, iModelJS)
    private
      FPack: TStringList;
      FCode : String;
      FCDN: Boolean;
      Procedure ChartEasyPieJS_1;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelJS;
      function PackJS : String;
      function CDN(Value : Boolean) : iModelJS;
      function Credenciais(Value : iModelCredenciais) : iModelJS;
  end;

implementation
uses
  SysUtils;

{ TChartEasyPieJS }

function TChartEasyPieJS.CDN(Value: Boolean): iModelJS;
begin
  Result := Self;
  FCDN := Value;
end;

procedure TChartEasyPieJS.ChartEasyPieJS_1;
begin
  FCode := FCode + '<script>'+#13;
  FCode := FCode + '(function(){var p;(p=jQuery).easyPieChart=function(t,n){var e,i,o,a,s,r,c,l=this;return this.el=t,this.$el=p(t),this.$el.data("easyPieChart",this),this.init=';
  FCode := FCode + 'function(){var t;return l.options=p.extend({},p.easyPieChart.defaultOptions,n),t=parseInt(l.$el.data("percent"),10),l.percentage=0,l.canvas=p("<canvas width=''"';
  FCode := FCode + '+l.options.size+"'' height=''"+l.options.size+"''></canvas>").get(0),l.$el.append(l.canvas),"undefined"!=typeof G_vmlCanvasManager&&null!==G_vmlCanvasManager&&G_';
  FCode := FCode + 'vmlCanvasManager.initElement(l.canvas),l.ctx=l.canvas.getContext("2d"),1.5<window.devicePixelRatio&&(p(l.canvas).css({width:l.options.size,height:l.options.size})';
  FCode := FCode + ',l.canvas.width*=2,l.canvas.height*=2,l.ctx.scale(2,2)),l.ctx.translate(l.options.size/2,l.options.size/2),l.$el.addClass("easyPieChart"),l.$el.css({width:l.opti';
  FCode := FCode + 'ons.size,height:l.options.size,lineHeight:l.options.size+"px"}),l.update(t),l},this.update=function(t){return!1===l.options.animate?o(t):i(l.percentage,t)},r=';
  FCode := FCode + 'function(){var t,n,i;for(l.ctx.fillStyle=l.options.scaleColor,l.ctx.lineWidth=1,i=[],t=n=0;n<=24;t=++n)i.push(e(t));return i},e=function(t){var n;return n=t%6==';
  FCode := FCode + '0?0:.017*l.options.size,l.ctx.save(),l.ctx.rotate(t*Math.PI/12),l.ctx.fillRect(l.options.size/2-n,0,.05*-l.options.size+n,1),l.ctx.restore()},c=function(){var t;';
  FCode := FCode + 'return t=l.options.size/2-l.options.lineWidth/2,!1!==l.options.scaleColor&&(t-=.08*l.options.size),l.ctx.beginPath(),l.ctx.arc(0,0,t,0,2*Math.PI,!0),l.ctx.close';
  FCode := FCode + 'Path(),l.ctx.strokeStyle=l.options.trackColor,l.ctx.lineWidth=l.options.lineWidth,l.ctx.stroke()},s=function(){if(!1!==l.options.scaleColor&&r(),!1!==l.options.';
  FCode := FCode + 'trackColor)return c()},o=function(t){var n;return s(),l.ctx.strokeStyle=p.isFunction(l.options.barColor)?l.options.barColor(t):l.options.barColor,l.ctx.lineCap=';
  FCode := FCode + 'l.options.lineCap,l.ctx.lineWidth=l.options.lineWidth,n=l.options.size/2-l.options.lineWidth/2,!1!==l.options.scaleColor&&(n-=.08*l.options.size),l.ctx.save(),';
  FCode := FCode + 'l.ctx.rotate(-Math.PI/2),l.ctx.beginPath(),l.ctx.arc(0,0,n,0,2*Math.PI*t/100,!1),l.ctx.stroke(),l.ctx.restore()},i=function(t,n){var i,e;return e=30*l.options.';
  FCode := FCode + 'animate/1e3,i=0,l.options.onStart.call(l),l.percentage=n,l.animation&&(clearInterval(l.animation),l.animation=!1),l.animation=setInterval(function(){if(l.ctx.';
  FCode := FCode + 'clearRect(-l.options.size/2,-l.options.size/2,l.options.size,l.options.size),s.call(l),o.call(l,[a(i,t,n-t,e)]),1<++i/e)return clearInterval(l.animation),';
  FCode := FCode + 'l.animation=!1,l.options.onStop.call(l)},1e3/30)},a=function(t,n,i,e){var o;return o=function(t){return Math.pow(t,2)},i/2*function(t){return t<1?o(t):2-o(t/2*';
  FCode := FCode + '-2+2)}(t/=e/2)+n},this.init()},p.easyPieChart.defaultOptions={barColor:"#ef1e25",trackColor:"#f2f2f2",scaleColor:"#dfe0e0",lineCap:"round",size:110,lineWidth:3,';
  FCode := FCode + 'animate:!1,onStart:p.noop,onStop:p.noop},p.fn.easyPieChart=function(e){return p.each(this,function(t,n){var i;if(!(i=p(n)).data("easyPieChart"))return i.data';
  FCode := FCode + '("easyPieChart",new p.easyPieChart(n,e))})}}).call(this);';
  FCode := FCode + '</script>'+#13;
  FPack.Add(FCode);
  FCode:='';
end;

constructor TChartEasyPieJS.Create;
begin
  FPack := TStringList.Create;
end;

function TChartEasyPieJS.Credenciais(Value: iModelCredenciais): iModelJS;
begin
  Result := Self;
end;

destructor TChartEasyPieJS.Destroy;
begin
  FreeAndNil(FPack);
  inherited;
end;

class function TChartEasyPieJS.New: iModelJS;
begin
  Result := Self.Create ;
end;

function TChartEasyPieJS.PackJS: String;
begin
  if FCDN then
    Result := '<script src="https://thuliobittencourt.com/easypiechart.min.js"></script>'
  else
  begin
    ChartEasyPieJS_1;
    Result := FPack.Text;
  end;
end;

end.
