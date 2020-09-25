library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add_sub is
    port(
        a        : in  std_logic_vector(31 downto 0);
        b        : in  std_logic_vector(31 downto 0);
        sub_mode : in  std_logic;
        carry    : out std_logic;
        zero     : out std_logic;
        r        : out std_logic_vector(31 downto 0)
    );
end add_sub;

architecture synth of add_sub is
    
    signal s_xor_output, s_adder_output : signed(31 downto 0); 

begin

    s_xor_output <= b xor sub_mode;

    s_adder_output <= signed(a) + s_xor_output + to_signed(sub_mode, 32);

    zero <= '1' when s_adder_output = to_signed(0, 32) else '0';

    carry <= s_adder_output(0); 

    r <= std_logic_vector(s_adder_output);

end synth;
