program ejercicio9;
const
	dimF = 500;
type
	vnombres = array[1..dimF] of String;

procedure cargarVectorAlumnosA(var v:vnombres; var dimL:Integer);
var
	nom: String;
begin
	write('Ingrese el nombre del alumno: ');
	readln(nom);

	while (dimL < dimF) and (nom <> 'zzz') do 
	begin
		dimL:= dimL + 1;
		v[dimL]:= nom;

		write('Ingrese el nombre del alumno: ');
		readln(nom);
	end;
end;

function posicion(v:vnombres; dimL:Integer; nomEliminar: String): Integer;
var
	i: Integer;
begin

	for i := 1 to dimL do 
	begin
		if (v[i] = nomEliminar) then 
		begin
			posicion:= i;
		end;
	end;
end;

procedure eliminarNombre(var v: vnombres; var dimL: Integer; var ok: Boolean);
var
	i, pos: Integer;
	nomEliminar: String;
begin
	nomEliminar:= '';
	ok:= false;

	write('Ingres el nombre a eliminar: ');
	readln(nomEliminar);
	pos:= posicion(v,dimL,nomEliminar);

	if (pos >= 1) and (pos <= dimL) then 
	begin
		for i := pos to (dimL - 1) do 
			v[i]:= v[i + 1];
		ok:= true;
		dimL:= dimL - 1;
	end;
end;

procedure insertarNombre(var v: vnombres; var dimL:Integer);
var
	i: Integer;
	nomInsertar: String;

begin
	nomInsertar:= '';

	write('ingrese el nombre a insertar: ');
	readln(nomInsertar);

	if (((dimL + 1) <= dimF)) and (4 <= dimL) and (4 >= 1) then 
	begin
		for i := dimL downto  4 do
			v[i+1]:= v[i];
		
		v[4]:= nomInsertar;
		dimL:= dimL + 1;

	end;
end;

procedure agregarNombre(var v:vnombres; var dimL: Integer);
var
	nomAgregar: String;
begin

	write('Ingrese nombre a agregar al vector: ');
	readln(nomAgregar);

	if ((dimL + 1) <= dimF) then 	
	begin
		dimL:= dimL + 1;
		v[dimL]:= nomAgregar; 
	end;
end;

	
procedure imprimirVector(v:vnombres; dimL:Integer);
var
	i: Integer;
begin
	for i := 1 to dimL do 
	begin
		writeln(v[i]);
	end;
end;

var
	v: vnombres;
	dimL: Integer;
	ok: Boolean;

begin
	dimL:= 0;

	cargarVectorAlumnosA(v,dimL);
	
	eliminarNombre(v,dimL,ok);
	imprimirVector(v,dimL);
	writeln();

	insertarNombre(v,dimL);
	imprimirVector(v,dimL);
	writeln();

	agregarNombre(v,dimL);
	imprimirVector(v,dimL);
	readln();
	
end.
