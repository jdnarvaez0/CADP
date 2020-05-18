program ejercicio15;

function esNumero(c:Char): Boolean;
begin
	esNumero:= (c >= '0') and (c <= '9');
end;

procedure cumpleX(var cumple: Boolean);
var
	c: Char;
begin
	write('Ingrese la secuencia X: ');
	readln(c);
	while (c <> '&') and (cumple) do 
	begin
		if (not esNumero(c)) then
		begin
			cumple:= false;
		end			
		else
			begin
				write('Ingrese la secuencia X ');
				readln(c);
			end;
	end;
end;


function esVocalMinuscula(c:Char): Boolean;
begin
	esVocalMinuscula:= (c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u');
end;

procedure cumpleY(var cumple:Boolean; var long:Integer);
var
	c: Char;
begin
	write('Ingrese la secuencia Y: ');
	readln(c);
	while (c <> '&') and (cumple) do
  	begin	
   		if (not esVocalMinuscula(c)) then
   			cumple:= false
	    else
			long:= long + 1;
			write('Ingrese la secuencia Y: ');
			readln(c);	
	end;	
end;

procedure cumpleZ(long:Integer; var cumple:Boolean);
var
	c: char;
	longZ: Integer;
begin
	longZ:= 0;
	write('Ingrese la secuencia Z: ');
	readln(c);
	while (c <> '*') and (not(longZ = long * 2)) do 
	begin
		longZ:= longZ + 1;
		write('Ingrese la secuencia Z: ');
		readln(c);
	end;
	cumple:= (longZ = long * 2);
end;

var
	long: Integer;
	cumple: Boolean;
begin
	cumple:= true;
	cumpleX(cumple);
	if (cumple) then // if X
	begin
		long:=0;
		cumpleY(cumple, long);
		if (cumple )then // if Y
		begin
			cumpleZ(long, cumple);  
			if cumple then 	// if Z
				writeln('Se cumple la secuencia')
			else
				writeln('No cumple con Z');
		end //end del if Y
		else
		writeln('No se cumple con Y')
	end
	else
		writeln('NO cumple con el pratron X');	
end.
