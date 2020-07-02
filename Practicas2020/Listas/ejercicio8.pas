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

	while (act <> nil) and (act^.num < valor) do 
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

procedure imprimirLista(L:lista);
begin
	while (L <> nil) do 
	begin
		writeln(L^.num);
		L:= L^.sig;
	end;
end;


var
	pri: lista;
	valor,valorX: Integer;	
begin
	pri:= nil;
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
	readln();
end.


// EL PROCESO armarNodo esta haciendo un AGREGAR ADELANTE;

