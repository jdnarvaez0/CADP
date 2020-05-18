{Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional}

program ejercicio1;
var
	num1,num2,suma: Integer;
begin
	writeln('Ingrese dos numeros enteros');
	readln(num1);
	readln(num2);
	suma:=num1+num2;
	writeln('Se ingresaron los valores ', suma);
	readln;
end.
