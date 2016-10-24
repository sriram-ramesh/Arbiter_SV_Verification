//                              -*- Mode: Verilog -*-
// Filename        : stimulus.sv
// Description     : stimulus for arbiter
// Author          : vinchip
// Created On      : Mon Aug 24 17:28:19 2015
// Last Modified By: .
// Last Modified On: .
// Update Count    : 0
// Status          : Unknown, Use with caution!
////////////////////////////////////////////////////

class stimulus;
   rand bit ra,rb,rc,rd;
   constraint d{

ra dist {0:=1, 1:=1};
 rb dist {0:=1, 1:=1};
rc dist {0:=1, 1:=1};

rd dist {0:=1, 1:=1};
   }
   
   constraint d_reset{
  
  ra dist {0:=1, 1:=0};
  rb dist {0:=1, 1:=0};
  rc dist {0:=1, 1:=0};
  rd dist {0:=1, 1:=0};
}

constraint d_one{
  ra dist {0:=0, 1:=1};
  rb dist {0:=0, 1:=1};
  rc dist {0:=0, 1:=1};
  rd dist {0:=0, 1:=1};
}
  
endclass // stimulus
