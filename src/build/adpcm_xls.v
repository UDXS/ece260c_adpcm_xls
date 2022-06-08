/* verilator lint_off WIDTH */
module adpcm_xls (
  input wire clk,
  input wire rst,
  input wire [15:0] in_sample,
  input wire in_sample_vld,
  input wire out_pred_rdy,
  output wire [15:0] out_pred,
  output wire out_pred_vld,
  output wire in_sample_rdy
);
  wire [15:0] literal_2537[89];
  assign literal_2537 = '{16'h0007, 16'h0008, 16'h0009, 16'h000a, 16'h000b, 16'h000c, 16'h000d, 16'h000e, 16'h0010, 16'h0011, 16'h0013, 16'h0015, 16'h0017, 16'h0019, 16'h001c, 16'h001f, 16'h0022, 16'h0025, 16'h0029, 16'h002d, 16'h0032, 16'h0037, 16'h003c, 16'h0042, 16'h0049, 16'h0050, 16'h0058, 16'h0061, 16'h006b, 16'h0076, 16'h0082, 16'h008f, 16'h009d, 16'h00ad, 16'h00be, 16'h00d1, 16'h00e6, 16'h00fd, 16'h0117, 16'h0133, 16'h0151, 16'h0173, 16'h0198, 16'h01c1, 16'h01ee, 16'h0220, 16'h0256, 16'h0292, 16'h02d4, 16'h031c, 16'h036c, 16'h03c3, 16'h0424, 16'h048e, 16'h0502, 16'h0583, 16'h0610, 16'h06ab, 16'h0756, 16'h0812, 16'h08e0, 16'h09c3, 16'h0abd, 16'h0bd0, 16'h0cff, 16'h0e4c, 16'h0fba, 16'h114c, 16'h1307, 16'h14ee, 16'h1706, 16'h1954, 16'h1bdc, 16'h1ea5, 16'h21b6, 16'h2515, 16'h28ca, 16'h2cdf, 16'h315b, 16'h364b, 16'h3bb9, 16'h41b2, 16'h4844, 16'h4f7e, 16'h5771, 16'h602f, 16'h69ce, 16'h7462, 16'h7fff};
  wire [7:0] literal_2605[16];
  assign literal_2605 = '{8'h81, 8'h81, 8'h81, 8'h81, 8'h02, 8'h04, 8'h06, 8'h08, 8'h81, 8'h81, 8'h81, 8'h81, 8'h02, 8'h04, 8'h06, 8'h08};
  reg [31:0] __st_1;
  reg [15:0] __st_2;
  reg [15:0] __st_0;
  reg [31:0] __st_3;
  reg [15:0] __in_sample_reg;
  reg __in_sample_valid_reg;
  reg [15:0] __out_pred_reg;
  reg __out_pred_valid_reg;
  wire [31:0] sub_2539;
  wire [15:0] array_index_2545;
  wire [15:0] array_index_2541;
  wire [31:0] sel_2549;
  wire [31:0] concat_2550;
  wire [1:0] concat_2552;
  wire sge_2554;
  wire [15:0] concat_2551;
  wire [31:0] sub_2557;
  wire [15:0] add_2555;
  wire [31:0] sel_2568;
  wire [31:0] concat_2569;
  wire [2:0] concat_2572;
  wire [15:0] concat_2574;
  wire sge_2575;
  wire [15:0] add_2578;
  wire [16:0] concat_2570;
  wire [31:0] sub_2579;
  wire [16:0] add_2576;
  wire [3:0] concat_2595;
  wire [16:0] concat_2597;
  wire sge_2599;
  wire [16:0] add_2602;
  wire [17:0] concat_2593;
  wire [17:0] add_2600;
  wire [17:0] concat_2613;
  wire [15:0] sign_ext_2617;
  wire [17:0] add_2618;
  wire [31:0] concat_2611;
  wire [15:0] add_2621;
  wire [31:0] add_2615;
  wire [31:0] sub_2616;
  wire [31:0] concat_2627;
  wire [15:0] add_2628;
  wire and_2682;
  wire out_pred_valid_inv;
  wire [31:0] sel_2619;
  wire [31:0] add_2632;
  wire [31:0] sub_2633;
  wire __out_pred_rdy_buf__1;
  wire out_pred_valid_load_en;
  wire [31:0] sel_2638;
  wire out_pred_load_en;
  wire [31:0] sel_2629;
  wire [15:0] and_2643;
  wire __out_pred_rdy_buf__2;
  wire [31:0] sel_2653;
  wire [15:0] and_2655;
  wire [31:0] sel_2642;
  wire pipeline_enable;
  wire in_sample_valid_inv;
  wire sle_2648;
  wire in_sample_valid_load_en;
  wire [15:0] sel_2672;
  wire [31:0] sel_2673;
  wire [15:0] sel_2675;
  wire [31:0] sel_2674;
  wire in_sample_load_en;
  wire [15:0] __out_pred_rdy_buf;
  assign sub_2539 = {{16{__in_sample_reg[15]}}, __in_sample_reg} - __st_1;
  assign array_index_2545 = literal_2537[__st_0 > 16'h0058 ? 16'h0058 : __st_0];
  assign array_index_2541 = literal_2537[__st_2 > 16'h0058 ? 16'h0058 : __st_2];
  assign sel_2549 = sub_2539[31] ? -sub_2539 : sub_2539;
  assign concat_2550 = {16'h0000, array_index_2545};
  assign concat_2552 = {sub_2539[31], 1'h0};
  assign sge_2554 = $signed(sel_2549) >= $signed(concat_2550);
  assign concat_2551 = {3'h0, array_index_2541[15:3]};
  assign sub_2557 = sel_2549 - concat_2550;
  assign add_2555 = concat_2551 + array_index_2541;
  assign sel_2568 = sge_2554 ? sub_2557 : sel_2549;
  assign concat_2569 = {17'h0_0000, array_index_2545[15:1]};
  assign concat_2572 = {sge_2554 ? concat_2552 | 2'h1 : concat_2552, 1'h0};
  assign concat_2574 = {3'h0, array_index_2545[15:3]};
  assign sge_2575 = $signed(sel_2568) >= $signed(concat_2569);
  assign add_2578 = concat_2574 + array_index_2545;
  assign concat_2570 = {1'h0, sge_2554 ? add_2555 : concat_2551};
  assign sub_2579 = sel_2568 - concat_2569;
  assign add_2576 = concat_2570 + {2'h0, array_index_2541[15:1]};
  assign concat_2595 = {sge_2575 ? concat_2572 | 3'h1 : concat_2572, 1'h0};
  assign concat_2597 = {1'h0, sge_2554 ? add_2578 : concat_2574};
  assign sge_2599 = $signed(sge_2575 ? sub_2579 : sel_2568) >= $signed({18'h0_0000, array_index_2545[15:2]});
  assign add_2602 = concat_2597 + {2'h0, array_index_2545[15:1]};
  assign concat_2593 = {1'h0, sge_2575 ? add_2576 : concat_2570};
  assign add_2600 = concat_2593 + {4'h0, array_index_2541[15:2]};
  assign concat_2613 = {1'h0, sge_2575 ? add_2602 : concat_2597};
  assign sign_ext_2617 = {{8{literal_2605[sge_2599 ? concat_2595 | 4'h1 : concat_2595][7]}}, literal_2605[sge_2599 ? concat_2595 | 4'h1 : concat_2595]};
  assign add_2618 = concat_2613 + {4'h0, array_index_2545[15:2]};
  assign concat_2611 = {14'h0000, sge_2599 ? add_2600 : concat_2593};
  assign add_2621 = __st_0 + sign_ext_2617;
  assign add_2615 = __st_3 + concat_2611;
  assign sub_2616 = __st_3 - concat_2611;
  assign concat_2627 = {14'h0000, sge_2599 ? add_2618 : concat_2613};
  assign add_2628 = __st_2 + sign_ext_2617;
  assign and_2682 = __in_sample_valid_reg;
  assign out_pred_valid_inv = ~__out_pred_valid_reg;
  assign sel_2619 = sub_2539[31] ? sub_2616 : add_2615;
  assign add_2632 = __st_1 + concat_2627;
  assign sub_2633 = __st_1 - concat_2627;
  assign __out_pred_rdy_buf__1 = and_2682;
  assign out_pred_valid_load_en = out_pred_rdy | out_pred_valid_inv;
  assign sel_2638 = sub_2539[31] ? sub_2633 : add_2632;
  assign out_pred_load_en = __out_pred_rdy_buf__1 & out_pred_valid_load_en;
  assign sel_2629 = $signed(sel_2619) > $signed(32'h0000_7fff) ? 32'h0000_7fff : sel_2619;
  assign and_2643 = add_2621 & {16{~add_2621[15]}};
  assign __out_pred_rdy_buf__2 = out_pred_load_en;
  assign sel_2653 = $signed(sel_2638) > $signed(32'h0000_7fff) ? 32'h0000_7fff : sel_2638;
  assign and_2655 = add_2628 & {16{~add_2628[15]}};
  assign sel_2642 = $signed(sel_2629) < $signed(32'hffff_8000) ? 32'hffff_8000 : sel_2629;
  assign pipeline_enable = __out_pred_rdy_buf__2 & and_2682;
  assign in_sample_valid_inv = ~__in_sample_valid_reg;
  assign sle_2648 = $signed(sel_2619) <= $signed(32'h0000_7fff);
  assign in_sample_valid_load_en = pipeline_enable | in_sample_valid_inv;
  assign sel_2672 = add_2621[15] | $signed({{16{and_2643[15]}}, and_2643}) <= $signed(32'h0000_0058) ? and_2643 : 16'h0058;
  assign sel_2673 = $signed(sel_2638) <= $signed(32'h0000_7fff) ? ($signed(sel_2653) < $signed(32'hffff_8000) ? 32'hffff_8000 : sel_2653) : sel_2653;
  assign sel_2675 = $signed({{16{and_2655[15]}}, and_2655}) > $signed(32'h0000_0058) ? 16'h0058 : and_2655;
  assign sel_2674 = sle_2648 ? sel_2642 : sel_2629;
  assign in_sample_load_en = in_sample_vld & in_sample_valid_load_en;
  assign __out_pred_rdy_buf = sle_2648 ? sel_2642[15:0] : sel_2629[15:0];
  always_ff @ (posedge clk) begin
    if (rst) begin
      __st_1 <= 32'h0000_0000;
      __st_2 <= 16'h0000;
      __st_0 <= 16'h0000;
      __st_3 <= 32'h0000_0000;
      __in_sample_reg <= 16'h0000;
      __in_sample_valid_reg <= 1'h0;
      __out_pred_reg <= 16'h0000;
      __out_pred_valid_reg <= 1'h0;
    end else begin
      __st_1 <= pipeline_enable ? sel_2673 : __st_1;
      __st_2 <= pipeline_enable ? sel_2675 : __st_2;
      __st_0 <= pipeline_enable ? sel_2672 : __st_0;
      __st_3 <= pipeline_enable ? sel_2674 : __st_3;
      __in_sample_reg <= in_sample_load_en ? in_sample : __in_sample_reg;
      __in_sample_valid_reg <= in_sample_valid_load_en ? in_sample_vld : __in_sample_valid_reg;
      __out_pred_reg <= out_pred_load_en ? __out_pred_rdy_buf : __out_pred_reg;
      __out_pred_valid_reg <= out_pred_valid_load_en ? __out_pred_rdy_buf__1 : __out_pred_valid_reg;
    end
  end
  assign out_pred = __out_pred_reg;
  assign out_pred_vld = __out_pred_valid_reg;
  assign in_sample_rdy = in_sample_load_en;
endmodule
