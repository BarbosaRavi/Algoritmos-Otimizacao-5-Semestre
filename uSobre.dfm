object formSobre: TformSobre
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Sobre'
  ClientHeight = 229
  ClientWidth = 573
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object memoSobre: TMemo
    Left = 0
    Top = 8
    Width = 569
    Height = 217
    Lines.Strings = (
      'Descri'#231#227'o do Problema:'
      ''
      
        'A situa'#231#227'o abordada no artigo escolhido para o desenvolvimento d' +
        'o projeto de Programa'#231#227'o Linear'
      
        'consiste em encontrar a solu'#231#227'o '#243'tima para rotas de equipes de i' +
        'nvent'#225'rio florestal '
      'responsaveis pela log'#237'stica da empresa GELF Siderurgia S.A.'
      
        'No artigo escolhido, '#233' utilizado o algoritimo de tempera simulad' +
        'a e '#233' um problema com '
      
        'diversas variaveis, no entando, iremos trabalhar apenas com dist' +
        #226'ncia no desenvolvimento do projeto.'
      ''
      'Aluno:'
      ''
      'Ravi Bittencourt Barbosa | 5'#186' Semestre ADS'
      'Projeto desenvolvido com Delphi 12 Community Edition')
    ReadOnly = True
    TabOrder = 0
  end
end
