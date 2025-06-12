-- File: alu.vhdl
-- Description: 1-bit Arithmetic Logic Unit (ALU).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY alu IS
    PORT (
        a_i       : IN  STD_LOGIC;
        b_i       : IN  STD_LOGIC;
        carry_in  : IN  STD_LOGIC;
        op_i      : IN  STD_LOGIC_VECTOR(1 DOWNTO 0); -- Operation selector
        result_o  : OUT STD_LOGIC;
        carry_out : OUT STD_LOGIC
    );
END ENTITY alu;

ARCHITECTURE behavioral OF alu IS
BEGIN
    PROCESS (a_i, b_i, carry_in, op_i)
        -- For SUB, B must be inverted.
        VARIABLE b_operand : STD_LOGIC;
    BEGIN
        -- For subtraction, the second operand is inverted
        IF op_i = "10" THEN
            b_operand := NOT b_i;
        ELSE
            b_operand := b_i;
        END IF;

        CASE op_i IS
            WHEN "00" => -- AND
                result_o  <= a_i AND b_i;
                carry_out <= '0';

            WHEN "01" => -- ADD (Full Adder logic)
                result_o  <= a_i XOR b_i XOR carry_in;
                carry_out <= (a_i AND b_i) OR (carry_in AND (a_i XOR b_i));

            WHEN "10" => -- SUB (Full Adder logic with inverted B)
                result_o  <= a_i XOR b_operand XOR carry_in;
                carry_out <= (a_i AND b_operand) OR (carry_in AND (a_i XOR b_operand));

            WHEN "11" => -- OR
                result_o  <= a_i OR b_i;
                carry_out <= '0';

            WHEN OTHERS => -- Default case
                result_o  <= 'X';
                carry_out <= 'X';
        END CASE;
    END PROCESS;
END ARCHITECTURE behavioral;