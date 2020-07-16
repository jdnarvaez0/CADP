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
		din : Integer;
		apellidoNombre : str40;
		codPelicula : Integer;
		puntaOtorgado : Real;
	end;
	
procedure leerPelicula();		//se dispone
begin
end;

procedure cargarListaPelicula(); 		//se dispone
begin
end;







begin
	
end.