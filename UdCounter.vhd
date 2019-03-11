LIBRARY ieee;
USE ieee.std_logic_1164.all;

       
ENTITY udcounter IS
    PORT (CLOCK, CLRn, UD : IN STD_LOGIC;
          LED : OUT STD_LOGIC_VECTOR (0 to 6));
END udcounter;

ARCHITECTURE Behavior OF udcounter IS

SIGNAL OUTCLOCK : std_logic;
SIGNAL Q_temp : std_logic_vector (3 downto 0);

COMPONENT clockdiv_V2 IS
    PORT (iclk : IN STD_LOGIC;
	       clr  : IN STD_LOGIC;
          oclk : OUT STD_LOGIC);
END COMPONENT;

COMPONENT counter IS
	PORT (CLOCK, CLRn, UD : IN STD_LOGIC;
			Q               : INOUT STD_LOGIC_VECTOR (3 downto 0));
	END COMPONENT;

COMPONENT codeconv IS
    PORT ( W   : IN STD_LOGIC;
	        X   : IN STD_LOGIC;
			  Y   : IN STD_LOGIC;
			  Z   : IN STD_LOGIC;
           LED : OUT STD_LOGIC_VECTOR (0 to 6));
END COMPONENT;
		
BEGIN
	stage0: clockdiv_V2 PORT MAP (CLOCK, CLRn, OUTCLOCK); 
	stage1: counter PORT MAP (OUTCLOCK, CLRn, UD, Q_temp);
	stage2: codeconv PORT MAP (W => Q_temp(3), X => Q_temp(2), Y => Q_temp(1), Z => Q_temp(0), LED => LED);
   
END Behavior;