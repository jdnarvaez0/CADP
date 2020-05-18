program sumador;
type
	vnums = array[1..10] of Integer;

var
	numeros: vnums;
	i:Integer;
	
begin
	for i := 1 to 10 do 
		numeros[i]:=1;

	for i := 2 to 10 do 
		numeros[i]:= numeros[i] + numeros [i-1];	
		writeln(numeros[i]);
	readln();

end.