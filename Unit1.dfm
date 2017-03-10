object Form1: TForm1
  Left = 233
  Top = 211
  Width = 752
  Height = 471
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 8
    Width = 159
    Height = 24
    Caption = #1046#1091#1088#1085#1072#1083' '#1076#1077#1081#1089#1090#1074#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 312
    Top = 16
    Width = 168
    Height = 24
    Caption = #1057#1058#1040#1058#1059#1057' '#1057#1045#1056#1042#1045#1056#1040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button3: TButton
    Left = 488
    Top = 8
    Width = 97
    Height = 41
    Caption = 'disconnect'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button3Click
  end
  object ListView1: TListView
    Left = 0
    Top = 56
    Width = 721
    Height = 345
    Columns = <
      item
        AutoSize = True
        Caption = #1050#1086#1084#1072#1085#1076#1072
      end
      item
        AutoSize = True
        Caption = #1042#1099#1074#1086#1076' '#1082#1086#1084#1072#1085#1076#1099
      end
      item
        AutoSize = True
        Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1089#1086#1073#1099#1090#1080#1103
      end>
    TabOrder = 1
    ViewStyle = vsReport
  end
  object IdTCPServer1: TIdTCPServer
    Active = True
    Bindings = <>
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
      end
      item
        CmdDelimiter = ' '
        Command = 'get_name'
        Disconnect = False
        Name = 'get_name'
        OnCommand = IdTCPServer1get_nameCommand
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
    ListenQueue = 50
    MaxConnectionReply.NumericCode = 0
    MaxConnections = 40
    OnConnect = IdTCPServer1Connect
    OnExecute = IdTCPServer1Execute
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 404
    ReplyUnknownCommand.Text.Strings = (
      'I don'#39't know your command')
    ReplyUnknownCommand.TextCode = '404'
    Left = 280
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 616
    Top = 16
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object SaveAs1: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1086#1087#1080#1102' '#1078#1091#1088#1085#1072#1083#1072' '#1082#1072#1082
        OnClick = SaveAs1Click
      end
      object N4: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N4Click
      end
    end
    object N2: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082
      object N5: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        OnClick = N5Click
      end
    end
    object N3: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N3Click
    end
    object N6: TMenuItem
      Caption = #1040#1074#1090#1086#1088
      object N7: TMenuItem
        Caption = #1040#1074#1090#1086#1088' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1095#1090#1091' '#1072#1074#1090#1086#1088#1072' '#1074' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
        OnClick = N8Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    FileName = 'C:\Users\Valentin\Desktop\srv\'#1099'.exe'
    Filter = 'Text|*.txt'
    FilterIndex = 0
    InitialDir = 'GetCurrentDir()'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofCreatePrompt, ofNoTestFileCreate, ofEnableSizing]
    Left = 192
    Top = 16
  end
end
