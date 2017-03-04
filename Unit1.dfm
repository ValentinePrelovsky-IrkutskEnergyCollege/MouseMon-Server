object Form1: TForm1
  Left = 192
  Top = 124
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 24
    Width = 113
    Height = 41
    Caption = 'clear it!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 104
    Width = 257
    Height = 129
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object IdTCPServer1: TIdTCPServer
    Active = True
    Bindings = <
      item
        IP = '127.0.0.1'
        Port = 6000
      end>
    CommandHandlers = <
      item
        CmdDelimiter = ' '
        Command = 'test'
        Disconnect = False
        Name = 'test'
        OnCommand = IdTCPServer1testCommand
        ParamDelimiter = ' '
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end
      item
        CmdDelimiter = ' '
        Command = 'mouse_eject'
        Disconnect = False
        Name = 'mouse-eject'
        OnCommand = IdTCPServer1mouseejectCommand
        ParamDelimiter = ' '
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 200
        ReplyNormal.Text.Strings = (
          'eject_reply')
        ReplyNormal.TextCode = '200'
        Response.Strings = (
          'ejct response')
        Tag = 0
      end
      item
        CmdDelimiter = ' '
        Command = 'mouse_inject'
        Disconnect = False
        Name = 'mouse_inject'
        OnCommand = IdTCPServer1mouse_injectCommand
        ParamDelimiter = ' '
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end
      item
        CmdDelimiter = ' '
        Command = 'read_pc_name'
        Disconnect = False
        Name = 'readPcName'
        OnCommand = IdTCPServer1readPcNameCommand
        ParamDelimiter = ' '
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end
      item
        CmdDelimiter = ' '
        Command = 'get_ip'
        Disconnect = False
        Name = 'get_ip'
        OnCommand = IdTCPServer1get_ipCommand
        ParamDelimiter = ' '
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end>
    DefaultPort = 6000
    Greeting.NumericCode = 200
    Greeting.Text.Strings = (
      'Connection grades')
    Greeting.TextCode = '200'
    MaxConnectionReply.NumericCode = 0
    MaxConnections = 5
    OnConnect = IdTCPServer1Connect
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 404
    ReplyUnknownCommand.Text.Strings = (
      'I don'#39't know your command')
    ReplyUnknownCommand.TextCode = '404'
    Left = 160
    Top = 24
  end
end
