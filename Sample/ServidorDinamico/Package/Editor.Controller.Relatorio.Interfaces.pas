unit Editor.Controller.Relatorio.Interfaces;

interface

uses
  FireDAC.Comp.Client,
  FireDAC.Phys.Intf,
  Vcl.OleCtrls,
  SHDocVw,
  Data.DB,
  System.Classes,
  View.WebCharts,
  VCL.Grids,
  SysUtils,
  System.JSON;

type
  iControllerSaveNewRel = interface;
  iControllerLoadRel = interface;
  iControllerGeneratedRel = interface;

  iControllerRelatorio = interface
    ['{FB4863DC-7878-42ED-BB77-4ED84A02E6AB}']
    function Connection ( aConnection : TFDConnection ) : iControllerRelatorio;
    function Query ( aQuery : TFDQuery ) : iControllerRelatorio; overload;
    function Query : TFDQuery; overload;
    function WebBrowser ( aWebBrowser : TWebBrowser ) : iControllerRelatorio; overload;
    function WebBrowser : TWebBrowser; overload;
    function DataSet ( aDataSet : TDataSet ) : iControllerRelatorio; overload;
    function DataSet ( aDataSource : TDataSource ) : iControllerRelatorio; overload;
    function DataSet  : TDataSet; overload;
    function GetTableList( aList : TStrings ) : iControllerRelatorio;
    function PivotConfig ( aValue : TJsonObject ) : iControllerRelatorio;
    function GetRel : iControllerRelatorio;
    function WebCharts : TWebCharts;
    function SaveNewRel : iControllerSaveNewRel;
    function LoadRel : iControllerLoadRel;
    function GeneratedRel : iControllerGeneratedRel;
  end;

  iControllerSaveNewRel = interface
    ['{C5423BD4-8441-4D60-8E4E-46723B5CBBBE}']
    function Title ( aTitle : String ) : iControllerSaveNewRel; overload;
    function Description ( aDescription : String) : iControllerSaveNewRel; overload;
    function SQL ( aSQL : String ) : iControllerSaveNewRel; overload;
    function Params ( aValue : TJsonArray ) : iControllerSaveNewRel; overload;
    function Execute : iControllerSaveNewRel;
    function &End : iControllerRelatorio;
  end;

  iControllerLoadRel = interface
    ['{3DB1DC9F-B9CC-42C7-82A4-7ADFE7E4D49C}']
    function Title ( aValue : TProc<String> ) : iControllerLoadRel; overload;
    function Description ( aValue : TProc<String> ) : iControllerLoadRel; overload;
    function SQL ( aValue : TProc<String> ) : iControllerLoadRel; overload;
    function Params ( aValue : TProc<TJsonArray> ) : iControllerLoadRel;
    function Execute : iControllerLoadRel;
    function &End : iControllerRelatorio;
  end;

  iControllerGeneratedRel = interface
    ['{C6270678-9CD8-4241-8693-28C3F3261826}']
    function SQL (aSQL : String) : iControllerGeneratedRel;
    function Params ( aValue : TJsonArray ) : iControllerGeneratedRel;
    function Config ( aValue : TJsonObject ) : iControllerGeneratedRel;
    function Execute : iControllerGeneratedRel;
    function &End : iControllerRelatorio;
  end;

implementation

end.
