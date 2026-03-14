-- FSM.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    Port ( swA     : in STD_LOGIC;
           swB     : in STD_LOGIC;
           swPA    : in STD_LOGIC;
           SwPB    : in STD_LOGIC;
           ck_fsm  : in STD_LOGIC;
           semaforA : inout STD_LOGIC_VECTOR (3 downto 0);
           semaforB : inout STD_LOGIC_VECTOR (3 downto 0));
end FSM;

architecture Behavioral of FSM is

signal state, nextstate : integer range 0 to 12;

begin

process(state, swA, swB, swPB, swPA)
begin
    semaforA <= "0000";
    semaforB <= "0000"; -- starea initiala, fiecare led off

    case state is
        when 0 to 4 =>          -- 50 secunde
            semaforA  <= "1000"; -- Verde
            semaforB  <= "0011"; -- Rosu, Pietoni
            nextstate <= state + 1;

        when 5 =>                -- +10 secunde
            semaforA <= "1000";  -- Verde
            semaforB <= "0011";  -- Pietoni
            if swB = '1' or swPA = '1' then
                nextstate <= state + 1;
            end if;

        when 6 =>
            semaforA  <= "0100"; -- Galben
            semaforB  <= "0011"; -- Rosu, Pietoni
            nextstate <= state + 1;

        when 7 to 10 =>
            semaforA  <= "0011"; -- Rosu, Pietoni
            semaforB  <= "1000"; -- Verde
            nextstate <= state + 1;

        when 11 =>
            semaforA <= "0011";  -- Rosu, Pietoni
            semaforB <= "1000";  -- Verde
            if (swA = '1' and (swB = '0' or swPB = '1')) then
                nextstate <= state + 1;
            end if;

        when 12 =>
            semaforA  <= "0011"; -- Rosu, Pietoni
            semaforB  <= "0100"; -- Galben
            nextstate <= 0;

    end case;
end process;

process(ck_fsm)
begin
    if ck_fsm'event and ck_fsm = '1' then
        state <= nextstate;
    end if;
end process;

end Behavioral;
