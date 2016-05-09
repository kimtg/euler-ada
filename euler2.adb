with ada.text_io;
use ada.text_io;

procedure euler2 is
	a, b : integer := 1;
	s : integer := 0;
begin
	loop
		declare
			c : integer := a + b;
		begin
			exit when c > 4000000;
			if c mod 2 = 0 then
				s := s + c;
			end if;
			a := b;
			b := c;
		end;
	end loop;
	put_line(integer'image(s));
end euler2;
