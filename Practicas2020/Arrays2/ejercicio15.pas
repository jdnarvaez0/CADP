program ejercicio5;
const
	dimF = 1000;

type
	str40 = String[40];
	codRol = 1..5;
	rangoCod = 1..1000;

	participante = record
		PaisResidencia : str40; 
		codProyecto : Integer;
		nomProyecto : str40; 
		rol : codRol;
		cantHoras : Integer;
	end;

	info = record
		arquitectos : Integer;
		proyectoMonto : Real;
	end;

	contador = array[rangoCod] of info;
	tabla = array[codRol] of Real;

procedure inicializarVectorContador(var c:contador);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		c[i].arquitectos:= 0;
		c[i].proyectoMonto:= 0;
	end;
end;

procedure cargarTabla(var t:tabla);
begin
	t[1]:=25.20;
	t[2]:=27.45;
	t[3]:=31.03;
	t[4]:=44.28;
	t[5]:=39.81;
end;

procedure leerParticipante(var p: participante);
begin
	write('Ingrese el Codigo del participante: ');
	readln(p.codProyecto);
	if (p.codProyecto <> -1) then 
	begin
		with p do 
		begin
			write('Ingrese el Pais de residencia: ');
			readln(PaisResidencia);
			write('Ingrese el Nombre del proyecto: ');
			readln(nomProyecto);
			write('Ingrese el Rol del participante: ');
			readln(rol);
			write('Ingrese la cantidad de hora: ');
			readln(cantHoras);
		end;
	end;
end;

procedure imprimirProyectoMaximo(c:contador);
var
	i,codigoMax: Integer;
	max: Real;
begin
	max:=-1;

	for i := 1 to 1000 do 
	begin
		writeln('Proyecto: ', i, ' Aruitectos: ', c[i].arquitectos);

		if (c[i].proyectoMonto > max) then 
		begin
			max:= c[i].proyectoMonto;
			codigoMax:= i;
		end;
	end;
	writeln('el proyecto con el mayor monto invertido es de codigo: ', codigoMax);
end;

procedure procesar(p:participante; t:tabla; var c:contador; var montoArgentina:Real; var horasBasesDeDatos: Integer);
begin
	leerParticipante(p);

	while (p.codProyecto <> -1) do 
	begin
		if (p.PaisResidencia = 'Argentina') then 
		    montoArgentina:= montoArgentina + (p.cantHoras * t[p.rol]);

		if (p.rol = 3) then 
			horasBasesDeDatos:= horasBasesDeDatos + p.cantHoras;

		c[p.codProyecto].proyectoMonto:= c[p.codProyecto].proyectoMonto + (p.cantHoras) * t[p.rol];

		if (p.rol = 4) then 
			c[p.codProyecto].arquitectos:= c[p.codProyecto].arquitectos + 1;

		leerParticipante(p);
	end;
end;


var
	t: tabla;
	c: contador;
	horasBasesDeDatos: Integer;
	montoArgentina: Real;
	p: participante;
	
begin
	montoArgentina:=0;
	horasBasesDeDatos:= 0;

	inicializarVectorContador(c);
	cargarTabla(t);

	procesar(p,t,c,montoArgentina,horasBasesDeDatos);
	imprimirProyectoMaximo(c);

	writeln('El monto investido en desarroladores Argentions es: ', montoArgentina:4:2);
	writeln('Las horas trabajadas por administradores de bades de datos: ', horasBasesDeDatos);
	readln();
end.