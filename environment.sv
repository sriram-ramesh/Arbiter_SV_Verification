//                              -*- Mode: Verilog -*-
// Filename        : environment.sv
// Description     : env for arbiter
// Author          : vinchip
// Created On      : Mon Aug 24 17:45:22 2015
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
// Status          : Unknown, Use with caution!
/////////////////////////////////////////////////////
`include "../Enviro/driver.sv"
//`include "../Enviro/scoreboard.sv"
`include "../Enviro/monitor.sv"

class environment;
   
  driver drvr;
  // scoreboard sb;
   monitor mntr;
   virtual arbiter arb;

   function new(virtual arbiter arb);
      
     this.arb=arb;
    //  sb=new();
      drvr=new(arb/*,sb*/);
      mntr=new(arb/*,sb*/);
     /* fork
	 mntr.check();
      join_none
      */
   endfunction // new
endclass // environment
