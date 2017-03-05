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
    procedure IdTCPServer1Connect(AThread: TIdPeerThread);
    procedure IdTCPServer1testCommand(ASender: TIdCommand);
    procedure IdTCPServer1mouseejectCommand(ASender: TIdCommand);
    procedure IdTCPServer1mouse_injectCommand(ASender: TIdCommand);
    procedure IdTCPServer1readPcNameCommand(ASender: TIdCommand);
    procedure Button1Click(Sender: TObject);
    procedure IdTCPServer1get_ipCommand(ASender: TIdCommand);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure IdTCPServer1Execute(AThread: TIdPeerThread);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function dtstamp():string;
begin
  Result := DateToStr(Date()) + ' - ' + TimeToStr(Now());
end;

function getConnectionInfo(ASender: TIdCommand):string;
begin

  Result := ' ' +  ASender.Thread.Connection.Socket.Binding.IP + ' - ' +
  IntToStr(ASender.Thread.Connection.Socket.Binding.Port);
end;
procedure log(cmd:string;res:string);
var ListItem:TListItem;
begin
try
    Form1.ListView1.Items.BeginUpdate;
    //ListView1.Visible := false;
    //while (not SQLQuery1.EOF) do begin
      //Code borrowed from @Serg
      ListItem:= Form1.ListView1.Items.Add;
      ListItem.Caption:= cmd;
      ListItem.SubItems.Add(res);
      ListItem.SubItems.Add(dtstamp());
    //end; {while}
  finally
    Form1.ListView1.Items.EndUpdate;
  end;
end;

procedure TForm1.IdTCPServer1Connect(AThread: TIdPeerThread);
begin
  Form1.Caption := 'connected';
end;

procedure TForm1.IdTCPServer1testCommand(ASender: TIdCommand);
begin
  log('tested' , getConnectionInfo(ASender));
end;

procedure TForm1.IdTCPServer1mouseejectCommand(ASender: TIdCommand);
begin
  log('m_ejct' , getConnectionInfo(ASender));

end;

procedure TForm1.IdTCPServer1mouse_injectCommand(ASender: TIdCommand);
begin
  log('mouse inject' , getConnectionInfo(ASender));
end;

procedure TForm1.IdTCPServer1readPcNameCommand(ASender: TIdCommand);
begin
  log('read pc name: ' , 'server name is ' + idTCPServer1.LocalName);
  ASender.Thread.Connection.WriteLn('server name is ' + idTCPServer1.LocalName);
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
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IdTCPServer1.Active:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage(DateToStr(Date()) + ' - ' + TimeToStr(Now()));
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
  end
 else
  begin
    Form1.IdTCPServer1.Active:=false;
    Form1.Button3.Caption:='Не активен';
  end;
end; // e if active

procedure TForm1.IdTCPServer1Execute(AThread: TIdPeerThread);
begin
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

end.
