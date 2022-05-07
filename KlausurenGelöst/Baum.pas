
program Baum(input, output);
{erstellt einen Binären Baum}
  type	
  tRefNode = ^tNode;
  tNode = record
             zahl:integer;
             root:tRefNode;
             right:tRefNode;             
             left:tRefNode
           end;
  var
    tree : tRefNode;
    
  procedure stringToTree(inS:string; Baum : tRefNode);
  {erstellt ein Baum aus einem String}
  var
  node : tRefNode;
  r,i : integer;
  c : char;
  
  begin
  i := 1;
  r := 0;
  c := 'a';
  if (Baum = nil) then
  begin
    Baum^.zahl := 0;
    Baum^.root := nil;
    Baum^.right := nil;
    Baum^.left := nil;
  end;
  while (i <= Length(inS)) do
    begin
      c := inS[i];
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
      if (c = '[') then
      begin
        new(node);
        if (r <> 0) then
        begin
          Baum^.zahl:=r;
          r:=0;
        end;
        node^.zahl:=0;
        node^.root:=Baum;
        node^.left:=nil;
        node^.right:=nil;
        if (Baum^.left <> nil) then
          Baum^.right:=node
        else
          Baum^.left:=node;
        Baum:=node;
      end;
      if (c = ']') then
      begin
        if (r <> 0) then
        begin
          Baum^.zahl := r;
          r := 0;
        end;
        if (Baum^.root <> nil) then
          Baum := Baum^.root;
      end;
      i := i + 1;
    end;
  end;
  
  procedure print(Baum:tRefNode ;absatz:integer);
  {..}
  var
  i:integer;
  
  begin
    if(Baum <> nil)then
    begin
      for i:=0 to absatz do
        write(' ');
      if(Baum^.left <> nil) OR (Baum^.right <> nil) then
      begin
        write('+');
        writeln(Baum^.zahl);
      end
      else
      begin
        write('-');
        writeln(Baum^.zahl);
      end;
      if(Baum^.left <> nil) then
        print(Baum^.left,absatz+2);
      if (Baum^.right <> nil) then
        print(Baum^.right,absatz+2);
    end;
  end;
  
  
  {--- Main ---}
  begin
    new(tree);
    stringToTree('1[2[3][4]][5]',tree);
    while(tree^.root <> nil) do
      tree:= tree^.root;
    print(tree,1);
  end.
