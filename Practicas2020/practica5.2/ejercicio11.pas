program ejericio11;
const
	dimF= 200;

type 

	rangoMes= 1..31;

viaje =record
	diaMes : rangoMes;
	montoDinero: Real;
	distanciaKM: Real;
end;

vViajes= array[1..dimF] of viaje;

procedure leerInformacion(var v:viaje);
begin
	with v do 
	begin
		write('Ingrese el dia del viaje: ');
		readln(diaMes);
		write('Ingese el monto de Dinero: ');
		readln(montoDinero);
		write('Ingrese distancia recorrida en KM: ');
		readln(distanciaKM);
		writeln('----------------------------------');
	end;
end;

procedure cargarVector(var vectorV:vViajes; var dimL:integer);
var
	v: viaje;
begin

	leerInformacion(v);
	while (dimL < dimF) and (v.distanciaKM <> 0) do 	
	begin
		dimL:= dimL + 1;
		vectorV[dimL]:= v;

		leerInformacion(v);
	end;
end;



procedure promYMaxDistancia(vectorV:vViajes; dimL:integer);
var
	suma,promedio,max, distMax: Real;
	diaMax,i: integer;
begin
	suma:= 0;
	max:=-9999;
	distMax:=0;
	diaMax:=0;

	for i := 1 to dimL do 
	begin
		suma:= suma + vectorV[i].montoDinero;

		if (vectorV[i].montoDinero > max) then 
		begin
			max:= vectorV[i].montoDinero;
			distMax:= vectorV[i].distanciaKM;
			diaMax:= vectorV[i].diaMes;
		end;
	end;
	promedio:= suma / dimL;
	writeln('El promedio de dinero transportado es: ', promedio:4:2);
	writeln('La distancia mayor dinero transportado es: ', distMax, ' y el dia donde se transporto mas dinero es: ', diaMax);
end;

procedure borrarElementos(var vectorV: vViajes; var dimL:Integer);
var
	i: Integer;
begin
	for i := 1 to dimL do 
	begin
		if (vectorV[i].distanciaKM = 100) then
		begin
			vectorV[i]:= vectorV[i-1];
			dimL:= dimL - 1;
		end;
	end;
end;

procedure imprimirVector(vectorV:vViajes; dimL:integer);
var
	i: Integer;
begin
	for i := 1 to dimL do 
	begin
		writeln('DIAL: ', vectorV[i].diaMes);
		writeln('MONTO DINERO: ', vectorV[i].montoDinero:4:2);
		writeln('DISTANCIA EN KM: ', vectorV[i].distanciaKM:4:2);
	end;
end;

var
	dimL: integer;
	v:viaje;
	vectorV: vViajes;
begin
	dimL:=0;

	cargarVector(vectorV,dimL);
	promYMaxDistancia(vectorV,dimL);
	borrarElementos(vectorV,dimL);
	writeln('------------------');
	imprimirVector(vectorV,dimL);
	readln();
end.
