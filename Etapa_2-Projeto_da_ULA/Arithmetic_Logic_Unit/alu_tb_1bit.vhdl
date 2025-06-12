-- File: alu_tb_1bit.vhdl
-- Description: Testbench para a ULA de 1 bit.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY alu_tb_1bit IS
END ENTITY alu_tb_1bit;

ARCHITECTURE test OF alu_tb_1bit IS
    COMPONENT alu IS
        PORT (
            A        : IN  STD_LOGIC;
            B        : IN  STD_LOGIC;
            CarryIn  : IN  STD_LOGIC;
            Operacao : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
            Resultado: OUT STD_LOGIC;
            CarryOut : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL s_A, s_B, s_CarryIn, s_Resultado, s_CarryOut: STD_LOGIC;
    SIGNAL s_Operacao: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    uut: alu PORT MAP(s_A, s_B, s_CarryIn, s_Operacao, s_Resultado, s_CarryOut);

    stim_proc: PROCESS
    BEGIN
        -- Teste ADD: 1+1+0 = 0, Cout=1
        s_Operacao <= "01"; s_A <= '1'; s_B <= '1'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste SUB: 1-1 (com Cin=1) = 0, Cout=1
        s_Operacao <= "10"; s_A <= '1'; s_B <= '1'; s_CarryIn <= '1'; WAIT FOR 10 ns;
        -- Teste AND: 1 AND 0 = 0
        s_Operacao <= "00"; s_A <= '1'; s_B <= '0'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste OR: 1 OR 0 = 1
        s_Operacao <= "11"; s_A <= '1'; s_B <= '0'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        WAIT;
    END PROCESS;
END ARCHITECTURE test;