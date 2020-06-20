program jugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : Integer;
		sig : lista;
	end;

procedure armarNodo(var L:lista; v:Integer);
var
	aux: lista;
begin
	new(aux);
	aux^.num:= v;
	aux^.sig:= L;
	L:= aux;
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
		armarNodo(pri, valor);
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

