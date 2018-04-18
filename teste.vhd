library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity teste is

    generic
    (
        DATA_WIDTH : natural := 32
    );

    port
    (
        e1,e2,e3,e4,e5,e6,e7,e8    : in std_logic_vector((DATA_WIDTH-1) downto 0);
        z3    : in std_logic;
       
        q        : out std_logic_vector((DATA_WIDTH-1) downto 0)
    );

end entity;

architecture v1 of teste is

begin

    q<=
        e1 when z3='1' else
        e2;
   
end v1;

architecture v2 of teste is

begin

    q<=
        e1 nand e2;
   
end v2;

architecture v3 of teste is

    signal sum1, sum2: signed ((DATA_WIDTH-1) downto 0);

begin

    sum1<=signed(e1);
    sum2<=signed(e2);
   
    q<=
        std_logic_vector(sum1 + sum2);
   
end v3;

architecture v4 of teste is --aula do dia 18-04 - somador paralelo e serial

    signal sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8: signed ((DATA_WIDTH-1) downto 0);

begin

    sum1<=signed(e1);
    sum2<=signed(e2);
	 sum3<=signed(e3);
	 sum4<=signed(e4);
	 sum5<=signed(e5);
	 sum6<=signed(e6);
	 sum7<=signed(e7);
	 sum8<=signed(e8);
   
    q<=
        std_logic_vector(((((((sum1 + sum2) + sum3) + sum4) + sum5) + sum6) + sum7) + sum8);
   
end v4;

architecture v5 of teste is --aula do dia 18-04 - somador paralelo e serial

    signal sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8: signed ((DATA_WIDTH-1) downto 0);

begin

    sum1<=signed(e1);
    sum2<=signed(e2);
	 sum3<=signed(e3);
	 sum4<=signed(e4);
	 sum5<=signed(e5);
	 sum6<=signed(e6);
	 sum7<=signed(e7);
	 sum8<=signed(e8);
   
    q<=
        std_logic_vector(((sum1 + sum2) + (sum3 + sum4)) + ((sum5 + sum6) + (sum7 + sum8)));
   
end v5;

configuration cfg of teste is  -- Configuration Declaration
    for v5                     -- Block Configuration
    end for;
end cfg;