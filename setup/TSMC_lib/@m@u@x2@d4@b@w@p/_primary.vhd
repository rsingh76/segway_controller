library verilog;
use verilog.vl_types.all;
entity MUX2D4BWP is
    port(
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        S               : in     vl_logic;
        Z               : out    vl_logic
    );
end MUX2D4BWP;
