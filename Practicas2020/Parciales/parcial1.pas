program parcial;
const
	dimF = 10;
type
	rangoCodigo = 1..10;

	cliente = record
		dni : Integer;
		edad : Integer;
		codigo : rangoCodigo; 
	end;

	tipoSuscripcion = record
		codigo : rangoCodigo;
		precio : Real;
	end;

	lista = ^nodo;
	nodo = record
		datos : cliente;
		sig :  lista;
	end;
	vPrecios = array[1..dimF] of Real;						//se dispone
	vContador = array[1..dimF] of Integer;

procedure cargarVectorPrecios(vp: vPrecios);				//se dispone
begin
end;

procedure leerTipoSuscripcion(var t:tipoSuscripcion);		//se dispone
begin
end;

procedure inicializarVectorContador(var vc:vContador);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		vc[i]:= 0;
	end;
end;

procedure leerCliente(var c:cliente); 		
begin
	with c do 
	begin
		write('Ingrese DNI: ');
		readln(dni);
		write('Ingrese EDAD: ');
		readln(edad);
		write('Ingrese CODIGO: ');
		readln(codigo);
	end;
end;

procedure insertarOrdenado(var l:lista; c:cliente);
var
	nue,act,ant: lista;
begin
	new(nue);
	nue^.datos:= t;
	act:=l;
	ant:=l;

	while (act <> nil) and (c.codigo > l^.datos.codigo) do 
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

procedure agregarCliente(var l:lista);
var
	i: Integer;
	c: cliente;
begin
	for i := 1 to 4 do 
	begin
		leerCliente(c);
		insertarOrdenado(l,c);
	end;
end;

procedure imprimirVector(vc:vContador; l2:lista);
var
	i: Integer;
begin
	for i := 1 to dimF do 	
	begin
		writeln('El monto total para el tipo ', i, ' es: ', vc[i]*l2^.datos.precio);
	end; 
end;

procedure procesarInfo(l:lista; var vc:vContador);
begin
	while (l <> nil) do 
	begin
		vc[l.datos.codigo]:= vc[l^.datos.codigo] + 1;

		l:= l^.sig;
	end;
	imprimirVector(vc);
end;

var
	l: lista;
	l2: lista;
	vc : vContador;
	t: tipoSuscripcion;

begin
	l:= nil;
	leerTipoSuscripcion(t)
	inicializarVectorContador(vc);
	agregarCliente(l);
	procesarInfo(l,vc);
	
end.