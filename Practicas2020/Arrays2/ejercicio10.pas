program ejercicio10;
const
	dimF = 3;
type

	str40= String[40];

	fotos = record
		tituloFoto: str40;
		autorFoto: str40;	
		cantMegusta: Integer;
		cantClick: Integer;
		cantComentario: Integer;
	end;

	vfotos = array[1..dimF] of fotos;
	
procedure cargarVectorFotos(var v:vfotos; f:fotos);
var
	i: Integer;
begin
	for i := 1 to dimF do 
	begin
		with f do 
		begin
			write('Ingrese el Titulo de la foto: ');
			readln(v[i].tituloFoto);
			write('Ingrese Autor de la foto: ');
			readln(v[i].autorFoto);
			write('Ingrese la cantidad de me gusta de la foto: ');
			readln(v[i].cantMegusta);
			write('Ingres la cantidad de Click en las fotos: ');
			readln(v[i].cantClick);
			write('Ingres la cantidad de comentarios: ');
			readln(v[i].cantComentario);
			writeln('######################################');
		end;
	end;	
end;


procedure informar(v:vfotos; f:fotos);
var
	i,max,sumaArt: integer;
	fotoMasVista: str40;
begin
	max:=-9999;
	sumaArt:=0;

	for i := 1 to dimF do
	begin
		
		if (v[i].cantClick >=max) then {INCISO1}
		begin
			max:= v[i].cantClick;
			fotoMasVista:= f.tituloFoto;
	 	 end;

		if (v[i].autorFoto = 'Art Vandelay') then {INCISO2}
		begin
			sumaArt:= sumaArt + v[i].cantMegusta;
		end;
		writeln('La cantidad de comentarios para la foto: ', v[i].tituloFoto, ' son: ', v[i].cantComentario);

	end;
	writeln('La cantidad total de Me gusta a las fotos cuyo autos es Art Vandelay es: ',sumaArt);
	writeln('La fotos mas vista es: ', fotoMasVista);
end;


procedure imprimirVectorfotos(v:vfotos);
var
	i:integer;
begin
	for i := 1 to dimF do
	begin
		writeln(v[i].tituloFoto);
		writeln(v[i].autorFoto);
		writeln(v[i].cantMegusta);
		writeln(v[i].cantClick);
		writeln(v[i].cantComentario);
	end;
end;

var
	v:vfotos;
	f:fotos;
begin
	cargarVectorFotos(v,f);
	informar(v,f);
	writeln();
	imprimirVectorfotos(v);
	readln();
end.
