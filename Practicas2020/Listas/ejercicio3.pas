program ejercicio3;
type

	lista = ^nodo;
	nodo = record
		num : Integer;
		sig: lista;
	end;
// procedure armarNodo(var L:lista; n:Integer); //proceso donde se tiene que recorre toda la lista has llegar al ultimo, poco eficiente
// var
// 	nue: lista;
// begin
// 	new(nue);
// 	nue^.num:= n;
// 	nue^.sig:= L;
// 	L:= nue;
// end;


procedure armarNodo(var L, ult:lista; n:Integer); //proceso donde tengo un puntero con el ultimo para no recorrer toda la lista, eficiente;
var
	nue: lista;
begin
	new(nue);
	nue^.num:= n;
	nue^.sig:= nil;

	if (L = nil) then 
	begin
		L:= nue;
		ult:= nue;
	end
	else
		ult^.sig:= nue;
		ult:= nue;
end;

procedure incrementar(L:lista; numX:Integer);
begin
	while (L <> nil) do 
	begin
		L^.num:= L^.num + numX;
		L:= L^.sig;
	end;
end;

procedure imprimiLista(L:lista);
begin
	while (L <> nil) do 
	begin
		writeln(L^.num);
		L:= L^.sig;
	end;
end;

var
	L,ult: lista;
	num,numX: Integer;
	
begin
	L:= nil;
	ult:= nil;
	
	write('Ingrese un numero: ');
	readln(num);
	while (num <> 0) do 
	begin
		armarNodo(l,ult,num);
		write('Ingrese un numero: ');
		readln(num);
	end;
	imprimiLista(L);

	write('Ingrese un numeroX: ');
	readln(numX);
	incrementar(L,numX);
	imprimiLista(L);
	readln();
end.