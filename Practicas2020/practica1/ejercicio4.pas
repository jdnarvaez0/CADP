{4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}

program ejercicio4;
var
	num,x: Real;
begin
	write('Ingrese un numero');
	readln(x);

	write('ingrese un numero real: ');
	readln(num);

	while x*2 <> num do
	begin
		writeln('Ingrese un numero real');
		readln(num);
	end;
	writeln('Se ha ingresado un valor exactamente el doble de: ', x:2:2);
	readln();
end.
