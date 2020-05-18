{a. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números 
 e imprimacantidad total de dígitos leídos.
 La lectura finaliza al leer un número cuyos dígitos suman
exactamente 10, el cual debe procesarse.
}

program ejercicio10a;
procedure sumaDigitos(num: Integer; var cantDigitos: Integer; var totalSuma: Integer);
var
	dig: Integer;
begin
	while num <> 0 do 
	begin
		dig:= num mod 10;
		cantDigitos:= cantDigitos + 1;
		totalSuma:= totalSuma + dig;
		num:= num div 10;
	end;
end;
var
	num,cantDigitos, totalSuma: Integer;	
begin

	repeat
		totalSuma:=0;
		write('Ingrese un numero entero: ');
		readln(num);

		sumaDigitos(num,cantDigitos,totalSuma);
	until totalSuma = 10;

	writeln('La cantidad de digitos leidos es: ', cantDigitos);
	readln();
end.