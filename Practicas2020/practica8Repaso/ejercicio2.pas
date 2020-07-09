program ejercicio2;
type
	str40 = String[40];
	rangoPoliza = 1..6;

	cliente = record
		codCliente : Integer;
		dni : Integer;
		apellido : str40;
		nombre : str40;
		codPoliza : rangoPoliza;
		montoMensual : Real; 
	end;

	lista = ^nodo;
	nodo = record
		datos : cliente;
		sig : lista;
	end;

	vTabla = array[1..6] of Real;

procedure cargarTabla(var vt:vTabla); // se dispone
begin
end;

procedure leerDatos(var c:cliente);
begin
	with c do
	begin
		write('Ingrese el CODIGO DEL CLIENTE: ');
		readln(codCliente);
		write('Ingrese DNI: ');
		readln(dni);
		write('Ingrese APELLIDO: ');
		readln(apellido);
		write('Ingrese NOMBRE: ');
		readln(nombre);
		write('Ingrese COD DE POLIZA (1 a 6): ');
		readln(codPoliza);
		write('Ingrese el MONTO MENSUAL A PAGAR: ');
		readln(montoMensual);
		writeln('---------------------------------');
	end;
end;

procedure agregarAdelante(var l:lista; c:cliente);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= c;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarLista(var l:lista);
var
	c: cliente;
begin
	repeat
		leerDatos(c);
		agregarAdelante(l,c);
	until (c.codCliente = 1122);
end;

procedure imprimirLista(l:lista; vt:vTabla);
begin
	writeln('CODIGO CLIENTE: ', l^.datos.codCliente);
	writeln('DNI: ', l^.datos.dni);	
	writeln('APELLIDO: ', l^.datos.apellido);
	writeln('NOMBRE: ', l^.datos.nombre);
	writeln('CODIGO POLIZA : ', l^.datos.codPoliza);
	writeln('MONTO TOTAL MENSUAL: ', l^.datos.montoMensual + vt[l^.datos.codPoliza]:4:2);
	writeln('--------------------------------------');
end;

function descomponer(dni:Integer): Boolean;
var
	dig,cont: Integer;
begin
	cont:= 0;

	while  ((cont < 2) and (dni <> 0)) do 
	begin
		dig:= dni mod 10;
		if (dig = 9) then 
		begin
			cont:= cont + 1;	
		end;

		dni:= dni div 10;
	end;
	descomponer:= cont >= 2;
end;

procedure procesarInfo(l:lista; vt:vTabla);
begin
	while (l <> nil) do
	begin
		
		imprimirLista(l,vt);

		if (descomponer(l^.datos.dni)) then
		begin
			writeln('APELLIDO: ', l^.datos.apellido);
			writeln('NOMBRE: ', l^.datos.nombre);
			writeln('---------------------------');
		end;

		l:= l^.sig;
	end;
end;

procedure eliminarCod(var l:lista; codElimianar: Integer);
var
	act,ant: lista;
begin
	act:= l;
	ant:= l;
	while (act^.datos.dni <> codElimianar) do
	begin
		ant:= act;
		act:= act^.sig;	
	end;

		if (act = l) then
			l:= l^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
end;

var
	l: lista;
	vt: vTabla;
	codElimianar: Integer;
begin
	cargarTabla(vt);
	cargarLista(l);
	procesarInfo(l,vt);

	write('Ingrese el codigo a eliminar: ');
	readln(codElimianar);
	eliminarCod(l,codElimianar);
	imprimirLista(l, vt); // imprimo de nuevo la lista para mira si fue elimiando el codigo que ingresamos
	readln();
end.