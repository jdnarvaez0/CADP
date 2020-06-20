program ejercicio5;
const
	dimF = 6;// son 100
	
type
	vnum = array[1..dimF] of Integer;

procedure cargarVector(var v:vnum; var dimL:Integer);
var
	numero: Integer;
begin
	write('Ingrese un numero: ');
	readln(numero);

	while (dimL < 100) and (numero <> 0) do 	
	begin
		dimL:= dimL + 1;
		v[dimL]:= numero;
		write('Ingrese un numero: ');
		readln(numero);
	end;
end;

procedure maximoYMinimo(v:vnum; dimL:Integer; var max,min:Integer; var posMax, posMin: Integer);
var
	i: Integer;
begin
	for i := 1 to dimL do 
	begin
		if (v[i] >= max) then 
		begin
			max:= v[i];	
			posMax:= i;
		end;
			

		if (v[i] <= min) then 
		begin
			min:= v[i];
			posMin:= i;
		end;
	end;
end;
procedure intercambio(var v:vnum; dimL:Integer; max,min:Integer; posMax,posMin:Integer);
var
	i: Integer;
begin

	for i := 1 to dimL do 
	begin
		if (i = posMax) then 
			v[i]:= min
		else
			if (i = posMin) then 
				v[i]:= max;
	end;
	writeln('El elemento Maximo ', max, ' que se encontraba en la posicion ', posMax, ' fue intercambiado con el elemento minimo ', min, ' que se encontraba en la posicion ', posMin);
end;

procedure imprimirVector(v:vnum; dimL:Integer);
var
	i: Integer;
begin
	for i := 1 to dimL do 
	begin
		write(v[i], ' ');
	end;
end;


var
	v: vnum;
	max,min,posMax,posMin,dimL: Integer;	

begin
	max:=-9999;
	min:=9999;
	dimL:=0;
	cargarVector(v,dimL);
	imprimirVector(v,dimL);
	writeln();
	maximoYMinimo(v,dimL,max,min,posMax,posMin);
	intercambio(v,dimL,max,min,posMax,posMin);
	readln();	
end.