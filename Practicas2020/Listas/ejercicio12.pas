program ejercicio12;
const
	dimF = 22; //estasd son las versiones disponibles de android actualmente
type

	dispositivo = record
		versionAndroid : Integer;
		tamPantalla : Real;
		RAM : Real;
	end;
	
	lista = ^nodo;
	nodo = record
		datos : dispositivo;
		sig : lista;
	end;

	vContado = array[1..dimF] of Integer;

procedure inicializarVectorContador(var vc:vContado);
var
	i: Integer;
begin
	for i := 1 to dimF do
	begin
		vc[i]:=0;
	end;
end;

procedure insertarOrdenado(var l:lista; d:dispositivo);
var
	nue,act,ant: lista;
begin
	new(nue);
	nue^.datos:= d;
	act:=l;
	ant:=l;

	while (act <> nil) and (d.versionAndroid > act^.datos.versionAndroid) do 
	begin
		ant:= act;
		act:= act^.sig;
	end;

	if (act = ant) then 
		l:= nue
	else
		ant^.sig:=nue;
	nue^.sig:= act;
end;

procedure leerInfo(var d:dispositivo);
begin
	with d do 
	begin
		write('Ingrese la VERSION de android: ');
		readln(versionAndroid);
		write('Ingrese el tamano de pantalla: ');
		readln(tamPantalla);
		write('Ingrese la cantidad de memoria RAM: ');
		readln(RAM);
		writeln('----------------------------------');
	end;
end;

procedure cargarLista(var l:lista);
var
	d: dispositivo;
begin
	leerInfo(d);
	while (d.versionAndroid <> 0) do
	begin
		insertarOrdenado(l,d);
		leerInfo(d);	
	end;
end;

procedure imprimirLista(l:lista);
begin
	while l <> nil do 
	begin
		writeln('VERSIN ANDROID: ', l^.datos.versionAndroid);
		writeln('TAMANO DE PANTALLA : ', l^.datos.tamPantalla:2:2);
		writeln('TAMANO RAM: ', l^.datos.RAM:2:2);
		writeln('------------------------------');
		l:= l^.sig;
	end;
end;

procedure imprimirVector(vc:vContado);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		writeln('La cantidad de dispotivos con la version ', i, ' tiene: ', vc[i]);
	end;
end;

function cumple(ram: Real; pantalla: Real): Boolean;
begin
	cumple:= (ram > 3) and (pantalla <= 5);
end;

procedure procesarInfor(l:lista; var vc:vContado);
var
	cont,ver: Integer;
	contDispositivo, sumaPantalla: Real;

begin
	cont:= 0;
	contDispositivo:= 0;
	sumaPantalla:= 0;

	while (l <> nil) do
	begin

		contDispositivo:= contDispositivo + 1;
		sumaPantalla:= sumaPantalla + l^.datos.tamPantalla;

		ver:= l^.datos.versionAndroid;
		vc[ver]:= vc[ver] + 1; //inciso a

		if (cumple(l^.datos.RAM, l^.datos.tamPantalla)) then 	
			cont:= cont + 1;

		l:= l^.sig;
	end;
	imprimirVector(vc);
	writeln('La cantidad de dispositivo con mas de 3GB de memoria y pantalla de a lo sumo 5` ', cont );
	writeln('El tamano promedio de las pantallas de todos los dispositivos es: ', sumaPantalla / contDispositivo);
end;



var
	l: lista;
	d: dispositivo;

begin
	l:= nil;
	cargarLista(l);

	writeln();
	imprimirLista(l);
	readln();

end.