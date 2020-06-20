program ejercicio7;
const
	dimF = 5;
type
	curso= 1.. dimF;
	str40= String[40];
	alumno = record
		dni : Integer;
		apellido: str40;
		nombre: str40;
		nota: Real;
	end;

	lista = ^nodo;
	nodo = record
		datos : alumno;
		sig : lista;
	end;

	curso= record
		alumnos : lista;
		cantidad: Integer;
	end;

	vTurnos = array[curso] of lista;

procedure inicializarListas(var)

procedure leerDatos(var s:alumno);
begin
	with s do 
	begin
		write('Ingrese el dni: '); //esto no lo pide pero lo hice como para terminarlo en cualquier momento
		readln(dni);
		if dni <> 0 then 
		begin
			write('Ingrese el apellido: ');
			readln(apellido);
			write('Ingrese nombre: ');
			readln(nombre);
			write('Ingrese la nota: ');
			readln(nota);
		end;
	end;
end;

procedure agregarAdelante(var l:lista; s:alumno);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= s;
	nue^.sig:=nil;

	if (l = nil) then 
		l:= nue
	else
		nue^.sig:= l;
		l:=nue;
end;

procedure cargarLista(var l:lista);
var
	s: alumno;
begin
	leerDatos(s);
	while (s.dni <> 0) do 	// esto no va pero es para terminarlo en cualquier momento
	begin
		agregarAdelante(l,s);
		leerDatos(s);
	end;
end;


var
	l: lista;
	a: alumno;
begin
	l:= nil;

	cargarLista(l);

end.