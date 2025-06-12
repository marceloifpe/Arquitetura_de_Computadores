# Arquitetura_de_Computadores
Repositorio para as atividades desenvolvidas durante a disciplina.
Professor: Waldemar Neto.

# Projeto ULA - Porta AND e Half Adder em VHDLMore actions
# Projeto ULA - Portas Lógicas, Half Adder e ALU em VHDL

Este projeto faz parte da disciplina **Arquitetura de Computadores** e consiste na implementação de duas unidades funcionais básicas de uma ULA (Unidade Lógica e Aritmética) utilizando a linguagem **VHDL**:
Este projeto foi desenvolvido como parte da disciplina de Arquitetura de Computadores e tem como objetivo a implementação de blocos fundamentais de uma ULA (Unidade Lógica e Aritmética) utilizando a linguagem VHDL.

- **Porta AND**: recebe duas entradas lógicas (`a` e `b`) e gera uma saída `y` que representa a conjunção lógica das entradas.
- **Half Adder**: circuito combinacional que soma dois bits (`a` e `b`) e gera duas saídas:
  - `y` (soma dos bits, operação XOR)
  - `carry_o` (transporte ou carry, operação AND)

## Estrutura do projeto:
```
Arquitetura_de_Computadores/
├── Etapa_1-VHDL_And_e_Half_Adder/
│   ├── and.vhdl
│   ├── and_tb.vhdl
│   ├── half_adder.vhdl
│   ├── half_adder_tb.vhdl
│
│
├── Etapa_2-Projeto_da_ULA/Arithmetic_Logic_Unit/
│   ├── alu.vhdl
│   ├── alu_tb_1bit.vhdl
│   ├── alu_4bit.vhdl
│   ├── alu_tb_4bit.vhdl

```

- `and.vhdl` — definição da porta AND
- `halfAdder.vhdl` — definição do Half Adder
- `and_tb.vhdl` — testbench para a porta AND (opcional)
- `halfAdder_tb.vhdl` — testbench para o Half Adder

## Parte 1 – Porta AND

## Como simular
A porta AND recebe duas entradas binárias (a, b) e produz a saída y = a AND b.

Para simular os circuitos com o GHDL e visualizar as formas de onda com o GTKWave, siga os comandos:
Arquivos:
- `and.vhdl`: implementação da porta AND
- `and_tb.vhdl`: testbench para simulação

```bash
# Analisar os arquivos VHDL
ghdl -a and_gate.vhdl
ghdl -a halfAdder.vhdl
ghdl -a halfAdder_tb.vhdl
## Parte 2 – Meio Somador (Half Adder)

# Elaborar o testbench
ghdl -e halfAdder_tb
O meio somador realiza a soma de dois bits (a, b).

# Rodar a simulação gerando arquivo VCD
ghdl -r halfAdder_tb --vcd=wave.vcd
Entradas: a, b
Saídas:
- y = a XOR b
- carry_o = a AND b

# Visualizar o arquivo VCD no GTKWave
Arquivos:
- `half_adder.vhdl`: implementação do meio somador
- `half_adder_tb.vhdl`: testbench para simulação

## Parte 3 – ULA de 1 e 4 bits

A ALU realiza operações lógicas e aritméticas de 1 bit, podendo ser instanciada para formar uma ALU de 4 bits.

Operações suportadas (definidas por um seletor de 2 bits):
- "00": AND
- "01": ADD (com carry_in)
- "10": SUB (com carry_in)
- "11": OR

Arquivos:
- `alu.vhdl`: implementação da ALU de 1 bit
- `alu_tb_1bit.vhdl`: testbench da ALU de 1 bit
- `alu_tb_4bit.vhdl`: testbench da ALU de 4 bits

## Simulação com GHDL e GTKWave

Execute os comandos na pasta do componente a ser testado.

1. Analisar os arquivos VHDL:

```
ghdl -a arquivo.vhdl
```

2. Elaborar o testbench:

```
ghdl -e nome_do_testbench
```

3. Executar a simulação e gerar arquivo VCD:

```
ghdl -r nome_do_testbench --vcd=wave.vcd
```

4. Visualizar no GTKWave:

```
gtkwave wave.vcd


#Descrição do que acontece nessa ULA:
ULA 1 BIT e ULA 4 BITS
Caso 1: Quando Operacao = "01" (ADD)-Adição
O que você está testando: A soma 1+1. (Assumindo CarryIn = 0).
Cálculo: 1+1=2, que em binário é 10 (Resultado 0, Carry-Out 1).

Caso 2: Quando Operacao = "00" (AND)-Adição
O que você está testando: A operação lógica 1 AND 1. (Assumindo CarryIn = 0-ignora op lógica).
Cálculo: 1+1=1. que é em binário 11 (Resultado 1 Carry-Out 0).

Caso 3: Quando Operacao = "11" (OR)
O que você está testando: A operação lógica 1 OR 1. (Assumindo CarryIn = 0-ignora op lógica)
Cálculo: 1 OR 1=1. que em binário é 1 (Resutado 1 carry-out 0).

Caso 4: Quando Operacao = "10" (SUB)
O que você está testando: A subtração 1−1. (Assumindo CarryIn = 1).
Cálculo mental: 1−1=0. que em binário é 00 (Resultado 0 carry-out 1).

Esses são alguns exemplos de combinações mais comuns, mas no total são 8 possibilidades para ADD
e SUB também é 8 para cada operação matemática, já para AND E OR 4 possibilidades cada operação
lógica.

Tabela Verdade Completa da ULA de 1 Bit
Esta seção detalha o comportamento esperado da ULA para todas as combinações de entradas possíveis.

Operação AND (Seletor = "00")
O CarryIn é ignorado para operações lógicas.

| A | B | Resultado | CarryOut |
|:-:|:-:|:-----------:|:----------:|
| 0 | 0 |      0      |      0     |
| 0 | 1 |      0      |      0     |
| 1 | 0 |      0      |      0     |
| 1 | 1 |      1      |      0     |

Operação OR (Seletor = "11")
O CarryIn é ignorado para operações lógicas.

| A | B | Resultado | CarryOut |
|:-:|:-:|:-----------:|:----------:|
| 0 | 0 |      0      |      0     |
| 0 | 1 |      1      |      0     |
| 1 | 0 |      1      |      0     |
| 1 | 1 |      1      |      0     |

Operação ADD (Seletor = "01")
| A | B | CarryIn | Resultado | CarryOut |
|:-:|:-:|:---------:|:-----------:|:----------:|
| 0 | 0 |     0     |      0      |      0     |
| 0 | 0 |     1     |      1      |      0     |
| 0 | 1 |     0     |      1      |      0     |
| 0 | 1 |     1     |      0      |      1     |
| 1 | 0 |     0     |      1      |      0     |
| 1 | 0 |     1     |      0      |      1     |
| 1 | 1 |     0     |      0      |      1     |
| 1 | 1 |     1     |      1      |      1     |

Operação SUB (Seletor = "10")
Lembre-se que a lógica é Resultado = A XOR (NOT B) XOR CarryIn.
Um CarryOut=0 indica que houve um "empréstimo" (borrow).

| A | B | CarryIn | Resultado | CarryOut |
|:-:|:-:|:---------:|:-----------:|:----------:|
| 0 | 0 |     0     |      1      |      0     |
| 0 | 0 |     1     |      0      |      1     |
| 0 | 1 |     0     |      0      |      0     |
| 0 | 1 |     1     |      1      |      0     |
| 1 | 0 |     0     |      0      |      1     |
| 1 | 0 |     1     |      1      |      1     |
| 1 | 1 |     0     |      1      |      0     |
| 1 | 1 |     1     |      0      |      1     |

## Autor:

- [Marcelo Augusto](https://github.com/marceloifpe)

