-- DivizorFrecventa.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity DivizorFrecventa is
    Port ( ck     : in STD_LOGIC;
           reset  : in STD_LOGIC;
           ck_out : out STD_LOGIC);
end DivizorFrecventa;

architecture Behavioral of DivizorFrecventa is

signal count : integer := 1;
signal tmp   : std_logic := '0';

begin

process(ck, reset)
begin
    if (reset = '1') then
        count <= 1;
        tmp   <= '0';
    elsif (ck'event and ck = '1') then
        count <= count + 1;
        if (count = 250000000) then
            tmp   <= NOT tmp;
            count <= 1;
        end if;
    end if;
    ck_out <= tmp;
end process;

end Behavioral;
