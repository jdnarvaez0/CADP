{2. Realice un programa que lea 10 números e informe cuál fue el mayor
número leído. Por ejemplo, si se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”
}
program ejercicio2;
const
	dF = 10;

var
	max, num,i: Integer;	
begin
	max:= -1;

	for i := 1 to dF do 
	begin
		write('Ingrese un numero: ');
		readln(num);

		if num > max then 
		begin
			max:= num;
		end;
	end;
	write('El numero mayor es: ', max);
	readln();
	
end.