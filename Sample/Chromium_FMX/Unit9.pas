unit Unit9;

interface

uses
  {$IFDEF MSWINDOWS}
    Winapi.Windows,
    Winapi.Messages,
  {$ENDIF}
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  uCEFChromiumCore, uCEFFMXChromium, FMX.StdCtrls, FMX.Controls.Presentation,
  uCEFFMXWindowParent, View.WebCharts, Data.DB, Datasnap.DBClient,
  uCEFInterfaces, uCEFTypes;
const
  CEF_SHOWBROWSER = WM_APP + $101;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    FMXChromium1: TFMXChromium;
    WebCharts1: TWebCharts;
    ClientDataSet8: TClientDataSet;
    ClientDataSet8OrderNo: TFloatField;
    ClientDataSet8CustNo: TFloatField;
    ClientDataSet8SaleDate: TDateTimeField;
    ClientDataSet8ShipDate: TDateTimeField;
    ClientDataSet8EmpNo: TIntegerField;
    ClientDataSet8ShipToContact: TStringField;
    ClientDataSet8ShipToAddr1: TStringField;
    ClientDataSet8ShipToAddr2: TStringField;
    ClientDataSet8ShipToCity: TStringField;
    ClientDataSet8ShipToState: TStringField;
    ClientDataSet8ShipToZip: TStringField;
    ClientDataSet8ShipToCountry: TStringField;
    ClientDataSet8ShipToPhone: TStringField;
    ClientDataSet8ShipVIA: TStringField;
    ClientDataSet8PO: TStringField;
    ClientDataSet8Terms: TStringField;
    ClientDataSet8PaymentMethod: TStringField;
    ClientDataSet8ItemsTotal: TCurrencyField;
    ClientDataSet8TaxRate: TFloatField;
    ClientDataSet8Freight: TCurrencyField;
    ClientDataSet8AmountPaid: TCurrencyField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FMXChromium1Close(Sender: TObject; const browser: ICefBrowser;
      var aAction: TCefCloseBrowserAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FMXChromium1BeforeClose(Sender: TObject;
      const browser: ICefBrowser);
  private
    { Private declarations }
    FPivotConfig : string;
  public
    { Public declarations }
    procedure NotifyMoveOrResizeStarted;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;
    procedure btnPivotConfigSave;
    procedure PivotConfigSave(value : string);
    procedure PivotConfigLoad;
    procedure PivotShowUI;
    procedure PivotHideUI;

  protected
    FCanClose : boolean;
    FClosing  : boolean;

    FMXWindowParent         : TFMXWindowParent;

    {$IFDEF MSWINDOWS}
      FCustomWindowState      : TWindowState;
      FOldWndPrc              : TFNWndProc;
      FFormStub               : Pointer;
    {$ENDIF}

    procedure ResizeChild;
    procedure CreateFMXWindowParent;
    function  GetFMXWindowParentRect : System.Types.TRect;
    function  PostCustomMessage(aMsg : cardinal; aWParam : WPARAM = 0; aLParam : LPARAM = 0) : boolean;

    {$IFDEF MSWINDOWS}
      function  GetCurrentWindowState : TWindowState;
      procedure UpdateCustomWindowState;
      procedure CreateHandle; override;
      procedure DestroyHandle; override;
      procedure CustomWndProc(var aMessage: TMessage);
    {$ENDIF}

  end;

var
  Form9: TForm9;

implementation

uses
  Charts.Types,
  uCEFApplication,
  uCEFConstants,
  uCEFMiscFunctions,
  FMX.Platform.Win;

{$R *.fmx}

{ TForm9 }

procedure TForm9.btnPivotConfigSave;
begin
  WebCharts1.ContinuosProject
    .WindowParent(FMXWindowParent)
    .WebBrowser(FMXChromium1)
    .PivotTable.SaveConfig(PivotConfigSave);

end;

procedure TForm9.Button1Click(Sender: TObject);
begin
  WebCharts1
  .Container(fluid)
  .NewProject
    .Jumpline
    .Rows
      ._Div
        .Add('<h1>Pivot Table</h1>')
        .ColSpan(7)
      .&End
      ._Div
        .ColSpan(5)
        .Add(
          WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Save Config')
                .CallbackLink('','btnPivotConfigSave')
                .ButtonClass
                  .success
                  .small
                .&End
              .&End
            .HTML +
            '&nbsp;' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Load Config')
                .CallbackLink('','PivotConfigLoad')
                .ButtonClass
                  .primary
                  .small
                .&End
              .&End
            .HTML +
            '&nbsp;' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Show UI')
                .CallbackLink('','PivotShowUI')
                .ButtonClass
                  .secondary
                  .small
                .&End
              .&End
            .HTML +
            '&nbsp;' +
            WebCharts1
            .ContinuosProject
              .Buttons
                .Title('Hide UI')
                .CallbackLink('','PivotHideUI')
                .ButtonClass
                  .info
                  .small
                .&End
              .&End
            .HTML

        )
      .&End
    .&End
    .Jumpline
    .PivotTable
      .Attributes
        .DataSet
          .DataSet(ClientDataSet8)
        .&End
        .ConfigBackgroundColor('#b0ceeb')
        .PivotType
          .Tabela
        .&End
        .ConfigHeadStyle
//          .BackgroundColor('#faee7f')
//          .FontColor('#8d0101')
//          .FontSize(20)
        .&End

        .ConfigBodyStyle
//          .BackgroundColor('#bdbdbd')
//          .FontColor('#ffffff')
//          .FontSize(20)
         .&End
        .Rows
          .Add('Transportadora')
        .&End
        .Cols
          .Add('Forma de Pagamento')
        .&End
      .&End
    .&End
    .WindowParent(FMXWindowParent)
    .WebBrowser(FMXChromium1)
  .CallbackJS
    .ClassProvider(Self)
  .&End
  .Generated;
end;

procedure TForm9.CreateFMXWindowParent;
begin
  if (FMXWindowParent = nil) then
    begin
      FMXWindowParent := TFMXWindowParent.CreateNew(nil);
      FMXWindowParent.Reparent(Handle);
      ResizeChild;
      FMXWindowParent.Show;
    end;

end;

{$IFDEF MSWINDOWS}
function TForm9.GetCurrentWindowState: TWindowState;
var
  TempPlacement : TWindowPlacement;
  TempHWND      : HWND;
begin
  Result   := TWindowState.wsNormal;
  TempHWND := FmxHandleToHWND(Handle);

  ZeroMemory(@TempPlacement, SizeOf(TWindowPlacement));
  TempPlacement.Length := SizeOf(TWindowPlacement);

  if GetWindowPlacement(TempHWND, @TempPlacement) then
    case TempPlacement.showCmd of
      SW_SHOWMAXIMIZED : Result := TWindowState.wsMaximized;
      SW_SHOWMINIMIZED : Result := TWindowState.wsMinimized;
    end;

  if IsIconic(TempHWND) then Result := TWindowState.wsMinimized;
end;

procedure TForm9.UpdateCustomWindowState;
var
  TempNewState : TWindowState;
begin
  TempNewState := GetCurrentWindowState;

  if (FCustomWindowState <> TempNewState) then
    begin
      if (FCustomWindowState = TWindowState.wsMinimized) then
        PostCustomMessage(CEF_SHOWBROWSER);

      FCustomWindowState := TempNewState;
    end;
end;

procedure TForm9.CreateHandle;
begin
  inherited CreateHandle;

  FFormStub  := MakeObjectInstance(CustomWndProc);
  FOldWndPrc := TFNWndProc(SetWindowLongPtr(FmxHandleToHWND(Handle), GWLP_WNDPROC, NativeInt(FFormStub)));
end;

procedure TForm9.DestroyHandle;
begin
  SetWindowLongPtr(FmxHandleToHWND(Handle), GWLP_WNDPROC, NativeInt(FOldWndPrc));
  FreeObjectInstance(FFormStub);

  inherited DestroyHandle;
end;

procedure TForm9.CustomWndProc(var aMessage: TMessage);
const
  SWP_STATECHANGED = $8000;
var
  TempWindowPos : PWindowPos;
begin
  try
    case aMessage.Msg of
      WM_ENTERMENULOOP :
        if (aMessage.wParam = 0) and
           (GlobalCEFApp <> nil) then
          GlobalCEFApp.OsmodalLoop := True;

      WM_EXITMENULOOP :
        if (aMessage.wParam = 0) and
           (GlobalCEFApp <> nil) then
          GlobalCEFApp.OsmodalLoop := False;

      WM_MOVE,
      WM_MOVING : NotifyMoveOrResizeStarted;

      WM_SIZE :
        if (aMessage.wParam = SIZE_RESTORED) then
          UpdateCustomWindowState;

      WM_WINDOWPOSCHANGING :
        begin
          TempWindowPos := TWMWindowPosChanging(aMessage).WindowPos;
          if ((TempWindowPos.Flags and SWP_STATECHANGED) <> 0) then
            UpdateCustomWindowState;
        end;

      WM_SHOWWINDOW :
        if (aMessage.wParam <> 0) and (aMessage.lParam = SW_PARENTOPENING) then
          PostCustomMessage(CEF_SHOWBROWSER);

      CEF_DESTROY :
        if (FMXWindowParent <> nil) then
          FreeAndNil(FMXWindowParent);

      CEF_SHOWBROWSER :
        if (FMXWindowParent <> nil) then
          begin
            FMXWindowParent.WindowState := TWindowState.wsNormal;
            FMXWindowParent.Show;
            FMXWindowParent.SetBounds(GetFMXWindowParentRect);
          end;
    end;

    aMessage.Result := CallWindowProc(FOldWndPrc, FmxHandleToHWND(Handle), aMessage.Msg, aMessage.wParam, aMessage.lParam);
  except
    on e : exception do
      if CustomExceptionHandler('TForm9.CustomWndProc', e) then raise;
  end;
end;
{$ENDIF}

procedure TForm9.FMXChromium1BeforeClose(Sender: TObject;
  const browser: ICefBrowser);
begin
  FCanClose := True;
  PostCustomMessage(WM_CLOSE);
end;

procedure TForm9.FMXChromium1Close(Sender: TObject; const browser: ICefBrowser;
  var aAction: TCefCloseBrowserAction);
begin
  PostCustomMessage(CEF_DESTROY);
  aAction := cbaDelay;
end;

procedure TForm9.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FCanClose;

  if not(FClosing) then
    begin
      FClosing := True;
      Visible  := False;
      FMXChromium1.CloseBrowser(True);
    end;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TForm9.FormResize(Sender: TObject);
begin
  ResizeChild;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  CreateFMXWindowParent;
end;

function TForm9.GetFMXWindowParentRect: System.Types.TRect;
var
  TempScale : single;
begin
  TempScale     := FMXChromium1.ScreenScale;
  Result.Left   := 0;
  Result.Top    := 0;
  Result.Right  := round(ClientWidth  * TempScale) - 1;
  Result.Bottom := round((ClientHeight - panel2.Height) * TempScale) - 1;
end;

procedure TForm9.NotifyMoveOrResizeStarted;
begin
  if (FMXChromium1 <> nil) then FMXChromium1.NotifyMoveOrResizeStarted;
end;

procedure TForm9.PivotConfigLoad;
begin
  if not FPivotConfig.IsEmpty then
    WebCharts1.ContinuosProject
      .WindowParent(FMXWindowParent)
      .WebBrowser(FMXChromium1)
      .PivotTable.LoadConfig(FPivotConfig);

end;

procedure TForm9.PivotConfigSave(value: string);
begin
  FPivotConfig := Value;

end;

procedure TForm9.PivotHideUI;
begin
  WebCharts1.ContinuosProject
    .WindowParent(FMXWindowParent)
    .WebBrowser(FMXChromium1)
    .PivotTable.HideUI;

end;

procedure TForm9.PivotShowUI;
begin
  WebCharts1.ContinuosProject
    .WindowParent(FMXWindowParent)
    .WebBrowser(FMXChromium1)
    .PivotTable.ShowUI;
end;

function TForm9.PostCustomMessage(aMsg: cardinal; aWParam: WPARAM;
  aLParam: LPARAM): boolean;
{$IFDEF MSWINDOWS}
var
  TempHWND : HWND;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  TempHWND := FmxHandleToHWND(Handle);
  Result   := (TempHWND <> 0) and WinApi.Windows.PostMessage(TempHWND, aMsg, aWParam, aLParam);
{$ELSE}
  Result   := False;
{$ENDIF}
end;

procedure TForm9.ResizeChild;
begin
  if (FMXWindowParent <> nil) then
    FMXWindowParent.SetBounds(GetFMXWindowParentRect);
end;

procedure TForm9.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  PositionChanged: Boolean;
begin
  PositionChanged := (ALeft <> Left) or (ATop <> Top);
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  if PositionChanged then
    NotifyMoveOrResizeStarted;
end;

end.
