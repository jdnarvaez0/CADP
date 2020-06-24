program ejercicio10;
uses crt;
type
	cliente = record
		dni : Integer;
		turno: Integer;
	end;

	lista = ^nodo;
	nodo = record
		datos : cliente;
		sig : lista;
	end;
	

procedure recibirCliente(var c:cliente; var cont:Integer);
begin
	write('Ingrese el DNI del cliente: ');
	readln(c.dni);

	cont:= cont + 1;
	c.turno:= cont;

end;

procedure agregarAlFinal(var l,ult:lista; c:cliente);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= c;
	nue^.sig:= nil;

	if (l = nil) then 
	begin
		l:= nue;
		ult:= nue;
	end
	else
		ult^.sig:= nue;
		ult:= nue;
end;

procedure imprimirLista(l:lista);
begin
	writeln('-----------------------');

	while (l <> nil) do 
	begin
		writeln('DNI: ', l^.datos.dni);
		writeln('TURNO: ', l^.datos.turno);
		writeln('--------------');

		l:= l^.sig;
	end;
end;

procedure verTurnoSig(l:lista; c:cliente);
var
	aux: lista;
begin
	writeln('### TURNO SIGUENTE ###');
	writeln('DNI: ', l^.datos.dni);
	writeln('TURNO: ', l^.datos.turno);
	aux:= l;
	l:= aux^.sig;
end;

procedure atenderCliente(var l:lista; c:cliente);
var
	aux: lista;
begin
	writeln('### TURNO SIGUENTE ###');
	writeln('DNI: ', l^.datos.dni);
	writeln('TURNO: ', l^.datos.turno);
	aux:= l;
	l:= aux^.sig;
	dispose(aux);
end;

procedure tomarTurno(var c:cliente; var cont:Integer; var l,ult:lista);
begin
	recibirCliente(c,cont);
	agregarAlFinal(l,ult,c);
end;

procedure menu(var opc:Integer);
begin
	writeln('#########MENU#########');
	writeln('1 para tomar TURNO: ');
	writeln('2 ver lista de espera: ');
	writeln('3 Ver Siguiente: ');
	writeln('4 Atender Cliente: ');
	writeln('5 para SALIR: ');
	writeln('######################');
	readln(opc);
end;

var
	l,ult: lista;
	c:cliente;
	opc,cont:Integer;
	exit: Boolean;
begin
	l:= nil;
	ult:= nil;
	exit:= false;
	cont:=0;
	opc:= 0;

	menu(opc);
	while not exit do 
	begin
		case opc of
			1 : tomarTurno(c,cont,l,ult);
			2 : imprimirLista(l);
			3 : verTurnoSig(l,c);
			4 : atenderCliente(l,c);
			5 : exit:= true;
			else
				writeln('Ingreso una opcion erronea ');
		end;
		menu(opc);
	clrscr;	
	end;
end.