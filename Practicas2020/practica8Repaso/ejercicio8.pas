program ejercicio8;
const
	dimF = 7;
type
	fecha = record
		dia : 1..31;
		mes : 1..12;
		ano : 2017.. 2018;
	end;

	hora = record
		hora: 1..24;
		minutos : 1..60;
		segundos : 1..60;
	end;

	codigo = 1..7;

	tranferencia = record
		numCuentaOrigen : Integer;
		dniTitularCuentaOrigen : Integer;
		numCuentaDestino : Integer;
		dniTitularCuentaDestino: Integer;
		fechaTranferencia : fecha;
		horaTranferencia : hora;
		monto : Real;
		codMovito: codigo;
	end;

	lista = ^nodo; 					// se dispone
	nodo = record
		datos : tranferencia;
		sig : lista;
	end;

	vContador = array[1..dimF] of Integer;

procedure inicializarVectorContador(var vc: vContador);
var
	i: Integer;
begin
	for i := 1 to dimF do 
		vc[i]:= 0
end;

procedure leerTranferencia(var t: tranferencia); 	// se dispone
begin
end;

procedure cargarListaTransferencia(var l:lista); // se dispone
begin
end;

procedure insertarOrdenado(var l2:lista; t:tranferencia);
var
	nue,act,ant: lista;
begin
	new(nue);
	nue^.datos:= t;
	act:=l2;
	ant:=l2;

	while (act <> nil) and (t.numCuentaOrigen > act^.datos.numCuentaOrigen) do 
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

procedure generarListaTerceros(l:lista; var l2:lista);
var
	t: tranferencia;
begin
	while (l <> nil) do 
	begin
		if (l^.datos.numCuentaOrigen <> l^.datos.numCuentaDestino) then 	
			insertarOrdenado(l2, t);
	end;
end;

function codMax(vc: vContador): Integer;
var
	i,max: Integer;
begin
	max:= -1;

	for i := 1 to dimF do 	
	begin
		if vc[i] > max then 
		begin
			max:= vc[i];
			codMax:= i;
		end;
	end;
end;

function descomponer(numeroD: Integer): Boolean;
var
	dig,pares,impares: Integer;
begin
	pares:= 0;
	impares:= 0;

	while (numeroD <> 0) do 	
	begin
		dig:= numeroD mod 10;
		if  (dig mod 2 = 0) then 
			pares:= pares + 1
		else
			impares:= impares + 1;
	end;
	if (pares < impares) then 
		descomponer:= true
	else
		descomponer:= false;
end;

procedure procesarInfo(l2:lista; var vc: vContador);
var
	cuentaOrigenActual: Integer;
	montoTotalTerceros: Real;
	codMaximo: Integer;
begin
	codMaximo:= 0;

	while (l2 <> nil) do 
	begin
		cuentaOrigenActual:= l2^.datos.numCuentaOrigen;	
		montoTotalTerceros:= 0;
		while (l2^.datos.numCuentaOrigen = cuentaOrigenActual) and (l2 <> nil) do 
		begin
			montoTotalTerceros:= montoTotalTerceros + l2^.datos.monto;
			vc[l2^.datos.codMovito]:= vc[l2^.datos.codMovito] + 1;

			codMax(vc);	

			if (l2^.datos.fechaTranferencia.mes = 6) and (descomponer(l2^.datos.numCuentaDestino)) then 

			l2:= l2^.sig;
		end;
		writeln('El total tranferido de la cuenta ', cuentaOrigenActual, ' es: ', montoTotalTerceros);

	end;
	writeln('El codigo de motivo que mas tranferiencia a terceros tuvo es: ', codMaximo);
end;


var
	 l: lista;
	 l2: lista;
	 vc: vContador;
begin
	l:= nil;
	l2:= nil;

	inicializarVectorContador(vc);
	cargarListaTransferencia(l);
	procesarInfo(l2,vc);
	readln();
end.
