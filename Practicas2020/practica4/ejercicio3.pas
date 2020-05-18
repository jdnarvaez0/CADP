program ejercicio3;
const
	Df = 2400;
	
type
	str40 = String[40];

	escuela = record
		cue : Integer;
		nomEstablecimiento: str40;
		cantDocente : Real;
		cantAlumnos : Real;
		localidad : str40; 
	end;	
	
procedure leerEscuela(var e: escuela);
begin
	write('Ingrese codigo de estableciento: ');
	readln(e.cue);
	write('Ingrese nombre del establecimiento: ');
	readln(e.nomEstablecimiento);
	write('Ingrese cantidad de DOCENTES: ');
	readln(e.cantDocente);
	write('Ingrese la cantidad de ALUMNOS: ');
	readln(e.cantAlumnos);
	write('Ingrese la LOCALIDAD: ');
	readln(e.localidad);
end;

procedure realcionDoyAlum(e:escuela; var relacionDA:Real);
begin
	relacionDA:= e.cantAlumnos / e.cantDocente;
end;

procedure mejorRelacionDocAlum(e:escuela; relacionDA:Real; var min1,min2:Real ; var cueMin1,cueMin2: Integer; var nombreMin1,nombreMin2: str40);
begin
	if (relacionDA <= min1) then 
	begin
		min2:= min1;
		cueMin2:= cueMin1;
		nombreMin2:= nombreMin1;
		min1:= relacionDA;
		cueMin1:= e.cue;
		nombreMin1:= e.nomEstablecimiento;
	end
	else
		if (relacionDA <= min2) then 
		begin
			min2:= relacionDA;
			cueMin2:= e.cue;
			nombreMin2:= e.nomEstablecimiento;
		end;
end;

var
	e: escuela;
	i,cantEscLP,cueMin1,cueMin2: Integer;	
	nombreMin1, nombreMin2 : str40;
	relacionDA, min1,min2: Real;
begin
	cantEscLP:=0;
	min1:= 9999;
	min2:= 9999;
	cueMin1:=0;
	cueMin2:=0;
	nombreMin1:= '';
	nombreMin2:= '';


	for i := 1 to Df do 
	begin
		leerEscuela(e);
		if (( relacionDA > 23.435 ) and (e.nomEstablecimiento = 'la plata')) then 
		begin
			cantEscLP:= cantEscLP + 1;
		end;
		mejorRelacionDocAlum(e,relacionDA,min1,min2,cueMin1,cueMin2,nombreMin1,nombreMin2);
	end;
	writeln('La cantidad de escuelas de la plata con una realacion superior al UNESCO es: ', cantEscLP);
	writeln('La mejor escuela con relacion es : ', cueMin1,'  ', nombreMin1);
	writeln('La segunda mejor con realcion es:  ', cueMin2, '  ', nombreMin2);
	writeln('La relacion es : ', relacionDA);
	readln();
 end.