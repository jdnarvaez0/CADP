program ejercicio4;
const
	Df = 9300;
	precioMIN = 3.40;
	precioBM = 1.34
type
	cliente = record
		codigo : Integer;
		canLineas: Integer;
	end;

	linea = record
		nTelefono : Integer;
		canMinutos: Real;
		cantMB : Real;
	end;

procedure leerCliente(var c: cliente);
begin
	write('Ingrese el CODIGO del cliente:  ');
	readln(c.codigo);
	write('Ingrese cantidad de lineas a su nombre: ');
	readln(c.canLineas);
end;

procedure leerLinea(var l:linea);
begin
	write('Ingrese el NUMERO DE TELEFONO: ');
	readln(l.nTelefono);
	write('Ingrese la cantidad de MINUTOS: ')
	readln(l.canMinutos);	
	write('Ingrese la cantidad de MB: ');
	readln(l.cantMB);
end;

procedure calcularTotales(c:cliente; var totalMin, totalBM: Real);
var
	l: linea;
begin
	for i := 1 to c.canLineas do 	
	begin
		leerLinea(l);
		totalMin:= totalMin + l.canMinutos;
		totalBM:= totalBM + l.cantMB;
	end;
end;

var
	c: cliente;
	l:linea;
	total,totalMin,totalBM: Real;
	
begin
	totalMin:=0;
	totalBM:=0;

	for i := 1 to Df do 
	begin
		leerCliente(c);
		calcularTotales(c,totalMin, totalBM);
		total:= (totalMin * precioMIN) + (totalBM * precioBM);
		writeln('El monto toal a facturar para el cliente ', c.codigo, ' es ', total)
	end
end.

