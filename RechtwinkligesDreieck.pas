program RechtwinkligesDreieck (input, output);
{ Prüft ob drei Seiten ein rechtwinkliges Dreieck Ergeben }
{ input : Drei reelle Zahlen für die Seitenlängen }
{ output : Textausgabe}
{ Aufgabe 3 }
    var
    x,
    y,
    z : integer;
    r : boolean;

    begin
        writeln ('Drei Seitenlaengen eingeben:');
        readln (x,y,z);
        { bestimme ob Dreieck rechtwinklig:}
        if ((x*x=y*y+z*z) or (y*y=x*x+z*z) or (z*z=y*y+x*x)) and (abs(x) > 0) and (abs(y) > 0) and (abs(z) > 0) then
            r := true
        else
            r := false;
        writeln ('Die rechtwinkligkeit des Dreiecks ist: ', r)
    end. {RechtwinkligesDreieck}