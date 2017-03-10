unit MyUtils;

interface

function getAppPath():string;
function getFullAppName():string;

implementation

function getAppPath():string;
var s:string;
begin
  System.GetDir(0,s);
  Result :=s;
end;

function getFullAppName():string;
begin
  ParamStr(0);
end;
end.
