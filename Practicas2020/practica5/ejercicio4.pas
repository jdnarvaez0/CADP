program ejercicio4;
const
	dimF = 30;	
type
	vnum = array[1..dimf] of Integer;

procedure cargarVector(var v:vnum);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		v[i]:= random(30);
	end;
end;

function posicion(v:vnum; numX:Integer): Integer;
var
	i: Integer;
	ok: Boolean;
begin
	ok:= false;
	for i := 1 to dimF do 
	begin
		if (numX = v[i]) then 
		begin
			ok:= true;
			posicion:= i;
		end;			
			
		if (ok = false) then 
		begin
			posicion:= -1;
		end;
	end;
end;

procedure intercambio(var v:vnum; numeroX,numY: Integer);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		if (numeroX = v[i]) then 
		begin
			v[i]:= numY;
		end
		else
		    if (numY = v[i]) then 
		    	v[i]:= numeroX;
	end;
end;

procedure sumaVector(v:vnum; var suma: Integer);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		suma:= suma + v[i];
	end;
end;

procedure promedio(v:vnum; var prom: Integer);
var
	i, suma: Integer;
begin
	suma:=0;
	for i := 1 to dimF do 	
	begin
		suma:= suma + v[i];
	end;
	prom:= suma div dimF;
end;

function elementoMaximo(v:vnum): Integer;
var
	max,i: Integer;
begin
	max:= -9999;
	for i := 1 to dimF do 
	begin
		if (v[i] >= max) then 
		begin
			max:= v[i];
			elementoMaximo:= i;
		end;
	end;
end;

function elementoMinimo(v:vnum): Integer;
var
	i,min: Integer;
begin
	min:= 9999;
	for i := 1 to dimF do 
	begin
		if (v[i] <= min) then 	
		begin
			min:= v[i];
			elementoMinimo:= i;
		end;
	end;
end;

procedure imprimirVector(v:vnum);
var
	i: Integer;
begin
	for i := 1 to dimF do
	begin
		write(v[i], ' ');
	end;
end;

var
	v: vnum;
	numX,numeroX, numY,suma, prom: Integer;
begin
	cargarVector(v);
	imprimirVector(v);
	writeln();

	write('Ingrese el varlor X: ');
	readln(numX);
	writeln('La posicion del nuero es (si no se encuentra devolvera -1) : ', posicion(v,numX));
	writeln();

	write('Ingrese el valores x para intercambaiar: ');
	readln(numeroX);
	readln(numY);
	intercambio(v,numeroX,numY);
	imprimirVector(v);
	writeln();

	sumaVector(v,suma);
	writeln('La suma total de los elementos del vector es: ', suma);
	writeln();

	promedio(v,prom);
	writeln('El promedio de los elementos del vector son: ', prom);

	writeln('El elemento Maximo del vector esta en la posicion: ', elementoMaximo(v));
	writeln('El elemento Minimo del vector esta en la posicion: ', elementoMinimo(v));
	readln();
end.

