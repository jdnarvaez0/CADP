program ejercicio13;
const
	dimF = 4; // son 3600 usuarios
type
	rangoRol= 1..4;

	usuario = record
		email : String;
		rol : rangoRol;
		revistaParticipa : String;
		cantDiasUltimo : Integer;
	end;

	lista = ^nodo;
	nodo = record
		datos : usuario;
		sig : lista;
	end;

	vector = array[1..dimF] of usuario;
	vContador = array[rangoRol] of Integer;

procedure leerDatos(var u:usuario);
begin
	with u do
	begin
		write('Ingrese el EMAIL: ');
		readln(email);
		write('Ingrese el ROL: ');
		readln(rol);
		write('Ingrese el nombre en la revista en la que participa: ');
		readln(revistaParticipa);
		write('Ingrese la cantidad de dias desde su ultimo acceso: ');
		readln(cantDiasUltimo);
	end;
end;

procedure cargarVector(var v:vector; u:usuario);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		leerDatos(u);
		v[i]:= u
	end;
end;

procedure insertarOrdenado(var l:lista; u:usuario);
var
	nue,act,ant: lista;
begin
	new(nue);
	nue^.datos:= u;
	act:= l;
	ant:= l;

	while (l <> nil ) and (u.cantDiasUltimo > act^.datos.cantDiasUltimo) do 
	begin
		ant:= act;
		act:= act^.sig;
	end;

	if (act = ant) then 
		l:= nue

	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure max(v:vector; i:Integer; var max1,max2: Integer; var mailMax1,mailMax2:String);
begin
	if (v[i].cantDiasUltimo > max1) then 
	begin
		max2:= max1;
		mailMax2:= v[i].email;
		max1:= v[i].cantDiasUltimo;
		mailMax1:= v[i].email;
	end
	else
		if (v[i].cantDiasUltimo > max2) then 
		begin
			max2:= v[i].cantDiasUltimo;
			mailMax2:= v[i].email;
		end;
end;

procedure procesar(v:vector; var l:lista; var vc:vContador);
var
	u: usuario;
	i: Integer;
	max1,max2:Integer;
	mailMax1,mailMax2: String;
begin
	max1:= -1;
	max2:= -1;
	mailMax1:= '';
	mailMax2:= '';


	for i := 1 to dimF do 
	begin
		if (v[i].revistaParticipa = 'economica') then 
			insertarOrdenado(l,u);

		vc[v[i].rol]:= vc[v[i].rol] + 1;

		max(v,i,max1,max2,mailMax1,mailMax2);

	end;
end;

var
	v: vector;
	u: usuario;
	l: lista;
	vc: vContador;
	
begin
	l:= nil;

	cargarVector(v,u);
	procesar(v,l,vc);

	readln();
end.



