with ada.text_io;
use ada.text_io;

procedure euler7 is
	function is_prime(n : integer) return boolean is
		i : integer := 2;
	begin
		while i * i <= n loop
			if n mod i = 0 then
				return false;
			end if;
			i := i + 1;
		end loop;
		return true;
	end;
	count : integer := 0;
	i : integer := 2;
begin
	while count < 10001 loop
		if is_prime(i) then
			count := count + 1;
			put_line(integer'image(count) & integer'image(i));
		end if;
		i := i + 1;
	end loop;
end;
