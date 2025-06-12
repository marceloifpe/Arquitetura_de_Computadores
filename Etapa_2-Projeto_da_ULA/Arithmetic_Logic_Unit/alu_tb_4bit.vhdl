library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb_4bit is
end alu_tb_4bit;

architecture test of alu_tb_4bit is
        signal a, b, result           : STD_LOGIC_VECTOR(3 downto 0);
        signal carry_in, carry_out    : STD_LOGIC;
        signal operation              : STD_LOGIC_VECTOR(1 downto 0);
begin
    uut: entity work.alu_4bit
        port map (
            a         => a,
            b         => b,
            carry_in  => carry_in,
            operation => operation,
            result    => result,
            carry_out => carry_out
        );

    process
    begin
        -- AND: 1111 and 0000 = 0000
        a <= "1111"; b <= "0000"; carry_in <= '0'; operation <= "00";
        wait for 10 ns;

        -- ADD: 0101 (5) + 0011(3) = 1000(8)
        a <= "0101"; b <= "0011"; carry_in <= '0'; operation <= "01";
        wait for 10 ns;

        -- SUB: 1100(12) - 0010(2) = 1010(8)
        a <= "1100"; b <= "0010"; carry_in <= '0'; operation <= "10";
        wait for 10 ns;

        -- OR: 1010 or 0101 = 1111
        a <= "1010"; b <= "0101"; carry_in <= '0'; operation <= "11";
        wait for 10 ns;

        wait;
    end process;
end test;
-- -- File: alu_tb_4bit.vhdl
-- -- Description: Testbench para a ULA de 4 bits.

-- LIBRARY ieee;
-- USE ieee.std_logic_1164.ALL;

-- ENTITY alu_tb_4bit IS
-- END ENTITY alu_tb_4bit;

-- ARCHITECTURE test OF alu_tb_4bit IS
--     COMPONENT alu_4bit IS
--         PORT (
--             A        : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
--             B        : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
--             CarryIn  : IN  STD_LOGIC;
--             Operacao : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
--             Resultado: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
--             CarryOut : OUT STD_LOGIC
--         );
--     END COMPONENT;

--     SIGNAL s_A, s_B, s_Resultado : STD_LOGIC_VECTOR(3 DOWNTO 0);
--     SIGNAL s_CarryIn, s_CarryOut : STD_LOGIC;
--     SIGNAL s_Operacao            : STD_LOGIC_VECTOR(1 DOWNTO 0);

-- BEGIN
--     uut: alu_4bit PORT MAP(s_A, s_B, s_CarryIn, s_Operacao, s_Resultado, s_CarryOut);

--     stim_proc: PROCESS
--     BEGIN
--         -- Teste ADD: 5 + 3 = 8
--         s_Operacao <= "01"; s_CarryIn <= '0'; s_A <= "0101"; s_B <= "0011"; WAIT FOR 20 ns;

--         -- Teste SUB: 12 - 5 = 7
--         s_Operacao <= "10"; s_CarryIn <= '1'; s_A <= "1100"; s_B <= "0101"; WAIT FOR 20 ns;

--         -- Teste AND: 1101 & 1011 = 1001
--         s_Operacao <= "00"; s_CarryIn <= '0'; s_A <= "1101"; s_B <= "1011"; WAIT FOR 20 ns;

--         -- Teste OR: 1101 | 1011 = 1111
--         s_Operacao <= "11"; s_CarryIn <= '0'; s_A <= "1101"; s_B <= "1011"; WAIT FOR 20 ns;

--         WAIT;
--     END PROCESS;
-- END ARCHITECTURE test;