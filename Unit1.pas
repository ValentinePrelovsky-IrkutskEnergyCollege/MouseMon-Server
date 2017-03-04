unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, StdCtrls,SyncObjs ;

type
  TForm1 = class(TForm)
    Button1: TButton;
    IdTCPServer1: TIdTCPServer;
    Memo1: TMemo;
    procedure IdTCPServer1Connect(AThread: TIdPeerThread);
    procedure IdTCPServer1testCommand(ASender: TIdCommand);
    procedure IdTCPServer1mouseejectCommand(ASender: TIdCommand);
    procedure IdTCPServer1mouse_injectCommand(ASender: TIdCommand);
    procedure IdTCPServer1readPcNameCommand(ASender: TIdCommand);
    procedure Button1Click(Sender: TObject);
    procedure IdTCPServer1get_ipCommand(ASender: TIdCommand);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.IdTCPServer1Connect(AThread: TIdPeerThread);
begin
  Form1.Caption := 'connected';
end;

procedure TForm1.IdTCPServer1testCommand(ASender: TIdCommand);
begin
  Form1.Memo1.Lines.Add('tested');
end;

procedure TForm1.IdTCPServer1mouseejectCommand(ASender: TIdCommand);
begin
  Form1.Memo1.Lines.Add('m_ejct');
end;

procedure TForm1.IdTCPServer1mouse_injectCommand(ASender: TIdCommand);
begin
  Form1.Memo1.Lines.Add('mouse inject');
end;

procedure TForm1.IdTCPServer1readPcNameCommand(ASender: TIdCommand);
begin
  Form1.Memo1.Lines.Add('read pc name: ' + 'server name is ' + idTCPServer1.LocalName);
  ASender.Thread.Connection.WriteLn('server name is ' + idTCPServer1.LocalName);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.Memo1.Lines.Clear;
end;



procedure TForm1.IdTCPServer1get_ipCommand(ASender: TIdCommand);
begin
  Memo1.Lines.Add('binding peer ip: ' + ASender.Thread.Connection.Socket.Binding.PeerIP);
  Asender.Thread.Connection.WriteLn(ASender.Thread.Connection.Socket.Binding.PeerIP);
  ShowMessage(ASender.Thread.Connection.Socket.Binding.IP);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  IdTCPServer1.Active:=true;
end;

end.
