with Ada.Text_IO;

procedure Euler17 is
   function Length(A : String) return Natural is (A'Length);
   
   Word_Lengths : array(Natural range <>) of Natural :=
     (
      Length(""),
      Length("one"),
      Length("two"),
      Length("three"),
      Length("four"),
      Length("five"),
      Length("six"),
      Length("seven"),
      Length("eight"),
      Length("nine"),
      Length("ten"),
      Length("eleven"),
      Length("twelve"),
      Length("thirteen"),
      Length("fourteen"),
      Length("fifteen"),
      Length("sixteen"),
      Length("seventeen"),
      Length("eighteen"),
      Length("nineteen"));
   
   Word_Ty_Lengths : array(Natural range <>) of Natural :=
     (Length(""),
      Length(""),
      Length("twenty"),
      Length("thirty"),
      Length("forty"),
      Length("fifty"),
      Length("sixty"),
      Length("seventy"),
      Length("eighty"),
      Length("ninety"));
   
   function Word_Length(N : Natural) return Natural is
      Sum : Natural;
   begin
      if N <= 19 then
	 return Word_Lengths(N);
      elsif N <= 99 then
	 return Word_Ty_Lengths(N / 10) + Word_Lengths(N mod 10);
      elsif N = 1000 then
	 return Length("onethousand");
      else
	 Sum := Word_Lengths(N / 100) + Length("hundred");
	 if N mod 100 > 0 then
	    Sum := Sum + Length("and") + Word_Length(N mod 100);
	 end if;
	 return Sum;
      end if;
   end;
   
   Sum : Natural := 0;
begin
   for X in 1 .. 1000 loop
      Sum := Sum + Word_Length(X);
   end loop;
   Ada.Text_IO.Put_Line(Integer'Image(Sum));
end;
