// -------------------------------------------------
// Copyright(c) LUBIS EDA GmbH, All rights reserved
// Contact: contact@lubis-eda.com
// -------------------------------------------------

`default_nettype none

module fv_jkff (
    // DUV interface
    input logic clk,    // Input
    input logic j,      // Input
    input logic k,      // Input
    input logic q       // Output
);

    // Define default clock for every property
    default clocking default_clk @(posedge clk); endclocking

    // An alternative to this is to define clocking for each property, e.g.:
    // assertion_hold_state: assert property(@(posedge clk) hold_state);


    // Definition of your sequences
    // (not used in this example)

    // Definition of your properties and their assertion
    property p1; //if j = 1 && k = 0 then after 1 clock cycle q = 1 
        j &&
        !k 
    |-> 
        ##1 q
    ;endproperty

    property p2; //if k = 1 && j ==0 then after 1 clock cycle q = 0 
        k && 
        !j  
    |-> 
        ##1 !q
    ;endproperty
 
    property p3; //if j =1 && k = 1 then after 1 clock cycle q toggles to the opposite value 
        j &&
        k 
    |-> 
        ##1 q == ~$past(q)
    ;endproperty

    property p4; //if !j && !k then after 1 clock cycle q doesn't change its value 
        !j &&
        !k 
    |-> 
        ##1 q == $past(q)
    ;endproperty


   //assertion
    assert_property1: assert property(p1);
    assert_property2: assert property(p2);
    assert_property3: assert property(p3);
    assert_property4: assert property(p4);
    

endmodule

// Connect this verification module with the design
bind jkff fv_jkff fv_jkff_i(.*);
