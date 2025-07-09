library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity FreeCounter is
	generic (
		busWidth : integer := 8
		);	
	port (			 
	RST : in std_logic;
	CLK: in std_logic;
	ENA : in std_logic;
	CNT : out std_logic_vector(busWidth - 1 downto 0)
		);
end FreeCounter; 

architecture Behavioral of FreeCounter is
signal Cp, Cn : std_logic_vector(busWidth - 1 downto 0);
begin
	Combinational : process( Cp, ENA )
	begin  
	if ( ENA = '1' ) then
		Cn <= std_logic_vector(unsigned(Cp) + 1) ;
	else
		Cn <= Cp ;
	end if;	
	CNT <= Cp;
	end process;
	
	Sequential : process( CLK, RST )
	begin  
	if ( RST = '0' ) then
		Cp <= (others => '0') ;
	elsif ( CLK'event and CLK = '1' ) then
		Cp <= Cn ;
	end if;		
	end process;
end Behavioral;