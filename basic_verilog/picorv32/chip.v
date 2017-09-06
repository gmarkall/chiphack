module chip (
    // 100MHz clock input
    input  clk,
    // SRAM Memory lines
    output [18:0] ADR,
    output [15:0] DAT,
    output RAMOE,
    output RAMWE,
    output RAMCS,
    // All PMOD outputs
    output [55:0] PMOD,
    // Buttons
    input [1:0] BUT
  );

  // SRAM signals are not use in this design, lets set them to default values
  assign ADR[18:0] = {19{1'b0}};
  assign DAT[15:0] = {16{1'b0}};
  assign RAMOE = 1'b1;
  assign RAMWE = 1'b1;
  assign RAMCS = 1'b1;

  // Set unused pmod pins to default
  assign UART_TX = PMOD[11];
  assign PMOD[52:12] = {39{1'b0}};
  assign PMOD[10:00] = {11{1'b0}};

  // Slow the clock to 10mhz
  //reg slow_clk = 0;
  //always #10 slow_clk = ~slow_clk;

  // From testbench...

  reg resetn = 0;
  integer resetn_cnt = 0;
  wire trap;

  always @(posedge slow_clk) begin
    if (resetn_cnt < 10000000000)
      resetn_cnt <= resetn_cnt + 1;
    else
      resetn <= 1;
  end

  reg slow_clk = 0;
  integer clk_count = 0;


  always @(posedge clk) begin
    if (clk_count < 50)
      clk_count <= clk_count + 1;
    else begin
      clk_count <= 0;
      slow_clk <= ~slow_clk;
    end
  end

  wire mem_valid;
  wire mem_instr;
  wire mem_ready;
  wire [31:0] mem_addr;
  wire [31:0] mem_wdata;
  wire [3:0] mem_wstrb;
  wire [31:0] mem_rdata;

  reg [31:0] x32 = 314159265;
  reg [31:0] next_x32;

  always @(posedge slow_clk) begin
    if (resetn) begin
      next_x32 = x32;
      next_x32 = next_x32 ^ (next_x32 << 13);
      next_x32 = next_x32 ^ (next_x32 >> 17);
      next_x32 = next_x32 ^ (next_x32 << 5);
      x32 <= next_x32;
    end
  end

  picorv32 uut (
    .clk         (slow_clk   ),
    .resetn      (resetn     ),
    .trap        (trap       ),
    .mem_valid   (mem_valid  ),
    .mem_instr   (mem_instr  ),
    .mem_ready   (mem_ready  ),
    .mem_addr    (mem_addr   ),
    .mem_wdata   (mem_wdata  ),
    .mem_wstrb   (mem_wstrb  ),
    .mem_rdata   (mem_rdata  ),
    .led4         (PMOD[55]   ),
    .led3         (PMOD[54]   )
  );

  reg [7:0] memory [0:23];

  initial begin
    // li      s1,0
    memory[0] <=  'h93;
    memory[1] <=  'h04;
    memory[2] <=  'h00;
    memory[3] <=  'h00;

    // addi    s1,s1,1
    memory[4] <=  'h93;
    memory[5] <=  'h84;
    memory[6] <=  'h14;
    memory[7] <=  'h00;

    // bne     s1,a5,-4
    memory[8] <=  'he3;
    memory[9] <=  'h9e;
    memory[10] <= 'hf4;
    memory[11] <= 'hfe;

    // not     s0,s0
    memory[12] <= 'h13;
    memory[13] <= 'h44;
    memory[14] <= 'hf4;
    memory[15] <= 'hfe;

    // li      s1,0
    memory[16] <= 'h93;
    memory[17] <= 'h04;
    memory[18] <= 'h00;
    memory[19] <= 'h00;

    // j -16
    memory[20] <= 'h6f;
    memory[21] <= 'hf0;
    memory[22] <= 'h1f;
    memory[23] <= 'hff;
  end

  assign mem_ready = x32[0] && mem_valid;

  assign PMOD[53] = mem_ready;

  assign mem_rdata[ 7: 0] = memory[mem_addr + 0];
  assign mem_rdata[15: 8] = memory[mem_addr + 1];
  assign mem_rdata[23:16] = memory[mem_addr + 2];
  assign mem_rdata[31:24] = memory[mem_addr + 3];

  //always @(posedge clk) begin
  //  if (mem_valid && mem_ready) begin
  //      if (mem_wstrb[0]) memory[mem_addr + 0] <= mem_wdata[ 7: 0];
  //      if (mem_wstrb[1]) memory[mem_addr + 1] <= mem_wdata[15: 8];
  //      if (mem_wstrb[2]) memory[mem_addr + 2] <= mem_wdata[23:16];
  //      if (mem_wstrb[3]) memory[mem_addr + 3] <= mem_wdata[31:24];
  //  end
  //end

endmodule
