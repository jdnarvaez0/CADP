{Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del
dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la 
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
20,54 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 213,61 pesos argentinos
(resultado de multiplicar 10*20,54 y adicionarle el 4%)}

program ejercicio6;
var
	totalDolar, valorDolarDia, comisionBanco, porcentaje, total: Real;	
begin

	write('Ingrese el monto total en dolares: ');
	readln(totalDolar);
	write('Ingrese el valor del DOLAR AL DIA de la fecha: ');
	readln(valorDolarDia);
	write('Ingrese el porcentaje de comision del banco: ');
	readln(comisionBanco);

	porcentaje:= (totalDolar * valorDolarDia * comisionBanco)/100;
	total:= (totalDolar * valorDolarDia) + porcentaje;

	writeln('La transacion sera de ', total:2:2, ' pesos argentinos');
	readln();
	
end.