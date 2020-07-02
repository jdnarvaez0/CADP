program ejercicio15;
type
	corredor = record
		nombre : String;
		apellido : String;
		distanciaRecorrida : Real;
		tiempo : Real;
		pais : String;
		ciudadPartida : String;
		ciudadFinal : String;
	end;

	lista = ^nodo;
	nodo = record
		datos : corredor;
		sig : lista;
	end;

procedure leerDatos(var c:corredor);
begin
	with c do
	begin
		write('Ingrese NOMBRE: ');
		readln(nombre);
		if (nombre <> 'zzz') then 
		begin
			write('Ingrese APELLIDO: ');
			readln(apellido);
			write('Ingrese la DISTANCIA RECORRIDA: ');
			readln(distanciaRecorrida);
			write('Ingrese el TIEMPO (en minutos): ');
			readln(tiempo);
			write('Ingres el PAIS: ');
			readln(pais);
			write('Ingrese la CIUDAD DE PARTIDA: ');
			readln(ciudadPartida);
			write('Ingrese la CIUDAD DONDE FINALIZO: ');
			readln(ciudadFinal);
			writeln('---------------------------------');
		end;
	end;
end;

procedure insertarOrdenado(var l:lista; c:corredor);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.datos:= c;
	act:= l;
	ant:= l; 

	while (act <> nil) and (l^.datos.ciudadPartida < c.ciudadPartida) do 
	begin
		ant:= act;
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
	c: corredor;
begin
	leerDatos(c);
	while (c.nombre <> 'zzz') do
	begin
		insertarOrdenado(l,c);
		leerDatos(c);
	end;
end;

procedure maximo(ciudadActual: string; corredores: Integer; kilometros: Real; var max: Integer; var nomMaximo: string; var kmMaximo: Real);
begin
	if (corredores > max) then 
	begin
		max:= corredores;
		nomMaximo:= ciudadActual;
		kmMaximo:= kilometros;
	end;
end;

procedure procesarInfo(l:lista);
var
	cantTotalCorredores, contMayorCorredoreB, max, corredorBrasil,contBoston, contFinalizar: Integer;
	totalDistancia,totalTiempo, contKilometros, kmMaximo, totalDistanciaBrasil, cantMinutxKM: Real;
	nomMaximo, ciudadActual: string;
begin
	cantTotalCorredores:= 0;
	totalDistancia:= 0;
	totalTiempo:= 0;
	max:= -1;
	kmMaximo:= 0;
	nomMaximo:= '';
	corredorBrasil:= 0;
	totalDistanciaBrasil:= 0;
	contBoston:= 0;
	cantMinutxKM:= 0;
	contFinalizar:= 0;

	while (l <> nil) do 
	begin

		ciudadActual:= l^.datos.ciudadPartida;
		contMayorCorredoreB:= 0;
		contKilometros:= 0;
		while (l <> nil ) and (ciudadActual = l^.datos.ciudadPartida) do 
		begin
			cantTotalCorredores:= cantTotalCorredores + 1;													//inciso a
			totalDistancia:= totalDistancia + l^.datos.distanciaRecorrida;
		 	totalTiempo:= totalTiempo + l^.datos.tiempo;

			contMayorCorredoreB:= contMayorCorredoreB + 1;													//inciso b	
			contKilometros:= contKilometros + l^.datos.distanciaRecorrida;

			if (l^.datos.pais = 'brasil') then 																//inciso c
			begin
				corredorBrasil:= corredorBrasil + 1;
				totalDistanciaBrasil:= totalDistanciaBrasil + l^.datos.distanciaRecorrida;
			end;

			if (l^.datos.ciudadPartida <> l^.datos.ciudadFinal) then										//inciso d 
			begin
				contFinalizar:= contFinalizar + 1;	
			end;

			if (l^.datos.ciudadPartida = 'boston') then 													//inciso e
			begin
				contBoston:= contBoston + 1;
				cantMinutxKM:= cantMinutxKM + (l^.datos.tiempo / l^.datos.distanciaRecorrida);
			end;

			l:= l^.sig;
		end;
		maximo(ciudadActual, contMayorCorredoreB, contKilometros, max, nomMaximo, kmMaximo); // inciso b
	end;

	writeln('La cantidad de corredores a nivel mundial son: ', cantTotalCorredores);						//inciso a
	writeln('La cantidad total de distancia recorrida en todos los participantes es: ', totalDistancia);
	writeln('La cantidad de tiempo total de todos los particiapnets es: ', totalTiempo);

	write('El nombre de la ciudad que convoco la mayor cantidad de corredores es: ', nomMaximo);			// inciso b
	writeln(' Y la cantidad total de kilometros recorridos por los kilometros de la ciudad ', nomMaximo, ' es: ', kmMaximo);

	writeln('La distancia prmedio recorrida por corredores de Brasil es: ', totalDistanciaBrasil / corredorBrasil);	// inciso c

	writeln('La cantidad de corredores que partieron de una ciudad y finalizaron en otra son: ', contFinalizar);

	writeln('El promedio de los corredores de la ciudad de Boston es: ', cantMinutxKM / contBoston); //inciso e
end;
	
var
	l: lista;
	c:  corredor;

begin
	l:=nil;

	cargarLista(l);
	procesarInfo(l);
	readln();

end.