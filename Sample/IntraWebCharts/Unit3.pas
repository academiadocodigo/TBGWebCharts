unit Unit3;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Vcl.Controls,
  Vcl.Forms, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion, IWBSCustomRegion, IWBSNavBar, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWHTMLControls,
  IWBSCustomControl, IWBSControls, IWBS4BaseContainer, IWBS4Progress,
  IWCompLabel, IWCompMemo;

type
  TIWForm3 = class(TIWAppForm)
    IWURLWindow1: TIWURLWindow;
    IWLabel1: TIWLabel;
    IWMemo1: TIWMemo;
  public
  end;

implementation

{$R *.dfm}


initialization
  TIWForm3.SetAsMainForm;

end.
