program ejercicio10;

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
	num, cantDigitos, totalSuma: Integer;
begin
	write('Ingrese un numero entero: ');
	readln(num);

	sumaDigitos(num, cantDigitos, totalSuma);

	writeln('La cantidad de digitos del numero es: ', cantDigitos);
	writeln('La suma total de los digitos es: ', totalSuma);
	readln();
end.