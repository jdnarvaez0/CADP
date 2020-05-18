program ejercicio13a;
const
	Pi = 3.1415;
procedure circulo(radio:Real; var diametro: Real; var perimetro: Real);
begin
	diametro:= 2 * radio;
	perimetro:= 2 * pi*radio;
end;
var
	nombrePlanetea: String;
	radio, diametro, perimetro: Real;
	distancia, contPlanetas: Integer;
begin

	write('Ingrese el NOMBRE DEL PLANETA: ');
	readln(nombrePlanetea);
	write('Ingrese el RADIO DEL PLANETEA: ');
	read(radio);
	write('Ingrese DISTANCIA del planeta: ');
	readln(distancia);

	while radio <> 0 do 
	begin

		circulo(radio,diametro,perimetro);

		if  (diametro >= 6.780) and (diametro <= 12.700) then 
		begin
			writeln('Nombre: ', nombrePlanetea);
			writeln('Distancia: ', distancia, ' Km');
		end;

		if (perimetro > 439.264) then 
		begin
			contPlanetas:= contPlanetas + 1;
		end;

		write('Ingrese el NOMBRE DEL PLANETA: ');
		readln(nombrePlanetea);
		write('Ingrese el RADIO DEL PLANETEA: ');
		read(radio);
		write('Ingrese DISTANCIA del planeta: ');
		writeln('-----------------------------');
		readln(distancia);
	end;
end.