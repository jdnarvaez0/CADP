program ejercicio5;
const
	dimF := 100;
type
	vnumeros= array[1..dimF] of integer;

procedure cargarVector(var v:vnumeros);
var
	i:integer;
	
begin
	for i := 1 to dimF do
	begin
		v[i]:= random(30);
	end;
end;

begin
	
end.
