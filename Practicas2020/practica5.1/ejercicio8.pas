program ejercicio8;
const
	dimF = 300;
type
	vsalario = array[1..dimF] of Real;

procedure cargarVector(var v: vsalario; var dimL: Integer);
var
	num: Real;
begin
	write('Ingrese numero: ');
	readln(num);

	while (dimL <= dimF) and (num <> 0) do 
	begin
		dimL:= dimL + 1;
		v[dimL]:= num;

		write('Ingrese un numero: ');
		readln(num);
	end;
end;

procedure aumentoSalario(var v:vsalario; dimL:Integer; valorX:Integer);
var
	i: Integer;
	porce: Real;
begin
	for i := 1 to dimL do 
	begin
		porce:= v[i] * 0.15;
		v[i]:= (v[i] * valorX) + porce;
	end;
end;

procedure Infomar(v:vsalario; dimL:Integer);
var
	i: Integer;
	suma: Real;
begin
	suma:= 0;
	for i := 1 to dimL do 
	begin
		suma:= suma + v[i];
	end;

	writeln('El promedio de el sueldo de los trabajadores es: ', suma / dimL:4:2);
end;

procedure imprimirVector(v:vsalario; dimL: Integer);
var
	i: Integer;
begin
	for i := 1 to dimL do 
	begin
		writeln(v[i]:4:2);
	end;
end;

var
	v: vsalario;
	dimL,valorX: Integer;

begin
	dimL:= 0;
	valorX:= 0;

	cargarVector(v,dimL);

	write('Ingrese un valor X: ');
	readln(valorX);
	aumentoSalario(v,dimL,valorX);
	writeln('##################');
	imprimirVector(v,dimL);
	Infomar(v,dimL);
	readln();
		
end.