program ejercicio9;

type

	str40 = String[40];
	rangoGenero = 1..8;

	pelicula = record
		codPelicual : Integer;
		tituloPelicual : str40;
		codGenero : rangoGenero;
		puntajeProemdio : Real;
	end;

	critico = record
		dni : Integer;
		apellidoNombre : str40;
		codPelicula : Integer;
		puntOtorgado : Real;
	end;

	lista = ^nodo;
	nodo = record
		datos : pelicula;
		sig : lista;
	end;
	
procedure leerPelicula();		//se dispone
begin
end;

procedure cargarListaPelicula(); 		//se dispone
begin
end;

procedure leerCritico(var c:critico);
begin
	with c do 
	begin
		write('Ingrese el COD DE LA PELICULA: ');
		readln(codPelicula);
		write('Ingrese el DNI del critico: ');
		readln(dni);
		write('Ingrese APELLIDO Y NOMBRE: ');
		readln(apellidoNombre);
		write('Ingrese el PUNTAJE OTORGADO: ');
		readln(puntaOtorgado);
	end;
end;

procedure actualizarLista(var l:lista; c:critico);
var
	codPeliculaActual: Integer;
	sumaPuntaje: Real;
begin

	leerCritico(c);
	while c.codPelicula <> -1 do 
	begin
		codPeliculaActual:= c.codPelicula;
		sumaPuntaje:= 0;
			
		while (c.codPelicula <> -1) and (c.codPelicula = codPeliculaActual) do 	
		begin
			leerCritico(c);
			sumaPuntaje:= sumaPuntaje + 
		end;
	end;

end







begin
	
end.