program ejercicio11;

type
	alumno = record
		numAlumno : Integer;
		apellido : String;
		promedio : Real;
	end;
	
	lista = ^nodo;
	nodo = record
		datos : alumno;
		sig: lista;
	end;

procedure leerDatos(var a: alumno);
begin
	with a do 
	begin
		write('Ingrese el numero de alumno: ');
		readln(numAlumno);
		if (numAlumno <> 0) then 
		begin
			write('Ingrese el apellido: ');
			readln(apellido);
			write('Ingrse el promedio: ');
			readln(promedio);
			writeln('------------------------');
		end;
	end;
end;

procedure insertarOdenado(var l:lista; a:alumno);
var
	nue,act,ant: lista;
begin
	new(nue);
	nue^.datos:= a;
	act:= l;
	ant:= l;	

	while (l <> nil) and (act^.datos.promedio > a.promedio) do //como hacer para guarlas los alumno en forma decendente?
	begin
		ant:=act;
		act:= act^.sig;
	end;

	if (act = ant) then 
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;	
end;

procedure cargarLista(var l:lista);
var
	a: alumno;
begin
	leerDatos(a);
	while (a.numAlumno <> 0) do 
	begin
		insertarOdenado(l,a);
		leerDatos(a);
	end;
end;

procedure imprimirLista(l:lista); //esta bien asi para imprimir los 10 primero de la lista? o hay otra forma?
var
	i: Integer;
begin
	i:= 0;
	while (l <> nil) and ( i < 10) do 
	begin
		writeln('APELLIDO: ', l^.datos.apellido);
		writeln('PROMEDIO: ', l^.datos.promedio:4:2);
		i:= i + 1;
		l:= l^.sig;
	end;
end;


var
	l: lista;
	a: alumno;

begin
	l:=nil;

	cargarLista(l);
	imprimirLista(l);
	readln();
	
end.