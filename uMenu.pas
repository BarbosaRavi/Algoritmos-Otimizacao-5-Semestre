unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnMetBasico: TButton;
    btnAlgGenetico: TButton;
    btnSobre: TButton;
    lblAluno: TLabel;
    lblTitulo: TLabel;
    procedure btnSobreClick(Sender: TObject);
    procedure btnAlgGeneticoClick(Sender: TObject);
    procedure btnMetBasicoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uSobre, uMetBas;

//Abrir Métodos Básicos
procedure TForm1.btnMetBasicoClick(Sender: TObject);
begin
  Application.CreateForm(TformMetBas, formMetBas);
  formMetBas.ShowModal;
  formMetBas.Free;
end;

//Abrir Algoritmo Genético
procedure TForm1.btnAlgGeneticoClick(Sender: TObject);
begin
   Application.MessageBox('Módulo em Desenvolvimento', 'Algoritmos Genéticos', MB_ICONINFORMATION or MB_OK);
end;

//Abrir Sobre
procedure TForm1.btnSobreClick(Sender: TObject);
begin
  Application.CreateForm(TformSobre, formSobre);
  formSobre.ShowModal;
  formSobre.Free;
end;

end.
