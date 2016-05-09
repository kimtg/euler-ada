with ada.text_io;
use ada.text_io;

procedure euler6 is
	sum, sq_sum : integer := 0;
begin
	for i in 1 .. 100 loop
		sum := sum + i;
		sq_sum := sq_sum + i * i;
	end loop;
	put_line(integer'image(sum * sum - sq_sum));
end;
