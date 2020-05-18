{3. Realizar un programa que lea desde teclado la información de alumnos
ingresantes a la carrera Analista en TIC. De cada alumno se lee nombre y
nota obtenida en el módulo EPA (la nota es un número entre 1 y 10). La
lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota
}

program ejercicio3;
type
	rangoNota = 1..10;
var
	nombre: String;
	nota: rangoNota;
	contAprobado, contSiete: Integer;
begin
	contAprobado:= 0;
	contSiete:= 0;

	repeat
		write('Ingrese NOMBRE DE ALUMNO: ');
		readln(nombre);
		write('ingrese la NOTA DEL ALUMNO: ');
		readln(nota);
		writeln('---------------------------');

		if nota >= 8 then 
		begin
			contAprobado:= contAprobado + 1;
		end;

		if nota = 7 then 
		begin
			contSiete:= contSiete + 1;
		end;
		
	until nombre = 'Zidane';

	writeln('La cantidad de alumnos con nota 8 o superios son:  ', contAprobado);
	writeln('La cantidad de alumnos con nota 7 son: ', contSiete);
	readln();
end.