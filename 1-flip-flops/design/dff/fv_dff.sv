// -------------------------------------------------
// Copyright(c) LUBIS EDA GmbH, All rights reserved
// Contact: contact@lubis-eda.com
// -------------------------------------------------

`default_nettype none

module fv_dff (
    // DUV interface
    input logic clk,    // Input
    input logic d,      // Input
    input logic q       // Output
);

    // Define default clock for every property
    default clocking default_clk @(posedge clk); endclocking

    // An alternative to this is to define clocking for each property, e.g.:
    // assert_behaviour1: assert property(@(posedge clk) behaviour1);


    property behaviour1;
        ##1 q == $past(d)
    ;endproperty

    // Tell the tool to check this property
    assert_behaviour1: assert property(behaviour1);


    property behaviour2;
        ##1 q == $past(d, 1) //(d,2) --> (d,1)
    ;endproperty

    // Tell the tool to check this property
    assert_behaviour2: assert property(behaviour2);

endmodule

// Connect this verification module with the design
bind dff fv_dff fv_dff_i(.*);
