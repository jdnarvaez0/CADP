{Una emisora de radio está revisando la audiencia de sus programas. Para ello, debe procesar uno a
uno los reportes de audiencia. De cada reporte se conoce el nombre del programa, el código de la
categoría del programa (1..20), el mes del reporte (1..12) y la cantidad de oyentes. La información se
ingresa ordenada por nombre de programa, y la lectura finaliza al ingresar el nombre de programa
'zzz'.
Además, la emisora de radio ​cuenta​ con una tabla con los nombres de las 20 categorías de
programas (por ej. 1. Noticias, 2. Espectáculos, 3. Humor, 4. Música, etc.).
Realizar un programa que lea los reportes de audiencia. Una vez finalizada la lectura, el programa
debe informar:

1.Los dos meses en los cuales la audiencia total fue mayor y los dos meses en los que fue menor.
2.El nombre de las categorías cuya audiencia supera al promedio de audiencia de todas las categorías.
3. El programa con mayor cantidad de oyentes.
}


program activdad2;
const
	dimFmes = 12;
	dimFcate = 20;
type
	str40 = String[40];
	rangoCate= 1..20;
	rangoMes= 1..12;


	repoAudiencia = record
		nomPrograma: str40;
		categoriaPro: rangoCate;
		mesReporte: rangoMes; 
		cantOyentes: Integer;
	end;

	vmes = array[rangoMes] of Integer;
	vcategoria = array[rangoCate] of Integer;

procedure inicializarVectorMes(var vm:vmes); //inicializo vector Meses
var
	i: Integer;
begin
	for i := 1 to dimFmes do 
	begin
		vm[i]:=0;
	end; 
end;

procedure inicializrVectorCategoria(var vc:vcategoria); //inicializo vector Categorias
var
	i:integer;
begin
	for i := 1 to dimFcate do 
	begin
		vc[i]:=0;
	end;
end;

procedure leerDatos(var r:repoAudiencia); // leo informacion desde el teclado
begin
	with r do 
	begin
		write('Ingrese nombre del programa: ');
		readln(nomPrograma);
		if (nomPrograma <> 'zzz') then
		begin
			write('Ingrese la categoria del programa: ');
			readln(categoriaPro);
			write('Ingrese el mes del reporte: ');
			readln(mesReporte);
			write('Ingrese la cantidad de oyentes del programa: ');
			readln(cantOyentes);
			writeln('###########################################');	
		end;		
	end;
end;

procedure maxMes(vm:vmes); //INCISO 1 MAXIMOS
var
	i:Integer;
	max1,max2: Integer;
	mesMax1,mesMax2: Integer;
begin
	max1:= -999;
	max2:= -999;
	mesMax1:=0;
	mesMax2:=0;

	for i := 1 to dimFmes do
	begin
		if (vm[i] >= max1) then 
		begin
			max2:= max1;
			mesMax2:= mesMax1;
			max1:= vm[i];
			mesMax1:= i;
		end
		else
			if (vm[i] >= max2) then 
			begin
				max2:= vm[i];
				mesMax2:= i;
			end;		
	end;
	writeln('Los dos meses donde hubo Mayor audiencia son: ', mesMax1, ' y ', mesMax2);
end;

procedure minMes(vm:vmes); //INCISO 1 MINIMOS
var
	i: Integer;
	min1,min2: integer;
	mesMin1, mesMin2: integer;
begin
	min1:=9999;
	min2:=9999;
	mesMin1:=0;
	mesMin2:=0;

	for i := 1 to dimFmes do 
	begin
		if (vm[i] <= min1) then 
		begin
			min2:= min1;
			mesMIn2:= mesMIn1;
			min1:= vm[i];
			mesMin1:= i;
		end
		else
			if (vm[i] <= min2) then 
			begin
				min2:= vm[i];
				mesMIn2:= i;       
			end; 
	end;
	writeln('Los dos meses donde hubo Menor audiencia son: ', mesMIn1, ' y ', mesMIn2);
end;

procedure superaPromedio(vc:vcategoria); //iINCISO 2
var
	i,j,suma: Integer;
	promedio: Real;
begin
	suma:= 0;
	
	for i := 1 to dimFcate do
		suma:= suma + vc[i];

	promedio:= suma / dimFcate;

	for j := 1 to dimFcate do 	
	begin
		if (vc[j] > promedio) then 
		begin
			writeln('La categoria ', j, ' supera al premdio de audiencia de todas las categorias');
		end;
	end;
end;

procedure mayorOyentes(sumaOyentes:integer; nomProgramaActual:str40; var maxOyentes: integer; var nomMaxOyente: str40); //INCISO3
begin
	if (sumaOyentes >= maxOyentes) then 	
	begin
		maxOyentes:= sumaOyentes;
		nomMaxOyente:= nomProgramaActual;
	end;
end;

procedure procesarInfo(var vm:vmes; var vc:vcategoria; var nomMaxOyente: str40);
var
	r:repoAudiencia;
	nomProgramaActual: str40;
	maxOyentes: Integer;
	sumaOyentes: integer;
begin
	maxOyentes:= -999;
	nomMaxOyente:='';
	nomProgramaActual:= '';
	leerDatos(r);
	
	while (r.nomPrograma <> 'zzz') do 
	begin
		nomProgramaActual:= r.nomPrograma;
		sumaOyentes:= 0;
		while (nomProgramaActual = r.nomPrograma) and (r.nomPrograma <> 'zzz') do  
		begin
			vc[r.categoriaPro]:= vc[r.categoriaPro] + r.cantOyentes; 
			vm[r.mesReporte]:= vm[r.mesReporte] + r.cantOyentes;
			sumaOyentes:= sumaOyentes + r.cantOyentes;

			leerDatos(r);
		end;
		mayorOyentes(sumaOyentes, nomProgramaActual, maxOyentes, nomMaxOyente);
	end;
end;

//####PP####
var
	vm: vmes;
	vc: vcategoria;
	r: repoAudiencia;
	nomMaxCantOyentes: str40;
	nomMaxOyente: str40;

begin
	nomMaxOyente:='';
	
	inicializarVectorMes(vm);
	inicializrVectorCategoria(vc);
	procesarInfo(vm,vc,nomMaxCantOyentes);


	superaPromedio(vc);
	writeln('El programa con mayor cantidad de oyentes es: ', nomMaxOyente );

	
	readln();

end.

