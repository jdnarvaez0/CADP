program ejericicio5;
var
	num,x: Real;
	cont: Integer;
begin
	cont:=1;

	writeln('Ingrese un numero x');
	readln(x);
	writeln('Ingrese un numero');
	readln(num);

	while (x*2 <> num) and (cont <= 10) do
	begin
		cont:=cont+1;

		writeln('Ingrese un numero');
		readln(num);

	end;
end.
