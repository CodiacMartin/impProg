{$R+} 
{$B+} 

program kiste(input, output);
{baut eine Liste von Stapeln}
  type	
  tRefKiste = ^tKiste;
  tKiste = record
             zahl:integer;
             name:String; 
             up:tRefKiste;             
             next:tRefKiste
           end;
           
  {---------------- hier beginnt Ihre Funktion! ----------------}
  function count(inName:String; inKiste:tRefKiste):integer;
  { die funktion bestimmt die Summe eines Stapels aus Kisten mit gleichem Namen}
    var
    summe : integer;
    
  begin
    summe := 0;
    if (inKiste <> nil) then
      if (inKiste^.name <> inName) then
        summe:=count(inName,inKiste^.next)
      else
        summe:= inKiste^.zahl + count(inName,inKiste^.up);
    count:= summe;
  end;
  
  // Man könnte die lokale Variable auch weglassen siehe unter diesem Kommentar.
  // jedoch fällt dadurch auch die Variablen deklaration weg und es gibt so gut
  // wie gar nichts mehr zu korrigieren. Außerdem hilft summe der Lesbarkeit.
  {begin
    if (inKiste <> nil) then
      if (inKiste^.name <> inName) then
        count:=count(inName,inKiste^.next)
      else
        count:= inKiste^.zahl + count(inName,inKiste^.up)
    else
    count:= 0;
  end;}
  
  {---------------- hier endet Ihre Funktion  ----------------}
    
  
  procedure print(inKiste:tRefKiste);
  {schreibt alle Kisten auf die Standardausgabe} 
      
  begin
    if (inKiste <> nil) then
    begin
      write('[');
      write(inKiste^.zahl);
      write(',');
      write(inKiste^.name);
      write(']');
      if (inKiste^.up <> nil) then 
        write('');
      print(inKiste^.up);
      if (inKiste^.up = nil) then 
        write(' ');
      print(inKiste^.next);
    end
    else
  end;
  
  function stringToStapelliste(inS:string):tRefKiste;
  {baut eine Stapelliste aus einem String}
    var
    stapelliste,lauf1,lauf2:tRefKiste;
    r,i:integer;
    c,c2:char;
    s:String;
 
  begin
    stapelliste := nil;
    i := 1;
    r := 0;
    c := 'a';
    s := '';
    while (i <= Length(inS)) do
    begin
      c2 := c;
      c := inS[i];
      if (c <> ']') then s := s + c;
      if (c = '0') then r := r * 10;
      if (c = '1') then r := r * 10 + 1;
      if (c = '2') then r := r * 10 + 2;
      if (c = '3') then r := r * 10 + 3;
      if (c = '4') then r := r * 10 + 4;
      if (c = '5') then r := r * 10 + 5;
      if (c = '6') then r := r * 10 + 6;
      if (c = '7') then r := r * 10 + 7;
      if (c = '8') then r := r * 10 + 8;
      if (c = '9') then r := r * 10 + 9;
      if (c = ',') then s := '';
      if ((c = '[') and (stapelliste = nil)) then 
      begin
        new(stapelliste);
        lauf1 := stapelliste;
        lauf2 := stapelliste;
        stapelliste^.up := nil;
        stapelliste^.next := nil
      end;
      if (c = '[') and (c2 = ']') then 
      begin
        new(lauf2^.up);
        lauf2 := lauf2^.up;
        lauf2^.up := nil;
        lauf2^.next := nil
      end;
      if (c = ' ') then 
      begin
        new(lauf1^.next);
        lauf1 := lauf1^.next;
        lauf2 := lauf1;
        lauf2^.up := nil;
        lauf2^.next := nil
      end; 
      if (c = ']') then
      begin
        lauf2^.zahl := r;
        lauf2^.name := s; 
        r := 0 
      end; 
      i := i + 1;
    end;
    stringToStapelliste := stapelliste;
  end;
  
  procedure printTestDatum(inKiste:string; inName:string; inErwartet:string);
  {testet ein Testdatum und schreibt zuerst das erwartete Ergebnis und dann das Ergebnis}
    var
    kisteA:tRefKiste;
  
  begin
    kisteA := stringToStapelliste(inKiste);
    writeln;
    writeln(inErwartet);
    write(count(inName,kisteA));
    writeln;
  end;
    
begin
  writeln('**** testen ****');
  printTestDatum('','Ingwer','0');
  printTestDatum('[3,Ingwer] [2,Minze][7,Minze][3,Minze] [3,Salbei][2,Salbei]','Ingwer','3');
  printTestDatum('[3,Ingwer] [2,Minze][7,Minze][3,Minze] [3,Salbei][2,Salbei]','Minze','12');
  printTestDatum('[3,Ingwer] [2,Minze][7,Minze][3,Minze] [3,Salbei][2,Salbei]','Salbei','5');
  printTestDatum('[3,Ingwer] [2,Minze][7,Minze][3,Minze] [3,Salbei][2,Salbei]','Toast','0');
  writeln;
end.
