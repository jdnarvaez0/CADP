program ejercicio2;

const
	cant_datos = 150;
type
	vdatos = array[1..cant_datos] of Real;

procedure cargarVector(var v:vdatos; var dimL: Integer);
var
	numero: Real;
begin

	write('Ingrese un numero: ');
	readln(numero);

	while (dimL < cant_datos) and (numero <> 0) do 
	begin
		dimL:= dimL + 1;
		v[dimL]:= numero;

		write('Ingrese un numero: ');
		readln(numero);
	end;
	
end;

procedure modificarVEctortorYsumar(var v:vdatos; dimL: Integer; n:Real; var suma: Real);
var
	i: Integer;
begin
	for i := 1 to dimL do 
	begin
		v[i]:= v[i] + n;
		suma:= suma + v[i];
	end;
end;

var
	datos: vdatos;
	dim: Integer;
	num, suma : Real;

begin
	dim:= 0;
	suma:= 0;
	cargarVector(datos, dim);

	write('Ingrese un valor a sumar: ');
	readln(num);

	modificarVEctortorYsumar(datos, dim, num, suma);

	writeln('La suma de los valores es: ', suma:2:2);
	writeln('Se procesaron : ', dim, ' numeros');
	readln();	
end.
