program ejercicio3;
type

	lista = ^nodo;
	nodo = record
		num : Integer;
		sig: lista;
	end;
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

function maximo(L:lista): Integer;
var
	max: Integer;
begin
	max:= -999;

	while (L <> nil) do 
	begin
		if (L^.num > max) then 
		begin
			max:= L^.num;			
		end;
		L:= L^.sig;
	end;
	maximo:= max;
end;


function minimo(L:lista): Integer;
var
	min: Integer;
begin
	min:=9999;

	while (L <> nil) do 
	begin
		if (L^.num < min) then 
		begin
			min:= L^.num;
		end;
		L:=L^.sig;
	end;
	minimo:= min;
end;

function esMultiplo(num: Integer; valorA:Integer): Boolean;
begin
	esMultiplo:= num mod valorA = 0;
end;

function multiplos(L:lista; valorA: Integer): Integer;
var
	cont: Integer;
begin
	cont:= 0;

	while (L <> nil) do 
	begin
		
		if esMultiplo(L^.num,valorA) then 
			cont:= cont + 1;
		L:= L^.sig;
	end;
	multiplos:= cont;
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
	num,numX, valorA: Integer;
	
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

	
	writeln('El numero MAXIMO  de la lista es: ', maximo(L));
	writeln('El numero MINIMO de la lista es: ', minimo(L));

	write('Ingrese el valor A: ');
	readln(valorA);
	writeln('La cantidad de multiplos del valorA en la lista son: ', multiplos(L,valorA));
	readln();
end.
