program ejercicio1;
const
	dimF = 5;
type
	rangoGenreo = 1..5;
	str40 = String[40];

	persona = record
		dni : Integer;
		apellido : str40; 
		nombre : str40;
		edad : Integer;
		codGenero : rangoGenreo; 
	end;

	lista = ^nodo;
	nodo = record
		datos : persona;
		sig : lista;
	end;

	vContador = array[rangoGenreo] of Integer;

procedure leerDatos(var p: persona);
begin
	with p do 
	begin
		write('Ingres el DNI: ');
		readln(dni);
		write('Ingrese APELLIDO: ');
		readln(apellido);
		write('Ingres NOMBRE: ');
		readln(nombre);
		write('ingrese EDAD: ');
		readln(edad);
		write('Ingrese CODIGO DE GENERO: ');
		readln(codGenero);
		writeln('------------------------');
	end;
end;

procedure inicializarVector(var vc:vContador);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		vc[i]:= 0;
	end;
end;

procedure agregarAdelante(var l:lista; p:persona);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= p;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarLista(var l:lista; var vc:vContador);
var
	p: persona;
begin
	repeat
		leerDatos(p);
		agregarAdelante(l,p);
	until (p.dni = 33555444);
end;

procedure codMax(vc: vContador; codigo: Integer; var max1,max2: Integer; var codMax1,codMax2: Integer);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		if (vc[i] > max1) then 
		begin
			max2:= max1;
			codMax2:= codMax1;
			max1:= vc[i];
			codMax1:= codigo;
		end
		else
			if (vc[i] > max2) then 
			begin
				max2:= vc[i];
				codMax2:= codigo;
			end;
	end;
end;

function cumple(dni:Integer): Boolean;
var
	dig, par, imp: Integer;
begin
	par:= 0;
	imp:= 0;
	while (dni <> 0) do 	
	begin
		dig:= dni mod 10;
		if ((dig mod 2) = 0 ) then 
			par:= par + 1
		else
			imp:= imp + 1;

		dni:= dni div 10;
	end;

	cumple:= par > imp;
end;

procedure procesarInfo(l:lista; vc:vContador);
var
	max1, max2, codMax1, codMax2,conDni: Integer;
begin
	max1:= -1;
	max2:= -2;
	codMax1:= 0;
	codMax2:= 0;
	conDni:= 0;


	while (l <> nil) do
	begin
		if (cumple(l^.datos.dni)) then 
			conDni:= conDni + 1;

		vc[l^.datos.codGenero]:= vc[l^.datos.codGenero] + 1;
		

		l:= l^.sig;
	end;
	codMax(vc,l^.datos.codGenero, max1,max2, codMax1,codMax2);
	writeln('La cantidad de personas cuyo DNI contiene mas digitos pares que impares son: ', conDni);
	writeln('Los dos codigos de genero mas elegidos son: ', codMax1, ' y ', codMax2);
end;

procedure eliminarDni(var l:lista; dniE: Integer; var ok: Boolean);
var
	act,ant: lista;
begin
	ok:= false;
	act:= l;
	ant:= l;
	while (act <> nil) and (act^.datos.dni <> dniE) do
	begin
		ant:= act;
		act:= act^.sig;	
	end;

	if (act <> nil) then 
	begin
		ok:= true;
		if (act = l) then
			l:= l^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

var
	l: lista;
	vc: vContador;
	dniE: Integer;
	ok: Boolean;

begin
	l:= nil;	
	inicializarVector(vc);
	cargarLista(l, vc);
	procesarInfo(l,vc);

	writeln('Ingrese DNI a ELIMINAR: ');
	readln(dniE);
	eliminarDni(l,dniE,ok);
	if (ok) then
		writeln('El DNI ', dniE, ' SE ha ELIMINADO ')
	else
		writeln('El DNI ', dniE, ' NO se ha ELIMIANDO ');
	readln();

end.