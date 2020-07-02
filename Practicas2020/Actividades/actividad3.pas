program actividad3;
const
	dimF = 20;
type
	str40 = String[40];
	rangoCategoria = 1..20;

	producto = record
		nombre : str40;
		precioCosto : Real;
		precioVenta : Real;
		categoria : Integer;
	end;

	lista = ^nodo;
	nodo = record
		datos : producto;
		sig : lista;
	end;

	vContador = array[rangoCategoria] of Integer;

procedure LeerDatos(var p:producto);
begin
	with p do 
	begin
		write('Ingrese la CATEGORIA: ');
		readln(categoria);
		if (categoria <> 999) then 
		begin
			write('Ingrese el NOMBRE: ');
			readln(nombre);
			write('Ingrese PRECIO DE COSTO: ');
			readln(precioCosto);
			write('Ingrese PRECIO DE VENTA: ');
			readln(precioVenta);
			writeln('------------------------');
		end;
	end;
end;

procedure inicializarVectorContador(var vc:vContador);
var
	i: rangoCategoria;
begin
	for i := 1 to dimF do 	
	begin
		vc[i]:=0;
	end;
end;

procedure agregarAdelante(var l:lista; p:producto);
var
	nue: lista;
begin
	new(nue);
	nue^.datos:= p;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarLista(var l:lista);
var
	p: producto;
begin
	LeerDatos(p);
	while (p.categoria <> 999) do 
	begin	
		agregarAdelante(l,p);
		LeerDatos(p);
	end;
end;

//#### FINALIZO CARGA DE LISTA ####

procedure imprimirVector(vc:vContador);
var
	i: rangoCategoria;
begin
	for i := 1 to dimF do 
	begin
		writeln('La CATEGORIA: ', i, ' tiene ', vc[i], ' productos ');
	end;
end;

function cumple(precioCosto,precioVenta: Real): Boolean;
begin
	cumple:= (precioVenta > ((precioCosto)*1.1));
end;

procedure nomMaxProducto(precio:Real; var max:Real; nombre: String; var nomMax:String);
begin
	if (precio > max) then 
	begin
		max:= precio;
		nomMax:= nombre;
	end;
end;

procedure procesarInfo(l:lista; var vc:vContador);
var
	cat, cont: Integer;
	max: Real;
	nomMax: String;
	
begin
	cont:= 0;
	max:= -1;
	nomMax:= '';

	while (l <> nil) do 
	begin
		cat:= l^.datos.categoria; //inciso 1
		vc[cat]:= vc[cat] + 1;

		if (cumple(l^.datos.precioCosto,l^.datos.precioVenta)) then //inciso 2
			cont:= cont + 1;

		nomMaxProducto(l^.datos.precioVenta, max, l^.datos.nombre,nomMax); //inciso 3

		l:= l^.sig;
	end;

	//inciso 1
	imprimirVector(vc);
	writeln('--------------------------------------------------------');
	//inciso 2 
	writeln('La cantidad de productos que dejan gananacia son: ', cont);
	//inciso 3
	writeln('El nombre del producto con mayor precio es: ', nomMax);
end;

var
	l: lista;
	vc: vContador;
	
begin
	l:=nil;

	inicializarVectorContador(vc);
	cargarLista(l);
	procesarInfo(l,vc);
	readln();
end.
