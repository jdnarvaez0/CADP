program ejericio5;
const
	dimF = 100; // camiones
	
type
	rangoCodigo = 1..100;

	camion = record
		patente : String;
		anioFabricacion: Integer;
		capacidad : Real;
	end;

	camiones = array[1..dimF] of camion;
	vContador = array[1..dimF] of Real;

	viaje = record
		codViaje : Integer;
		codCamion : rangoCodigo; 
		distanciaKM : Real;
		ciudadDestion : String;
		anioViaje : Integer;
		dniChofer : Integer;
	end;

	lista = ^nodo;
	nodo = record
		datos : viaje;
		sig : lista;
	end;
//se DISPONE
procedure leerCamion(var c:camion);
begin
end;

// se DISPONE 
procedure cargarCamiones(var v_camiones: camines);
begin
end;

procedure agregarAdelante(var l:lista; v:viaje);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= viaje;
	nue^.sig:= l;
	l:= nue; 
end;

procedure leerViajes(var v:viaje);
begin
	with v do 
	begin
		write('Ingrese CODIGO DE VIAJE: ');
		readln(codViaje);
		if (codViaje <> -1) then 
		begin
			write('Ingrese CODIGO CAMION: ');
			readln(codCamion);
			write('Ingrese DISTANCIA RECORRIDA: ');
			readln(distanciaKM);
			write('Ingrese la CIDAD DESTINO: ');
			readln(ciudadDestion);
			write('ingrese el ANO DE VIAJE: ');
			readln(anioViaje);
			write('Ingrese DNI CHOFER: ');
			readln(dniChofer);
		end;
	end;
end;

procedure cargarViaje(var l:lista);
var
	v: viaje;
begin
	leerViajes(v);
	while (v.codViaje <> -1) do
	begin
		agregarAdelante(l,v);
		leerViajes(v);
	end;
end;

procedure maxYMIn(c:vContador; cam: camion; var codMax,codMin: Integer);
var
	i: Integer
	max, min: Real;
begin
	max:= -1;
	min:= 9999;

	for i := 1 to dimF do 
	begin
		if (vc[i] > max) then 
		begin
			max:= vc[i];
			codMax:= i;
		end;

		if (vc[i] < min) then 
		begin
			min:= vc[i];
			codMin:= i;
		end;
	end;
end;

function cumpleInciso2(anioViaje: Integer; c:camion): Boolean;
begin
	cumpleInciso2:= (c.capacidad > 30.5) and ((anioViaje - c.anioFabricacion) > 5);
end;


function cumpleInciso3(dni:Integer): Boolean;
var
	dig, pares: Integer;
begin
	pares:= 0;

	while ((dni <> 0) and (pares = 0)) do 
	begin
		dig:= dni mod 10;
		if (dig mod 2 = 0) then 
			pares:= pares:= 1;
		dni:= dni div 10;
	end;
	cumpleInciso3:= pares:= 0;
end;

procedure procesarInfo(l:lista;  var vc:vContador; c:camion);
var
	codMax,codMin, contViajes: Integer;
begin
	codMax:=0;
	codMin:=0;
	contViajes:= 0;

	while (l <> nil) do 
	begin
		vc[l^.datos.codCamion]:= vc:=[l^.datos.codCamion] + l^.datos.distanciaKM;
		
		if (cumpleInciso2(l^.datos.anioViaje, c)) then
			contViajes:= contViajes + 1;

		if (cumpleInciso3(l^.datos.dniChofer)) then
			writeln('Codigo de viaje cuyo DNI chofer  solo tiene digitos impares ', l^.datos.codViaje);

		l:l^.sig;
	end;
	maxYMIn(vc,codMax,codMin);
	writeln('La patente del camion que mas kilometros recorrio es: ', c[codMax].patente);
	writeln('La patente del camion que mesnos kilometros recorrido tiene es: ', c[codMin].patente);

	writeln('La cantidad de vaijes que se han realizado en camiones con capacidad mayor a 30.5 toneladas y antiguedad mayora 5 anos es: ', contViajes);
end;

var
	l: lista;
	vc: vContador;
	c: camion;

begin
	l:= nil;

	cargarCamiones(c); // se dispone
	cargarViaje(l);
	procesarInfo(l,vc,c);
end.