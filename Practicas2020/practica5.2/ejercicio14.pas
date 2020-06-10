program Project1;
type
  puntos = array[1..5] of real;
  datos = array[1970..1975] of puntos;

procedure  cargarInformacion(var d: datos);
var
   i,j: integer;
begin
     for i:=1970 to 1975 do begin
         writeln('Leyendo datos para:', i);
         writeln;
         for j:= 1 to 5 do begin
           // en d[i] tengo un arreglo de tipo puntos
           writeln('Ingrese la temperatura: ');
           readln(d[i][j]);
       end;
     end;
end;

// busca promedio y temperatura mas alta en un arreglo de puntos
procedure calcularPromedio(p: puntos; var promedio, maxTemp: real);
var
   i: integer;
   suma: real;
begin
     maxTemp:= -1;
     suma:= 0;
     for i:=1 to 5 do begin
         // para calcular temperatura maxima
         if (p[i] > maxTemp) then
            maxTemp:= p[i];
         // para calcular promedio
         suma:= suma + p[i];
     end;

     promedio:= suma / 100;
end;

procedure calcular(d: datos; var anioConPromMasAlto, anioConTempMasAlta: integer );
var
   i: integer;
   max, promedio, tempMasAlta, maxTemp: real;
 begin
      // inicializo maximos para el control
      max:= -1;
      tempMasAlta:= -1;

      for i:= 1970 to 1975 do begin
          // Estoy procesando informacion para un anio.
          calcularPromedio(d[i], promedio, maxTemp);


          // controlar promedio
          if (promedio > max) then begin
            max:= promedio;
            anioConPromMasAlto:= i;
          end;


          // controlar temperatura mas alta
          if (maxTemp > tempMasAlta) then begin
             tempMasAlta:= maxTemp;
             anioConTempMasAlta:= i;
          end;
      end;
 end;

var
   d: datos;
   maxAnio, anioTempMasAlta: integer;

begin
  maxAnio:= 999;
  anioTempMasAlta:= 999;
  // cargo matrix porque conozco cantidad total de datos.
  cargarInformacion(d);
  // calcula maximos
  calcular(d, maxAnio, anioTempMasAlta);

  writeln('El promedio mas alto fue en al anio: ', maxAnio);
  writeln('La temperatura mas alta fue en al anio: ', anioTempMasAlta);
  readln;
end.




