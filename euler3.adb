with ada.text_io;
use ada.text_io;

procedure euler3 is
	num : long_long_integer := 600851475143;
	p : long_long_integer := 2;
begin
	loop
		while num mod p = 0 loop
			num := num / p;
		end loop;
		if num <= 1 then
			put_line(long_long_integer'image(p));
			exit;
		end if;
		p := p + 1;
	end loop;
end euler3;
