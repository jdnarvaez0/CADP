program ejericicio13;
const
	Pi = 3.1415;
procedure circulo(radio:Real; var diametro: Real; var perimetro: Real);
begin
	diametro:= 2 * radio;
	perimetro:= 2*pi*radio;
end;

var
	radio,diametro,perimetro: Real;
begin
	write('Ingrese el radio de un circulo: ');
	readln(radio);

	circulo(radio, diametro, perimetro);
	writeln('El DIAMETRO del circulo es: ', diametro:2:2);
	writeln('El PERIMETRO del circulo es: ', perimetro:2:2);
	readln();
end.