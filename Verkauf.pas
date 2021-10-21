program Verkauf (input, output);
{ Rabatgewaerung: zweite Version}
{ Seite 64 Beispiel 3.6.3.2 }
    const
    GRUNDPREIS = 200.00 {EUR};

    var
    Anzahl : integer;
    Preis : real;

    begin
      writeln('Bitte die Anzahl bestellter Teile  ', 'eingeben: ');
      readln(Anzahl);
      if Anzahl <= 0 then
        writeln ('falsche Eingabe')
      else
      { es liegt eine Bestellung vor }
      begin
        Preis := Anzahl * GRUNDPREIS;
        if Anzahl > 50 then
            {grosser Rabat kann gewaehrt werden }
            Preis := Preis * 0.8
        else
            if Anzahl > 10 then
                {kleiner Rabatt kann gewaert werden }
                Preis := Preis * 0.9;

        writeln('Der Preis betraegt ',Preis:5:2,' EUR')
      end
    end.