unit Dashboard;

{$I TBGWebCharts.inc}

interface

uses
  Interfaces,
  DB;

type
  TModelDashboard = class(TInterfacedObject, iModelDashboard)
  private
    FParent: iModelHTML;
    FPanelDepth: Integer;
    FFunnelOpen: Boolean;
    FRankingOpen: Boolean;
    FTimelineOpen: Boolean;
    FHeatMapOpen: Boolean;
    FHeatMapRowOpen: Boolean;
    FFilterBarOpen: Boolean;
    FFilterFieldWidth: Integer;
    FFilterFieldGap: Integer;
    FCurrentPanelTitle: string;
    FTabsOpen: Boolean;
    FTabPaneOpen: Boolean;
    FModalOpen: Boolean;
    FModalFooterOpen: Boolean;
    FStepperOpen: Boolean;
    FTabCounter: Integer;
    FFilterCounter: Integer;
    FCurrentTabsID: string;
    FCurrentFilterID: string;
    FInteractionCounter: Integer;
    FLastInteractionID: string;
    FFunnelStepCounter: Integer;
    procedure AppendHTML(const S: string);
    function FilterFieldStyle: string;
    function SparklineSVG(const PointsCSV, Status: string): string;
    function WrapAction(const Html, MethodName, Param: string): string;
    function InteractiveWrap(const Html: string): string;
    procedure AppendInteractiveAction(const Html, MethodName, Param: string);
    procedure ApplyInteraction(const TargetID, ClickMethod, ClickParam, DblClickMethod,
      DblClickParam, TooltipText, ConfirmText: string; CursorPointer: Boolean);
  public
    constructor Create(const Parent: iModelHTML);
    destructor Destroy; override;
    class function New(const Parent: iModelHTML): iModelDashboard;

    function BeginDashboard: iModelDashboard;
    function DashboardWidth(const Value: string): iModelDashboard;
    function BackgroundImage(const Source: string;
      const Position: string = 'center'; const Size: string = 'cover';
      const RepeatMode: string = 'no-repeat'; Opacity: Double = 0.12): iModelDashboard;
    function EndDashboard: iModelDashboard;
    function RowBegin: iModelDashboard;
    function RowEnd: iModelDashboard;
    function ColBegin(Span: Integer): iModelDashboard;
    function ColEnd: iModelDashboard;
    function PanelBegin(const Title: string; const ActionCaption: string = '';
      const ActionMethod: string = ''; const ActionParam: string = ''): iModelDashboard;
    function PanelEnd: iModelDashboard;
    function Add(const Value: string): iModelDashboard;
    function Inject(const Value: string): iModelDashboard;
    function CustomHTML(const Value: string): iModelDashboard;
    function Theme(const PrimaryColor: string = '#337ab7';
      const SuccessColor: string = '#28a745'; const WarningColor: string = '#f0ad4e';
      const DangerColor: string = '#dc3545'; const InfoColor: string = '#17a2b8'): iModelDashboard;
    function Interaction: iModelDashboardInteraction;

    function KPI(const Title, Value: string; const Subtitle: string = '';
      const Icon: string = ''; const Status: string = 'primary';
      Variation: Double = 0; const ActionMethod: string = '';
      const ActionParam: string = ''; const PointsCSV: string = ''): iModelDashboard;
    function Badge(const Text: string; const Status: string = 'primary';
      const ActionMethod: string = ''; const ActionParam: string = ''): iModelDashboard;
    function Progress(const Title: string; Percent: Double; const Text: string = '';
      const Status: string = 'primary'; const ActionMethod: string = '';
      const ActionParam: string = ''): iModelDashboard;
    function ProgressListItem(const LabelText: string; Value, Percent: Double;
      const Color: string = ''; const ActionMethod: string = '';
      const ActionParam: string = ''): iModelDashboard;
    function ProgressListDataSet(ADataSet: TDataSet;
      const LabelField, ValueField, ColorField: string;
      const Title: string = ''; const ActionMethod: string = '';
      const ActionParamField: string = ''): iModelDashboard;
    function Alert(const Title, Text: string; const Status: string = 'info';
      const ActionMethod: string = ''; const ActionParam: string = ''): iModelDashboard;

    { Dashboard v4.2 - imagens interativas }
    function ImageCard(const Source, Title: string; const Subtitle: string = '';
      const BadgeText: string = ''; const BadgeStatus: string = 'primary';
      const ActionMethod: string = ''; const ActionParam: string = '';
      const AltText: string = ''; const Tooltip: string = ''): iModelDashboard;
    function ImageCardDataSet(ADataSet: TDataSet; const SourceField, TitleField: string;
      const SubtitleField: string = ''; const BadgeField: string = '';
      const BadgeStatusField: string = ''; const ActionMethod: string = '';
      const ActionParamField: string = ''; Columns: Integer = 4;
      const EmptyText: string = 'Nenhuma imagem encontrada'): iModelDashboard;

    { Dashboard v4.1 - UX, estados e comparacao }
    function SectionHeader(const Title: string; const Subtitle: string = '';
      const ActionCaption: string = ''; const ActionMethod: string = '';
      const ActionParam: string = ''): iModelDashboard;
    function ComparisonKPI(const Title, CurrentValue, PreviousValue: string;
      Variation: Double; const ComparisonLabel: string = 'vs. periodo anterior';
      const Icon: string = ''; const Status: string = 'primary';
      const ActionMethod: string = ''; const ActionParam: string = '';
      const PointsCSV: string = ''): iModelDashboard;
    function EmptyState(const Title: string; const Text: string = '';
      const Icon: string = 'fas fa-inbox'; const ActionCaption: string = '';
      const ActionMethod: string = ''; const ActionParam: string = ''): iModelDashboard;
    function Skeleton(Lines: Integer = 3): iModelDashboard;
    function Divider(const Caption: string = ''): iModelDashboard;
    function FilterNumber(const Name, LabelText: string; Value: Double = 0;
      const Placeholder: string = ''): iModelDashboard;
    function FilterCheck(const Name, LabelText: string; Checked: Boolean = False;
      const CheckedValue: string = '1'; const UncheckedValue: string = '0'): iModelDashboard;

    { Dashboard v4 - filtros, navegacao e workflow }
    function FilterBarBegin(const Title: string = ''; const ID: string = ''; FieldWidth: Integer = 180; FieldGap: Integer = 10): iModelDashboard;
    function FilterText(const Name, LabelText: string; const Value: string = '';
      const Placeholder: string = ''): iModelDashboard;
    function FilterDate(const Name, LabelText: string; const Value: string = ''): iModelDashboard;
    function FilterSelect(const Name, LabelText, ItemsCSV: string;
      const ValuesCSV: string = ''; const SelectedValue: string = ''): iModelDashboard;
    function FilterSelectChange(const Name, LabelText, ItemsCSV: string;
      const ValuesCSV: string = ''; const SelectedValue: string = '';
      const ActionMethod: string = ''): iModelDashboard;
    function FilterSelectDataSet(const Name, LabelText: string; ADataSet: TDataSet;
      const ValueField, TextField: string; const SelectedValue: string = '';
      const ActionMethod: string = ''; IncludeAll: Boolean = False;
      const AllText: string = 'Todos'; const AllValue: string = ''): iModelDashboard;
    function FilterSelectDataSetMulti(const Name, LabelText: string; ADataSet: TDataSet;
      const ValueField, TextField: string; const SelectedValuesCSV: string = '';
      const ActionMethod: string = ''; IncludeAll: Boolean = False;
      const AllText: string = 'Todos'; const AllValue: string = ''): iModelDashboard;
    function FilterApplyButton(const Caption, ActionMethod: string;
      const Status: string = 'primary'; const Icon: string = ''): iModelDashboard;
    function FilterBarEnd: iModelDashboard;

    function TabsBegin(const ID: string = ''): iModelDashboard;
    function Tab(const ID, Caption: string; Active: Boolean = False;
      const BadgeText: string = ''; const Icon: string = ''): iModelDashboard;
    function TabsEnd: iModelDashboard;
    function TabPaneBegin(const ID: string; Active: Boolean = False): iModelDashboard;
    function TabPaneEnd: iModelDashboard;

    function ModalOpenButton(const Caption, ModalID: string;
      const Status: string = 'primary'; const Icon: string = ''): iModelDashboard;
    function ModalBegin(const ID, Title: string; const Size: string = 'md'): iModelDashboard;
    function ModalFooterButton(const Caption: string; const ActionMethod: string = '';
      const ActionParam: string = ''; const Status: string = 'primary';
      CloseAfter: Boolean = True): iModelDashboard;
    function ModalEnd: iModelDashboard;

    function StepperBegin(const Title: string = ''): iModelDashboard;
    function StepperItem(const Title: string; const Text: string = '';
      const Status: string = 'pending'; const DateText: string = '';
      const ActionMethod: string = ''; const ActionParam: string = ''): iModelDashboard;
    function StepperEnd: iModelDashboard;
    function StepperDataSet(ADataSet: TDataSet; const TitleField: string;
      const TextField: string = ''; const StatusField: string = '';
      const DateField: string = ''; const ActionMethod: string = '';
      const ActionParamField: string = ''; const Title: string = ''): iModelDashboard;

    function FunnelBegin(const Title: string = ''): iModelDashboard;
    function FunnelStepShape(const LabelText: string; Value, TopPercent,
      BottomPercent: Double; const ExtraText: string = '';
      const ActionMethod: string = ''; const ActionParam: string = '';
      const ValueText: string = ''): iModelDashboard;
    function FunnelStep(const LabelText: string; Value: Double;
      WidthPercent: Double = 100; const ExtraText: string = '';
      const ActionMethod: string = ''; const ActionParam: string = ''): iModelDashboard;
    function FunnelEnd: iModelDashboard;
    function FunnelDataSet(ADataSet: TDataSet; const LabelField, ValueField: string;
      const ExtraField: string = ''; const Title: string = '';
      const ActionMethod: string = ''; const ActionParamField: string = '';
      const ValueTextField: string = ''): iModelDashboard;
    function FunnelFields(ADataSet: TDataSet; const FieldsCSV, LabelsCSV: string;
      const Title: string = ''): iModelDashboard;

    function RankingBegin(const Title: string = ''): iModelDashboard;
    function RankingItem(const LabelText, ValueText: string; Percent: Double;
      const Status: string = 'primary'; const ActionMethod: string = '';
      const ActionParam: string = ''): iModelDashboard;
    function RankingEnd: iModelDashboard;
    function RankingDataSet(ADataSet: TDataSet; const LabelField, ValueField: string;
      const PercentField: string = ''; const StatusField: string = '';
      const ActionMethod: string = ''; const ActionParamField: string = '';
      const Title: string = ''; const ValueFormat: string = ''): iModelDashboard;

    function AgingItem(const LabelText: string; Count: Integer; Percent: Double;
      const Status: string = 'warning'; const ActionMethod: string = '';
      const ActionParam: string = ''): iModelDashboard;
    function AgingDataSet(ADataSet: TDataSet; const LabelField, CountField: string;
      const PercentField: string = ''; const StatusField: string = '';
      const ActionMethod: string = ''; const ActionParamField: string = '';
      const Title: string = ''): iModelDashboard;

    function TableDataSet(ADataSet: TDataSet; const FieldsCSV, HeadersCSV: string;
      const Title: string = ''; const BadgeField: string = '';
      const BadgeStatusField: string = ''; const ProgressField: string = '';
      const ProgressTextField: string = ''; const ActionMethod: string = '';
      const ActionParamField: string = ''): iModelDashboard;

    function TimelineBegin(const Title: string = ''): iModelDashboard;
    { IconName (opcional): ícone do item ('shopping-cart', 'fa-check' ou 'fas fa-check');
      vazio = ícone pelo status. }
    function TimelineItem(const DateText, Title, Text: string;
      const Status: string = 'primary'; const ActionMethod: string = '';
      const ActionParam: string = ''; const IconName: string = ''): iModelDashboard;
    function TimelineEnd: iModelDashboard;
    function TimelineDataSet(ADataSet: TDataSet; const DateField, TitleField: string;
      const TextField: string = ''; const StatusField: string = '';
      const ActionMethod: string = ''; const ActionParamField: string = '';
      const Title: string = ''): iModelDashboard;

    function Gauge(const Title: string; Percent: Double; const ValueText: string = '';
      const Status: string = 'primary'; const ActionMethod: string = '';
      const ActionParam: string = ''): iModelDashboard;
    function GaugeDataSet(ADataSet: TDataSet; const Title: string;
      const PercentField: string; const ValueTextField: string = '';
      const StatusField: string = ''; const ActionMethod: string = '';
      const ActionParamField: string = ''): iModelDashboard;
    { Dashboard v4.5 - blocos executivos }
    function StatusItem(const Title: string; Percent: Double; const ValueText: string = '';
      const Status: string = 'primary'; const ActionMethod: string = '';
      const ActionParam: string = ''): iModelDashboard;
    function QuickAction(const Caption, ActionMethod: string;
      const ActionParam: string = ''; const Status: string = 'primary';
      const Icon: string = ''; const HintText: string = ''): iModelDashboard;
    function Sparkline(const Title, PointsCSV: string; const ValueText: string = '';
      const Status: string = 'primary'; const ActionMethod: string = '';
      const ActionParam: string = ''): iModelDashboard;
    function SparklineDataSet(ADataSet: TDataSet; const Title, ValueField: string;
      const ValueText: string = ''; const Status: string = 'primary';
      const ActionMethod: string = ''; const ActionParam: string = ''): iModelDashboard;

    function HeatMapBegin(const Title: string = ''): iModelDashboard;
    function HeatMapHeader(const CSVLabels: string): iModelDashboard;
    function HeatMapRowBegin(const RowLabel: string): iModelDashboard;
    function HeatMapCell(const Text: string; Level: Integer;
      const ActionMethod: string = ''; const ActionParam: string = ''): iModelDashboard;
    function HeatMapRowEnd: iModelDashboard;
    function HeatMapEnd: iModelDashboard;
    { Matriz linha x coluna a partir de um DataSet (uma linha por célula): o nível de cor
      (1..5) é a faixa (quintil) do valor entre todos os valores, cada tom com cerca de 1/5
      das células, mesmo com valores fora da curva; célula sem valor fica vazia. A ordem das
      linhas e colunas é a ordem em que aparecem no DataSet. TextField (opcional) traz o
      valor já formatado para a dica; sem ele usa FormatFloat(ValueFormat). }
    function HeatMapDataSet(ADataSet: TDataSet; const RowField, ColumnField, ValueField: string;
      const Title: string = ''; const ValueFormat: string = ''; const TextField: string = '';
      const ActionMethod: string = ''; const ActionParamField: string = ''): iModelDashboard;

    { Dashboard v4.3 - navegacao e filtros interativos }
    function DrillDownButton(const Caption, ActionMethod: string;
      const ActionParam: string = ''; const Status: string = 'primary';
      const Icon: string = ''): iModelDashboard;
    function CrossFilterButton(const Caption, ActionMethod, FilterName, FilterValue: string;
      const Status: string = 'primary'; const Icon: string = ''): iModelDashboard;

    function &End: iModelHTML;
  end;

  TModelDashboardInteraction = class(TInterfacedObject, iModelDashboardInteraction)
  private
    FParentObj: TModelDashboard;
    FParent: iModelDashboard;
    FTargetID: string;
    FClickMethod: string;
    FClickParam: string;
    FDblClickMethod: string;
    FDblClickParam: string;
    FTooltip: string;
    FConfirm: string;
    FCursorPointer: Boolean;
  public
    constructor Create(AParentObj: TModelDashboard; const AParent: iModelDashboard; const ATargetID: string);
    class function New(AParentObj: TModelDashboard; const AParent: iModelDashboard; const ATargetID: string): iModelDashboardInteraction;
    function OnClick(const MethodName: string; const Param: string = ''): iModelDashboardInteraction;
    function OnDoubleClick(const MethodName: string; const Param: string = ''): iModelDashboardInteraction;
    function Tooltip(const Text: string): iModelDashboardInteraction;
    function CursorPointer(Value: Boolean = True): iModelDashboardInteraction;
    function Confirm(const MessageText: string): iModelDashboardInteraction;
    function &End: iModelDashboard;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  System.StrUtils,
  Dashboard.Utils,
  Dashboard.Theme;

function SplitCSV(const Value: string): TStringList;
begin
  Result := TStringList.Create;
  Result.StrictDelimiter := True;
  Result.Delimiter := ',';
  Result.DelimitedText := Value;
end;

function TModelDashboard.FilterFieldStyle: string;
begin
  Result := ' style="width:' + IntToStr(FFilterFieldWidth) +
    'px;min-width:' + IntToStr(FFilterFieldWidth) +
    'px;max-width:' + IntToStr(FFilterFieldWidth) +
    'px;margin-right:' + IntToStr(FFilterFieldGap) + 'px"';
end;

type
  TDashboardDataSetGuard = class
  private
    FDataSet: TDataSet;
    FBookmark: TBookmark;
    FHasBookmark: Boolean;
  public
    constructor Create(ADataSet: TDataSet);
    destructor Destroy; override;
  end;

constructor TDashboardDataSetGuard.Create(ADataSet: TDataSet);
begin
  inherited Create;
  FDataSet := ADataSet;
  FHasBookmark := False;
  if Assigned(FDataSet) and FDataSet.Active then
  begin
    if not FDataSet.IsEmpty then
    begin
      try
        FBookmark := FDataSet.Bookmark;
        FHasBookmark := True;
      except
        FHasBookmark := False;
      end;
    end;
    FDataSet.DisableControls;
  end;
end;

destructor TDashboardDataSetGuard.Destroy;
begin
  if Assigned(FDataSet) and FDataSet.Active then
  begin
    if FHasBookmark then
    begin
      try
        if FDataSet.BookmarkValid(FBookmark) then
          FDataSet.Bookmark := FBookmark;
      except
        { Datasets unidirecionais podem nao suportar bookmark. }
      end;
    end;
    FDataSet.EnableControls;
  end;
  inherited;
end;

function FieldExists(ADataSet: TDataSet; const FieldName: string): Boolean;
begin
  Result := Assigned(ADataSet) and (Trim(FieldName) <> '') and
    Assigned(ADataSet.FindField(Trim(FieldName)));
end;

function FieldText(ADataSet: TDataSet; const FieldName: string): string;
var
  F: TField;
begin
  Result := '';
  if not Assigned(ADataSet) then Exit;
  F := ADataSet.FindField(Trim(FieldName));
  if Assigned(F) and not F.IsNull then
    Result := F.DisplayText;
end;

function FieldFloat(ADataSet: TDataSet; const FieldName: string): Double;
var
  F: TField;
begin
  Result := 0;
  if not Assigned(ADataSet) then Exit;
  F := ADataSet.FindField(Trim(FieldName));
  if Assigned(F) and not F.IsNull then
    Result := F.AsFloat;
end;

function StatusFromText(const Value: string): string;
var
  S: string;
begin
  S := UpperCase(Trim(Value));
  if (S = 'ATRASADA') or (S = 'VENCIDA') or (S = 'RECUSADA') or
     (S = 'CRITICO') or (S = 'CRÍTICO') or (S = 'ERRO') then
    Result := 'danger'
  else if (S = 'PENDENTE') or (S = 'AGUARDANDO') or (S = 'URGENTE') or
          (S = 'VENCE_HOJE') or (S = 'ATENCAO') or (S = 'ATENÇÃO') then
    Result := 'warning'
  else if (S = 'ENTREGUE') or (S = 'APROVADA') or (S = 'ENCERRADA') or
          (S = 'OK') or (S = 'SUCESSO') or (S = 'SUCESS') then
    Result := 'success'
  else if (S = 'EM_ANDAMENTO') or (S = 'COTANDO') or (S = 'INFO') then
    Result := 'info'
  else
    Result := TDashboardUtils.StatusClass(Value);
end;

{ TModelDashboardInteraction }

constructor TModelDashboardInteraction.Create(AParentObj: TModelDashboard;
  const AParent: iModelDashboard; const ATargetID: string);
begin
  inherited Create;
  FParentObj := AParentObj;
  FParent := AParent;
  FTargetID := ATargetID;
  FCursorPointer := False;
end;

class function TModelDashboardInteraction.New(AParentObj: TModelDashboard;
  const AParent: iModelDashboard; const ATargetID: string): iModelDashboardInteraction;
begin
  Result := Self.Create(AParentObj, AParent, ATargetID);
end;

function TModelDashboardInteraction.OnClick(const MethodName, Param: string): iModelDashboardInteraction;
begin Result := Self; FClickMethod := MethodName; FClickParam := Param; if Trim(MethodName) <> '' then FCursorPointer := True; end;
function TModelDashboardInteraction.OnDoubleClick(const MethodName, Param: string): iModelDashboardInteraction;
begin Result := Self; FDblClickMethod := MethodName; FDblClickParam := Param; if Trim(MethodName) <> '' then FCursorPointer := True; end;
function TModelDashboardInteraction.Tooltip(const Text: string): iModelDashboardInteraction;
begin Result := Self; FTooltip := Text; end;
function TModelDashboardInteraction.CursorPointer(Value: Boolean): iModelDashboardInteraction;
begin Result := Self; FCursorPointer := Value; end;
function TModelDashboardInteraction.Confirm(const MessageText: string): iModelDashboardInteraction;
begin Result := Self; FConfirm := MessageText; end;
function TModelDashboardInteraction.&End: iModelDashboard;
begin
  if Assigned(FParentObj) then
    FParentObj.ApplyInteraction(FTargetID, FClickMethod, FClickParam, FDblClickMethod,
      FDblClickParam, FTooltip, FConfirm, FCursorPointer);
  Result := FParent;
end;

constructor TModelDashboard.Create(const Parent: iModelHTML);
begin
  inherited Create;
  FParent := Parent;
  FPanelDepth := 0;
  FFunnelOpen := False;
  FRankingOpen := False;
  FTimelineOpen := False;
  FHeatMapOpen := False;
  FHeatMapRowOpen := False;
  FFilterBarOpen := False;
  FFilterFieldWidth := 180;
  FFilterFieldGap := 10;
  FTabsOpen := False;
  FTabPaneOpen := False;
  FModalOpen := False;
  FModalFooterOpen := False;
  FStepperOpen := False;
  FTabCounter := 0;
  FFilterCounter := 0;
  FCurrentTabsID := '';
  FCurrentFilterID := '';
  FInteractionCounter := 0;
  FLastInteractionID := '';
  FFunnelStepCounter := 0;
  AppendHTML(TDashboardTheme.CSS);
  AppendHTML('<script type="text/javascript">' +
    'function bgdashTab(btn,id,g){var i,p=document.querySelectorAll(".bgdash-tabpane[data-group=\""+g+"\"]"),b=document.querySelectorAll(".bgdash-tab[data-group=\""+g+"\"]");for(i=0;i<p.length;' +
    'i++)p[i].style.display="none";for(i=0;i<b.length;i++)b[i].className=b[i].className.replace(" active","");var e=document.getElementById(id);if(e)e.style.display="block";btn.className+=" ' +
    'active";return false;}' +
    'function bgdashModal(id,show){var e=document.getElementById(id);if(e)e.style.display=show?"flex":"none";return false;}' +
    'function bgdashApplyFilter(id,m){var c=document.getElementById(id),o={},i,e,t,q,k,a,n;if(!c)return false;e=c.querySelectorAll("[data-bgfilter]");for(i=0;i<e.length;i++){' +
    't=e[i].getAttribute("data-bgfilter");n=e[i].getAttribute("data-bgfilter-name")||e[i].name;if(t==="multi"){q=e[i].querySelectorAll("input[type=checkbox]");a=[];for(k=0;k<q.length;k++){' +
    'if(q[k].checked)a.push(q[k].value);}o[n]=a;}else if(e[i].type==="checkbox"){o[e[i].name]=e[i].checked?e[i].getAttribute("data-checked-value"):e[i].getAttribute("data-unchecked-value");}else{' +
    'o[e[i].name]=e[i].value;}}var j=JSON.stringify(o).replace(/[\u007F-\uFFFF]/g,function(c){return "\\u"+("0000"+c.charCodeAt(0).toString(16)).slice(-4);}),b=btoa(j);' +
    'window.location.href="ActionCallBackJS:"+m+"("+b+")";return false;}' +
    'function bgdashMultiChange(e,m){var w=e,q,a=[],k,o,n,j;if(!m)return true;while(w&&w.getAttribute("data-bgfilter")!=="multi")w=w.parentNode;if(!w)return true;' +
    'q=w.querySelectorAll("input[type=checkbox]");for(k=0;k<q.length;k++){if(q[k].checked)a.push(q[k].value);}o={};n=w.getAttribute("data-bgfilter-name");o[n]=a;' +
    'j=JSON.stringify(o).replace(/[\u007F-\uFFFF]/g,function(c){return "\\u"+("0000"+c.charCodeAt(0).toString(16)).slice(-4);});window.location.href="ActionCallBackJS:"+m+"("+btoa(j)+")";return ' +
    'false;}' +
    'function bgdashDateMask(i){var v=String(i.value||"").replace(/\D/g,"").substr(0,8);' +
    'if(v.length>4)v=v.substr(0,2)+"/"+v.substr(2,2)+"/"+v.substr(4);else if(v.length>2)v=v.substr(0,2)+"/"+v.substr(2);' +
    'if(i.value!==v)i.value=v;}' +
    'function bgdashDatePad(v){return v<10?"0"+v:String(v);}' +
    'function bgdashDatePicker(input,event){var p,y,m,d,now;if(event){if(event.stopPropagation)event.stopPropagation();event.cancelBubble=true;}if(window.bgdashDatePopup){' +
    'document.body.removeChild(window.bgdashDatePopup);window.bgdashDatePopup=null;}window.bgdashDateInput=input;p=String(input.value||"");now=new Date();' +
    'if(p.indexOf("/")>0){p=p.split("/");y=parseInt(p[2],10);m=parseInt(p[1],10)-1;d=parseInt(p[0],10);}else{p=p.split("-");y=parseInt(p[0],10);' +
    'm=parseInt(p[1],10)-1;d=parseInt(p[2],10);}if(isNaN(y))y=now.getFullYear();if(isNaN(m)||m<0||m>11)m=now.getMonth();if(isNaN(d)||d<1)d=1;window.bgdashDateYear=y;window.bgdashDateMonth=m;' +
    'window.bgdashDateDay=d;bgdashDateRender();return false;}' +
    'function bgdashDateMove(delta,event){if(event){if(event.stopPropagation)event.stopPropagation();event.cancelBubble=true;}window.bgdashDateMonth+=delta;if(window.bgdashDateMonth<0){' +
    'window.bgdashDateMonth=11;window.bgdashDateYear--;}if(window.bgdashDateMonth>11){window.bgdashDateMonth=0;window.bgdashDateYear++;}bgdashDateRender();return false;}' +
    'function bgdashDateChoose(value,event){if(event){if(event.stopPropagation)event.stopPropagation();event.cancelBubble=true;}if(window.bgdashDateInput)window.bgdashDateInput.value=value;' +
    'if(window.bgdashDatePopup){document.body.removeChild(window.bgdashDatePopup);window.bgdashDatePopup=null;}return false;}' +
    'function bgdashDateRender(){var old=document.getElementById("bgdash-date-popup"),p,h,months,first,total,i,j,v,days;if(old&&old.parentNode)old.parentNode.removeChild(old);' +
    'p=document.createElement("div");p.id="bgdash-date-popup";p.className="bgdash-date-popup";months=["Jan","Fev","Mar","Abr","Mai","Jun","Jul","Ago","Set","Out","Nov","Dez"];h="<div ' +
    'class=\"bgdash-date-head\"><button type=\"button\" onclick=\"return bgdashDateMove(-1,event)\">&lt;' +
    '</button><strong>"+months[window.bgdashDateMonth]+" "+window.bgdashDateYear+"</strong><button type=\"button\" onclick=\"return bgdashDateMove(1,event)\">&gt;</button></div>";h+="<div ' +
    'class=\"bgdash-date-week\"><span>Seg</span><span>Ter</span><span>Qua</span><span>Qui</span><span>Sex</span><span>Sab</span><span>Dom</span></div>";h+="<div class=\"bgdash-date-grid\">";' +
    'first=new Date(window.bgdashDateYear,window.bgdashDateMonth,1).getDay();first=(first+6)%7;' +
    'total=new Date(window.bgdashDateYear,window.bgdashDateMonth+1,0).getDate();for(i=0;i<first;i++)h+="<span></span>";for(j=1;j<=total;j++){' +
    'v=bgdashDatePad(j)+"/"+bgdashDatePad(window.bgdashDateMonth+1)+"/"+window.bgdashDateYear;h+="<button type=\"button\" onclick=\"return bgdashDateChoose(''"+v+"'',event)\">"+j+"</button>";}' +
    'h+="</div>";p.innerHTML=h;document.body.appendChild(p);' +
    'if(window.bgdashDateInput){var r=window.bgdashDateInput.getBoundingClientRect(),sx=document.documentElement.scrollLeft||document.body.scrollLeft,' +
    'sy=document.documentElement.scrollTop||document.body.scrollTop;p.style.left=(r.left+sx)+"px";p.style.top=(r.bottom+sy+3)+"px";}window.bgdashDatePopup=p;}' +
    'function bgdashEncode(v){return btoa(String(v).replace(/[\u007F-\uFFFF]/g,function(c){return "\\u"+("0000"+c.charCodeAt(0).toString(16)).slice(-4);}));}' +
    'function bgdashSelectChange(e,m){if(!m)return true;window.location.href="ActionCallBackJS:"+m+"("+bgdashEncode(e.value)+")";return false;}' +
    'function bgdashCrossFilter(m,n,v){var o={filter:n,value:v},j=JSON.stringify(o);window.location.href="ActionCallBackJS:"+m+"("+bgdashEncode(j)+")";return false;}' +
    '</script>');
end;

destructor TModelDashboard.Destroy;
begin
  inherited;
end;

class function TModelDashboard.New(const Parent: iModelHTML): iModelDashboard;
begin
  Result := TModelDashboard.Create(Parent);
end;

procedure TModelDashboard.AppendHTML(const S: string);
begin
  FParent.HTML(S);
end;

function TModelDashboard.WrapAction(const Html, MethodName, Param: string): string;
var
  Href: string;
begin
  Href := TDashboardUtils.ActionHref(MethodName, Param);
  if Href = '' then
    Exit(Html);
  Result := '<a class="bgdash-click" href="' + TDashboardUtils.AttrEncode(Href) + '">' + Html + '</a>';
end;

function TModelDashboard.InteractiveWrap(const Html: string): string;
var
  P: Integer;
begin
  Inc(FInteractionCounter);
  FLastInteractionID := 'bgdash_int_' + IntToStr(FInteractionCounter);
  P := Pos('>', Html);
  if (Length(Html) > 0) and (Html[1] = '<') and (P > 1) then
    Result := Copy(Html, 1, P - 1) + ' id="' + FLastInteractionID + '"' + Copy(Html, P, MaxInt)
  else
    Result := '<span id="' + FLastInteractionID + '">' + Html + '</span>';
end;

procedure TModelDashboard.AppendInteractiveAction(const Html, MethodName, Param: string);
begin
  AppendHTML(InteractiveWrap(WrapAction(Html, MethodName, Param)));
end;

procedure TModelDashboard.ApplyInteraction(const TargetID, ClickMethod, ClickParam,
  DblClickMethod, DblClickParam, TooltipText, ConfirmText: string; CursorPointer: Boolean);
var
  JS, Href, DblHref: string;
  function JSQ(const V: string): string;
  begin
    Result := StringReplace(V, '\', '\\', [rfReplaceAll]);
    Result := StringReplace(Result, '''', '\''', [rfReplaceAll]);
    Result := StringReplace(Result, #13, '', [rfReplaceAll]);
    Result := StringReplace(Result, #10, '\n', [rfReplaceAll]);
  end;
begin
  if Trim(TargetID) = '' then Exit;
  Href := TDashboardUtils.ActionHref(ClickMethod, ClickParam);
  DblHref := TDashboardUtils.ActionHref(DblClickMethod, DblClickParam);
  JS := '<script type="text/javascript">(function(){var e=document.getElementById(''' + JSQ(TargetID) + ''');if(!e)return;';
  if CursorPointer then JS := JS + 'e.style.cursor="pointer";';
  if TooltipText <> '' then JS := JS + 'e.setAttribute("title",''' + JSQ(TooltipText) + ''');';
  if Href <> '' then
  begin
    JS := JS + 'e.onclick=function(ev){';
    if ConfirmText <> '' then JS := JS + 'if(!window.confirm(''' + JSQ(ConfirmText) + ''')){if(ev)ev.preventDefault();return false;}';
    JS := JS + 'window.location.href=''' + JSQ(Href) + ''';if(ev)ev.preventDefault();return false;};';
  end;
  if DblHref <> '' then
  begin
    JS := JS + 'e.ondblclick=function(ev){';
    if ConfirmText <> '' then JS := JS + 'if(!window.confirm(''' + JSQ(ConfirmText) + ''')){if(ev)ev.preventDefault();return false;}';
    JS := JS + 'window.location.href=''' + JSQ(DblHref) + ''';if(ev)ev.preventDefault();return false;};';
  end;
  JS := JS + '})();</script>';
  AppendHTML(JS);
end;

function TModelDashboard.Interaction: iModelDashboardInteraction;
begin
  Result := TModelDashboardInteraction.New(Self, Self, FLastInteractionID);
end;

function TModelDashboard.BeginDashboard: iModelDashboard;
begin
  Result := Self;
  AppendHTML('<div class="bgdash">');
end;

function TModelDashboard.DashboardWidth(const Value: string): iModelDashboard;
var
  W: string;
begin
  Result := Self;
  W := Trim(Value);
  if W = '' then
    Exit;
  if (Pos(';', W) > 0) or (Pos('{', W) > 0) or (Pos('}', W) > 0) then
    Exit;
  AppendHTML('<style type="text/css">.bgdash{width:' +
    TDashboardUtils.AttrEncode(W) + ' !important;max-width:' +
    TDashboardUtils.AttrEncode(W) + ' !important;margin-left:auto !important;' +
    'margin-right:auto !important;}</style>');
end;

function TModelDashboard.BackgroundImage(const Source, Position, Size,
  RepeatMode: string; Opacity: Double): iModelDashboard;
var
  Img, PosValue, SizeValue, RepeatValue: string;
begin
  Result := Self;
  Img := Trim(Source);
  if Img = '' then
    Exit;
  if ((Pos(';', Img) > 0) and (Pos('data:image/', LowerCase(Img)) <> 1)) or
    (Pos('{', Img) > 0) or (Pos('}', Img) > 0) or
    (Pos('<', Img) > 0) or (Pos('>', Img) > 0) or (Pos('''', Img) > 0) or
    (Pos('"', Img) > 0) or (Pos(')', Img) > 0) then
    Exit;
  PosValue := Trim(Position);
  SizeValue := Trim(Size);
  RepeatValue := Trim(RepeatMode);
  if PosValue = '' then PosValue := 'center';
  if SizeValue = '' then SizeValue := 'cover';
  if RepeatValue = '' then RepeatValue := 'no-repeat';
  if (Pos(';', PosValue) > 0) or (Pos('{', PosValue) > 0) or (Pos('}', PosValue) > 0) or
    (Pos('<', PosValue) > 0) or (Pos('>', PosValue) > 0) or (Pos('''', PosValue) > 0) or
    (Pos('"', PosValue) > 0) then Exit;
  if (Pos(';', SizeValue) > 0) or (Pos('{', SizeValue) > 0) or (Pos('}', SizeValue) > 0) or
    (Pos('<', SizeValue) > 0) or (Pos('>', SizeValue) > 0) or (Pos('''', SizeValue) > 0) or
    (Pos('"', SizeValue) > 0) then Exit;
  if (Pos(';', RepeatValue) > 0) or (Pos('{', RepeatValue) > 0) or (Pos('}', RepeatValue) > 0) or
    (Pos('<', RepeatValue) > 0) or (Pos('>', RepeatValue) > 0) or (Pos('''', RepeatValue) > 0) or
    (Pos('"', RepeatValue) > 0) then Exit;
  if Opacity < 0 then Opacity := 0;
  if Opacity > 1 then Opacity := 1;
  AppendHTML('<style type="text/css">.bgdash{position:relative;overflow:hidden}' +
    '.bgdash:before{content:"";position:absolute;top:0;right:0;bottom:0;left:0;' +
    'background-image:url(''' + TDashboardUtils.AttrEncode(Img) + ''');' +
    'background-position:' + TDashboardUtils.AttrEncode(PosValue) + ';' +
    'background-size:' + TDashboardUtils.AttrEncode(SizeValue) + ';' +
    'background-repeat:' + TDashboardUtils.AttrEncode(RepeatValue) + ';' +
    'opacity:' + TDashboardUtils.JsNumber(Opacity) + ';pointer-events:none;z-index:0}' +
    '.bgdash>*{position:relative;z-index:1}</style>');
end;

function TModelDashboard.EndDashboard: iModelDashboard;
begin
  Result := Self;
  if FModalOpen then ModalEnd;
  if FTabPaneOpen then TabPaneEnd;
  if FTabsOpen then TabsEnd;
  if FFilterBarOpen then FilterBarEnd;
  if FStepperOpen then StepperEnd;
  if FHeatMapOpen then HeatMapEnd;
  if FTimelineOpen then TimelineEnd;
  if FRankingOpen then RankingEnd;
  if FFunnelOpen then FunnelEnd;
  while FPanelDepth > 0 do PanelEnd;
  AppendHTML('</div>');
end;

function TModelDashboard.RowBegin: iModelDashboard;
begin
  Result := Self;
  AppendHTML('<div class="row bgdash-row">');
end;

function TModelDashboard.RowEnd: iModelDashboard;
begin
  Result := Self;
  AppendHTML('</div>');
end;

function TModelDashboard.ColBegin(Span: Integer): iModelDashboard;
begin
  Result := Self;
  { Mantem a mesma semantica do Rows._Div.ColSpan do componente original.
    Qualquer coluna Bootstrap entre 1 e 12 e valida. }
  if Span < 1 then
    Span := 1
  else if Span > 12 then
    Span := 12;

  AppendHTML('<div class="col-sm-' + IntToStr(Span) +
    ' bgdash-col bgdash-col-' + IntToStr(Span) + '">');
end;

function TModelDashboard.ColEnd: iModelDashboard;
begin
  Result := Self;
  AppendHTML('</div>');
end;

function TModelDashboard.PanelBegin(const Title: string; const ActionCaption,
  ActionMethod, ActionParam: string): iModelDashboard;
var
  Href, Header: string;
begin
  Result := Self;
  if FPanelDepth = 0 then
    FCurrentPanelTitle := Title;
  Inc(FPanelDepth);
  AppendHTML('<div class="bgdash-panel">');
  if (Title <> '') or ((ActionCaption <> '') and (ActionMethod <> '')) then
  begin
    Header := '<div class="bgdash-panel-title"><span class="bgdash-panel-title-text">' +
      TDashboardUtils.HtmlEncode(Title) + '</span>';
    Href := TDashboardUtils.ActionHref(ActionMethod, ActionParam);
    if (ActionCaption <> '') and (Href <> '') then
      Header := Header + '<a class="bgdash-panel-action" href="' +
        TDashboardUtils.AttrEncode(Href) + '">' +
        TDashboardUtils.HtmlEncode(ActionCaption) + '</a>';
    Header := Header + '</div>';
    AppendHTML(Header);
  end;
  AppendHTML('<div class="bgdash-panel-body">');
end;

function TModelDashboard.PanelEnd: iModelDashboard;
begin
  Result := Self;
  if FPanelDepth > 0 then
  begin
    AppendHTML('</div></div>');
    Dec(FPanelDepth);
    if FPanelDepth = 0 then
      FCurrentPanelTitle := '';
  end;
end;

function TModelDashboard.Add(const Value: string): iModelDashboard;
begin
  Result := Self;
  AppendHTML(Value);
end;

function TModelDashboard.Inject(const Value: string): iModelDashboard;
begin
  Result := Self;
  AppendHTML(Value);
end;

function TModelDashboard.CustomHTML(const Value: string): iModelDashboard;
begin
  Result := Self;
  AppendHTML(Value);
end;

function TModelDashboard.Theme(const PrimaryColor, SuccessColor, WarningColor,
  DangerColor, InfoColor: string): iModelDashboard;
begin
  Result := Self;
  AppendHTML('<style type="text/css">' +
    '.bgdash-primary{border-left-color:' + TDashboardUtils.AttrEncode(PrimaryColor) + '}' +
    '.bgdash-success{border-left-color:' + TDashboardUtils.AttrEncode(SuccessColor) + '}' +
    '.bgdash-warning{border-left-color:' + TDashboardUtils.AttrEncode(WarningColor) + '}' +
    '.bgdash-danger{border-left-color:' + TDashboardUtils.AttrEncode(DangerColor) + '}' +
    '.bgdash-info{border-left-color:' + TDashboardUtils.AttrEncode(InfoColor) + '}' +
    '.bgdash-progress-bar{background:' + TDashboardUtils.AttrEncode(PrimaryColor) + '}' +
    '.bgdash-progress-success{background:' + TDashboardUtils.AttrEncode(SuccessColor) + '}' +
    '.bgdash-progress-warning{background:' + TDashboardUtils.AttrEncode(WarningColor) + '}' +
    '.bgdash-progress-danger{background:' + TDashboardUtils.AttrEncode(DangerColor) + '}' +
    '.bgdash-progress-info{background:' + TDashboardUtils.AttrEncode(InfoColor) + '}' +
    '</style>');
end;

function TModelDashboard.SparklineSVG(const PointsCSV, Status: string): string;
var
  L: TStringList;
  I: Integer;
  V, MinV, MaxV, X, Y: Double;
  FS: TFormatSettings;
  Points, Stroke, S: string;
begin
  Result := '';
  L := SplitCSV(PointsCSV);
  try
    if L.Count = 0 then Exit;
    FS := TFormatSettings.Create;
    FS.DecimalSeparator := '.';
    MinV := 0;
    MaxV := 0;
    for I := 0 to L.Count - 1 do
    begin
      V := StrToFloatDef(StringReplace(Trim(L[I]), ',', '.', [rfReplaceAll]), 0, FS);
      if (I = 0) or (V < MinV) then MinV := V;
      if (I = 0) or (V > MaxV) then MaxV := V;
    end;
    if SameValue(MaxV, MinV) then MaxV := MinV + 1;
    Points := '';
    for I := 0 to L.Count - 1 do
    begin
      V := StrToFloatDef(StringReplace(Trim(L[I]), ',', '.', [rfReplaceAll]), 0, FS);
      if L.Count <= 1 then X := 50 else X := (I * 100) / (L.Count - 1);
      Y := 36 - ((V - MinV) / (MaxV - MinV) * 30);
      if Points <> '' then Points := Points + ' ';
      Points := Points + TDashboardUtils.JsNumber(X) + ',' + TDashboardUtils.JsNumber(Y);
    end;
    S := TDashboardUtils.StatusClass(Status);
    if S = 'success' then Stroke := '#28a745'
    else if S = 'warning' then Stroke := '#f0ad4e'
    else if S = 'danger' then Stroke := '#dc3545'
    else if S = 'info' then Stroke := '#17a2b8'
    else if S = 'dark' then Stroke := '#495057'
    else Stroke := '#337ab7';
    Result := '<svg class="bgdash-sparkline-svg" viewBox="0 0 100 42" ' +
      'preserveAspectRatio="none" aria-hidden="true"><polyline fill="none" stroke="' +
      Stroke + '" stroke-width="2" points="' + Points + '"/></svg>';
  finally
    L.Free;
  end;
end;

function TModelDashboard.KPI(const Title, Value, Subtitle, Icon, Status: string;
  Variation: Double; const ActionMethod, ActionParam, PointsCSV: string): iModelDashboard;
var
  Html, TrendClass, TrendText, S: string;
begin
  Result := Self;
  S := TDashboardUtils.StatusClass(Status);
  TrendText := '';
  TrendClass := 'bgdash-trend-flat';
  if Variation > 0 then
  begin
    TrendClass := 'bgdash-trend-up';
    TrendText := '&#9650; ' + FormatFloat('0.0', Abs(Variation)) + '%';
  end
  else if Variation < 0 then
  begin
    TrendClass := 'bgdash-trend-down';
    TrendText := '&#9660; ' + FormatFloat('0.0', Abs(Variation)) + '%';
  end;

  Html := '<div class="bgdash-kpi bgdash-' + S + '">' +
    '<div class="bgdash-kpi-title">' + TDashboardUtils.HtmlEncode(Title) + '</div>' +
    '<div class="bgdash-kpi-value">' + TDashboardUtils.HtmlEncode(Value) + '</div>';
  if Subtitle <> '' then
    Html := Html + '<div class="bgdash-kpi-sub">' + TDashboardUtils.HtmlEncode(Subtitle) + '</div>';  
  if TrendText <> '' then
    Html := Html + '<div class="bgdash-trend ' + TrendClass + '">' + TrendText + '</div>'
  else
    Html := Html + '<div class="bgdash-trend bgdash-trend-empty">&nbsp;</div>';	
  if Trim(PointsCSV) <> '' then
    Html := Html + '<div class="bgdash-kpi-sparkline">' + SparklineSVG(PointsCSV, S) + '</div>';
  if Icon <> '' then
    Html := Html + TDashboardUtils.IconHTML(Icon, 'bgdash-kpi-icon', Title);
  Html := Html + '</div>';
  AppendInteractiveAction(Html, ActionMethod, ActionParam);
end;

function TModelDashboard.Badge(const Text, Status, ActionMethod, ActionParam: string): iModelDashboard;
var
  S, Html: string;
begin
  Result := Self;
  S := TDashboardUtils.StatusClass(Status);
  Html := '<span class="bgdash-badge bgdash-badge-' + S + '">' + TDashboardUtils.HtmlEncode(Text) + '</span>';
  AppendInteractiveAction(Html, ActionMethod, ActionParam);
end;

function TModelDashboard.Progress(const Title: string; Percent: Double;
  const Text, Status, ActionMethod, ActionParam: string): iModelDashboard;
var
  P: Double;
  S, Html, Caption: string;
begin
  Result := Self;
  P := TDashboardUtils.ClampPercent(Percent);
  S := TDashboardUtils.StatusClass(Status);
  Caption := Text;
  if Caption = '' then
    Caption := FormatFloat('0.0', P) + '%';
  Html := '<div class="bgdash-line"><div class="bgdash-line-head">' +
    '<div><div class="bgdash-line-title">' + TDashboardUtils.HtmlEncode(Title) + '</div></div>' +
    '<div class="bgdash-ranking-value">' + TDashboardUtils.HtmlEncode(Caption) + '</div></div>' +
    '<div class="bgdash-progress"><div class="bgdash-progress-bar bgdash-progress-' + S +
    '" style="width:' + TDashboardUtils.JsNumber(P) + '%"></div></div></div>';
  AppendInteractiveAction(Html, ActionMethod, ActionParam);
end;

function TModelDashboard.ProgressListItem(const LabelText: string; Value,
  Percent: Double; const Color, ActionMethod, ActionParam: string): iModelDashboard;
var
  P: Double;
  FillColor, Html: string;
begin
  Result := Self;
  P := TDashboardUtils.ClampPercent(Percent);
  FillColor := Trim(Color);
  if SameText(FillColor, 'info') then
    FillColor := '#17a2b8'
  else if SameText(FillColor, 'success') then
    FillColor := '#28a745'
  else if SameText(FillColor, 'warning') then
    FillColor := '#f0ad4e'
  else if SameText(FillColor, 'orange') then
    FillColor := '#fd7e14'
  else if SameText(FillColor, 'secondary') then
    FillColor := '#6c757d'
  else if SameText(FillColor, 'danger') then
    FillColor := '#dc3545'
  else if FillColor = '' then
    FillColor := '#337ab7'
  else if Pos(',', FillColor) > 0 then
    FillColor := 'rgb(' + FillColor + ')';
  Html := '<div class="bgdash-progress-list-item"><span class="bgdash-progress-list-label">' +
    TDashboardUtils.HtmlEncode(LabelText) + '</span><div class="bgdash-progress-list-track">' +
    '<div class="bgdash-progress-list-bar" style="width:' + TDashboardUtils.JsNumber(P) + '%;background:' +
    TDashboardUtils.AttrEncode(FillColor) + '"></div></div><strong class="bgdash-progress-list-value">' +
    TDashboardUtils.HtmlEncode(FormatFloat('0.##', Value)) + '</strong></div>';
  AppendInteractiveAction(Html, ActionMethod, ActionParam);
end;

function TModelDashboard.ProgressListDataSet(ADataSet: TDataSet;
  const LabelField, ValueField, ColorField, Title, ActionMethod,
  ActionParamField: string): iModelDashboard;
var
  Guard: TDashboardDataSetGuard;
  MaxValue, Value, Percent: Double;
  Color, Param: string;
begin
  Result := Self;
  if (not Assigned(ADataSet)) or (not ADataSet.Active) or
    not FieldExists(ADataSet, LabelField) or not FieldExists(ADataSet, ValueField) then
    Exit;
  Guard := TDashboardDataSetGuard.Create(ADataSet);
  try
    MaxValue := 0;
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      Value := FieldFloat(ADataSet, ValueField);
      if Value > MaxValue then MaxValue := Value;
      ADataSet.Next;
    end;
    if (Title <> '') and not SameText(Title, FCurrentPanelTitle) then
      AppendHTML('<div class="bgdash-line-title bgdash-progress-list-title">' +
        TDashboardUtils.HtmlEncode(Title) + '</div>');
    AppendHTML('<div class="bgdash-progress-list">');
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      Value := FieldFloat(ADataSet, ValueField);
      if MaxValue > 0 then Percent := Value / MaxValue * 100 else Percent := 0;
      if FieldExists(ADataSet, ColorField) then Color := FieldText(ADataSet, ColorField)
      else Color := '';
      if FieldExists(ADataSet, ActionParamField) then Param := FieldText(ADataSet, ActionParamField)
      else Param := '';
      ProgressListItem(FieldText(ADataSet, LabelField), Value, Percent, Color,
        ActionMethod, Param);
      ADataSet.Next;
    end;
    AppendHTML('</div>');
  finally
    Guard.Free;
  end;
end;

function TModelDashboard.Alert(const Title, Text, Status, ActionMethod,
  ActionParam: string): iModelDashboard;
var
  S, Html: string;
begin
  Result := Self;
  S := TDashboardUtils.StatusClass(Status);
  Html := '<div class="bgdash-alert bgdash-alert-' + S + '"><div class="bgdash-line-title">' +
    TDashboardUtils.HtmlEncode(Title) + '</div>';
  if Text <> '' then
    Html := Html + '<div class="bgdash-line-sub">' + TDashboardUtils.HtmlEncode(Text) + '</div>';
  Html := Html + '</div>';
  AppendInteractiveAction(Html, ActionMethod, ActionParam);
end;



function TModelDashboard.ImageCard(const Source, Title, Subtitle, BadgeText,
  BadgeStatus, ActionMethod, ActionParam, AltText, Tooltip: string): iModelDashboard;
var
  Img, H, Badge, A, AltValue: string;
begin
  Result := Self;
  if Trim(Source) = '' then Exit;

  AltValue := AltText;
  if AltValue = '' then AltValue := Title;

  Img := '<img class="bgdash-imagecard-img" src="' + TDashboardUtils.AttrEncode(Source) +
    '" alt="' + TDashboardUtils.AttrEncode(AltValue) + '"';
  if Tooltip <> '' then
    Img := Img + ' title="' + TDashboardUtils.AttrEncode(Tooltip) + '"';
  Img := Img + '>';

  Badge := '';
  if BadgeText <> '' then
    Badge := '<span class="bgdash-badge bgdash-' + TDashboardUtils.StatusClass(BadgeStatus) + '">' +
      TDashboardUtils.HtmlEncode(BadgeText) + '</span>';

  H := '<div class="bgdash-imagecard">' + Img + '<div class="bgdash-imagecard-body">' +
    '<div class="bgdash-imagecard-head"><div class="bgdash-imagecard-title">' +
    TDashboardUtils.HtmlEncode(Title) + '</div>' + Badge + '</div>';
  if Subtitle <> '' then
    H := H + '<div class="bgdash-imagecard-sub">' + TDashboardUtils.HtmlEncode(Subtitle) + '</div>';
  H := H + '</div></div>';

  A := WrapAction(H, ActionMethod, ActionParam);
  AppendHTML(InteractiveWrap(A));
end;

function TModelDashboard.ImageCardDataSet(ADataSet: TDataSet;
  const SourceField, TitleField, SubtitleField, BadgeField, BadgeStatusField,
  ActionMethod, ActionParamField: string; Columns: Integer;
  const EmptyText: string): iModelDashboard;
var
  Guard: TDashboardDataSetGuard;
  Span: Integer;
  SourceValue, TitleValue, SubtitleValue, BadgeValue, StatusValue, ParamValue: string;
begin
  Result := Self;
  if not Assigned(ADataSet) or not ADataSet.Active then Exit;
  if not FieldExists(ADataSet, SourceField) or not FieldExists(ADataSet, TitleField) then Exit;

  if Columns < 1 then Columns := 1;
  if Columns > 6 then Columns := 6;
  Span := 12 div Columns;
  if Span < 1 then Span := 1;

  if ADataSet.IsEmpty then
  begin
    EmptyState(EmptyText, '', 'fas fa-image');
    Exit;
  end;

  Guard := TDashboardDataSetGuard.Create(ADataSet);
  try
    AppendHTML('<div class="row bgdash-imagegrid">');
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      SourceValue := FieldText(ADataSet, SourceField);
      TitleValue := FieldText(ADataSet, TitleField);
      SubtitleValue := FieldText(ADataSet, SubtitleField);
      BadgeValue := FieldText(ADataSet, BadgeField);
      StatusValue := FieldText(ADataSet, BadgeStatusField);
      ParamValue := FieldText(ADataSet, ActionParamField);
      if StatusValue = '' then StatusValue := 'primary';

      AppendHTML('<div class="col-md-' + IntToStr(Span) + ' col-sm-6 col-xs-12 bgdash-imagegrid-col">');
      ImageCard(SourceValue, TitleValue, SubtitleValue, BadgeValue, StatusValue,
        ActionMethod, ParamValue, TitleValue, TitleValue);
      AppendHTML('</div>');
      ADataSet.Next;
    end;
    AppendHTML('</div>');
  finally
    Guard.Free;
  end;
end;

function TModelDashboard.SectionHeader(const Title, Subtitle, ActionCaption,
  ActionMethod, ActionParam: string): iModelDashboard;
var A: string;
begin
  Result := Self;
  A := '';
  if (ActionCaption <> '') and (ActionMethod <> '') then
    A := '<a class="bgdash-section-action" href="' +
      TDashboardUtils.AttrEncode(TDashboardUtils.ActionHref(ActionMethod, ActionParam)) + '">' +
      TDashboardUtils.HtmlEncode(ActionCaption) + '</a>';
  AppendHTML('<div class="bgdash-section-head"><div><div class="bgdash-section-title">' +
    TDashboardUtils.HtmlEncode(Title) + '</div>' +
    IfThen(Subtitle <> '', '<div class="bgdash-section-sub">' + TDashboardUtils.HtmlEncode(Subtitle) + '</div>', '') +
    '</div>' + A + '</div>');
end;

function TModelDashboard.ComparisonKPI(const Title, CurrentValue,
  PreviousValue: string; Variation: Double; const ComparisonLabel, Icon,
  Status, ActionMethod, ActionParam, PointsCSV: string): iModelDashboard;
var
  TrendClass, Arrow, H: string;
begin
  Result := Self;
  if Variation > 0 then begin TrendClass := 'bgdash-trend-up'; Arrow := '&#9650;'; end
  else if Variation < 0 then begin TrendClass := 'bgdash-trend-down'; Arrow := '&#9660;'; end
  else begin TrendClass := 'bgdash-trend-flat'; Arrow := '&#8212;'; end;

  H := '<div class="bgdash-kpi bgdash-' + TDashboardUtils.StatusClass(Status) + '">' +
    '<div class="bgdash-kpi-title">' + TDashboardUtils.HtmlEncode(Title) + '</div>' +
    '<div class="bgdash-kpi-value">' + TDashboardUtils.HtmlEncode(CurrentValue) + '</div>' +
    '<div class="bgdash-compare"><span class="' + TrendClass + '">' + Arrow + ' ' +
    FormatFloat('0.0', Abs(Variation)) + '%</span><span class="bgdash-compare-label">' +
    TDashboardUtils.HtmlEncode(ComparisonLabel) + '</span></div>' +
    '<div class="bgdash-compare-prev">Anterior: ' + TDashboardUtils.HtmlEncode(PreviousValue) + '</div>';
  if Trim(PointsCSV) <> '' then
    H := H + '<div class="bgdash-kpi-sparkline">' + SparklineSVG(PointsCSV, Status) + '</div>';
  if Icon <> '' then
    H := H + TDashboardUtils.IconHTML(Icon, 'bgdash-kpi-icon', Title);
  H := H + '</div>';
  AppendInteractiveAction(H, ActionMethod, ActionParam);
end;

function TModelDashboard.EmptyState(const Title, Text, Icon, ActionCaption,
  ActionMethod, ActionParam: string): iModelDashboard;
var B, Ico: string;
begin
  Result := Self;
  B := '';
  Ico := TDashboardUtils.IconHTML(Icon, 'bgdash-empty-icon', Title);
  if (ActionCaption <> '') and (ActionMethod <> '') then
    B := '<a class="bgdash-btn bgdash-btn-primary bgdash-empty-btn" href="' +
      TDashboardUtils.AttrEncode(TDashboardUtils.ActionHref(ActionMethod, ActionParam)) + '">' +
      TDashboardUtils.HtmlEncode(ActionCaption) + '</a>';
  AppendHTML('<div class="bgdash-empty">' + Ico + '<div class="bgdash-empty-title">' +
    TDashboardUtils.HtmlEncode(Title) + '</div>' +
    IfThen(Text <> '', '<div class="bgdash-empty-text">' + TDashboardUtils.HtmlEncode(Text) + '</div>', '') +
    B + '</div>');
end;

function TModelDashboard.Skeleton(Lines: Integer): iModelDashboard;
var N: Integer;
begin
  Result := Self;
  if Lines < 1 then Lines := 1;
  if Lines > 12 then Lines := 12;
  AppendHTML('<div class="bgdash-skeleton" aria-busy="true">');
  for N := 1 to Lines do
    AppendHTML('<div class="bgdash-skeleton-line bgdash-skeleton-' +
      IntToStr(((N - 1) mod 3) + 1) + '"></div>');
  AppendHTML('</div>');
end;

function TModelDashboard.Divider(const Caption: string): iModelDashboard;
begin
  Result := Self;
  if Caption = '' then
    AppendHTML('<div class="bgdash-divider"></div>')
  else
    AppendHTML('<div class="bgdash-divider-caption"><span>' +
      TDashboardUtils.HtmlEncode(Caption) + '</span></div>');
end;

function TModelDashboard.FilterNumber(const Name, LabelText: string;
  Value: Double; const Placeholder: string): iModelDashboard;
var V: string;
begin
  Result := Self;
  if not FFilterBarOpen then FilterBarBegin;
  V := TDashboardUtils.JsNumber(Value);
  AppendHTML('<label class="bgdash-filter-field"' + FilterFieldStyle + '><span>' +
    TDashboardUtils.HtmlEncode(LabelText) + '</span><input type="number" step="any" data-bgfilter="1" name="' +
    TDashboardUtils.AttrEncode(Name) + '" value="' + TDashboardUtils.AttrEncode(V) +
    '" placeholder="' + TDashboardUtils.AttrEncode(Placeholder) + '"/></label>');
end;

function TModelDashboard.FilterCheck(const Name, LabelText: string;
  Checked: Boolean; const CheckedValue, UncheckedValue: string): iModelDashboard;
var C: string;
begin
  Result := Self;
  if not FFilterBarOpen then FilterBarBegin;
  if Checked then C := ' checked="checked"' else C := '';
  AppendHTML('<label class="bgdash-filter-check"><input type="checkbox" data-bgfilter="1" name="' +
    TDashboardUtils.AttrEncode(Name) + '" data-checked-value="' +
    TDashboardUtils.AttrEncode(CheckedValue) + '" data-unchecked-value="' +
    TDashboardUtils.AttrEncode(UncheckedValue) + '"' + C + '/><span>' +
    TDashboardUtils.HtmlEncode(LabelText) + '</span></label>');
end;

function TModelDashboard.FilterBarBegin(const Title, ID: string;
  FieldWidth, FieldGap: Integer): iModelDashboard;
begin
  Result := Self;
  if FFilterBarOpen then FilterBarEnd;
  if FieldWidth < 120 then FieldWidth := 120;
  if FieldWidth > 360 then FieldWidth := 360;
  if FieldGap < 0 then FieldGap := 0;
  if FieldGap > 40 then FieldGap := 40;
  FFilterFieldWidth := FieldWidth;
  FFilterFieldGap := FieldGap;
  FFilterBarOpen := True;
  Inc(FFilterCounter);
  FCurrentFilterID := Trim(ID);
  if FCurrentFilterID = '' then
    FCurrentFilterID := 'bgfilter_' + IntToStr(FFilterCounter);
  AppendHTML('<div id="' + TDashboardUtils.AttrEncode(FCurrentFilterID) + '" class="bgdash-filterbar">');
  if Title <> '' then
    AppendHTML('<div class="bgdash-filter-title">' + TDashboardUtils.HtmlEncode(Title) + '</div>');
  AppendHTML('<div class="bgdash-filter-fields">');
end;

function TModelDashboard.FilterText(const Name, LabelText, Value,
  Placeholder: string): iModelDashboard;
begin
  Result := Self;
  if not FFilterBarOpen then FilterBarBegin('', '');
  AppendHTML('<label class="bgdash-filter-field"' + FilterFieldStyle + '><span>' + TDashboardUtils.HtmlEncode(LabelText) + '</span>' +
    '<input data-bgfilter="1" type="text" name="' + TDashboardUtils.AttrEncode(Name) + '" value="' +
    TDashboardUtils.AttrEncode(Value) + '" placeholder="' + TDashboardUtils.AttrEncode(Placeholder) + '"></label>');
end;

function TModelDashboard.FilterDate(const Name, LabelText, Value: string): iModelDashboard;
begin
  Result := Self;
  if not FFilterBarOpen then FilterBarBegin('', '');
  AppendHTML('<label class="bgdash-filter-field"' + FilterFieldStyle + '><span>' + TDashboardUtils.HtmlEncode(LabelText) + '</span>' +
    '<input data-bgfilter="1" type="text" maxlength="10" placeholder="dd/mm/aaaa" autocomplete="off" name="' +
    TDashboardUtils.AttrEncode(Name) + '" value="' +
    TDashboardUtils.AttrEncode(Value) + '" oninput="bgdashDateMask(this)" onclick="return bgdashDatePicker(this,event);"></label>');
end;

function TModelDashboard.FilterSelect(const Name, LabelText, ItemsCSV,
  ValuesCSV, SelectedValue: string): iModelDashboard;
var
  Items, Values: TStringList;
  I: Integer;
  V, Sel: string;
begin
  Result := Self;
  if not FFilterBarOpen then FilterBarBegin('', '');
  Items := SplitCSV(ItemsCSV);
  Values := SplitCSV(ValuesCSV);
  try
    AppendHTML('<label class="bgdash-filter-field"' + FilterFieldStyle + '><span>' + TDashboardUtils.HtmlEncode(LabelText) + '</span><select data-bgfilter="1" name="' + TDashboardUtils.AttrEncode(Name) + '">');
    for I := 0 to Items.Count - 1 do
    begin
      if I < Values.Count then V := Trim(Values[I]) else V := Trim(Items[I]);
      if SameText(V, SelectedValue) then Sel := ' selected' else Sel := '';
      AppendHTML('<option value="' + TDashboardUtils.AttrEncode(V) + '"' + Sel + '>' + TDashboardUtils.HtmlEncode(Trim(Items[I])) + '</option>');
    end;
    AppendHTML('</select></label>');
  finally
    Values.Free;
    Items.Free;
  end;
end;

function TModelDashboard.FilterSelectChange(const Name, LabelText, ItemsCSV,
  ValuesCSV, SelectedValue, ActionMethod: string): iModelDashboard;
var
  Items, Values: TStringList;
  I: Integer;
  V, Sel, ChangeJS: string;
begin
  Result := Self;
  if not FFilterBarOpen then FilterBarBegin('', '');
  Items := SplitCSV(ItemsCSV);
  Values := SplitCSV(ValuesCSV);
  try
    ChangeJS := '';
    if Trim(ActionMethod) <> '' then
      ChangeJS := ' onchange="return bgdashSelectChange(this,''' +
        TDashboardUtils.AttrEncode(ActionMethod) + ''');"';
    AppendHTML('<label class="bgdash-filter-field"' + FilterFieldStyle + '><span>' + TDashboardUtils.HtmlEncode(LabelText) +
      '</span><select data-bgfilter="1" name="' + TDashboardUtils.AttrEncode(Name) + '"' + ChangeJS + '>');
    for I := 0 to Items.Count - 1 do
    begin
      if I < Values.Count then V := Trim(Values[I]) else V := Trim(Items[I]);
      if SameText(V, SelectedValue) then Sel := ' selected' else Sel := '';
      AppendHTML('<option value="' + TDashboardUtils.AttrEncode(V) + '"' + Sel + '>' +
        TDashboardUtils.HtmlEncode(Trim(Items[I])) + '</option>');
    end;
    AppendHTML('</select></label>');
  finally
    Values.Free;
    Items.Free;
  end;
end;

function TModelDashboard.FilterSelectDataSet(const Name, LabelText: string;
  ADataSet: TDataSet; const ValueField, TextField, SelectedValue,
  ActionMethod: string; IncludeAll: Boolean; const AllText,
  AllValue: string): iModelDashboard;
var
  Guard: TDashboardDataSetGuard;
  V, T, Sel, ChangeJS: string;
begin
  Result := Self;
  if not FFilterBarOpen then FilterBarBegin('', '');
  ChangeJS := '';
  if Trim(ActionMethod) <> '' then
    ChangeJS := ' onchange="return bgdashSelectChange(this,''' +
      TDashboardUtils.AttrEncode(ActionMethod) + ''');"';
  AppendHTML('<label class="bgdash-filter-field"' + FilterFieldStyle + '><span>' + TDashboardUtils.HtmlEncode(LabelText) +
    '</span><select data-bgfilter="1" name="' + TDashboardUtils.AttrEncode(Name) + '"' + ChangeJS + '>');
  if IncludeAll then
  begin
    if SameText(AllValue, SelectedValue) then Sel := ' selected' else Sel := '';
    AppendHTML('<option value="' + TDashboardUtils.AttrEncode(AllValue) + '"' + Sel + '>' +
      TDashboardUtils.HtmlEncode(AllText) + '</option>');
  end;
  if Assigned(ADataSet) and ADataSet.Active and FieldExists(ADataSet, ValueField) and
    FieldExists(ADataSet, TextField) then
  begin
    Guard := TDashboardDataSetGuard.Create(ADataSet);
    try
      ADataSet.First;
      while not ADataSet.Eof do
      begin
        V := FieldText(ADataSet, ValueField);
        T := FieldText(ADataSet, TextField);
        if SameText(V, SelectedValue) then Sel := ' selected' else Sel := '';
        AppendHTML('<option value="' + TDashboardUtils.AttrEncode(V) + '"' + Sel + '>' +
          TDashboardUtils.HtmlEncode(T) + '</option>');
        ADataSet.Next;
      end;
    finally
      Guard.Free;
    end;
  end;
  AppendHTML('</select></label>');
end;

function TModelDashboard.FilterSelectDataSetMulti(const Name, LabelText: string;
  ADataSet: TDataSet; const ValueField, TextField, SelectedValuesCSV,
  ActionMethod: string; IncludeAll: Boolean; const AllText,
  AllValue: string): iModelDashboard;
var
  Guard: TDashboardDataSetGuard;
  V, T, ChangeJS, Checked: string;
begin
  Result := Self;
  if not FFilterBarOpen then FilterBarBegin('', '');
  ChangeJS := '';
  if Trim(ActionMethod) <> '' then
    ChangeJS := ' onchange="return bgdashMultiChange(this,''' +
      TDashboardUtils.AttrEncode(ActionMethod) + ''');"';

  AppendHTML('<div class="bgdash-filter-field"' + FilterFieldStyle + '><span>' +
      TDashboardUtils.HtmlEncode(LabelText) + '</span><div class="bgdash-filter-multi" ' +
      'data-bgfilter="multi" data-bgfilter-name="' + TDashboardUtils.AttrEncode(Name) + '">');

    if IncludeAll then
    begin
      if Pos(',' + Trim(AllValue) + ',', ',' + StringReplace(SelectedValuesCSV, ' ', '', [rfReplaceAll]) + ',') > 0 then
        Checked := ' checked="checked"'
      else
        Checked := '';
      AppendHTML('<label class="bgdash-filter-check"><input type="checkbox" value="' +
        TDashboardUtils.AttrEncode(AllValue) + '" data-bgfilter-all="1"' + Checked + ChangeJS +
        '/><span>' + TDashboardUtils.HtmlEncode(AllText) + '</span></label>');
    end;

    if Assigned(ADataSet) and ADataSet.Active and FieldExists(ADataSet, ValueField) and
      FieldExists(ADataSet, TextField) then
    begin
      Guard := TDashboardDataSetGuard.Create(ADataSet);
      try
        ADataSet.First;
        while not ADataSet.Eof do
        begin
          V := FieldText(ADataSet, ValueField);
          T := FieldText(ADataSet, TextField);
          if Pos(',' + Trim(V) + ',', ',' + StringReplace(SelectedValuesCSV, ' ', '', [rfReplaceAll]) + ',') > 0 then
            Checked := ' checked="checked"'
          else
            Checked := '';
          AppendHTML('<label class="bgdash-filter-check"><input type="checkbox" value="' +
            TDashboardUtils.AttrEncode(V) + '"' + ChangeJS + Checked + '/><span>' +
            TDashboardUtils.HtmlEncode(T) + '</span></label>');
          ADataSet.Next;
        end;
      finally
        Guard.Free;
      end;
    end;
  AppendHTML('</div></div>');
end;

function TModelDashboard.FilterApplyButton(const Caption, ActionMethod, Status,
  Icon: string): iModelDashboard;
var
  S, Ico: string;
begin
  Result := Self;
  if not FFilterBarOpen then FilterBarBegin('', '');
  S := TDashboardUtils.StatusClass(Status);
  Ico := '';
  if Icon <> '' then Ico := TDashboardUtils.IconHTML(Icon, 'bgdash-button-icon', Caption) + ' ';
  AppendHTML('<div class="bgdash-filter-action"><button type="button" class="bgdash-btn bgdash-btn-' + S +
    '" onclick="return bgdashApplyFilter(''' + TDashboardUtils.AttrEncode(FCurrentFilterID) + ''',''' +
    TDashboardUtils.AttrEncode(ActionMethod) + ''');">' + Ico + TDashboardUtils.HtmlEncode(Caption) + '</button></div>');
end;

function TModelDashboard.FilterBarEnd: iModelDashboard;
begin
  Result := Self;
  if FFilterBarOpen then
  begin
    AppendHTML('</div></div>');
    FFilterBarOpen := False;
  end;
end;

function TModelDashboard.TabsBegin(const ID: string): iModelDashboard;
begin
  Result := Self;
  if FTabsOpen then TabsEnd;
  Inc(FTabCounter);
  FCurrentTabsID := Trim(ID);
  if FCurrentTabsID = '' then FCurrentTabsID := 'bgtabs_' + IntToStr(FTabCounter);
  FTabsOpen := True;
  AppendHTML('<div id="' + TDashboardUtils.AttrEncode(FCurrentTabsID) + '" class="bgdash-tabs">');
end;

function TModelDashboard.Tab(const ID, Caption: string; Active: Boolean;
  const BadgeText, Icon: string): iModelDashboard;
var
  C, B, Ico: string;
begin
  Result := Self;
  if not FTabsOpen then TabsBegin('');
  C := 'bgdash-tab';
  if Active then C := C + ' active';
  Ico := '';
  if Trim(Icon) <> '' then
    Ico := TDashboardUtils.IconHTML(Icon, 'bgdash-tab-icon', Caption) + ' ';
  B := '';
  if BadgeText <> '' then
    B := ' <span class="bgdash-tab-badge">' + TDashboardUtils.HtmlEncode(BadgeText) + '</span>';
  AppendHTML('<button type="button" class="' + C + '" data-group="' + TDashboardUtils.AttrEncode(FCurrentTabsID) +
    '" onclick="return bgdashTab(this,''' + TDashboardUtils.AttrEncode(ID) + ''',''' + TDashboardUtils.AttrEncode(FCurrentTabsID) + ''');">' +
    Ico + TDashboardUtils.HtmlEncode(Caption) + B + '</button>');
end;

function TModelDashboard.TabsEnd: iModelDashboard;
begin
  Result := Self;
  if FTabsOpen then begin AppendHTML('</div>'); FTabsOpen := False; end;
end;

function TModelDashboard.TabPaneBegin(const ID: string; Active: Boolean): iModelDashboard;
var D: string;
begin
  Result := Self;
  if FTabPaneOpen then TabPaneEnd;
  D := 'none'; if Active then D := 'block';
  FTabPaneOpen := True;
  AppendHTML('<div id="' + TDashboardUtils.AttrEncode(ID) + '" data-group="' + TDashboardUtils.AttrEncode(FCurrentTabsID) +
    '" class="bgdash-tabpane" style="display:' + D + '">');
end;

function TModelDashboard.TabPaneEnd: iModelDashboard;
begin
  Result := Self;
  if FTabPaneOpen then begin AppendHTML('</div>'); FTabPaneOpen := False; end;
end;

function TModelDashboard.ModalOpenButton(const Caption, ModalID, Status,
  Icon: string): iModelDashboard;
var
  S, Ico: string;
begin
  Result := Self;
  S := TDashboardUtils.StatusClass(Status);
  Ico := '';
  if Icon <> '' then Ico := TDashboardUtils.IconHTML(Icon, 'bgdash-button-icon', Caption) + ' ';
  AppendHTML('<button type="button" class="bgdash-btn bgdash-btn-' + S +
    '" onclick="return bgdashModal(''' + TDashboardUtils.AttrEncode(ModalID) + ''',true);">' +
    Ico + TDashboardUtils.HtmlEncode(Caption) + '</button>');
end;

function TModelDashboard.ModalBegin(const ID, Title, Size: string): iModelDashboard;
var
  Sz: string;
begin
  Result := Self;
  if FModalOpen then ModalEnd;
  Sz := LowerCase(Trim(Size));
  if (Sz <> 'sm') and (Sz <> 'lg') and (Sz <> 'xl') then Sz := 'md';
  FModalOpen := True;
  FModalFooterOpen := False;
  AppendHTML('<div id="' + TDashboardUtils.AttrEncode(ID) +
    '" class="bgdash-modal" style="display:none" onclick="if(event.target===this)bgdashModal(''' +
    TDashboardUtils.AttrEncode(ID) + ''',false);"><div class="bgdash-modal-dialog bgdash-modal-' + Sz +
    '"><div class="bgdash-modal-head"><div class="bgdash-modal-title">' +
    TDashboardUtils.HtmlEncode(Title) +
    '</div><button type="button" class="bgdash-modal-close" onclick="return bgdashModal(''' +
    TDashboardUtils.AttrEncode(ID) + ''',false);">&times;</button></div><div class="bgdash-modal-body">');
end;

function TModelDashboard.ModalFooterButton(const Caption, ActionMethod,
  ActionParam, Status: string; CloseAfter: Boolean): iModelDashboard;
var
  S, H, CloseJS: string;
begin
  Result := Self;
  if not FModalOpen then Exit;
  if not FModalFooterOpen then
  begin
    AppendHTML('</div><div class="bgdash-modal-foot">');
    FModalFooterOpen := True;
  end;
  S := TDashboardUtils.StatusClass(Status);
  H := TDashboardUtils.ActionHref(ActionMethod, ActionParam);
  CloseJS := '';
  if CloseAfter then
    CloseJS := 'var m=this;while(m&&m.className.indexOf(''bgdash-modal'')<0)m=m.parentNode;if(m)m.style.display=''none'';';
  if H <> '' then
    AppendHTML('<button type="button" class="bgdash-btn bgdash-btn-' + S + '" onclick="' +
      CloseJS + 'window.location.href=''' + TDashboardUtils.AttrEncode(H) + ''';">' +
      TDashboardUtils.HtmlEncode(Caption) + '</button>')
  else
    AppendHTML('<button type="button" class="bgdash-btn bgdash-btn-' + S + '" onclick="' +
      CloseJS + '">' + TDashboardUtils.HtmlEncode(Caption) + '</button>');
end;

function TModelDashboard.ModalEnd: iModelDashboard;
begin
  Result := Self;
  if FModalOpen then
  begin
    AppendHTML('</div></div></div>');
    FModalOpen := False;
    FModalFooterOpen := False;
  end;
end;

function TModelDashboard.StepperBegin(const Title: string): iModelDashboard;
begin
  Result := Self; if FStepperOpen then StepperEnd; FStepperOpen := True;
  if Title <> '' then AppendHTML('<div class="bgdash-line-title" style="margin-bottom:10px">' + TDashboardUtils.HtmlEncode(Title) + '</div>');
  AppendHTML('<div class="bgdash-stepper">');
end;

function TModelDashboard.StepperItem(const Title, Text, Status, DateText,
  ActionMethod, ActionParam: string): iModelDashboard;
var S,Html:string;
begin
  Result := Self; if not FStepperOpen then StepperBegin('');
  S := LowerCase(Trim(Status));
  if (S = 'success') or (S = 'sucesso') or (S = 'concluido') or
     (S = 'concluído') or (S = 'aprovada') or (S = 'aprovado') or
     (S = 'encerrada') or (S = 'encerrado') then S := 'done'
  else if (S = 'primary') or (S = 'andamento') or (S = 'em_andamento') or
          (S = 'atual') or (S = 'cotando') then S := 'active'
  else if (S = 'danger') or (S = 'erro') or (S = 'recusada') or
          (S = 'recusado') or (S = 'cancelada') or (S = 'cancelado') then S := 'error'
  else if (S = 'warning') or (S = 'aviso') or (S = 'atencao') or
          (S = 'atenção') or (S = 'urgente') then S := 'warning'
  else if S <> 'done' then S := 'pending';
  Html := '<div class="bgdash-step bgdash-step-' + S + '"><div class="bgdash-step-marker"></div><div class="bgdash-step-content"><div class="bgdash-step-title">' + TDashboardUtils.HtmlEncode(Title) + '</div>';
  if DateText <> '' then Html := Html + '<div class="bgdash-step-date">' + TDashboardUtils.HtmlEncode(DateText) + '</div>';
  if Text <> '' then Html := Html + '<div class="bgdash-step-text">' + TDashboardUtils.HtmlEncode(Text) + '</div>';
  Html := Html + '</div></div>';
  AppendInteractiveAction(Html, ActionMethod, ActionParam);
end;

function TModelDashboard.StepperEnd: iModelDashboard;
begin
  Result := Self; if FStepperOpen then begin AppendHTML('</div>'); FStepperOpen := False; end;
end;

function TModelDashboard.StepperDataSet(ADataSet: TDataSet; const TitleField,
  TextField, StatusField, DateField, ActionMethod, ActionParamField,
  Title: string): iModelDashboard;
var Guard:TDashboardDataSetGuard; St,Param:string;
begin
  Result := Self; if (not Assigned(ADataSet)) or (not ADataSet.Active) then Exit;
  if not FieldExists(ADataSet, TitleField) then Exit;
  Guard := TDashboardDataSetGuard.Create(ADataSet);
  try
    StepperBegin(Title); ADataSet.First;
    while not ADataSet.Eof do begin
      if FieldExists(ADataSet,StatusField) then St:=FieldText(ADataSet,StatusField) else St:='pending';
      if FieldExists(ADataSet,ActionParamField) then Param:=FieldText(ADataSet,ActionParamField) else Param:='';
      StepperItem(FieldText(ADataSet,TitleField),FieldText(ADataSet,TextField),St,FieldText(ADataSet,DateField),ActionMethod,Param);
      ADataSet.Next;
    end; StepperEnd;
  finally Guard.Free; end;
end;

function TModelDashboard.FunnelBegin(const Title: string): iModelDashboard;
begin
  Result := Self;
  if FFunnelOpen then Exit;
  FFunnelOpen := True;
  FFunnelStepCounter := 0;
  if Title <> '' then
    AppendHTML('<div class="bgdash-line-title" style="margin-bottom:8px">' + TDashboardUtils.HtmlEncode(Title) + '</div>');
  AppendHTML('<div class="bgdash-funnel">');
end;

function TModelDashboard.FunnelStepShape(const LabelText: string; Value,
  TopPercent, BottomPercent: Double; const ExtraText, ActionMethod,
  ActionParam: string; const ValueText: string): iModelDashboard;
var
  TopWidth, BottomWidth, Inset, P: Double;
  Caption, StepClass, Points, FillColor, ValueCaption: string;
begin
  Result := Self;
  if not FFunnelOpen then FunnelBegin('');

  TopWidth := TDashboardUtils.ClampPercent(TopPercent);
  if TopWidth < 12 then TopWidth := 12;
  if TopWidth > 100 then TopWidth := 100;

  BottomWidth := TDashboardUtils.ClampPercent(BottomPercent);
  if BottomWidth < 8 then BottomWidth := 8;
  if BottomWidth > TopWidth then BottomWidth := TopWidth;

  { The SVG viewBox is 100 units wide. The bottom inset makes the lower
    edge equal to the next stage's top edge, forming one continuous funnel. }
  Inset := ((TopWidth - BottomWidth) / TopWidth) * 50;
  Points := '0,0 100,0 ' + TDashboardUtils.JsNumber(100 - Inset) +
    ',34 ' + TDashboardUtils.JsNumber(Inset) + ',34';

  Inc(FFunnelStepCounter);
  StepClass := 'bgdash-funnel-' + IntToStr(((FFunnelStepCounter - 1) mod 5) + 1);
  case ((FFunnelStepCounter - 1) mod 5) + 1 of
    1: FillColor := '#2d8cff';
    2: FillColor := '#45a3ee';
    3: FillColor := '#f0525d';
    4: FillColor := '#f5a623';
  else
    FillColor := '#31b96b';
  end;
  { ValueText: valor já formatado pelo chamador (ex.: "R$ 1.234,50"); vazio = 0.## }
  if ValueText <> '' then
    ValueCaption := ValueText
  else
    ValueCaption := FormatFloat('0.##', Value);
  Caption := '<div class="bgdash-funnel-caption"><span class="bgdash-funnel-label">' +
    TDashboardUtils.HtmlEncode(LabelText) + '</span><strong class="bgdash-funnel-value">' +
    TDashboardUtils.HtmlEncode(ValueCaption) + '</strong>';
  if ExtraText <> '' then
    Caption := Caption + '<span class="bgdash-funnel-extra">' + TDashboardUtils.HtmlEncode(ExtraText) + '</span>';
  Caption := Caption + '</div>';

  P := TopWidth;
  AppendInteractiveAction('<div class="bgdash-funnel-row"><div class="bgdash-funnel-barbox">' +
    '<svg class="bgdash-funnel-step ' + StepClass + '" style="width:' +
    TDashboardUtils.JsNumber(P) + '%" viewBox="0 0 100 34" preserveAspectRatio="none" ' +
    'xmlns="http://www.w3.org/2000/svg"><polygon fill="' + FillColor + '" stroke="none" points="' + Points + '"></polygon></svg>' +
    '</div>' + Caption + '</div>', ActionMethod, ActionParam);
end;

function TModelDashboard.FunnelStep(const LabelText: string; Value, WidthPercent: Double;
  const ExtraText, ActionMethod, ActionParam: string): iModelDashboard;
begin
  Result := FunnelStepShape(LabelText, Value, WidthPercent, WidthPercent * 0.72,
    ExtraText, ActionMethod, ActionParam);
end;

function TModelDashboard.FunnelEnd: iModelDashboard;
begin
  Result := Self;
  if FFunnelOpen then
  begin
    AppendHTML('</div>');
    FFunnelOpen := False;
  end;
end;


function TModelDashboard.FunnelDataSet(ADataSet: TDataSet; const LabelField,
  ValueField, ExtraField, Title, ActionMethod, ActionParamField, ValueTextField: string): iModelDashboard;
var
  BaseValue, V, P, NextP, NextV, Anterior: Double;
  Extra, Param, LabelText, ValueText: string;
  Guard: TDashboardDataSetGuard;
  Posicional: Boolean;
  Qtd, Idx: Integer;

  { valores que não diminuem a cada etapa: largura pela posição (100% -> 40%) }
  function LarguraPosicao(AIndice: Integer): Double;
  begin
    if Qtd <= 1 then
      Result := 100
    else
      Result := 100 - AIndice * (60 / (Qtd - 1));
  end;

begin
  Result := Self;
  if (not Assigned(ADataSet)) or (not ADataSet.Active) or ADataSet.IsEmpty then Exit;
  if not FieldExists(ADataSet, LabelField) or not FieldExists(ADataSet, ValueField) then Exit;

  Guard := TDashboardDataSetGuard.Create(ADataSet);
  try
    { Funil de verdade (cada etapa <= anterior): largura proporcional à 1ª etapa.
      Senão (ex.: etapas independentes), largura pela posição e o valor real no texto. }
    Posicional := False;
    Qtd := 0;
    Anterior := 0;
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      V := FieldFloat(ADataSet, ValueField);
      if (Qtd > 0) and (V > Anterior) then
        Posicional := True;
      Anterior := V;
      Inc(Qtd);
      ADataSet.Next;
    end;

    ADataSet.First;
    BaseValue := FieldFloat(ADataSet, ValueField);
    FunnelBegin(Title);
    ADataSet.First;
    Idx := 0;
    while not ADataSet.Eof do
    begin
      V := FieldFloat(ADataSet, ValueField);
      if Posicional then P := LarguraPosicao(Idx)
      else if BaseValue > 0 then P := (V / BaseValue) * 100 else P := 0;
      LabelText := FieldText(ADataSet, LabelField);
      Extra := '';
      if FieldExists(ADataSet, ExtraField) then Extra := FieldText(ADataSet, ExtraField);
      if FieldExists(ADataSet, ActionParamField) then Param := FieldText(ADataSet, ActionParamField) else Param := '';
      ValueText := '';
      if (ValueTextField <> '') and FieldExists(ADataSet, ValueTextField) then ValueText := FieldText(ADataSet, ValueTextField);

      ADataSet.Next;
      if not ADataSet.Eof then
      begin
        NextV := FieldFloat(ADataSet, ValueField);
        if Posicional then NextP := LarguraPosicao(Idx + 1)
        else if BaseValue > 0 then NextP := (NextV / BaseValue) * 100 else NextP := 0;
      end
      else
        NextP := P * 0.72;

      FunnelStepShape(LabelText, V, P, NextP, Extra, ActionMethod, Param, ValueText);
      Inc(Idx);
    end;
    FunnelEnd;
  finally
    Guard.Free;
  end;
end;

function TModelDashboard.FunnelFields(ADataSet: TDataSet; const FieldsCSV,
  LabelsCSV, Title: string): iModelDashboard;
var
  Fields, Labels: TStringList;
  I: Integer;
  BaseValue, V, P, NextP: Double;
  LabelText: string;
  Guard: TDashboardDataSetGuard;
begin
  Result := Self;
  if (not Assigned(ADataSet)) or (not ADataSet.Active) or ADataSet.IsEmpty then Exit;
  Fields := SplitCSV(FieldsCSV);
  Labels := SplitCSV(LabelsCSV);
  try
    if Fields.Count = 0 then Exit;
    Guard := TDashboardDataSetGuard.Create(ADataSet);
    try
      ADataSet.First;
      BaseValue := FieldFloat(ADataSet, Trim(Fields[0]));
      FunnelBegin(Title);
    for I := 0 to Fields.Count - 1 do
    begin
      if not FieldExists(ADataSet, Trim(Fields[I])) then Continue;
      V := FieldFloat(ADataSet, Trim(Fields[I]));
      if BaseValue > 0 then P := (V / BaseValue) * 100 else P := 0;
      NextP := P * 0.72;
      if (I + 1 < Fields.Count) and FieldExists(ADataSet, Trim(Fields[I + 1])) then
      begin
        V := FieldFloat(ADataSet, Trim(Fields[I + 1]));
        if BaseValue > 0 then NextP := (V / BaseValue) * 100 else NextP := 0;
        V := FieldFloat(ADataSet, Trim(Fields[I]));
      end;
      if I < Labels.Count then LabelText := Trim(Labels[I]) else LabelText := Trim(Fields[I]);
      FunnelStepShape(LabelText, V, P, NextP, FormatFloat('0.0', P) + '%');
    end;
      FunnelEnd;
    finally
      Guard.Free;
    end;
  finally
    Labels.Free;
    Fields.Free;
  end;
end;

function TModelDashboard.RankingBegin(const Title: string): iModelDashboard;
begin
  Result := Self;
  if FRankingOpen then Exit;
  FRankingOpen := True;
  if Title <> '' then
    AppendHTML('<div class="bgdash-line-title" style="margin-bottom:8px">' + TDashboardUtils.HtmlEncode(Title) + '</div>');
  AppendHTML('<div class="bgdash-ranking">');
end;

function TModelDashboard.RankingItem(const LabelText, ValueText: string; Percent: Double;
  const Status, ActionMethod, ActionParam: string): iModelDashboard;
var
  P: Double;
  S, Html: string;
begin
  Result := Self;
  if not FRankingOpen then RankingBegin('');
  P := TDashboardUtils.ClampPercent(Percent);
  S := TDashboardUtils.StatusClass(Status);
  Html := '<div class="bgdash-line"><div class="bgdash-line-head">' +
    '<div class="bgdash-line-title">' + TDashboardUtils.HtmlEncode(LabelText) + '</div>' +
    '<div class="bgdash-ranking-value">' + TDashboardUtils.HtmlEncode(ValueText) + '</div></div>' +
    '<div class="bgdash-progress"><div class="bgdash-progress-bar bgdash-progress-' + S +
    '" style="width:' + TDashboardUtils.JsNumber(P) + '%"></div></div></div>';
  AppendInteractiveAction(Html, ActionMethod, ActionParam);
end;

function TModelDashboard.RankingEnd: iModelDashboard;
begin
  Result := Self;
  if FRankingOpen then
  begin
    AppendHTML('</div>');
    FRankingOpen := False;
  end;
end;


function TModelDashboard.RankingDataSet(ADataSet: TDataSet; const LabelField,
  ValueField, PercentField, StatusField, ActionMethod, ActionParamField,
  Title, ValueFormat: string): iModelDashboard;
var
  MaxValue, V, P: Double;
  Status, Param, ValueText: string;
  Guard: TDashboardDataSetGuard;
begin
  Result := Self;
  if (not Assigned(ADataSet)) or (not ADataSet.Active) or ADataSet.IsEmpty then Exit;
  if not FieldExists(ADataSet, LabelField) or not FieldExists(ADataSet, ValueField) then Exit;

  MaxValue := 0;
  Guard := TDashboardDataSetGuard.Create(ADataSet);
  try
    if not FieldExists(ADataSet, PercentField) then
    begin
      ADataSet.First;
      while not ADataSet.Eof do
      begin
        V := Abs(FieldFloat(ADataSet, ValueField));
        if V > MaxValue then MaxValue := V;
        ADataSet.Next;
      end;
    end;

    RankingBegin(Title);
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      V := FieldFloat(ADataSet, ValueField);
      if FieldExists(ADataSet, PercentField) then
        P := FieldFloat(ADataSet, PercentField)
      else if MaxValue > 0 then
        P := Abs(V) / MaxValue * 100
      else
        P := 0;

      if FieldExists(ADataSet, StatusField) then Status := StatusFromText(FieldText(ADataSet, StatusField))
      else Status := 'primary';
      if FieldExists(ADataSet, ActionParamField) then Param := FieldText(ADataSet, ActionParamField)
      else Param := '';

      if Trim(ValueFormat) <> '' then ValueText := FormatFloat(ValueFormat, V)
      else ValueText := FieldText(ADataSet, ValueField);
      RankingItem(FieldText(ADataSet, LabelField), ValueText,
        P, Status, ActionMethod, Param);
      ADataSet.Next;
    end;
    RankingEnd;
  finally
    Guard.Free;
  end;
end;

function TModelDashboard.AgingItem(const LabelText: string; Count: Integer; Percent: Double;
  const Status, ActionMethod, ActionParam: string): iModelDashboard;
begin
  Result := RankingItem(LabelText, IntToStr(Count), Percent, Status, ActionMethod, ActionParam);
end;


function TModelDashboard.AgingDataSet(ADataSet: TDataSet; const LabelField,
  CountField, PercentField, StatusField, ActionMethod, ActionParamField,
  Title: string): iModelDashboard;
var
  Total, V, P: Double;
  Status, Param: string;
  Guard: TDashboardDataSetGuard;
begin
  Result := Self;
  if (not Assigned(ADataSet)) or (not ADataSet.Active) or ADataSet.IsEmpty then Exit;
  if not FieldExists(ADataSet, LabelField) or not FieldExists(ADataSet, CountField) then Exit;

  Total := 0;
  Guard := TDashboardDataSetGuard.Create(ADataSet);
  try
    if not FieldExists(ADataSet, PercentField) then
    begin
      ADataSet.First;
      while not ADataSet.Eof do
      begin
        Total := Total + FieldFloat(ADataSet, CountField);
        ADataSet.Next;
      end;
    end;

    RankingBegin(Title);
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      V := FieldFloat(ADataSet, CountField);
      if FieldExists(ADataSet, PercentField) then P := FieldFloat(ADataSet, PercentField)
      else if Total > 0 then P := V / Total * 100 else P := 0;

      if FieldExists(ADataSet, StatusField) then Status := StatusFromText(FieldText(ADataSet, StatusField))
      else if P >= 40 then Status := 'danger'
      else if P >= 20 then Status := 'warning'
      else Status := 'info';

      if FieldExists(ADataSet, ActionParamField) then Param := FieldText(ADataSet, ActionParamField)
      else Param := '';

      RankingItem(FieldText(ADataSet, LabelField), FieldText(ADataSet, CountField),
        P, Status, ActionMethod, Param);
      ADataSet.Next;
    end;
    RankingEnd;
  finally
    Guard.Free;
  end;
end;

function TModelDashboard.TableDataSet(ADataSet: TDataSet; const FieldsCSV,
  HeadersCSV, Title, BadgeField, BadgeStatusField, ProgressField,
  ProgressTextField, ActionMethod, ActionParamField: string): iModelDashboard;
var
  Fields, Headers: TStringList;
  I: Integer;
  FieldName, CellText, Status, Param, Href, CellHtml: string;
  P: Double;
  Guard: TDashboardDataSetGuard;
begin
  Result := Self;
  if (not Assigned(ADataSet)) or (not ADataSet.Active) then Exit;
  Fields := SplitCSV(FieldsCSV);
  Headers := SplitCSV(HeadersCSV);
  try
    if Fields.Count = 0 then Exit;
    if Title <> '' then
      AppendHTML('<div class="bgdash-line-title" style="margin-bottom:8px">' + TDashboardUtils.HtmlEncode(Title) + '</div>');
    AppendHTML('<div class="bgdash-table-wrap"><table class="bgdash-table"><thead><tr>');
    for I := 0 to Fields.Count - 1 do
    begin
      if I < Headers.Count then CellText := Trim(Headers[I]) else CellText := Trim(Fields[I]);
      AppendHTML('<th>' + TDashboardUtils.HtmlEncode(CellText) + '</th>');
    end;
    if ActionMethod <> '' then
      AppendHTML('<th class="bgdash-table-actions-head">A&ccedil;&otilde;es</th>');
    AppendHTML('</tr></thead><tbody>');

    Guard := TDashboardDataSetGuard.Create(ADataSet);
    try
      ADataSet.First;
      while not ADataSet.Eof do
      begin
        Param := '';
        if FieldExists(ADataSet, ActionParamField) then Param := FieldText(ADataSet, ActionParamField);
        Href := TDashboardUtils.ActionHref(ActionMethod, Param);
        AppendHTML('<tr' + IfThen(Href <> '', ' class="bgdash-table-click"', '') + '>');
        for I := 0 to Fields.Count - 1 do
        begin
          FieldName := Trim(Fields[I]);
          CellText := FieldText(ADataSet, FieldName);
          if SameText(FieldName, BadgeField) then
          begin
            if FieldExists(ADataSet, BadgeStatusField) then Status := StatusFromText(FieldText(ADataSet, BadgeStatusField))
            else Status := StatusFromText(CellText);
            CellHtml := '<span class="bgdash-badge bgdash-badge-' + TDashboardUtils.StatusClass(Status) + '">' +
              TDashboardUtils.HtmlEncode(CellText) + '</span>';
          end
          else if SameText(FieldName, ProgressField) then
          begin
            P := TDashboardUtils.ClampPercent(FieldFloat(ADataSet, FieldName));
            if FieldExists(ADataSet, ProgressTextField) then CellText := FieldText(ADataSet, ProgressTextField)
            else CellText := FormatFloat('0.0', P) + '%';
            CellHtml := '<div class="bgdash-table-progress-text">' + TDashboardUtils.HtmlEncode(CellText) + '</div>' +
              '<div class="bgdash-progress"><div class="bgdash-progress-bar bgdash-progress-info" style="width:' +
              TDashboardUtils.JsNumber(P) + '%"></div></div>';
          end
          else
            CellHtml := TDashboardUtils.HtmlEncode(CellText);

          if Href <> '' then
            CellHtml := '<a class="bgdash-table-link" href="' + TDashboardUtils.AttrEncode(Href) + '">' + CellHtml + '</a>';
          AppendHTML('<td>' + CellHtml + '</td>');
        end;
        if ActionMethod <> '' then
          AppendHTML('<td class="bgdash-table-actions"><a class="bgdash-table-action" href="' +
            TDashboardUtils.AttrEncode(Href) + '" title="Abrir"><i class="fas fa-eye"></i></a>' +
            '<a class="bgdash-table-action" href="' + TDashboardUtils.AttrEncode(Href) +
            '" title="Detalhar"><i class="fas fa-external-link-alt"></i></a></td>');
        AppendHTML('</tr>');
        ADataSet.Next;
      end;
    finally
      Guard.Free;
    end;
    AppendHTML('</tbody></table></div>');
  finally
    Headers.Free;
    Fields.Free;
  end;
end;

function TModelDashboard.TimelineBegin(const Title: string): iModelDashboard;
begin
  Result := Self;
  if FTimelineOpen then Exit;
  FTimelineOpen := True;
  if Title <> '' then
    AppendHTML('<div class="bgdash-line-title" style="margin-bottom:10px">' + TDashboardUtils.HtmlEncode(Title) + '</div>');
  AppendHTML('<div class="bgdash-timeline">');
end;

{ Nomes do Font Awesome 6 que não existem no Font Awesome 5 embutido -> equivalente do 5. }
function IconeFA5(const AName: string): string;
const
  cDe: array[0..25] of string = ('package-check', 'box-check', 'circle-check', 'circle-xmark', 'xmark', 'circle-info', 'circle-exclamation',
    'triangle-exclamation', 'circle-question', 'cart-shopping', 'basket-shopping', 'gear', 'pen-to-square', 'pen',
    'file-plus', 'file-circle-plus', 'file-invoice', 'file-medical', 'user-check', 'rotate', 'arrows-rotate',
    'trash-can', 'money-bill', 'list-check', 'square-plus', 'circle-plus');
  cPara: array[0..25] of string = ('box', 'box', 'check-circle', 'times-circle', 'times', 'info-circle', 'exclamation-circle',
    'exclamation-triangle', 'question-circle', 'shopping-cart', 'shopping-basket', 'cog', 'edit', 'edit',
    'file', 'file', 'file-alt', 'file-alt', 'user', 'sync', 'sync',
    'trash', 'dollar-sign', 'tasks', 'plus-square', 'plus-circle');
var
  I: Integer;
begin
  Result := LowerCase(Trim(AName));
  for I := Low(cDe) to High(cDe) do
    if Result = cDe[I] then
      Exit(cPara[I]);
end;

function TModelDashboard.TimelineItem(const DateText, Title, Text, Status,
  ActionMethod, ActionParam, IconName: string): iModelDashboard;
var
  S, Html, Icon: string;
begin
  Result := Self;
  if not FTimelineOpen then TimelineBegin('');
  S := TDashboardUtils.StatusClass(Status);
  if S = 'success' then Icon := 'fas fa-check'
  else if S = 'warning' then Icon := 'fas fa-clock'
  else if S = 'danger' then Icon := 'fas fa-exclamation'
  else if S = 'info' then Icon := 'fas fa-info'
  else if S = 'dark' then Icon := 'fas fa-cog'
  else Icon := 'fas fa-file-alt';
  if Trim(IconName) <> '' then
  begin
    if Pos(' ', Trim(IconName)) > 0 then
      Icon := Trim(IconName)
    else if Pos('fa-', LowerCase(Trim(IconName))) = 1 then
      Icon := 'fas fa-' + IconeFA5(Copy(Trim(IconName), 4, MaxInt))
    else
      Icon := 'fas fa-' + IconeFA5(IconName);
  end;
  Html := '<div class="bgdash-timeline-item"><div class="bgdash-timeline-marker"><span class="bgdash-timeline-dot" style="background:';
  if S = 'success' then Html := Html + '#28a745'
  else if S = 'warning' then Html := Html + '#f0ad4e'
  else if S = 'danger' then Html := Html + '#dc3545'
  else if S = 'info' then Html := Html + '#17a2b8'
  else if S = 'dark' then Html := Html + '#495057'
  else Html := Html + '#337ab7';
  Html := Html + '"><i class="' + TDashboardUtils.AttrEncode(Icon) + '"></i></span></div><div class="bgdash-timeline-date">' +
    TDashboardUtils.HtmlEncode(DateText) + '</div><div class="bgdash-timeline-content"><div class="bgdash-timeline-title">' +
    TDashboardUtils.HtmlEncode(Title) + '</div>';
  if Text <> '' then
    Html := Html + '<div class="bgdash-timeline-text">' + TDashboardUtils.HtmlEncode(Text) + '</div>';
  Html := Html + '</div></div>';
  AppendInteractiveAction(Html, ActionMethod, ActionParam);
end;

function TModelDashboard.TimelineEnd: iModelDashboard;
begin
  Result := Self;
  if FTimelineOpen then
  begin
    AppendHTML('</div>');
    FTimelineOpen := False;
  end;
end;


function TModelDashboard.TimelineDataSet(ADataSet: TDataSet; const DateField,
  TitleField, TextField, StatusField, ActionMethod, ActionParamField,
  Title: string): iModelDashboard;
var
  Guard: TDashboardDataSetGuard;
  St, Param, DateText: string;
  DateValue: TField;
begin
  Result := Self;
  if (not Assigned(ADataSet)) or (not ADataSet.Active) or not FieldExists(ADataSet,TitleField) then Exit;
  Guard := TDashboardDataSetGuard.Create(ADataSet);
  try
    TimelineBegin(Title); ADataSet.First;
    while not ADataSet.Eof do begin
      if FieldExists(ADataSet,StatusField) then St := StatusFromText(FieldText(ADataSet,StatusField)) else St := 'primary';
      if FieldExists(ADataSet,ActionParamField) then Param := FieldText(ADataSet,ActionParamField) else Param := '';
      DateValue := ADataSet.FindField(Trim(DateField));
      if Assigned(DateValue) and not DateValue.IsNull and
        (DateValue.DataType in [ftDate, ftDateTime]) then
        DateText := FormatDateTime('dd/mm/yyyy hh:nn', DateValue.AsDateTime)
      else
        DateText := FieldText(ADataSet, DateField);
      TimelineItem(DateText, FieldText(ADataSet,TitleField), FieldText(ADataSet,TextField), St, ActionMethod, Param);
      ADataSet.Next;
    end; TimelineEnd;
  finally Guard.Free; end;
end;

function TModelDashboard.Gauge(const Title: string; Percent: Double;
  const ValueText, Status, ActionMethod, ActionParam: string): iModelDashboard;
var
  P: Double;
  S, Stroke, DisplayValue, DashArray, Html, TooltipAttr: string;
  Circumference, DashLength: Double;
begin
  Result := Self;
  P := TDashboardUtils.ClampPercent(Percent);
  Circumference := 2 * Pi * 48;
  DashLength := Circumference * P / 100;
  DashArray := TDashboardUtils.JsNumber(DashLength) + ' ' +
    TDashboardUtils.JsNumber(Circumference - DashLength);
  S := TDashboardUtils.StatusClass(Status);
  if S = 'success' then Stroke := '#28a745'
  else if S = 'warning' then Stroke := '#f0ad4e'
  else if S = 'danger' then Stroke := '#dc3545'
  else if S = 'info' then Stroke := '#17a2b8'
  else if S = 'dark' then Stroke := '#495057'
  else Stroke := '#337ab7';

  DisplayValue := FormatFloat('0', P) + '%';
  TooltipAttr := '';
  if ValueText <> '' then
    TooltipAttr := ' title="' + TDashboardUtils.AttrEncode(ValueText) + '"';
  Html := '<div class="bgdash-gauge-wrap">' +
    '<div class="bgdash-gauge-ring"' + TooltipAttr + '>' +
    '<svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">' +
    '<circle cx="60" cy="60" r="48" fill="none" stroke="#edf1f4" stroke-width="11"/>' +
    '<circle cx="60" cy="60" r="48" fill="none" stroke="' + Stroke + '" stroke-width="11" stroke-linecap="round" ' +
    'transform="rotate(-90 60 60)" stroke-dasharray="' + DashArray + '"/>' +
    '<text x="60" y="58" text-anchor="middle" class="bgdash-gauge-svg-value">' +
      TDashboardUtils.HtmlEncode(DisplayValue) + '</text>' +
    '<text x="60" y="73" text-anchor="middle" class="bgdash-gauge-svg-label">' +
      TDashboardUtils.HtmlEncode(Title) + '</text>' +
    '</svg></div></div>';
  AppendInteractiveAction(Html, ActionMethod, ActionParam);
end;


function TModelDashboard.GaugeDataSet(ADataSet: TDataSet; const Title,
  PercentField, ValueTextField, StatusField, ActionMethod, ActionParamField: string): iModelDashboard;
var Guard: TDashboardDataSetGuard; St, VText, Param: string;
begin
  Result := Self;
  if (not Assigned(ADataSet)) or (not ADataSet.Active) or ADataSet.IsEmpty or not FieldExists(ADataSet,PercentField) then Exit;
  Guard := TDashboardDataSetGuard.Create(ADataSet);
  try
    ADataSet.First; St := 'primary'; VText := '';
    if FieldExists(ADataSet,StatusField) then St := StatusFromText(FieldText(ADataSet,StatusField));
    if FieldExists(ADataSet,ValueTextField) then VText := FieldText(ADataSet,ValueTextField);
    if FieldExists(ADataSet,ActionParamField) then Param := FieldText(ADataSet,ActionParamField) else Param := '';
    Gauge(Title,FieldFloat(ADataSet,PercentField),VText,St,ActionMethod,Param);
  finally Guard.Free; end;
end;

function TModelDashboard.StatusItem(const Title: string; Percent: Double;
  const ValueText, Status, ActionMethod, ActionParam: string): iModelDashboard;
var
  P: Double;
  S, Html: string;
begin
  Result := Self;
  P := TDashboardUtils.ClampPercent(Percent);
  S := TDashboardUtils.StatusClass(Status);
  Html := '<div class="bgdash-status-item bgdash-status-' + S + '">' +
    '<div class="bgdash-status-percent">' + FormatFloat('0', P) + '%</div>' +
    '<div class="bgdash-status-title">' + TDashboardUtils.HtmlEncode(Title) + '</div>' +
    '<div class="bgdash-status-value">' + TDashboardUtils.HtmlEncode(ValueText) + '</div>' +
    '</div>';
  AppendInteractiveAction(Html, ActionMethod, ActionParam);
end;

function TModelDashboard.QuickAction(const Caption, ActionMethod, ActionParam,
  Status, Icon, HintText: string): iModelDashboard;
var
  S, Ico, Href, Html: string;
begin
  Result := Self;
  S := TDashboardUtils.StatusClass(Status);
  Ico := '';
  if Icon <> '' then
    Ico := '<span class="bgdash-quick-icon bgdash-quick-icon-' + S + '">' +
      TDashboardUtils.IconHTML(Icon, 'bgdash-quick-symbol', Caption) + '</span>';
  Href := TDashboardUtils.ActionHref(ActionMethod, ActionParam);
  Html := '<a class="bgdash-quick-action" href="' + TDashboardUtils.AttrEncode(Href) + '"';
  if HintText <> '' then
    Html := Html + ' title="' + TDashboardUtils.AttrEncode(HintText) + '"';
  Html := Html + '>' + Ico + '<span class="bgdash-quick-caption">' +
    TDashboardUtils.HtmlEncode(Caption) + '</span><span class="bgdash-quick-arrow">&#8250;</span></a>';
  AppendHTML(Html);
end;

function TModelDashboard.Sparkline(const Title, PointsCSV, ValueText,
  Status, ActionMethod, ActionParam: string): iModelDashboard;
var
  L: TStringList;
  I: Integer;
  V, MinV, MaxV, X, Y: Double;
  FS: TFormatSettings;
  Points, Stroke, S: string;
begin
  Result := Self;
  L := SplitCSV(PointsCSV);
  try
    FS := TFormatSettings.Create;
    FS.DecimalSeparator := '.';
    MinV := 0; MaxV := 0;
    for I := 0 to L.Count - 1 do
    begin
      V := StrToFloatDef(StringReplace(Trim(L[I]), ',', '.', [rfReplaceAll]), 0, FS);
      if (I = 0) or (V < MinV) then MinV := V;
      if (I = 0) or (V > MaxV) then MaxV := V;
    end;
    if SameValue(MaxV, MinV) then MaxV := MinV + 1;
    Points := '';
    for I := 0 to L.Count - 1 do
    begin
      V := StrToFloatDef(StringReplace(Trim(L[I]), ',', '.', [rfReplaceAll]), 0, FS);
      if L.Count <= 1 then X := 50 else X := (I * 100) / (L.Count - 1);
      Y := 36 - ((V - MinV) / (MaxV - MinV) * 30);
      if Points <> '' then Points := Points + ' ';
      Points := Points + TDashboardUtils.JsNumber(X) + ',' + TDashboardUtils.JsNumber(Y);
    end;
    S := TDashboardUtils.StatusClass(Status);
    if S = 'success' then Stroke := '#28a745'
    else if S = 'warning' then Stroke := '#f0ad4e'
    else if S = 'danger' then Stroke := '#dc3545'
    else if S = 'info' then Stroke := '#17a2b8'
    else if S = 'dark' then Stroke := '#495057'
    else Stroke := '#337ab7';
    AppendInteractiveAction('<div class="bgdash-line"><div class="bgdash-line-head"><div><div class="bgdash-line-title">' +
      TDashboardUtils.HtmlEncode(Title) + '</div><div class="bgdash-line-sub">' + TDashboardUtils.HtmlEncode(ValueText) +
      '</div></div><svg width="110" height="42" viewBox="0 0 100 42"><polyline fill="none" stroke="' + Stroke +
      '" stroke-width="2" points="' + Points + '"/></svg></div></div>', ActionMethod, ActionParam);
  finally
    L.Free;
  end;
end;


function TModelDashboard.SparklineDataSet(ADataSet: TDataSet; const Title,
  ValueField, ValueText, Status, ActionMethod, ActionParam: string): iModelDashboard;
var Guard:TDashboardDataSetGuard; Points:string;
begin
  Result := Self;
  if (not Assigned(ADataSet)) or (not ADataSet.Active) or not FieldExists(ADataSet,ValueField) then Exit;
  Guard := TDashboardDataSetGuard.Create(ADataSet);
  try
    Points := ''; ADataSet.First;
    while not ADataSet.Eof do begin
      if Points <> '' then Points := Points + ',';
      Points := Points + TDashboardUtils.JsNumber(FieldFloat(ADataSet,ValueField));
      ADataSet.Next;
    end;
    Sparkline(Title,Points,ValueText,Status,ActionMethod,ActionParam);
  finally Guard.Free; end;
end;

function TModelDashboard.HeatMapBegin(const Title: string): iModelDashboard;
begin
  Result := Self;
  if FHeatMapOpen then Exit;
  FHeatMapOpen := True;
  if Title <> '' then
    AppendHTML('<div class="bgdash-line-title" style="margin-bottom:8px">' + TDashboardUtils.HtmlEncode(Title) + '</div>');
  AppendHTML('<table class="bgdash-heat"><tbody>');
end;

function TModelDashboard.HeatMapHeader(const CSVLabels: string): iModelDashboard;
var
  L: TStringList;
  I: Integer;
begin
  Result := Self;
  if not FHeatMapOpen then HeatMapBegin('');
  L := SplitCSV(CSVLabels);
  try
    AppendHTML('<tr><th></th>');
    for I := 0 to L.Count - 1 do
      AppendHTML('<th>' + TDashboardUtils.HtmlEncode(Trim(L[I])) + '</th>');
    AppendHTML('</tr>');
  finally
    L.Free;
  end;
end;

function TModelDashboard.HeatMapRowBegin(const RowLabel: string): iModelDashboard;
begin
  Result := Self;
  if not FHeatMapOpen then HeatMapBegin('');
  if FHeatMapRowOpen then HeatMapRowEnd;
  FHeatMapRowOpen := True;
  AppendHTML('<tr><th>' + TDashboardUtils.HtmlEncode(RowLabel) + '</th>');
end;

function TModelDashboard.HeatMapCell(const Text: string; Level: Integer;
  const ActionMethod, ActionParam: string): iModelDashboard;
begin
  Result := Self;
  if not FHeatMapRowOpen then HeatMapRowBegin('');
  if Level < 1 then Level := 1;
  if Level > 5 then Level := 5;
  AppendHTML('<td class="bgdash-heat-cell bgdash-heat-' + IntToStr(Level) + '" title="' +
    TDashboardUtils.AttrEncode(Text) + '"><span class="bgdash-heat-value">' +
    InteractiveWrap(WrapAction(TDashboardUtils.HtmlEncode(Text), ActionMethod, ActionParam)) + '</span></td>');
end;

function TModelDashboard.HeatMapRowEnd: iModelDashboard;
begin
  Result := Self;
  if FHeatMapRowOpen then
  begin
    AppendHTML('</tr>');
    FHeatMapRowOpen := False;
  end;
end;

function TModelDashboard.HeatMapEnd: iModelDashboard;
begin
  Result := Self;
  if FHeatMapOpen then
  begin
    if FHeatMapRowOpen then HeatMapRowEnd;
    AppendHTML('</tbody></table>');
    AppendHTML('<div class="bgdash-heat-legend"><span class="bgdash-heat-legend-label">Menor valor</span>' +
      '<span class="bgdash-heat-legend-box bgdash-heat-1"></span>' +
      '<span class="bgdash-heat-legend-box bgdash-heat-2"></span>' +
      '<span class="bgdash-heat-legend-box bgdash-heat-3"></span>' +
      '<span class="bgdash-heat-legend-box bgdash-heat-4"></span>' +
      '<span class="bgdash-heat-legend-box bgdash-heat-5"></span>' +
      '<span class="bgdash-heat-legend-label">Maior valor</span></div>');
    FHeatMapOpen := False;
  end;
end;

function TModelDashboard.HeatMapDataSet(ADataSet: TDataSet; const RowField, ColumnField,
  ValueField, Title, ValueFormat, TextField, ActionMethod, ActionParamField: string): iModelDashboard;
var
  Rows, Cols: TStringList;
  Vals: array of array of Double;
  Tem: array of array of Boolean;
  Txts, Params: array of array of string;
  R, C, Level, K, Qtd: Integer;
  V: Double;
  Ordem: array of Double;
  Guard: TDashboardDataSetGuard;
  Header: string;

  { posição do valor entre os valores ordenados -> nível 1..5 (empates no mesmo nível) }
  function NivelQuintil(AValor: Double): Integer;
  var
    P: Integer;
  begin
    if (Qtd <= 1) or (Ordem[0] = Ordem[Qtd - 1]) then
      Exit(3);
    P := 0;
    while (P < Qtd) and (Ordem[P] < AValor) do
      Inc(P);
    Result := 1 + (P * 5) div Qtd;
    if Result > 5 then Result := 5;
  end;

begin
  Result := Self;
  if (not Assigned(ADataSet)) or (not ADataSet.Active) or ADataSet.IsEmpty then Exit;
  if not FieldExists(ADataSet, RowField) or not FieldExists(ADataSet, ColumnField) or
     not FieldExists(ADataSet, ValueField) then Exit;

  Rows := TStringList.Create;
  Cols := TStringList.Create;
  Guard := TDashboardDataSetGuard.Create(ADataSet);
  try
    { linhas e colunas na ordem em que aparecem }
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      if Rows.IndexOf(FieldText(ADataSet, RowField)) < 0 then Rows.Add(FieldText(ADataSet, RowField));
      if Cols.IndexOf(FieldText(ADataSet, ColumnField)) < 0 then Cols.Add(FieldText(ADataSet, ColumnField));
      ADataSet.Next;
    end;
    SetLength(Vals, Rows.Count, Cols.Count);
    SetLength(Tem, Rows.Count, Cols.Count);
    SetLength(Txts, Rows.Count, Cols.Count);
    SetLength(Params, Rows.Count, Cols.Count);

    ADataSet.First;
    while not ADataSet.Eof do
    begin
      R := Rows.IndexOf(FieldText(ADataSet, RowField));
      C := Cols.IndexOf(FieldText(ADataSet, ColumnField));
      V := FieldFloat(ADataSet, ValueField);
      Vals[R][C] := Vals[R][C] + V;
      Tem[R][C] := True;
      if FieldExists(ADataSet, TextField) then
        Txts[R][C] := FieldText(ADataSet, TextField)
      else if Trim(ValueFormat) <> '' then
        Txts[R][C] := FormatFloat(ValueFormat, Vals[R][C])
      else
        Txts[R][C] := FieldText(ADataSet, ValueField);
      if FieldExists(ADataSet, ActionParamField) then
        Params[R][C] := FieldText(ADataSet, ActionParamField);
      ADataSet.Next;
    end;
    { valores ordenados (para a faixa de cada célula) }
    Qtd := 0;
    SetLength(Ordem, Rows.Count * Cols.Count);
    for R := 0 to Rows.Count - 1 do
      for C := 0 to Cols.Count - 1 do
        if Tem[R][C] then
        begin
          K := Qtd;
          while (K > 0) and (Ordem[K - 1] > Vals[R][C]) do
          begin
            Ordem[K] := Ordem[K - 1];
            Dec(K);
          end;
          Ordem[K] := Vals[R][C];
          Inc(Qtd);
        end;

    HeatMapBegin(Title);
    Header := '';
    for C := 0 to Cols.Count - 1 do
    begin
      if C > 0 then Header := Header + ',';
      Header := Header + '"' + StringReplace(Cols[C], '"', '""', [rfReplaceAll]) + '"';
    end;
    HeatMapHeader(Header);
    for R := 0 to Rows.Count - 1 do
    begin
      HeatMapRowBegin(Rows[R]);
      for C := 0 to Cols.Count - 1 do
        if not Tem[R][C] then
          AppendHTML('<td class="bgdash-heat-cell"></td>')
        else
        begin
          Level := NivelQuintil(Vals[R][C]);
          HeatMapCell(Rows[R] + ' - ' + Cols[C] + ': ' + Txts[R][C], Level, ActionMethod, Params[R][C]);
        end;
      HeatMapRowEnd;
    end;
    HeatMapEnd;
  finally
    Guard.Free;
    Cols.Free;
    Rows.Free;
  end;
end;

function TModelDashboard.DrillDownButton(const Caption, ActionMethod,
  ActionParam, Status, Icon: string): iModelDashboard;
var S, Ico, H: string;
begin
  Result := Self;
  S := TDashboardUtils.StatusClass(Status);
  Ico := '';
  if Icon <> '' then Ico := TDashboardUtils.IconHTML(Icon, 'bgdash-button-icon', Caption) + ' ';
  H := TDashboardUtils.ActionHref(ActionMethod, ActionParam);
  if H <> '' then
    AppendHTML('<a class="bgdash-btn bgdash-btn-' + S + ' bgdash-drilldown" href="' +
      TDashboardUtils.AttrEncode(H) + '">' + Ico + TDashboardUtils.HtmlEncode(Caption) + '</a>');
end;

function TModelDashboard.CrossFilterButton(const Caption, ActionMethod,
  FilterName, FilterValue, Status, Icon: string): iModelDashboard;
var S, Ico: string;
begin
  Result := Self;
  S := TDashboardUtils.StatusClass(Status);
  Ico := '';
  if Icon <> '' then Ico := TDashboardUtils.IconHTML(Icon, 'bgdash-button-icon', Caption) + ' ';
  AppendHTML('<button type="button" class="bgdash-btn bgdash-btn-' + S + ' bgdash-crossfilter" onclick="return bgdashCrossFilter(''' +
    TDashboardUtils.AttrEncode(ActionMethod) + ''',''' + TDashboardUtils.AttrEncode(FilterName) + ''',''' +
    TDashboardUtils.AttrEncode(FilterValue) + ''');">' + Ico + TDashboardUtils.HtmlEncode(Caption) + '</button>');
end;

function TModelDashboard.&End: iModelHTML;
begin
  if FModalOpen then ModalEnd;
  if FTabPaneOpen then TabPaneEnd;
  if FTabsOpen then TabsEnd;
  if FFilterBarOpen then FilterBarEnd;
  if FStepperOpen then StepperEnd;
  if FHeatMapOpen then HeatMapEnd;
  if FTimelineOpen then TimelineEnd;
  if FRankingOpen then RankingEnd;
  if FFunnelOpen then FunnelEnd;
  Result := FParent;
end;

end.
