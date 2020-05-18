{1. Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números
leídos son iguales”}

program ejercicio1;
	var
		num1,num2: Integer;
begin
	writeln('Ingrese dos numeros');
	readln(num1);
	readln(num2);

	if num1 = num2 then
	begin
		writeln('Los numeros leidos son iguales');
	end
	else
		if num1 > num2 then
		begin
			writeln(num1, ' Es mayor que ', num2 );
		end
		else
			writeln(num2, ' Es mayor que ', num1 );
	readln();
end.
