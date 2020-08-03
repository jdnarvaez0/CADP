program parcial;
const
	dimF = 4;
type
	rangoCodigo = 1..4;

	suscripcion = record 				//se dispone
		codigo : rangoCodigo;
		nombreSucripcion : String;
		costoMensula : Real;
		cupo : Integer;
		precio : Real;
	end;

	cliente = record
		nombre : String;
		dni: Integer;
		edad: Integer;
		codigoTipo : rangoCodigo;
	end;

	vSuscripcion = array[1..dimF] of suscripcion;
	vContador = array[1..dimF] of Integer;

	lista = ^nodo;
	nodo = record
		datos : cliente;
		sig: lista;
	end;

procedure inicializarVectorContador(var vc:vContador);
var
	i: Integer;
begin
	for i := 1 to dimF do 
		vc[i]:= 0;
end;

procedure cargarVectorSucripcion();		//se dispone
begin
end;

procedure leerClientes(var c:cliente);
begin
	with c do 
	begin
		write('Ingrese el NOMBRE: ');
		readln(nombre);
		write('Ingrese el DNI: ');
		readln(dni);
		write('Ingrese EDAD: ');
		readln(edad);
		write('Ingrese CODIGO: ');
		readln(codigoTipo);
		writeln('-------------------');
	end;
end;

procedure agregarAdelante(var l: lista; c:cliente);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= c;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarListaClientes(var l: lista);
var
	c: cliente;
	vs: vSuscripcion;
	contSpinning: Integer;
begin
	contSpinning:= 0;

	leerClientes(c);
	while (c.nombre <> 'zzz') and (contSpinning <= vs[2].cupo) do 
	begin
		if c.codigoTipo = 2 then 
			contSpinning:= contSpinning + 1;	
		agregarAdelante(l,c);
		leerClientes(c);
	end;
end;

procedure ImprimirVectorContador(vc:vContador);
var
	i: Integer;
begin
	for i := 1 to dimF do 
		writeln('En la actividad ', i, ' hay :', vc[i], ' Clientes inscriptos');
end;

procedure procesarInfo(l:lista; var vc:vContador);
begin
	while (l <> nil) do 	
	begin
		vc[l^.datos.codigoTipo]	:= vc[l^.datos.codigoTipo] + 1;

		if (l^.datos.codigoTipo = 4) then 
			writeln('Nombre: ', l^.datos.nombre);
			writeln('Edad: ', l^.datos.edad);

		l:= l^.sig;
	end;
	ImprimirVectorContador(vc);
end;


var
	l: lista;	
	vs: vSuscripcion;
	vc: vContador;
begin
	l:= nil;
	inicializarVectorContador(vc);
	cargarVectorSucripcion(); 		// se dispone
	cargarListaClientes(l);
	procesarInfo(l, vc);
end.