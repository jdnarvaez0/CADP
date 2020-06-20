program ejercicio12;
const
	dimF = 3;
	dimT = 4;
type
	rangoTip= 1..4;
	str40= String[40];

	galaxia = record
		nomGalaxi : str40;
		tipo: rangoTip;
		masa: Real;
		distancia: Real;
	end;

vGalaxia = array[1..dimF] of galaxia;
vContTipo = array[rangoTip] of Integer;

procedure inicializarVectorTipo(var vct:vContTipo);
var
	i: Integer;
begin
	for i := 1 to dimT do 
	begin
		vct[i]:=0;
	end;
end;

procedure leerInfor(var g:galaxia);
begin
	with g do 
	begin
		write('Ingrese el Nombre de la Galaxia: ');
		readln(nomGalaxi);
		write('Ingrese el tipo de la Galaxia: ');
		readln(tipo);
		write('Ingrese la masa de la Galaxia: ');
		readln(masa);
		write('Ingrese la distancia de la galaxia en Parsecs (pc): ');
		readln(distancia);
		writeln('--------------------------------------------------');
	end;
end;

procedure cargarVector(var vg:vGalaxia);
var
	g: galaxia;
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		leerInfor(g);
		vg[i]:= g;
	end;
end;

procedure masaTotal3(g:galaxia; var sumaMasa3:Real; sumaMasaTotal:Real; var porcentajeMasaTotal:Real);
begin
	
	if (g.nomGalaxi = 'via lactea') or (g.nomGalaxi = 'andromeda') or (g.nomGalaxi = 'triangulo') then 	
	begin
		sumaMasa3:= sumaMasa3 + g.masa;
	end;
end;

procedure imprimirVectorTipo(vct:vContTipo);
var
	i: Integer;
begin
	for i := 1 to dimT do 
	begin
		writeln('Cantidad de Galaxias del TIPO: ', i, ' es: ', vct[i] );
	end;
end;

procedure Informar(var vg:vGalaxia; var vct:vContTipo);
var
	i:Integer;
	sumaMasa3,sumaMasaTotal, porcentajeMasaTotal: Real;
begin
	sumaMasaTotal:=0;

	for i := 1 to dimF do 
	begin
		sumaMasaTotal:= sumaMasaTotal + vg[i];

		vct[vg[i].tipo]:= vct[vg[i].tipo] + 1;

		masaTotal3(vg,sumaMasa3,sumaMasaTotal, porcentajeMasaTotal);
	end;
	porcentajeMasaTotal:=  (sumaMasaTotal * 100) / sumaMasa3;
	imprimirVectorTipo(vct);
	writeln();
	writeln('La masa total acumulada en las 3 galaxias principales es: ', sumaMasa3:4:2);
	writeln('El porcentaje respecto a todas las galaxias es: ', porcentajeMasaTotal:4:2);
end;



var
	vg: vGalaxia;
	vct:vContTipo;
	g:galaxia;
	
begin
	inicializarVectorTipo(vct);
	cargarVector(vg);
	Informar(vg,vct);
	readln();

end.