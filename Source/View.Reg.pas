unit View.Reg;

interface

uses
  Classes;

procedure Register;

implementation

{$R TWebCharts.dcr}

uses
  View.WebCharts;

procedure Register;
begin
     RegisterComponents('TBG WebCharts', [TWebCharts]);
end;

end.
