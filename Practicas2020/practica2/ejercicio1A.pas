{1.Realizar un programa que lea 10 números enteros e informe la suma total de
los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números
mayores a 5
}

program ejericio1a;
const
	max = 10;
var
	num,suma,i,cont: Integer;
begin
	suma:= 0;
	cont:= 0;

	for i := 1 to max do 
	begin
		write('Ingrese un numero: ');
		readln(num);

		suma:= suma + num;

		if num > 5 then
		begin
			cont:= cont + 1;
		end;
	end;
	writeln('El total de la suma es: ', suma);
	writeln('La cantidad de numero mayores a 5 son: ', cont);
	readln();	
end.