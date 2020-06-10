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
	vNombreCat= array[rangoCate] of String;
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
	mesMax1,mesMax2:integer;
begin
	max1:=-999;
	max2:=-999;
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
	mesMin1,mesMin2: integer;

begin
	min1:=9999;
	min2:=9999;
	mesMin1:=0;
	mesMIn2:=0;


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

procedure superaPromedio(vc:vcategoria; vnc:vNombreCat;  promedio:Real); //iINCISO 2
var
	i: Integer;
	nom: str40;
begin
	for i := 1 to dimFcate do 
	begin
		if (vc[i]>promedio) then
		begin
			nom:=vnc[i];
			writeln('La categoria ', nom, ' supera al promedio de audiencia de todas las categorias');
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

procedure procesarInfo(var vm:vmes; var vc:vcategoria; var nomMaxOyente: str40; vnc:vNombreCat);
var
	r:repoAudiencia;
	nomProgramaActual: str40;
	maxOyentes: Integer;
	sumaOyentes,sumaProm: integer;
	promedio: Real;
begin
	maxOyentes:= -999;
	sumaProm:= 0;
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
			sumaProm:= sumaProm + r.cantOyentes;

			leerDatos(r);
		end;
		mayorOyentes(sumaOyentes, nomProgramaActual, maxOyentes, nomMaxOyente);
	end;
	promedio:= sumaProm / 20;
	superaPromedio(vc,vnc,promedio);
end;

//####PP####
var
	vm: vmes;
	vc: vcategoria;
	vnc: vNombreCat;
	r: repoAudiencia;
	nomMaxCantOyentes: str40;
	nomMaxOyente: str40;

begin
	nomMaxOyente:='';
	
	inicializarVectorMes(vm);
	inicializrVectorCategoria(vc);
	procesarInfo(vm,vc,nomMaxCantOyentes,vnc);
	maxMes(vm);
	minMes(vm);
	writeln('El programa con mayor cantidad de oyentes es: ', nomMaxOyente );
	readln();
end.

