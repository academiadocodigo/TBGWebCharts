unit UtilsJS;

interface

uses Interfaces, Classes;

type
  TUtilsJS = class(TInterfacedObject,iModelJS)
    private
      FPack : TStringList;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelJS;
	  procedure UtilsJS_1;
      function PackJS : String;
      function CDN(Value : Boolean) : iModelJS;
  end;

implementation

uses
  SysUtils;

{ TUtilsJS }

function TUtilsJS.CDN(Value: Boolean): iModelJS;
begin
  Result := Self;
end;

constructor TUtilsJS.Create;
begin
  FPack := TStringList.Create;
end;

destructor TUtilsJS.Destroy;
begin
  freeandnil(fpack);
  inherited;
end;

class function TUtilsJS.New: iModelJS;
begin
  Result := Self.Create;
end;

procedure TUtilsJS.UtilsJS_1;
begin
  FPack.Add('<script>'+#13);
  FPack.Add('''use strict'';');
  FPack.Add('');
  FPack.Add('window.chartColors = {');
  FPack.Add('	red: ''rgb(255, 99, 132)'',');
  FPack.Add('	orange: ''rgb(255, 159, 64)'',');
  FPack.Add('	yellow: ''rgb(255, 205, 86)'',');
  FPack.Add('	green: ''rgb(75, 192, 192)'',');
  FPack.Add('	blue: ''rgb(54, 162, 235)'',');
  FPack.Add('	purple: ''rgb(153, 102, 255)'',');
  FPack.Add('	grey: ''rgb(201, 203, 207)''');
  FPack.Add('};');
  FPack.Add('');
  FPack.Add('(function(global) {');
  FPack.Add('	var Months = [');
  FPack.Add('		''January'',');
  FPack.Add('		''February'',');
  FPack.Add('		''March'',');
  FPack.Add('		''April'',');
  FPack.Add('		''May'',');
  FPack.Add('		''June'',');
  FPack.Add('		''July'',');
  FPack.Add('		''August'',');
  FPack.Add('		''September'',');
  FPack.Add('		''October'',');
  FPack.Add('		''November'',');
  FPack.Add('		''December''');
  FPack.Add('	];');
  FPack.Add('');
  FPack.Add('	var COLORS = [');
  FPack.Add('		''#4dc9f6'',');
  FPack.Add('		''#f67019'',');
  FPack.Add('		''#f53794'',');
  FPack.Add('		''#537bc4'',');
  FPack.Add('		''#acc236'',');
  FPack.Add('		''#166a8f'',');
  FPack.Add('		''#00a950'',');
  FPack.Add('		''#58595b'',');
  FPack.Add('		''#8549ba''');
  FPack.Add('	];');
  FPack.Add('');
  FPack.Add('	var Samples = global.Samples || (global.Samples = {});');
  FPack.Add('	var Color = global.Color;');
  FPack.Add('');
  FPack.Add('	Samples.utils = {');
  FPack.Add('		// Adapted from http://indiegamr.com/generate-repeatable-random-numbers-in-js/');
  FPack.Add('		srand: function(seed) {');
  FPack.Add('			this._seed = seed;');
  FPack.Add('		},');
  FPack.Add('');
  FPack.Add('		rand: function(min, max) {');
  FPack.Add('			var seed = this._seed;');
  FPack.Add('			min = min === undefined ? 0 : min;');
  FPack.Add('			max = max === undefined ? 1 : max;');
  FPack.Add('			this._seed = (seed * 9301 + 49297) % 233280;');
  FPack.Add('			return min + (this._seed / 233280) * (max - min);');
  FPack.Add('		},');
  FPack.Add('');
  FPack.Add('		numbers: function(config) {');
  FPack.Add('			var cfg = config || {};');
  FPack.Add('			var min = cfg.min || 0;');
  FPack.Add('			var max = cfg.max || 1;');
  FPack.Add('			var from = cfg.from || [];');
  FPack.Add('			var count = cfg.count || 8;');
  FPack.Add('			var decimals = cfg.decimals || 8;');
  FPack.Add('			var continuity = cfg.continuity || 1;');
  FPack.Add('			var dfactor = Math.pow(10, decimals) || 0;');
  FPack.Add('			var data = [];');
  FPack.Add('			var i, value;');
  FPack.Add('');
  FPack.Add('			for (i = 0; i < count; ++i) {');
  FPack.Add('				value = (from[i] || 0) + this.rand(min, max);');
  FPack.Add('				if (this.rand() <= continuity) {');
  FPack.Add('					data.push(Math.round(dfactor * value) / dfactor);');
  FPack.Add('				} else {');
  FPack.Add('					data.push(null);');
  FPack.Add('				}');
  FPack.Add('			}');
  FPack.Add('');
  FPack.Add('			return data;');
  FPack.Add('		},');
  FPack.Add('');
  FPack.Add('		labels: function(config) {');
  FPack.Add('			var cfg = config || {};');
  FPack.Add('			var min = cfg.min || 0;');
  FPack.Add('			var max = cfg.max || 100;');
  FPack.Add('			var count = cfg.count || 8;');
  FPack.Add('			var step = (max - min) / count;');
  FPack.Add('			var decimals = cfg.decimals || 8;');
  FPack.Add('			var dfactor = Math.pow(10, decimals) || 0;');
  FPack.Add('			var prefix = cfg.prefix || '''';');
  FPack.Add('			var values = [];');
  FPack.Add('			var i;');
  FPack.Add('');
  FPack.Add('			for (i = min; i < max; i += step) {');
  FPack.Add('				values.push(prefix + Math.round(dfactor * i) / dfactor);');
  FPack.Add('			}');
  FPack.Add('');
  FPack.Add('			return values;');
  FPack.Add('		},');
  FPack.Add('');
  FPack.Add('		months: function(config) {');
  FPack.Add('			var cfg = config || {};');
  FPack.Add('			var count = cfg.count || 12;');
  FPack.Add('			var section = cfg.section;');
  FPack.Add('			var values = [];');
  FPack.Add('			var i, value;');
  FPack.Add('');
  FPack.Add('			for (i = 0; i < count; ++i) {');
  FPack.Add('				value = Months[Math.ceil(i) % 12];');
  FPack.Add('				values.push(value.substring(0, section));');
  FPack.Add('			}');
  FPack.Add('');
  FPack.Add('			return values;');
  FPack.Add('		},');
  FPack.Add('');
  FPack.Add('		color: function(index) {');
  FPack.Add('			return COLORS[index % COLORS.length];');
  FPack.Add('		},');
  FPack.Add('');
  FPack.Add('		transparentize: function(color, opacity) {');
  FPack.Add('			var alpha = opacity === undefined ? 0.5 : 1 - opacity;');
  FPack.Add('			return Color(color).alpha(alpha).rgbString();');
  FPack.Add('		}');
  FPack.Add('	};');
  FPack.Add('');
  FPack.Add('	// DEPRECATED');
  FPack.Add('	window.randomScalingFactor = function() {');
  FPack.Add('		return Math.round(Samples.utils.rand(-100, 100));');
  FPack.Add('	};');
  FPack.Add('');
  FPack.Add('	// INITIALIZATION');
  FPack.Add('');
  FPack.Add('	Samples.utils.srand(Date.now());');
  FPack.Add('');
  FPack.Add('	// Google Analytics');
  FPack.Add('	/* eslint-disable */');
  FPack.Add('	if (document.location.hostname.match(/^(www\.)?chartjs\.org$/)) {');
  FPack.Add('		(function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){');
  FPack.Add('		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),');
  FPack.Add('		');
  FPack.Add('m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)');
  FPack.Add('		})(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');');
  FPack.Add('		ga(''create'', ''UA-28909194-3'', ''auto'');');
  FPack.Add('		ga(''send'', ''pageview'');');
  FPack.Add('	}');
  FPack.Add('	/* eslint-enable */');
  FPack.Add('');
  FPack.Add('}(this));');
  FPack.Add('</script>'+#13);
end;

function TUtilsJS.PackJS: String;
begin
  UtilsJS_1;
  Result := FPack.Text;
end;

end.
