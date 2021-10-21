program Dreiecke (input, output);
{ Dreiecksbestimmung }
{ Seite 67 Beispiel 3.6.3.3 }
    uses
    math;

    var
    a,
    b,
    c,
    s,
    Flaeche : real;
    alpha,
    beta,
    gamma : Float;

begin
  {lese und drucke Dreiecksseiten in aufsteigender Folge}
  writeln ('Drei Seitenlaengen in auf',
            'steigender Folge eingeben!');
  readln (a);
  readln (b);
  readln (c);
  writeln ('Die Seiten haben die Laenge: ',a:3, b:3, c:3);
  if (b < a) or (c < b) then
    writeln(' ist nicht aufsteigend sortiert');
    { bestimme die Art des Dreieck}
    if a + b <= c then
      write (' ist kein Dreieck')
    else
    begin
      { bestimme die Art des Dreiecks:}
      if (a = b) and (a = c) then
        write ('ist ein gleichseitiges Dreieck')
      else
      begin
        if (a = c) or (a = b) or (b = c) then
          write ('ist ein gleichschenkliges Dreieck,')
        else
         write ('ist ein ungleichseitiges Dreieck,');
        if (a*a=b*b+c*c) or (b*b=a*a+c*c) or (c*c=b*b+a*a) then
        write (' ist ein rechtwinkliges Dreieck. ');
      end;{Dreiecksbestimmung}
      
      { bestimme die Flaeche: }
      s := 0.5 * (a + b + c);
      Flaeche := sqrt(s * (s - a) * (s - b) * (s - c));
      writeln (' der Flaeche :', Flaeche:8:2);
      { bestimmen der Innenwinkel}
      alpha := ArcCos((b*b+c*c-a*a) / (2*b*c));
      beta := ArcCos((a*a+c*c-b*b) / (2*a*c));
      gamma := ArcCos((a*a+b*b-c*c) / (2*a*b));
      writeln ('alpha ist: ',radtodeg(alpha):3:2,' beta ist: ',radtodeg(beta):3:2,' gamma ist :',radtodeg(gamma):3:2);
      { bestimmen des Innenkreisradius}
      s := 2 * Flaeche / (a + b + c);
      writeln (' der Innenkreisradius ist : ', s:4:2)

    end {if a+b <= c}
end. {Dreiecke}