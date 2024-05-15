unit PivotTableCSS;

interface

uses
  Interfaces;

type
  TPivotTableCSS = class (TInterfacedObject, iModelCSS)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelCss;
      function PackCSS : String;
      function CDN(Value : Boolean) : iModelCSS;
      function BackgroundColor ( Value : String ) :  iModelCSS;
      function FontColor ( Value : String ) : iModelCSS;
      function BorderColor ( Value : String ) : iModelCSS;
  end;

implementation

{ TPivotTableCSS }

function TPivotTableCSS.BackgroundColor(Value: String): iModelCSS;
begin
  Result := Self;
end;

function TPivotTableCSS.BorderColor(Value: String): iModelCSS;
begin
  Result := Self;
end;

function TPivotTableCSS.CDN(Value: Boolean): iModelCSS;
begin
  Result := Self;
end;

constructor TPivotTableCSS.Create;
begin

end;

destructor TPivotTableCSS.Destroy;
begin

  inherited;
end;

function TPivotTableCSS.FontColor(Value: String): iModelCSS;
begin

end;

class function TPivotTableCSS.New: iModelCss;
begin
  Result := Self.Create;
end;

function TPivotTableCSS.PackCSS: String;
begin
  Result := '<style>'+#13;
  Result := Result + '.pvtUi { color: #333; }' + #13;
  Result := Result + 'table.pvtTable {' + #13;
  Result := Result + 'text-align: left;' + #13;
  Result := Result + 'border-collapse: collapse;' + #13;
  Result := Result + 'font-size: 1rem;' + #13;
  Result := Result + 'padding: .45rem;' + #13;
  Result := Result + 'font-weight: 400;' + #13;
  Result := Result + 'line-height: 1.5;' + #13;
  Result := Result + 'font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";' + #13;
  Result := Result + '}' + #13;
  Result := Result + 'select  {' + #13;
  Result := Result + 'border-radius: 5px;' + #13;
  Result := Result + 'max-width: 80px;' + #13;
  Result := Result + 'font-size: 0.8rem;' + #13;
  Result := Result + '}' + #13;
  Result := Result + 'table.pvtTable thead tr th, table.pvtTable tbody tr th {' + #13;
  Result := Result + 'background-color: #f2f2f2;' + #13;
  Result := Result + 'border: 1px solid #dee2ed;' + #13;
  Result := Result + 'font-size: 1rem;' + #13;
  Result := Result + 'padding: .45rem;' + #13;
  Result := Result + 'font-weight: 400;' + #13;
  Result := Result + 'line-height: 1.5;' + #13;
  Result := Result + 'font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";' + #13;
  Result := Result + '}' + #13;
  Result := Result + 'table.pvtTable .pvtColLabel {text-align: center;}' + #13;
  Result := Result + 'table.pvtTable .pvtTotalLabel {text-align: right;}' + #13;
  Result := Result + 'table.pvtTable tbody tr td {' + #13;
  Result := Result + 'color: #3D3D3D;' + #13;
  Result := Result + 'padding: 5px;' + #13;
  Result := Result + 'background-color: #FFF;' + #13;
  Result := Result + 'border: 1px solid #CDCDCD;' + #13;
  Result := Result + 'vertical-align: top;' + #13;
  Result := Result + 'text-align: right;' + #13;
  Result := Result + '}' + #13;
  Result := Result + '.pvtTotal, .pvtGrandTotal { font-weight: bold; }' + #13;
  Result := Result + '.pvtVals { text-align: center; white-space: nowrap;}' + #13;
  Result := Result + '.pvtRowOrder, .pvtColOrder {' + #13;
  Result := Result + 'cursor:pointer;' + #13;
  Result := Result + 'width: 15px;' + #13;
  Result := Result + 'margin-left: 5px;' + #13;
  Result := Result + 'display: inline-block; }' + #13;
  Result := Result + '.pvtAggregator {' + #13;
  Result := Result + 'margin-bottom: 2px ;' + #13;
  Result := Result + 'border-radius: 5px;' + #13;
  Result := Result + 'max-width: 80px;' + #13;
  Result := Result + '}' + #13;
  Result := Result + '.pvtAxisContainer, .pvtVals {' + #13;
  Result := Result + 'border: 0px solid gray;' + #13;
  Result := Result + 'background: #EEE;' + #13;
  Result := Result + 'padding: 5px;' + #13;
  Result := Result + 'min-width: 10px;' + #13;
  Result := Result + 'min-height: 10px;' + #13;
  Result := Result + 'user-select: none;' + #13;
  Result := Result + '-webkit-user-select: none;' + #13;
  Result := Result + '-moz-user-select: none;' + #13;
  Result := Result + '-khtml-user-select: none;' + #13;
  Result := Result + '-ms-user-select: none;' + #13;
  Result := Result + '}' + #13;
  Result := Result + '.pvtAxisContainer li {' + #13;
  Result := Result + 'padding: 2px 2px;' + #13;
  Result := Result + 'list-style-type: none;' + #13;
  Result := Result + 'cursor:move;' + #13;
  Result := Result + '}' + #13;
  Result := Result + '.pvtAxisContainer li.pvtPlaceholder {' + #13;
  Result := Result + '-webkit-border-radius: 5px;' + #13;
  Result := Result + 'padding: 3px 15px;' + #13;
  Result := Result + '-moz-border-radius: 5px;' + #13;
  Result := Result + 'border-radius: 1px;' + #13;
  Result := Result + 'border: 1px dashed #aaa;' + #13;
  Result := Result + '}' + #13;
  Result := Result + '.pvtAxisContainer li span.pvtAttr {' + #13;
  Result := Result + '-webkit-text-size-adjust: 100%;' + #13;
  Result := Result + 'background: #F3F3F3;' + #13;
  Result := Result + 'border: 1px solid #DEDEDE;' + #13;
  Result := Result + 'padding: 2px 5px;' + #13;
  Result := Result + 'white-space:nowrap;' + #13;
  Result := Result + '-webkit-border-radius: 5px;' + #13;
  Result := Result + '-moz-border-radius: 5px;' + #13;
  Result := Result + 'border-radius: 5px;' + #13;
  Result := Result + 'font-size: 12px;' + #13;
  Result := Result + '}' + #13;
  Result := Result + '.pvtTriangle {' + #13;
  Result := Result + 'cursor:pointer;' + #13;
  Result := Result + 'color: grey;' + #13;
  Result := Result + '}' + #13;
  Result := Result + '.pvtHorizList li { display: inline; }' + #13;
  Result := Result + '.pvtVertList { vertical-align: top; }' + #13;
  Result := Result + '.pvtFilteredAttribute { font-style: italic }' + #13;
  Result := Result + '.pvtFilterBox{' + #13;
  Result := Result + 'z-index: 100;' + #13;
  Result := Result + 'width: 300px;' + #13;
  Result := Result + 'border: 1px solid gray;' + #13;
  Result := Result + 'background-color: #fff;' + #13;
  Result := Result + 'position: absolute;' + #13;
  Result := Result + 'text-align: center;' + #13;
  Result := Result + '}' + #13;
  Result := Result + '.pvtFilterBox h4{ margin: 15px; }' + #13;
  Result := Result + '.pvtFilterBox p { margin: 10px auto; }' + #13;
  Result := Result + '.pvtFilterBox label { font-weight: normal; }' + #13;
  Result := Result + '.pvtFilterBox input[type=''checkbox''] { margin-right: 10px; margin-left: 10px; }' + #13;
  Result := Result + '.pvtFilterBox input[type=''text''] { width: 230px; }' + #13;
  Result := Result + '.pvtFilterBox .count { color: gray; font-weight: normal; margin-left: 3px;}' + #13;
  Result := Result + '.pvtCheckContainer{' + #13;
  Result := Result + 'text-align: left;' + #13;
  Result := Result + 'font-size: 14px;' + #13;
  Result := Result + 'white-space: nowrap;' + #13;
  Result := Result + 'overflow-y: scroll;' + #13;
  Result := Result + 'width: 100%;' + #13;
  Result := Result + 'max-height: 250px;' + #13;
  Result := Result + 'border-top: 1px solid lightgrey;' + #13;
  Result := Result + 'border-bottom: 1px solid lightgrey;' + #13;
  Result := Result + '}' + #13;
  Result := Result + '.pvtCheckContainer p{ margin: 5px; }' + #13;
  Result := Result + '.pvtRendererArea {' + #13;
  Result := Result + 'padding: 5px;' + #13;
  Result := Result + '}' + #13;
  Result := Result + '</style>'+#13;

end;

end.
