//                              -*- Mode: Verilog -*-
// Filename        : assertion.sv
// Description     : assertion for arbiter
// Author          : vinchip
// Created On      : Fri Aug 28 17:05:51 2015
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
// Status          : Unknown, Use with caution!
//////////////////////////////////////////////////////////////


module assertion(arbiter arb, input clk);
   wire assert_reset;
   assign assert_reset = top.dut.reset;
   
   property p1;
      @(posedge clk)
	$rose (arb.ga)
	  |-> (arb.ga) throughout (arb.ra);
   endproperty
   a1: assert property(p1)
     else
       begin
	  $display($time," Ga was not getting properly");
       end // UNMATCHED !!
      
      property p2;
      @(posedge clk)
	$rose (arb.gb)
	  |-> (arb.gb) throughout (arb.rb);
   endproperty
   a2: assert property(p2)
     else
       begin
	  $display($time," Gb was not getting properly");
       end // UNMATCHED !!
      
      property p3;
      @(posedge clk)
	$rose (arb.gc)
	  |-> (arb.gc) throughout (arb.rc);
   endproperty
   a3: assert property(p1)
     else
       begin
	  $display($time," Gc was not getting properly");
       end // UNMATCHED !!
       
      property p4;
      @(posedge clk)
	$rose (arb.gd)
	  |-> (arb.gd) throughout (arb.rd);
   endproperty
   a4: assert property(p4)
     else
       begin
	  $display($time," Gd was not getting properly");
       end // UNMATCHED !!
        
      property p5;
	 @(posedge clk)
	   $rose(arb.ga) |->
	     (arb.ra) throughout
	       arb.ga[*16];
      endproperty
      
      a5: assert property(p5)
	else
	  begin
	     $display($time," Ga was not getting 16 times properly");
	  end // UNMATCHED !!
	  
	  
	   property p6;
	 @(posedge clk)
	   $rose(arb.gb) |->
	     (arb.rb) throughout
	       arb.gb[*16];
      endproperty
      
      a6: assert property(p6)
	else
	  begin
	     $display($time," Gb was not getting 16 times properly");
	  end // UNMATCHED !!
	  
	   property p7;
	 @(posedge clk)
	   $rose(arb.gc) |->
	     (arb.rc) throughout
	       arb.gc[*16];
      endproperty
      
      a7: assert property(p7)
	else
	  begin
	     $display($time," Gc was not getting 16 times properly");
	  end // UNMATCHED !!
	  
	   property p8;
	 @(posedge clk)
	   $rose(arb.gd) |->
	     (arb.rd) throughout
	       arb.gd[*16];
      endproperty
      
      a8: assert property(p8)
	else
	  begin
	     $display($time," Gd was not getting 16 times properly");
	  end // UNMATCHED !!
	  
	 
	 property p9;
	    @(posedge clk)
	      $fell(assert_reset)
		|-> ((arb.ga||arb.gb||arb.gc||arb.gd)!=1'b1);
	    
	 endproperty
	 
	 
	 a9: assert property(p9)
	   else
	     begin
		$display($time, "reset was not getting properly");
	     end // UNMATCHED !!

	    cover property(p1);
	    cover property(p2);
	    cover property(p3);
	    cover property(p4);
	    cover property(p5);
	    cover property(p6);
	    cover property(p7);
	    cover property(p8);
	    cover property(p9);
	    
	    endmodule // assertion
