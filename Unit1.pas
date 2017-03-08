unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, StdCtrls,SyncObjs,
  ComCtrls, Menus ;

type
  TForm1 = class(TForm)
    IdTCPServer1: TIdTCPServer;
    Button3: TButton;
    Label1: TLabel;
    ListView1: TListView;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    SaveAs1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure IdTCPServer1Connect(AThread: TIdPeerThread);
    procedure IdTCPServer1testCommand(ASender: TIdCommand);
    procedure IdTCPServer1mouseejectCommand(ASender: TIdCommand);
    procedure IdTCPServer1mouse_injectCommand(ASender: TIdCommand);
    procedure IdTCPServer1readPcNameCommand(ASender: TIdCommand);
    procedure Button1Click(Sender: TObject);
    procedure IdTCPServer1get_ipCommand(ASender: TIdCommand);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure IdTCPServer1Execute(AThread: TIdPeerThread);
    procedure N5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SaveAs1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  logFile:TextFile;

implementation

{$R *.dfm}

function dtstamp():string;
begin
  Result := DateToStr(Date()) + ' - ' + TimeToStr(Now());
end;

function getConnectionInfo(ASender: TIdCommand):string;
begin
  // Form1.Caption:=  (ASender.Thread.Connection.Socket.SocksInfo.LocalName);
  Result := ' ' +  ASender.Thread.Connection.Socket.Binding.PeerIP + ' - ' +
  (ASender.Thread.Connection.LocalName);
end;
procedure log(cmd:string;res:string);
var ListItem:TListItem;
begin
try
    Form1.ListView1.Items.BeginUpdate;
      //Code borrowed from @Serg
      ListItem:= Form1.ListView1.Items.Add;
      ListItem.Caption:= cmd;
      ListItem.SubItems.Add(res);
      ListItem.SubItems.Add(dtstamp());
  finally
    Form1.ListView1.Items.EndUpdate;
    WriteLn(logFile,cmd,res,dtstamp());
    Flush(logFile);
  end;
end;

procedure TForm1.IdTCPServer1Connect(AThread: TIdPeerThread);
begin
  Form1.Caption := 'Соединение установлено';
end;

procedure TForm1.IdTCPServer1testCommand(ASender: TIdCommand);
begin
  log('Соединение установлено' , getConnectionInfo(ASender));
end;

procedure TForm1.IdTCPServer1mouseejectCommand(ASender: TIdCommand);
begin
  log('Мышь извлечена' , getConnectionInfo(ASender));

end;

procedure TForm1.IdTCPServer1mouse_injectCommand(ASender: TIdCommand);
begin
  ASender.Thread.Connection.WriteLn(ASender.Thread.Connection.LocalName);
  
  log('Вставлена мышь' , getConnectionInfo(ASender));
end;

procedure TForm1.IdTCPServer1readPcNameCommand(ASender: TIdCommand);
begin
  log('read pc name: ' , 'Имя сервера ' + idTCPServer1.LocalName);
  log((ASender.Thread.Connection.Socket.Binding.IP) ,  ASender.Thread.Connection.Socket.Binding.PeerIP);
  ASender.Thread.Connection.WriteLn('Имя сервера ' + idTCPServer1.LocalName);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.ListView1.Clear;
end;



procedure TForm1.IdTCPServer1get_ipCommand(ASender: TIdCommand);
begin
  log('binding peer ip: ' , ASender.Thread.Connection.Socket.Binding.PeerIP);
  Asender.Thread.Connection.WriteLn(ASender.Thread.Connection.Socket.Binding.PeerIP);
  //ShowMessage(ASender.Thread.Connection.Socket.Binding.IP);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption := 'СЕРВЕР';
  Form1.Button3.Caption:='Активен';
  IdTCPServer1.Active:=true;
  AssignFile(logFile,'log.txt');
  if (FileExists('log.txt') = false)then  Rewrite(logFile) else Append(logFile);
  log('Запуск ','сервера ');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IdTCPServer1.Active:=false;
end;

procedure setServerStatus(b:boolean);
begin
  Form1.IdTCPServer1.Active:=b;
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
 if (Form1.IdTCPServer1.Active = false)then
  begin
    Form1.IdTCPServer1.Active:=true;
    Form1.Button3.Caption:='Активен';
    log('Запуск ','сервера ');
  end
 else
  begin
    Form1.IdTCPServer1.Active:=false;
    Form1.Button3.Caption:='Не активен';
    log('Останов ','сервера ');
  end;
end; // e if active

procedure TForm1.IdTCPServer1Execute(AThread: TIdPeerThread);
begin
  //ShowMessage(IntToStr(AThread.Connection.Socket.Binding.Port));
  case AThread.Connection.Socket.Binding.Port of
    6000: begin
      log('execute: port 6000' , ' fault>');
    end;
    2001: begin
      // do something else...
    end;
    2002: begin
      // do yet something else ...
    end;
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Form1.ListView1.Clear;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  log('Останов ','сервера ');
  CloseFile(logFile);
end;

procedure TForm1.SaveAs1Click(Sender: TObject);
var b:boolean; path:string;
begin
  b:=SaveDialog1.Execute;
  if (b = true) then
  begin
    path := Trim(SaveDialog1.FileName);
    closeFile(logFile);
    AssignFile(logFile,path);
    Rewrite(logFile);

//    if (ExtractFileExt(path) = '')then
 //   ShowMessage(path);

    //ShowMessage(ExtractFileExt(path));
  end;// b = true
end;

end.
