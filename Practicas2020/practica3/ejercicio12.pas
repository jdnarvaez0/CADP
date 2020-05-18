program ejercicio12;
const
	Df = 10;
procedure sumaProducto(numX:Integer; numY:Integer; var suma:Integer; var producto:Integer);
	var
		i: Integer;
begin
	if (numX < numY) then 
	begin
		for i := numX to numY do 
		begin
			suma:=suma + i;
			producto:= producto * i;
		end;
	end
	else
		for i := numY to numX do 
		begin
			suma:= suma + i;
			producto:= producto * i;
		end;	
end;


var
	numX, numY, suma, producto, i: Integer;
begin
	for i := 1 to Df do 
	begin
		suma:= 0;
		producto:=1;
		
		write('Ingrese en numero X: ');
		readln(numX);
		write('Ingrese el numero Y ');
		readln(numY);

		sumaProducto(numX, numY, suma, producto);
		writeln('La suma es: ', suma);
		writeln('El producto es: ', producto);
		writeln('-------------------');
	end;

end.