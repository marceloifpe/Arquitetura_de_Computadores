-- File: alu.vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY alu IS
    PORT (
        A        : IN  STD_LOGIC;
        B        : IN  STD_LOGIC;
        CarryIn  : IN  STD_LOGIC;
        Operacao : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        Resultado: OUT STD_LOGIC;
        CarryOut : OUT STD_LOGIC
    );
END ENTITY alu;

ARCHITECTURE behavioral OF alu IS
BEGIN
    PROCESS (A, B, CarryIn, Operacao)
    BEGIN
        CASE Operacao IS
            WHEN "00" => -- AND
                Resultado <= A AND B;
                CarryOut  <= '0';
            WHEN "01" => -- ADD
                Resultado <= A XOR B XOR CarryIn;
                CarryOut  <= (A AND B) OR (CarryIn AND (A XOR B));
            WHEN "10" => -- SUB
                Resultado <= A XOR (NOT B) XOR CarryIn;
                CarryOut  <= (A AND (NOT B)) OR (CarryIn AND (A XOR (NOT B)));
            WHEN "11" => -- OR
                Resultado <= A OR B;
                CarryOut  <= '0';
            WHEN OTHERS =>
                Resultado <= 'X';
                CarryOut  <= 'X';
        END CASE;
    END PROCESS;
END ARCHITECTURE behavioral;