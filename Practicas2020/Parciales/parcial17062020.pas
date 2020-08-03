program parcial;
const
	dimF = 16;
	dimC = 7300;
type
	rangoCod = 1..16;
	str40 = String[40];
	
	plan = record
		codigoPlan : rangoCod;
		costoTotal : Real;
		cantSesiones : Integer; 
	end;
	
	cliente = record 						// se dispone
		nombre : str40;
		dni : Integer;
		ciudadOrigen : str40;
		codigoPlan : rangoCod;
		finalizo : Integer;
	end;
	
	lista = ^nodo;
	nodo = record
		datos : cliente;
		sig : lista;
	end;

	vCliente = array[1..7300] of cliente;	// se dispone
	vPlanes = array[1..dimF] of  plan;
	vContador = array[1..dimF] of Integer;

procedure CargargarVectorClientes(var vc:vCliente);		// se dispone
begin
end;

procedure agregarAdelante(var l:lista; c: cliente);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= c;
	nue^.sig:= l;
	l:= nue;
end;

procedure leerPlan(var p:plan);
begin
	with p do 
	begin
		write('Ingrese CODIGO PLAN: ');
		readln(codigoPlan);
		write('Ingrese COSTO TOTAL: ');
		readln(costoTotal);
		write('Ingres CANT DE SECCIONES: ');
		readln(cantSesiones);
		writeln('-------------------------');
	end;
end;

procedure cargarVectorPlanes(var vp: vPlanes);
var
	i: Integer;
	p: plan;
begin
	for i := 1 to dimF do 	
	begin
		leerPlan(p);
		vp[p.codigoPlan]:= p;
	end;
end;

procedure calcularGanancias(vcont: vContador; vp: vPlanes; var sumaTotal: Real);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		sumaTotal:= sumaTotal + (vcont[i] * vp[i].costoTotal);
	end;
end;

function cumpleConcidicion(finalizo: Integer; cantSesiones: Integer): Boolean;
begin
	cumpleConcidicion:= finalizo = cantSesiones;
end;

procedure procesarInfo(vc: vCliente; vp: vPlanes; var vcont: vContador; var l:lista);
var
	i: Integer;
	sumaTotal: Real;
begin
	for i := 1 to dimC do 
	begin
		vcont[vc[i].codigoPlan]:= vcont[vc[i].codigoPlan] + 1;

		if (cumpleConcidicion(vc[i].finalizo, vp[vc[i].codigoPlan].cantSesiones)) then 
			agregarAdelante(l, vc[i]);
	end;
	calcularGanancias(vcont, vp, sumaTotal);
	writeln('La ganancia TOTAL DEL CENTRO ES: ', sumaTotal);
end;

var
	vp: vPlanes;
	vc: vCliente;
	vcont: vContador;
	l: lista;

begin
	l:= nil;

	CargargarVectorClientes(vc);
	cargarVectorPlanes(vp);
	procesarInfo(vc,vp,vcont,l);
end.