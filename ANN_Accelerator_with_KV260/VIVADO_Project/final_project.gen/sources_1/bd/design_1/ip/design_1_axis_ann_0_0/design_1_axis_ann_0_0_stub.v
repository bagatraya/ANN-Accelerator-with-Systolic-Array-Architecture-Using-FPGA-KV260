// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Tue Dec 17 14:40:46 2024
// Host        : Tegar running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/mtfir/Downloads/final_project/final_project.gen/sources_1/bd/design_1/ip/design_1_axis_ann_0_0/design_1_axis_ann_0_0_stub.v
// Design      : design_1_axis_ann_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_ann,Vivado 2024.1" *)
module design_1_axis_ann_0_0(aclk, aresetn, s_axis_tready, s_axis_tdata, 
  s_axis_tvalid, s_axis_tlast, m_axis_tready, m_axis_tdata, m_axis_tvalid, m_axis_tlast)
/* synthesis syn_black_box black_box_pad_pin="aresetn,s_axis_tready,s_axis_tdata[127:0],s_axis_tvalid,s_axis_tlast,m_axis_tready,m_axis_tdata[127:0],m_axis_tvalid,m_axis_tlast" */
/* synthesis syn_force_seq_prim="aclk" */;
  input aclk /* synthesis syn_isclock = 1 */;
  input aresetn;
  output s_axis_tready;
  input [127:0]s_axis_tdata;
  input s_axis_tvalid;
  input s_axis_tlast;
  input m_axis_tready;
  output [127:0]m_axis_tdata;
  output m_axis_tvalid;
  output m_axis_tlast;
endmodule
