{Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro)
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la
fórmula D*PI (o también PI*R*2)}

program ejericicio4;
	const
		PI = 3.1416;
	var
		d,r,a,p: Real;
begin
	writeln('Ingrese el diametro del Cirdulo');
	readln(d);
	r:= d / 2;
	a:= PI * (r*r);
	p:= d*PI;

	writeln('el radio del circulo es: ', r:2:2);
	writeln('El area de lcirculo es: ', a:2:2);
	writeln('El perimetro del circulo es ', p:2:2);
	readln;
end.

