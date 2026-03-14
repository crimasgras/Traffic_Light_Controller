-- TrafficLightController.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TrafficLightController is
    Port ( clock    : in STD_LOGIC;
           resetare : in STD_LOGIC;  -- btnC
           swA      : in STD_LOGIC;  -- switch nr. 0
           swPA     : in STD_LOGIC;  -- switch nr. 1
           swB      : in STD_LOGIC;  -- switch nr. 14
           swPB     : in STD_LOGIC;  -- switch nr. 15
           semaforA : inout STD_LOGIC_VECTOR (3 downto 0);  -- led 15=Verde, 14=Galben, 13=Rosu, 12=Pietoni
           semaforB : inout STD_LOGIC_VECTOR (3 downto 0)); -- led 3=Verde, 2=Galben, 1=Rosu, 0=Pietoni
end TrafficLightController;

architecture Behavioral of TrafficLightController is

component DivizorFrecventa is
    Port ( ck     : in STD_LOGIC;
           reset  : in STD_LOGIC;
           ck_out : out STD_LOGIC);
end component;

component FSM is
    Port ( swA     : in STD_LOGIC;
           swB     : in STD_LOGIC;
           swPA    : in STD_LOGIC;
           SwPB    : in STD_LOGIC;
           ck_fsm  : in STD_LOGIC;
           semaforA : inout STD_LOGIC_VECTOR (3 downto 0);
           semaforB : inout STD_LOGIC_VECTOR (3 downto 0));
end component;

signal ck10 : std_logic;

begin

U1: DivizorFrecventa
    port map ( ck     => clock,
               ck_out => ck10,
               reset  => resetare);

U2: FSM
    port map ( ck_fsm   => ck10,
               swA      => swA,
               swB      => swB,
               swPA     => swPA,
               swPB     => swPB,
               semaforA => semaforA,
               semaforB => semaforB);

end Behavioral;
