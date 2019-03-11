LIBRARY ieee;
USE ieee.std_logic_1164.all;

       
ENTITY clockdiv_V2 IS
    PORT (iclk : IN STD_LOGIC;
	       clr  : IN STD_LOGIC;
          oclk : OUT STD_LOGIC);
END clockdiv_V2;

ARCHITECTURE Behavior OF clockdiv_V2 IS
    SIGNAL Count    :   INTEGER RANGE 0 TO 8333332;
    SIGNAL clkstate :   STD_LOGIC;
BEGIN
    PROCESS (iclk, clr)
    BEGIN
		IF (clr = '0') THEN
			Count <= 0;
			clkstate <= '0';
      ELSIF (iclk'EVENT AND iclk = '1') THEN
        IF Count = 8333332 THEN     
          Count <= 0;
          clkstate <= not clkstate;
        ELSE
          Count <= Count + 1;
          clkstate <= clkstate;
        END IF;
      END IF;
    END PROCESS;
    oclk <= clkstate;
END Behavior;