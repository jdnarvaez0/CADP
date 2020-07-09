program ejercicio4;
type
	str40= String[40];
	rangoSeman = 1..42;

	vPeso = array[rangoSeman] of Real;

	paciente = record
		nombre : str40;
		apellido : str40;
		semana : rangoSeman;
		peso : vPeso;
	end;

	lista = ^nodo;		// se DISPONE
	nodo = record
		datos : paciente;
		sig : lista;
	end;

procedure leerDatos(var p:paciente);
begin
	with p do 
	begin
		write('Ingrese NOMBRE: '); // esto no lo dice el ejercicio pero lo hice para hacer un corte de control
		readln(nombre);
		if (nombre <> 'zzz') then 
		begin
			write('Ingrese APELLIDO: ');
			readln(apellido);
			write('Ingrese la SEMANA (1-42): ');
			readln(semana);
			write('Ingrese PESO: ');
			readln(peso);
			writeln('-------------------------');
		end;
	end;
end;

procedure agregarAdelante(var l:lista; p:paciente);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= p;
	nue^.sig:= l;
	l:= nue;
end;
//el cargar listo no es necesario en este ejercicio se DISPONE la informacion
//lo realizo para poder porbrar el ejercicio como tal 
procedure cargarLista(var l:lista);
var
	p: paciente;
begin
	leerDatos(p);
	while (p.peso <> 0) do 
	begin
		agregarAdelante(l,p);	
		leerDatos(p);
	end;
end;

procedure procesarPaciente(p:paciente);
var
	max,total: Real;
	maxSemana, i: Integer;
begin
	max:= -1;
	total:= 0;

	for i := 1 to p.semana do 
	begin
		total:= total + p.peso[i];
		if (p.peso[i] > max ) then 
		begin
			max:= p.peso[i];
			maxSemana:= i;
		end;
		writeln('La semana con mayor aumento de peso fue: ', maxSemana);
		writeln('El aumento de peso total fue: ', total); 
	end;
end;

procedure calcular(l:lista);
begin
	while (l <> nil) do 
	begin
		procesarPaciente(p);
		l:=l^.sig;
	end;
end;

var
	l: lista;
begin
	l:= nil;
	cargarLista(l);
	calcular(l);
	readln();
end.