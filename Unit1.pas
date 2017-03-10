unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, StdCtrls,SyncObjs,
  ComCtrls, Menus,Clipbrd ;

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
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
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
    procedure IdTCPServer1get_nameCommand(ASender: TIdCommand);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  logFile:TextFile;
  clientName:string;

implementation

{$R *.dfm}

function dtstamp():string;
begin
  Result := DateToStr(Date()) + ' - ' + TimeToStr(Now());
end;

function getConnectionInfo(ASender: TIdCommand):string;
begin
  Result := ASender.Thread.Connection.Socket.Binding.PeerIP + clientName;
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
    WriteLn(logFile,cmd + ' - ',res + ' - ',dtstamp());
    Flush(logFile);
  end;
end;

procedure TForm1.IdTCPServer1Connect(AThread: TIdPeerThread);
begin
  Form1.Caption := '���������� �����������';
end;

procedure TForm1.IdTCPServer1testCommand(ASender: TIdCommand);
begin
  //clientName := ASender.Thread.Connection.ReadLn();
  log('���������� �����������' , clientName);
end;

procedure TForm1.IdTCPServer1mouseejectCommand(ASender: TIdCommand);
begin
  //ASender.Thread.Connection.WriteLn(ASender.Thread.Connection.LocalName);
  log('���� ���������' , clientName);
end;

procedure TForm1.IdTCPServer1mouse_injectCommand(ASender: TIdCommand);
begin
  //ASender.Thread.Connection.WriteLn(ASender.Thread.Connection.LocalName);

  //log('���� ����������' , getConnectionInfo(ASender));
  log('���� ����������' , clientName);
end;

procedure TForm1.IdTCPServer1readPcNameCommand(ASender: TIdCommand);
begin
  log('������� ���: ' , '��� �������: ' + idTCPServer1.LocalName);
  log((ASender.Thread.Connection.Socket.Binding.IP) ,  ASender.Thread.Connection.Socket.Binding.PeerIP);
  ASender.Thread.Connection.WriteLn('��� �������: ' + idTCPServer1.LocalName);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.ListView1.Clear;
end;

procedure TForm1.IdTCPServer1get_ipCommand(ASender: TIdCommand);
begin
  log('�������� �����: ' , ASender.Thread.Connection.Socket.Binding.PeerIP);
  Asender.Thread.Connection.WriteLn(ASender.Thread.Connection.Socket.Binding.PeerIP);
  //ShowMessage(ASender.Thread.Connection.Socket.Binding.IP);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption := '������';
  Form1.Button3.Caption:='�������';
  IdTCPServer1.Active:=true;
  AssignFile(logFile,'log.txt');
  // if (FileExists('log.txt') = false)then  Rewrite(logFile) else Append(logFile);
  Rewrite(logFile);
  log('������ ������� ','������ ������� ');
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
    Form1.Button3.Caption:='�������';
    log('������ ������� ','������ ������� ');
  end
 else
  begin
    Form1.IdTCPServer1.Active:=false;
    Form1.Button3.Caption:='�� �������';
    log('��������� ������� ','������ ���������� ');
  end;
end; // e if active

procedure TForm1.IdTCPServer1Execute(AThread: TIdPeerThread);
begin
  //ShowMessage(IntToStr(AThread.Connection.Socket.Binding.Port));
  case AThread.Connection.Socket.Binding.Port of
    6000: begin
      log('����������: port 6000' , ' ������');
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
  log('��������� ������� ','������ ���������� ');
  CloseFile(logFile);
end;

procedure TForm1.SaveAs1Click(Sender: TObject);
var b:boolean; path:string;
var Streaml, Stream2: TFileStream;
begin
  b:=SaveDialog1.Execute;
  if (b = true) then
  begin
    path := Trim(SaveDialog1.FileName);
    if(ExtractFileName(path) = 'log.txt') then
    begin
    ShowMessage('���� ���� ��� ����, ��� ���������� ����� �������� ������ '+
      '��� ����� ��� ��� ������������');
      Exit;
    end;
    closeFile(logFile); // close log file temporarily

    try
      Streaml := TFileStream.Create('log.txt', fmOpenRead);
      Stream2 := TFileStream.Create(path, fmCreate);
      Stream2.Seek(0, soFromEnd); // set file position at the end of file
      Stream2.CopyFrom(Streaml, Streaml.Size);
    finally
      Streaml.Free;
      Stream2.Free;
      AssignFile(logFile,'log.txt'); // open closed log (restore the closed log)
      Append(logFile); // Open log file in appending file mode
    end;
  end;// b = true
end;

procedure TForm1.IdTCPServer1get_nameCommand(ASender: TIdCommand);
var loc:string;
begin
  clientName:=ASender.Thread.Connection.ReadLn();
  //ASender.Thread.Connection.WriteLn('� ������: ' + loc);
  //log('� ������: ' , clientName);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  ShowMessage('������ ���������-������ ����������� � ������� ��������'
  + ' � ������ �� �������� ������������ ��� ������������� ���� �'+
  ' ������������� ��.'+#10#13#10#13+
  '������� ������� (��������� ��� ������������ ����' + ' + ��� �� � ����,'+
  ' � �������� �������� �������'+#10#13+'����� ��������� �������, � �� �������');
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  ShowMessage('����� ���������: ���������� ��������' + #10#13 +  #10#13+
  '����� ��������� ���������, ��������� ���� �������� �� �����.'+#10#13+#10#13+
  '��������� ��������� � ������ ���������� ������' +' ������� ������������'+
  ' ����������� �� ������ ��������� �� ����������� �����: ' +
  'prelovskyvalentine@gmail.com' + #10#13#10#13#10#13+
  #9#9#9#9 + '(�) ���������� ��������, 2017');
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  Clipboard.SetTextBuf('prelovskyvalentine@gmail.com');
end;

end.
