program ejercicio8;

type
	str40 = String[40];

	docente = record
		dni : Integer;
		nombre : str40;
		email : str40;
	end;

	proyecto = record
		codigoUnico : Integer;
		titulo : str40
		docenteC : docente;
		cantAlumnos : Integer;
		nomEsculea : str40;
		localidad : str40;
	end;

procedure leerDocente(var d: docente);
begin
	with d do 
	begin
		write('Ingrese el DNI del DOCENTE: ');
		readln(dni);
		write('Ingrese el NOMBRE del docente: ');
		readln(nombre);
		write('Ingrese el EMAIL del docente: ');
		readln(email);
	end;
end;



procedure leerProyecto(var p: proyecto);
begin
	with p do 
	begin
		write('Ingrese el CODIGO UNIOCO: ');
		readln(codigoUnico);
		write('Ingrese TITULO del proyecto: ');
		readln(titulo);
		leerDocente(p.docenteC);
		write('Ingrese la cantidad de ALUMNOS que participan: ');
		readln(cantAlumnos);
		write('Ingres el NOMBRE DE LA ESCUELA: ');
		readln(nomEsculea);
		write('Ingrese nombre de LOCALIDAD: ');
		readln(localidad);
		writeln('--------------------------------------------');
	end;
end;

procedure escuelaMayorAlumnos(p: proyecto; contAlumnos:Integer; var max1,max2: Integer; var nomMax1,nomMax2: str40);
begin
	if (contAlumnos >= max1) then 
	begin
		max2:= max1;
		nomMax2:= nomMax1;
		max1:= contAlumnos;
		nomMax1:= p.nomEsculea;
	end
	else
		if (contAlumnos >= max2) then 
		begin
			max2:= contAlumnos;
			nomMax2:= p.nomEsculea;
		end;
end;


function descomponer(codigo: Integer): Boolean; 
var
	dig, contP, contI: Integer;
begin
	contP:= 0;
	contI:= 0;

	while (codigo <> 0) do 	
	begin
		dig:= codigo mod 10;
		if ((dig mod 2)= 0) then 	
		begin
			contP:= contP + 1;
		end
		else
			contI:= contI + 1;
		
		codigo:= codigo div 10;
	end;
	descomponer:= (contP = contI);
end;	

var
	d: docente;
	p: proyecto;
	max1,max2, contEscuela, contEsculaLocalidad, contAlumnos: Integer;
	nomMax1, nomMax2: str40;
	localidadActual, escuelaActual: str40;

begin
	max1:= -1;
	max2:= -1;
	nomMax1:= '';
	nomMax2:= '';
	contEscuela:= 0;
	
	
	leerProyecto(p);

	while (p.codigoUnico <> -1) do 
	begin
		contEsculaLocalidad:= 0;
		localidadActual:= p.localidad;
		
		while (localidadActual = p.localidad) and (p.codigoUnico <> -1) do //localidad 
		begin	
			contEscuela:= contEscuela + 1;
			escuelaActual:= p.nomEsculea;
			contEsculaLocalidad:= contEsculaLocalidad + 1;
			contAlumnos:= 0;

			while (escuelaActual = p.nomEsculea) and (p.codigoUnico <> -1) do  //Escuela
			begin
		
			if (p.localidad = 'Daireaux') and (descomponer(p.codigoUnico)) then 
			begin
				write('Titulo del proyecto: ',p.titulo);
			end;
			contAlumnos:= contAlumnos + 1;
			leerProyecto(p);
			end;
			contEsculaLocalidad:= contEsculaLocalidad + 1;	
			escuelaMayorAlumnos(p,contAlumnos,max1,max2,nomMax1,nomMax2);		
		end;
		writeln('La cantidad de escuelas en la localidad : ', p.localidad, ' es: ',contEsculaLocalidad);
	end;
	writeln('La cantidad de escuales que participaron en la convocatoria 2020 son: ', contEscuela );
	writeln('Los dos nombres de las dos escuelas con mayor cantidad de alumnos participantes son: ', nomMax1, ' y ', nomMax2);

end.