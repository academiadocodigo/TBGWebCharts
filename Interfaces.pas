unit Interfaces;

{$I TBGWebCharts.inc}

interface

uses
   SHDocVw,
   Data.DB, System.Generics.Collections;

type
  iModelHTMLChartsBar = interface;
  iModelHTMLCharts = interface;
  iModelHTMLChartsConfig<T> = interface;
  IModelRowsTitleConfig<T> = interface;
  IModelHTMLRows = interface;
  iModelHTMLRowsTitle = interface;
  IModelHTMLRowsTag = interface;
  iModelHTMLChartsDoughnut = interface;
  iModelHTMLChartsLines = interface;
  iModelHTMLDataSet<T> = interface;
  iModelHTMLChartsLineStacked = interface;
  iModelHTMLChartsPie = interface;
  {$IFDEF FULL}
  iModelTable = interface;
  iModelTableDataSet = interface;
  iModelTableClass = interface;
  IModelHTMLRowsDiv = interface;
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
    {$IFDEF FULL}
    function Table : iModelTable;
    {$ENDIF}
  end;

  IModelHTMLRows = interface
    ['{684C6EA3-4C2D-4AA9-9A94-BF0A07B14A8B}']
    function HTML(Value : String) : IModelHTMLRows; overload;
    function HTML : String; overload;
    function Title : iModelHTMLRowsTitle;
    function Tag : iModelHTMLRowsTag;
    {$IFDEF FULL}
    function _Div : IModelHTMLRowsDiv;
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
    function Configuracoes : IModelRowsTitleConfig<iModelHTMLRowsTitle>;
    function &End : IModelHTMLRows;
  end;

  IModelRowsTitleConfig<T> = interface
    ['{87031018-5C12-42DF-895F-2602B87FE468}']
    function H1(Value : String) : IModelRowsTitleConfig<T>; overload;
    function H1 : String; overload;
    function H2(Value : String) : IModelRowsTitleConfig<T>; overload;
    function H2 : String; overload;
    function H3(Value : String) : IModelRowsTitleConfig<T>; overload;
    function H3 : String; overload;
    function H4(Value : String) : IModelRowsTitleConfig<T>; overload;
    function H4 : String; overload;
    function H5(Value : String) : IModelRowsTitleConfig<T>; overload;
    function H5 : String; overload;
    function &End : T;
  end;

  iModelHTMLCharts = interface
    ['{4CC23536-78BD-40F7-B4A8-D5625E849065}']
    function HTML(Value : String) : iModelHTMLCharts; overload;
    function HTML : String; overload;
    function Bar : iModelHTMLChartsBar;
    function BarHorizontal : iModelHTMLChartsBar;
    function Doughnut : iModelHTMLChartsDoughnut;
    function Lines : iModelHTMLChartsLines;
    function LineStacked : iModelHTMLChartsLineStacked;
    function Pie : iModelHTMLChartsPie;
    function &End : iModelHTML;
  end;

  iModelHTMLChartsDoughnut = interface
    ['{709FF228-7F8A-4E2B-8AB9-EFAEC9AEE1B4}']
    function HTML(Value : String) : iModelHTMLChartsDoughnut; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsDoughnut>;
    function &End : iModelHTMLCharts;
  end;


  iModelHTMLChartsBar = interface
    ['{25AE0278-2105-4223-86A9-41F289F75EAE}']
    function HTML(Value : String) : iModelHTMLChartsBar; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsBar>;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsLines = interface
    ['{10DCD4CF-984F-4952-919A-5259A13A9D8D}']
    function HTML(Value : String) : iModelHTMLChartsLines; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsLines>;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsLineStacked = interface
    ['{6A3F3157-8FB2-4D72-A33A-27A66BED2661}']
    function HTML(Value : String) : iModelHTMLChartsLineStacked; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsLineStacked>;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsPie = interface
    ['{470E91C0-58DF-440E-AF3A-445746F0CFE0}']
    function HTML(Value : String) : iModelHTMLChartsPie; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig<iModelHTMLChartsPie>;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsConfig<T> = interface
    ['{B140654A-10FE-48A2-93B8-3D90743E3F1E}']
    function Name(Value : String) : iModelHTMLChartsConfig<T>; overload;
    function Name : String; overload;
    function Labels(Value : String) : iModelHTMLChartsConfig<T>; overload;
    function Labels : String; overload;
    function ColSpan(Value : Integer) : iModelHTMLChartsConfig<T>; overload;
    function ColSpan : Integer; overload;
    function Width(Value : Integer) : iModelHTMLChartsConfig<T>; overload;
    function Width : Integer; overload;
    function Heigth(Value : Integer) : iModelHTMLChartsConfig<T>; overload;
    function Heigth : Integer; overload;
    function Data(Value : String) : iModelHTMLChartsConfig<T>; overload;
    function Data : String; overload;
    function Title(Value : String) : iModelHTMLChartsConfig<T>; overload;
    function Title : String; overload;
    function BackgroundColor(Value : String) : iModelHTMLChartsConfig<T>; overload;
    function BackgroundColor : String; overload;
    function Options(Value : String) : iModelHTMLChartsConfig<T>; overload;
    function Options : String; overload;
    function DataSet : iModelHTMLDataSet<iModelHTMLChartsConfig<T>>;
    function ResultDataSet : String;
    function ResultLabels : String;
    function &End : T;
  end;

  iModelHTMLDataSet<T> = interface
    ['{761961EF-0C2B-4B88-AC8F-B4806D530D07}']
    function DataSet (Value : TDataSet) : iModelHTMLDataSet<T>;
    function textLabel(Value : String) : iModelHTMLDataSet<T>;
    function BackgroundColor (Value : String) : iModelHTMLDataSet<T>;
    function BorderColor (Value : String) : iModelHTMLDataSet<T>;
    function BorderWidth (Value : Integer) : iModelHTMLDataSet<T>;
    function Data (Value : String) : iModelHTMLDataSet<T>;
    function Fill (Value : String) : iModelHTMLDataSet<T>;
    function ResultScript : String;
    function ResultLabels : String;
    function &End : T;
  end;

  iModelHTMLFactory = interface
    ['{8CF35864-C906-4B8B-AC69-CD2F2001D906}']
    function HTML : iModelHTML;
    function Charts(Parent : iModelHTML) : iModelHTMLCharts;
    function ChartBar(Parent : iModelHTMLCharts) : iModelHTMLChartsBar;
    function Rows(Parent : iModelHTML) : IModelHTMLRows;
    function RowsTitle(Parent : IModelHTMLRows) : iModelHTMLRowsTitle;
    {$IFDEF FULL}
    function Table(Parent : iModelHTML) : iModelTable;
    {$ENDIF}
  end;

  {$IFDEF FULL}
  iModelTable = interface
    ['{D0151987-64C8-40E2-A83C-18AF9648F8AE}']
    function &End : iModelHTML;
    function DataSet : iModelTableDataSet;
    function TableClass : iModelTableClass;
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
    function ResultScript : String;
    function &End : iModelTable;
  end;

  IModelHTMLRowsDiv = interface
    ['{BD95F279-9614-47FD-B0AD-56B93279D4F1}']
    function Add(Value : String) : IModelHTMLRowsDiv;
    function ColSpan(Value : Integer) : IModelHTMLRowsDiv;
    function &End : IModelHTMLRows;
  end;
  {$ENDIF}

implementation

end.
