unit Interfaces;

{$I TBGWebCharts.inc}

interface

uses
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
   Classes, Charts.Types;

type
  iModelHTMLChartsBar = interface;
  iModelHTMLCharts = interface;
  iModelHTMLChartsConfig = interface;
  IModelRowsTitleConfig = interface;
  IModelHTMLRows = interface;
  iModelHTMLRowsTitle = interface;
  IModelHTMLRowsTag = interface;
  iModelHTMLChartsDoughnut = interface;
  iModelHTMLChartsLines = interface;
  iModelHTMLDataSet = interface;
  iModelHTMLChartsLineStacked = interface;
  iModelHTMLChartsPie = interface;
  iModelLabellingConfig<T> = interface;
  iModelHTMLChartsAxes = interface;
  iModelHTMLChartsAxesTicks<T> = interface;
  iModelHTMLChartsAxesParam = interface;
  iModelHTMLChartsAxesGridLines<T> = interface;
  iModelHTMLChatsAxesScaleLabel<T> = interface;
  iModelHTMLLegendLabels<T> = interface;
  iModelHTMLLegend = interface;
  iModelHTMLTitle<T> = interface;
  iModelHTMLScales = interface;
  iModelHTMLTooltip<T> = interface;
  iModelHTMLOptions = interface;
  iModelHTMLChartsGeneric = interface;
  {$IFDEF FULL}
  iModelTable = interface;
  iModelTableDataSet = interface;
  iModelTableOption = interface;
  iModelTableData = interface;
  iModelTableFeatures = interface;
  iModelTableClass = interface;
  IModelHTMLRowsDiv = interface;
  iModelCardsDataSet = interface;
  iModelCards = interface;
  iModelChartEasyPie = interface;
  iModelButtonClass = interface;
  iModelButton = interface;
  {$IFDEF HAS_FMX}
    {$ELSE}
    {$IF RTLVERSION > 22 }
    iCallbackJS = interface;
    {$IFEND}
    {$ENDIF}
  iModelImageDataSet = interface;
  iModelImage = interface;
  iModelImageClass = interface;
  IModelHTMLRowsP = interface;
  //iCacheControl = interface;
  {$ENDIF}

  iModelHTML = interface
    ['{6D5210CC-D750-4643-8685-48037F21E6AA}']
    function GenerateHead : iModelHTML; overload;
    function GenerateHead(Value : TList<String>) : iModelHTML; overload;
    function GenerateFooter : iModelHTML;
    function Jumpline : iModelHTML;
    function Charts : iModelHTMLCharts;
    function Rows : IModelHTMLRows;
    function HTML(Value : String) : iModelHTML; overload;
    function HTML : String; overload;
    function ClearHTML : iModelHTML;
    function WebBrowser(Value : TWebBrowser) : iModelHTML;
    function Generated : iModelHTML;
    function Container(Value : Boolean) : iModelHTML;
    function FolderDefaultRWC(Value : String) : iModelHTML;
    function BackgroundColor( Value : String) : iModelHTML;
    function FontColor ( Value : String) : iModelHTML;
    function ContainerClass(Value : TTypeContainer) : iModelHTML;
    function CDN(Value : Boolean) : iModelHTML;
    {$IFDEF FULL}
    function Table : iModelTable;
    function Cards : iModelCards;
    function ChartEasyPie : iModelChartEasyPie;
    {$IFDEF HAS_FMX}
    {$ELSE}
    {$IF RTLVERSION > 22 }
    function CallbackJS : iCallbackJS;
    function Buttons : iModelButton;
    {$IFEND}
    {$ENDIF}
    function Image : iModelImage;
    //function CacheControl : iCacheControl;
    {$ENDIF}
  end;

  iLabelLing = interface
    function Numeral(Value : String) : iLabelLing;
    function Result : String;
  end;

  iNumeral = interface
    function Result(Value : String) : String;
  end;

  IModelHTMLRows = interface
    ['{684C6EA3-4C2D-4AA9-9A94-BF0A07B14A8B}']
    function HTML(Value : String) : IModelHTMLRows; overload;
    function HTML : String; overload;
    function Title : iModelHTMLRowsTitle;
    function Tag : iModelHTMLRowsTag;
    {$IFDEF FULL}
    function _Div : IModelHTMLRowsDiv;
    function _P : IModelHTMLRowsP;
    {$ENDIF}
    function &End : iModelHTML;
  end;

  IModelHTMLRowsTag = interface
    ['{15075847-E7A6-4F18-878D-A7DBCECABE94}']
    function Add(Value : String) : IModelHTMLRowsTag;
    function &End : IModelHTMLRows;
  end;

  iModelHTMLRowsTitle = interface
    ['{F2D34927-8232-4A18-944A-DB0ADAD1C903}']
    function HTML(Value : String) : iModelHTMLRowsTitle; overload;
    function HTML : String; overload;
    function Configuracoes : IModelRowsTitleConfig;
    function &End : IModelHTMLRows;
  end;

  IModelRowsTitleConfig = interface
    ['{87031018-5C12-42DF-895F-2602B87FE468}']
    function H1(Value : String) : IModelRowsTitleConfig; overload;
    function H1 : String; overload;
    function H2(Value : String) : IModelRowsTitleConfig; overload;
    function H2 : String; overload;
    function H3(Value : String) : IModelRowsTitleConfig; overload;
    function H3 : String; overload;
    function H4(Value : String) : IModelRowsTitleConfig; overload;
    function H4 : String; overload;
    function H5(Value : String) : IModelRowsTitleConfig; overload;
    function H5 : String; overload;
    function &End : iModelHTMLRowsTitle;
  end;

  iModelHTMLCharts = interface
    ['{4CC23536-78BD-40F7-B4A8-D5625E849065}']
    function _ChartType(Value : TTypeChart) : iModelHTMLChartsGeneric; overload;
    function _ChartType : TTypeChart; overload;
    function HTML(Value : String) : iModelHTMLCharts; overload;
    function HTML : String; overload;
    function &End : iModelHTML;
  end;

  iModelHTMLChartsGeneric = interface
    ['{83AA6A13-6102-4352-9503-FF9C4AA2C4C7}']
    function HTML(Value : String) : iModelHTMLChartsGeneric; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsDoughnut = interface
    ['{709FF228-7F8A-4E2B-8AB9-EFAEC9AEE1B4}']
    function SemiCircule ( aValue : Boolean ) : iModelHTMLChartsDoughnut; overload;
    function HTML(Value : String) : iModelHTMLChartsDoughnut; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsBar = interface
    ['{25AE0278-2105-4223-86A9-41F289F75EAE}']
    function HTML(Value : String) : iModelHTMLChartsBar; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsLines = interface
    ['{10DCD4CF-984F-4952-919A-5259A13A9D8D}']
    function HTML(Value : String) : iModelHTMLChartsLines; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsLineStacked = interface
    ['{6A3F3157-8FB2-4D72-A33A-27A66BED2661}']
    function HTML(Value : String) : iModelHTMLChartsLineStacked; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsPie = interface
    ['{470E91C0-58DF-440E-AF3A-445746F0CFE0}']
    function HTML(Value : String) : iModelHTMLChartsPie; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsConfig = interface
    ['{B140654A-10FE-48A2-93B8-3D90743E3F1E}']
    function Name(Value : String) : iModelHTMLChartsConfig; overload;
    function Name : String; overload;
    function Labels(Value : String) : iModelHTMLChartsConfig; overload;
    function Labels : String; overload;
    function ColSpan(Value : Integer) : iModelHTMLChartsConfig; overload;
    function ColSpan : Integer; overload;
    function Width(Value : Integer) : iModelHTMLChartsConfig; overload;
    function Width : Integer; overload;
    function Heigth(Value : Integer) : iModelHTMLChartsConfig; overload;
    function Heigth : Integer; overload;
    function Data(Value : String) : iModelHTMLChartsConfig; overload;
    function Data : String; overload;
    function BackgroundColor(Value : String) : iModelHTMLChartsConfig; overload;
    function BackgroundColor : String; overload;
    function DataSet : iModelHTMLDataSet;
    function ResultDataSet : String;
    function ResultLabels : String;
    function Stacked(Value : Boolean) : iModelHTMLChartsConfig; overload;
    function Stacked : Boolean; overload;
    function CallBackLink(Value : String) : iModelHTMLChartsConfig; overload;
    function CallBackLink : String; overload;
    function Labelling : iModelLabellingConfig<iModelHTMLChartsConfig>; overload;
    function Options : iModelHTMLOptions;
    function &End : iModelHTMLChartsGeneric;
  end;

  iModelHTMLOptions = interface
    ['{8984AFE4-EBFC-4C97-B7BC-D3DA8FFFB42B}']
    function SemiCircule ( Value : Boolean ) : iModelHTMLOptions;
    function Scales : iModelHTMLScales;
    function Legend : iModelHTMLLegend;
    function Title : iModelHTMLTitle<iModelHTMLOptions>;
    function Tooltip : iModelHTMLTooltip<iModelHTMLOptions>;
    function Result : String;
    function &End : iModelHTMLChartsConfig;
  end;

  iModelHTMLScales = interface
    ['{5968D5D3-75C9-4F2C-9E66-3361A92D8DA4}']
    function GeneratedAxes ( Value : Boolean ) : iModelHTMLScales;
    function Axes : iModelHTMLChartsAxes;
    function Result : String;
    function &End : iModelHTMLOptions;
  end;

  iModelHTMLTooltip<T> = interface
    ['{5968D5D3-75C9-4F2C-9E66-3361A92D8DA4}']
    function Format(Value : String) : iModelHTMLTooltip<T>;
    function Result : String;
    function &End : T;
  end;

  iModelHTMLTitle<T> = interface
    ['{21A4474D-87C2-435B-9881-D385518C6EA6}']
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

  iModelHTMLLegend = interface
    ['{BC60AEB1-5404-4355-868A-D26BB5A2C773}']
    function Labels : iModelHTMLLegendLabels<iModelHTMLLegend>;
    function display ( Value : Boolean ) : iModelHTMLLegend; overload;
    function display : Boolean; overload;
    function position ( Value : String ) : iModelHTMLLegend; overload;
    function position : String; overload;
    function Result : String;
    function &End : iModelHTMLOptions;
  end;

  iModelHTMLLegendLabels<T> = interface
    ['{796188B6-4031-43E8-ABF1-43D6C8E1B18D}']
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

  iModelLabellingConfig<T> = interface
    ['{4BBEDE9F-9F02-4E92-AFA4-3B301DEC6672}']
    function Format ( Value : String) : iModelLabellingConfig<T>; overload;
    function Format : String; overload;
    function RGBColor ( Value : String ) : iModelLabellingConfig<T>; overload;
    function RGBColor : String; overload;
    function FontSize ( Value : Integer) : iModelLabellingConfig<T>; overload;
    function FontSize : Integer; overload;
    function FontStyle (Value : String) : iModelLabellingConfig<T>; overload;
    function FontStyle : String; overload;
    function FontFamily (Value : String) : iModelLabellingConfig<T>; overload;
    function FontFamily : String; overload;
    function Padding (Value : Integer) : iModelLabellingConfig<T>; overload;
    function Padding : Integer; overload;
    function PaddingX (Value : Integer) : iModelLabellingConfig<T>; overload;
    function PaddingX : Integer; overload;
    function Result : String;
    function &End : T;
  end;

  iModelHTMLChartsAxes = interface
    ['{2E97CD69-FDAC-4A01-ADA6-0EA9F1FFFF7C}']
    function xAxe : iModelHTMLChartsAxesParam;
    function yAxe : iModelHTMLChartsAxesParam;
    function Result : String;
    function &End : iModelHTMLScales;
  end;

  iModelHTMLChartsAxesParam = interface
    ['{E4C5DE93-B372-4D75-ADD2-8A3D1F30223E}']
    function Ticks : iModelHTMLChartsAxesTicks<iModelHTMLChartsAxesParam>;
    function GridLines : iModelHTMLChartsAxesGridLines<iModelHTMLChartsAxesParam>;
    function ScaleLabel : iModelHTMLChatsAxesScaleLabel<iModelHTMLChartsAxesParam>;
    function Position (Value : String) : iModelHTMLChartsAxesParam; overload;
    function Position : String; overload;
    function OffSet (Value : Boolean) : iModelHTMLChartsAxesParam; overload;
    function OffSet : Boolean; overload;
    function _Type (Value : String) : iModelHTMLChartsAxesParam; overload;
    function _Type : String; overload;
    function Stacked ( Value : Boolean ) : iModelHTMLChartsAxesParam; overload;
    function Stacked : Boolean; overload;
    function Result : String;
    function &End : iModelHTMLChartsAxes;
  end;

  iModelHTMLChatsAxesScaleLabel<T> = interface
    ['{FC645855-267C-4876-8BE2-EE540732C6A5}']
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

  iModelHTMLChartsAxesGridLines<T> = interface
    ['{F9043117-4398-478D-8EA2-8E5E065FB142}']
    function display (Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
    function display : Boolean; overload;
    function circular (Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
    function circular : Boolean; overload;
    function colorRGBA ( Value : String ) : iModelHTMLChartsAxesGridLines<T>; overload;
    function colorRGBA : String; overload;
    function drawBorder ( Value : Boolean ) : iModelHTMLChartsAxesGridLines<T>; overload;
    function drawBorder : Boolean; overload;
    function drawOnChartArea ( Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
    function drawOnChartArea : Boolean; overload;
    function drawTicks ( Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
    function drawTicks : Boolean; overload;
    function tickMarkLength ( Value : Integer ) : iModelHTMLChartsAxesGridLines<T>; overload;
    function tickMarkLength : Integer; overload;
    function zeroLineWidth ( Value : Integer ) : iModelHTMLChartsAxesGridLines<T>; overload;
    function zeroLineWidth : Integer; overload;
    function zeroLineColorRGBA ( Value : String ) : iModelHTMLChartsAxesGridLines<T>; overload;
    function zeroLineColorRGBA : String; overload;
    function Result : String;
    function &End : T;
  end;

  iModelHTMLChartsAxesTicks<T> = interface
    ['{C56445FE-00C6-47E1-8B38-F0FE57419A71}']
    function fontColor (Value : String) : iModelHTMLChartsAxesTicks<T>; overload;
    function fontColor : String; overload;
    function fontSize (Value : integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function fontSize : integer; overload;
    function autoSkip (Value : Boolean) : iModelHTMLChartsAxesTicks<T>; overload;
    function autoSkip : Boolean; overload;
    function autoSkipPadding (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function autoSkipPadding : Integer; overload;
    function labelOffset (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function labelOffset : Integer; overload;
    function maxRotation (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function maxRotation : Integer; overload;
    function minRotation (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function minRotation : Integer; overload;
    function mirror ( Value : Boolean) : iModelHTMLChartsAxesTicks<T>; overload;
    function mirror : Boolean; overload;
    function padding ( Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function padding : Integer; overload;
    function format ( Value : String) : iModelHTMLChartsAxesTicks<T>; overload;
    function format : String; overload;
    function Result : String;
    function &End : T;
  end;

  iModelHTMLDataSet = interface
    ['{761961EF-0C2B-4B88-AC8F-B4806D530D07}']
    function DataSet (Value : TDataSet) : iModelHTMLDataSet;
    function LabelName(Value : String) : iModelHTMLDataSet;
    function ValueName(Value : String) : iModelHTMLDataSet;
    function RGBName(Value : String)  : iModelHTMLDataSet;
    function textLabel(Value : String) : iModelHTMLDataSet;
    function BackgroundColor (Value : String) : iModelHTMLDataSet;
    function BorderColor (Value : String) : iModelHTMLDataSet;
    function BorderWidth (Value : Integer) : iModelHTMLDataSet;
    function Data (Value : String) : iModelHTMLDataSet;
    function Fill (Value : Boolean) : iModelHTMLDataSet;
    function ResultScript : String;
    function ResultLabels : String;
    function Types (Value : String) : iModelHTMLDataSet;
    function &End : iModelHTMLChartsConfig;
  end;

  iModelHTMLFactory = interface
    ['{8CF35864-C906-4B8B-AC69-CD2F2001D906}']
    function HTML : iModelHTML;
    function Charts(Parent : iModelHTML) : iModelHTMLCharts;
    function Rows(Parent : iModelHTML) : IModelHTMLRows;
    function RowsTitle(Parent : IModelHTMLRows) : iModelHTMLRowsTitle;
    {$IFDEF FULL}
    function Table(Parent : iModelHTML) : iModelTable;
    function Cards(Parent : iModelHTML) : iModelCards;
    function Image(Parent : iModelHTML) : iModelImage;
    function ChartEasyPie(Parent : iModelHTML) : iModelChartEasyPie;
    {$ENDIF}
  end;

  iModelColors<T> = interface
    ['{8A6FA48B-BCB6-468B-A6EC-BC582B898E16}']
    function Primary : iModelColors<T>;
    function Secondary : iModelColors<T>;
    function Success : iModelColors<T>;
    function Danger : iModelColors<T>;
    function Warning : iModelColors<T>;
    function Info : iModelColors<T>;
    function Light : iModelColors<T>;
    function Dark : iModelColors<T>;
    function Result : String;
    function &End : T;
  end;

  {$IFDEF FULL}
  IModelHTMLRowsP = interface
    ['{F26E4162-73CC-40E9-8E35-9499B6D61673}']
    function _Class(Value : String) : IModelHTMLRowsP;
    function Add(Value : String) : iModelHTMLRowsP;
    function &End : IModelHTMLRows;
  end;

  iModelTable = interface
    ['{D0151987-64C8-40E2-A83C-18AF9648F8AE}']
    function &End : iModelHTML;
    function DataSet : iModelTableDataSet;
    function TableClass : iModelTableClass;
    function TableOptions : iModelTableOption;
    function TableFeatures : iModelTableFeatures;
    function TableData : iModelTableData;
    function Datatable(Value : Boolean) : iModelTable;
  end;

  iModelTableClass = interface
    ['{AC891435-E424-4C9D-BC69-4B05A705B96E}']
    function tableDark : iModelTableClass;
    function tableStriped : iModelTableClass;
    function tableBordered : iModelTableClass;
    function tableHover : iModelTableClass;
    function tableSm : iModelTableClass;
    function tableResponsive : iModelTableClass;
    function &EndTableClass : iModelTable;
  end;

  iModelTableDataSet = interface
    ['{061B2938-6100-42AF-8EE4-D5895E5A38B8}']
    function DataSet (Value : TDataSet) : iModelTableDataSet;
    function CallbackLink(Field : String; MethodName : String) : iModelTableDataSet;
    function ResultScript : String;
    function &End : iModelTable;
  end;

  iModelTableOption = interface
    ['{2DFF85D5-1116-4160-AAE4-8A5172B8EFD8}']
    function ScrollCollapse(Value : Boolean) : iModelTableOption; //Permita que a tabela reduza em altura quando um número limitado de linhas for mostrado.
    function Responsive(Value : Boolean) : iModelTableOption; //Habilitar e configurar a extensão responsiva para DataTables
    function DeferLoading(Value : Integer) : iModelTableOption; //Atraso no carregamento dos dados do servidor até o segundo sorteio
    function OpDestroy(Value : Boolean) : iModelTableOption; //Destrua qualquer tabela existente que corresponda ao seletor e substitua pelas novas opções.
    function DisplayStart(Value : Integer) : iModelTableOption; //Ponto inicial de paginação inicial
    function LengthMenu(Value : String) : iModelTableOption; //Altere as opções na selectlista de comprimento da página .
    function Order(Value : String) : iModelTableOption; //Ordem inicial (classificação) a ser aplicada à tabela
    function OrderCellsTop(Value : Boolean) : iModelTableOption; //Controlar em qual célula o manipulador de eventos do pedido será aplicado em uma coluna
    function OrderClasses(Value : Boolean) : iModelTableOption; //Destaque as colunas que estão sendo ordenadas no corpo da tabela
    function OrderFixed(Value : String) : iModelTableOption; //Ordenação para sempre ser aplicada à tabela
    function OrderMulti(Value : Boolean) : iModelTableOption; //Controle de capacidade de ordenação de várias colunas.
    function PageLength(Value : Integer) : iModelTableOption; //Alterar o comprimento da página inicial (número de linhas por página)
    function PagingType(Value : String) : iModelTableOption; //Opções de exibição do botão de paginação
    function Retrieve(Value : Boolean) : iModelTableOption; //Recuperar uma instância existente do DataTables
    function Result : String;
    function &End : iModelTable;
  end;

  iModelTableFeatures = interface
    ['{3A297833-19EA-46CB-A10D-5AF1905791FC}']
    function AutoWidth(Value : Boolean) : iModelTableFeatures; //Controle de recursos Tratamento de largura de colunas inteligentes do DataTables
    function deferRender(Value : Boolean) : iModelTableFeatures; //Controle diferenciado renderização adiada para velocidade adicional de inicialização.
    function Info(Value : Boolean) : iModelTableFeatures; //Campo de exibição de informações da tabela de controle de recursos
    function LengthChange(Value : Boolean) : iModelTableFeatures; //O recurso controla a capacidade do usuário final de alterar o comprimento da exibição de paginação da tabela.
    function Ordering(Value : Boolean) : iModelTableFeatures; //Recursos de ordenação de controle de recursos (classificação) no DataTables.
    function Paging(Value : Boolean) : iModelTableFeatures; //Ativar ou desativar a paginação da tabela
    function Processing(Value : Boolean) : iModelTableFeatures; //O recurso controla o indicador de processamento
    function ScrollX(Value : Boolean) : iModelTableFeatures; //rolagem horizontal
    function ScrollY(Value : Integer) : iModelTableFeatures; //rolagem vertical
    function Searching(Value : Boolean) : iModelTableFeatures; //Recursos de pesquisa (filtragem) de controle de recursos
    function ServerSide(Value : Boolean) : iModelTableFeatures; //Controle de recurso Modo de processamento no lado do servidor do DataTables
    function StateSave(Value : Boolean) : iModelTableFeatures; //Economia de estado - restaura o estado da tabela no recarregamento da página.
    function Result : String;
    function &End : iModelTable;
  end;

  iModelTableData = interface
    ['{6241E52E-02AF-4395-B162-6FF6B5821A6C}']
    function Server(Value : String) : iModelTableData;
    function Columns(Value : Array of String) : iModelTableData;
    function JType(Value : String) : iModelTableData;
    function DataSrc(Value : String) : iModelTableData;
    function ResultTable : String;
    function Result : String;
    function &End : iModelTable;
  end;

  iModelTableCallback = interface
    ['{CB685C9B-1FC8-4C23-BECC-BFCBBAA99C37}']
    function formatNumber(aCampo, aFormat : String) : iModelTableCallback;
    function Result : String;
    function &End : iModelTable;
  end;

  IModelHTMLRowsDiv = interface
    ['{BD95F279-9614-47FD-B0AD-56B93279D4F1}']
    function Add(Value : String) : IModelHTMLRowsDiv;
    function ColSpan(Value : Integer) : IModelHTMLRowsDiv;
    function &End : IModelHTMLRows;
  end;

  iModelCards = interface
    ['{5BA3AF40-D673-44BA-BF79-5F35E0F00BFB}']
    function Colors : iModelColors<iModelCards>;
    function DataSet : iModelCardsDataSet;
    function FieldHeader(Value : String) : iModelCards; overload;
    function FieldTitle(Value : String) : iModelCards; overload;
    function FieldBody(Value : String) : iModelCards; overload;
    function FieldHeader : String; overload;
    function FieldTitle : String; overload;
    function FieldBody : String; overload;
    function ColSpan(Value : Integer) : iModelCards; overload;
    function ColSpan : Integer; overload;
    function &End : iModelHTML;
  end;

  iModelCardsDataSet = interface
    ['{E38197FC-8395-45BC-A0DE-D7283DD7E594}']
    function DataSet (Value : TDataSet) : iModelCardsDataSet;
    function ResultScript : String;
    function &End : iModelCards;
  end;

  iCallbackJS = interface
    ['{B3DD9B36-2024-4763-96A3-DEC0F10F454A}']
    function ClassProvider(Value : TObject) : iCallbackJS;
    function &End : iModelHTML;
  end;

  iChartsCallback = interface
  ['{4040F646-6D4F-477A-B5CE-98FDD025DAEB}']
    function Result (Value : String) : String;
    function IDChart ( Value : String) : iChartsCallback;
  end;

  iModelImage = interface
    ['{477D75E4-1BEE-4E4B-B15F-80B92DA186EA}']
    function &End : iModelHTML;
    function ImageClass : iModelImageClass;
    function DataSet : iModelImageDataSet;
  end;

  iModelImageDataSet = interface
    ['{061B2938-6100-42AF-8EE4-D5895E5A38B8}']
    function Field(Value : String) : iModelImageDataSet;
    function DataSet (Value : TDataSet) : iModelImageDataSet;
    function ResultScript : String;
    function &End : iModelImage;
  end;

  iModelImageClass = interface
    ['{9631B98F-CDE7-41A1-8138-E8E05AD72B65}']
    function imgFluid : iModelImageClass;
    function imgThumbnail : iModelImageClass;
    function FloatLeft : iModelImageClass;
    function FloatRight : iModelImageClass;
    function MxAuto : iModelImageClass;
    function DBlock : iModelImageClass;
    function rounded : iModelImageClass;
    function ResultClass : String;
    function &End : iModelImage;
  end;

  iModelButton = interface
    ['{BF6585F7-1823-4604-8FE4-1305EF38833B}']
    function ButtonClass : iModelButtonClass;
    function CallbackLink(Param : String; Method : String) : iModelButton;
    function Title(Value : String) : iModelButton;
    function &End : iModelHTML;
  end;

  iModelButtonClass = interface
  ['{E03B3D3A-2D23-4AC0-86E3-5C4F18B9A9CE}']
    function primary : iModelButtonClass;
    function secondary : iModelButtonClass;
    function success : iModelButtonClass;
    function danger : iModelButtonClass;
    function warning : iModelButtonClass;
    function info : iModelButtonClass;
    function light : iModelButtonClass;
    function dark : iModelButtonClass;
    function outline : iModelButtonClass;
    function small : iModelButtonClass;
    function large : iModelButtonClass;
    function block : iModelButtonClass;
    function active : iModelButtonClass;
    function disabled : iModelButtonClass;
    function ResultClass : String;
    function &End : iModelButton;
  end;

  iModelCSS = interface
    ['{DBC52618-B95B-4871-9BC5-632B7737F2FD}']
    function PackCSS : String;
    function CDN(Value : Boolean) : iModelCSS;
    function BackgroundColor ( Value : String ) :  iModelCSS;
    function FontColor ( Value : String ) : iModelCSS;
    function BorderColor ( Value : String ) : iModelCSS;
  end;

  iModelJS = interface
    ['{CB37AC61-A8D6-4CEB-BFD1-FDC26CDEB2AA}']
    function PackJS : String;
    function CDN(Value : Boolean) : iModelJS;
  end;

  iModelChartEasyPie = interface
    ['{236E2A17-A50A-4E23-A414-19A1E8A7B34E}']
    function BarColor(Value : String) : iModelChartEasyPie;
    function TrackColor(Value : String) : iModelChartEasyPie;
    function ScaleColor(Value : String) : iModelChartEasyPie;
    function LineCap(Value : String) : iModelChartEasyPie;
    function LinheWidth(Value : String) : iModelChartEasyPie;
    function Size(Value : String) : iModelChartEasyPie;
    function Animate(Value : String) : iModelChartEasyPie;
    function OnStart(Value : String) : iModelChartEasyPie;
    function OnStop(Value : String) : iModelChartEasyPie;
    function OnStep(Value : String) : iModelChartEasyPie;
    function DataPercent(Value : String) : iModelChartEasyPie;
    function &End : iModelHTML;
  end;

  {$ENDIF}

implementation

end.
