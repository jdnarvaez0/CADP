{Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a
intendente de la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del
candidato, cantidad de votos obtenidos, y cantidad de votantes de la localidad. La lectura finaliza al
leer la localidad ‘Zárate’, que debe procesarse. Informar:
◦ el intendente que obtuvo la mayor cantidad de votos en la elección.
◦ el intendente que obtuvo el mayor porcentaje de votos de la elección.
}

program ejercicio5;

type
	str40= String[40];
	candidato = record
		localidad : str40;
		apellido: str40;
		cantVotos: Integer;
		cantvotante: Integer; 
	end;

procedure leerCandidato(var c: candidato);
begin
	write('Ingrese la LOCALIDAD del candidato: ');
	readln(c.localidad);
	write('Ingrese el APELLIDO del candidato: ');
	readln(c.apellido);
	write('Ingrese la CANTIDAD DE VOTOS: ');
	readln(c.cantVotos);
	write('Ingrese la CANTIDAD DE VOTANTES: ');
	readln(c.cantvotante);
	writeln('----------------------------------');
end;

procedure mayorVotos(c:candidato; var max:Integer; var apellidoMax: str40);
begin
	if (c.cantVotos >= max) then 
	begin
		max:=c.cantVotos;
		apellidoMax:= c.apellido;	
	end;
end;

procedure mayorPorcentaje(c:candidato; var porcentaje: Real; var apellidoMaxPorcen: str40; var maxPorcentaje: Real);
begin
	porcentaje:= (c.cantVotos * c.cantvotante) / 100;

	if (porcentaje >= maxPorcentaje ) then 
	begin
		maxPorcentaje:= porcentaje;
		apellidoMaxPorcen:= c.apellido;
	end;
end;
var
	c: candidato;
	max: Integer;
	apellidoMax, apellidoMaxPorcen: str40;
	porcentaje, maxPorcentaje: Real;
begin
	max:= -1;
	maxPorcentaje:= -1;
	porcentaje:= 0;
	repeat
		leerCandidato(c);
		mayorVotos(c,max,apellidoMax);
		mayorPorcentaje(c, porcentaje, apellidoMaxPorcen, maxPorcentaje);
	until c.apellido = 'zarate';
	writeln('El intendente que obtuvo mayor cantidad de votos en las elecciones es: ', apellidoMax);
	writeln('El intendente que obtuvo el mayor porcentaje de votos de las elecciones es: ', apellidoMaxPorcen);
	readln();
end.