// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Block_proc (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        width_dout,
        width_empty_n,
        width_read,
        height_dout,
        height_empty_n,
        height_read,
        width_out_din,
        width_out_full_n,
        width_out_write,
        height_out_din,
        height_out_full_n,
        height_out_write,
        vconv_xlim_out_out_din,
        vconv_xlim_out_out_full_n,
        vconv_xlim_out_out_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [31:0] width_dout;
input   width_empty_n;
output   width_read;
input  [31:0] height_dout;
input   height_empty_n;
output   height_read;
output  [31:0] width_out_din;
input   width_out_full_n;
output   width_out_write;
output  [31:0] height_out_din;
input   height_out_full_n;
output   height_out_write;
output  [31:0] vconv_xlim_out_out_din;
input   vconv_xlim_out_out_full_n;
output   vconv_xlim_out_out_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg width_read;
reg height_read;
reg width_out_write;
reg height_out_write;
reg vconv_xlim_out_out_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    width_blk_n;
reg    height_blk_n;
reg    width_out_blk_n;
reg    height_out_blk_n;
reg    vconv_xlim_out_out_blk_n;
reg    ap_block_state1;
reg   [0:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((real_start == 1'b0) | (vconv_xlim_out_out_full_n == 1'b0) | (height_out_full_n == 1'b0) | (width_out_full_n == 1'b0) | (height_empty_n == 1'b0) | (width_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (vconv_xlim_out_out_full_n == 1'b0) | (height_out_full_n == 1'b0) | (width_out_full_n == 1'b0) | (height_empty_n == 1'b0) | (width_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        height_blk_n = height_empty_n;
    end else begin
        height_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        height_out_blk_n = height_out_full_n;
    end else begin
        height_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (vconv_xlim_out_out_full_n == 1'b0) | (height_out_full_n == 1'b0) | (width_out_full_n == 1'b0) | (height_empty_n == 1'b0) | (width_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        height_out_write = 1'b1;
    end else begin
        height_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (vconv_xlim_out_out_full_n == 1'b0) | (height_out_full_n == 1'b0) | (width_out_full_n == 1'b0) | (height_empty_n == 1'b0) | (width_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        height_read = 1'b1;
    end else begin
        height_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (vconv_xlim_out_out_full_n == 1'b0) | (height_out_full_n == 1'b0) | (width_out_full_n == 1'b0) | (height_empty_n == 1'b0) | (width_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_full_n == 1'b0) & (start_once_reg == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        vconv_xlim_out_out_blk_n = vconv_xlim_out_out_full_n;
    end else begin
        vconv_xlim_out_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (vconv_xlim_out_out_full_n == 1'b0) | (height_out_full_n == 1'b0) | (width_out_full_n == 1'b0) | (height_empty_n == 1'b0) | (width_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        vconv_xlim_out_out_write = 1'b1;
    end else begin
        vconv_xlim_out_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        width_blk_n = width_empty_n;
    end else begin
        width_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        width_out_blk_n = width_out_full_n;
    end else begin
        width_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (vconv_xlim_out_out_full_n == 1'b0) | (height_out_full_n == 1'b0) | (width_out_full_n == 1'b0) | (height_empty_n == 1'b0) | (width_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        width_out_write = 1'b1;
    end else begin
        width_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (vconv_xlim_out_out_full_n == 1'b0) | (height_out_full_n == 1'b0) | (width_out_full_n == 1'b0) | (height_empty_n == 1'b0) | (width_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        width_read = 1'b1;
    end else begin
        width_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (vconv_xlim_out_out_full_n == 1'b0) | (height_out_full_n == 1'b0) | (width_out_full_n == 1'b0) | (height_empty_n == 1'b0) | (width_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign height_out_din = height_dout;

assign start_out = real_start;

assign vconv_xlim_out_out_din = ($signed(width_dout) + $signed(32'd4294967286));

assign width_out_din = width_dout;

endmodule //Block_proc
