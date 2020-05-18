{6. Realizar un programa que lea información de 200 productos de un
supermercado. De cada producto se lee código y precio (cada código es un
número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.
}

program ejercicio6;
const
	Df = 200;
type
	rangoCodigo = 1..200;
var
	codigo: rangoCodigo;
	i, dig,codmin1, codmin2, cantProductos: Integer;
	precio, min1, min2: Real;
	ok: Boolean;
begin
	cantProductos:=0;
	min1:= 9999;
	min2:= 9999;

	for i := 1 to Df do
	begin
		write('Ingrese el CODIGO DEL PRODUCTO: ');
		readln(codigo);
		write('Ingrese el PRECIO DEL PRODUCTO: ');
		readln(precio);
		writeln('------------------------------');

		if precio <= min1 then 
		begin
			min2:=min1;
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

		if ((codigo mod 2)= 0) and (precio > 16) then 
		begin
			cantProductos:= cantProductos + 1;
		end;
	end;	
	writeln('Los codigo de los productos mas baratos son: ', min1, ' y ', min2);
	writeln('La cntidad de productos de mas de 16 pesos y con codigo par es: ', cantProductos);
	readln();
end.