//                              -*- Mode: Verilog -*-
// Filename        : monitor.sv
// Description     : monitor for arbiter
// Author          : vinchip
// Created On      : Mon Aug 24 17:35:33 2015
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
// Status          : Unknown, Use with caution!
//////////////////////////////////////////////////
//`include "../Enviro/scoreboard.sv"



class monitor;
   
 // scoreboard sb;
   virtual arbiter arb;
   function new(virtual arbiter arb/*, scoreboard sb*/);
      this.arb=arb;
      //this.sb=sb;
   endfunction // new

   /*task check();
      forever
	@(negedge arb.clk)
	if(sb.grant1!=arb.ga)
	  $display("Error Dut grant ga");
      
	else
	  $display("Dut granted for ga");

      	@(negedge arb.clk)
	if(sb.grant2!=arb.gb)
	  $display("Error Dut grant gb");
      
	else
	  $display("Dut granted for gb");

      	@(negedge arb.clk)
	if(sb.grant3!=arb.gc)
	  $display("Error Dut grant gc");
      
	else
	  $display("Dut granted for gc");

      	@(negedge arb.clk)
	if(sb.grant1!=arb.gd)
	  $display("Error Dut grant gd");
      
	else
	  $display("Dut granted for gd");

   endtask // check
*/
endclass // monitor
