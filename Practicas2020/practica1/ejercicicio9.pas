program ejercicio9;
var
	num, resultado: Integer;
	car: Char;
begin
	resultado:= 0;

	writeln('Ingrese un caracter');
	readln(car);

	if ((car = '+') or (car = '-')) then
	begin
		write('Ingrese un numero: ');
		readln(num);

		if car = '+' then
		begin
			while (num <> 0) do  
			begin
				resultado:= resultado + num;
				write('Ingrese un numero: ');
				readln(num);
			end;
		end
		else 
			if car = '-' then 
			begin
				while (num <> 0) do 	
				begin
					resultado:= resultado - num;
					write('ingrese un numero: ');
					readln(num);
				end;
			end;
		end
	else
		writeln('ERRROR');
	writeln('El resultado es: ', resultado);
	readln();
end.
