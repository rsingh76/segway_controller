library verilog;
use verilog.vl_types.all;
entity LND2BWP is
    port(
        D               : in     vl_logic;
        EN              : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end LND2BWP;
