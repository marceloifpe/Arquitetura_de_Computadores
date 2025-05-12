library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
end half_adder_tb;

architecture test of half_adder_tb is
    component half_adder
        port (
            A : in  std_logic;
            B : in  std_logic;
            S : out std_logic;
            C : out std_logic
        );
    end component;

    signal A, B : std_logic := '0';
    signal S, C : std_logic;

begin
    -- Instância do HALF ADDER
    uut: half_adder port map (
        A => A,
        B => B,
        S => S,
        C => C
    );

    -- Processo de teste
    process
    begin
        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;

        assert false report "Fim do teste do Half Adder" severity note;
        wait;
    end process;
end test;
