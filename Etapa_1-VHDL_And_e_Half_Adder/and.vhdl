-- Desenvolvido por: Marcelo Augusto de Barros Araújo.
-- Disciplina: Arquitetura de Computadores.
-- Professor: Waldemar Neto.
-- Instituição: UABJ.
-- Curso: Engenharia da Computação.
-- Data: 12/05/25.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    port (
        A : in  std_logic;
        B : in  std_logic;
        Y : out std_logic
    );
end and_gate;

architecture behavior of and_gate is
begin
    Y <= A and B;
end behavior;
