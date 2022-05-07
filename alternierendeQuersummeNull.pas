program alternierendeQuersummeNull (input,output);
{Eingabe: x ∈ ℕ
Ausgabe: r ∈ (true, false)
Nachbedingung: r ist genau dann true, wenn die alternierende Quersumme von x gleich 0 ist.}
  var
  i,
  res,
  x: integer;

  begin
    writeln('Geben sie die zu prüfende Zahl ein:');
    readln(x);
    res:=0;
    for i := 1 to x.ToString.Length do
    begin
      res:=res+(((i+1)mod 2)*(-1))*(x mod 10);
      x:= x div 10;
      write(res:5,x:5);
    end;
  end.