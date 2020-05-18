{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar
en pantalla cuáles son los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la
lectura finalice al leer el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la
lectura finalice al leer el número 0, el cual no debe procesarse
}

program ejercicio4a;
var
	num,min1,min2: Integer;
begin
	min1:= 9999;
	min2:= 9999;

	repeat
		write('Ingrese un numero: ');
		readln(num);

		if num < min1  then 
		begin
			min2:= min1;
			min1:= num;
		end
		else
			if num < min2 then 
			begin
				min2:= num;
			end;

	until num = 0;

	writeln('Los dos numeros menores leido son: ', min1, ' y ', min2);
	readln();

end.