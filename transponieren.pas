program transponieren (input,output);

  const
  GROESSE = 5;
  
  type
  tMatrix = array [1..GROESSE,1..GROESSE] of integer;

  var
  A,
  B : tMatrix;
  tauschPuffer,
  i,
  j : integer;

function printMatrix (var A: tMatrix) : boolean;
begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE do
       if(j = GROESSE) then
         writeln(A[i,j]:5)
       else
         write(A[i,j]:5)
       end;{printMatrix}

begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE do
      readln (A[i,j]);

  printMatrix(A);
  B:=A;

{A}
  for i := 1 to GROESSE-1 do
    for j := i+1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end;{Korrekt oberhalb Diagonale wird durchlaufen}
  writeln('A');
  printMatrix(A);
{B}
A:=B;
begin
  for i := 1 to GROESSE do
    for j := 1 to i do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end
end;{Korrekt unterhalb Diagonalen wird durchlaufen}
writeln('B');
printMatrix(A);
{C}
A:=B;
begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end
end;{Falsch doppelter Tausch es wird zweimal Transponiert}
writeln('C');
printMatrix(A);
{D}
A:=B;
begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE-i do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end
end; {Falsch transponiert doppelt über der links unten nach rechts oben Diagonalen}
writeln('D');
printMatrix(A);
{E}
A:=B;
begin
  for i := 1 to GROESSE-1 do
    for j := i+1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[j,i] := A[i,j];
      A[j,i] := tauschPuffer
    end
end;{falsche Matrix indizes}
writeln('E');
printMatrix(A);
  
end.{transponieren}