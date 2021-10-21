program Dreieckrechtwinklig (input, output);
{ Dreieck rechtwinklig }
{ Aufgabe 3 }

    var
    x,
    y,
    z,
    zw : real;

begin
  {lese und drucke Dreiecksseiten in aufsteigender Folge}
  writeln ('Drei Seitenlaengen eingeben',
            'dann wird geprüft ob es sich um ein rechtwinkliges Dreieck handelt:');
  readln (x);
  readln (y);
  readln (z);
  writeln (x:3, y:3, z:3);
  {Eingabe sortieren damit X die Hypertenuse ist.}
  if (x < y) then
  begin
    zw := x;
    x := y;
    y := zw;
  end; {x>y}
  if (x < z) then
  begin
    zw := x;
    x := z;
    z := zw;
  end; {x>z}

    { bestimme die Art des Dreieck}
    if z + y <= x then
      write (' ist kein Dreieck')
    else
    begin
      { bestimme ob Dreieck rechtwinklig:}
      if (x*x=y*y+z*z) then
        writeln(' Das Dreieck ist rechtwinklig mit der Hypertenuse:', x:8:3)
      else
        writeln (' Das Dreieck ist nicht rechtwinklig')
    end {if z+y <= x}
end. {Dreiecke}