program ejercicio2;

type
	str40 = String[40];

	vuelo = record
		codAvion : Integer;
		paisSalida : str40;
		paisLlegada : str40;
		cantKilometros : Integer;
		porcentajeCoupacion : Real;
	end;

procedure leerVuelo( var v:vuelo);
begin
 	with v do 
 	begin
 		write('Ingrese CODIGO DEL AVION: ');
 		readln(codAvion);
 		write('Ingrese el PAIS DE SALIDA DEL VUELO: ');
 		readln(paisSalida);
 		write('Ingrese el PAIS DE LLGADA DEL VUELO');
 		readln(paisLlegada);
 		write('Ingrese la cantidad de KILIMETROS recorrido por el vuelo: ');
 		readln(cantKilometros);
 		write('Ingrese el PORCENTAJE DE OCUPACION DEL AVION: ');
 		readln(porcentajeCoupacion);
 	end;
 end;

procedure incisoA(v:vuelo; var max1, max2: Integer; var codMax1, codMax2:Integer; var min1,min2: Integer; var codMin1,codMin2: Integer);
begin
	if (v.cantKilometros >= max1) then 
	begin
		max2:= max1;
		codMax2:= codMax1;
		max1:= v.cantKilometros;
		codMax1:= v.codAvion;
	end
	else
		if (v.cantKilometros >= max2) then 
		begin
			max2:= v.cantKilometros;
			codMax2:= v.codAvion;
		end;

		
	if (v.cantKilometros <= min1) then 
	begin
		min2:= min1;
		codMin2:= codMin1;
		min1:= v.cantKilometros;
		codMin1:= v.codAvion;
	end
	else
		if (v.cantKilometros <= min2) then 
		begin
			min2:= v.cantKilometros;
			codMin2:= v.codAvion;
		end;
end;

procedure masPaisesDoferentes(codAvion: Integer;contPaisDiferente:Integer; var maxB, codMaxB: Integer);
begin
	if (contPaisDiferente > maxB) then 
	begin
		maxB:= contPaisDiferente;
		codMaxB:=codAvion;
	end;
end;


 var
 	v: vuelo;
 	codActual, contPaisDiferente, contC, contD: Integer;
 	max1,max2,codMax1,codMax2, min1,min2,codMin1,codMin2, maxB,codMaxB: Integer;

 	paisSalidaActual : str40;

	
begin
	max1:= -1;
	max2:= -1;
	codMax1:= 0;
	codMax2:= 0;
	min1:= 9999;
	min2:= 9999;
	codMin1:= 0;
	codMin2:= 0;
	maxB:= -1;
	codMaxB:= 0;
	contC:= 0;
	contD:= 0;


	leerVuelo(v);

	while (v.codAvion <> 44) do // corte general
	begin
		codActual:= v.codAvion;

		while (codActual = v.codAvion) do // se le por CODIGO DE AVION
		begin
			paisSalidaActual:= v.paisSalida;
			contPaisDiferente:=0;

			while (paisSalidaActual = v.paisSalida) do 
			begin
				contPaisDiferente:= contPaisDiferente + 1;

				write('Ingres PAIS DE SALIDA: ');
				readln(v.paisSalida);


			end;// cierre de while por pais de salida 
			masPaisesDoferentes(v.codAvion, contPaisDiferente, maxB, codMaxB); // llamo al inciso B
				


		end;// cierre de while por codigo avion
		incisoA(v,max1,max2,codMax1,codMax1,min1,min2,codMin1,codMin2); //llamo al inciso A

		if (v.cantKilometros > 5000) and (v.porcentajeCoupacion < 60) then 
		begin
			contC:= contC + 1;
		end;

		if (v.cantKilometros <= 10000) and ((v.paisLlegada = 'australia') or (v.paisLlegada = 'nueva zelanda') ) then 
		begin
			contD:= contD + 1;
		end;



	end; // cierre de while general

	writeln('Los dos aviones que mas kilometros recorrieron son: ', codMax1, ' y ', codMax2);
	writeln('Los dos aviones que menos kilometros recorrieron son: ', codMin1, ' y ', codMin2);
	writeln('El avion que salio de mas paises diferentes es: ', codMaxB);
	writeln('La cantidad de vuelos de mas 5.000 km que no alcanzaron el 60% de ocuapcion del avion es: ', contC );
	writeln('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda es: ', contD);
end.