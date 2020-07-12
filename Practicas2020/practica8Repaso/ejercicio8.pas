program ejercicio8;
type
	fecha = record
		dia : 1..31;
		mes : 1..12;
		ano : 2017.. 2018;
	end;

	hora = record
		hora: 1..24;
		minutos : 1..60;
		segundos : 1..60;
	end;

	codigo = 1..7;

	tranferencia = record
		numCuentaOrigen : Integer;
		dniTitularCuentaOrigen : Integer;
		numCuentaDestino : Integer;
		dniTitularCuentaDestino: Integer;
		fechaTranferencia : fecha;
		horaTranferencia : hora;
		monto : Real;
		codMovito: codigo;
	end;

	lista = ^nodo; 					// se dispone
	nodo = record
		datos : tranferencia;
		sig : lista;
	end;

procedure leerTranferencia(args); 	// se dispone
begin
end;

procedure cargarListaTransferencia(args); // se dispone
begin
end;




begin
	
end.