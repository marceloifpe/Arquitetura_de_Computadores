library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate_tb is
end and_gate_tb;

architecture test of and_gate_tb is
    component and_gate
        port (
            A : in  std_logic;
            B : in  std_logic;
            Y : out std_logic
        );
    end component;

    signal A, B : std_logic := '0';
    signal Y    : std_logic;

begin
    -- Instância da porta AND
    uut: and_gate port map (
        A => A,
        B => B,
        Y => Y
    );

    -- Processo de teste
    process
    begin
        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;

        assert false report "Fim do teste da porta AND" severity note;
        wait;
    end process;
end test;
