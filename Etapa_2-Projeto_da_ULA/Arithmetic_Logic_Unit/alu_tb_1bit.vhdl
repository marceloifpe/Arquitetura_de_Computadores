library ieee;
use ieee.std_logic_1164.all;

entity alu_tb_1bit is
end alu_tb_1bit;

architecture test of alu_tb_1bit is
    signal a, b, carry_in, result, carry_out : STD_LOGIC;
    signal operation : STD_LOGIC_VECTOR(1 downto 0);
begin
    uut: entity work.alu
        port map (
            a => a,
            b => b,
            carry_in => carry_in,
            operation => operation,
            result => result,
            carry_out => carry_out
        );

    process
    begin
        -- AND
        a <= '1'; b <= '1'; carry_in <= '0'; operation <= "00";
        wait for 10 ns;

        -- OR
        a <= '1'; b <= '0'; carry_in <= '0'; operation <= "11";
        wait for 10 ns;

        -- ADD
        a <= '1'; b <= '1'; carry_in <= '0'; operation <= "01";
        wait for 10 ns;

        -- SUB
        a <= '0'; b <= '1'; carry_in <= '0'; operation <= "10";
        wait for 10 ns;

        wait;
    end process;
end test;