unit uFuncs;

interface

uses
  System.SysUtils, System.Math;

type
  TMatrizProblema = TArray<TArray<Integer>>;
  TVetorRota      = TArray<Integer>;

function gerarMatriz(const N: Integer; const fixo: Boolean): TMatrizProblema;
function gerarSolInicial(const D: TMatrizProblema): TVetorRota;
function seguirRota(const R: TVetorRota): TVetorRota;
function avaliarRota(const D: TMatrizProblema; const ciclo: TVetorRota): Integer;
function respToString(const R: TVetorRota): string;
function MatrizToString(const D: TMatrizProblema): string;


implementation

// Gera matriz do problema
function gerarMatriz(const N: Integer; const fixo: Boolean): TMatrizProblema;
var
  i, j: Integer;
begin
  SetLength(Result, N, N);

  if fixo and (N = 6) then
  begin
    Result[0] := [0, 14, 7,  8,  12, 6];
    Result[1] := [14, 0, 10, 5,  9,  11];
    Result[2] := [7, 10, 0,  4,  6,  9];
    Result[3] := [8, 5,  4,  0,  7,  3];
    Result[4] := [12, 9,  6,  7,  0,  8];
    Result[5] := [6, 11, 9,  3,  8,  0];
    Exit;
  end;

  if fixo then
    RandSeed := 1234
  else
    Randomize;

  for i := 0 to N - 1 do
    for j := 0 to N - 1 do
      if i = j then
        Result[i, j] := 0
      else if j < i then
        Result[i, j] := Result[j, i]
      else
        Result[i, j] := 2 + Random(49);
end;

//Gera solução inicial
function gerarSolInicial(const D: TMatrizProblema): TVetorRota;
var
  N, cur, prox, melhorj, melhord, i: Integer;
  usado: TArray<Boolean>;
begin
  N := Length(D);
  SetLength(Result, N);
  SetLength(usado, N);

  Result[0] := 0;
  usado[0]  := True;
  cur       := 0;

  for i := 1 to N - 1 do
  begin
    melhorj := -1;
    melhord := High(Integer);
    for prox := 0 to N - 1 do
      if (not usado[prox]) and (prox <> cur) and (D[cur, prox] < melhord) then
      begin
        melhord := D[cur, prox];
        melhorj := prox;
      end;

    Result[i]     := melhorj;
    usado[melhorj]:= True;
    cur           := melhorj;
  end;
end;

//Segue a rota
function seguirRota(const R: TVetorRota): TVetorRota;
var
  N, i: Integer;
begin
  N := Length(R);
  SetLength(Result, N + 1);
  for i := 0 to N - 1 do
    Result[i] := R[i];
  Result[N] := R[0];
end;

//Avalia a rota
function avaliarRota(const D: TMatrizProblema; const ciclo: TVetorRota): Integer;
var
  s, i: Integer;
begin
  s := 0;
  for i := 0 to High(ciclo) - 1 do
    Inc(s, D[ciclo[i], ciclo[i + 1]]);
  Result := s;
end;

//Converte em string para exibir
function respToString(const R: TVetorRota): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to High(R) do
  begin
    if i > 0 then
      Result := Result + ' --> ';
    Result := Result + R[i].ToString;
  end;
end;

function MatrizToString(const D: TMatrizProblema): string;
var
  i, j, N: Integer;
  linha: string;
begin
  Result := '';
  N := Length(D);
  for i := 0 to N - 1 do
  begin
    linha := '';
    for j := 0 to N - 1 do
    begin
      if j > 0 then
        linha := linha + #9;
      linha := linha + D[i, j].ToString;
    end;
    Result := Result + linha + sLineBreak;
  end;
end;


end.

