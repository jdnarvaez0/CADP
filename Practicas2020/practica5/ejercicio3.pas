program ejercicio3;
const
  CONST_NAME = value

type
  vector = array[1..dimF] of integer;

array[1..] of 

procedure cargarVector(var v : vector);
var
  i : integer;
begin

  for i := 1 to dimF do
    v[i] := i;
end;

procedure imprimirA(v : vector);
var
  i : integer;
begin

  for i := 1 to dimF do
    write(v[i],' ');

end;

procedure imprimirB(v : vector);
var
  i : integer;
begin

  for i := dimF downto 1 do
    write(v[i],' ');

end;

procedure mitad(v : vector);
var
  i : integer;
begin

  for i := dimF div 2 downto 1 do
    write(v[i],' ');

  for i := dimF div 2 + 1 to tam do
    write(v[i],' ');

end;

procedure tramo(v : vector; x, y : integer);
var
  i : integer;
begin

  if(x < y) then
    for i := x to y do
      write(v[i],' ')
  else
    if(x > y) then
      for i := x downto y do
        write(v[i],' ');

end;

var
  dl, x, y : integer;
  v : vector;

begin
  clrscr;

  cargarVector(v);

  imprimirA(v);
  writeln();
  imprimirB(v);
  writeln();
  mitad(v);
  writeln();

  writeln('ingrese posicion x');
  readln(x);
  writeln('ingrese posicion y');
  readln(y);
  tramo(v,x,y);

  readln();
end.
