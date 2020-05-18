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
	
begin
	
	cont:= 0;
	leer(a);
	while (a.codigo <> 0) do 	
	begin
		cont:= cont +  1;

		leer(a);
	end;

	writeln('La cantidad de alumnos lidos es: ', cont);
	readln();
end.