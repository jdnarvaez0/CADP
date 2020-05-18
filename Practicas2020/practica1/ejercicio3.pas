{3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente. Por
ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10}

program ejercicio3;
var
	num1,num2,num3: Integer;
	
begin

	writeln('Ingrese tres numero enteros: ');
	readln(num1);
	readln(num2);
	readln(num3);
	
	if (num1 > num2) then 
	begin
		if (num1 > num3) then
		begin
			write(num1,' ');
			if (num2 > num3) then 
				writeln(num2, ' ', num3)
			else
				writeln(num3, ' ', num2);
		end
		else
			writeln(num3,' ', num1,' ', num2);
	end;


	if (num2 > num3 ) then 
		writeln(num2);
		if (num3 > num1) then 
		begin
			writeln(num3,' ', num1);
		end
		else
			writeln(num1,' ', num3);
	readln();
end.