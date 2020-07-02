program ejercicio14;
const
	dimF = 1300; // alumnos;
type
	rangoCodigo = 1..1300;
	rangoMes = 1..31;
	rangoTranporte = 1..5;

	alumno = record
		codAlumno : rangoCodigo;
		diaMes : rangoMes;
		nomFacultad : String;
		medioTransporte : rangoTranporte;
	end;

	vAlumno = array[1..dimF] of alumno;
	vTipoTransporte = array[1..5] of Integer;

procedure inicializarVectorTipo(var vt:vTipoTransporte);
var
	i: Integer;
begin
	for i := 1 to 5 do 
	begin
		vt[i]:= 0;
	end;
end;

procedure leerDatos(var a:alumno);
begin
	with a do
	begin
		write('Ingrese CODIGO ALUMNO: ');
		readln(codAlumno);
		write('Ingrese el DIA: ');
		write('Ingrese el NOMBRE DE LA FACULTAD: ');
		readln(nomFacultad);
		write('Ingerse MEDIO DE TRANPORTE: ');
		readln(medioTransporte);
	end;
end;

procedure cargarVector(var va: vAlumno; var vt: vTipoTransporte);
var
	i: Integer;
	a:alumno;
	
begin
	for i := 1 to dimF do 
	begin
		leerDatos(a);
	end
end

var
	vt: vTipoTransporte;
	va: vAlumno;
	
begin
	
end.