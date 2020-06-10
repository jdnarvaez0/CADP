{7.Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que
no debe procesarse) e informe:
− la cantidad de ocurrencias de cada dígito procesado.
− el dígito más leído
− los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8
}

program ejercicio7;
type
        vnumeros = array[0..9] of Integer;

procedure inicializarVector(var v:vnumeros);
var
        i: Integer;
begin
        for i := 0 to 9 do
        begin
            v[i]:=0;
        end;
end;

procedure descomponer(var v:vnumeros; num:Integer);
var
        resto: Integer;
begin
    while num <> 0 do
    begin
        resto:= num mod 10;                                        
        v[resto]:=v[resto]+1;                                      
        num:= num div 10;                                                                                       
    end;                                                               
end;                                                                       
                                                                           
procedure informar(v:vnumeros);                                            
var                                                                        
        i,max,digMax: Integer;                                                    
begin                                                                      
        max:=-1;                                                           
                                                                           
        for i := 0 to 9 do                                                 
        begin                                                              
	        if v[i] > max then                                         
	        begin                                                      
	            max:=v[i]; 
	            digMax:= i;                                        
	        end;                                                       
	                                                                   
	        if v[i] = 0 then                                           
	        begin                                                      
	            writeln('el digito ', i, ' no tuvo ocurrencia');   
	        end                                                        
	        else                                                       
	            writeln('[',i, ' aparece ', v[i],']');
	         
	end;
	writeln('El digito mas leido es: ', digMax);
end;

var
        v: vnumeros;
        num:Integer;    
begin
    inicializarVector(v);
    
    writeln('ingere un numero');
    readln(num);

    while (num <> -1 ) do 
    begin       
        descomponer(v,num);         

        writeln('Ingrese un numero');
        readln(num);
    end;

    informar(v);
    readln();
end.
