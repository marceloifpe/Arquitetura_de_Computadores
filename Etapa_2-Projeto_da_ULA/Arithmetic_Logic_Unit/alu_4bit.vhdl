-- -- File: alu_4bit.vhdl
-- -- Description: Implementação da ULA de 4 bits de forma estrutural.

-- LIBRARY ieee;
-- USE ieee.std_logic_1164.ALL;

-- ENTITY alu_4bit IS
--     PORT (
--         A        : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
--         B        : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
--         CarryIn  : IN  STD_LOGIC;
--         Operacao : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
--         Resultado: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
--         CarryOut : OUT STD_LOGIC
--     );
-- END ENTITY alu_4bit;

-- ARCHITECTURE structural OF alu_4bit IS
--     COMPONENT alu IS
--         PORT (
--             A        : IN  STD_LOGIC;
--             B        : IN  STD_LOGIC;
--             CarryIn  : IN  STD_LOGIC;
--             Operacao : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
--             Resultado: OUT STD_LOGIC;
--             CarryOut : OUT STD_LOGIC
--         );
--     END COMPONENT;

--     SIGNAL s_carry_chain : STD_LOGIC_VECTOR(2 DOWNTO 0);

-- BEGIN
--     -- ULA do bit 0 (LSB)
--     alu0: alu PORT MAP(A(0), B(0), CarryIn, Operacao, Resultado(0), s_carry_chain(0));
--     -- ULA do bit 1
--     alu1: alu PORT MAP(A(1), B(1), s_carry_chain(0), Operacao, Resultado(1), s_carry_chain(1));
--     -- ULA do bit 2
--     alu2: alu PORT MAP(A(2), B(2), s_carry_chain(1), Operacao, Resultado(2), s_carry_chain(2));
--     -- ULA do bit 3 (MSB)
--     alu3: alu PORT MAP(A(3), B(3), s_carry_chain(2), Operacao, Resultado(3), CarryOut);

-- END ARCHITECTURE structural;