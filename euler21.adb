with Ada.Text_IO;

procedure Euler21 is
   function Dsum(N : Natural) return Natural is
      Sum : Natural := 0;
   begin
      for X in 1 .. N / 2 loop
	 if N mod X = 0 then
	    Sum := Sum + X;
	 end if;
      end loop;
      return Sum;
   end;
   
   function Amicable(N : Natural) return Boolean is
      D : Natural := Dsum(N);
   begin
      return D /= N and then Dsum(D) = N;
   end;
   
   Sum : Natural := 0;
begin
   for X in 0 .. 9999 loop
      if Amicable(X) then
	 Sum := Sum + X;
      end if;
   end loop;
   Ada.Text_IO.Put_Line(Integer'Image(Sum));
end;
