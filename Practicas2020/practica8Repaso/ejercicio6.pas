program ejercicio6;
type
	rangoCteogiria = 1..7;
	str40 = String[4];

	objeto = record
		codObjeto : Integer;
		categoria: rangoCteogiria;
		nomObjeto : str40;
		distancia : Real;
		nomDescubridor : str40;
		anioDescubrimiento : Integer;
	end;

	lista = ^nodo;
	nodo = record
		datos : objeto;
		sig : lista;
	end;

	vContador = array[rangoCteogiria] of Integer;

procedure cargarVectorContador(var vc:vContador);
var
	i: Integer;
begin
	for i := 1 to 7 do 
	begin
		vc[i]:= 0;
	end;
end;

procedure leerObjeto(var o:objeto);
begin
	with o do 
	begin
		write('Ingrse CODIGO DEL OBJETO: ');
		readln(codObjeto);
		if (codObjeto <> -1) then 
		begin
			write('Ingrese CATEGORIA (1 - 7): ');
			readln(categoria);
			write('Ingrese DISTANCIA: ');
			readln(distancia);
			write('Ingrese el NOMBRE DEL OBJETO: ');
			readln(nomObjeto);
			write('Ingrese NOMBRE DEL DESCUBIRDOR: ');
			readln(nomDescubridor);
			write('Ingrese ANIO DE SU DESCUBRIMIENTO: ');
			readln(anioDescubrimiento);
			writeln('----------------------------------');
		end;
	end;
end;

procedure agregarAtras(var l,ult:lista; o:objeto);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= o;
	nue^.sig:= nil;

	if l = nil then 	
	begin
		l:=nue;
		ult:= nue;
	end
	else
		ult^.sig:= nue;
		ult:= nue;
end;

procedure cargarObjeto(var l,ult:lista);
var
	o: objeto;
begin

	leerObjeto(o);
	while (o.codObjeto <> -1) do 
	begin
		agregarAtras(l,ult,o);
		leerObjeto(o);
	end;
end;

procedure objetosLejanos(o: objeto; var codMax1,codMax2: Integer);
var
	max1,max2: Real;
begin
	max1:= -1;
	max2:= -1;
	
	if (o.distancia > max1) then 
	begin
		max2:= max1;
		codMax2:= codMax1;
		max1:= o.distancia;
		codMax1:= o.codObjeto;
	end
	else
		if (o.distancia > max2) then 
		begin
			max2:= o.distancia;
			codMax2:= o.codObjeto;
		end;
end;

function cumpleInciso2(obj: objeto): Boolean;
begin
	cumpleInciso2:= (obj.nomDescubridor = 'Galileo Galilei') and (obj.anioDescubrimiento < 1600);	
end;

procedure imprimirVectro(vc:vContador);
var
	i: Integer;
begin
	for i := 1 to 7 do 	
	begin
		writeln('Categoria ', i, ' tiene: ', vc[i], ' objetos');
	end;
end;

function cumpleInciso4(codigo: Integer): Boolean;
var
	dig, par, imp: Integer;
begin
	par:= 0;
	imp:= 0;

	dig:= codigo mod 10;
	while (codigo <> 0) do 	
	begin
		if (dig mod 2 = 0) then 
			par:= par + 1
		else
			imp:= imp + 1;

		codigo:= codigo div 10;
	end;
	cumpleInciso4:= par > imp; 
end;

procedure procesarInfo(l:lista; var vc:vContador);
var
	codMax1,codMax2,cantPlanetas: Integer;
begin
	codMax1:= 0;
	codMax2:= 0;
	cantPlanetas:= 0;

	while (l <> nil) do 
	begin
		objetosLejanos(l^.datos, codMax1,codMax2);

		if (cumpleInciso2(l^.datos)) then
			cantPlanetas:= cantPlanetas + 1; 

		vc[l^.datos.categoria]:= vc[l^.datos.categoria] + 1;

		if (cumpleInciso4(l^.datos.codObjeto)) then 
			writeln('nombre ESTRELLA: ', l^.datos.nomObjeto);

		l:= l^.sig;
	end;
	writeln('Los dos codigos de los objetos mas lejanos de la tierra son: ', codMax1, ' y ', codMax2);
	imprimirVectro(vc);
end;

var
	l: lista;
	ult: lista;	
	vc: vContador;

begin
	l:= nil;
	ult:= nil;
	cargarVectorContador(vc);
	cargarObjeto(l,ult);


end.