program ejercicio3;

type
	viaje = record
		numViaje : Integer;
		codAuto : Integer;
		direOrigen : String;
		direDestino : String;
		kmRecorridos : Real;
	end;

	lista = ^nodo;			// se DISPONE
	nodo = record
		datos : viaje;
		sig : lista;
	end;

procedure leerDatos(var v:viaje);
begin
	with v do
	begin
		write('Ingres NUMERO DE VIAJE: ');
		readln(numViaje);
		if (numViaje <> 0) then
		begin
			write('Ingrese CODIGO DE AUTO: ');
			readln(codAuto);
			write('Ingrese DIRECCION ORIGEN: ');
			readln(direOrigen);
			write('Ingrese DIRECCIO DESTINO: ');
			readln(direDestino);
			write('Ingrese KILOMETROS RECORRIDOS: ');
			readln(kmRecorridos);
			writeln('------------------------------');
		end;
	end;
end;

procedure insertarOrdenado(var l2:lista; v:viaje);
var
	nue,act,ant: lista;
begin
	new(nue);
	nue^.datos:= v;
	act:=l2;
	ant:=l2;

	while (act <> nil) and (v.numViaje > act^.datos.numViaje) do 
	begin
		ant:= act;
		act:= act^.sig;
	end;

	if (act = ant) then 
		l2:= nue
	else
		ant^.sig:=nue;
	nue^.sig:= act;
end;

procedure agregaraAdelante(var l:lista; v:viaje);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= v;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarLista(var l: lista);
var
	codActual: Integer;
	v: viaje;
begin
	leerDatos(v);
	while (v.numViaje <> 0) do 	
	begin
		codActual:= v.codAuto;
		while (v.numViaje <> 0) and (v.codAuto = codActual) do 
		begin
			//debo de hacer otro while? porque dice que puede existir 1 o mas viajes
			agregaraAdelante(l,v);
			leerDatos(v);
		end;
	end;
end;

procedure maxiCodigo(km: Real; codigo:Integer; var max1,max2: Real; var codMax1, codMax2: Integer);
begin
	if (km > max1) then 
	begin
		max2:= max1;
		codMax2:= codMax1;
		max1:= km;
		codMax1:= codigo;
	end
	else
		if (km > max2) then 
		begin
			max2:= km;
			codMax2:= codigo;
		end;
end;

procedure procesarInfo(l:lista; var l2:lista);
var
	max1,max2: Real;
	codMax1, codMax2: Integer;
begin
	max1:= -1;
	max2:= -1;
	codMax1:= 0;
	codMax2:= 0;

	while (l <> nil) do 
	begin
		maxiCodigo(l^.datos.kmRecorridos, l^.datos.codAuto, max1,max2,codMax1,codMax2);

		if (l^.datos.kmRecorridos > 5) then
			insertarOrdenado(l2, l^.datos);
	end;
	writeln('El codigo maximo 1 fue: ', codMax1);
	writeln('El codigo maximo 2 fue: ', codMax2);
end;


var
	l,l2: lista;
	
begin
	l:= nil;
	l2:= nil;

	cargarLista(l);
	procesarInfo(l,l2);
	readln();
end.