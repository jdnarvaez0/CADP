{
1) ¿Qué es la memoria estática?
En esta parte de la memoria es donde se  almacena el contenido de una variable en memoria en tiempo de ejecución
es en memoria estática o permanente a lo largo de toda la ejecución del programa. O sea,  que no se modifica 
al menos en tiempo de ejecución.

2)¿Qué es la memoria dinámica?
Es una memoria donde su tamano varia durante la ejecucion del programa
y puede ser liberada mediante programa como el clean para eliminar variable que no usemos mas
o sea que esta memoria se modifica constantemente de acuerdo al porgrama qu estemos ejecutando.

3)¿Qué es una variable del tipo puntero?
Un puntero es un tipo de datos cuyo valor es una dirección de memoria.

4)¿Qué hace la operación de NEW sobre una variable del tipo puntero?
Hace que se reserver la memoria para poder trabajar con punteros en nuestra apliacion (ASIGANACION DINAMICA DE MEMORIA)
El efecto de la operacion  NEW es: 

1- Se crea un espacio nuevo para una variable de tipo T (tanta memoria como requiera el tipo)
2- La direccion de este espacio se guarda en la variable ptr

5)¿Qué hace la operación de DISPOSE sobre una variable del tipo puntero?
DISPOSE lo que hace es liberar conexiones que existen entre la varible y la posicion de memoria 
-indica al sistema que una celda de memoria ya no ser� m�s utilizada
-el sistema recupera el espacio y lo puede reutilizar	
}

//1) Indique los valores que imprime el siguiente programa en pascal.


// program punteros;
// type
// 	cadena = String[50];
// 	puntero_cadena= ^cadena;
// var
// 	pc: puntero_cadena;
// begin
// 	writeln(sizeof(pc), ' bytes'); 		//8
// 	new(pc);
// 	writeln(sizeof(pc), ' bytes');		//8
// 	pc^:= ' un nuevo nombre';
// 	writeln(sizeof(pc), ' bytes');		//8
// 	writeln(sizeof(pc^), ' bytes');		//51
// 	pc^:= ' otro nuevo nombre distinto al anterior';
// 	writeln(sizeof(pc^), ' bytes');		//51
// 	readln();
// end.

// 2) Indique los valores que imprime el siguiente programa en pascal.


// program ejercicio1;
// type
// 	cadena = string[9];

// 	producto = record
// 		codigo: integer; //2
// 		descripcion: cadena; //10
// 		precio: real; //4
// 	end;

// puntero_producto = ^producto;
// var
// 	p: puntero_producto;
// 	prod: producto;
// begin
// 	writeln(sizeof(p), ' bytes'); 			//4
// 	writeln(sizeof(prod), ' bytes');    	//16
// 	new(p);
// 	writeln(sizeof(p), ' bytes');       	//4
// 	p^.codigo:= 1;							
// 	p^.descripcion := 'nuevo producto';     
// 	writeln(sizeof(p^), ' bytes');			//
// 	p^.precio := 200;
// 	writeln(sizeof(p^), ' bytes');			//16
// 	prod.codigo := 2;
// 	prod.descripcion := 'otro nuevo producto';
// 	writeln(sizeof(prod), ' bytes');
// 	readln();
// end.

//3) Indique los valores que imprime el siguiente programa en pascal.
// program punteros;
// type
// 	numeros = array[1..10000] of integer;
// 	puntero_numeros = ^numeros;
// var
// 	n: puntero_numeros;
// 	num: numeros;
// 	i:integer;
// begin
// 	writeln(sizeof(n), ' bytes');  //4
// 	writeln(sizeof(num), ' bytes'); //20000
// 	new(n);
// 	writeln(sizeof(n^), ' bytes'); //20000
// 	for i:= 1 to 5000 do
// 	n^[i]:= i;
// 	writeln(sizeof(n^), ' bytes'); //1000 // el programa me imprime 2000 pero creo yo que son 10000
// 	readln();
// end.

//4) Indique los valores que imprimen los siguientes programas en Pascal.
// program punteros;
// type
// 	cadena = string[50];
// 	puntero_cadena = ^cadena;
// var
// 	pc: puntero_cadena;
// begin
// 	pc^:= 'un nuevo texto'; //me da error porque no he creado el espacio de memoria del puntero pc^
// 	new(pc);

// 	//pc^:= 'juan david';	//pero si hago esto despues de haber creado el espacio de memoria para pc me imprime 'juan david'
// 	writeln(pc^); //51
// 	readln();
// end.

//B

// program punteros;
// type
// 	cadena = string[50];
// 	puntero_cadena = ^cadena;
// var
// 	pc: puntero_cadena;
// begin
// 	new(pc);
// 	pc^:= 'un nuevo nombre';
// 	writeln(sizeof(pc^), ' bytes'); 	//51
// 	writeln(pc^);						//un nuevo nombre
// 	dispose(pc);						//elimina la coneccion del puntero pc
// 	pc^:= 'otro nuevo nombre';			//le da un un nuvo valor a pc
// 	writeln(pc^);						//otro nuevo nombre
// 	readln();
// end.

//C

// program punteros;
// type
// 	cadena = string[50];
// 	puntero_cadena = ^cadena;
// procedure  cambiarTexto(pun: puntero_cadena);
// begin
// 	pun^:= 'Otro texto';
// end;
// var
// 	pc: puntero_cadena;
// begin
// 	new(pc);
// 	pc^:= 'Un texto';
// 	writeln(pc^);
// 	cambiarTexto(pc);
// 	writeln(pc^);
// 	readln();
// end.

//D

program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
procedure  cambiarTexto(pun: puntero_cadena);
begin
	new(pun); //como esta dentro de un proceso, se crea pero cuando regresa al pp desaparece el proceso por esta razon no imprime otro texto
	pun^:= 'Otro texto';
end;
var
	pc: puntero_cadena;
begin
	new(pc);
	pc^:= 'Un texto';
	writeln(pc^);
	cambiarTexto(pc);
	writeln(pc^);
	readln();
end.



