program Registro;
type
	str20 = String[20];
	alumno = record
		codigo : Integer;
		nombre : str20;
		promedio : Real;
	end;
procedure leer(var alu: alumno);
begin
	write('ingrese el codigo del alumno: ');
	readln(alu.codigo);
	write('Ingrese Nombre del alumno: ');
	readln(alu.nombre);
	write('Ingrese Promedio del alumno: ');
	readln(alu.promedio);
	writeln('-----------------------------');
end;

var
	a: alumno;
	cont: Integer;
	max: Real;
	nomAlumnoMax: str20;
begin
	max:= -1;
	cont:= 0;
	leer(a);
	while (a.codigo <> 0) do 	
	begin
		cont:= cont +  1;
		if (a.promedio >= max) then
		begin
			max:= a.promedio;
			nomAlumnoMax:= a.nombre; 	
		end; 
		leer(a);
	end;

	writeln('La cantidad de alumnos lidos es: ', cont);
	writeln('El nombre del alumno con mejor promedio es: ', nomAlumnoMax);
	readln();
end.