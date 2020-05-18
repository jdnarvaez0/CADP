program ejericicio6;
var	
	cont,contP,contD,numL: Integer;
	porcentaje, prom: Real;
begin
	cont:=0;
	contP:=0;
	contD:=0;

	writeln('Ingrese el NUMERO DE LEGAJO');
	readln(numL);
	writeln('Ingrese el PROMEDIO DE ALUMNO');
	readln(prom);

	while numL <> -1 do
	begin
		cont:=cont+1;
		if prom > 6.5 then
		begin
			contP:=contP+1;
		end;
		if (prom > 8.5) and (numL < 2500) then
		begin
			contD:=contD+1;
			porcentaje:= (contD*cont)/100;
		end;

		writeln('Ingrese el NUMERO DE LEGAJO');
		readln(numL);
		writeln('Ingrese el PROMEDIO DE ALUMNO');
		readln(prom);
	end;

	writeln('La CANTIDAD DE ALUMNOS LEIDOS ', cont);
	writeln('CANTIDAD DE ALUMNOS CUYO PROMEDIO SUPERA EL 6.5 ', contP);
	writeln('PORCENTAJE DE ALUMNOS DESTACADOS ',porcentaje);
	readln();

end.
