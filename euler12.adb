with Ada.Text_IO;

procedure Euler12 is
   Triangle_Num : Positive := 1;
   I : Positive := 1;
   J : Positive;
   Num_Divisors : Natural;
begin
   loop
      Num_Divisors := 0;
      J := 1;
      while J * J <= Triangle_Num loop
	 if Triangle_Num mod J = 0 then
	    Num_Divisors := Num_Divisors + 2;
	 end if;
	 J := J + 1;
      end loop;
      Ada.Text_IO.Put_Line(Positive'Image(Triangle_Num) & Natural'Image(Num_Divisors));
      exit when Num_Divisors > 500;
      I := I + 1;
      Triangle_Num := Triangle_Num + I;
   end loop;
end Euler12;
