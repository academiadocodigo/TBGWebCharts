unit Interfaces;
{$I TBGWebCharts.inc}
interface
uses
  {$IF RTLVERSION > 22 }
    {$IFDEF HAS_FMX}
      {$IFDEF HAS_CHROMIUM}
        {$DEFINE HAS_CALLBACK}
      {$ENDIF}
    {$ELSE}
      {$DEFINE HAS_CALLBACK}
    {$ENDIF}
  {$ENDIF}
  DB,
  Generics.Collections,
  {$IFDEF HAS_FMX}
    FMX.StdCtrls,
    FMX.WebBrowser,
  {$ELSE}
    {$IF RTLVERSION > 27 }
      VCL.StdCtrls,
      VCL.Buttons,
      SHDocVw,
    {$IFEND}
    {$IF RTLVERSION < 28 }
      StdCtrls,
      Buttons,
      SHDocVw,
    {$IFEND}
  {$ENDIF}
  {$IFDEF HAS_CHROMIUM}
    uCEFInterfaces,
    {$IFDEF HAS_FMX}
      uCEFFMXChromium,
      uCEFFMXWindowParent,
    {$ELSE}
      uCEFChromium,
      uCEFWindowParent,
    {$ENDIF}
  {$ENDIF}
   System.SysUtils,
   Classes,
   Charts.Types,
   Colors.Bootstrap;

type
  IWebCharts = interface;
  IModelHTML = interface;
  IModelHTMLChartsBar = interface;
  IModelHTMLCharts = interface;
  IModelHTMLChartsConfig = interface;
  IModelRowsTitleConfig = interface;
  IModelHTMLRows = interface;
  IModelHTMLRowsTitle = interface;
  IModelHTMLRowsTag = interface;
  IModelHTMLChartsDoughnut = interface;
  IModelHTMLChartsLines = interface;
  IModelHTMLDataSet = interface;
  IModelHTMLChartsLineStacked = interface;
  IModelHTMLChartsPie = interface;
  IModelLabellingConfig<T> = interface;
  IModelHTMLChartsAxes = interface;
  IModelHTMLChartsAxesTicks<T> = interface;
  IModelHTMLChartsAxesParam = interface;
  IModelHTMLChartsAxesParamRealTime = interface;
  IModelHTMLChartsAxesGridLines<T> = interface;
  IModelHTMLChatsAxesScaleLabel<T> = interface;
  IModelHTMLLegendLabels<T> = interface;
  IModelHTMLLegend = interface;
  IModelHTMLTitle<T> = interface;
  IModelHTMLScales = interface;
  IModelHTMLTooltip<T> = interface;
  IModelHTMLOptions = interface;
  IModelHTMLChartsGeneric = interface;
  IModelJumbotron = interface;
  IModelAlerts = interface;
  IModelAlertsClass = interface;
  IModelListGroup = interface;
  IModelListGroupClass = interface;
  IModelPivotTable = interface;
  IModelGenericList<T> = interface;
  IModelPivotTableConfig = interface;
  IModelPivotTableClass = interface;
  IModelGenericStyle<T> = interface;
  IModelGenericDataSet<T> = interface;
  IModelJSCommand = interface;
  IModelHTMLPlugins = interface;
  IModelTableActionImage = Interface;
  IModelTableAction = interface;
  IModelBrowser = interface;
  IModelGenericCoordinates<T> = interface;
  IModelCredenciais = interface;
  IModelDOMElement = interface;
  IModelMaps = interface;
  IModelGenericTitle<T> = interface;
  IModelMapsGeneric = interface;
  IModelMapsOptions = interface;
  IModelMapsDraw = interface;
  IModelMapsDrawCircle = interface;
  IModelMapsDrawMarker = interface;
  IModelMapsLayer = interface;
  IModelMapsLayerHeatMap = interface;
  IModelMapsDataSet<T> = interface;
  IModelMapsInfoWindow<T> = interface;
  IModelMapsRoutes = interface;
  IModelMapsRoutesDirections = interface;
  IModelMapsRoutesDirectionsPanel = interface;
  {$IFDEF HAS_CHROMIUM}
    IModelChromiumResources = interface;
    IModelChromiumResourcesPages = interface;
    IModelChromiumResourcesJSCallback = interface;
  {$ENDIF}
  IModelLiquidFillGauge = interface;
  IModelLiquidFillGaugeConfig = interface;
  IModelCardStyled = interface;
  IModelCardStyledGeneric = interface;
  IModelCardStyledText = interface;
  IModelCardStyledShape = interface;
  IModelCardStyledShapeClasses = interface;
  IModelCardStyledCallback = interface;
  IModelRichTextEditor = interface;
  IModelRichTextEditorConfig = interface;
  IModelRichTextEditorConfigPrintHeader = interface;
  IModelGenericProgressBar<T> = interface;
  IModelProgress = interface;
  IModelProgressInfo = interface;
  IModelProgressInfoText = interface;
  IModelProgressInfoIcon = interface;
  {$IFDEF FULL}
    IModelTable = interface;
    IModelTableDataSet = interface;
    IModelTableOption = interface;
    IModelTableData = interface;
    IModelTableFeatures = interface;
    IModelTableClass = interface;
    IModelHTMLRowsDiv = interface;
    IModelCardsDataSet = interface;
    IModelCards = interface;
    IModelChartEasyPie = interface;
    IModelButtonClass = interface;
    IModelButton = interface;
    {$IFDEF HAS_CALLBACK}
      ICallbackJS = interface;
    {$ENDIF}
    IModelImageDataSet = interface;
    IModelImage = interface;
    IModelImageClass = interface;
    IModelHTMLRowsP = interface;
    //iCacheControl = interface;
  {$ENDIF}

  IWebCharts = interface(IInterface)
    ['{D98D23CE-5E37-4941-89E3-92AF922ACE60}']
    function AddResource(const Value: string): IWebCharts;
    function BackgroundColor(const Value: string): IWebCharts;
    function CDN(const Value: Boolean): IWebCharts;
    function Container(const Value: TTypeContainer): IWebCharts;
    function ContinuosProject: IModelHTML;
    function Credenciais: IModelCredenciais;
    function FontColor(const Value: string): IWebCharts;
    function NewProject: IModelHTML; overload;
    function NewProject(const Container: Boolean): IModelHTML; overload;
  end;

  IModelHTML = interface(IInterface)
    ['{6D5210CC-D750-4643-8685-48037F21E6AA}']
    function Alerts: IModelAlerts;
    function BackgroundColor(Value: string): IModelHTML;
    function CDN(Value: Boolean): IModelHTML;
    function Charts: IModelHTMLCharts;
    function ClearHTML: IModelHTML;
    function Container(Value: Boolean): IModelHTML;
    function ContainerClass(Value: TTypeContainer): IModelHTML;
    function Credenciais(Value: IModelCredenciais): IModelHTML;
    function DOMElement: IModelDOMElement;
    procedure ExecuteScript(Value: IModelJSCommand);
    procedure ExecuteScriptCallback(Value: IModelJSCommand);
    function ExecuteScriptResult(Value: IModelJSCommand): string;
    function FolderDefaultRWC(Value: string): IModelHTML;
    function FontColor(Value: string): IModelHTML;
    function Generated: IModelHTML;
    function GenerateFooter: IModelHTML;
    function GenerateHead: IModelHTML; overload;
    function GenerateHead(const Value: TList<string>): IModelHTML; overload;
    function HTML: string; overload;
    function HTML(const Value: string): IModelHTML; overload;
    function Jumbotron: IModelJumbotron;
    function Jumpline: IModelHTML;
    function LiquiFillGauge: IModelLiquidFillGauge;
    function ListGroup: IModelListGroup;
    function PivotTable: IModelPivotTable;
    function Print: IModelHTML;
    function Progress: IModelProgress;
    function RichTextEditor: IModelRichTextEditor;
    function Rows: IModelHTMLRows;
    function WebBrowser(Value: TWebBrowser): IModelHTML; overload;
    {$IFDEF HAS_CHROMIUM}
      {$IFDEF HAS_FMX}
        function WebBrowser(Value: TFMXChromium): IModelHTML; overload;
        function WindowParent(Value: TFMXWindowParent): IModelHTML; overload;
      {$ELSE}
        function WebBrowser(Value: TChromium): IModelHTML; overload;
        function WindowParent(Value: TCEFWindowParent): IModelHTML; overload;
      {$ENDIF}
      function Maps: IModelMaps;
    {$ENDIF}
    {$IFDEF FULL}
      function Cards: IModelCards;
      function CardStyled: IModelCardStyled;
      function ChartEasyPie: IModelChartEasyPie;
      function Table: IModelTable;
      {$IFDEF HAS_CALLBACK}
        function Buttons: IModelButton;
        function CallbackJS: ICallbackJS;
      {$ENDIF}
      function Image: IModelImage;
      //function CacheControl: iCacheControl;
    {$ENDIF}  end;

  IModelDOMElement = interface(IInterface)
    ['{D56B9A0A-3945-4FA2-97A6-AB941E42B256}']
    function &End: IModelHTML;
    function Html(Value: string): IModelDOMElement;
    function Id(Value: string): IModelDOMElement;
    function Update: IModelDOMElement;
  end;

  IModelCredenciais = interface(IInterface)
    ['{FCE8B965-DB1B-42E6-B831-588BB955A88A}']
    function &End: IWebCharts;
    function APIGoogle: string; overload;
    function APIGoogle(Value: string): IModelCredenciais; overload;
  end;

  IModelBrowser = interface(IInterface)
    ['{90CE8FFC-31D4-423B-A585-5A6B5E01A3F8}']
    procedure ExecuteScript(Value: IModelJSCommand);
    procedure ExecuteScriptCallback(Value: IModelJSCommand);
    function ExecuteScriptResult(Value: IModelJSCommand): string;
    function Generated(FHTML: string): IModelBrowser;
  end;

  IModelMaps = interface(IInterface)
    ['{6FB8BE17-5803-418D-B9A6-2448DFE5B6F9}']
    function MapType(Value: TTypeMaps): IModelMapsGeneric;
    function MapTitle: IModelGenericTitle<IModelMaps>;
    function &End: IModelHTML;
  end;

  IModelGenericTitle<T> = interface(IInterface)
    ['{BBADD905-F041-4B05-8729-5F6ED7C3F286}']
    function &End: T;
    function FontColor: string; overload;
    function FontColor(Value: string): IModelGenericTitle<T>; overload;
    function FontColorHEX: string; overload;
    function FontColorHEX(Value: string): IModelGenericTitle<T>; overload;
    function FontFamily: string; overload;
    function FontFamily(Value: string): IModelGenericTitle<T>; overload;
    function FontSize: string; overload;
    function FontSize(Value: Integer): IModelGenericTitle<T>; overload;
    function FontSize(Value: string): IModelGenericTitle<T>; overload;
    function Result: string;
    function Text: string; overload;
    function Text(Value: string): IModelGenericTitle<T>; overload;
    function TextAlignment: string; overload;
    function TextAlignment(Value: string): IModelGenericTitle<T>; overload;
  end;

  IModelMapsGeneric = interface(IInterface)
    ['{9831E9BF-E318-4D65-9722-B1A8E9562AC3}']
    function &End: IModelMaps;
    function Draw: IModelMapsDraw;
    function GetDirectionResult(Value: TProc<string>): IModelMapsGeneric;
    function GetGeoCodeResult(Value: TProc<string>): IModelMapsGeneric;
    function Height(Value: string): IModelMapsGeneric;
    function Layer: IModelMapsLayer;
    function Name: string; overload;
    function Name(Value: string): IModelMapsGeneric; overload;
    function Options: IModelMapsOptions;
    function ResultClass: string;
    function Routes: IModelMapsRoutes;
    function Width(Value: string): IModelMapsGeneric;
  end;

  IModelMapsOptions = interface(IInterface)
    ['{ADAAA471-ED18-411D-9855-04ABFCCBB9B6}']
    function &End: IModelMapsGeneric;
    function Center: IModelGenericCoordinates<IModelMapsOptions>;
    function FullScreenControl: IModelMapsOptions; overload;
    function FullScreenControl(Value: Boolean): IModelMapsOptions; overload;
    function MapStyle(Value: TTypeMapStyle): IModelMapsOptions;
    function MapTypeControl: IModelMapsOptions; overload;
    function MapTypeControl(Value: Boolean): IModelMapsOptions; overload;
    function ResultScript: string;
    function RotateControl(Value: Boolean): IModelMapsOptions; overload;
    function StreetViewControl: IModelMapsOptions; overload;
    function StreetViewControl(Value: Boolean): IModelMapsOptions; overload;
    function Tilt(Value: Boolean): IModelMapsOptions; overload;
    function Zoom(Value: Integer): IModelMapsOptions;
    function ZoomControl: IModelMapsOptions; overload;
    function ZoomControl(Value: Boolean): IModelMapsOptions; overload;
  end;

  IModelMapsDraw = interface(IInterface)
    ['{00620760-9D3F-48FE-9FB4-91CB43C64F53}']
    function &End: IModelMapsGeneric;
    function Circle: IModelMapsDrawCircle;
    function Marker: IModelMapsDrawMarker;
    function ResultScript: string;
  end;

  IModelMapsDrawMarker = interface(IInterface)
    ['{03FDD2B8-7C64-41C1-A9B6-4284EBE6B997}']
    function &End: IModelMapsDraw;
    function DataSet: IModelMapsDataSet<IModelMapsDrawMarker>;
    function InfoWindow: IModelMapsInfoWindow<IModelMapsDrawMarker>;
    function ResultScript(Value: string): string;
  end;

  IModelMapsDrawCircle = interface(IInterface)
    ['{14E21290-71DA-4BE7-919B-DA81B6E765E7}']
    function &End: IModelMapsDraw;
    function DataSet: IModelMapsDataSet<IModelMapsDrawCircle>;
    function Fator(Value: integer): IModelMapsDrawCircle;
    function FillColor(Value: string): IModelMapsDrawCircle;
    function FillOpacity(Value: string): IModelMapsDrawCircle;
    function InfoWindow: IModelMapsInfoWindow<IModelMapsDrawCircle>;
    function ResultScript(MapName: string): string;
    function StrokeColor(Value: string): IModelMapsDrawCircle;
    function StrokeOpacity(Value: string): IModelMapsDrawCircle;
    function StrokeWeight(Value: Integer): IModelMapsDrawCircle;
  end;

  IModelMapsLayer = interface(IInterface)
    ['{ACABBD56-A9D9-4D0B-85B1-6D115C218FAD}']
    function &End: IModelMapsGeneric;
    function HeatMap: IModelMapsLayerHeatMap;
    function ResultScript: string;
  end;

  IModelMapsLayerHeatMap = interface(IInterface)
    ['{A46B4845-FF76-48D5-AB8A-C7F39D0FE34C}']
    function &End: IModelMapsLayer;
    function DataSet: IModelMapsDataSet<IModelMapsLayerHeatMap>;
    function Opacity(Value: string):IModelMapsLayerHeatMap;
    function Radius(Value: string): IModelMapsLayerHeatMap;
    function ResultScript(MapName: string): string;
  end;

  IModelMapsDataSet<T> = interface(IInterface)
    ['{F58E5C44-D904-4347-BC57-CF7889DB4DD1}']
    function &End: T;
    function AddressName: string; overload;
    function AddressName(Value: string): IModelMapsDataSet<T>; overload;
    function DataSet: TDataSet; overload;
    function DataSet(Value: TDataSet): IModelMapsDataSet<T>; overload;
    function IdAddressName: string; overload;
    function IdAddressName(Value: string): IModelMapsDataSet<T>; overload;
    function InfoName: string; overload;
    function InfoName(Value: string): IModelMapsDataSet<T>; overload;
    function LabelName: string; overload;
    function LabelName(Value: string): IModelMapsDataSet<T>; overload;
    function LatName: string; overload;
    function LatName(Value: string): IModelMapsDataSet<T>; overload;
    function LngName: string; overload;
    function LngName(Value: string): IModelMapsDataSet<T>; overload;
    function ValueName: string; overload;
    function ValueName(Value: string): IModelMapsDataSet<T>; overload;
  end;

  IModelMapsInfoWindow<T> = interface(IInterface)
    ['{E850C6C0-C800-49A1-A582-725CEDE94178}']
    function &End: T;
    function MaxWidth: string; overload;
    function MaxWidth(Value: integer): IModelMapsInfoWindow<T>; overload;
    function MinWidth: string; overload;
    function MinWidth(Value: integer): IModelMapsInfoWindow<T>; overload;
    function StartOpened: string; overload;
    function StartOpened(Value: Boolean): IModelMapsInfoWindow<T>; overload;
  end;

  IModelMapsRoutes = interface(IInterface)
    ['{26523E12-4DFB-482B-B549-DB3CFD2E8A96}']
    function &End: IModelMapsGeneric;
    function Directions: IModelMapsRoutesDirections;
    function ResultScript: string;
  end;

  IModelMapsRoutesDirections = interface(IInterface)
    ['{BC86B376-85F0-4939-8A7B-169F54D6AA88}']
    function &End: IModelMapsRoutes;
    function DataSet: IModelMapsDataSet<IModelMapsRoutesDirections>;
    function Destination(Value: string): IModelMapsRoutesDirections;
    function OptimizeWaypoints(Value: Boolean): IModelMapsRoutesDirections;
    function Origin(Value: string): IModelMapsRoutesDirections;
    function Panel: IModelMapsRoutesDirectionsPanel;
    function ResultScript(MapName: string): string;
    function TravelMode(Value: TTypeMapTravelMode): IModelMapsRoutesDirections;
  end;

  IModelMapsRoutesDirectionsPanel = interface(IInterface)
    function &End: IModelMapsRoutesDirections;
    function FloatPos: string; overload;
    function FloatPos(Value: string): IModelMapsRoutesDirectionsPanel; overload;
    function Width: string; overload;
    ['{12C3A169-AB02-494B-871B-C37259B4C023}']
    function Width(Value: string): IModelMapsRoutesDirectionsPanel; overload;
  end;

  {$IFDEF HAS_CHROMIUM}
    IModelChromiumResourcesPages = interface(IInterface)
      ['{30782EC6-B430-4FC1-9B23-D06693BE23D4}']
      function Add(HTML: string): string;
      function Extract(Key: string):ICefResourceHandler;
      function Get(Key: string): ICefResourceHandler;
      procedure Remove(Key: string);
    end;

    IModelChromiumResourcesJSCallback = interface(IInterface)
      ['{384A33CB-A7E7-40C3-88EA-F656605C0964}']
      function Add(Proc: TProc<string>): string;
      function Extract(Key: string):TProc<string>;
      function Get(Key: string): TProc<string>;
      procedure Remove(Key: string);
    end;

    IModelChromiumResources = interface(IInterface)
      ['{16F507A0-D848-4491-AF0A-8AE73782FBB2}']
      function JSCallback: IModelChromiumResourcesJSCallback;
      function Pages: IModelChromiumResourcesPages;
    end;
  {$ENDIF}

  IModelLiquidFillGauge = interface(IInterface)
    ['{9ECA3F3B-E741-4B9E-9FAE-46A52D195CD5}']
    function &End: IModelHTML;
    function Align(Value:string): IModelLiquidFillGauge;
    function Config: IModelLiquidFillGaugeConfig;
    function Height(Value: string): IModelLiquidFillGauge;
    function Name: string; overload;
    function Name(Value: string): IModelLiquidFillGauge; overload;
    function Title: IModelGenericTitle<IModelLiquidFillGauge>;
    function UpdateValue: IModelLiquidFillGauge;
    function Value(Value: string): IModelLiquidFillGauge;
    function Width(Value: string): IModelLiquidFillGauge;
  end;

  IModelLiquidFillGaugeConfig = interface(IInterface)
    ['{A8E00200-7895-4E94-9492-7A5BE4863B04}']
    function &End: IModelLiquidFillGauge;
    function CircleColor(Value: string): IModelLiquidFillGaugeConfig;
    function CircleColorHex(Value: string): IModelLiquidFillGaugeConfig;
    function CircleFillGap(Value: Integer): IModelLiquidFillGaugeConfig;
    function CircleThickness(Value: Integer): IModelLiquidFillGaugeConfig;
    function DisplayPercent(Value: Boolean): IModelLiquidFillGaugeConfig;
    function MaxValue(Value: integer): IModelLiquidFillGaugeConfig;
    function MinValue(Value: integer): IModelLiquidFillGaugeConfig;
    function ResultScript: string;
    function TextColor(Value: string): IModelLiquidFillGaugeConfig;
    function TextColorHex(Value: string): IModelLiquidFillGaugeConfig;
    function TextSize(Value: Integer): IModelLiquidFillGaugeConfig;
    function TextVertPosition(Value: Integer): IModelLiquidFillGaugeConfig;
    function ValueCountUp(Value: Boolean): IModelLiquidFillGaugeConfig;
    function WaveAnimate(Value: Boolean): IModelLiquidFillGaugeConfig;
    function WaveAnimateTime(Value: Integer): IModelLiquidFillGaugeConfig;
    function WaveColor(Value: string): IModelLiquidFillGaugeConfig;
    function WaveColorHex(Value: string): IModelLiquidFillGaugeConfig;
    function WaveCount(Value: Integer): IModelLiquidFillGaugeConfig;
    function WaveHeight(Value: Integer): IModelLiquidFillGaugeConfig;
    function WaveHeightScaling(Value: Boolean): IModelLiquidFillGaugeConfig;
    function WaveOffset(Value: Integer): IModelLiquidFillGaugeConfig;
    function WaveRise(Value: Boolean): IModelLiquidFillGaugeConfig;
    function WaveRiseTime(Value: Integer): IModelLiquidFillGaugeConfig;
    function WaveTextColor(Value: string): IModelLiquidFillGaugeConfig;
    function WaveTextColorHex(Value: string): IModelLiquidFillGaugeConfig;
  end;

  IModelCardStyled = interface(IInterface)
    ['{9DB61CB7-D7D1-4E62-80AE-815CD0BC3717}']
    function &End: IModelHTML;
    function CardType(Value: TTypeCardStyled): IModelCardStyledGeneric;
  end;

  IModelCardStyledGeneric = interface(IInterface)
    ['{3CE71864-DAF3-4C3A-8CEA-A715BBDDD85C}']
    function &End: IModelCardStyled;
    function BackgroundColor(Value: string): IModelCardStyledGeneric;
    function Body: IModelCardStyledText;
    function Callback: IModelCardStyledCallback;
    function Col(Value: Integer): IModelCardStyledGeneric;
    function Colmd(Value: Integer): IModelCardStyledGeneric;
    function Colxl(Value: Integer): IModelCardStyledGeneric;
    function DefaultFontColor(Value: string): IModelCardStyledGeneric;
    function Footer: IModelCardStyledText;
    function HTML: string;
    function Name(Value: string): IModelCardStyledGeneric;
    function Progress: IModelGenericProgressBar<IModelCardStyledGeneric>;
    function Shape: IModelCardStyledShape;
    function Title: IModelCardStyledText;
  end;

  IModelCardStyledCallback = interface(IInterface)
    ['{9F8311B1-92BC-49FC-BCDD-CC5DCED5C3FD}']
    function &End: IModelCardStyledGeneric;
    function MethodName(aValue: string): IModelCardStyledCallback;
    function ParamValue(aValue: string): IModelCardStyledCallback;
    function ResultClass: string;
  end;

  IModelCardStyledText = interface(IInterface)
    ['{C6A880DD-CA67-4335-9FD8-378A334CD59A}']
    function Style: IModelGenericStyle<IModelCardStyledText>;
    function Text(Value: string): IModelCardStyledText; overload;
    function Text: string; overload;
    function &End: IModelCardStyledGeneric;
  end;

  IModelCardStyledShape = interface(IInterface)
    ['{DD59592F-FA79-4E15-84C4-C53143A0F1A6}']
    function &End: IModelCardStyledGeneric;
    function ColAuto(Value: Boolean): IModelCardStyledShape;
    function Icon(Value: string):  IModelCardStyledShape;
    function ResultClass: string;
    function ShapeClass: IModelCardStyledShapeClasses;
    function Style: IModelGenericStyle<IModelCardStyledShape>;
    function Text(Value: string): IModelCardStyledShape;
  end;

  IModelCardStyledShapeClasses = interface(IInterface)
    ['{B03205C4-5A8A-49D9-B37F-DBD47AAC999A}']
    function &End: IModelCardStyledShape;
    function ResultShapeClass: string;
    function Rounded: IModelCardStyledShapeClasses;
    function RoundedCircle: IModelCardStyledShapeClasses;
    function Shadow: IModelCardStyledShapeClasses;
  end;

  IModelRichTextEditor = interface(IInterface)
    ['{B06FEC4A-D856-405A-BBCA-9DC9B1ABBD68}']
    function &End: IModelHTML;
    function Attributes: IModelRichTextEditorConfig;
    function LoadContent(aValue: string): IModelRichTextEditor;
    function SaveContent(Value: TProc<string>): IModelRichTextEditor;
    function SaveContentHtml(Value: TProc<string>): IModelRichTextEditor;
    function SaveContentText(Value: TProc<string>): IModelRichTextEditor;
  end;

  IModelRichTextEditorConfig = interface(IInterface)
    function &End: IModelRichTextEditor;
    ['{F17E30E3-C930-4907-B79E-9A7D1DABFFF6}']
    function Content(aValue: string): IModelRichTextEditorConfig;
    function Height(aValue: string): IModelRichTextEditorConfig;
    function Margin(aValue: string): IModelRichTextEditorConfig;
    function MaxHeight(aValue: string): IModelRichTextEditorConfig;
    function MaxWidth(aValue: string): IModelRichTextEditorConfig;
    function PlaceHolder(aValue: string): IModelRichTextEditorConfig;
    function PrintHeader: IModelRichTextEditorConfigPrintHeader;
    function ReadOnly(aValue: Boolean): IModelRichTextEditorConfig;
    function ResultConfig: string;
    function ResultContent: string;
    function ResultPrintHeader: string;
    function ResultStyleContainer: string;
    function ResultStyleEditor: string;
    function Width(aValue: string): IModelRichTextEditorConfig;
  end;

  IModelRichTextEditorConfigPrintHeaderDiv = interface;
  IModelRichTextEditorConfigPrintHeaderImage = interface;
  IModelRichTextEditorConfigPrintHeaderTitle = interface;

  IModelRichTextEditorConfigPrintHeader = interface(IInterface)
    ['{7011CAA5-ACA4-4CB6-A41C-61BCBDF083FA}']
    function &Div: IModelRichTextEditorConfigPrintHeaderDiv;
    function &End: IModelRichTextEditorConfig;
    function HTML: string;
  end;

  IModelRichTextEditorConfigPrintHeaderDiv = interface(IInterface)
    ['{21CC0E25-6451-4E02-8CDE-0B5BF457586A}']
    function &End: IModelRichTextEditorConfigPrintHeader;
    function Col(aValue: Integer): IModelRichTextEditorConfigPrintHeaderDiv; overload;
    function Col(aValue: string): IModelRichTextEditorConfigPrintHeaderDiv; overload;
    function HTML: string;
    function Image: IModelRichTextEditorConfigPrintHeaderImage;
    function Title: IModelRichTextEditorConfigPrintHeaderTitle;
  end;
  IModelRichTextEditorConfigPrintHeaderImage = interface
    ['{D9AD1ABA-940A-4CBA-AA1D-2E1C2D2D234C}']
    function HTML: string;
    function Image(aValue: TCustomMemoryStream): IModelRichTextEditorConfigPrintHeaderImage; overload;
    function Image(aValue: string): IModelRichTextEditorConfigPrintHeaderImage; overload;
    function Style: IModelGenericStyle<IModelRichTextEditorConfigPrintHeaderImage>;
    function &End: IModelRichTextEditorConfigPrintHeaderDiv;
  end;

  IModelRichTextEditorConfigPrintHeaderTitle = interface(IInterface)
    ['{35743850-BD83-49C4-A0DD-BCDBD70A9911}']
    function &End: IModelRichTextEditorConfigPrintHeaderDiv;
    function HTML: string;
    function Style: IModelGenericStyle<IModelRichTextEditorConfigPrintHeaderTitle>;
    function Text(aValue: string): IModelRichTextEditorConfigPrintHeaderTitle; overload;
  end;

  IModelGenericProgressBar<T> = interface(IInterface)
    ['{7442EC82-63F9-44DF-A346-4529556F79EE}']
    function &End: T;
    function Background(aValue: string): IModelGenericProgressBar<T>;
    function Color(aValue: string): IModelGenericProgressBar<T>;
    function DisplayLabel(aValue: Boolean): IModelGenericProgressBar<T>;
    function Height: string; overload;
    function Height(aValue: Integer): IModelGenericProgressBar<T>; overload;
    function HTML: string;
    function Sytle(aValue: TTypeBackgroundColor): IModelGenericProgressBar<T>;
    function Value(aValue: string): IModelGenericProgressBar<T>;
  end;

  IModelProgress = interface(IInterface)
    ['{5AEB894D-A80F-4FA2-89E8-EF4EAE6F11DB}']
    function &End: IModelHTML;
    function Height(aValue: integer): IModelProgress;
    function HTML: string;
    function Info: IModelProgressInfo;
    function MarginTop(aValue: string): IModelProgress;
    function ProgressBar: IModelGenericProgressBar<IModelProgress>;
  end;

  IModelProgressInfo = interface
    ['{33505BD6-334C-4B41-9043-AFE6495B5E2C}']
    function &End: IModelProgress;
    function Icon: IModelProgressInfoIcon;
    function ResultClass: string;
    function Title: IModelProgressInfoText;
    function Value: IModelProgressInfoText;
  end;

  IModelProgressInfoText = interface(IInterface)
    ['{8EB4A93C-D5B6-42C0-A66C-9B2ECA5832F0}']
    function &End: IModelProgressInfo;
    function Style: IModelGenericStyle<IModelProgressInfoText>;
    function Text: string; overload;
    function Text(Value: string): IModelProgressInfoText; overload;
  end;

  IModelProgressInfoIcon = interface(IInterface)
    ['{86914363-ED8C-46C6-912B-372855C175F0}']
    function &End: IModelProgressInfo;
    function Icon: string; overload;
    function Icon(Value: string): IModelProgressInfoIcon; overload;
    function Positive(Value: Boolean = true): IModelProgressInfoIcon;
    function Style: IModelGenericStyle<IModelProgressInfoIcon>;
    function Up(Value: Boolean = true): IModelProgressInfoIcon;
  end;

//  iLabelLing = interface
//    function Numeral(Value: string): iLabelLing;
//    function Result: string;
//  end;
//
//  iNumeral = interface
//    function Result(Value: string): string;
//  end;
  IModelHTMLRows = interface(IInterface)
    ['{684C6EA3-4C2D-4AA9-9A94-BF0A07B14A8B}']
    function &End: IModelHTML;
    function HTML: string; overload;
    function HTML(Value: string): IModelHTMLRows; overload;
    function ID(Value: string): IModelHTMLRows;
    function Tag: IModelHTMLRowsTag;
    function Title: IModelHTMLRowsTitle;
    {$IFDEF FULL}
    function _Div: IModelHTMLRowsDiv;
    function _P: IModelHTMLRowsP;
    {$ENDIF}
  end;

  IModelHTMLRowsTag = interface(IInterface)
    ['{15075847-E7A6-4F18-878D-A7DBCECABE94}']
    function &End: IModelHTMLRows;
    function Add(Value: string): IModelHTMLRowsTag;
  end;

  IModelHTMLRowsTitle = interface(IInterface)
    ['{F2D34927-8232-4A18-944A-DB0ADAD1C903}']
    function &End: IModelHTMLRows;
    function Config: IModelRowsTitleConfig;
    function Configuracoes: IModelRowsTitleConfig;
    function HTML: string; overload;
    function HTML(Value: string): IModelHTMLRowsTitle; overload;
  end;

  IModelRowsTitleConfig = interface(IInterface)
    ['{87031018-5C12-42DF-895F-2602B87FE468}']
    function &End: IModelHTMLRowsTitle;
    function H1: string; overload;
    function H1(Value: string): IModelRowsTitleConfig; overload;
    function H2: string; overload;
    function H2(Value: string): IModelRowsTitleConfig; overload;
    function H3: string; overload;
    function H3(Value: string): IModelRowsTitleConfig; overload;
    function H4: string; overload;
    function H4(Value: string): IModelRowsTitleConfig; overload;
    function H5: string; overload;
    function H5(Value: string): IModelRowsTitleConfig; overload;
  end;

  IModelHTMLCharts = interface(IInterface)
    ['{4CC23536-78BD-40F7-B4A8-D5625E849065}']
    function &End: IModelHTML;
    function HTML: string; overload;
    function HTML(Value: string): IModelHTMLCharts; overload;
    function _ChartType: TTypeChart; overload;
    function _ChartType(Value: TTypeChart): IModelHTMLChartsGeneric; overload;
  end;

  IModelHTMLChartsGeneric = interface(IInterface)
    ['{83AA6A13-6102-4352-9503-FF9C4AA2C4C7}']
    function &End: IModelHTMLCharts;
    function Attributes: IModelHTMLChartsConfig;
    function HTML: string; overload;
    function HTML(Value: string): IModelHTMLChartsGeneric; overload;
    function UpdateChart: IModelHTMLChartsGeneric;
    function UpdateRealTime: IModelHTMLChartsGeneric;
  end;

  IModelHTMLChartsDoughnut = interface(IInterface)
    ['{709FF228-7F8A-4E2B-8AB9-EFAEC9AEE1B4}']
    function &End: IModelHTMLCharts;
    function Attributes: IModelHTMLChartsConfig;
    function HTML: string; overload;
    function HTML(Value: string): IModelHTMLChartsDoughnut; overload;
    function SemiCircule(aValue: Boolean ): IModelHTMLChartsDoughnut; overload;
  end;

  IModelHTMLChartsBar = interface(IInterface)
    ['{25AE0278-2105-4223-86A9-41F289F75EAE}']
    function &End: IModelHTMLCharts;
    function Attributes: IModelHTMLChartsConfig;
    function HTML: string; overload;
    function HTML(Value: string): IModelHTMLChartsBar; overload;
  end;

  IModelHTMLChartsLines = interface(IInterface)
    ['{10DCD4CF-984F-4952-919A-5259A13A9D8D}']
    function &End: IModelHTMLCharts;
    function Attributes: IModelHTMLChartsConfig;
    function HTML: string; overload;
    function HTML(Value: string): IModelHTMLChartsLines; overload;
  end;

  IModelHTMLChartsLineStacked = interface(IInterface)
    ['{6A3F3157-8FB2-4D72-A33A-27A66BED2661}']
    function &End: IModelHTMLCharts;
    function Attributes: IModelHTMLChartsConfig;
    function HTML: string; overload;
    function HTML(Value: string): IModelHTMLChartsLineStacked; overload;
  end;

  IModelHTMLChartsPie = interface(IInterface)
    ['{470E91C0-58DF-440E-AF3A-445746F0CFE0}']
    function &End: IModelHTMLCharts;
    function Attributes: IModelHTMLChartsConfig;
    function HTML: string; overload;
    function HTML(Value: string): IModelHTMLChartsPie; overload;
  end;

  IModelHTMLChartsConfig = interface(IInterface)
    ['{B140654A-10FE-48A2-93B8-3D90743E3F1E}']
    function &End: IModelHTMLChartsGeneric;
    function BackgroundColor: string; overload;
    function BackgroundColor(Value: string): IModelHTMLChartsConfig; overload;
    function CallBackLink: string; overload;
    function CallBackLink(Value: string): IModelHTMLChartsConfig; overload;
    function ColSpan: Integer; overload;
    function ColSpan(Value: Integer): IModelHTMLChartsConfig; overload;
    function Data: string; overload;
    function Data(Value: string): IModelHTMLChartsConfig; overload;
    function DataSet: IModelHTMLDataSet;
    function Heigth: Integer; overload;
    function Heigth(Value: Integer): IModelHTMLChartsConfig; overload;
    function IDChart: string;
    function Labelling: IModelLabellingConfig<IModelHTMLChartsConfig>; overload;
    function Labels: string; overload;
    function Labels(Value: string): IModelHTMLChartsConfig; overload;
    function Name: string; overload;
    function Name(Value: string): IModelHTMLChartsConfig; overload;
    function Options: IModelHTMLOptions;
    function ResultDataSet: string;
    function ResultLabels: string;
    function ResultRealTimeInitialValue: string;
    function Stacked: Boolean; overload;
    function Stacked(Value: Boolean): IModelHTMLChartsConfig; overload;
    function Width: Integer; overload;
    function Width(Value: Integer): IModelHTMLChartsConfig; overload;
  end;

  IModelHTMLOptions = interface(IInterface)
    ['{8984AFE4-EBFC-4C97-B7BC-D3DA8FFFB42B}']
    function &End: IModelHTMLChartsConfig;
    function HideLabelEmptyData(Value: Boolean): IModelHTMLOptions;
    function Legend: IModelHTMLLegend;
    function Plugins: IModelHTMLPlugins;
    function Result: string;
    function Scales: IModelHTMLScales;
    function SemiCircule(Value: Boolean ): IModelHTMLOptions;
    function SkipEmptyData(Value: Boolean): IModelHTMLOptions;
    function Title: IModelHTMLTitle<IModelHTMLOptions>;
    function Tooltip: IModelHTMLTooltip<IModelHTMLOptions>;
  end;

  IModelHTMLPlugins = interface(IInterface)
    ['{55083212-FCFF-4AEC-A1ED-AEFC2C39BB5E}']
    function &End: IModelHTMLOptions;
    function Result: string;
    function Streaming(Value: Boolean): IModelHTMLPlugins;
  end;

  IModelHTMLScales = interface(IInterface)
    ['{5968D5D3-75C9-4F2C-9E66-3361A92D8DA4}']
    function &End: IModelHTMLOptions;
    function Axes: IModelHTMLChartsAxes;
    function GeneratedAxes(Value: Boolean ): IModelHTMLScales;
    function Result: string;
  end;

  IModelHTMLTooltip<T> = interface(IInterface)
    ['{5968D5D3-75C9-4F2C-9E66-3361A92D8DA4}']
    function &End: T;
    function DisplayTitle(Value: Boolean): IModelHTMLTooltip<T>;
    function Enabled(Value: Boolean): IModelHTMLTooltip<T>;
    function Format(Value: string): IModelHTMLTooltip<T>;
    function HideZeroValues(Value: Boolean): IModelHTMLTooltip<T>;
    function InteractionModeDataset: IModelHTMLTooltip<T>;
    function InteractionModeIndex: IModelHTMLTooltip<T>;
    function InteractionModeNearest: IModelHTMLTooltip<T>;
    function InteractionModePoint: IModelHTMLTooltip<T>;
    function InteractionModeX: IModelHTMLTooltip<T>;
    function InteractionModeY: IModelHTMLTooltip<T>;
    function Intersect(Value: Boolean): IModelHTMLTooltip<T>;
    function Result: string;
    function ToolTipNoScales: IModelHTMLTooltip<T>;
  end;

  IModelHTMLTitle<T> = interface(IInterface)
    ['{21A4474D-87C2-435B-9881-D385518C6EA6}']
    function &End: T;
    function Display: Boolean; overload;
    function Display(Value: Boolean ):  IModelHTMLTitle<T>; overload;
    function FontColorHEX: string; overload;
    function FontColorHEX(Value: string ): IModelHTMLTitle<T>; overload;
    function FontFamily: string; overload;
    function FontFamily(Value: string ): IModelHTMLTitle<T>; overload;
    function FontSize: Integer; overload;
    function FontSize(Value: Integer ): IModelHTMLTitle<T>; overload;
    function FontStyle: string; overload;
    function FontStyle(Value: string ): IModelHTMLTitle<T>; overload;
    function Padding: Integer; overload;
    function Padding(Value: Integer ): IModelHTMLTitle<T>; overload;
    function Position: string; overload;
    function Position(Value: string ): IModelHTMLTitle<T>; overload;
    function Result: string;
    function Text: string; overload;
    function Text(Value: string ): IModelHTMLTitle<T>; overload;
  end;

  IModelHTMLLegend = interface(IInterface)
    ['{BC60AEB1-5404-4355-868A-D26BB5A2C773}']
    function &End: IModelHTMLOptions;
    function Display: Boolean; overload;
    function Display(Value: Boolean ): IModelHTMLLegend; overload;
    function Labels: IModelHTMLLegendLabels<IModelHTMLLegend>;
    function Position: string; overload;
    function Position(Value: string ): IModelHTMLLegend; overload;
    function Result: string;
  end;
  IModelHTMLLegendLabels<T> = interface
    ['{796188B6-4031-43E8-ABF1-43D6C8E1B18D}']
    function FontSize(Value: Integer): IModelHTMLLegendLabels<T>; overload;
    function FontSize: Integer; overload;
    function FontStyle(Value: string ): IModelHTMLLegendLabels<T>; overload;
    function FontStyle: string; overload;
    function FontColorHEX(Value: string ): IModelHTMLLegendLabels<T>; overload;
    function FontColorHEX: string; overload;
    function FontFamily(Value: string ): IModelHTMLLegendLabels<T>; overload;
    function FontFamily: string; overload;
    function Padding(Value: Integer ): IModelHTMLLegendLabels<T>; overload;
    function Padding: Integer; overload;
    function Result: string;
    function &End: T;
  end;
  IModelLabellingConfig<T> = interface(IInterface)
    ['{4BBEDE9F-9F02-4E92-AFA4-3B301DEC6672}']
    function &End: T;
    function FontFamily: string; overload;
    function FontFamily(Value: string): IModelLabellingConfig<T>; overload;
    function FontSize: Integer; overload;
    function FontSize(Value: Integer): IModelLabellingConfig<T>; overload;
    function FontStyle: string; overload;
    function FontStyle(Value: string): IModelLabellingConfig<T>; overload;
    function Format: string; overload;
    function Format(Value: string): IModelLabellingConfig<T>; overload;
    function HideZeroValues(Value: Boolean): IModelLabellingConfig<T>; overload;
    function Padding: Integer; overload;
    function Padding(Value: Integer): IModelLabellingConfig<T>; overload;
    function PaddingX: Integer; overload;
    function PaddingX(Value: Integer): IModelLabellingConfig<T>; overload;
    function Result: string;
    function RGBColor: string; overload;
    function RGBColor(Value: string ): IModelLabellingConfig<T>; overload;
  end;

  IModelHTMLChartsAxes = interface(IInterface)
    ['{2E97CD69-FDAC-4A01-ADA6-0EA9F1FFFF7C}']
    function &End: IModelHTMLScales;
    function Result: string;
    function XAxe: IModelHTMLChartsAxesParam;
    function YAxe: IModelHTMLChartsAxesParam;
  end;

  IModelHTMLChartsAxesParam = interface(IInterface)
    ['{E4C5DE93-B372-4D75-ADD2-8A3D1F30223E}']
    function &End: IModelHTMLChartsAxes;
    function GridLines: IModelHTMLChartsAxesGridLines<IModelHTMLChartsAxesParam>;
    function OffSet: Boolean; overload;
    function OffSet(Value: Boolean): IModelHTMLChartsAxesParam; overload;
    function Position: string; overload;
    function Position(Value: string): IModelHTMLChartsAxesParam; overload;
    function RealTime: IModelHTMLChartsAxesParamRealTime;
    function Result: string;
    function ScaleLabel: IModelHTMLChatsAxesScaleLabel<IModelHTMLChartsAxesParam>;
    function Stacked: Boolean; overload;
    function Stacked(Value: Boolean ): IModelHTMLChartsAxesParam; overload;
    function Ticks: IModelHTMLChartsAxesTicks<IModelHTMLChartsAxesParam>;
    function _Type: string; overload;
    function _Type(Value: string): IModelHTMLChartsAxesParam; overload;
  end;

  IModelHTMLChartsAxesParamRealTime = interface(IInterface)
    ['{448ECDC3-69C1-44F3-B5C5-6C2336F60321}']
    function &End: IModelHTMLChartsAxesParam;
    function Delay(Value: Integer): IModelHTMLChartsAxesParamRealTime;
    function Duration(Value: Integer): IModelHTMLChartsAxesParamRealTime;
    function Refresh(Value: Integer): IModelHTMLChartsAxesParamRealTime;
    function Result: string;
    function Ttl(Value: Integer): IModelHTMLChartsAxesParamRealTime;
  end;

  IModelHTMLChatsAxesScaleLabel<T> = interface(IInterface)
    ['{FC645855-267C-4876-8BE2-EE540732C6A5}']
    function &End: T;
    function Display: Boolean; overload;
    function Display(Value: Boolean): IModelHTMLChatsAxesScaleLabel<T>; overload;
    function FontColorHEX: string; overload;
    function FontColorHEX(Value: string ): IModelHTMLChatsAxesScaleLabel<T>; overload;
    function FontFamily: string; overload;
    function FontFamily(Value: string ): IModelHTMLChatsAxesScaleLabel<T>; overload;
    function FontSize: Integer; overload;
    function FontSize(Value: Integer): IModelHTMLChatsAxesScaleLabel<T>; overload;
    function FontStyle: string; overload;
    function FontStyle(Value: string): IModelHTMLChatsAxesScaleLabel<T>; overload;
    function LabelString: string; overload;
    function LabelString(Value: string ): IModelHTMLChatsAxesScaleLabel<T>; overload;
    function Padding: Integer; overload;
    function Padding(Value: Integer ): IModelHTMLChatsAxesScaleLabel<T>; overload;
    function Result: string;
  end;

  IModelHTMLChartsAxesGridLines<T> = interface(IInterface)
    ['{F9043117-4398-478D-8EA2-8E5E065FB142}']
    function &End: T;
    function Circular: Boolean; overload;
    function Circular(Value: Boolean): IModelHTMLChartsAxesGridLines<T>; overload;
    function ColorRGBA: string; overload;
    function ColorRGBA(Value: string ): IModelHTMLChartsAxesGridLines<T>; overload;
    function Display: Boolean; overload;
    function Display(Value: Boolean): IModelHTMLChartsAxesGridLines<T>; overload;
    function DrawBorder: Boolean; overload;
    function DrawBorder(Value: Boolean ): IModelHTMLChartsAxesGridLines<T>; overload;
    function DrawOnChartArea: Boolean; overload;
    function DrawOnChartArea(Value: Boolean): IModelHTMLChartsAxesGridLines<T>; overload;
    function DrawTicks: Boolean; overload;
    function DrawTicks(Value: Boolean): IModelHTMLChartsAxesGridLines<T>; overload;
    function Result: string;
    function TickMarkLength: Integer; overload;
    function TickMarkLength(Value: Integer ): IModelHTMLChartsAxesGridLines<T>; overload;
    function ZeroLineColorRGBA: string; overload;
    function ZeroLineColorRGBA(Value: string ): IModelHTMLChartsAxesGridLines<T>; overload;
    function ZeroLineWidth: Integer; overload;
    function ZeroLineWidth(Value: Integer ): IModelHTMLChartsAxesGridLines<T>; overload;
  end;

  IModelHTMLChartsAxesTicks<T> = interface(IInterface)
    ['{C56445FE-00C6-47E1-8B38-F0FE57419A71}']
    function &End: T;
    function AutoSkip: Boolean; overload;
    function AutoSkip(Value: Boolean): IModelHTMLChartsAxesTicks<T>; overload;
    function AutoSkipPadding: Integer; overload;
    function AutoSkipPadding(Value: Integer): IModelHTMLChartsAxesTicks<T>; overload;
    function BeginAtZero(Value: Boolean): IModelHTMLChartsAxesTicks<T>;
    function FontColor: string; overload;
    function FontColor(Value: string): IModelHTMLChartsAxesTicks<T>; overload;
    function FontFamily: string; overload;
    function FontFamily(Value: string): IModelHTMLChartsAxesTicks<T>; overload;
    function FontSize: integer; overload;
    function FontSize(Value: integer): IModelHTMLChartsAxesTicks<T>; overload;
    function Format: string; overload;
    function Format(Value: string): IModelHTMLChartsAxesTicks<T>; overload;
    function LabelOffset: Integer; overload;
    function LabelOffset(Value: Integer): IModelHTMLChartsAxesTicks<T>; overload;
    function Max(Value: string): IModelHTMLChartsAxesTicks<T>;
    function MaxRotation: Integer; overload;
    function MaxRotation(Value: Integer): IModelHTMLChartsAxesTicks<T>; overload;
    function MaxTicksLimit(Value: string): IModelHTMLChartsAxesTicks<T>;
    function Min(Value: string): IModelHTMLChartsAxesTicks<T>;
    function MinRotation: Integer; overload;
    function MinRotation(Value: Integer): IModelHTMLChartsAxesTicks<T>; overload;
    function Mirror: Boolean; overload;
    function Mirror(Value: Boolean): IModelHTMLChartsAxesTicks<T>; overload;
    function Padding: Integer; overload;
    function Padding(Value: Integer): IModelHTMLChartsAxesTicks<T>; overload;
    function Result: string;
    function StepSize(Value: string): IModelHTMLChartsAxesTicks<T>;
    function SuggestedMax(Value: string): IModelHTMLChartsAxesTicks<T>;
    function SuggestedMin(Value: string): IModelHTMLChartsAxesTicks<T>;
  end;

  IModelHTMLDataSet = interface(IInterface)
    ['{761961EF-0C2B-4B88-AC8F-B4806D530D07}']
    function &End: IModelHTMLChartsConfig;
    function BackgroundColor(Value: string): IModelHTMLDataSet;
    function BackgroundOpacity(Value: Integer): IModelHTMLDataSet;
    function BorderColor(Value: string): IModelHTMLDataSet;
    function BorderDash(Lenght: Integer; Space: Integer): IModelHTMLDataSet;
    function BorderOpacity(Value: Integer): IModelHTMLDataSet;
    function BorderWidth(Value: Integer): IModelHTMLDataSet;
    function Data(Value: string): IModelHTMLDataSet;
    function DataSet(Value: TDataSet): IModelHTMLDataSet;
    function Fill(Value: Boolean): IModelHTMLDataSet;
    function Hidden(Value: Boolean): IModelHTMLDataSet;
    function HideZeroValuesControl(Value: Boolean): IModelHTMLDataSet;
    function LabelName(Value: string): IModelHTMLDataSet;
    function LineTension(Value: Integer): IModelHTMLDataSet;
    function RealTimeDataSet(Value: TDataSet): IModelHTMLDataSet;
    function RealTimeInitialValue: string;
    function ResultLabels: string;
    function ResultScript: string;
    function RGBName(Value: string): IModelHTMLDataSet;
    function TextLabel(Value: string): IModelHTMLDataSet;
    function Types(Value: string): IModelHTMLDataSet;
    function ValueName(Value: string): IModelHTMLDataSet;
  end;

  IModelHTMLFactory = interface(IInterface)
    ['{8CF35864-C906-4B8B-AC69-CD2F2001D906}']
    function Charts(Parent: IModelHTML): IModelHTMLCharts;
    function HTML: IModelHTML;
    function Rows(Parent: IModelHTML): IModelHTMLRows;
    function RowsTitle(Parent: IModelHTMLRows): IModelHTMLRowsTitle;
    {$IFDEF FULL}
    function Cards(Parent: IModelHTML): IModelCards;
    function ChartEasyPie(Parent: IModelHTML): IModelChartEasyPie;
    function Image(Parent: IModelHTML): IModelImage;
    function Table(Parent: IModelHTML): IModelTable;
    {$ENDIF}
    end;

  IModelColors<T> = interface(IInterface)
    ['{8A6FA48B-BCB6-468B-A6EC-BC582B898E16}']
    function &End: T;
    function Danger: IModelColors<T>;
    function Dark: IModelColors<T>;
    function Info: IModelColors<T>;
    function Light: IModelColors<T>;
    function Primary: IModelColors<T>;
    function Result: string;
    function Secondary: IModelColors<T>;
    function Success: IModelColors<T>;
    function Warning: IModelColors<T>;
  end;

  IModelJumbotron = interface(IInterface)
    ['{90EB606E-886D-4333-ADD4-3A723A4F989B}']
    function Title(Value: string): IModelJumbotron;
    function Description(Value: string): IModelJumbotron;
    function &End: IModelHTML;
  end;

  IModelAlerts = interface(IInterface)
    ['{F6967759-446A-42EF-9459-DE04C83BB65B}']
    function Title(Value: string): IModelAlerts;
    function AlertsClass: IModelAlertsClass;
    function &End: IModelHTML;
  end;

  IModelAlertsClass = interface(IInterface)
    ['{B877835D-FABB-4E0E-A44D-72DEC61B098B}']
    function &End: IModelAlerts;
    function Danger: IModelAlertsClass;
    function Dark: IModelAlertsClass;
    function Info: IModelAlertsClass;
    function Light: IModelAlertsClass;
    function Primary: IModelAlertsClass;
    function ResultClass: string;
    function Secondary: IModelAlertsClass;
    function Success: IModelAlertsClass;
    function Warning: IModelAlertsClass;
  end;

  IModelGenericDataSet<T> = interface(IInterface)
    ['{761961EF-0C2B-4B88-AC8F-B4806D530D07}']
    function &End: T;
    function CallbackLink: TDictionary<string, string>; overload;
    function CallbackLink(Field: string; MethodName: string): IModelGenericDataSet<T>; overload;
    function DataSet: TDataSet; overload;
    function DataSet(Value: TDataSet): IModelGenericDataSet<T>; overload;
    function DataSetJstringify: string;
    function LabelName: string; overload;
    function LabelName(Value: string): IModelGenericDataSet<T>; overload;
    function RGBName: string; overload;
    function RGBName(Value: string): IModelGenericDataSet<T>; overload;
    function ValueName: string; overload;
    function ValueName(Value: string): IModelGenericDataSet<T>; overload;
//    function textLabel(Value: string): IModelGenericDataSet<T>;
//    function BackgroundColor(Value: string): IModelGenericDataSet<T>;
//    function BorderColor(Value: string): IModelGenericDataSet<T>;
//    function BorderWidth(Value: Integer): IModelGenericDataSet<T>;
//    function Data(Value: string): IModelGenericDataSet<T>;
//    function Fill(Value: Boolean): IModelGenericDataSet<T>;
//    function ResultLabels: string;
//    function Types(Value: string): IModelGenericDataSet<T>;
   end;

  IModelListGroup = interface(IInterface)
    ['{4E7BC346-00A5-4B5C-92A2-348107CFEADA}']
    function &End: IModelHTML;
    function DataSet: IModelGenericDataSet<IModelListGroup>;
    function ListGroupType: IModelListGroupClass;
  end;

  IModelListGroupClass = interface(IInterface)
    ['{9DE42B06-A698-437D-B25D-2A6CB8A9B409}']
    function &End: IModelListGroup;
    function Action: IModelListGroupClass;
    function Basic: IModelListGroupClass;
    function ClassType: string;
    function ElementIn: string;
    function ElementOut: string;
    function Flush: IModelListGroupClass;
    function Horizontal: IModelListGroupClass;
    function TagIn: string;
  end;

  IModelGenericList<T> = interface(IInterface)
    ['{BCF34A04-11DC-437B-BACA-97FBB4F0C7AF}']
    function &End: T;
    function Add(Value: string): IModelGenericList<T>;
    function List: TList<string>;
  end;

  IModelPivotTableConfig = interface(IInterface)
    ['{B5F32DE7-8BEA-40B3-92B6-5AD7EA2BB3FE}']
    function &End: IModelPivotTable;
    function Cols: IModelGenericList<IModelPivotTableConfig>;
    function ConfigBackgroundColor(Value: string): IModelPivotTableConfig;
    function ConfigBodyStyle: IModelGenericStyle<IModelPivotTableConfig>;
    function ConfigHeadStyle: IModelGenericStyle<IModelPivotTableConfig>;
    function DataSet: IModelGenericDataSet<IModelPivotTableConfig>;
    function PivotOptions: string; overload;
    function PivotOptions(Value: string): IModelPivotTableConfig; overload;
    function PivotType: IModelPivotTableClass;
    function ResultData: string;
    function ResultStyle: string;
    function Rows: IModelGenericList<IModelPivotTableConfig>;
    function ShowPivotUI: string; overload;
    function ShowPivotUI(Value: Boolean): IModelPivotTableConfig; overload;
  end;

  IModelJSCommand = interface(IInterface)
    ['{60141CC4-A117-4500-B28E-C09B2339E6B8}']
    function Callback: TProc<string>; overload;
    function Callback(Value: TProc<string>): IModelJSCommand; overload;
    function Command(Value: string):IModelJSCommand;
    function Paramters: IModelGenericList<IModelJSCommand>; overload;
    function ResultCommand: string; overload;
    function TagAttribute: string; overload;
    function TagAttribute(Value: string): IModelJSCommand; overload;
    function TagID: string; overload;
    function TagID(Value: string): IModelJSCommand; overload;
    function TagName: string; overload;
    function TagName(Value: string):IModelJSCommand; overload;
    function TestBeforeExecute(Value: Boolean): IModelJSCommand;
  end;

  IModelPivotTable = interface(IInterface)
    ['{D9C25BD4-9C5F-4F8C-AFA7-D251193609A9}']
    function &End: IModelHTML;
    function Attributes: IModelPivotTableConfig;
    function HideUI: IModelPivotTable;
    function LoadConfig(Value: string): IModelPivotTable;
    function SaveConfig: string; overload;
    function SaveConfig(Value: TProc<string>): IModelPivotTable; overload;
    function ShowUI: IModelPivotTable;
  end;

  IModelPivotTableClass = interface(IInterface)
    ['{B5695B31-A3C9-45A4-86D8-3542736EC848}']
    function &End: IModelPivotTableConfig;
    function BarrasHorizontais: IModelPivotTableClass;
    function BarrasHorizontaisEmpilhadas: IModelPivotTableClass;
    function GraficoDeArea: IModelPivotTableClass;
    function GraficoDeBarras: IModelPivotTableClass;
    function GraficoDeBarrasEmpilhadas: IModelPivotTableClass;
    function GraficoDeLinhas: IModelPivotTableClass;
    function GraficoDePizzaMultiplo: IModelPivotTableClass;
    function MapaDeCalor: IModelPivotTableClass;
    function MapaDeCalorPorColunas: IModelPivotTableClass;
    function MapaDeCalorPorLinhas: IModelPivotTableClass;
    function ResultClass: string;
    function Tabela: IModelPivotTableClass;
    function TabelaComBarras: IModelPivotTableClass;
  end;

  IModelGenericStyle<T> = interface(IInterface)
  ['{C98A4A18-4BA5-45E1-B442-0D728E7138E3}']
    function &End: T;
    function AlignItems: string; overload;
    function AlignItems(Value: string): IModelGenericStyle<T>; overload;
    function Background: string; overload;
    function Background(Value: string): IModelGenericStyle<T>; overload;
    function BackgroundColor: string; overload;
    function BackgroundColor(Value: string): IModelGenericStyle<T>; overload;
    function Color: string; overload;
    function Color(Value: string): IModelGenericStyle<T>; overload;
    function Display: string; overload;
    function Display(Value: string): IModelGenericStyle<T>; overload;
    function FontFamily: string; overload;
    function FontFamily(Value: string): IModelGenericStyle<T>; overload;
    function FontSize: string; overload;
    function FontSize(Value: Integer): IModelGenericStyle<T>; overload;
    function FontSize(Value: string): IModelGenericStyle<T>; overload;
    function FontWeight: string; overload;
    function FontWeight(Value: string): IModelGenericStyle<T>; overload;
    function Height: string; overload;
    function Height(Value: Integer): IModelGenericStyle<T>; overload;
    function Height(Value: string): IModelGenericStyle<T>; overload;
    function JustifyContent: string; overload;
    function JustifyContent(Value: string): IModelGenericStyle<T>; overload;
    function LineHeight: string; overload;
    function LineHeight(Value: Integer): IModelGenericStyle<T>; overload;
    function LineHeight(Value: string): IModelGenericStyle<T>; overload;
    function MarginLeft: string; overload;
    function MarginLeft(Value: Integer): IModelGenericStyle<T>; overload;
    function MarginLeft(Value: string): IModelGenericStyle<T>; overload;
    function Opacity: string; overload;
    function Opacity(Value: string): IModelGenericStyle<T>; overload;
    function Padding: string; overload;
    function Padding(Value: Integer): IModelGenericStyle<T>; overload;
    function Padding(Value: string): IModelGenericStyle<T>; overload;
    function Position: string; overload;
    function Position(Value: string): IModelGenericStyle<T>; overload;
    function ResultStyle: string;
    function Right: string; overload;
    function Right(Value: Integer): IModelGenericStyle<T>; overload;
    function Right(Value: string): IModelGenericStyle<T>; overload;
    function TextAlign: string; overload;
    function TextAlign(Value: string): IModelGenericStyle<T>; overload;
    function Top: string; overload;
    function Top(Value: Integer): IModelGenericStyle<T>; overload;
    function Top(Value: string): IModelGenericStyle<T>; overload;
    function VerticalAlign: string; overload;
    function VerticalAlign(Value: string): IModelGenericStyle<T>; overload;
    function Width: string; overload;
    function Width(Value: Integer): IModelGenericStyle<T>; overload;
    function Width(Value: string): IModelGenericStyle<T>; overload;
  end;

  IModelGenericCoordinates<T> = interface(IInterface)
    ['{AE9131DA-6C0D-4A8F-876F-9D86EA6794E7}']
    function &End: T;
    function Latitude: string; overload;
    function Latitude(Value: string): IModelGenericCoordinates<T>; overload;
    function Longitude: string; overload;
    function Longitude(Value: string): IModelGenericCoordinates<T>; overload;
  end;

  {$IFDEF FULL}

  IModelHTMLRowsP = interface(IInterface)
    ['{F26E4162-73CC-40E9-8E35-9499B6D61673}']
    function &End: IModelHTMLRows;
    function Add(Value: string): iModelHTMLRowsP;
    function ID(Value: string): IModelHTMLRowsP;
    function _Class(Value: string): IModelHTMLRowsP;
  end;

  IModelTable = interface(IInterface)
    ['{D0151987-64C8-40E2-A83C-18AF9648F8AE}']
    function &End: IModelHTML;
    function DataSet: IModelTableDataSet;
    function Datatable(Value: Boolean): IModelTable;
    function TableClass: IModelTableClass;
    function TableData: IModelTableData;
    function TableFeatures: IModelTableFeatures;
    function TableOptions: IModelTableOption;
  end;

  IModelTableClass = interface(IInterface)
    ['{AC891435-E424-4C9D-BC69-4B05A705B96E}']
    function &EndTableClass: IModelTable;
    function TableBordered: IModelTableClass;
    function TableDark: IModelTableClass;
    function TableHover: IModelTableClass;
    function TableResponsive: IModelTableClass;
    function TableSm: IModelTableClass;
    function TableStriped: IModelTableClass;
  end;

  IModelTableDataSet = interface(IInterface)
    ['{061B2938-6100-42AF-8EE4-D5895E5A38B8}']
    function &End: IModelTable;
    function Action: IModelTableAction;
    function ActionDelete: IModelTableAction;
    function ActionEdit: IModelTableAction;
    function CallbackLink(Field: string; MethodName: string): IModelTableDataSet; overload;
    function CallbackLink(Field: string; MethodName: string; AValue: string): IModelTableDataSet; overload;
    function DataSet(Value: TDataSet): IModelTableDataSet;
    function ResultScript: string;
    function ResultStyle: string;
  end;

  IModelTableActionImage = Interface(IInterface)
    ['{60D2D1F0-B0F7-404D-8681-B9EBE36FFEB2}']
    function &End: IModelTableAction;
    function Height: string; overload;
    function Height(Value: Integer): IModelTableActionImage; overload;
    function Image: string; overload;
    function Image(Value: string): IModelTableActionImage; overload;
    function Image(Value: TCustomMemoryStream): IModelTableActionImage; overload;
    function StyleClass: string;
    function Tooltip: string overload;
    function Tooltip(Value: string): IModelTableActionImage; overload;
    function Width: string; overload;
    function Width(Value: Integer): IModelTableActionImage; overload;
  end;

  IModelTableAction = interface(IInterface)
    ['{D9476DEA-F074-4A7B-9472-B7A9872F7023}']
    function &End: IModelTableDataSet;
    function ActionHeader: string; overload;
    function ActionHeader(Value: string): IModelTableAction; overload;
    function CallbackLink(Field: string; MethodName: string): IModelTableAction;
    function FieldName: string;
    function Image: IModelTableActionImage;
    function ImageTag: string;
    function MethodName: string;
    function ResultStyle: string;
  end;

  IModelTableOption = interface(IInterface)
    ['{2DFF85D5-1116-4160-AAE4-8A5172B8EFD8}']
    function &End: IModelTable;
    //1 Atraso no carregamento dos dados do servidor até o segundo sorteio
    function DeferLoading(Value: Integer): IModelTableOption;
    //1 Ponto inicial de paginação inicial
    function DisplayStart(Value: Integer): IModelTableOption;
    //1 Altere as opções na selectlista de comprimento da página .
    function LengthMenu(Value: string): IModelTableOption;
    //1 DOM Id
    function Name: string; overload;
    //1 DOM Id
    function Name(Value: string): IModelTableOption; overload;
    //1 Destrua qualquer tabela existente que corresponda ao seletor e substitua pelas novas opções.
    function OpDestroy(Value: Boolean): IModelTableOption;
    //1 Ordem inicial(classificação)a ser aplicada à tabela
    function Order(Value: string): IModelTableOption;
    //1 Controlar em qual célula o manipulador de eventos do pedido será aplicado em uma coluna
    function OrderCellsTop(Value: Boolean): IModelTableOption;
    //1 Destaque as colunas que estão sendo ordenadas no corpo da tabela
    function OrderClasses(Value: Boolean): IModelTableOption;
    //1 Ordenação para sempre ser aplicada à tabela
    function OrderFixed(Value: string): IModelTableOption;
    //1 Controle de capacidade de ordenação de várias colunas.
    function OrderMulti(Value: Boolean): IModelTableOption;
    //1 Alterar o comprimento da página inicial(número de linhas por página)
    function PageLength(Value: Integer): IModelTableOption;
    //1 Opções de exibição do botão de paginação
    function PagingType(Value: string): IModelTableOption;
    //1 Habilitar e configurar a extensão responsiva para DataTables
    function Responsive(Value: Boolean): IModelTableOption;
    function Result: string;
    //1 Recuperar uma instância existente do DataTables
    function Retrieve(Value: Boolean): IModelTableOption;
    //1 Permita que a tabela reduza em altura quando um número limitado de linhas for mostrado.
    function ScrollCollapse(Value: Boolean): IModelTableOption;
  end;

  IModelTableFeatures = interface(IInterface)
    ['{3A297833-19EA-46CB-A10D-5AF1905791FC}']
    function &End: IModelTable;
    //1 Controle de recursos Tratamento de largura de colunas inteligentes do DataTables
    function AutoWidth(Value: Boolean): IModelTableFeatures;
    //1 Controle diferenciado renderização adiada para velocidade adicional de inicialização.
    function DeferRender(Value: Boolean): IModelTableFeatures;
    //1 Campo de exibição de informações da tabela de controle de recursos
    function Info(Value: Boolean): IModelTableFeatures;
    //1 O recurso controla a capacidade do usuário final de alterar o comprimento da exibição de paginação da tabela.
    function LengthChange(Value: Boolean): IModelTableFeatures;
    //1 Recursos de ordenação de controle de recursos(classificação)no DataTables.
    function Ordering(Value: Boolean): IModelTableFeatures;
    //1 Ativar ou desativar a paginação da tabela
    function Paging(Value: Boolean): IModelTableFeatures;
    //1 O recurso controla o indicador de processamento
    function Processing(Value: Boolean): IModelTableFeatures;
    function Result: string;
    //1 rolagem horizontal
    function ScrollX(Value: Boolean): IModelTableFeatures;
    //1 rolagem vertical
    function ScrollY(Value: Integer): IModelTableFeatures;
    //1 Recursos de pesquisa(filtragem)de controle de recursos
    function Searching(Value: Boolean): IModelTableFeatures;
    //1 Controle de recurso Modo de processamento no lado do servidor do DataTables
    function ServerSide(Value: Boolean): IModelTableFeatures;
    //1 Economia de estado - restaura o estado da tabela no recarregamento da página.
    function StateSave(Value: Boolean): IModelTableFeatures;
  end;

  IModelTableData = interface(IInterface)
    ['{6241E52E-02AF-4395-B162-6FF6B5821A6C}']
    function &End: IModelTable;
    function Columns(Value: Array of string): IModelTableData;
    function DataSrc(Value: string): IModelTableData;
    function JType(Value: string): IModelTableData;
    function Result: string;
    function ResultTable: string;
    function Server(Value: string): IModelTableData;
  end;

  IModelTableCallback = interface(IInterface)
    ['{CB685C9B-1FC8-4C23-BECC-BFCBBAA99C37}']
    function &End: IModelTable;
    function FormatNumber(aCampo, aFormat: string): IModelTableCallback;
    function Result: string;
  end;

  IModelHTMLRowsDiv = interface(IInterface)
    ['{BD95F279-9614-47FD-B0AD-56B93279D4F1}']
    function &End: IModelHTMLRows;
    function Add(Value: string): IModelHTMLRowsDiv;
    function ColSpan(Value: Integer): IModelHTMLRowsDiv;
    function ID(Value: string): IModelHTMLRowsDiv;
  end;

  IModelCards = interface(IInterface)
    ['{5BA3AF40-D673-44BA-BF79-5F35E0F00BFB}']
    function &End: IModelHTML;
    function Colors: IModelColors<IModelCards>;
    function ColSpan: Integer; overload;
    function ColSpan(Value: Integer): IModelCards; overload;
    function DataSet: IModelCardsDataSet;
    function FieldBody: string; overload;
    function FieldBody(Value: string): IModelCards; overload;
    function FieldHeader: string; overload;
    function FieldHeader(Value: string): IModelCards; overload;
    function FieldTitle: string; overload;
    function FieldTitle(Value: string): IModelCards; overload;
  end;

  IModelCardsDataSet = interface(IInterface)
    ['{E38197FC-8395-45BC-A0DE-D7283DD7E594}']
    function &End: IModelCards;
    function DataSet(Value: TDataSet): IModelCardsDataSet;
    function ResultScript: string;
  end;

  ICallbackJS = interface(IInterface)
    ['{B3DD9B36-2024-4763-96A3-DEC0F10F454A}']
    function &End: IModelHTML;
    function ClassProvider(Value: TObject): ICallbackJS;
  end;

  IChartsCallback = interface(IInterface)
  ['{4040F646-6D4F-477A-B5CE-98FDD025DAEB}']
    function IDChart(Value: string): IChartsCallback;
    function Result(Value: string): string;
  end;

  IModelImage = interface(IInterface)
    ['{477D75E4-1BEE-4E4B-B15F-80B92DA186EA}']
    function &End: IModelHTML;
    function DataSet: IModelImageDataSet;
    function ImageClass: IModelImageClass;
  end;

  IModelImageDataSet = interface(IInterface)
    ['{061B2938-6100-42AF-8EE4-D5895E5A38B8}']
    function &End: IModelImage;
    function DataSet(Value: TDataSet): IModelImageDataSet;
    function Field(Value: string): IModelImageDataSet;
    function ResultScript: string;
  end;

  IModelImageClass = interface(IInterface)
    ['{9631B98F-CDE7-41A1-8138-E8E05AD72B65}']
    function &End: IModelImage;
    function DBlock: IModelImageClass;
    function FloatLeft: IModelImageClass;
    function FloatRight: IModelImageClass;
    function ImgFluid: IModelImageClass;
    function ImgThumbnail: IModelImageClass;
    function MxAuto: IModelImageClass;
    function ResultClass: string;
    function Rounded: IModelImageClass;
  end;

  IModelButton = interface(IInterface)
    ['{BF6585F7-1823-4604-8FE4-1305EF38833B}']
    function &End: IModelHTML;
    function ButtonClass: IModelButtonClass;
    function CallbackLink(Param: string; Method: string): IModelButton;
    function Title(Value: string): IModelButton;
  end;

  IModelButtonClass = interface(IInterface)
    ['{E03B3D3A-2D23-4AC0-86E3-5C4F18B9A9CE}']
    function &End: IModelButton;
    function Active: IModelButtonClass;
    function Block: IModelButtonClass;
    function Danger: IModelButtonClass;
    function Dark: IModelButtonClass;
    function Disabled: IModelButtonClass;
    function Info: IModelButtonClass;
    function Large: IModelButtonClass;
    function Light: IModelButtonClass;
    function Outline: IModelButtonClass;
    function Primary: IModelButtonClass;
    function ResultClass: string;
    function Secondary: IModelButtonClass;
    function Small: IModelButtonClass;
    function Success: IModelButtonClass;
    function Warning: IModelButtonClass;
  end;

  IModelCSS = interface(IInterface)
    ['{DBC52618-B95B-4871-9BC5-632B7737F2FD}']
    function BackgroundColor(Value: string ):  IModelCSS;
    function BorderColor(Value: string ): IModelCSS;
    function CDN(Value: Boolean): IModelCSS;
    function FontColor(Value: string ): IModelCSS;
    function PackCSS: string;
  end;

  IModelJS = interface(IInterface)
    ['{CB37AC61-A8D6-4CEB-BFD1-FDC26CDEB2AA}']
    function CDN(Value: Boolean): IModelJS;
    function Credenciais(Value: IModelCredenciais): IModelJS;
    function PackJS: string;
  end;

  IModelChartEasyPie = interface(IInterface)
    ['{236E2A17-A50A-4E23-A414-19A1E8A7B34E}']
    function &End: IModelHTML;
    function Animate(Value: string): IModelChartEasyPie;
    function BarColor(Value: string): IModelChartEasyPie;
    function DataPercent(Value: string): IModelChartEasyPie;
    function LineCap(Value: string): IModelChartEasyPie;
    function LinheWidth(Value: string): IModelChartEasyPie;
    function OnStart(Value: string): IModelChartEasyPie;
    function OnStep(Value: string): IModelChartEasyPie;
    function OnStop(Value: string): IModelChartEasyPie;
    function ScaleColor(Value: string): IModelChartEasyPie;
    function Size(Value: string): IModelChartEasyPie;
    function TrackColor(Value: string): IModelChartEasyPie;
  end;

  {$ENDIF}

implementation

end.
