program ejercicioPractico1;
const
	Df = 2400; // alumnos

type
	str40 = String[40];
	alumno = record
		apellido : str40;
		dni : Integer;
		cantCursadasAprobadas : Integer;
		cantFinalesAprobados : Integer;
		notaPromedio : Real;
	end;

procedure leerAlumno(var a:alumno);
begin
	with a do 
	begin
		write('Ingrese APELLIDO: ');
		readln(apellido);
		write('ingrese DNI: ');
		readln(dni);
		write('Ingrese cantidad DE CURSADAS APROBADAS: ');
		readln(cantCursadasAprobadas);
		write('ingrese cantidad de FINALES APROBADOS: ');
		readln(cantFinalesAprobados);
		write('Ingrese NOTA PROMEDIO: ');
		readln(notaPromedio);
	end;
end;

procedure alDia(a:alumno; var aldia: Integer);
begin
	aldia:= (a.cantFinalesAprobados * 100) / cantCursadasAprobadas;
end;


procedure mejoresPromedios(a:alumno; var max1, max2: Real; var dniMax1, dniMax2: Integer);
begin
	if (a.notaPromedio >= max1) then 
	begin
		max2:= max1;
		dniMax2:= dniMax1;
		max1:= a.notaPromedio;
		dniMax1:= a.dni;
	end
	else
		if (a.notaPromedio >=max2) then 
		begin
			max2:= a.notaPromedio;
			dniMax2:= a.dni;
		end;
end;

var
	a: alumno;
	max1,max2, sumaPromedio, promedio:Real;
	dniMax1, dniMax2,contalumnosAlDia, aldia: Integer;
	
begin
	contalumnosAlDia:= 0;
	sumaPromedio:= 0;
	max1:= -1;
	max2:= -1;
	dniMax1:= 0;
	dniMax2:= 0;

	for i := 1 to Df do 
	begin
		leerAlumno(a);

		sumaPromedio:= sumaPromedio + a.notaPromedio;
		alDia(a, aldia);

		if (aldia >= 70) then 
		begin
			contalumnosAlDia := contalumnosAlDia + 1;
		end;

		mejoresPromedios(a,max1,max2,dniMax1,dniMax2);
	end;

	writeln('La cantidad de alumnos considerado al dia son: ', contalumnosAlDia);
	writeln('El proemdio general de todo los alumnos es: ', promedio:= sumaPromedio div Df); 
	writeln('Los dos DNI mejroes promedio son: ', dniMax1, ' y ', dniMax2);
	
end.

