program jugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : Integer;
		sig : lista;
	end;

procedure insertarOrdenado(var pri:lista; valor:Integer);
var
	nue,act,ant: lista;
begin
	new(nue);
	nue^.num:= valor;
	act:=pri;
	ant:=pri;

	while (act <> nil) and (valor > act^.num) do 
	begin
		ant:= act;
		act:= act^.sig;
	end;

	if (act = ant) then 
		pri:= nue
	else
		ant^.sig:=nue;
	nue^.sig:= act;
end;

procedure IncrementarLista(L:lista; valorX: Integer);
begin

	while (L <> nil) do 
	begin
		L^.num:= L^.num + valorX;
		L:= L^.sig;
	end;	
end;

function estaOrdenada(pri:lista): Boolean;
var
	act: lista;
begin
	act:= pri;

	while (act <> nil) and (pri^.num <= act^.num) do 
	begin
		pri:= act;
		act:= act^.sig;
	end;

	if (act = nil) then
		estaOrdenada:= true
	else
		estaOrdenada:= false;
end;

procedure subLista(pri:lista; var L:lista; numA,numB:Integer);
begin
	while (pri <> nil) do
	begin
		if (pri^.num > numA) and (pri^.num < numB) then 
		begin
			insertarOrdenado(L, pri^.num);
		end;
		pri:= pri^.sig;
	end;
end;

procedure imprimirLista(L:lista);
begin
	while (L <> nil) do 
	begin
		writeln(L^.num);
		L:= L^.sig;
	end;
end;

procedure eliminar(var pri:lista; valorB:Integer);
var
	act,ant: lista;
begin
	act:= pri;
	ant:= pri;

	while (act <> nil ) and (act^.num <> valorB) do 
	begin
		ant:= act;
		act:= act^.sig;
	end;

	if (act <> nil) then 
	begin
		if (act = pri) then 
			pri:= act^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

var
	pri: lista;
	L: lista;
	valor,valorX,valorB, numA,numB: Integer;	
begin
	pri:= nil;
	L:=nil;
	write('Ingrese un numero: ');
	readln(valor);

	while (valor <> 0) do 
	begin
		insertarOrdenado(pri, valor);
		write('Ingrese un numero: ');
		readln(valor);
	end;
	imprimirLista(pri);

	write('Ingrese un numeroX: ');
	readln(valorX);
	IncrementarLista(pri, valorX);
	imprimirLista(pri);

	if (estaOrdenada(pri)) then 
		writeln('La lista esta ORDENADA')
	else
		writeln('La lista NO ESTA ORDENADA');

	write('Ingrese el numero a eliminar: ');
	readln(valorB);
	eliminar(pri,valorB);
	writeln();
	imprimirLista(pri);

	write('Ingrese el numero A: ');
	readln(numA);
	write('Ingrese el numero B: ');
	readln(numB);
	subLista(pri,L,numA,numB);
	imprimirLista(L);
	readln();
end.



