with ada.text_io;
use ada.text_io;

procedure euler5 is
	i : long_long_integer;
	n : long_long_integer := 20;
begin
	i := 19;
	while i >= 2 loop
		if n mod i /= 0 then
			n := n + 20;
			i := 20;
		end if;
		i := i - 1;
	end loop;
	put_line(long_long_integer'image(n));
end;
