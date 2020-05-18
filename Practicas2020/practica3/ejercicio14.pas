{14. Realizar una solución ​modularizada para el ejercicio 5 de la práctica 2 que plantea lo siguiente: ​Realizar un
programa que lea información de 200 productos de un supermercado. De cada producto se lee código y precio
(cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par. ​
}

program ejercicio4;
const
	Df = 5; //200
type
	rangoCodigo = 1..200;

procedure masBaratos(precio: Real; codigo: rangoCodigo; var min1:Real; var min2: Real; var codmin1: Integer; var codmin2:Integer);
begin
	if precio <= min1 then 	begin
		min2:= min1;
		codmin2:= codmin1;
		min1:= precio;
		codmin1:= codigo;
	end
	else
		if precio <= min2 then 
		begin
			min2:= precio;
			codmin2:= codigo;
		end;
end;

var
	codigo: rangoCodigo;
	precio,min1, min2: Real;
	codmin1, codmin2, i, cont: Integer;

begin

	min1:=9999;
	min2:=9999;
	codmin1:=0;
	codmin2:=0;
	cont:= 0;


	for i := 1 to Df do 
	begin
		write('Ingrse el CODIGO DEL PRODUCTO: ');
		readln(codigo);
		write('Ingrese el PRECIO DEL PRODUCTO: ');
		readln(precio);
		writeln('------------------------------');

		masBaratos(precio, codigo, min1, min2, codmin1, codmin2);

		if (precio > 16) and ((codigo mod 2) = 0) then 
			cont:= cont + 1;
	end;
	writeln('Los codigos de los dos productos mas baratos son: ', codmin1, ' y ', codmin2);
	readln();
	
end.