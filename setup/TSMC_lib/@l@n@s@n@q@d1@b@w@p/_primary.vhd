library verilog;
use verilog.vl_types.all;
entity LNSNQD1BWP is
    port(
        D               : in     vl_logic;
        EN              : in     vl_logic;
        SDN             : in     vl_logic;
        Q               : out    vl_logic
    );
end LNSNQD1BWP;
