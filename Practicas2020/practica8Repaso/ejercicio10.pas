program ejercicio10;
const
	dimF = 20;
type
	str40 = String[40];


	cultivo = record
		tipoCultivo : str40;
		cantidadHectareas : Real;
		cantMeses : Integer;
	end;

	vCultivos = array[1..dimF] of cultivo;

	empresa = record
		codigo : Integer;
		nombre : str40;
		tipoEmpresa : str40;
		nomCiudadRadicada : str40;
		dimL : Integer;
		cultivo : vCultivos;
	end;

	lsita = ^nodo;
	nodo = record
		dato : empresa;
		sig : lista;
	end;

procedure leerCultivo(var c:cultivo);
begin
	with c do 
	begin
		write('Ingrese la CANTIDAD DE HECTAREAS: ');
		random(cantidadHectareas);
		if (c.cantidadHectareas <> 0) then 
		begin
			write('Ingresar TIPO DE CULTIVO: ');
			readln(tipoCultivo);
			write('Ingrese la CANTIDAD DE MESES: ');
			readln(cantMeses);
		end;
	end;
end;

procedure leerEmpresa(var e:empresa);
var
	c: cultivo;
begin
	with e do 
	begin
		write('Ingrese el CODIGO: ');
		readln(codigo);
		if (codigo <> -1) then 
		begin
			write('Ingrese NOMBRE: ');
			readln(nombre);
			write('Ingrese el TIPO DE EMPRESA (estatal o privada) : ');
			readln(tipoEmpresa);
			write('Ingrese NOMBRE CIUDA DONDE RADICA: ');
			readln(nomCiudadRadicada);
			dimL:= 0;
			leerCultivo(c);
			while (c.cantidadHectareas <> 0) and (dimL < 20) do 
			begin
				dimL:= dimL + 1;
				cultivo[dimL]:= c;
				leerCultivo(c);
			end;
		end;
	end;
end;

procedure agregarAdelante(var l:lista; e:empresa);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= e;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarEmpresa(var l:lista);
var
	e: empresa;
begin
	leerEmpresa(e);
	while (e.codigo <> -1) do 
	begin
		agregarAdelante(l,e);
		leerEmpresa(e);
	end;
end;

procedure incisoB(e: empresa);
var
	numero,ceros: Integer;
begin
	ceros:= 0;
	if (e.nombre = 'San Miguel del Monte') and (e.tipoCultivo = 'trigo') then 
		numero:= e.codigo;
		while ((numero <> 0) and (ceros < 2)) do 
		begin
			if (numero mod 10 = 0) then 
				ceros:= ceros + 1;
		end;
		if (ceros = 2) then 
			writeln('Nombre Empresa: ', e.nombre);
end;

procedure actualizarMaximo(c: cultivo; var max: Integer);
var
	empreaMaxMaiz, nombre: String; 
begin
	if (c.cantMeses > max) then 
	begin
		max:= c.cantMeses;
		empreaMaxMaiz:= nombre;
	end;
end;

procedure incisoCyD(e:empresa; var totalSoja, totalHectareas: Real; var max:Integer; var empresaMaxMaiz: String);
var
	i: Integer;
begin
	for i := 1 to e.dimL do 
	begin
		if (e.cultivo[i].tipo = 'maiz') then
			actualizarMaximo(e.cultivo[i], max, empresaMaxMaiz,e.nombre);
		else
			if (e.cultivo[i].tipo = 'soja') then 
				totalSoja:= e.cultivo[i].cantidadHectareas;
			totalHectareas:= totalHectareas + e.cultivo[i].cantidadHectareas;
	end;
end;


procedure procesaroInfor(l:lista);
var
	totalSoja, totalHectareas: Real;
	max: Integer;
	empreaMaxMaiz: String;
begin
	totalSoja:= 0;
	totalHectareas:= 0;
	max:= -1;

	while (l <> nil) do 
	begin
		incisoB(l^datos);
		incisoCyD(l^.datos, totalSoja,totalHectareas,max,empresaMaxMaiz);	

		l:= l^.sig;
	end;
	writeln('Promedio de la soja es: ', (100 * totalSoja) / totalHectareas);
end;

procedure modificarCultivos(var cultivos: cultivo; dimL: Integer);
var
	i: Integer;
begin
	i:= 1;
	while (i < dimL) and (cultivos[i].tipo <> 'girasol') do 
		i:= i+1;
	if (i < dimL) then 
		cultivos[i].cantMeses:= cultivos[i].cantMeses + 1;
end;

procedure aumentar(l:lista);
begin
	while (l <> nil) do 
	begin
		if (l^.datos.tipoEmpresa <> 'estatal') then 
			modificarCultivos(l^.datos.cultivo, l^.datos.dimL);
		l:=l^.sig;
	end;
end;

var
	l: lista;

begin
	l:= nil;
	cargarEmpresa(l);
	procesaroInfor(l);
	aumentar(l);
end.