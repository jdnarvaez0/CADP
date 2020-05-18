{8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para
ello se lee por cada día del mes, los montos de las ventas realizadas. La
lectura de montos para cada día finaliza cuando se lee el monto 0. Se asume
un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a) Modifique el ejercicio anterior para que además informe el día en el
que se realizó la mayor cantidad de ventas.
}

program ejercicio8;
const
	Df = 31;
type
	mes = 1..31;
var
	dia: mes;
	montoDiario, sumaDiaria, sumaTotal: Real;
	i: Integer;
	
begin
	sumaDiaria:= 0;
	sumaTotal:= 0;

	for i := 1 to Df do 
	begin
		writeln('El dia del mes es: ', i);
		write('Ingrese el monto de la venta: ');
		readln(montoDiario);
		writeln('------------------------');

		while montoDiario <> 0 do 
		begin	
			sumaDiaria:= sumaDiaria + montoDiario;		
			write('Ingrese el mondo de la venta: ')	;
			readln(montoDiario);
			writeln('----------------------');			
		end;
		writeln('El monto total del dia: ', i, ' es: ', sumaDiaria:2:2);
		sumaTotal:= sumaTotal + sumaDiaria;
	end;
	writeln('El monto todal de ventas del mes es: ', sumaTotal:2:2);
end.