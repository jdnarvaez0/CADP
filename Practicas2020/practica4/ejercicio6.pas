program ejercicio6;

type
	str40 = String[40];

	microprocesador = record
		marca : str40;
		linea : str40;
		cantCore : Integer;
		vReloj : Real;
		tamTransistores: Integer;
	end;


procedure leerProcesador(var m:microprocesador);
begin
	with m do 
	begin
		write('Ingrese la MARACA: ');
		readln(marca);
		write('Ingrese la LINEA: ');
		readln(linea);
		write('Ingrese CANTIDAD DE CORE: ');
		readln(cantCore);
		write('Ingrese la VELICIDAD DEL RELOJ: ');
		readln(vReloj);
		write('Ingrese el TAMANO DEL TRANSISTOR: ');
		readln(tamTransistores);
		writeln('---------------------------------');
	end;
end;

procedure mayorCantProcesasores14(marcaActual:str40; var max1,max2: Integer; var marcaMax1, marcaMax2: str40);
var
	m: microprocesador;
begin
	if (m.cantCore >= max1) then 
	begin
		max2:= max1;
		marcaMax2:= marcaMax1;
		max1:= m.cantCore;
		marcaMax1:= m.marca;
	end
	else
		if (m.cantCore >= max2) then 
		begin
			max2:= m.cantCore;
			marcaMax2:=m.marca; 
		end;
end;

procedure cantProcesadoresMulticore(m:microprocesador; var cantProMulticore:Integer);
begin
	if (m.cantCore > 1) and ((m.marca = 'intel') or (m.marca = 'AMD')) and (m.vReloj >= 2) then
	begin
		cantProMulticore:= cantProMulticore + 1;	
	end;
end;


var
	m: microprocesador;
	max1, max2, cantProMulticore, cant14: Integer;
	marcaMax1, marcaMax2, marcaActual: str40;
	
begin
	max1:=-1;
	max2:=-1;
	cantProMulticore:=0;
	marcaActual:='';
	marcaMax1:='';
	marcaMax2:='';

	leerProcesador(m);
	while (m.cantCore <> 0) do 
	begin
		marcaActual:= m.marca;
		cant14:=0;


		while (m.marca = marcaActual) and (m.cantCore <> 0) do 
		begin

			//inciso 1
			if (m.cantCore > 2) and (m.tamTransistores <= 22) then 
			begin
				writeln('La Marca: ', m.marca);
				writeln('La Linea: ', m.linea);
			end;

			//inciso 2
			if (m.tamTransistores = 14) then 
			begin
				cant14:= cant14 + 1;
			end;

			//inciso 3
			cantProcesadoresMulticore(m,cantProMulticore);
		
			leerProcesador(m);
		end;	
			mayorCantProcesasores14(marcaActual,cant14,max1,max2,marcaMax1, marcaMax2); //inciso 2				
	end;

	writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14nm son: ', marcaMax1, ' y ', marcaMax2);
	writeln('La cantidad de procesadores multicore de Intel o AMD, cuyo relojes alcanza velocidad de al menos 2GZ es: ', cantProMulticore);
end.