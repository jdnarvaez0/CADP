{9. Realizar un programa que lea datos de 100 productos de una tienda de ropa. 
Para cada producto debe leerprecio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
- El código del producto más barato.
- El código del producto de tipo “pantalón” más caro.
}

program ejercicio9;
const
	Df = 4; //100
var
	precio, min, max: Real;
	codigo, i, codMin, codMax: Integer;
	tipo: String;
	
begin
	max:= -1;
	min:= 9999;
	
	for i := 1 to Df do 
	begin
		write('Ingrese precio del  producto: ');
		readln(precio);
		write('Ingrese el codigo del producto: ');
		readln(codigo);
		write('Ingrese el tipo de prenda: ');
		readln(tipo);
		writeln('-----------------------------');

		if precio <= min then 
		begin
			min:= precio;
			codMin:= codigo;
		end;

		if (precio >= max) and (tipo = 'pantalon') then 
		begin
			max:= precio;
			codMax:= codigo;
		end;
	end;

	writeln('El codigo del prodcto mas barato es: ', codMin);
	writeln('El codigo del producto de tipo pantalon mas caro es: ', codMax);
	readln();
end.