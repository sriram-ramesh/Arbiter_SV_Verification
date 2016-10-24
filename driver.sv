//                              -*- Mode: Verilog -*-
// Filename        : driver.sv
// Description     : driver for arbiter
// Author          : vinchip
// Created On      : Thu Aug 27 15:16:06 2015
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
// Status          : Unknown, Use with caution!
/////////////////////////////////////////////////
`include "../Enviro/stimulus.sv"
//`include "../Enviro/scoreboard.sv"


class driver;	
  stimulus sti;
  // scoreboard sb;
	
   virtual arbiter arb;

   function new(virtual arbiter arb/*, scoreboard sb*/);
      this.arb=arb;
      //this.sb=sb;

   endfunction // new

   task reset();

      arb.ga=0;
      arb.gb=0;
      arb.gc=0;
      arb.gd=0;

      @(negedge arb.clk)
	arb.reset=1;
      @(negedge arb.clk)
	arb.reset=0;
      @(negedge arb.clk)
	arb.reset=1;
   endtask // reset

   task drive_one(input integer iteration);
      

     repeat(iteration)
       begin
	  sti=new();
	  @(negedge arb.clk)
	    sti.constraint_mode(0);
	    sti.d_one.constraint_mode(1);
	    assert(sti.randomize());
	    if(sti.randomize())
	      begin
		 arb.ra=sti.ra;
		 arb.rb=sti.rb;
		 arb.rc=sti.rc;
		 arb.rd=sti.rd;
	      end

	  //sb.grant1=arb.ga;
	  //sb.grant2=arb.gb;
	  //sb.grant3=arb.gc;
	  //sb.grant4=arb.gd;
	  
       end // repeat (iteration)
   endtask // drive
   
   task drive_reset(input integer iteration);
      

     repeat(iteration)
       begin
	  sti=new();
	  @(negedge arb.clk)
	    sti.constraint_mode(0);
	    sti.d_reset.constraint_mode(1);
	    assert(sti.randomize());
	    if(sti.randomize())
	      begin
		 arb.ra=sti.ra;
		 arb.rb=sti.rb;
		 arb.rc=sti.rc;
		 arb.rd=sti.rd;
	      end

	  //sb.grant1=arb.ga;
	  //sb.grant2=arb.gb;
	  //sb.grant3=arb.gc;
	  //sb.grant4=arb.gd;
	  
       end // repeat (iteration)
   endtask // drive
   

      task drive_d(input integer iteration);
      

     repeat(iteration)
       begin
	  sti=new();
	  @(negedge arb.clk)
	    sti.constraint_mode(0);
	    sti.d.constraint_mode(1);
	    assert(sti.randomize());
	    if(sti.randomize())
	      begin
		 arb.ra=sti.ra;
		 arb.rb=sti.rb;
		 arb.rc=sti.rc;
		 arb.rd=sti.rd;
	      end

	  //sb.grant1=arb.ga;
	  //sb.grant2=arb.gb;
	  //sb.grant3=arb.gc;
	  //sb.grant4=arb.gd;
	  
       end // repeat (iteration)
       
       
   endtask // drive
   endclass // driver
