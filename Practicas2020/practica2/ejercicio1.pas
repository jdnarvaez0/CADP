{1.Realizar un programa que lea 10 números enteros e informe la suma total de
los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números
mayores a 5
}

program ejercicio1;
const
	max = 10;
var
	num, suma,i: Integer;
begin
	suma:= 0;

	for i := 1 to max do 
	begin
		write('ingrese un numero: ');
		readln(num);

		suma:= suma + num;
	end;
	write('El total de la suma es: ', suma);
	readln();
end.