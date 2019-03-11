LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY counter IS
	PORT (CLOCK, CLRn, UD : IN STD_LOGIC;
			Q               : INOUT STD_LOGIC_VECTOR (3 downto 0));
END counter;

ARCHITECTURE Behavior OF counter IS 
BEGIN
	PROCESS (CLOCK, CLRn, UD)
	Begin
		IF CLRn = '0' THEN
			Q <= "0000";
		ELSIF (CLOCK'EVENT AND CLOCK = '1') THEN
			If UD = '1' then
				Q <= Q + 1;
			Else
				Q <= Q - 1;
			END If;
		END IF;
	END PROCESS;
END Behavior; 	