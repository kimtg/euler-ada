with ada.text_io, ada.strings.fixed;
use ada.text_io;

procedure euler4 is
	function is_palindrome(s : string) return boolean is
	begin
		for i in s'first .. s'last / 2 loop
			if s(i) /= s(s'last - i + 1) then
				return false;
			end if;
		end loop;
		return true;
	end;
	max_p : integer := 0;
	p : integer;
begin
	for i in 100 .. 999 loop
		for j in i .. 999 loop
			p := i * j;
			if is_palindrome(ada.strings.fixed.trim(integer'image(p), ada.strings.left)) and then p > max_p then
				max_p := p;
			end if;
		end loop;
	end loop;
	put_line(integer'image(max_p));
end euler4;
