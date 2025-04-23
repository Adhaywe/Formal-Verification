// -------------------------------------------------
// Copyright(c) LUBIS EDA GmbH, All rights reserved
// Contact: contact@lubis-eda.com
// -------------------------------------------------

`default_nettype none

module dff (
    input  logic clk,
    input  logic d,
    output logic q
);

    always_ff @(posedge clk) begin
        q <= d;
    end

endmodule
