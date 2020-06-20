{Realice un programa que lea y almacene el salario de los empleados de una empresa de turismo (a
lo sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o
cuando se completa el vector. Una vez finalizada la carga de datos se pide:

a. Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello,
implemente un módulo que reciba como parámetro un valor real X, el vector de
valores reales y su dimensión lógica y retorne el mismo vector en el cual cada elemento
fue multiplicado por el valor X.

b.Realizar un modulo que muestre en pantalla el sueldo promedio de los empleados de la
empresa.
}

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

	while (dimL < dimF) and (num <> 0) do 
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

function promedio(v:vsalario; dimL:Integer): real;
var
	i: Integer;
	suma: Real;
begin
	suma:=0;
	for i := 1 to dimL do 
		suma:= suma + v[i];
	promedio:= suma / dimF;
end;

procedure imprimirVector(v:vsalario; dimL:Integer);
var
	i: Integer;
begin
	for i := 1 to dimL do 
	begin
		writeln(v[i]);
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
	writeln('El promedio de los salarios es: ', promedio(v,dimL));
	readln();
		
end.

