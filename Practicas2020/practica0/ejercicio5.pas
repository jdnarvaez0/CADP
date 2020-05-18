{. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X),
la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la
cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de
caramelos que se quedará para sí mismo.
b. Si cada caramelo tiene un valor de $1.60, imprima en pantalla el dinero que deberá
cobrar el kiosquero}

program ejercicio5;
const
	precio = 1.60;
var
	cantCaramelos, cantClientes: Integer;
	total: Real;
	
begin
	write('Ingrese la cantidad de CARAMELOS: ');
	readln(cantCaramelos);
	write('Ingrese la cantidad de CLIENTES: ');
	readln(cantClientes);

	total:= cantCaramelos div cantClientes;

	writeln('La cantidad de caramelos que le corresponde a los clientes es: ', total:2:2);
	writeln('La cantidad de dinero que debe detener el Kioskero es: ', cantCaramelos * precio:2:2);
	readln();

end.