program ejercicio7;
type
	str40 = String[40];

	centroInvestigacion = record
		nomCentroInv : str40;
		nomUniversidad : str40;
		cantInvestigadores : Integer;
		cantBecarios : Integer;
	end;	

procedure leerCentro(c:centroInvestigacion);
begin
	with c do 
	begin
		write('Ingrese Nombre del CETNRO: ');
		readln(nomCentroInv);
		write('Ingrese Nombre de la UNIVERSIDAD: ');
		readln(nomUniversidad);
		write('Ingrese las Cantidad de INVESTIGADORES: '); 
		readln(cantBecarios);
		write('Ingrese la Cantidad de BECARIOS: ');
		readln(cantBecarios);
	end;
end;

procedure uniMayorInvestigadores(c:centroInvestigacion; var max: Integer; var nomMax: str40);
begin
	if (c.cantInvestigadores >= max) then 
	begin
		max:= c.cantInvestigadores;
		nomMax:= c.nomUniversidad;
	end;
end;

procedure centroMayorBecarios(c:centroInvestigacion; var max1, max2: Integer; var nomMax1, nomMax2: str40);
begin
	if (c.cantBecarios >= max1) then 
	begin
		max2:= max1;
		nomMax2:= nomMax1;
		max1:= c.cantBecarios;
		nomMax1:= c.nomCentroInv;
	end
	else
		if (c.cantBecarios >= max2) then 
		begin
			max2:= c.cantBecarios;
			nomMax2:= c.nomCentroInv;
		end;
end;

var
	c: centroInvestigacion;
	max, max1,max2, contCentro: Integer;
	nomMax, nomMax1, nomMax2, uniActual: str40;

begin
	max:= -1;
	max1:= -1;
	max2:= -1;
	nomMax1:= '';
	nomMax2:= '';
	uniActual:= '';

	leerCentro(c);
	while (c.cantInvestigadores <> 0) do 
	begin
		contCentro:= 0;
		uniActual:= c.nomUniversidad;
		uniMayorInvestigadores(c,max,nomMax);

		while (c.nomUniversidad = uniActual) do 
		begin
			contCentro:= contCentro + 1;
			centroMayorBecarios(c,max1,max2,nomMax1,nomMax2);
			leerCentro(c);
		end;
		writeln('La cantidad total de centros para la Universidad ', c.nomUniversidad, ' es: ', contCentro);
	end;
	writeln('La Universidad con mayor cantidad de investigadores es: ', nomMax);
	writeln('Los dos centros con mayor cantidad de becarios es: ', nomMax1, ' y ', nomMax2);	
end.
