program ejercicio1;

type
	str40 = String[40];

	planta = record
		nomCientifico : str40;
		tiempoVida : Integer;
		tipoPlanta : str40;
		clima : str40;
		pais : str40;
	end;

procedure leerPlanta(var p:planta);
begin
	with p do 
	begin
		write('Ingrese el nombre CIENTIFICO: ');
		readln(nomCientifico);
		write('Ingrese el TIEMPO DE VIDA (en meses): ');
		readln(tiempoVida);
		write('Ingrese el TIPO DE PLANTA: ');
		readln(tipoPlanta);
		write('Ingrese tipo de CLIMA: ');
		readln(clima);
		write('Ingrese nombre del PAIS donde se encuentra: ');
		readln(pais);
	end;
end;

procedure menorCantidadPlantas(tipoPlanta: str40; contTipoPlanta: Integer; var min1:Integer; var nomMin1:str40); //inciso A
begin
	if (contTipoPlanta <= min1) then 
	begin
		min1:= contTipoPlanta;
		nomMin1:= tipoPlanta;
	end;
end;

procedure tiempoPromedioVida (contTipoPlanta:Integer; sumaMes:Integer; var promedio: Real); //inciso B
begin
	promedio:= sumaMes / contTipoPlanta;
end;

procedure masLongevas(p:planta; var max1,max2: Integer; var nomMax1, nomMax2: str40); //inciso C
begin
	if (p.tiempoVida >= max1) then 
	begin
		max2:= max1;
		nomMax2:= nomMax1;
		max1:= p.tiempoVida;
		nomMax1:= p.nomCientifico;
	end
	else
		if (p.tiempoVida >= max2) then 
		begin
			max2:= p.tiempoVida;
			nomMax2:= p.nomCientifico;
		end;
end;

procedure plantasNativasArgentina(p:planta); //inciso D
begin
	if (p.pais = 'argentina') and (p.clima = 'subtropical') then 
	begin
		writeln('Esto es una planta nativa de Argentina ', p.nomCientifico, ' y se encuentra en clima subtropical');
	end;
end;

procedure plantaMasPaises(nomCientifico: str40 ; contPlantaPais: Integer; var max: Integer; var nomMax: str40); //inciso E
begin
	if (contPlantaPais >= max) then 	
	begin
		max:=contPlantaPais;
		nomMax:= nomCientifico;
	end;
end;


var
	p: planta;
	contTipoPlanta, contPlantaPais, min1, max1, max2, max, contWhile,i: Integer;
	sumaMes: Integer; 
	nomMax,nomMax1,nomMax2, nomMin1, tipoActual: str40;
	promedio: Real;

begin
	min1:= 9999;
	max:= -1;
	max1:= -1;
	max2:= -1;
	nomMax:= '';
	nomMax1:= '';
	nomMax1:= '';
	nomMin1:= '';
	tipoActual:= '';
	promedio:= 0;
	contWhile:= 0;


	while (contWhile <= 320) do 
	begin
		contWhile:= contWhile + 1;
		leerPlanta(p);
		contTipoPlanta:=0;
		contPlantaPais:=0;
		sumaMes:= 0;
		tipoActual:= p.tipoPlanta;

		while (tipoActual = p.tipoPlanta) and (p.pais <> 'zzz') do //se estan ingresando ordenadado por TIPO
		begin
			contTipoPlanta:= contTipoPlanta + 1; //contador para el inciso A
			sumaMes:= sumaMes + p.tiempoVida; // sumo los meses para poder realizar el proemdio del inciso B

			masLongevas(p,max1,max2,nomMax1,nomMax2); // llamo al inciso C

			while (p.pais <> 'zzz') do 
			begin
				plantasNativasArgentina(p); //llamo inciso D
				contPlantaPais:= contPlantaPais + 1;
				write('Ingrese nombre del PAIS donde se encuentra: ');
				readln(p.pais);	
			end;
			writeln('--------------------------------------------');
			plantaMasPaises(p.nomCientifico, contPlantaPais, max, nomMax);// llamo al inciso E
			leerPlanta(p); 
			tipoActual:= p.tipoPlanta;
		end;

		menorCantidadPlantas(p.tipoPlanta,contTipoPlanta,min1,nomMin1); // llamo al proceso del inciso A		
		tiempoPromedioVida(contTipoPlanta,sumaMes,promedio); //llamo al inciso B
		

		writeln('El tiempo promedio de la planta del tipo: ', p.tipoPlanta, ' es: ', promedio );
	end;
	writeln('El tipo de planta con menor cantidad de plantas es: ', nomMin1);
	writeln('El nombre cientifico de las dos plantas mas longevas son: ',nomMax1, ' y ', nomMax1 );
	writeln('El nombre de la planta que se encuentra en mas paises es: ', max);	
	readln();
end.




