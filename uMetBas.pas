unit uMetBas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uFuncs;

type
  TformMetBas = class(TForm)
    lblTipoExec: TLabel;
    cboxTipoExec: TComboBox;   // 0 = FIXO, 1 = ALEAT�RIO
    lblTamProb: TLabel;
    edtTamProb: TEdit;
    btnSolInicial: TButton;
    btnExec: TButton;
    lblMetodo: TLabel;
    ComboBox1: TComboBox;      // 0=Subida de Encosta, 1=Subida c/ Tentativas, 2=T�mpera
    lblAvisoFixo: TLabel;
    memo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure cboxTipoExecChange(Sender: TObject);
    procedure btnSolInicialClick(Sender: TObject);
    procedure btnExecClick(Sender: TObject);
  private
    FDist: TMatrizProblema;
    FInic: TVetorRota;
    FFixo: Boolean;
    FN: Integer;
    procedure PrepararInstancia;
    procedure EscreverSolucaoInicialNoMemo;
  public
  end;

var
  formMetBas: TformMetBas;

implementation

{$R *.dfm}

//FormCreate
procedure TformMetBas.FormCreate(Sender: TObject);
begin
  cboxTipoExec.ItemIndex := 0;
  ComboBox1.ItemIndex    := 0;
  FN := 6;
  FFixo := True;
  edtTamProb.Enabled:= False;

  SetLength(FDist, 0);
  SetLength(FInic, 0);
end;

//Mudar tipo de execu��o para padr�o ou aleatoria
procedure TformMetBas.cboxTipoExecChange(Sender: TObject);
begin
  if cboxTipoExec.ItemIndex = 0 then
  begin
    edtTamProb.Enabled:= False;
    edtTamProb.Text:= '6';
  end
  else
    edtTamProb.Enabled:= True;
end;

//Prepara a Solu��o inicial
procedure TformMetBas.PrepararInstancia;
begin
  FFixo := (cboxTipoExec.ItemIndex = 0);

  if FFixo then
    FN := 6
  else
  begin
    if not TryStrToInt(Trim(edtTamProb.Text), FN) then
      raise Exception.Create('Tamanho deve ser inteiro e maior que 3');
    if FN < 3 then
      raise Exception.Create('Tamanho m�nimo � 3');
  end;

  FDist := gerarMatriz(FN, FFixo);
  FInic := gerarSolInicial(FDist);
end;

//Procedure para exibir solu��o inicial
procedure TformMetBas.EscreverSolucaoInicialNoMemo;
var
  ciclo: TVetorRota;
  custo: Integer;
begin
  ciclo := seguirRota(FInic);
  custo := avaliarRota(FDist, ciclo);

  memo.Lines.Add(StringOfChar('-', 70));
  if FFixo then
    memo.Lines.Add(Format('Inst�ncia FIXA (N=%d)', [FN]))
  else
    memo.Lines.Add(Format('Inst�ncia ALEAT�RIA (N=%d)', [FN]));

  memo.Lines.Add('Matriz de dist�ncias:');
  memo.Lines.Add(MatrizToString(FDist));

  memo.Lines.Add('Solu��o Inicial (vetor): ' + respToString(FInic));
  memo.Lines.Add('Ciclo (fechado): ' + respToString(ciclo));
  memo.Lines.Add('Dist�ncia (custo): ' + custo.ToString);
end;

//Solu��o Inicial
procedure TformMetBas.btnSolInicialClick(Sender: TObject);
begin
  memo.Clear;
  PrepararInstancia;
  EscreverSolucaoInicialNoMemo;
end;

//Executar
procedure TformMetBas.btnExecClick(Sender: TObject);
begin
  memo.Clear;
  memo.Lines.Add('M�dulo em Desenvolvimento');
end;

end.

