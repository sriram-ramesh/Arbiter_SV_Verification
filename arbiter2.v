
//                              -*- Mode: Verilog -*-
// Filename        : arbiter2.v
// Description     : arbiter new
// Author          : Sriram
// Created On      : Fri Jul 10 02:27:53 2015
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
// Status          : Unknown, Use with caution!
///////////////////////////////////////////////////////////


module arbiter2(//***********************
	       //input port declarations
	       //***********************
	       ra,
	       rb,
	       rc,
	       rd,
	       clk,
	       reset,
	       //************************
	       //output port declarations
	       //************************
	       ga,
	       gb,
	       gc,
	       gd);

   //*******************
   //input declarations
   //*******************
   input ra;
   input rb;
   input rc;
   input rd;
   input clk;
   input reset;

   //*******************
   //output declarations
   //*******************
   output ga;
   output gb;
   output gc;
   output gd;

   //*********************
   //parameter declartions
   //*********************
   parameter i=3'b000;
   parameter s0=3'b001;
   parameter s1=3'b010;
   parameter s2=3'b011;
   parameter s3=3'b100;

   //**********************
   //register declarations
   //**********************
   reg [2:0] ns;
   reg [2:0] ps;
   reg [4:0] cnta;
   reg [4:0] cntb;
   reg [4:0] cntc;
   reg [4:0] cntd; 
   reg ga;
   reg gb;
   reg gc;
   reg gd;


   always @(ps or ns or ra or rb or rc or rd or cnta or cntb or cntc or cntd)
     begin
	case (ps)
	  i: begin
	     if(~reset)
	       ns=i;
	     
	     else if(ra==1'b1)
	       ns=s0;
	     else if(rb==1'b1)
	       ns=s1;
	     else if(rc==1'b1)
	       ns=s2;
	     else if(rd==1'b1)
	       ns=s3;
	     else
	       ns=s0;
	  end // case: i
	  
       
       s0: begin

	  
	  if((ra==1'b1)&&(cnta!=16))
	    begin
	       
	       ns=s0;
	    end
	  else
	    begin
	       ga=1'b0;
	       if(rb==1'b1)
		 ns=s1;
	       else if(rc==1'b1)
		 ns=s2;
	       else if(rd==1'b1)
		 ns=s3;
	       else /*if({ra,rb,rc,rd}==4'b0)*/
		 ns=s1;
	      // else
		 //ns=ns;
	    end // else: !if((ra==1'b1)&&(cnta<5'b10001))
       end // case: s0
	         
 
       s1: begin
	  
	  if((rb==1'b1)&&(cntb!=16))
	      begin
		 ns=s1;
		
	      end
	  else
	    begin
	       gb=1'b0;
	       if(rc==1'b1)
		 ns=s2;
	       else if(rd==1'b1)
		 ns=s3;
		  else if(ra==1'b1)
		 ns=s0;  
	       else /*if({ra,rb,rc,rd}==4'b0)*/
		 ns=s2;
	         
	       //else
		 //ns=i;      
	    end // else: !if((rb==1'b1)&&(cntb<16))
       end // case: s1
       
       
       s2: 
	 begin
	    
	    if((rc==1'b1)&&(cntc!=16))
	      begin
		 
	      	 ns=s2;
	      end     
	    else
	      begin
		
		 
		 if(rd==1)
		   ns=s3;
		 else if(ra==1)
		   ns=s0;
		 else if(rb==1)
		 ns=s1;
		 else /*if({ra,rb,rc,rd}==4'b0)*/
		   ns=s3;
		 //else
		   //ns=i;
		 
	      end // if (cntc==5'b01111)
	    
	 end // case: s2	
       
       
       s3: begin
	  
	  if((rd==1'b1)&&(cntd!=16))
	    begin	       
	       ns=s3;	    
	    end
	  else if(ra==1'b1)
	    ns=s0;
	  else if(rb==1'b1)
	    ns=s1;
	  else if(rc==1'b1)
	    ns=s2;
	  else
	    ns=i;
        
       end // case: s3
       default: begin
	  //ga=ga;
	  //gb=gb;
	  //gc=gc;
	  //gd=gd;
       end  
     endcase // case (ps)
   
     end // always @ (ra or rb or rc or rd or ps or ns or cnt

       always @(ps or ns or ra or rb or rc or rd)
	 begin
	    if({ra,rb,rc,rd}==4'b0)
	      begin
		 ga=1'b0;
		 gb=1'b0;
		 gc=1'b0;
		 gd=1'b0;
	      end
	    else
	      begin
		 
		 if((ns==s0)&&(cnta<16))
		   begin
		      ga=1'b1;
		      gb=1'b0;
		      gc=1'b0;
		      gd=1'b0;
		   end
		 else if((ns==s1)&&(cntb<16))
		   begin
		      gb=1'b1;
		      ga=1'b0;
		      gc=1'b0;
		      gd=1'b0;
		      
		   end
		 
		 else if((ns==s2)&&(cntc<16))
		   begin
		      gc=1'b1;
		      ga=1'b0;
		      gb=1'b0;
		      gd=1'b0;
		      
		   end
		 else if((ns==s3)&&(cntd<16))
		   begin
		      gd=1'b1;
		      ga=1'b0;
		      gb=1'b0;
		      gc=1'b0;
		   end
		 else
		   begin
		      gd=1'b0;
		      ga=1'b0;
		      gb=1'b0;
		      gc=1'b0;
		   end
	      end // else: !if({ra,rb,rc,rd}==4'b0)
	    
	    
     end // always @ (ps or ns or ra or rb or rc or rd)
   

		     
    always @(posedge clk or negedge reset)
     
     begin	
	if(~reset)
	  begin
	     ga<=1'b0;
	     gb<=1'b0;
	     gc<=1'b0;
	     gd<=1'b0;
	     cnta<=4'b0;
	     cntb<=4'b0;
	     cntc<=4'b0;
	     cntd<=4'b0;
	     ps<=i;
	     
	  end // if (~reset)	
	else
	  begin
	     ps<=ns;
	     
	     if((ra==1'b1)&&(cnta<16)&&(gb!=1'b1)&&(gc!=1'b1)&&(gd!=1'b1))
	       begin
		  cnta<=cnta+1'b1;
		  cntb=1'b0;
		  cntc<=1'b0;
		  cntd<=1'b0;
	       end
	     else
	       cnta<=5'b0;
	     
	     
	     if((rb==1'b1)&&(cntb<16)&&(ga!=1'b1)&&(gc!=1'b1)&&(gd!=1'b1))
	       begin
		  cntb<=cntb+1'b1;
		   cnta<=1'b0;
		  cntb=1'b0;
		  
		  cntd<=1'b0;
	       end
	     else
	       cntb<=5'b0;
	     
	     if((rc==1'b1)&&(cntc<16)&&(gb!=1'b1)&&(ga!=1'b1)&&(gd!=1'b1))
	       begin
		  cntc<=cntc+1'b1;
		  cnta<=1'b0;
		  cntb<=1'b0;
		  cntd<=1'b0;
	       end
	     else
	       cntc<=5'b0;
	     
	     if((rd==1'b1)&&(cntd<16)&&(gb!=1'b1)&&(gc!=1'b1)&&(ga!=1'b1))
	       begin
		  cntd<=cntd+1'b1;
		  cnta<=1'b0;
		  cntb<=1'b0;
		  cntc<=1'b0;
	       end
	     else
	       cntd<=5'b0;
	     
	  end // else: !if(~reset)
     end // always @ (posedge clk or negedge reset)
   
endmodule // arbiter



