-- Desenvolvido por: Marcelo Augusto de Barros Araújo.
-- Disciplina: Arquitetura de Computadores.
-- Professor: Waldemar Neto.
-- Instituição: UABJ.
-- Curso: Engenharia da Computação.
-- Data: 12/05/25.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    port (
        A : in  std_logic;
        B : in  std_logic;
        S : out std_logic;  -- Soma
        C : out std_logic   -- Carry (transporte)
    );
end half_adder;

architecture behavior of half_adder is
begin
    S <= A xor B;  -- Soma
    C <= A and B;  -- Transporte
end behavior;
