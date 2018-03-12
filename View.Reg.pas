unit View.Reg;

interface

uses
  System.Classes;

procedure Register;

implementation

uses
  View.WebCharts;

procedure Register;
begin
     RegisterComponents('TBG WebCharts', [TWebCharts]);
end;

end.
