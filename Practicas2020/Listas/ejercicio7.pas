program ejercicio7;

type
	alumno = record
		dni : Integer;
		apellido : String;
		nombre : String;
		nota : Real;
	end;

	lista = ^nodo;
	nodo = record
		datos : alumno;
		sig : lista;
	end;

	vTurnos = array[1..5] of lista;
	vCantidades = array[1..5] of Integer;

procedure agregarAdelante(var l:lista; a:alumno);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= a;
	nue^.sig:= l;
	l:= nue;
end;

procedure leerDatos(var a:alumno);
begin
	with a do 
	begin
		write('Ingrese el DNI: ');
		readln(dni);
		if (dni <> 0) then // para la lectura
		begin
			write('Ingrese el apellido: ');
			readln(apellido);
			write('Ingrese el Nombre: ');
			readln(nombre);
			write('Ingrese nota: ');
			readln(nota);
		end;
	end;
end;

procedure cargarLista(var l:lista);
var
	a: alumno;
begin
	leerDatos(a);
	while (a.dni <> 0)  do 
	begin
		agregarAdelante(l,a);
		leerDatos(a);
	end;
end;

//######## finaliza la carga de la lista (la lista se DISPONE) ######

procedure inicializarVectoryLista(var vt:vTurnos; var vc:vCantidades);
var
	i: Integer;
begin
	for i := 1 to 5 do 
	begin
		vt[i]:=nil;
		vc[i]:=0;
	end;
end;

function getTurno(nota: Real; vc:vCantidades): Integer;
begin
	if (nota >= 8) then
	begin	
		if (vc[1] < vc[4]) then 
			getTurno:= 1
		else
			getTurno:=4;
		end
		else
			if (nota >= 5) then 
			begin
				if ((vc[2] < vc[3]) and (vc[2] < vc[5])) then 
					getTurno:= 2
				else
				if ((vc[3] < vc[2]) and (vc[3] < vc[5])) then 
					getTurno:= 3
				else
					getTurno:= 5;
			end
	else
		getTurno:= 0;
end;

procedure asignarTurno(l:lista; var vt:vTurnos; var vc:vCantidades);
var
	nota: Real;
	turno: Integer;
begin
	while (l <> nil) do 
	begin
		nota:= l^.datos.nota;
		turno:= getTurno(nota,vc);
		if (turno <> 0) then 
		begin
			agregarAdelante(vt[turno], l^.datos);
			vc[turno]:= vc[turno] + 1;
		end;
		l:= l^.sig;
	end;
end;

procedure imprimirLista(l:lista);
var
	i: Integer;
begin

	while (l <> nil) do 
	begin
		writeln('DNI: ', l^.datos.dni);
		writeln('NOMBRE: ', l^.datos.nombre);
		l:= l^.sig;
	end;
end;

var
	l: lista;
	a: alumno;
	vt: vTurnos;
	vc: vCantidades;
	i: Integer;
begin
	l:=nil;

	cargarLista(l);
	inicializarVectoryLista(vt,vc);
	asignarTurno(l,vt,vc);
	for i := 1 to 5 do 
	begin
		imprimirLista(vt[i]);
	end;
	readln();
end.

