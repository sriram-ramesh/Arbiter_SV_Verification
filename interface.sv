//                              -*- Mode: Verilog -*-
// Filename        : interface.sv
// Description     : interface for arbiter
// Author          : vinchip
// Created On      : Mon Aug 24 17:33:08 2015
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
// Status          : Unknown, Use with caution!
//////////////////////////////////////////////////

interface arbiter(input bit clk);
   logic ra,rb,rc,rd,ga,gb,gc,gd;
   logic reset;
endinterface // arbiter
