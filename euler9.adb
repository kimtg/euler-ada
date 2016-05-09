with ada.text_io;
use ada.text_io;

procedure euler9 is
	c : integer;
begin
	for a in 1 .. 999 loop
		for b in a + 1 .. 999 loop
			c := 1000 - a - b;
			if c > 0 and then a * a + b * b = c * c then
				put_line(integer'image(a * b * c));
			end if;
		end loop;
	end loop;
end;
