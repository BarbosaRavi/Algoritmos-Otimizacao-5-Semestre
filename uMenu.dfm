object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Principal'
  ClientHeight = 195
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 21
  object lblAluno: TLabel
    Left = 118
    Top = 172
    Width = 139
    Height = 15
    Caption = 'Programa'#231#227'o Linear - Ravi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblTitulo: TLabel
    Left = 16
    Top = 16
    Width = 236
    Height = 21
    Caption = 'Problema de Roteamento Veicular'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnMetBasico: TButton
    Left = 64
    Top = 47
    Width = 129
    Height = 25
    Caption = 'M'#233'todos B'#225'sicos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnMetBasicoClick
  end
  object btnAlgGenetico: TButton
    Left = 64
    Top = 83
    Width = 129
    Height = 25
    Caption = 'Algoritmos Gen'#233'ticos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnAlgGeneticoClick
  end
  object btnSobre: TButton
    Left = 64
    Top = 123
    Width = 129
    Height = 25
    Caption = 'Sobre'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnSobreClick
  end
end
