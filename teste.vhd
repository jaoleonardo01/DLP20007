library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity teste is

    generic
    (
        DATA_WIDTH : natural := 8
    );

    port
    (
        e1,e2    : in std_logic_vector((DATA_WIDTH-1) downto 0);
        e3    : in std_logic;
       
        q        : out std_logic_vector((DATA_WIDTH-1) downto 0)
    );

end entity;

architecture v1 of teste is

begin

    q<=
        e1 when e3='1' else
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

configuration cfg of teste is  -- Configuration Declaration
    for v1                     -- Block Configuration
    end for;
end cfg;