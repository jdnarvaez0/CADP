program ejercicio7;
const
	dimF = 24; //tamno del vector para las notas de cada alumno
type
	str40 = String[40];
	rangoMateria = 1..24;

	vMateria = array[rangoMateria] of Real; 

	alumno = record
		numAlumno : Integer;
		apellido : str40;
		nombre : str40;
		mail : str40;
		anioIngreso : Integer;
		anioEgreso : Integer;
		notaMateria : vMateria; 
	end;

	lista = ^nodo;
	nodo = record
		datos : alumno;
		sig : lista;
	end;

procedure cargarVectorMateria(var vm: vMateria);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		write('Ingrese la nota de la MATERIA ', i, ' :' );
		readln(vm[i]);
	end;
end;

procedure ordenarVector(var vm:vMateria);
var
	i,j,p: Integer;
	aux: Real;
begin
	for i := 1 to dimF-1 do 
	begin
		p:= i;
		for j := i+1 to dimF do 
		begin
			if (vm[j] < vm[p]) then 
				p:= j;
		end;
		aux:= vm[p];
		vm[p]:= vm[i];
		vm[i]:= aux;
	end;
end;

procedure leerAlumno(var a:alumno);
begin
	with a do 
	begin
		write('Ingrese NUMERO DE ALUMNO: ');
		readln(numAlumno);
		if (numAlumno <> -1) then 
		begin
			write('Ingrese el APELLIDO: ');
			readln(apellido);
			write('Ingrese el NOMBRE: ');
			readln(nombre);
			write('Ingres el MAIL: ');
			readln(mail);
			write('Ingrese ANIO DE INGRESO: ');
			readln(anioIngreso);
			write('Ingrese ANIO EGRESO: ');
			readln(anioEgreso);
			cargarVectorMateria(notaMateria);
			ordenarVector(notaMateria);

			writeln('--------------------------------------------');
		end;
	end;
end;

procedure agregarAdelante(var l:lista; a:alumno);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= a;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarAlumnos(var l:lista);
var
	a: alumno;
begin
	leerAlumno(a);
	while (a.numAlumno <> -1) do 
	begin
		agregarAdelante(l,a);
		leerAlumno(a);
	end;
end;


function promedioNotas(nota: vMateria): Real;
var
	i: Integer;
	sumaNota: Real;
begin
	sumaNota:= 0;

	for i := 1 to dimF do 	
	begin
		sumaNota:= sumaNota + nota[i];
	end;
	promedioNotas:= sumaNota;
end;

function descomponer(numeroAlumno: Integer): Boolean;
var
	dig: Integer;
	ok: Boolean;	
begin
	ok:= true;

	while (numeroAlumno <> 0) and (ok)  do 	
	begin
		dig:= numeroAlumno mod 10;
		if (dig mod 2 = 1) then 
		else
			ok:= false;
		numeroAlumno:= numeroAlumno div 10;
	end;
	descomponer:= ok;
end;

procedure masRapisoSeRecibieron(a:alumno; calAnios: Integer; var min1,min2: Integer; var nomMin1,nomMin2: String; var apellMin1,apellMin2: String; var mailMin1, mailMin2: String);
begin
	if (calAnios < min1) then 	
	begin
		min2:= min1;
		apellMin2:= apellMin1;
		nomMin2:= nomMin1;
		mailMin2:= mailMin2;
		min1:= calAnios;
		apellMin1:= a.apellido;
		nomMin1:= a.nombre;
		mailMin1:= a.mail;
	end
	else
		if (calAnios < min2) then 
		begin
			min2:= calAnios;
			apellMin2:= a.apellido;
			nomMin2:= a.nombre;
			mailMin2:= a.mail;
		end;
end;

procedure procesarInfo(l:lista);
var
	cantC: Integer;
	calAnios, min1,min2: Integer;
	nomMin1, nomMin2, apellMin1,apellMin2,mailMin1,mailMin2: String;

begin

	cantC:= 0;
	min1:= 9999;
	min2:= 9999;
	nomMin1:='';
	nomMin2:='';
	apellMin1:='';
	apellMin2:='';
	mailMin1:='';
	mailMin2:='';

	while (l <> nil) do 	
	begin
		
		writeln('El proemedio para el alumno ', l^.datos.nombre, ' es: ', promedioNotas(l^.datos.notaMateria) / dimF);

		if (l^.datos.anioIngreso = 2012) and (descomponer(l^.datos.numAlumno)) then 
			cantC:= cantC + 1;

		calAnios:= l^.datos.anioEgreso - l^.datos.anioIngreso;
		masRapisoSeRecibieron(l^.datos,calAnios,min1,min2,nomMin1,nomMin2,apellMin1,apellMin2,mailMin1,mailMin2);


		l:= l^.sig;
	end;
	writeln('La cantidad de alumnos ingresantes 2012 y numoro de alumno es unicamente digitos impares son: ', cantC);
	writeln('El alumno mas rapido que se recibio es ', apellMin1,' ', nomMin1, ' con mail: ', mailMin1 );
	writeln('El segundo alumnos mas rapido se recibio es ', apellMin2, ' ', nomMin2, ' con mail: ', mailMin2);
end;

procedure eliminar(var l:lista; nAlumno: Integer);
var
	ant,act: lista;
begin
	if (l <> nil) then 
	begin
		ant:= l;
		act:= l;
	end;

	while ((act <> nil) and (act^.datos.numAlumno <> nAlumno)) do
	begin
		ant:= act;
		act:= act^.sig;
	end;

	if (act <> nil) then 
	begin
		if (act = l) then 
			l:= l^.sig;
	end
	else
		ant^.sig:= act^.sig;
	dispose(act);
end;

var
	l: lista;
	nAlumno: Integer;

begin
	l:= nil; 

	cargarAlumnos(l);
	procesarInfo(l);

	writeln('Ingrese el numero de alumon a eliminar: ');
	readln(nAlumno);
	eliminar(l,nAlumno);

end.