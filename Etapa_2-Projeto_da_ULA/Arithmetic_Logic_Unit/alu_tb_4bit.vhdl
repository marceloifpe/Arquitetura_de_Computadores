-- File: alu_tb_4bit.vhdl
-- Description: Testbench para a ULA de 4 bits.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY alu_tb_4bit IS
END ENTITY alu_tb_4bit;

ARCHITECTURE test OF alu_tb_4bit IS
    COMPONENT alu_4bit IS
        PORT (
            A        : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            B        : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            CarryIn  : IN  STD_LOGIC;
            Operacao : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
            Resultado: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            CarryOut : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL s_A, s_B, s_Resultado : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL s_CarryIn, s_CarryOut : STD_LOGIC;
    SIGNAL s_Operacao            : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
    uut: alu_4bit PORT MAP(s_A, s_B, s_CarryIn, s_Operacao, s_Resultado, s_CarryOut);

    stim_proc: PROCESS
    BEGIN
        -- Teste ADD: 5 + 3 = 8
        s_Operacao <= "01"; s_CarryIn <= '0'; s_A <= "0101"; s_B <= "0011"; WAIT FOR 20 ns;
        
        -- Teste SUB: 12 - 5 = 7
        s_Operacao <= "10"; s_CarryIn <= '1'; s_A <= "1100"; s_B <= "0101"; WAIT FOR 20 ns;
        
        -- Teste AND: 1101 & 1011 = 1001
        s_Operacao <= "00"; s_CarryIn <= '0'; s_A <= "1101"; s_B <= "1011"; WAIT FOR 20 ns;
        
        -- Teste OR: 1101 | 1011 = 1111
        s_Operacao <= "11"; s_CarryIn <= '0'; s_A <= "1101"; s_B <= "1011"; WAIT FOR 20 ns;

        WAIT;
    END PROCESS;
END ARCHITECTURE test;