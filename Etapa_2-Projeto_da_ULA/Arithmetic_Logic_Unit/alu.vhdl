library ieee;
use ieee.std_logic_1164.all;

-- ULA de 1 bit
entity alu is
    port (
        a         : in  STD_LOGIC;
        b         : in  STD_LOGIC;
        carry_in  : in  STD_LOGIC;
        operation : in  STD_LOGIC_VECTOR(1 downto 0);
        result    : out STD_LOGIC;
        carry_out : out STD_LOGIC
    );
end alu;

architecture behavior of alu is
begin
    process (a, b, carry_in, operation)
        variable sum   : STD_LOGIC;
        variable carry : STD_LOGIC;
    begin
        case operation is
            when "00" =>  -- AND
                sum := a and b;
                carry := '0';

            when "01" =>  -- ADD
                sum := (a xor b) xor carry_in;
                carry := (a and b) or ((a xor b) and carry_in);

            when "10" =>  -- SUB
                sum := (a xor (not b)) xor carry_in;
                carry := (a and (not b)) or ((a xor (not b)) and carry_in);

            when "11" =>  -- OR
                sum := a or b;
                carry := '0';

            when others =>
                sum := '0';
                carry := '0';
        end case;

        result <= sum;
        carry_out <= carry;
    end process;
end behavior;

library ieee;
use ieee.std_logic_1164.all;

-- ULA de 4 bits
entity alu_4bit is
    port (
        a         : in  STD_LOGIC_VECTOR(3 downto 0);
        b         : in  STD_LOGIC_VECTOR(3 downto 0);
        carry_in  : in  STD_LOGIC;
        operation : in  STD_LOGIC_VECTOR(1 downto 0);
        result    : out STD_LOGIC_VECTOR(3 downto 0);
        carry_out : out STD_LOGIC
    );
end alu_4bit;

architecture structural of alu_4bit is

    component alu
        port (
            a         : in  STD_LOGIC;
            b         : in  STD_LOGIC;
            carry_in  : in  STD_LOGIC;
            operation : in  STD_LOGIC_VECTOR(1 downto 0);
            result    : out STD_LOGIC;
            carry_out : out STD_LOGIC
        );
    end component;

    signal c : STD_LOGIC_VECTOR(4 downto 0); -- sequência de carries
begin
    c(0) <= carry_in;

    alu0: alu port map(a(0), b(0), c(0), operation, result(0), c(1));
    alu1: alu port map(a(1), b(1), c(1), operation, result(1), c(2));
    alu2: alu port map(a(2), b(2), c(2), operation, result(2), c(3));
    alu3: alu port map(a(3), b(3), c(3), operation, result(3), c(4));

    carry_out <= c(4);

end structural;



-- -- File: alu.vhdl
-- LIBRARY ieee;
-- USE ieee.std_logic_1164.ALL;

-- ENTITY alu IS
--     PORT (
--         A        : IN  STD_LOGIC;
--         B        : IN  STD_LOGIC;
--         CarryIn  : IN  STD_LOGIC;
--         Operacao : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
--         Resultado: OUT STD_LOGIC;
--         CarryOut : OUT STD_LOGIC
--     );
-- END ENTITY alu;

-- ARCHITECTURE behavioral OF alu IS
-- BEGIN
--     PROCESS (A, B, CarryIn, Operacao)
--     BEGIN
--         CASE Operacao IS
--             WHEN "00" => -- AND
--                 Resultado <= A AND B;
--                 CarryOut  <= '0';
--             WHEN "01" => -- ADD
--                 Resultado <= A XOR B XOR CarryIn;
--                 CarryOut  <= (A AND B) OR (CarryIn AND (A XOR B));
--             WHEN "10" => -- SUB
--                 Resultado <= A XOR (NOT B) XOR CarryIn;
--                 CarryOut  <= (A AND (NOT B)) OR (CarryIn AND (A XOR (NOT B)));
--             WHEN "11" => -- OR
--                 Resultado <= A OR B;
--                 CarryOut  <= '0';
--             WHEN OTHERS =>
--                 Resultado <= 'X';
--                 CarryOut  <= 'X';
--         END CASE;
--     END PROCESS;
-- END ARCHITECTURE behavioral;