program ejercicio2;
type 
  fechaC = record 
    dia: integer;
    mes: integer;
    ano: integer; 
  end;

procedure leerFecja (var f:fechaC);
begin
  write('Ingrese el dia: ');
  readln(f.dia);
  write('Ingrese el mes: ');
  readln(f.mes);
  write('Ingrese ano: ');
  readln(f.ano);
  writeln('----------------');
end;

function siEsVerano(f:fechaC): Boolean;
begin
	siEsVerano:= (((f.dia <= 21) and (f.mes = 3)  and (f.ano = 2017)) or 
				((f.mes = 1) or (f.mes = 2) and (f.ano = 2017)));
end;

function primeros10Dias(f:fechaC): Boolean;
begin
	primeros10Dias := ((f.dia >= 1) and (f.dia <=10));
end;

procedure casamientos2017(f:fechaC);
var
	cantCasamientos, cant10: integer;
begin
	cantCasamientos:=0;
	cant10:= 0;
	leerFecja(f);
	while (f.ano <> 2018) do 
 	begin 
 		if (siEsVerano(f)) then 
 		begin
 			cantCasamientos:= cantCasamientos + 1;
 		end;

 		if (primeros10Dias(f)) then 
 		begin
 			cant10:= cant10 + 1;
 		end;
 		leerFecja(f);
	end;
	writeln('La cantidad de casamientos en los meses de verano son: ', cantCasamientos);
	writeln('La cantidad de camsamientos en los primero 10 dias del mes es: ', cant10);
end;

var
	f: fechaC;
begin
	casamientos2017(f);
	readln();
end.