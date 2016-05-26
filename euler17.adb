with Ada.Text_IO;

procedure Euler17 is
   Word_Lengths : array(Natural range <>) of Natural :=
     (
      String'("")'Length,
      String'("one")'Length,
      String'("two")'Length,
      String'("three")'Length,
      String'("four")'Length,
      String'("five")'Length,
      String'("six")'Length,
      String'("seven")'Length,
      String'("eight")'Length,
      String'("nine")'Length,
      String'("ten")'Length,
      String'("eleven")'Length,
      String'("twelve")'Length,
      String'("thirteen")'Length,
      String'("fourteen")'Length,
      String'("fifteen")'Length,
      String'("sixteen")'Length,
      String'("seventeen")'Length,
      String'("eighteen")'Length,
      String'("nineteen")'Length);
   
   Word_Ty_Lengths : array(Natural range <>) of Natural :=
     (String'("")'Length,
      String'("")'Length,
      String'("twenty")'Length,
      String'("thirty")'Length,
      String'("forty")'Length,
      String'("fifty")'Length,
      String'("sixty")'Length,
      String'("seventy")'Length,
      String'("eighty")'Length,
      String'("ninety")'Length);
   
   function Word_Length(N : Natural) return Natural is
      Sum : Natural;
   begin
      if N <= 19 then
	 return Word_Lengths(N);
      elsif N <= 99 then
	 return Word_Ty_Lengths(N / 10) + Word_Lengths(N mod 10);
      elsif N = 1000 then
	 return String'("onethousand")'Length;
      else
	 Sum := Word_Lengths(N / 100) + String'("hundred")'Length;
	 if N mod 100 > 0 then
	    Sum := Sum + String'("and")'Length + Word_Length(N mod 100);
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
