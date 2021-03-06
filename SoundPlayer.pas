unit SoundPlayer;

interface
uses mmsystem, MyUtils;

type TSoundPlayer = class(TObject)
  path_soundDevIn:string;
  path_soundDevOut:string;
  path_soundStart:string;
  path_soundStop:string;

  Constructor Create();

  function playSound(pszSound:string; hmod:HINST; fdwSound:Cardinal):boolean;
  function playDevIn():boolean;
  function playDevOut():boolean;
  procedure p();
end;

implementation
Constructor TSoundPlayer.Create();
begin
  Inherited Create();
  path_soundDevIn := getAppPath() + '\media\dev_in.wav';
  path_soundDevOut := getAppPath() + '\media\dev_out.wav';
  path_soundStart := getAppPath() + '\media\start.wav';
  path_soundStop := getAppPath() + '\media\stop.wav';
end;

function TSoundPlayer.playSound(pszSound:string; hmod:HINST; fdwSound:Cardinal):boolean;
const fromResources = 0;
// yoy can combine those flags using "or"
// SND_ASYNC,
// SND_LOOP only with SND ASYNC,
// SND_NOSTOP,
// SND_PURGE, it stops any sound playing called in this task
// SND_SYNC
begin
  try
    Result := PlaySound(System.PAnsiChar(pszSound),0,SND_ASYNC);
  except
    Result := false;
  end;
end;

function  TSoundPlayer.playDevOut():boolean;
begin
  Result := Self.playSound(path_soundDevOut,0,SND_ASYNC);
end;
function  TSoundPlayer.playDevIn():boolean;
begin
  Result := PlaySound(PAnsiChar(path_soundDevIn),0,SND_ASYNC);
end;

procedure TSoundPlayer.p();
begin
  PlaySound(PAnsiChar(path_soundDevIn),0,SND_ASYNC);
end;

end.
