program ejercicio6;
type

	str40 = String[40];
	espectro = 1..7;

	sonda = record
		nomSonda : str40;
		duracionMision : Integer;
		costoConstruccion : Real;
		costoMantenimientoM : Real;
		rangoEspectro : espectro;
	end;

	lista = ^nodo;

	nodo = record
		datos : sonda;
		sig : lista;
	end;

	vContador = array[espectro] of Integer;

procedure leerInfo(var s:sonda);
begin
	with s do 
	begin
		write('Ingrese el NOMBRE DE LA SONDA: ');
		readln(s.nomSonda);
		write('Ingrese la duracion de la mision en mese: ');
		readln(duracionMision);
		write('Ingrese el costo de la cosntruccion: ');
		readln(costoConstruccion);
		write('Ingrese el consto de mantenimiento: ');
		readln(costoMantenimientoM);
		write('Ingrse el rango del espectro: ');
		readln(rangoEspectro);
		writeln('------------------------------------');
	end;
end;

procedure inicializarVectorC(var c:vContador);
var
	i: Integer;
begin
	for i := 1 to 7 do 
	begin
		c[i]:=0;
	end;
end;

procedure AgregarAdelante(s:sonda; var l:lista);
var
	nue: lista;
begin

	new(nue);
	nue^.datos:= s;
	nue^.sig:= nil;

	if (l = nil) then 
		l:= nue
	else
		nue^.sig:= l;
		l:= nue;
end;

procedure cargarLista(s:sonda; var l:lista);
begin
	repeat
		leerInfo(s);
		AgregarAdelante(s,l);
	until s.nomSonda = 'gaia';
end;


function cumpleh2020(l:lista): Boolean;
begin
	cumpleh2020:=  (l^.datos.costoConstruccion <= ( l^.datos.costoMantenimientoM * l^.datos.duracionMision)) and (l^.datos.rangoEspectro <> 1);
end;

procedure noFinaciados(l2:lista; var cant: Integer; var sumaTotal: Real);
var
	suma: Real;
begin
	while (l2 <> nil) do 
	begin
		cant:= cant + 1;
		suma:= l2^.datos.costoConstruccion + l2^.datos.costoMantenimientoM;
		sumaTotal:= sumaTotal + suma;
		l2:= l2^.sig;
	end;	
end;


procedure procesar(l:lista; var l1,l2:lista);
var
	sumaTotal: Real;
	cant: Integer;
begin

	while (l <> nil) do 
	begin

		if (cumpleh2020(l)) then
		begin
			writeln('La sonda ', l^.datos.nomSonda, ' CUMPLE con los criterios H2020');
			AgregarAdelante(l^.datos,l1); //lista cumple
		end
		else
			writeln('La sonda ', l^.datos.nomSonda, ' NO CUMPLE cons los criterios H2020');
			AgregarAdelante(l^.datos,l2);//lista no cumple

		l:= l^.sig;
	end;
	noFinaciados(l2,cant,sumaTotal);
	writeln('La cantidad de sondas que no van hacer financiadas son: ', cant, ' y el costo total seria: ', sumaTotal);
end;

procedure imprimirLista(l1:lista); //este proceso es solo para imprimir y mirar si esta generando listas;
begin
	while (l1 <> nil) do 
	begin
		writeln('Nombre sonda: ', l1^.datos.nomSonda);
		writeln('Duracion de la mision: ', l1^.datos.duracionMision);
		writeln('Costo de construccion: ', l1^.datos.costoConstruccion:4:2);
		writeln('Costo de mantenimiento: ', l1^.datos.costoMantenimientoM:4:2);
		writeln('Rango de espectro: ', l1^.datos.rangoEspectro);
		writeln('--------------------------------------------');

		l1:= l1^.sig;
	end;
end;
	
var
	l: lista;
	l1: lista;
	l2: lista;
	s: sonda;
	c: vContador;

begin
	l:= nil;	
	l1:= nil;
	l2:= nil;

	inicializarVectorC(c);
	cargarLista(s,l);

	procesar(l,l1,l2);

	writeln();
	imprimirLista(l1);
	readln();
end.