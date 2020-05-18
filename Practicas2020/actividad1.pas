{Realizar un programa que lea información de las piezas utilizadas en la fabricación de un automóvil, de
cada pieza se conoce: código de pieza, código del modelo del automóvil, stock actual, stock mínimo,
peso y precio.
Informar:
●	Cantidad de piezas necesarias para la fabricación del automóvil con código de modelo 20 y si es
	posible fabricarlo (hay stock de todas su piezas).
● 	Cantidad de piezas cuyo stock actual supera al stock mínimo en un 10%.
●	Porcentaje de piezas cuyo peso es inferior a 10kg y su precio no supera los $10000.
●	El código de pieza en el que la fábrica tiene más plata invertida.

Nota​: la lectura de las piezas finaliza cuando se lee la pieza con código de pieza 0, que debe
procesarse. Los códigos de piezas no se repiten
}


program actividad1;
var
	codPieza, codModelo, stockActual, stockMinimo: Integer;
	contTotal, cont2, cantPiezas20, cantPiezaSupera, cod1: Integer;
	puedoFabricar20: Boolean;
	peso, precio, porcentaje, precioPieza,max1: Real;
	
begin
	contTotal:=0;
	cantPiezas20:=0;
	cantPiezaSupera:=0;
	cont2:=0;
	cod1:= 0;
	puedoFabricar20:= true;
	precioPieza:=0;
	max1:= -1;

	repeat
		
		write('Ingrese CODIGO DE PIEZA: ');
		readln(codPieza);
		write('Ingrese CODIGO DEL MODELO DEL AUTOMOVIL: ');
		readln(codModelo);
		write('Ingrese STOCK ACTUAL: ');
		readln(stockActual);
		write('Ingrese STOCK MINIMO: ');
		readln(stockMinimo);
		write('Ingrese EL PESO: ');
		readln(peso);
		write('Ingres EL PRECIO: ');
		readln(precio);
		writeln('-------------------------------------');

		contTotal:= contTotal + 1;

		//inciso 1		
		if (codModelo = 20) then 
		begin
			cantPiezas20:= cantPiezas20 + 1;

			if (stockActual = 0) then 
			begin
				puedoFabricar20 := false;
			end;
		end;

		//inciso 2
		if (stockMinimo * 1.1 = stockMinimo) then 
		begin
			cantPiezaSupera:= cantPiezaSupera + 1;
		end;


		//inciso 3
		if (peso < 10) and (precio <= 10000) then 
			cont2:= cont2 + 1;
			


		//inciso 4
		precioPieza:= stockActual * precio;
		if (precioPieza > max1) then 
		begin
			max1:= precioPieza;
			cod1:= codPieza;
		end;

	until (codPieza = 0);



	writeln('La cantidad de piezas para fabricar el auto modelo 20 son: ', cantPiezas20);
	if puedoFabricar20 = true then 
	begin
		writeln('El auto se puede de modelo 20 se puede fabricar, tiene stock de todas sus piezas');
	end
	else
		writeln('El auto de modelo 20 no se puede fabricar, no tiene stock para hacer el auto');

	writeln('La cantidad de piezas que superan el stock actual al stock minimo un 10% es: ', cantPiezaSupera);
	porcentaje:= (cont2 * 100) / contTotal;
	writeln('El porcentaje cuyo peso es inferior a 10kg y no supera $10000 es: ', porcentaje);
	writeln('El codigo de pieza en el que la fabrica tiene mas plata invertida es: ', cod1);

	readln();
end.
	