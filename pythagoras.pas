program pythagoras(input,output);
{liest drei Längen ein und gibt genau dann true aus, wenn jedes Dreieck mit diesen Seitenlängen einen rechten Winkel besitzt}
  var 
  a,b,c : integer;
  x : boolean;

begin 
  readln(a);
  readln(b);
  readln(c);
  x := (a*a = (b*b + c*c)) or (b*b = (a*a + c*c)) or ((a*a + b*b) = c*c);
  writeln(x); 
end.