program ejercicio5;
type

	str40 = String[40];
	espectro = 1..7;

	sonda = record
		nomSonda : str40;
		duracionMision : Integer;
		costoConstruccion : Real;
		costoMantenimientoM : Real;
		rangoEspectro : espectro;
	end;

	lista = ^nodo;

	nodo = record
		datos : sonda;
		sig : lista;
	end;

	vContador = array[espectro] of Integer;

procedure leerInfo(var s:sonda);
begin
	with s do 
	begin
		write('Ingrese el NOMBRE DE LA SONDA: ');
		readln(s.nomSonda);
		write('Ingrese la duracion de la mision en mese: ');
		readln(duracionMision);
		write('Ingrese el costo de la cosntruccion: ');
		readln(costoConstruccion);
		write('Ingrese el consto de mantenimiento: ');
		readln(costoMantenimientoM);
		write('Ingrse el rango del espectro: ');
		readln(rangoEspectro);
		writeln('------------------------------------');
	end;
end;

procedure inicializarVectorC(var c:vContador);
var
	i: Integer;
begin
	for i := 1 to 7 do 
	begin
		c[i]:=0;
	end;
end;

procedure AgregarAlFinal(s:sonda; var l,ult:lista);
var
	nue: lista;
begin

	new(nue);
	nue^.datos:= s;
	nue^.sig:= nil;

	if l = nil then 
	begin
		l:= nue;
		ult:= nue;
	end
	else
		ult^.sig:= nue;
		ult:= nue;
end;

procedure cargarLista(var l,ult:lista; var promedio, promedioConstru: Real);
var
	sumaMes, cantSonda: Integer;
	sumaConstruccion: Real;
	s: sonda;
begin
	sumaMes:=0;
	cantSonda:=0;
	sumaConstruccion:=0;
	repeat
		leerInfo(s);
		AgregarAlFinal(s,l,ult);
		sumaMes:= sumaMes + s.duracionMision;
		sumaConstruccion:= sumaConstruccion + s.costoConstruccion;
		cantSonda:= cantSonda + 1;
	until s.nomSonda = 'gaia';
	promedio:= sumaMes / cantSonda;
	promedioConstru:= sumaConstruccion / cantSonda;
end;

procedure sondaMasCostosa(nom: str40; var maxCosto: Real; var maxNom: str40; costo:real);
begin
	if (costo > maxCosto) then 
	begin
		maxCosto:= costo;
		maxNom:= nom;
	end;
end;

procedure ImprimirVectorContador(c:vContador);
var
	i: Integer;
begin
	for i := 1 to 7 do 	
	begin
		writeln('Rango de espectro: ',i, ': tiene: ', c[i]);
	end;
end;

procedure cantSuperaPromedio(promedio: Real; mes:Integer; var contSupera: Integer);
begin
	if (mes > promedio) then 
	begin
		contSupera:= contSupera + 1;
	end;
end;

procedure nomSuperaCostroPromedio(promedioConstru,costoSupera: Real; nom: str40; var maxNomCosto: str40);
begin
	if (promedioConstru < costosupera) then 
	begin
		maxNomCosto:= nom;
	end;
end;

procedure procesar(l:lista; var c:vContador; promedio,promedioConstru: Real);
var
	maxCosto, costo: Real;
	contSupera : Integer;
	maxNom, maxNomCosto: str40;
begin
	maxCosto:=-9999;
	maxNom:='';
	contSupera:=0;
	maxNomCosto:='';

	while (l <> nil) do 
	begin
		
		costo:= l^.datos.costoConstruccion + l^.datos.costoMantenimientoM;
		sondaMasCostosa(l^.datos.nomSonda,maxCosto,maxNom,costo);
		
		c[l^.datos.rangoEspectro]:= c[l^.datos.rangoEspectro] + 1;

		cantSuperaPromedio(promedio, l^.datos.duracionMision, contSupera);

		nomSuperaCostroPromedio(promedioConstru, l^.datos.costoConstruccion, l^.datos.nomSonda,maxNomCosto);
		writeln('El nombre de la sonda que supera el costo promedio entre todas las sondas:  ', maxNomCosto);

		l:= l^.sig;
	end;
	writeln('El nombre de la sonda mas costosa es: ', maxNom);
	el (c);
	writeln('La cantidad de sondas cuya duracion supera la duracion promedio de todas las sondas es: ', contSupera);

end;
	
var
	l: lista;
	ult: lista;
	s: sonda;
	c: vContador;
	promedio: Real;
	promedioConstru: Real;

begin
	l:= nil;	
	ult:= nil;
	promedio:=0;

	inicializarVectorC(c);
	cargarLista(l,ult, promedio, promedioConstru);

	procesar(l,c,promedio,promedioConstru);
	readln();
end.