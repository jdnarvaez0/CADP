program parcial;
type
	rangoFecha = record
		dia : 1..31;
		mes : 1..12;
	end;

	venta = record
		codigo : Integer;
		fecha : rangoFecha;
		dniCliente : Integer;
		monto : Real;
	end;

	lista = ^nodo;
	nodo = record
		datos : venta;
		sig : lista;
	end;

procedure leerFecha(var f:rangoFecha);
begin
	with f do
	begin
		write('Ingrese el DIA: ');
		readln(dia);
		write('Ingrese el MES: ');
		readln(mes);
	end;
end;

procedure leerVenta(var v:venta);
var
	f: rangoFecha;
begin
	with v do
	begin
		write('Ingrese DNI: ');
		readln(dniCliente);
		if (dniCliente <> -1) then 
		begin
			write('Ingrese CODIGO: ');
			readln(codigo);
			leerFecha(f);
			write('Ingrese el MONTO: ');
			readln(monto);
			writeln('------------------------');
		end;
	end;
end;

procedure insertarOrdenado(var l:lista; v: venta);
var
	nue,act,ant: lista;
begin
	new(nue);
	nue^.datos:= v;
	act:=l;
	ant:=l;

	while (act <> nil) and (v.dniCliente > act^.datos.dniCliente) do 
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

procedure cargarLista(var l:lista);
var
	v: venta;
	dniActual : Integer;
begin
	leerVenta(v);
	while (v.dniCliente <> -1) do 
	begin
		dniActual:= v.dniCliente;
		while (v.dniCliente = dniActual) do 
		begin
			insertarOrdenado(l,v);
			leerVenta(v);
		end;
	end;
end;

function cumpleCondicion(f:rangoFecha): Boolean;
begin
	cumpleCondicion:= (f.mes >= 2) and (f.mes <= 8);
end;

function descomponer(codigo: Integer): Boolean;
var
	dig, par, impar: Integer;
begin
	par:= 0;
	impar:= 0;
	
	while (codigo <> 0) do  
	begin
		dig:= codigo mod 10;
		if (dig mod 2 = 0) then 
			par:= par + 1
		else
			impar:= impar + 1;
		codigo:= codigo div 10;
	end;
	descomponer:= par = impar;
end;
	
procedure procesarInfo(l:lista);
var
	montoTotal, sumaMonto: Real;
	dniActual,contMes: Integer;
begin
	sumaMonto:= 0;
	contMes:= 0;
	montoTotal:= 0;

	while (l <> nil) do 
	begin
		dniActual:= l^.datos.dniCliente;	
		while (l^.datos.dniCliente = dniActual) and (l <> nil) do 	
		begin
			montoTotal:= montoTotal + l^.datos.monto;

			if (cumpleCondicion(l^.datos.fecha) and (descomponer(l^.datos.codigo))) then 
			begin
				contMes:= contMes + 1;
				sumaMonto:= sumaMonto + l^.datos.monto;
			end;

			l:= l^.sig;
		end;
		writeln('El monto total para el cliente ', dniActual, ' es: ', montoTotal);
	end;
	writeln('El porncetaje de ventas entre Febrero y Septiembre es de: ', sumaMonto / contMes);
end;

var
	l: lista;
begin
	l:= nil;

	cargarLista(l);
end.