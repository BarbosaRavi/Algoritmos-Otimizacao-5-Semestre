object formMetBas: TformMetBas
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'M'#233'todos B'#225'sicos'
  ClientHeight = 441
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object lblTipoExec: TLabel
    Left = 8
    Top = 24
    Width = 95
    Height = 15
    Caption = 'Tipo de Execu'#231#227'o:'
  end
  object lblTamProb: TLabel
    Left = 8
    Top = 69
    Width = 124
    Height = 15
    Caption = 'Tamanho do problema:'
  end
  object lblMetodo: TLabel
    Left = 79
    Top = 100
    Width = 45
    Height = 15
    Caption = 'M'#233'todo:'
  end
  object lblAvisoFixo: TLabel
    Left = 263
    Top = 8
    Width = 151
    Height = 15
    Caption = '*Manter tamanho 6 para fixo'
  end
  object cboxTipoExec: TComboBox
    Left = 109
    Top = 21
    Width = 108
    Height = 23
    ItemIndex = 0
    TabOrder = 0
    Text = 'Fixo'
    OnChange = cboxTipoExecChange
    Items.Strings = (
      'Fixo'
      'Aleat'#243'rio')
  end
  object edtTamProb: TEdit
    Left = 138
    Top = 61
    Width = 79
    Height = 23
    NumbersOnly = True
    TabOrder = 1
    Text = '6'
  end
  object btnSolInicial: TButton
    Left = 8
    Top = 96
    Width = 65
    Height = 25
    Caption = 'Sol. Inicial'
    TabOrder = 2
    OnClick = btnSolInicialClick
  end
  object btnExec: TButton
    Left = 348
    Top = 96
    Width = 65
    Height = 25
    Caption = 'Executar'
    TabOrder = 3
    OnClick = btnExecClick
  end
  object ComboBox1: TComboBox
    Left = 130
    Top = 90
    Width = 212
    Height = 23
    ItemIndex = 0
    TabOrder = 4
    Text = 'Subida de Encosta'
    Items.Strings = (
      'Subida de Encosta'
      'Subida de Encosta com Tentativas'
      'T'#234'mpera Simulada')
  end
  object memo: TMemo
    Left = 8
    Top = 136
    Width = 406
    Height = 297
    ReadOnly = True
    TabOrder = 5
  end
end
