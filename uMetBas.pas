unit uMetBas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uFuncs;

type
  TformMetBas = class(TForm)
    lblTipoExec: TLabel;
    cboxTipoExec: TComboBox;   // 0 = FIXO, 1 = ALEATÓRIO
    lblTamProb: TLabel;
    edtTamProb: TEdit;
    btnSolInicial: TButton;
    btnExec: TButton;
    lblMetodo: TLabel;
    ComboBox1: TComboBox;      // 0=Subida de Encosta, 1=Subida c/ Tentativas, 2=Têmpera
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

//Mudar tipo de execução para padrão ou aleatoria
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

//Prepara a Solução inicial
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
      raise Exception.Create('Tamanho mínimo é 3');
  end;

  FDist := gerarMatriz(FN, FFixo);
  FInic := gerarSolInicial(FDist);
end;

//Procedure para exibir solução inicial
procedure TformMetBas.EscreverSolucaoInicialNoMemo;
var
  ciclo: TVetorRota;
  custo: Integer;
begin
  ciclo := seguirRota(FInic);
  custo := avaliarRota(FDist, ciclo);

  memo.Lines.Add(StringOfChar('-', 70));
  if FFixo then
    memo.Lines.Add(Format('Instância FIXA (N=%d)', [FN]))
  else
    memo.Lines.Add(Format('Instância ALEATÓRIA (N=%d)', [FN]));

  memo.Lines.Add('Matriz de distâncias:');
  memo.Lines.Add(MatrizToString(FDist));

  memo.Lines.Add('Solução Inicial (vetor): ' + respToString(FInic));
  memo.Lines.Add('Ciclo (fechado): ' + respToString(ciclo));
  memo.Lines.Add('Distância (custo): ' + custo.ToString);
end;

//Solução Inicial
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
  memo.Lines.Add('Módulo em Desenvolvimento');
end;

end.

