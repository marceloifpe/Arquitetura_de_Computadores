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