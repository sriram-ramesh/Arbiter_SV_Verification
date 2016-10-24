//                              -*- Mode: Verilog -*-
// Filename        : testcase.sv
// Description     : testcase for arbiter
// Author          : vinchip
// Created On      : Thu Aug 27 15:14:23 2015
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
// Status          : Unknown, Use with caution!
/////////////////////////////////////////////////
`include "../Enviro/environment.sv"
//`include "../Enviro/driver.sv"

program testcase(arbiter ab);
   environment env=new(ab);

   initial begin
      env.drvr.reset();
      env.drvr.drive_one(10000);
      env.drvr.drive_reset(10000);
      env.drvr.drive_d(10000);
      
   end
endprogram // testcase

   
