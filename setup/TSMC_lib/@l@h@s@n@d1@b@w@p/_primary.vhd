library verilog;
use verilog.vl_types.all;
entity LHSND1BWP is
    port(
        D               : in     vl_logic;
        E               : in     vl_logic;
        SDN             : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end LHSND1BWP;
