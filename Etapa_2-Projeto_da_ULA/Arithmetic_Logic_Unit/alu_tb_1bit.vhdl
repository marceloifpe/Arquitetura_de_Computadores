-- File: alu_tb_1bit.vhdl
-- Description: Testbench para a ULA de 1 bit (CORRIGIDO).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY alu_tb_1bit IS
END ENTITY alu_tb_1bit;

ARCHITECTURE test OF alu_tb_1bit IS
    COMPONENT alu IS
        PORT (
            A        : IN  STD_LOGIC;
            B        : IN  STD_LOGIC;
            CarryIn  : IN  STD_LOGIC;
            Operacao : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
            Resultado: OUT STD_LOGIC;
            CarryOut : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL s_A, s_B, s_CarryIn, s_Resultado, s_CarryOut: STD_LOGIC;
    SIGNAL s_Operacao: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    -- CORREÇÃO: Usando associação por nome para conectar as portas.
    uut: alu PORT MAP(
        A         => s_A,
        B         => s_B,
        CarryIn   => s_CarryIn,
        Operacao  => s_Operacao,
        Resultado => s_Resultado,
        CarryOut  => s_CarryOut
    );

    stim_proc: PROCESS
    BEGIN
        -- Testes para a operação ADD ("01")
        -- Teste 0+0+0: Res=0, Cout=0
        s_Operacao <= "01"; s_A <= '0'; s_B <= '0'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste 0+0+1: Res=1, Cout=0
        s_Operacao <= "01"; s_A <= '0'; s_B <= '0'; s_CarryIn <= '1'; WAIT FOR 10 ns;
        -- Teste 0+1+0: Res=1, Cout=0
        s_Operacao <= "01"; s_A <= '0'; s_B <= '1'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste 0+1+1: Res=0, Cout=1
        s_Operacao <= "01"; s_A <= '0'; s_B <= '1'; s_CarryIn <= '1'; WAIT FOR 10 ns;
        -- Teste 1+0+0: Res=1, Cout=0
        s_Operacao <= "01"; s_A <= '1'; s_B <= '0'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste 1+0+1: Res=0, Cout=1
        s_Operacao <= "01"; s_A <= '1'; s_B <= '0'; s_CarryIn <= '1'; WAIT FOR 10 ns;
        -- Teste 1+1+0: Res=0, Cout=1
        s_Operacao <= "01"; s_A <= '1'; s_B <= '1'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste 1+1+1: Res=1, Cout=1
        s_Operacao <= "01"; s_A <= '1'; s_B <= '1'; s_CarryIn <= '1'; WAIT FOR 10 ns;
        -- Testes para a operação SUB ("10")
        -- Teste 0-0 (com Cin=0): Res=1, Cout=0 (com empréstimo)
        s_Operacao <= "10"; s_A <= '0'; s_B <= '0'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste 0-0 (com Cin=1): Res=0, Cout=1 (sem empréstimo)
        s_Operacao <= "10"; s_A <= '0'; s_B <= '0'; s_CarryIn <= '1'; WAIT FOR 10 ns;
        -- Teste 0-1 (com Cin=0): Res=0, Cout=0 (com empréstimo)
        s_Operacao <= "10"; s_A <= '0'; s_B <= '1'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste 0-1 (com Cin=1): Res=1, Cout=0 (com empréstimo)
        s_Operacao <= "10"; s_A <= '0'; s_B <= '1'; s_CarryIn <= '1'; WAIT FOR 10 ns;
        -- Teste 1-0 (com Cin=0): Res=0, Cout=1 (sem empréstimo)
        s_Operacao <= "10"; s_A <= '1'; s_B <= '0'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste 1-0 (com Cin=1): Res=1, Cout=1 (sem empréstimo)
        s_Operacao <= "10"; s_A <= '1'; s_B <= '0'; s_CarryIn <= '1'; WAIT FOR 10 ns;
        -- Teste 1-1 (com Cin=0): Res=1, Cout=0 (com empréstimo)
        s_Operacao <= "10"; s_A <= '1'; s_B <= '1'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste 1-1 (com Cin=1): Res=0, Cout=1 (sem empréstimo)
        s_Operacao <= "10"; s_A <= '1'; s_B <= '1'; s_CarryIn <= '1'; WAIT FOR 10 ns;
        -- Teste AND: 1 AND 0 = 0
        s_Operacao <= "00"; s_A <= '1'; s_B <= '0'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste AND: 0 AND 1 = 0
        s_Operacao <= "00"; s_A <= '0'; s_B <= '1'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Adicione este teste para ver o resultado 1 na operação AND
        s_Operacao <= "00"; s_A <= '1'; s_B <= '1'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste AND: 0 AND 0 = 0
        s_Operacao <= "00"; s_A <= '0'; s_B <= '0'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste OR: 1 OR 0 = 1
        s_Operacao <= "11"; s_A <= '1'; s_B <= '0'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste OR: 0 OR 1 = 1
        s_Operacao <= "11"; s_A <= '0'; s_B <= '1'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste OR: 1 OR 1 = 1
        s_Operacao <= "11"; s_A <= '1'; s_B <= '1'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        -- Teste OR: 0 OR 0 = 0
        s_Operacao <= "11"; s_A <= '0'; s_B <= '0'; s_CarryIn <= '0'; WAIT FOR 10 ns;
        WAIT;
    END PROCESS;
END ARCHITECTURE test;