program ejercicio8a;
function doble(numA:Integer; numB:Integer): Boolean;
var
	ok: Boolean;
begin
	ok:= false;

	if (numA = numB*2) then 
	begin
		ok:=true;
	end;

	doble:= ok;
end;

var
	numA, numB: Integer;
begin
	
	write('Ingrese el numeroA: ');
	readln(numA);
	write('Ingrese el numeroB: ');
	readln(numB);

	
	if doble(numA, numB) then 
	begin
		writeln('El numero B ES el doble del numero A');
	end
	else
		writeln('El numero B NO es el doble de numero A');
	readln();
end.