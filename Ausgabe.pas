program Ausgabe(input, output);
{Verschiedene Ausgaben testen}

    const
    N = 15;
    L = '----------------------------';

    var
    i : integer;
    x,
    y : real;
    c : char;

    begin
        i := 7;
        {x := -2.7;
        y := 8.1;}
        Write('Eingabe von x : ');
        read(x);
        Write('Eingabe von y : ');
        read(y);
        c := '$';

        Write(1);
        Write('.');
        Write('i*n=');
        Write(i:2);
        Write(c:3);
        Write(N:3);
        Write('=':3);
        write(i*N:3);
        Write('2.':3);
        Write('x*y=');
        write(x:6:2);
        write(c:3);
        Write(y:8:2);
        Write('=':3);
        WriteLn(x*y:7:1);
        write(L,L)
    end.
