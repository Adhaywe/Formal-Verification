// -------------------------------------------------
// Copyright(c) LUBIS EDA GmbH, All rights reserved
// Contact: contact@lubis-eda.com
// -------------------------------------------------

`default_nettype none

module jkff (
    input  logic clk,
    input  logic j,
    input  logic k,
    output logic q
);
    logic d_dff;
    logic q_dff;

    // Bitwise logic operations
    assign d_dff = ((~q_dff & j) | (q_dff & ~k));

    dff dff0_i(.clk(clk), .d(d_dff), .q(q_dff));

    assign q = q_dff;

endmodule
