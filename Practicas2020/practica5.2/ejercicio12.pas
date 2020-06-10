program ejercicio12;
const
	dimF = 10000;
type

	compu = record
		verUbuntu : Real;
		cantPaquetes: Integer;
		cantCuentas: Integer;
	end;

vCompu = array[1..dimF] of compu;

procedure leerInfo(var c:compu);
begin
	with c do 
	begin
		write('ingrese la Version de Ubuntu: ');
		readln(verUbuntu);
		write('Ingrese la cantidad de paquetes intalados: ');
		readln(cantPaquetes);
		write('Ingrese la cantidad de usuario: ');
		readln(cantCuentas);
		writeln('------------------------------');
	end;
end;

procedure cargarVector(var v:vCompu; var dimL:Integer);
var
	c: compu;
begin
	leerInfo(c);

	while (c.verUbuntu <> 4.10) and (dimL < dimF) do 
	begin
		dimL:= dimL + 1;
		v[dimL]:= c;

		leerInfo(c);
	end;
end;

procedure cantCompuVersion(v:vCompu; dimL:Integer; i:Integer; var sumaVersion:Integer);
begin
	sumaVersion:=0;

	if (v[i].verUbuntu = 18.04) or (v[i].verUbuntu = 16.04) then 
	begin
		sumaVersion:= sumaVersion + 1;
	end;
end;

function promedioUsuarios(TotalUsuario:Integer; dimL:Integer): Integer;
begin
	promedioUsuarios:= TotalUsuario div dimL;
end;

procedure VersionMaxPaquete(v:vCompu;  i:Integer; var max:Integer; var verMax:Real);
begin
	if (v[i].cantPaquetes > max) then 
	begin
		max:= v[i].cantPaquetes;
		verMax:= v[i].verUbuntu;
	end;
end;

procedure informar(v:vCompu; dimL:Integer);
var
	i,sumaVersion,TotalUsuario,promedio,max: Integer;
	verMax: Real;
begin
	sumaVersion:=0;
	TotalUsuario:=0;
	promedio:=0;
	max:= -9999;
	verMax:= 0;

	for i := 1 to dimL do 
	begin
		TotalUsuario:= TotalUsuario + v[i].cantCuentas;
		cantCompuVersion(v,dimL,i, sumaVersion);
		VersionMaxPaquete(v,i,max,verMax);
		
		writeln('El promedio de usuario para esta computadora es: ', promedioUsuarios(TotalUsuario,dimL));
	end;
	writeln('La cantidad de computadoras que utulizan las versiones 18.04 o 16.04 son: ', sumaVersion);
	writeln('La version de ubunu con mas paquetes intalados es: ', verMax);
end;

var
	v: vCompu;
	dimL: Integer;

begin
	dimL:=0;

	cargarVector(v,dimL);
	informar(v,dimL);
	readln();

end.