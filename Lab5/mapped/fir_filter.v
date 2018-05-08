/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 13 13:34:51 2018
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   N3, N4;
  assign N3 = async_in;

  DFFSR Q_reg ( .D(N3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N4) );
  DFFSR sync_out_reg ( .D(N4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   N3, N4;
  assign N3 = async_in;

  DFFSR Q_reg ( .D(N3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N4) );
  DFFSR sync_out_reg ( .D(N4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n153, n154, n155, next_mod, n7, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n32, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149;
  wire   [4:0] current_state;
  wire   [4:0] next_state;

  DFFSR \current_state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(current_state[0]) );
  DFFSR \current_state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(current_state[1]) );
  DFFSR \current_state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(current_state[4]) );
  DFFSR \current_state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(current_state[2]) );
  DFFSR \current_state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(current_state[3]) );
  DFFSR current_mod_reg ( .D(next_mod), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        modwait) );
  AND2X1 U9 ( .A(n19), .B(n25), .Y(n23) );
  INVX4 U10 ( .A(current_state[4]), .Y(n19) );
  INVX2 U11 ( .A(n155), .Y(n7) );
  INVX4 U12 ( .A(n7), .Y(src2[0]) );
  INVX2 U13 ( .A(n88), .Y(n22) );
  BUFX2 U14 ( .A(current_state[3]), .Y(n36) );
  INVX2 U15 ( .A(n79), .Y(n18) );
  NOR2X1 U16 ( .A(n97), .B(n22), .Y(n9) );
  AND2X2 U17 ( .A(n81), .B(n82), .Y(n10) );
  INVX2 U18 ( .A(n30), .Y(src2[2]) );
  BUFX2 U19 ( .A(n28), .Y(n11) );
  INVX1 U20 ( .A(n34), .Y(n51) );
  BUFX2 U21 ( .A(n118), .Y(n12) );
  INVX1 U22 ( .A(current_state[1]), .Y(n118) );
  INVX1 U23 ( .A(n135), .Y(n13) );
  INVX2 U24 ( .A(n13), .Y(n14) );
  INVX1 U25 ( .A(n23), .Y(n17) );
  INVX2 U26 ( .A(n12), .Y(n15) );
  NOR3X1 U27 ( .A(n44), .B(n154), .C(src1[3]), .Y(n16) );
  INVX2 U28 ( .A(n16), .Y(src2[1]) );
  INVX1 U29 ( .A(n44), .Y(n119) );
  INVX1 U30 ( .A(src2[2]), .Y(n80) );
  OR2X2 U31 ( .A(n63), .B(n17), .Y(n116) );
  INVX1 U32 ( .A(n63), .Y(n87) );
  NAND2X1 U33 ( .A(n9), .B(n18), .Y(next_state[2]) );
  NAND2X1 U34 ( .A(n28), .B(n125), .Y(n90) );
  NAND2X1 U35 ( .A(n9), .B(n10), .Y(next_state[3]) );
  AND2X2 U36 ( .A(n40), .B(n34), .Y(n42) );
  INVX2 U37 ( .A(n40), .Y(n121) );
  INVX1 U38 ( .A(n19), .Y(n20) );
  NOR2X1 U39 ( .A(n39), .B(n34), .Y(n21) );
  INVX1 U40 ( .A(n39), .Y(n65) );
  BUFX2 U41 ( .A(current_state[1]), .Y(n25) );
  AND2X2 U42 ( .A(n40), .B(n39), .Y(n26) );
  AND2X2 U43 ( .A(n21), .B(n29), .Y(n46) );
  INVX1 U44 ( .A(n40), .Y(n24) );
  AND2X2 U45 ( .A(n35), .B(n29), .Y(n27) );
  AND2X2 U46 ( .A(n26), .B(n51), .Y(n28) );
  AND2X2 U47 ( .A(n25), .B(n19), .Y(n29) );
  BUFX4 U48 ( .A(current_state[2]), .Y(n39) );
  INVX2 U49 ( .A(n154), .Y(n30) );
  INVX1 U50 ( .A(n90), .Y(n134) );
  INVX2 U51 ( .A(n153), .Y(n32) );
  INVX4 U52 ( .A(n32), .Y(src1[2]) );
  INVX1 U53 ( .A(overflow), .Y(n86) );
  BUFX2 U54 ( .A(current_state[3]), .Y(n34) );
  BUFX2 U55 ( .A(current_state[3]), .Y(n35) );
  INVX1 U56 ( .A(src2[1]), .Y(n45) );
  BUFX2 U57 ( .A(n46), .Y(n37) );
  BUFX2 U58 ( .A(n51), .Y(n38) );
  BUFX4 U59 ( .A(current_state[0]), .Y(n40) );
  INVX1 U60 ( .A(src1[2]), .Y(n71) );
  INVX1 U61 ( .A(src1[1]), .Y(n70) );
  NOR2X1 U62 ( .A(n39), .B(n118), .Y(n41) );
  NAND3X1 U63 ( .A(n42), .B(n19), .C(n41), .Y(n83) );
  NAND3X1 U64 ( .A(n36), .B(n19), .C(n118), .Y(n43) );
  INVX2 U65 ( .A(n43), .Y(n66) );
  NAND2X1 U66 ( .A(n26), .B(n66), .Y(n64) );
  NAND2X1 U67 ( .A(n83), .B(n64), .Y(n154) );
  NAND2X1 U68 ( .A(n66), .B(n24), .Y(n75) );
  NAND2X1 U69 ( .A(n27), .B(n121), .Y(n133) );
  NAND2X1 U70 ( .A(n75), .B(n133), .Y(n44) );
  NAND3X1 U71 ( .A(n66), .B(n40), .C(n65), .Y(n129) );
  NAND2X1 U72 ( .A(n37), .B(n24), .Y(n132) );
  NAND2X1 U73 ( .A(n28), .B(n23), .Y(n120) );
  NAND3X1 U74 ( .A(n132), .B(n45), .C(n120), .Y(op[2]) );
  NAND2X1 U75 ( .A(n46), .B(n40), .Y(n61) );
  NAND3X1 U76 ( .A(n20), .B(n38), .C(n65), .Y(n117) );
  INVX2 U77 ( .A(n117), .Y(n57) );
  NAND2X1 U78 ( .A(n40), .B(n15), .Y(n56) );
  INVX2 U79 ( .A(n56), .Y(n145) );
  NAND2X1 U80 ( .A(n57), .B(n145), .Y(n130) );
  NAND2X1 U81 ( .A(n57), .B(n12), .Y(n115) );
  NOR2X1 U82 ( .A(n15), .B(n39), .Y(n47) );
  NAND3X1 U83 ( .A(n38), .B(n19), .C(n47), .Y(n52) );
  INVX2 U84 ( .A(n52), .Y(n48) );
  NAND2X1 U85 ( .A(n48), .B(n40), .Y(n140) );
  OAI21X1 U86 ( .A(n24), .B(n115), .C(n140), .Y(n49) );
  NOR2X1 U87 ( .A(n134), .B(n49), .Y(n50) );
  NAND3X1 U88 ( .A(n61), .B(n130), .C(n50), .Y(dest[0]) );
  NAND3X1 U89 ( .A(n20), .B(n11), .C(n12), .Y(n98) );
  NAND3X1 U90 ( .A(n39), .B(n51), .C(n121), .Y(n63) );
  NAND2X1 U91 ( .A(n20), .B(n87), .Y(n100) );
  NAND2X1 U92 ( .A(n98), .B(n100), .Y(n69) );
  INVX2 U93 ( .A(n69), .Y(n60) );
  NAND3X1 U94 ( .A(n87), .B(n19), .C(n12), .Y(n114) );
  NAND2X1 U95 ( .A(n114), .B(n116), .Y(n136) );
  NAND2X1 U96 ( .A(n27), .B(n26), .Y(n78) );
  OAI21X1 U97 ( .A(n40), .B(n52), .C(n78), .Y(n102) );
  NOR2X1 U98 ( .A(n136), .B(n102), .Y(n55) );
  INVX2 U99 ( .A(op[2]), .Y(n54) );
  NOR2X1 U100 ( .A(dest[0]), .B(n69), .Y(n53) );
  NAND3X1 U101 ( .A(n55), .B(n54), .C(n53), .Y(n67) );
  INVX2 U102 ( .A(lc), .Y(n85) );
  NOR2X1 U103 ( .A(dr), .B(n85), .Y(n58) );
  NAND2X1 U104 ( .A(n57), .B(n56), .Y(n131) );
  INVX2 U105 ( .A(n131), .Y(n68) );
  AOI21X1 U106 ( .A(n58), .B(n102), .C(n68), .Y(n59) );
  NAND3X1 U107 ( .A(n60), .B(n67), .C(n59), .Y(next_state[4]) );
  NAND2X1 U108 ( .A(n19), .B(n118), .Y(n123) );
  INVX2 U109 ( .A(n83), .Y(n124) );
  INVX2 U110 ( .A(n61), .Y(n135) );
  NOR2X1 U111 ( .A(n124), .B(n135), .Y(n62) );
  OAI21X1 U112 ( .A(n63), .B(n123), .C(n62), .Y(src1[1]) );
  NAND3X1 U113 ( .A(n116), .B(n64), .C(n90), .Y(n153) );
  NAND3X1 U114 ( .A(n66), .B(n65), .C(n24), .Y(n84) );
  NAND2X1 U115 ( .A(n133), .B(n84), .Y(n96) );
  INVX2 U116 ( .A(n96), .Y(n82) );
  INVX2 U117 ( .A(n67), .Y(n103) );
  AOI21X1 U118 ( .A(n69), .B(n85), .C(n68), .Y(n72) );
  NAND3X1 U119 ( .A(n72), .B(n71), .C(n70), .Y(n73) );
  AOI21X1 U120 ( .A(n103), .B(n39), .C(n73), .Y(n74) );
  OAI21X1 U121 ( .A(n82), .B(n86), .C(n74), .Y(n79) );
  NAND2X1 U122 ( .A(n27), .B(n39), .Y(n77) );
  INVX2 U123 ( .A(n75), .Y(n144) );
  INVX2 U124 ( .A(n140), .Y(n143) );
  INVX2 U125 ( .A(dr), .Y(n105) );
  AOI22X1 U126 ( .A(overflow), .B(n144), .C(n143), .D(n105), .Y(n76) );
  OAI21X1 U127 ( .A(n40), .B(n77), .C(n76), .Y(n97) );
  INVX2 U128 ( .A(n78), .Y(err) );
  NAND3X1 U129 ( .A(err), .B(n105), .C(n85), .Y(n88) );
  NAND3X1 U130 ( .A(n129), .B(n80), .C(n120), .Y(n146) );
  AOI21X1 U131 ( .A(n103), .B(n35), .C(n146), .Y(n81) );
  NAND2X1 U132 ( .A(n83), .B(n120), .Y(n155) );
  AND2X2 U133 ( .A(n84), .B(n140), .Y(n95) );
  OAI22X1 U134 ( .A(n119), .B(n86), .C(n98), .D(n85), .Y(n92) );
  OAI21X1 U135 ( .A(n87), .B(n103), .C(n15), .Y(n89) );
  NAND3X1 U136 ( .A(n90), .B(n89), .C(n88), .Y(n91) );
  NOR2X1 U137 ( .A(n92), .B(n91), .Y(n94) );
  INVX2 U138 ( .A(n132), .Y(cnt_up) );
  NOR2X1 U139 ( .A(src2[0]), .B(cnt_up), .Y(n93) );
  NAND3X1 U140 ( .A(n95), .B(n94), .C(n93), .Y(next_state[1]) );
  NOR2X1 U141 ( .A(n136), .B(n96), .Y(n111) );
  NOR2X1 U142 ( .A(cnt_up), .B(n97), .Y(n110) );
  INVX2 U143 ( .A(n98), .Y(n99) );
  NOR2X1 U144 ( .A(err), .B(n99), .Y(n101) );
  MUX2X1 U145 ( .B(n101), .A(n100), .S(lc), .Y(n108) );
  INVX2 U146 ( .A(n102), .Y(n106) );
  INVX2 U147 ( .A(n115), .Y(n112) );
  OAI21X1 U148 ( .A(n112), .B(n103), .C(n40), .Y(n104) );
  OAI21X1 U149 ( .A(n106), .B(n105), .C(n104), .Y(n107) );
  NOR2X1 U150 ( .A(n108), .B(n107), .Y(n109) );
  NAND3X1 U151 ( .A(n111), .B(n110), .C(n109), .Y(next_state[0]) );
  INVX2 U152 ( .A(n146), .Y(n142) );
  NOR2X1 U153 ( .A(n134), .B(n112), .Y(n113) );
  NAND3X1 U154 ( .A(n142), .B(n114), .C(n113), .Y(dest[1]) );
  NAND3X1 U155 ( .A(n140), .B(n116), .C(n115), .Y(dest[2]) );
  OAI21X1 U156 ( .A(n12), .B(n117), .C(n142), .Y(dest[3]) );
  NAND2X1 U157 ( .A(n120), .B(n119), .Y(src2[3]) );
  NAND2X1 U158 ( .A(n39), .B(n23), .Y(n128) );
  NAND2X1 U159 ( .A(n39), .B(n121), .Y(n122) );
  NOR2X1 U160 ( .A(n35), .B(n122), .Y(n126) );
  INVX2 U161 ( .A(n123), .Y(n125) );
  AOI21X1 U162 ( .A(n126), .B(n125), .C(n124), .Y(n127) );
  OAI21X1 U163 ( .A(n36), .B(n128), .C(n127), .Y(src1[0]) );
  INVX2 U164 ( .A(n129), .Y(src1[3]) );
  NAND2X1 U165 ( .A(n131), .B(n130), .Y(clear) );
  AND2X2 U166 ( .A(n133), .B(n132), .Y(n139) );
  NOR2X1 U167 ( .A(n14), .B(n134), .Y(n138) );
  NOR2X1 U168 ( .A(clear), .B(n136), .Y(n137) );
  NAND3X1 U169 ( .A(n139), .B(n138), .C(n137), .Y(op[0]) );
  INVX2 U170 ( .A(clear), .Y(n141) );
  NAND3X1 U171 ( .A(n142), .B(n141), .C(n140), .Y(op[1]) );
  NOR2X1 U172 ( .A(n144), .B(n143), .Y(n149) );
  OAI21X1 U173 ( .A(n36), .B(n145), .C(n20), .Y(n148) );
  NOR2X1 U174 ( .A(op[0]), .B(n146), .Y(n147) );
  NAND3X1 U175 ( .A(n149), .B(n148), .C(n147), .Y(next_mod) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n2), .B(n3), .C(n1), .Y(w_en) );
  NOR2X1 U7 ( .A(n1), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n1), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[0]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34,
         n35, n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n75, n77, n79, n81, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n103, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181;

  XOR2X1 U4 ( .A(n20), .B(n1), .Y(DIFF[14]) );
  OAI21X1 U5 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U6 ( .A(n19), .B(n73), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(n88), .Y(n18) );
  NAND2X1 U9 ( .A(A[14]), .B(n88), .Y(n19) );
  XNOR2X1 U10 ( .A(n25), .B(n2), .Y(DIFF[13]) );
  AOI21X1 U11 ( .A(n179), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U14 ( .A(n24), .B(n179), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(n89), .Y(n24) );
  XOR2X1 U18 ( .A(n28), .B(n3), .Y(DIFF[12]) );
  OAI21X1 U19 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U20 ( .A(n27), .B(n75), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(n90), .Y(n26) );
  NAND2X1 U23 ( .A(A[12]), .B(n90), .Y(n27) );
  XNOR2X1 U24 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  AOI21X1 U25 ( .A(n180), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U28 ( .A(n32), .B(n180), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(n91), .Y(n32) );
  XOR2X1 U32 ( .A(n36), .B(n5), .Y(DIFF[10]) );
  OAI21X1 U33 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U34 ( .A(n35), .B(n77), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(n92), .Y(n34) );
  NAND2X1 U37 ( .A(A[10]), .B(n92), .Y(n35) );
  XNOR2X1 U38 ( .A(n170), .B(n6), .Y(DIFF[9]) );
  AOI21X1 U39 ( .A(n178), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U42 ( .A(n40), .B(n178), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(n93), .Y(n40) );
  XOR2X1 U46 ( .A(n44), .B(n7), .Y(DIFF[8]) );
  OAI21X1 U47 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U48 ( .A(n43), .B(n79), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(n94), .Y(n42) );
  NAND2X1 U51 ( .A(A[8]), .B(n94), .Y(n43) );
  XNOR2X1 U52 ( .A(n163), .B(n8), .Y(DIFF[7]) );
  AOI21X1 U53 ( .A(n177), .B(n49), .C(n46), .Y(n44) );
  NAND2X1 U56 ( .A(n48), .B(n177), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(n95), .Y(n48) );
  XOR2X1 U60 ( .A(n52), .B(n9), .Y(DIFF[6]) );
  OAI21X1 U61 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U62 ( .A(n51), .B(n81), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(n96), .Y(n50) );
  NAND2X1 U65 ( .A(A[6]), .B(n96), .Y(n51) );
  XNOR2X1 U66 ( .A(n164), .B(n10), .Y(DIFF[5]) );
  AOI21X1 U67 ( .A(n176), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U70 ( .A(n56), .B(n176), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(n97), .Y(n56) );
  XOR2X1 U74 ( .A(n60), .B(n11), .Y(DIFF[4]) );
  OAI21X1 U75 ( .A(n60), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U76 ( .A(n59), .B(n83), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(n98), .Y(n58) );
  NAND2X1 U79 ( .A(A[4]), .B(n98), .Y(n59) );
  XNOR2X1 U80 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U81 ( .A(n69), .B(n61), .C(n62), .Y(n60) );
  NOR2X1 U82 ( .A(n66), .B(n63), .Y(n61) );
  OAI21X1 U83 ( .A(n63), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U84 ( .A(n64), .B(n84), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(n99), .Y(n63) );
  NAND2X1 U87 ( .A(A[3]), .B(n99), .Y(n64) );
  XOR2X1 U88 ( .A(n68), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n67), .Y(n65) );
  NAND2X1 U90 ( .A(n67), .B(n85), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(n100), .Y(n66) );
  NAND2X1 U93 ( .A(A[2]), .B(n100), .Y(n67) );
  XOR2X1 U94 ( .A(n14), .B(n175), .Y(DIFF[1]) );
  OAI21X1 U96 ( .A(n70), .B(n72), .C(n71), .Y(n69) );
  NAND2X1 U97 ( .A(n71), .B(n86), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(n101), .Y(n70) );
  NAND2X1 U100 ( .A(A[1]), .B(n101), .Y(n71) );
  XNOR2X1 U101 ( .A(n181), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U102 ( .A(A[0]), .B(n181), .Y(n72) );
  INVX1 U123 ( .A(n69), .Y(n68) );
  INVX1 U124 ( .A(B[8]), .Y(n94) );
  INVX1 U125 ( .A(B[3]), .Y(n99) );
  INVX1 U126 ( .A(B[11]), .Y(n91) );
  INVX1 U127 ( .A(B[4]), .Y(n98) );
  INVX1 U128 ( .A(B[2]), .Y(n100) );
  INVX1 U129 ( .A(B[5]), .Y(n97) );
  INVX1 U130 ( .A(n49), .Y(n162) );
  INVX2 U131 ( .A(n162), .Y(n163) );
  BUFX2 U132 ( .A(n57), .Y(n164) );
  XOR2X1 U133 ( .A(n87), .B(A[15]), .Y(n165) );
  XOR2X1 U134 ( .A(n17), .B(n165), .Y(DIFF[15]) );
  NAND2X1 U135 ( .A(n17), .B(n87), .Y(n166) );
  NAND2X1 U136 ( .A(n17), .B(A[15]), .Y(n167) );
  NAND2X1 U137 ( .A(n87), .B(A[15]), .Y(n168) );
  NAND3X1 U138 ( .A(n167), .B(n166), .C(n168), .Y(n16) );
  INVX1 U139 ( .A(B[15]), .Y(n87) );
  INVX1 U140 ( .A(B[12]), .Y(n90) );
  INVX1 U141 ( .A(B[13]), .Y(n89) );
  INVX1 U142 ( .A(n63), .Y(n84) );
  INVX1 U143 ( .A(B[14]), .Y(n88) );
  INVX1 U144 ( .A(B[6]), .Y(n96) );
  INVX1 U145 ( .A(B[7]), .Y(n95) );
  INVX1 U146 ( .A(n41), .Y(n169) );
  INVX2 U147 ( .A(n169), .Y(n170) );
  XOR2X1 U148 ( .A(B[16]), .B(n103), .Y(n171) );
  XOR2X1 U149 ( .A(n16), .B(n171), .Y(DIFF[16]) );
  NAND2X1 U150 ( .A(n16), .B(B[16]), .Y(n172) );
  NAND2X1 U151 ( .A(n16), .B(n103), .Y(n173) );
  NAND2X1 U152 ( .A(B[16]), .B(n103), .Y(n174) );
  NAND3X1 U153 ( .A(n173), .B(n172), .C(n174), .Y(n15) );
  BUFX2 U154 ( .A(n72), .Y(n175) );
  INVX2 U155 ( .A(B[0]), .Y(n181) );
  OR2X2 U156 ( .A(A[5]), .B(n97), .Y(n176) );
  OR2X2 U157 ( .A(A[7]), .B(n95), .Y(n177) );
  OR2X2 U158 ( .A(A[9]), .B(n93), .Y(n178) );
  OR2X2 U159 ( .A(A[11]), .B(n91), .Y(n180) );
  OR2X2 U160 ( .A(A[13]), .B(n89), .Y(n179) );
  INVX1 U161 ( .A(B[1]), .Y(n101) );
  INVX2 U162 ( .A(B[9]), .Y(n93) );
  INVX2 U163 ( .A(B[10]), .Y(n92) );
  INVX2 U164 ( .A(n70), .Y(n86) );
  INVX2 U165 ( .A(n66), .Y(n85) );
  INVX2 U166 ( .A(n58), .Y(n83) );
  INVX2 U167 ( .A(n50), .Y(n81) );
  INVX2 U168 ( .A(n42), .Y(n79) );
  INVX2 U169 ( .A(n34), .Y(n77) );
  INVX2 U170 ( .A(n26), .Y(n75) );
  INVX2 U171 ( .A(n18), .Y(n73) );
  INVX2 U172 ( .A(n56), .Y(n54) );
  INVX2 U173 ( .A(n48), .Y(n46) );
  INVX2 U174 ( .A(n40), .Y(n38) );
  INVX2 U175 ( .A(n32), .Y(n30) );
  INVX2 U176 ( .A(n24), .Y(n22) );
  INVX2 U177 ( .A(A[17]), .Y(n103) );
  INVX2 U178 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n58, n60, n62, n63, n64, n65, n66, n68, n70, n71, n72, n73,
         n75, n76, n78, n80, n82, n84, n86, n88, n90, n92, n93, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175;

  XNOR2X1 U5 ( .A(n162), .B(n1), .Y(SUM[14]) );
  AOI21X1 U6 ( .A(n174), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n174), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(B[14]), .Y(n22) );
  XOR2X1 U13 ( .A(n26), .B(n2), .Y(SUM[13]) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n78), .Y(n2) );
  NOR2X1 U17 ( .A(B[13]), .B(A[13]), .Y(n24) );
  NAND2X1 U18 ( .A(B[13]), .B(A[13]), .Y(n25) );
  XNOR2X1 U19 ( .A(n31), .B(n3), .Y(SUM[12]) );
  AOI21X1 U20 ( .A(n31), .B(n173), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n173), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(B[12]), .Y(n30) );
  XOR2X1 U27 ( .A(n34), .B(n4), .Y(SUM[11]) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n80), .Y(n4) );
  NOR2X1 U31 ( .A(B[11]), .B(A[11]), .Y(n32) );
  NAND2X1 U32 ( .A(B[11]), .B(A[11]), .Y(n33) );
  XNOR2X1 U33 ( .A(n39), .B(n5), .Y(SUM[10]) );
  AOI21X1 U34 ( .A(n172), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n172), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(B[10]), .Y(n38) );
  XOR2X1 U41 ( .A(n164), .B(n6), .Y(SUM[9]) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n82), .Y(n6) );
  NOR2X1 U45 ( .A(B[9]), .B(A[9]), .Y(n40) );
  NAND2X1 U46 ( .A(B[9]), .B(A[9]), .Y(n41) );
  XNOR2X1 U47 ( .A(n166), .B(n7), .Y(SUM[8]) );
  AOI21X1 U48 ( .A(n171), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n171), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(B[8]), .Y(n46) );
  XOR2X1 U55 ( .A(n163), .B(n8), .Y(SUM[7]) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n84), .Y(n8) );
  NOR2X1 U59 ( .A(B[7]), .B(A[7]), .Y(n48) );
  NAND2X1 U60 ( .A(B[7]), .B(A[7]), .Y(n49) );
  XNOR2X1 U61 ( .A(n165), .B(n9), .Y(SUM[6]) );
  AOI21X1 U62 ( .A(n170), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n170), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(B[6]), .Y(n54) );
  XOR2X1 U69 ( .A(n58), .B(n10), .Y(SUM[5]) );
  OAI21X1 U70 ( .A(n58), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n57), .B(n86), .Y(n10) );
  NOR2X1 U73 ( .A(B[5]), .B(A[5]), .Y(n56) );
  NAND2X1 U74 ( .A(B[5]), .B(A[5]), .Y(n57) );
  XNOR2X1 U75 ( .A(n63), .B(n11), .Y(SUM[4]) );
  AOI21X1 U76 ( .A(n169), .B(n63), .C(n60), .Y(n58) );
  NAND2X1 U79 ( .A(n62), .B(n169), .Y(n11) );
  NAND2X1 U82 ( .A(A[4]), .B(B[4]), .Y(n62) );
  XOR2X1 U83 ( .A(n66), .B(n12), .Y(SUM[3]) );
  OAI21X1 U84 ( .A(n66), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U85 ( .A(n65), .B(n88), .Y(n12) );
  NOR2X1 U87 ( .A(B[3]), .B(A[3]), .Y(n64) );
  NAND2X1 U88 ( .A(B[3]), .B(A[3]), .Y(n65) );
  XNOR2X1 U89 ( .A(n71), .B(n13), .Y(SUM[2]) );
  AOI21X1 U90 ( .A(n168), .B(n71), .C(n68), .Y(n66) );
  NAND2X1 U93 ( .A(n70), .B(n168), .Y(n13) );
  NAND2X1 U96 ( .A(A[2]), .B(B[2]), .Y(n70) );
  XOR2X1 U97 ( .A(n14), .B(n167), .Y(SUM[1]) );
  OAI21X1 U98 ( .A(n72), .B(n75), .C(n73), .Y(n71) );
  NAND2X1 U99 ( .A(n73), .B(n90), .Y(n14) );
  NOR2X1 U101 ( .A(B[1]), .B(A[1]), .Y(n72) );
  NAND2X1 U102 ( .A(B[1]), .B(A[1]), .Y(n73) );
  NAND2X1 U107 ( .A(A[0]), .B(B[0]), .Y(n75) );
  OR2X1 U113 ( .A(A[8]), .B(B[8]), .Y(n171) );
  AND2X2 U114 ( .A(n167), .B(n175), .Y(SUM[0]) );
  OR2X1 U115 ( .A(A[2]), .B(B[2]), .Y(n168) );
  OR2X2 U116 ( .A(A[12]), .B(B[12]), .Y(n173) );
  XOR2X1 U117 ( .A(B[15]), .B(A[15]), .Y(n153) );
  XOR2X1 U118 ( .A(n153), .B(n76), .Y(SUM[15]) );
  NAND2X1 U119 ( .A(B[15]), .B(A[15]), .Y(n154) );
  NAND2X1 U120 ( .A(B[15]), .B(n76), .Y(n155) );
  NAND2X1 U121 ( .A(A[15]), .B(n76), .Y(n156) );
  NAND3X1 U122 ( .A(n154), .B(n155), .C(n156), .Y(n17) );
  XOR2X1 U123 ( .A(n93), .B(n92), .Y(n157) );
  XOR2X1 U124 ( .A(n157), .B(n17), .Y(SUM[16]) );
  NAND2X1 U125 ( .A(n93), .B(n92), .Y(n158) );
  NAND2X1 U126 ( .A(n93), .B(n17), .Y(n159) );
  NAND2X1 U127 ( .A(n92), .B(n17), .Y(n160) );
  NAND3X1 U128 ( .A(n158), .B(n159), .C(n160), .Y(n16) );
  INVX1 U129 ( .A(n23), .Y(n161) );
  INVX2 U130 ( .A(n161), .Y(n162) );
  OR2X1 U131 ( .A(A[14]), .B(B[14]), .Y(n174) );
  BUFX2 U132 ( .A(n50), .Y(n163) );
  BUFX2 U133 ( .A(n42), .Y(n164) );
  BUFX2 U134 ( .A(n55), .Y(n165) );
  BUFX2 U135 ( .A(n47), .Y(n166) );
  BUFX2 U136 ( .A(n75), .Y(n167) );
  OR2X1 U137 ( .A(A[0]), .B(B[0]), .Y(n175) );
  OR2X1 U138 ( .A(A[4]), .B(B[4]), .Y(n169) );
  OR2X1 U139 ( .A(A[6]), .B(B[6]), .Y(n170) );
  OR2X1 U140 ( .A(A[10]), .B(B[10]), .Y(n172) );
  INVX2 U141 ( .A(A[17]), .Y(n93) );
  INVX2 U142 ( .A(B[17]), .Y(n92) );
  INVX2 U143 ( .A(n72), .Y(n90) );
  INVX2 U144 ( .A(n64), .Y(n88) );
  INVX2 U145 ( .A(n56), .Y(n86) );
  INVX2 U146 ( .A(n48), .Y(n84) );
  INVX2 U147 ( .A(n40), .Y(n82) );
  INVX2 U148 ( .A(n32), .Y(n80) );
  INVX2 U149 ( .A(n24), .Y(n78) );
  INVX2 U150 ( .A(n18), .Y(n76) );
  INVX2 U151 ( .A(n70), .Y(n68) );
  INVX2 U152 ( .A(n62), .Y(n60) );
  INVX2 U153 ( .A(n54), .Y(n52) );
  INVX2 U154 ( .A(n46), .Y(n44) );
  INVX2 U155 ( .A(n38), .Y(n36) );
  INVX2 U156 ( .A(n30), .Y(n28) );
  INVX2 U157 ( .A(n22), .Y(n20) );
  INVX2 U158 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n9, n13, n19, n22, n25, n28, n31, n34, n37, n46, n48, n49,
         n51, n52, n57, n58, n60, n61, n62, n64, n65, n66, n67, n68, n69, n70,
         n72, n73, n74, n75, n77, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n109, n111, n112, n113,
         n114, n115, n116, n120, n122, n123, n124, n125, n127, n129, n130,
         n133, n134, n135, n136, n137, n140, n142, n144, n145, n146, n147,
         n148, n149, n151, n154, n156, n159, n160, n161, n162, n163, n164,
         n165, n166, n169, n170, n171, n172, n173, n174, n177, n178, n179,
         n181, n182, n183, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n197, n198, n199, n200, n201, n202, n205, n206, n207,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n248, n249, n250, n251, n256, n257,
         n258, n259, n264, n265, n266, n267, n275, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n545, n548, n551, n552, n554, n555, n557,
         n558, n560, n563, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n580, n581, n582, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n657, n658, n659, n660, n661, n662, n663,
         n664, n665, n666, n667, n668, n669, n670, n671, n672, n673, n674,
         n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, n685,
         n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
         n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707,
         n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718,
         n719, n720, n721, n722, n723, n724, n725, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n893, n894, n896, n897, n898, n899, n900,
         n917, n918, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
         n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043,
         n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053,
         n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063,
         n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073,
         n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083,
         n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093,
         n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103,
         n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113,
         n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123,
         n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133,
         n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143,
         n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153,
         n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163,
         n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173,
         n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183,
         n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193,
         n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233,
         n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243,
         n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273,
         n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283,
         n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293,
         n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303,
         n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313,
         n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323,
         n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333,
         n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343,
         n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353,
         n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n1312), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1242), .B(n1240), .Y(n74) );
  OAI21X1 U62 ( .A(n1264), .B(n1242), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  AOI21X1 U76 ( .A(n1312), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1240), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1264), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  XOR2X1 U87 ( .A(n112), .B(n57), .Y(product[43]) );
  AOI21X1 U88 ( .A(n1312), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1240), .Y(n96) );
  OAI21X1 U90 ( .A(n52), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n137), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n1049), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1245), .B(n1005), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1245), .C(n109), .Y(n107) );
  NAND2X1 U103 ( .A(n111), .B(n1245), .Y(n57) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1312), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n1240), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1264), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1188), .B(n1189), .Y(n115) );
  AOI21X1 U112 ( .A(n1005), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n1005), .Y(n58) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  AOI21X1 U122 ( .A(n1312), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n1190), .B(n1240), .Y(n124) );
  OAI21X1 U124 ( .A(n52), .B(n1190), .C(n127), .Y(n125) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  XOR2X1 U135 ( .A(n145), .B(n60), .Y(product[40]) );
  AOI21X1 U136 ( .A(n1312), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1263), .B(n1240), .Y(n135) );
  OAI21X1 U138 ( .A(n52), .B(n1263), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1243), .B(n1018), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1243), .C(n142), .Y(n140) );
  NAND2X1 U145 ( .A(n144), .B(n1243), .Y(n60) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1312), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1240), .Y(n146) );
  OAI21X1 U152 ( .A(n52), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n1018), .Y(n61) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  XOR2X1 U161 ( .A(n163), .B(n62), .Y(product[38]) );
  AOI21X1 U162 ( .A(n1148), .B(n1312), .C(n156), .Y(n154) );
  AOI21X1 U166 ( .A(n172), .B(n1084), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n1083), .B(n169), .C(n162), .Y(n160) );
  NAND2X1 U169 ( .A(n162), .B(n282), .Y(n62) );
  NOR2X1 U171 ( .A(n340), .B(n349), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  AOI21X1 U174 ( .A(n164), .B(n1312), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1233), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1233), .C(n169), .Y(n165) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  XOR2X1 U183 ( .A(n179), .B(n64), .Y(product[36]) );
  AOI21X1 U184 ( .A(n1164), .B(n1312), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n1134), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n362), .B(n373), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1312), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1312), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n194), .B(n189), .Y(n187) );
  OAI21X1 U208 ( .A(n1212), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n1050), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n388), .B(n1050), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1238), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1238), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n1191), .B(n212), .C(n200), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n1221), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n416), .B(n429), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n430), .B(n443), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n1199), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n444), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n233), .B(n223), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1248), .B(n1009), .Y(n223) );
  AOI21X1 U258 ( .A(n1247), .B(n1009), .C(n1244), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n1119), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1246), .B(n248), .C(n1249), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1251), .C(n1254), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1252), .C(n1256), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1258), .B(n1253), .C(n1255), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n601), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n574), .B(n305), .C(n585), .YC(n299), .YS(n300) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n603), .B(n619), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n575), .B(n319), .C(n587), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n621), .C(n637), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n576), .B(n337), .C(n605), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U330 ( .A(n622), .B(n606), .C(n347), .YC(n333), .YS(n334) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n344), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U334 ( .A(n355), .B(n346), .C(n353), .YC(n341), .YS(n342) );
  FAX1 U335 ( .A(n591), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n639), .C(n655), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n577), .B(n998), .C(n623), .YC(n347), .YS(n348) );
  FAX1 U339 ( .A(n356), .B(n367), .C(n365), .YC(n351), .YS(n352) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U344 ( .A(n366), .B(n375), .C(n364), .YC(n361), .YS(n362) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U354 ( .A(n658), .B(n610), .C(n642), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n386), .B(n674), .C(n594), .YC(n383), .YS(n384) );
  FAX1 U357 ( .A(n392), .B(n403), .C(n390), .YC(n387), .YS(n388) );
  FAX1 U363 ( .A(n1004), .B(n709), .C(n643), .YC(n399), .YS(n400) );
  FAX1 U367 ( .A(n427), .B(n414), .C(n425), .YC(n407), .YS(n408) );
  FAX1 U369 ( .A(n628), .B(n676), .C(n596), .YC(n411), .YS(n412) );
  FAX1 U370 ( .A(n1145), .B(n580), .C(n692), .YC(n413), .YS(n414) );
  FAX1 U374 ( .A(n1003), .B(n441), .C(n437), .YC(n421), .YS(n422) );
  FAX1 U375 ( .A(n629), .B(n677), .C(n661), .YC(n423), .YS(n424) );
  FAX1 U376 ( .A(n645), .B(n613), .C(n693), .YC(n425), .YS(n426) );
  FAX1 U377 ( .A(n1145), .B(n581), .C(n597), .YC(n427), .YS(n428) );
  FAX1 U379 ( .A(n1266), .B(n449), .C(n447), .YC(n431), .YS(n432) );
  FAX1 U380 ( .A(n442), .B(n1053), .C(n440), .YC(n433), .YS(n434) );
  FAX1 U381 ( .A(n1262), .B(n455), .C(n451), .YC(n435), .YS(n436) );
  FAX1 U382 ( .A(n678), .B(n646), .C(n662), .YC(n437), .YS(n438) );
  FAX1 U383 ( .A(n694), .B(n614), .C(n630), .YC(n439), .YS(n440) );
  FAX1 U384 ( .A(n582), .B(n710), .C(n598), .YC(n441), .YS(n442) );
  FAX1 U385 ( .A(n448), .B(n459), .C(n446), .YC(n443), .YS(n444) );
  FAX1 U387 ( .A(n465), .B(n452), .C(n454), .YC(n447), .YS(n448) );
  FAX1 U389 ( .A(n565), .B(n631), .C(n695), .YC(n451), .YS(n452) );
  FAX1 U390 ( .A(n647), .B(n711), .C(n599), .YC(n453), .YS(n454) );
  HAX1 U391 ( .A(n615), .B(n663), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U393 ( .A(n468), .B(n464), .C(n473), .YC(n459), .YS(n460) );
  FAX1 U395 ( .A(n696), .B(n680), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U397 ( .A(n616), .B(n600), .C(n632), .YC(n467), .YS(n468) );
  FAX1 U401 ( .A(n697), .B(n665), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n649), .B(n713), .C(n617), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n633), .B(n681), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n1002), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U412 ( .A(n667), .B(n699), .C(n635), .YC(n497), .YS(n498) );
  HAX1 U413 ( .A(n651), .B(n683), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n1044), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n716), .B(n684), .C(n700), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n636), .B(n652), .C(n668), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U420 ( .A(n717), .B(n685), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n701), .B(n669), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n718), .B(n702), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n654), .B(n670), .C(n686), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n703), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n687), .B(n719), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n720), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n672), .B(n688), .C(n704), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n690), .B(n706), .C(n722), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n1341), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n1339), .Y(n295) );
  NOR2X1 U436 ( .A(n1268), .B(n1337), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n1335), .Y(n305) );
  NOR2X1 U438 ( .A(n1268), .B(n1333), .Y(n575) );
  NOR2X1 U439 ( .A(n1268), .B(n1331), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n1329), .Y(n576) );
  NOR2X1 U441 ( .A(n1268), .B(n1327), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1325), .Y(n577) );
  NOR2X1 U443 ( .A(n1272), .B(n1323), .Y(n359) );
  NOR2X1 U445 ( .A(n1272), .B(n1319), .Y(n385) );
  NOR2X1 U447 ( .A(n1268), .B(n1315), .Y(n580) );
  NOR2X1 U448 ( .A(n1268), .B(n1313), .Y(n581) );
  OAI22X1 U466 ( .A(n918), .B(n1269), .C(n1309), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n1268), .B(n1309), .C(n1275), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1275), .B(n742), .C(n1309), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1275), .B(n743), .C(n1309), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1309), .B(n743), .C(n1267), .D(n744), .Y(n587) );
  OAI22X1 U473 ( .A(n1275), .B(n745), .C(n1309), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1309), .B(n745), .C(n1275), .D(n746), .Y(n589) );
  OAI22X1 U475 ( .A(n1267), .B(n747), .C(n1309), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1309), .B(n747), .C(n1275), .D(n748), .Y(n591) );
  OAI22X1 U477 ( .A(n1269), .B(n749), .C(n1309), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1309), .B(n749), .C(n1275), .D(n750), .Y(n593) );
  OAI22X1 U479 ( .A(n751), .B(n1267), .C(n1309), .D(n750), .Y(n594) );
  OAI22X1 U480 ( .A(n1309), .B(n751), .C(n1275), .D(n752), .Y(n595) );
  OAI22X1 U481 ( .A(n1269), .B(n753), .C(n1309), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n754), .B(n1269), .C(n1309), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n1309), .B(n754), .C(n755), .D(n1267), .Y(n598) );
  OAI22X1 U484 ( .A(n1309), .B(n755), .C(n756), .D(n1267), .Y(n599) );
  AND2X1 U485 ( .A(n1345), .B(n1308), .Y(n600) );
  XNOR2X1 U487 ( .A(n877), .B(n1344), .Y(n741) );
  XNOR2X1 U488 ( .A(n1340), .B(n1344), .Y(n742) );
  XNOR2X1 U489 ( .A(n1338), .B(n1344), .Y(n743) );
  XNOR2X1 U490 ( .A(n1336), .B(n1344), .Y(n744) );
  XNOR2X1 U491 ( .A(n1334), .B(n1344), .Y(n745) );
  XNOR2X1 U492 ( .A(n1332), .B(n1344), .Y(n746) );
  XNOR2X1 U493 ( .A(n1330), .B(n1344), .Y(n747) );
  XNOR2X1 U494 ( .A(n1328), .B(n1343), .Y(n748) );
  XNOR2X1 U495 ( .A(n1326), .B(n1343), .Y(n749) );
  XNOR2X1 U496 ( .A(n1324), .B(n1343), .Y(n750) );
  XNOR2X1 U497 ( .A(n1322), .B(n1343), .Y(n751) );
  XNOR2X1 U498 ( .A(n1320), .B(n1343), .Y(n752) );
  XNOR2X1 U499 ( .A(n1318), .B(n1343), .Y(n753) );
  XNOR2X1 U500 ( .A(n1316), .B(n1343), .Y(n754) );
  XNOR2X1 U501 ( .A(n1314), .B(n1343), .Y(n755) );
  XNOR2X1 U502 ( .A(n1000), .B(n1343), .Y(n756) );
  OAI22X1 U505 ( .A(n1156), .B(n1307), .C(n1304), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1156), .B(n1270), .C(n1307), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1307), .B(n759), .C(n1154), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1307), .B(n760), .C(n1304), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1304), .B(n760), .C(n1060), .D(n761), .Y(n605) );
  OAI22X1 U512 ( .A(n1307), .B(n762), .C(n1270), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1270), .B(n762), .C(n1060), .D(n763), .Y(n607) );
  OAI22X1 U514 ( .A(n1307), .B(n764), .C(n1304), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1304), .B(n764), .C(n765), .D(n1060), .Y(n609) );
  OAI22X1 U516 ( .A(n766), .B(n1060), .C(n1304), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1270), .B(n766), .C(n1060), .D(n767), .Y(n611) );
  OAI22X1 U518 ( .A(n1060), .B(n768), .C(n1270), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1304), .B(n768), .C(n1060), .D(n769), .Y(n613) );
  OAI22X1 U520 ( .A(n1060), .B(n770), .C(n1304), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n1060), .B(n771), .C(n1270), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n1270), .B(n771), .C(n772), .D(n1306), .Y(n616) );
  OAI22X1 U523 ( .A(n1304), .B(n772), .C(n1307), .D(n773), .Y(n617) );
  XNOR2X1 U526 ( .A(n877), .B(n997), .Y(n758) );
  XNOR2X1 U527 ( .A(n1340), .B(n997), .Y(n759) );
  XNOR2X1 U528 ( .A(n1338), .B(n997), .Y(n760) );
  XNOR2X1 U529 ( .A(n1336), .B(n997), .Y(n761) );
  XNOR2X1 U530 ( .A(n1334), .B(n997), .Y(n762) );
  XNOR2X1 U531 ( .A(n1332), .B(n997), .Y(n763) );
  XNOR2X1 U532 ( .A(n1330), .B(n996), .Y(n764) );
  XNOR2X1 U533 ( .A(n1328), .B(n996), .Y(n765) );
  XNOR2X1 U534 ( .A(n1326), .B(n996), .Y(n766) );
  XNOR2X1 U535 ( .A(n1324), .B(n997), .Y(n767) );
  XNOR2X1 U536 ( .A(n1322), .B(n997), .Y(n768) );
  XNOR2X1 U537 ( .A(n1320), .B(n997), .Y(n769) );
  XNOR2X1 U538 ( .A(n1318), .B(n997), .Y(n770) );
  XNOR2X1 U539 ( .A(n1316), .B(n996), .Y(n771) );
  XNOR2X1 U540 ( .A(n1314), .B(n996), .Y(n772) );
  XNOR2X1 U541 ( .A(n1000), .B(n997), .Y(n773) );
  OR2X1 U542 ( .A(n1001), .B(n1363), .Y(n774) );
  OAI22X1 U544 ( .A(n1105), .B(n1302), .C(n1300), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1105), .B(n1301), .C(n1302), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1302), .B(n776), .C(n1301), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1302), .B(n777), .C(n1300), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1300), .B(n777), .C(n1302), .D(n778), .Y(n623) );
  OAI22X1 U551 ( .A(n1302), .B(n779), .C(n1301), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1301), .B(n779), .C(n1302), .D(n780), .Y(n625) );
  OAI22X1 U553 ( .A(n1302), .B(n781), .C(n1300), .D(n780), .Y(n626) );
  OAI22X1 U554 ( .A(n1300), .B(n781), .C(n1302), .D(n782), .Y(n627) );
  OAI22X1 U555 ( .A(n1303), .B(n783), .C(n1300), .D(n782), .Y(n628) );
  OAI22X1 U556 ( .A(n1301), .B(n783), .C(n1302), .D(n784), .Y(n629) );
  OAI22X1 U557 ( .A(n1302), .B(n785), .C(n1301), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n1300), .B(n785), .C(n1303), .D(n786), .Y(n631) );
  OAI22X1 U559 ( .A(n1303), .B(n787), .C(n1300), .D(n786), .Y(n632) );
  OAI22X1 U560 ( .A(n1303), .B(n788), .C(n1301), .D(n787), .Y(n633) );
  OAI22X1 U561 ( .A(n1301), .B(n788), .C(n1302), .D(n789), .Y(n634) );
  OAI22X1 U562 ( .A(n1300), .B(n789), .C(n1302), .D(n790), .Y(n635) );
  XNOR2X1 U565 ( .A(n877), .B(n1157), .Y(n775) );
  XNOR2X1 U566 ( .A(n1340), .B(n1157), .Y(n776) );
  XNOR2X1 U567 ( .A(n1338), .B(n1157), .Y(n777) );
  XNOR2X1 U568 ( .A(n1336), .B(n1359), .Y(n778) );
  XNOR2X1 U569 ( .A(n1334), .B(n1359), .Y(n779) );
  XNOR2X1 U570 ( .A(n1332), .B(n1359), .Y(n780) );
  XNOR2X1 U571 ( .A(n1330), .B(n1359), .Y(n781) );
  XNOR2X1 U572 ( .A(n1328), .B(n1359), .Y(n782) );
  XNOR2X1 U573 ( .A(n1326), .B(n1359), .Y(n783) );
  XNOR2X1 U574 ( .A(n1324), .B(n1359), .Y(n784) );
  XNOR2X1 U575 ( .A(n1322), .B(n1359), .Y(n785) );
  XNOR2X1 U576 ( .A(n1320), .B(n1359), .Y(n786) );
  XNOR2X1 U577 ( .A(n1318), .B(n1359), .Y(n787) );
  XNOR2X1 U578 ( .A(n1316), .B(n1359), .Y(n788) );
  XNOR2X1 U579 ( .A(n1314), .B(n1359), .Y(n789) );
  XNOR2X1 U580 ( .A(n1000), .B(n1359), .Y(n790) );
  OR2X1 U581 ( .A(n1001), .B(n1105), .Y(n791) );
  OAI22X1 U583 ( .A(n1162), .B(n1298), .C(n1155), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1162), .B(n1274), .C(n1298), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1298), .B(n793), .C(n1274), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1298), .B(n794), .C(n1155), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1296), .B(n794), .C(n1297), .D(n795), .Y(n641) );
  OAI22X1 U590 ( .A(n1298), .B(n796), .C(n1274), .D(n795), .Y(n642) );
  OAI22X1 U591 ( .A(n1274), .B(n796), .C(n1298), .D(n797), .Y(n643) );
  OAI22X1 U592 ( .A(n1297), .B(n798), .C(n1296), .D(n797), .Y(n644) );
  OAI22X1 U593 ( .A(n1274), .B(n798), .C(n1297), .D(n799), .Y(n645) );
  OAI22X1 U594 ( .A(n1297), .B(n800), .C(n1296), .D(n799), .Y(n646) );
  OAI22X1 U595 ( .A(n1274), .B(n800), .C(n801), .D(n1017), .Y(n647) );
  OAI22X1 U596 ( .A(n1298), .B(n802), .C(n1274), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n1155), .B(n802), .C(n1298), .D(n803), .Y(n649) );
  OAI22X1 U598 ( .A(n1298), .B(n804), .C(n1296), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n1298), .B(n805), .C(n1274), .D(n804), .Y(n651) );
  OAI22X1 U600 ( .A(n1274), .B(n805), .C(n1298), .D(n806), .Y(n652) );
  OAI22X1 U601 ( .A(n1155), .B(n806), .C(n1298), .D(n807), .Y(n653) );
  XNOR2X1 U604 ( .A(n877), .B(n1356), .Y(n792) );
  XNOR2X1 U605 ( .A(n1340), .B(n1356), .Y(n793) );
  XNOR2X1 U606 ( .A(n1338), .B(n1356), .Y(n794) );
  XNOR2X1 U607 ( .A(n1336), .B(n1356), .Y(n795) );
  XNOR2X1 U608 ( .A(n1334), .B(n1356), .Y(n796) );
  XNOR2X1 U609 ( .A(n1332), .B(n1356), .Y(n797) );
  XNOR2X1 U610 ( .A(n1330), .B(n1356), .Y(n798) );
  XNOR2X1 U611 ( .A(n1328), .B(n1356), .Y(n799) );
  XNOR2X1 U612 ( .A(n1326), .B(n1356), .Y(n800) );
  XNOR2X1 U613 ( .A(n1324), .B(n1356), .Y(n801) );
  XNOR2X1 U614 ( .A(n1322), .B(n1356), .Y(n802) );
  XNOR2X1 U615 ( .A(n1320), .B(n1356), .Y(n803) );
  XNOR2X1 U616 ( .A(n1318), .B(n1356), .Y(n804) );
  XNOR2X1 U617 ( .A(n1316), .B(n1356), .Y(n805) );
  XNOR2X1 U618 ( .A(n1314), .B(n1356), .Y(n806) );
  XNOR2X1 U619 ( .A(n1001), .B(n1356), .Y(n807) );
  OR2X1 U620 ( .A(n1001), .B(n1162), .Y(n808) );
  OAI22X1 U622 ( .A(n1081), .B(n1235), .C(n1291), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1081), .B(n1292), .C(n1294), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1293), .B(n810), .C(n1292), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n811), .B(n1293), .C(n1291), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n1291), .B(n811), .C(n1293), .D(n812), .Y(n659) );
  OAI22X1 U630 ( .A(n1292), .B(n813), .C(n1293), .D(n814), .Y(n661) );
  OAI22X1 U631 ( .A(n1293), .B(n815), .C(n1291), .D(n814), .Y(n662) );
  OAI22X1 U632 ( .A(n1291), .B(n815), .C(n1293), .D(n816), .Y(n663) );
  OAI22X1 U633 ( .A(n1241), .B(n817), .C(n1291), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n1292), .B(n817), .C(n1293), .D(n818), .Y(n665) );
  OAI22X1 U635 ( .A(n1294), .B(n819), .C(n1292), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n1291), .B(n819), .C(n1294), .D(n820), .Y(n667) );
  OAI22X1 U637 ( .A(n1241), .B(n821), .C(n1291), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n1235), .B(n822), .C(n1292), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1292), .B(n822), .C(n1235), .D(n823), .Y(n670) );
  OAI22X1 U640 ( .A(n1291), .B(n823), .C(n1235), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1345), .B(n555), .Y(n672) );
  XNOR2X1 U643 ( .A(n877), .B(n1161), .Y(n809) );
  XNOR2X1 U644 ( .A(n1340), .B(n1160), .Y(n810) );
  XNOR2X1 U645 ( .A(n1338), .B(n1161), .Y(n811) );
  XNOR2X1 U646 ( .A(n1336), .B(n1161), .Y(n812) );
  XNOR2X1 U647 ( .A(n1334), .B(n1160), .Y(n813) );
  XNOR2X1 U648 ( .A(n1332), .B(n1160), .Y(n814) );
  XNOR2X1 U649 ( .A(n1330), .B(n1160), .Y(n815) );
  XNOR2X1 U650 ( .A(n1328), .B(n1161), .Y(n816) );
  XNOR2X1 U651 ( .A(n1326), .B(n1160), .Y(n817) );
  XNOR2X1 U652 ( .A(n1324), .B(n1161), .Y(n818) );
  XNOR2X1 U653 ( .A(n1322), .B(n1161), .Y(n819) );
  XNOR2X1 U654 ( .A(n1320), .B(n1160), .Y(n820) );
  XNOR2X1 U655 ( .A(n1318), .B(n1160), .Y(n821) );
  XNOR2X1 U656 ( .A(n1316), .B(n1161), .Y(n822) );
  XNOR2X1 U657 ( .A(n1314), .B(n1160), .Y(n823) );
  XNOR2X1 U658 ( .A(n1001), .B(n1161), .Y(n824) );
  OR2X1 U659 ( .A(n1001), .B(n1081), .Y(n825) );
  OAI22X1 U661 ( .A(n1273), .B(n1289), .C(n1158), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1273), .B(n1158), .C(n1006), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1289), .B(n827), .C(n1158), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1006), .B(n828), .C(n1288), .D(n827), .Y(n676) );
  OAI22X1 U667 ( .A(n1158), .B(n828), .C(n1006), .D(n829), .Y(n677) );
  OAI22X1 U668 ( .A(n1006), .B(n830), .C(n1158), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n1158), .B(n830), .C(n1289), .D(n831), .Y(n679) );
  OAI22X1 U670 ( .A(n1289), .B(n832), .C(n1158), .D(n831), .Y(n680) );
  OAI22X1 U671 ( .A(n1158), .B(n832), .C(n1289), .D(n833), .Y(n681) );
  OAI22X1 U672 ( .A(n1289), .B(n834), .C(n1158), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1158), .B(n834), .C(n1289), .D(n835), .Y(n683) );
  OAI22X1 U674 ( .A(n1289), .B(n836), .C(n1158), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1288), .B(n836), .C(n1289), .D(n837), .Y(n685) );
  OAI22X1 U676 ( .A(n1289), .B(n838), .C(n1158), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1289), .B(n839), .C(n1158), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1158), .B(n839), .C(n1289), .D(n840), .Y(n688) );
  OAI22X1 U679 ( .A(n1158), .B(n840), .C(n1289), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1345), .B(n558), .Y(n690) );
  XNOR2X1 U682 ( .A(n877), .B(n1352), .Y(n826) );
  XNOR2X1 U683 ( .A(n1340), .B(n1352), .Y(n827) );
  XNOR2X1 U684 ( .A(n1338), .B(n1352), .Y(n828) );
  XNOR2X1 U685 ( .A(n1336), .B(n1352), .Y(n829) );
  XNOR2X1 U686 ( .A(n1334), .B(n1352), .Y(n830) );
  XNOR2X1 U687 ( .A(n1332), .B(n1352), .Y(n831) );
  XNOR2X1 U688 ( .A(n1330), .B(n1352), .Y(n832) );
  XNOR2X1 U689 ( .A(n1328), .B(n1352), .Y(n833) );
  XNOR2X1 U690 ( .A(n1326), .B(n1352), .Y(n834) );
  XNOR2X1 U691 ( .A(n1324), .B(n1352), .Y(n835) );
  XNOR2X1 U692 ( .A(n1322), .B(n1352), .Y(n836) );
  XNOR2X1 U693 ( .A(n1320), .B(n1352), .Y(n837) );
  XNOR2X1 U694 ( .A(n1318), .B(n1352), .Y(n838) );
  XNOR2X1 U695 ( .A(n1316), .B(n1352), .Y(n839) );
  XNOR2X1 U696 ( .A(n1314), .B(n1352), .Y(n840) );
  XNOR2X1 U697 ( .A(n1001), .B(n1352), .Y(n841) );
  OR2X1 U698 ( .A(n1001), .B(n1273), .Y(n842) );
  OAI22X1 U700 ( .A(n1351), .B(n1020), .C(n1285), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1351), .B(n1286), .C(n1041), .D(n843), .Y(n692) );
  OAI22X1 U704 ( .A(n1287), .B(n844), .C(n1285), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n1020), .B(n845), .C(n1286), .D(n844), .Y(n694) );
  OAI22X1 U706 ( .A(n1286), .B(n845), .C(n1041), .D(n846), .Y(n695) );
  OAI22X1 U707 ( .A(n1287), .B(n847), .C(n1285), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1285), .B(n847), .C(n1287), .D(n848), .Y(n697) );
  OAI22X1 U709 ( .A(n1021), .B(n849), .C(n1285), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n1285), .B(n849), .C(n1287), .D(n850), .Y(n699) );
  OAI22X1 U711 ( .A(n1020), .B(n851), .C(n1285), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n1285), .B(n851), .C(n1020), .D(n852), .Y(n701) );
  OAI22X1 U713 ( .A(n1287), .B(n853), .C(n1285), .D(n852), .Y(n702) );
  OAI22X1 U714 ( .A(n1285), .B(n853), .C(n1287), .D(n854), .Y(n703) );
  OAI22X1 U715 ( .A(n1021), .B(n855), .C(n1285), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1287), .B(n856), .C(n1285), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n1285), .B(n856), .C(n1021), .D(n857), .Y(n706) );
  OAI22X1 U718 ( .A(n1285), .B(n857), .C(n1287), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1345), .B(n1284), .Y(n708) );
  XNOR2X1 U721 ( .A(n877), .B(n1349), .Y(n843) );
  XNOR2X1 U722 ( .A(n1340), .B(n1350), .Y(n844) );
  XNOR2X1 U723 ( .A(n1338), .B(n1350), .Y(n845) );
  XNOR2X1 U724 ( .A(n1336), .B(n1350), .Y(n846) );
  XNOR2X1 U725 ( .A(n1334), .B(n1349), .Y(n847) );
  XNOR2X1 U726 ( .A(n1332), .B(n1349), .Y(n848) );
  XNOR2X1 U727 ( .A(n1330), .B(n1349), .Y(n849) );
  XNOR2X1 U728 ( .A(n1328), .B(n1349), .Y(n850) );
  XNOR2X1 U729 ( .A(n1326), .B(n1349), .Y(n851) );
  XNOR2X1 U730 ( .A(n1324), .B(n1349), .Y(n852) );
  XNOR2X1 U731 ( .A(n1322), .B(n1349), .Y(n853) );
  XNOR2X1 U732 ( .A(n1320), .B(n1349), .Y(n854) );
  XNOR2X1 U733 ( .A(n1318), .B(n1349), .Y(n855) );
  XNOR2X1 U734 ( .A(n1316), .B(n1349), .Y(n856) );
  XNOR2X1 U735 ( .A(n1314), .B(n1349), .Y(n857) );
  XNOR2X1 U736 ( .A(n1001), .B(n1349), .Y(n858) );
  OR2X1 U737 ( .A(n1001), .B(n1351), .Y(n859) );
  OAI22X1 U739 ( .A(n1143), .B(n1092), .C(n917), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n917), .B(n1143), .C(n1283), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1283), .B(n861), .C(n917), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1011), .B(n862), .C(n917), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n917), .B(n862), .C(n1011), .D(n863), .Y(n713) );
  OAI22X1 U746 ( .A(n1011), .B(n864), .C(n917), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n917), .B(n864), .C(n1092), .D(n865), .Y(n715) );
  OAI22X1 U748 ( .A(n1011), .B(n866), .C(n917), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n917), .B(n866), .C(n1011), .D(n867), .Y(n717) );
  OAI22X1 U750 ( .A(n1011), .B(n868), .C(n917), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n917), .B(n868), .C(n1011), .D(n869), .Y(n719) );
  OAI22X1 U752 ( .A(n1092), .B(n870), .C(n917), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n917), .B(n870), .C(n1011), .D(n871), .Y(n721) );
  OAI22X1 U754 ( .A(n1092), .B(n872), .C(n917), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1092), .B(n873), .C(n917), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n917), .B(n873), .C(n1092), .D(n874), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n1092), .D(n875), .Y(n725) );
  XNOR2X1 U759 ( .A(n1340), .B(n1347), .Y(n861) );
  XNOR2X1 U760 ( .A(n1338), .B(n1347), .Y(n862) );
  XNOR2X1 U761 ( .A(n1336), .B(n1236), .Y(n863) );
  XNOR2X1 U762 ( .A(n1334), .B(n1237), .Y(n864) );
  XNOR2X1 U763 ( .A(n1332), .B(n1347), .Y(n865) );
  XNOR2X1 U764 ( .A(n1330), .B(n1236), .Y(n866) );
  XNOR2X1 U765 ( .A(n1328), .B(n1237), .Y(n867) );
  XNOR2X1 U766 ( .A(n1326), .B(n1236), .Y(n868) );
  XNOR2X1 U767 ( .A(n1324), .B(n1347), .Y(n869) );
  XNOR2X1 U768 ( .A(n1322), .B(n1347), .Y(n870) );
  XNOR2X1 U769 ( .A(n1320), .B(n1236), .Y(n871) );
  XNOR2X1 U770 ( .A(n1318), .B(n1347), .Y(n872) );
  XNOR2X1 U771 ( .A(n1316), .B(n1237), .Y(n873) );
  XNOR2X1 U772 ( .A(n1314), .B(n1236), .Y(n874) );
  XNOR2X1 U773 ( .A(n1001), .B(n1347), .Y(n875) );
  OR2X1 U774 ( .A(n1001), .B(n1143), .Y(n876) );
  NAND2X1 U801 ( .A(n46), .B(n893), .Y(n48) );
  XNOR2X1 U803 ( .A(n37), .B(a[29]), .Y(n46) );
  XOR2X1 U814 ( .A(n1354), .B(n1016), .Y(n897) );
  XNOR2X1 U815 ( .A(n13), .B(a[21]), .Y(n22) );
  XOR2X1 U817 ( .A(n1153), .B(a[19]), .Y(n898) );
  XOR2X1 U820 ( .A(n7), .B(a[17]), .Y(n899) );
  NAND2X1 U822 ( .A(n900), .B(n917), .Y(n6) );
  INVX2 U828 ( .A(n1344), .Y(n918) );
  INVX8 U829 ( .A(n1362), .Y(n995) );
  INVX8 U830 ( .A(n995), .Y(n996) );
  INVX8 U831 ( .A(n995), .Y(n997) );
  BUFX2 U832 ( .A(n359), .Y(n998) );
  BUFX4 U833 ( .A(n428), .Y(n1003) );
  INVX4 U834 ( .A(n1284), .Y(n1286) );
  BUFX2 U835 ( .A(n407), .Y(n999) );
  AND2X1 U836 ( .A(n9), .B(n899), .Y(n1271) );
  BUFX4 U837 ( .A(n1239), .Y(n1000) );
  BUFX4 U838 ( .A(n1239), .Y(n1001) );
  BUFX2 U839 ( .A(n49), .Y(n1239) );
  INVX8 U840 ( .A(n1121), .Y(n1298) );
  INVX4 U841 ( .A(n19), .Y(n1355) );
  INVX2 U842 ( .A(a[23]), .Y(n1082) );
  INVX4 U843 ( .A(n1), .Y(n1348) );
  INVX4 U844 ( .A(n1327), .Y(n1328) );
  INVX4 U845 ( .A(n1315), .Y(n1316) );
  INVX4 U846 ( .A(n1317), .Y(n1318) );
  BUFX2 U847 ( .A(n435), .Y(n1265) );
  INVX2 U848 ( .A(n1043), .Y(n1044) );
  BUFX2 U849 ( .A(n507), .Y(n1002) );
  INVX2 U850 ( .A(n887), .Y(n1321) );
  INVX4 U851 ( .A(n1313), .Y(n1314) );
  INVX2 U852 ( .A(n1271), .Y(n1287) );
  INVX2 U853 ( .A(n888), .Y(n1319) );
  INVX2 U854 ( .A(n877), .Y(n1341) );
  AND2X2 U855 ( .A(n1343), .B(n1318), .Y(n1004) );
  OR2X2 U856 ( .A(n308), .B(n313), .Y(n1005) );
  NAND2X1 U857 ( .A(n898), .B(n1030), .Y(n1006) );
  AND2X2 U858 ( .A(n169), .B(n283), .Y(n1007) );
  AND2X2 U859 ( .A(n917), .B(n900), .Y(n1008) );
  INVX2 U860 ( .A(n9), .Y(n1284) );
  OR2X2 U861 ( .A(n481), .B(n470), .Y(n1009) );
  INVX4 U862 ( .A(n1331), .Y(n1332) );
  INVX2 U863 ( .A(n884), .Y(n1327) );
  INVX4 U864 ( .A(n1329), .Y(n1330) );
  INVX2 U865 ( .A(n883), .Y(n1329) );
  INVX4 U866 ( .A(n1333), .Y(n1334) );
  INVX2 U867 ( .A(n881), .Y(n1333) );
  INVX2 U868 ( .A(n890), .Y(n1315) );
  INVX2 U869 ( .A(n886), .Y(n1323) );
  INVX4 U870 ( .A(n1335), .Y(n1336) );
  INVX2 U871 ( .A(n880), .Y(n1335) );
  INVX2 U872 ( .A(n885), .Y(n1325) );
  INVX4 U873 ( .A(n1337), .Y(n1338) );
  INVX2 U874 ( .A(n879), .Y(n1337) );
  INVX2 U875 ( .A(n1133), .Y(n1308) );
  INVX2 U876 ( .A(n679), .Y(n1163) );
  INVX2 U877 ( .A(n878), .Y(n1339) );
  OR2X2 U878 ( .A(n292), .B(n293), .Y(n1010) );
  XNOR2X1 U879 ( .A(n1361), .B(a[25]), .Y(n1147) );
  INVX2 U880 ( .A(n1361), .Y(n1360) );
  INVX4 U881 ( .A(n31), .Y(n1361) );
  INVX4 U882 ( .A(n1236), .Y(n1143) );
  INVX2 U883 ( .A(n1295), .Y(n1296) );
  INVX8 U884 ( .A(n25), .Y(n1358) );
  XNOR2X1 U885 ( .A(n1342), .B(a[29]), .Y(n893) );
  INVX2 U886 ( .A(n1008), .Y(n1011) );
  INVX2 U887 ( .A(n1008), .Y(n1283) );
  INVX2 U888 ( .A(n1310), .Y(n1275) );
  XOR2X1 U889 ( .A(n516), .B(n568), .Y(n1012) );
  XOR2X1 U890 ( .A(n521), .B(n1012), .Y(n512) );
  NAND2X1 U891 ( .A(n521), .B(n516), .Y(n1013) );
  NAND2X1 U892 ( .A(n521), .B(n568), .Y(n1014) );
  NAND2X1 U893 ( .A(n516), .B(n568), .Y(n1015) );
  NAND3X1 U894 ( .A(n1014), .B(n1013), .C(n1015), .Y(n511) );
  BUFX2 U895 ( .A(a[21]), .Y(n1016) );
  INVX2 U896 ( .A(n1120), .Y(n1017) );
  INVX2 U897 ( .A(n1120), .Y(n1297) );
  OR2X2 U898 ( .A(n339), .B(n330), .Y(n1018) );
  INVX1 U899 ( .A(n1018), .Y(n148) );
  XOR2X1 U900 ( .A(n1019), .B(n1363), .Y(n894) );
  INVX1 U901 ( .A(a[27]), .Y(n1019) );
  AND2X2 U902 ( .A(n1345), .B(n552), .Y(n654) );
  XOR2X1 U903 ( .A(n1341), .B(n1237), .Y(n860) );
  NAND2X1 U904 ( .A(n9), .B(n899), .Y(n1020) );
  NAND2X1 U905 ( .A(n9), .B(n899), .Y(n1021) );
  AND2X2 U906 ( .A(n1345), .B(n1299), .Y(n636) );
  INVX4 U907 ( .A(n1299), .Y(n1300) );
  INVX2 U908 ( .A(n1299), .Y(n1301) );
  INVX8 U909 ( .A(n1351), .Y(n1349) );
  INVX1 U910 ( .A(n48), .Y(n1310) );
  XOR2X1 U911 ( .A(n714), .B(n666), .Y(n1022) );
  XOR2X1 U912 ( .A(n1022), .B(n682), .Y(n488) );
  NAND2X1 U913 ( .A(n714), .B(n666), .Y(n1023) );
  NAND2X1 U914 ( .A(n714), .B(n682), .Y(n1024) );
  NAND2X1 U915 ( .A(n666), .B(n682), .Y(n1025) );
  NAND3X1 U916 ( .A(n1023), .B(n1024), .C(n1025), .Y(n487) );
  XOR2X1 U917 ( .A(n480), .B(n489), .Y(n1026) );
  XOR2X1 U918 ( .A(n1026), .B(n487), .Y(n474) );
  NAND2X1 U919 ( .A(n480), .B(n489), .Y(n1027) );
  NAND2X1 U920 ( .A(n480), .B(n487), .Y(n1028) );
  NAND2X1 U921 ( .A(n489), .B(n487), .Y(n1029) );
  NAND3X1 U922 ( .A(n1027), .B(n1028), .C(n1029), .Y(n473) );
  XNOR2X1 U923 ( .A(n7), .B(a[19]), .Y(n1030) );
  INVX2 U924 ( .A(n1030), .Y(n1042) );
  NAND2X1 U925 ( .A(n1346), .B(n1343), .Y(n757) );
  XOR2X1 U926 ( .A(n650), .B(n618), .Y(n1031) );
  XOR2X1 U927 ( .A(n634), .B(n1031), .Y(n490) );
  NAND2X1 U928 ( .A(n634), .B(n650), .Y(n1032) );
  NAND2X1 U929 ( .A(n634), .B(n618), .Y(n1033) );
  NAND2X1 U930 ( .A(n650), .B(n618), .Y(n1034) );
  NAND3X1 U931 ( .A(n1033), .B(n1032), .C(n1034), .Y(n489) );
  XOR2X1 U932 ( .A(n423), .B(n412), .Y(n1035) );
  XOR2X1 U933 ( .A(n410), .B(n1035), .Y(n406) );
  NAND2X1 U934 ( .A(n410), .B(n423), .Y(n1036) );
  NAND2X1 U935 ( .A(n410), .B(n412), .Y(n1037) );
  NAND2X1 U936 ( .A(n423), .B(n412), .Y(n1038) );
  NAND3X1 U937 ( .A(n1037), .B(n1036), .C(n1038), .Y(n405) );
  AND2X2 U938 ( .A(n894), .B(n1305), .Y(n1039) );
  AND2X2 U939 ( .A(n894), .B(n1305), .Y(n1040) );
  NAND2X1 U940 ( .A(n9), .B(n899), .Y(n1041) );
  INVX2 U941 ( .A(n515), .Y(n1043) );
  XOR2X1 U942 ( .A(n309), .B(n311), .Y(n1045) );
  XOR2X1 U943 ( .A(n304), .B(n1045), .Y(n302) );
  NAND2X1 U944 ( .A(n304), .B(n309), .Y(n1046) );
  NAND2X1 U945 ( .A(n304), .B(n311), .Y(n1047) );
  NAND2X1 U946 ( .A(n309), .B(n311), .Y(n1048) );
  NAND3X1 U947 ( .A(n1047), .B(n1046), .C(n1048), .Y(n301) );
  NAND2X1 U948 ( .A(n1245), .B(n1005), .Y(n1049) );
  NAND3X1 U949 ( .A(n1099), .B(n1098), .C(n1100), .Y(n1050) );
  NAND3X1 U950 ( .A(n1063), .B(n1062), .C(n1064), .Y(n1051) );
  INVX2 U951 ( .A(n1356), .Y(n1162) );
  INVX2 U952 ( .A(n438), .Y(n1052) );
  INVX4 U953 ( .A(n1052), .Y(n1053) );
  INVX2 U954 ( .A(n1344), .Y(n1268) );
  BUFX2 U955 ( .A(n48), .Y(n1267) );
  XOR2X1 U956 ( .A(n659), .B(n611), .Y(n1054) );
  XOR2X1 U957 ( .A(n595), .B(n1054), .Y(n396) );
  NAND2X1 U958 ( .A(n595), .B(n659), .Y(n1055) );
  NAND2X1 U959 ( .A(n595), .B(n611), .Y(n1056) );
  NAND2X1 U960 ( .A(n659), .B(n611), .Y(n1057) );
  NAND3X1 U961 ( .A(n1056), .B(n1055), .C(n1057), .Y(n395) );
  XNOR2X1 U962 ( .A(n134), .B(n1058), .Y(product[41]) );
  AND2X2 U963 ( .A(n133), .B(n1187), .Y(n1058) );
  XOR2X1 U964 ( .A(n431), .B(n420), .Y(n1135) );
  INVX4 U965 ( .A(n1284), .Y(n1285) );
  BUFX2 U966 ( .A(n644), .Y(n1059) );
  INVX4 U967 ( .A(n1039), .Y(n1060) );
  INVX1 U968 ( .A(n1040), .Y(n1306) );
  INVX4 U969 ( .A(n1095), .Y(n1289) );
  INVX2 U970 ( .A(n1295), .Y(n1155) );
  INVX4 U971 ( .A(n1260), .Y(n1294) );
  XOR2X1 U972 ( .A(n426), .B(n439), .Y(n1061) );
  XOR2X1 U973 ( .A(n424), .B(n1061), .Y(n420) );
  NAND2X1 U974 ( .A(n424), .B(n426), .Y(n1062) );
  NAND2X1 U975 ( .A(n424), .B(n439), .Y(n1063) );
  NAND2X1 U976 ( .A(n426), .B(n439), .Y(n1064) );
  NAND3X1 U977 ( .A(n1064), .B(n1062), .C(n1063), .Y(n419) );
  INVX2 U978 ( .A(n419), .Y(n1101) );
  INVX2 U979 ( .A(n385), .Y(n386) );
  XOR2X1 U980 ( .A(n1257), .B(n385), .Y(n1065) );
  XOR2X1 U981 ( .A(n1065), .B(n641), .Y(n372) );
  XOR2X1 U982 ( .A(n625), .B(n593), .Y(n1066) );
  XOR2X1 U983 ( .A(n1066), .B(n372), .Y(n368) );
  NAND2X1 U984 ( .A(n1257), .B(n385), .Y(n1067) );
  NAND2X1 U985 ( .A(n1257), .B(n641), .Y(n1068) );
  NAND2X1 U986 ( .A(n385), .B(n641), .Y(n1069) );
  NAND3X1 U987 ( .A(n1067), .B(n1068), .C(n1069), .Y(n371) );
  NAND2X1 U988 ( .A(n625), .B(n593), .Y(n1070) );
  NAND2X1 U989 ( .A(n625), .B(n372), .Y(n1071) );
  NAND2X1 U990 ( .A(n593), .B(n372), .Y(n1072) );
  NAND3X1 U991 ( .A(n1070), .B(n1071), .C(n1072), .Y(n367) );
  XOR2X1 U992 ( .A(n445), .B(n434), .Y(n1073) );
  XOR2X1 U993 ( .A(n432), .B(n1073), .Y(n430) );
  NAND2X1 U994 ( .A(n432), .B(n445), .Y(n1074) );
  NAND2X1 U995 ( .A(n432), .B(n434), .Y(n1075) );
  NAND2X1 U996 ( .A(n445), .B(n434), .Y(n1076) );
  NAND3X1 U997 ( .A(n1075), .B(n1074), .C(n1076), .Y(n429) );
  XNOR2X1 U998 ( .A(n25), .B(a[25]), .Y(n34) );
  XNOR2X1 U999 ( .A(n170), .B(n1007), .Y(product[37]) );
  INVX2 U1000 ( .A(n891), .Y(n1313) );
  XOR2X1 U1001 ( .A(n627), .B(n691), .Y(n1077) );
  XOR2X1 U1002 ( .A(n675), .B(n1077), .Y(n398) );
  NAND2X1 U1003 ( .A(n675), .B(n627), .Y(n1078) );
  NAND2X1 U1004 ( .A(n675), .B(n691), .Y(n1079) );
  NAND2X1 U1005 ( .A(n627), .B(n691), .Y(n1080) );
  NAND3X1 U1006 ( .A(n1079), .B(n1078), .C(n1080), .Y(n397) );
  XOR2X1 U1007 ( .A(n31), .B(a[27]), .Y(n1259) );
  INVX2 U1008 ( .A(n394), .Y(n1093) );
  BUFX2 U1009 ( .A(n431), .Y(n1261) );
  INVX1 U1010 ( .A(n1354), .Y(n1081) );
  INVX4 U1011 ( .A(n1355), .Y(n1354) );
  INVX4 U1012 ( .A(n1354), .Y(n1159) );
  XNOR2X1 U1013 ( .A(n1357), .B(n1082), .Y(n896) );
  INVX2 U1014 ( .A(n1358), .Y(n1357) );
  NOR2X1 U1015 ( .A(n349), .B(n340), .Y(n1083) );
  NOR2X1 U1016 ( .A(n161), .B(n166), .Y(n1084) );
  INVX2 U1017 ( .A(n1348), .Y(n1237) );
  INVX2 U1018 ( .A(n1351), .Y(n1350) );
  BUFX2 U1019 ( .A(n137), .Y(n1263) );
  XNOR2X1 U1020 ( .A(n1348), .B(a[15]), .Y(n900) );
  INVX2 U1021 ( .A(n1040), .Y(n1307) );
  XOR2X1 U1022 ( .A(n467), .B(n1163), .Y(n1086) );
  INVX4 U1023 ( .A(n1348), .Y(n1347) );
  XNOR2X1 U1024 ( .A(n86), .B(n1085), .Y(product[45]) );
  AND2X2 U1025 ( .A(n85), .B(n275), .Y(n1085) );
  BUFX4 U1026 ( .A(n1305), .Y(n1270) );
  XNOR2X1 U1027 ( .A(n1086), .B(n456), .Y(n450) );
  XOR2X1 U1028 ( .A(n648), .B(n712), .Y(n1087) );
  XOR2X1 U1029 ( .A(n664), .B(n1087), .Y(n466) );
  NAND2X1 U1030 ( .A(n664), .B(n648), .Y(n1088) );
  NAND2X1 U1031 ( .A(n664), .B(n712), .Y(n1089) );
  NAND2X1 U1032 ( .A(n648), .B(n712), .Y(n1090) );
  NAND3X1 U1033 ( .A(n1089), .B(n1088), .C(n1090), .Y(n465) );
  AND2X2 U1034 ( .A(n897), .B(n1292), .Y(n1091) );
  BUFX2 U1035 ( .A(n1011), .Y(n1092) );
  INVX2 U1036 ( .A(n1146), .Y(n1303) );
  XNOR2X1 U1037 ( .A(n1094), .B(n1093), .Y(n390) );
  XNOR2X1 U1038 ( .A(n999), .B(n1123), .Y(n1094) );
  INVX1 U1039 ( .A(n211), .Y(n209) );
  AND2X2 U1040 ( .A(n898), .B(n1030), .Y(n1095) );
  XNOR2X1 U1041 ( .A(n95), .B(n1096), .Y(product[44]) );
  AND2X2 U1042 ( .A(n94), .B(n91), .Y(n1096) );
  INVX1 U1043 ( .A(n1296), .Y(n552) );
  XOR2X1 U1044 ( .A(n417), .B(n406), .Y(n1097) );
  XOR2X1 U1045 ( .A(n1097), .B(n404), .Y(n402) );
  NAND2X1 U1046 ( .A(n404), .B(n417), .Y(n1098) );
  NAND2X1 U1047 ( .A(n404), .B(n406), .Y(n1099) );
  NAND2X1 U1048 ( .A(n417), .B(n406), .Y(n1100) );
  NAND3X1 U1049 ( .A(n1099), .B(n1098), .C(n1100), .Y(n401) );
  NAND2X1 U1050 ( .A(n419), .B(n1102), .Y(n1103) );
  NAND2X1 U1051 ( .A(n421), .B(n1101), .Y(n1104) );
  NAND2X1 U1052 ( .A(n1103), .B(n1104), .Y(n1213) );
  INVX1 U1053 ( .A(n421), .Y(n1102) );
  INVX1 U1054 ( .A(n1360), .Y(n1105) );
  INVX1 U1055 ( .A(n1123), .Y(n1124) );
  XOR2X1 U1056 ( .A(n472), .B(n474), .Y(n1106) );
  XOR2X1 U1057 ( .A(n483), .B(n1106), .Y(n470) );
  NAND2X1 U1058 ( .A(n483), .B(n472), .Y(n1107) );
  NAND2X1 U1059 ( .A(n483), .B(n474), .Y(n1108) );
  NAND2X1 U1060 ( .A(n472), .B(n474), .Y(n1109) );
  NAND3X1 U1061 ( .A(n1108), .B(n1107), .C(n1109), .Y(n469) );
  XOR2X1 U1062 ( .A(n715), .B(n567), .Y(n1110) );
  XOR2X1 U1063 ( .A(n1110), .B(n500), .Y(n496) );
  NAND2X1 U1064 ( .A(n715), .B(n567), .Y(n1111) );
  NAND2X1 U1065 ( .A(n715), .B(n500), .Y(n1112) );
  NAND2X1 U1066 ( .A(n567), .B(n500), .Y(n1113) );
  NAND3X1 U1067 ( .A(n1111), .B(n1112), .C(n1113), .Y(n495) );
  XOR2X1 U1068 ( .A(n490), .B(n488), .Y(n1114) );
  XOR2X1 U1069 ( .A(n1114), .B(n495), .Y(n484) );
  NAND2X1 U1070 ( .A(n490), .B(n488), .Y(n1115) );
  NAND2X1 U1071 ( .A(n490), .B(n495), .Y(n1116) );
  NAND2X1 U1072 ( .A(n488), .B(n495), .Y(n1117) );
  NAND3X1 U1073 ( .A(n1115), .B(n1116), .C(n1117), .Y(n483) );
  BUFX2 U1074 ( .A(n358), .Y(n1118) );
  INVX8 U1075 ( .A(n37), .Y(n1363) );
  NOR2X1 U1076 ( .A(n501), .B(n492), .Y(n1119) );
  INVX8 U1077 ( .A(n1361), .Y(n1359) );
  XOR2X1 U1078 ( .A(n397), .B(n626), .Y(n1165) );
  AND2X2 U1079 ( .A(n896), .B(n28), .Y(n1120) );
  AND2X2 U1080 ( .A(n28), .B(n896), .Y(n1121) );
  XNOR2X1 U1081 ( .A(n1122), .B(n391), .Y(n376) );
  XNOR2X1 U1082 ( .A(n393), .B(n380), .Y(n1122) );
  INVX2 U1083 ( .A(n405), .Y(n1123) );
  XOR2X1 U1084 ( .A(n657), .B(n609), .Y(n1125) );
  XOR2X1 U1085 ( .A(n1125), .B(n673), .Y(n370) );
  XOR2X1 U1086 ( .A(n383), .B(n381), .Y(n1126) );
  XOR2X1 U1087 ( .A(n1126), .B(n370), .Y(n366) );
  NAND2X1 U1088 ( .A(n609), .B(n657), .Y(n1127) );
  NAND2X1 U1089 ( .A(n609), .B(n673), .Y(n1128) );
  NAND2X1 U1090 ( .A(n657), .B(n673), .Y(n1129) );
  NAND3X1 U1091 ( .A(n1127), .B(n1128), .C(n1129), .Y(n369) );
  NAND2X1 U1092 ( .A(n383), .B(n381), .Y(n1130) );
  NAND2X1 U1093 ( .A(n383), .B(n370), .Y(n1131) );
  NAND2X1 U1094 ( .A(n381), .B(n370), .Y(n1132) );
  NAND3X1 U1095 ( .A(n1130), .B(n1131), .C(n1132), .Y(n365) );
  INVX1 U1096 ( .A(n222), .Y(n221) );
  XNOR2X1 U1097 ( .A(n37), .B(a[29]), .Y(n1133) );
  INVX8 U1098 ( .A(n1308), .Y(n1309) );
  INVX8 U1099 ( .A(n1358), .Y(n1356) );
  NOR2X1 U1100 ( .A(n373), .B(n362), .Y(n1134) );
  AND2X2 U1101 ( .A(n1345), .B(n1259), .Y(n618) );
  INVX1 U1102 ( .A(n1042), .Y(n1288) );
  XOR2X1 U1103 ( .A(n1135), .B(n418), .Y(n416) );
  NAND2X1 U1104 ( .A(n418), .B(n1261), .Y(n1136) );
  NAND2X1 U1105 ( .A(n418), .B(n420), .Y(n1137) );
  NAND2X1 U1106 ( .A(n1261), .B(n420), .Y(n1138) );
  NAND3X1 U1107 ( .A(n1137), .B(n1136), .C(n1138), .Y(n415) );
  XOR2X1 U1108 ( .A(n433), .B(n1265), .Y(n1139) );
  XOR2X1 U1109 ( .A(n1139), .B(n422), .Y(n418) );
  NAND2X1 U1110 ( .A(n422), .B(n433), .Y(n1140) );
  NAND2X1 U1111 ( .A(n422), .B(n1265), .Y(n1141) );
  NAND2X1 U1112 ( .A(n433), .B(n1265), .Y(n1142) );
  NAND3X1 U1113 ( .A(n1141), .B(n1140), .C(n1142), .Y(n417) );
  INVX4 U1114 ( .A(n1348), .Y(n1236) );
  INVX4 U1115 ( .A(n563), .Y(n1144) );
  INVX8 U1116 ( .A(n1144), .Y(n1145) );
  XOR2X1 U1117 ( .A(n1355), .B(a[23]), .Y(n28) );
  AND2X2 U1118 ( .A(n1147), .B(n34), .Y(n1146) );
  AND2X2 U1119 ( .A(n159), .B(n171), .Y(n1148) );
  INVX4 U1120 ( .A(n1148), .Y(n1240) );
  INVX2 U1121 ( .A(n34), .Y(n1299) );
  INVX1 U1122 ( .A(n200), .Y(n202) );
  XOR2X1 U1123 ( .A(n363), .B(n354), .Y(n1149) );
  XOR2X1 U1124 ( .A(n352), .B(n1149), .Y(n350) );
  NAND2X1 U1125 ( .A(n352), .B(n363), .Y(n1150) );
  NAND2X1 U1126 ( .A(n352), .B(n354), .Y(n1151) );
  NAND2X1 U1127 ( .A(n363), .B(n354), .Y(n1152) );
  NAND3X1 U1128 ( .A(n1151), .B(n1150), .C(n1152), .Y(n349) );
  BUFX2 U1129 ( .A(n13), .Y(n1153) );
  BUFX2 U1130 ( .A(n1270), .Y(n1154) );
  INVX1 U1131 ( .A(n28), .Y(n1295) );
  XNOR2X1 U1132 ( .A(n1), .B(a[17]), .Y(n9) );
  INVX1 U1133 ( .A(n997), .Y(n1156) );
  INVX8 U1134 ( .A(n1363), .Y(n1362) );
  BUFX2 U1135 ( .A(n1360), .Y(n1157) );
  INVX4 U1136 ( .A(n1042), .Y(n1158) );
  INVX1 U1137 ( .A(n183), .Y(n181) );
  INVX4 U1138 ( .A(n1146), .Y(n1302) );
  INVX8 U1139 ( .A(n1159), .Y(n1160) );
  INVX8 U1140 ( .A(n1159), .Y(n1161) );
  INVX1 U1141 ( .A(n173), .Y(n1164) );
  XOR2X1 U1142 ( .A(n1165), .B(n399), .Y(n380) );
  NAND2X1 U1143 ( .A(n399), .B(n397), .Y(n1166) );
  NAND2X1 U1144 ( .A(n399), .B(n626), .Y(n1167) );
  NAND2X1 U1145 ( .A(n397), .B(n626), .Y(n1168) );
  NAND3X1 U1146 ( .A(n1167), .B(n1166), .C(n1168), .Y(n379) );
  INVX2 U1147 ( .A(n13), .Y(n1353) );
  INVX8 U1148 ( .A(n1353), .Y(n1352) );
  INVX1 U1149 ( .A(n100), .Y(n98) );
  INVX1 U1150 ( .A(n1212), .Y(n286) );
  XNOR2X1 U1151 ( .A(n1169), .B(n660), .Y(n410) );
  XNOR2X1 U1152 ( .A(n612), .B(n644), .Y(n1169) );
  INVX1 U1153 ( .A(n213), .Y(n212) );
  XNOR2X1 U1154 ( .A(n1170), .B(n461), .Y(n446) );
  XNOR2X1 U1155 ( .A(n450), .B(n463), .Y(n1170) );
  BUFX4 U1156 ( .A(n28), .Y(n1274) );
  XOR2X1 U1157 ( .A(n413), .B(n411), .Y(n1171) );
  XOR2X1 U1158 ( .A(n1171), .B(n409), .Y(n394) );
  NAND2X1 U1159 ( .A(n413), .B(n411), .Y(n1172) );
  NAND2X1 U1160 ( .A(n413), .B(n409), .Y(n1173) );
  NAND2X1 U1161 ( .A(n411), .B(n409), .Y(n1174) );
  NAND3X1 U1162 ( .A(n1172), .B(n1173), .C(n1174), .Y(n393) );
  NAND2X1 U1163 ( .A(n999), .B(n1124), .Y(n1175) );
  NAND2X1 U1164 ( .A(n999), .B(n394), .Y(n1176) );
  NAND2X1 U1165 ( .A(n1124), .B(n394), .Y(n1177) );
  NAND3X1 U1166 ( .A(n1175), .B(n1176), .C(n1177), .Y(n389) );
  XNOR2X1 U1167 ( .A(n73), .B(n1178), .Y(product[46]) );
  AND2X2 U1168 ( .A(n72), .B(n1010), .Y(n1178) );
  INVX1 U1169 ( .A(n1291), .Y(n555) );
  XOR2X1 U1170 ( .A(n395), .B(n384), .Y(n1179) );
  XOR2X1 U1171 ( .A(n1179), .B(n382), .Y(n378) );
  NAND2X1 U1172 ( .A(n395), .B(n384), .Y(n1180) );
  NAND2X1 U1173 ( .A(n395), .B(n382), .Y(n1181) );
  NAND2X1 U1174 ( .A(n384), .B(n382), .Y(n1182) );
  NAND3X1 U1175 ( .A(n1180), .B(n1181), .C(n1182), .Y(n377) );
  XOR2X1 U1176 ( .A(n368), .B(n379), .Y(n1183) );
  XOR2X1 U1177 ( .A(n1183), .B(n377), .Y(n364) );
  NAND2X1 U1178 ( .A(n368), .B(n379), .Y(n1184) );
  NAND2X1 U1179 ( .A(n368), .B(n377), .Y(n1185) );
  NAND2X1 U1180 ( .A(n379), .B(n377), .Y(n1186) );
  NAND3X1 U1181 ( .A(n1184), .B(n1185), .C(n1186), .Y(n363) );
  AND2X2 U1182 ( .A(n1187), .B(n1005), .Y(n1189) );
  INVX1 U1183 ( .A(n130), .Y(n1187) );
  INVX1 U1184 ( .A(n137), .Y(n1188) );
  NAND2X1 U1185 ( .A(n1187), .B(n1188), .Y(n1190) );
  INVX1 U1186 ( .A(n1083), .Y(n282) );
  INVX1 U1187 ( .A(n201), .Y(n1191) );
  XOR2X1 U1188 ( .A(n477), .B(n475), .Y(n1192) );
  XOR2X1 U1189 ( .A(n1192), .B(n466), .Y(n462) );
  NAND2X1 U1190 ( .A(n477), .B(n475), .Y(n1193) );
  NAND2X1 U1191 ( .A(n477), .B(n466), .Y(n1194) );
  NAND2X1 U1192 ( .A(n475), .B(n466), .Y(n1195) );
  NAND3X1 U1193 ( .A(n1193), .B(n1194), .C(n1195), .Y(n461) );
  NAND2X1 U1194 ( .A(n463), .B(n450), .Y(n1196) );
  NAND2X1 U1195 ( .A(n463), .B(n461), .Y(n1197) );
  NAND2X1 U1196 ( .A(n450), .B(n461), .Y(n1198) );
  NAND3X1 U1197 ( .A(n1196), .B(n1197), .C(n1198), .Y(n445) );
  NOR2X1 U1198 ( .A(n457), .B(n444), .Y(n1199) );
  XOR2X1 U1199 ( .A(n400), .B(n396), .Y(n1200) );
  XOR2X1 U1200 ( .A(n1200), .B(n398), .Y(n392) );
  NAND2X1 U1201 ( .A(n400), .B(n396), .Y(n1201) );
  NAND2X1 U1202 ( .A(n400), .B(n398), .Y(n1202) );
  NAND2X1 U1203 ( .A(n396), .B(n398), .Y(n1203) );
  NAND3X1 U1204 ( .A(n1201), .B(n1202), .C(n1203), .Y(n391) );
  NAND2X1 U1205 ( .A(n393), .B(n380), .Y(n1204) );
  NAND2X1 U1206 ( .A(n393), .B(n391), .Y(n1205) );
  NAND2X1 U1207 ( .A(n380), .B(n391), .Y(n1206) );
  NAND3X1 U1208 ( .A(n1204), .B(n1205), .C(n1206), .Y(n375) );
  NAND2X1 U1209 ( .A(n660), .B(n612), .Y(n1207) );
  NAND2X1 U1210 ( .A(n660), .B(n1059), .Y(n1208) );
  NAND2X1 U1211 ( .A(n612), .B(n1059), .Y(n1209) );
  NAND3X1 U1212 ( .A(n1208), .B(n1207), .C(n1209), .Y(n409) );
  OR2X1 U1213 ( .A(n1294), .B(n813), .Y(n1210) );
  OR2X2 U1214 ( .A(n1292), .B(n812), .Y(n1211) );
  NAND2X1 U1215 ( .A(n1210), .B(n1211), .Y(n660) );
  NOR2X1 U1216 ( .A(n401), .B(n388), .Y(n1212) );
  XOR2X1 U1217 ( .A(n1213), .B(n408), .Y(n404) );
  NAND2X1 U1218 ( .A(n408), .B(n1051), .Y(n1214) );
  NAND2X1 U1219 ( .A(n408), .B(n421), .Y(n1215) );
  NAND2X1 U1220 ( .A(n1051), .B(n421), .Y(n1216) );
  NAND3X1 U1221 ( .A(n1215), .B(n1214), .C(n1216), .Y(n403) );
  XOR2X1 U1222 ( .A(n345), .B(n336), .Y(n1217) );
  XOR2X1 U1223 ( .A(n334), .B(n1217), .Y(n332) );
  NAND2X1 U1224 ( .A(n334), .B(n345), .Y(n1218) );
  NAND2X1 U1225 ( .A(n334), .B(n336), .Y(n1219) );
  NAND2X1 U1226 ( .A(n345), .B(n336), .Y(n1220) );
  NAND3X1 U1227 ( .A(n1219), .B(n1218), .C(n1220), .Y(n331) );
  NOR2X1 U1228 ( .A(n429), .B(n416), .Y(n1221) );
  XOR2X1 U1229 ( .A(n698), .B(n499), .Y(n1222) );
  XOR2X1 U1230 ( .A(n1222), .B(n497), .Y(n486) );
  NAND2X1 U1231 ( .A(n698), .B(n499), .Y(n1223) );
  NAND2X1 U1232 ( .A(n698), .B(n497), .Y(n1224) );
  NAND2X1 U1233 ( .A(n499), .B(n497), .Y(n1225) );
  NAND3X1 U1234 ( .A(n1223), .B(n1224), .C(n1225), .Y(n485) );
  XOR2X1 U1235 ( .A(n476), .B(n478), .Y(n1226) );
  XOR2X1 U1236 ( .A(n1226), .B(n485), .Y(n472) );
  NAND2X1 U1237 ( .A(n476), .B(n478), .Y(n1227) );
  NAND2X1 U1238 ( .A(n476), .B(n485), .Y(n1228) );
  NAND2X1 U1239 ( .A(n478), .B(n485), .Y(n1229) );
  NAND3X1 U1240 ( .A(n1227), .B(n1228), .C(n1229), .Y(n471) );
  NAND2X1 U1241 ( .A(n456), .B(n467), .Y(n1230) );
  NAND2X1 U1242 ( .A(n456), .B(n679), .Y(n1231) );
  NAND2X1 U1243 ( .A(n467), .B(n679), .Y(n1232) );
  NAND3X1 U1244 ( .A(n1231), .B(n1230), .C(n1232), .Y(n449) );
  INVX2 U1245 ( .A(n283), .Y(n1233) );
  INVX2 U1246 ( .A(n1294), .Y(n1234) );
  INVX4 U1247 ( .A(n1234), .Y(n1235) );
  INVX2 U1248 ( .A(n287), .Y(n1238) );
  INVX2 U1249 ( .A(n889), .Y(n1317) );
  INVX1 U1250 ( .A(n49), .Y(n1346) );
  INVX1 U1251 ( .A(n94), .Y(n92) );
  OR2X2 U1252 ( .A(n137), .B(n80), .Y(n1242) );
  OR2X2 U1253 ( .A(n322), .B(n329), .Y(n1243) );
  OR2X2 U1254 ( .A(n302), .B(n307), .Y(n1245) );
  INVX8 U1255 ( .A(n1290), .Y(n1292) );
  AND2X1 U1256 ( .A(n572), .B(n725), .Y(n1258) );
  INVX8 U1257 ( .A(a[15]), .Y(n917) );
  INVX8 U1258 ( .A(n7), .Y(n1351) );
  INVX2 U1259 ( .A(n882), .Y(n1331) );
  INVX1 U1260 ( .A(n1260), .Y(n1241) );
  INVX4 U1261 ( .A(n1091), .Y(n1293) );
  AND2X2 U1262 ( .A(n481), .B(n470), .Y(n1244) );
  OR2X1 U1263 ( .A(n523), .B(n518), .Y(n1246) );
  AND2X2 U1264 ( .A(n491), .B(n482), .Y(n1247) );
  OR2X1 U1265 ( .A(n491), .B(n482), .Y(n1248) );
  AND2X2 U1266 ( .A(n523), .B(n518), .Y(n1249) );
  INVX2 U1267 ( .A(n554), .Y(n655) );
  INVX2 U1268 ( .A(n1145), .Y(n709) );
  XNOR2X1 U1269 ( .A(n1250), .B(n592), .Y(n358) );
  XNOR2X1 U1270 ( .A(n656), .B(n360), .Y(n1250) );
  INVX2 U1271 ( .A(n551), .Y(n637) );
  INVX2 U1272 ( .A(n560), .Y(n691) );
  INVX2 U1273 ( .A(n557), .Y(n673) );
  OR2X1 U1274 ( .A(n533), .B(n530), .Y(n1251) );
  OR2X1 U1275 ( .A(n539), .B(n538), .Y(n1252) );
  OR2X1 U1276 ( .A(n708), .B(n724), .Y(n1253) );
  AND2X2 U1277 ( .A(n533), .B(n530), .Y(n1254) );
  AND2X2 U1278 ( .A(n708), .B(n724), .Y(n1255) );
  AND2X2 U1279 ( .A(n539), .B(n538), .Y(n1256) );
  XNOR2X1 U1280 ( .A(n542), .B(n573), .Y(n291) );
  AND2X2 U1281 ( .A(n1343), .B(n1322), .Y(n1257) );
  INVX2 U1282 ( .A(n1259), .Y(n1305) );
  INVX2 U1283 ( .A(n548), .Y(n619) );
  INVX2 U1284 ( .A(n1259), .Y(n1304) );
  INVX2 U1285 ( .A(n545), .Y(n601) );
  INVX2 U1286 ( .A(n1346), .Y(n1345) );
  AND2X2 U1287 ( .A(n897), .B(n1292), .Y(n1260) );
  INVX1 U1288 ( .A(n1199), .Y(n290) );
  INVX4 U1289 ( .A(n51), .Y(n1311) );
  INVX1 U1290 ( .A(n210), .Y(n289) );
  BUFX4 U1291 ( .A(n453), .Y(n1262) );
  AOI21X1 U1292 ( .A(n172), .B(n159), .C(n160), .Y(n1264) );
  INVX1 U1293 ( .A(n1344), .Y(n1272) );
  BUFX4 U1294 ( .A(n436), .Y(n1266) );
  BUFX2 U1295 ( .A(n48), .Y(n1269) );
  INVX1 U1296 ( .A(n1153), .Y(n1273) );
  AND2X2 U1297 ( .A(n1345), .B(n1344), .Y(n582) );
  INVX4 U1298 ( .A(n1342), .Y(n1343) );
  INVX2 U1299 ( .A(n1290), .Y(n1291) );
  INVX1 U1300 ( .A(n166), .Y(n283) );
  INVX1 U1301 ( .A(n205), .Y(n288) );
  INVX1 U1302 ( .A(n199), .Y(n201) );
  XOR2X1 U1303 ( .A(n371), .B(n369), .Y(n1276) );
  XOR2X1 U1304 ( .A(n1276), .B(n1118), .Y(n354) );
  NAND2X1 U1305 ( .A(n360), .B(n656), .Y(n1277) );
  NAND2X1 U1306 ( .A(n360), .B(n592), .Y(n1278) );
  NAND2X1 U1307 ( .A(n656), .B(n592), .Y(n1279) );
  NAND3X1 U1308 ( .A(n1277), .B(n1278), .C(n1279), .Y(n357) );
  NAND2X1 U1309 ( .A(n371), .B(n369), .Y(n1280) );
  NAND2X1 U1310 ( .A(n371), .B(n358), .Y(n1281) );
  NAND2X1 U1311 ( .A(n369), .B(n358), .Y(n1282) );
  NAND3X1 U1312 ( .A(n1280), .B(n1281), .C(n1282), .Y(n353) );
  INVX4 U1313 ( .A(n541), .Y(n1342) );
  INVX1 U1314 ( .A(n172), .Y(n174) );
  INVX4 U1315 ( .A(n22), .Y(n1290) );
  INVX1 U1316 ( .A(n171), .Y(n173) );
  INVX1 U1317 ( .A(n194), .Y(n287) );
  INVX1 U1318 ( .A(n177), .Y(n284) );
  INVX1 U1319 ( .A(n1264), .Y(n156) );
  INVX8 U1320 ( .A(n1311), .Y(n1312) );
  INVX8 U1321 ( .A(n1319), .Y(n1320) );
  INVX8 U1322 ( .A(n1321), .Y(n1322) );
  INVX8 U1323 ( .A(n1323), .Y(n1324) );
  INVX8 U1324 ( .A(n1325), .Y(n1326) );
  INVX8 U1325 ( .A(n1339), .Y(n1340) );
  INVX8 U1326 ( .A(n1342), .Y(n1344) );
  INVX2 U1327 ( .A(n101), .Y(n99) );
  INVX2 U1328 ( .A(n79), .Y(n77) );
  OAI22X1 U1329 ( .A(n917), .B(n1143), .C(n6), .D(n1143), .Y(n563) );
  OAI22X1 U1330 ( .A(n1286), .B(n1351), .C(n1021), .D(n1351), .Y(n560) );
  INVX2 U1331 ( .A(n1288), .Y(n558) );
  OAI22X1 U1332 ( .A(n1158), .B(n1273), .C(n1006), .D(n1273), .Y(n557) );
  OAI22X1 U1333 ( .A(n1292), .B(n1081), .C(n1235), .D(n1081), .Y(n554) );
  OAI22X1 U1334 ( .A(n1274), .B(n1162), .C(n1298), .D(n1162), .Y(n551) );
  OAI22X1 U1335 ( .A(n1301), .B(n1105), .C(n1302), .D(n1105), .Y(n548) );
  OAI22X1 U1336 ( .A(n1154), .B(n1156), .C(n1307), .D(n1156), .Y(n545) );
  OAI22X1 U1337 ( .A(n1309), .B(n1268), .C(n1275), .D(n1272), .Y(n542) );
  INVX2 U1338 ( .A(n998), .Y(n360) );
  INVX2 U1339 ( .A(n337), .Y(n338) );
  INVX2 U1340 ( .A(n319), .Y(n320) );
  INVX2 U1341 ( .A(n305), .Y(n306) );
  INVX2 U1342 ( .A(n295), .Y(n296) );
  INVX2 U1343 ( .A(n93), .Y(n91) );
  INVX2 U1344 ( .A(n84), .Y(n275) );
  INVX2 U1345 ( .A(n182), .Y(n285) );
  INVX2 U1346 ( .A(n149), .Y(n151) );
  INVX2 U1347 ( .A(n144), .Y(n142) );
  INVX2 U1348 ( .A(n129), .Y(n127) );
  INVX2 U1349 ( .A(n122), .Y(n120) );
  INVX2 U1350 ( .A(n111), .Y(n109) );
  INVX2 U1351 ( .A(n105), .Y(n103) );
  INVX2 U1352 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n19, n9, n11, 
        src1_data[12], n8, n2, n31, n5, n29, n13, n14, n4, n6, n12, n10, n7}), 
        .B({src2_data[16], src2_data}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n19, n9, n11, n3, 
        n8, n20, n31, n5, n29, n13, n14, n21, n6, n12, n10, n7}), .B({
        src2_data[16], src2_data}), .CI(1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15], n1, n34, src1_data[12:10], 
        n31, src1_data[8], n29, src1_data[6:4], n24, src1_data[2], n22, 
        src1_data[0], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .b(src2_data[15:0]), .product({
        N26, full_mult[45:30], SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, SYNOPSYS_UNCONNECTED__20, 
        SYNOPSYS_UNCONNECTED__21, SYNOPSYS_UNCONNECTED__22, 
        SYNOPSYS_UNCONNECTED__23, SYNOPSYS_UNCONNECTED__24, 
        SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, 
        SYNOPSYS_UNCONNECTED__29}) );
  INVX4 U3 ( .A(n35), .Y(n34) );
  INVX2 U4 ( .A(src1_data[13]), .Y(n35) );
  INVX4 U6 ( .A(n30), .Y(n29) );
  INVX2 U7 ( .A(src1_data[9]), .Y(n32) );
  BUFX2 U9 ( .A(src1_data[0]), .Y(n7) );
  BUFX4 U10 ( .A(src1_data[14]), .Y(n1) );
  INVX1 U11 ( .A(src1_data[11]), .Y(n33) );
  INVX1 U12 ( .A(n1), .Y(n18) );
  INVX2 U13 ( .A(src1_data[7]), .Y(n30) );
  BUFX2 U14 ( .A(src1_data[10]), .Y(n2) );
  BUFX2 U15 ( .A(src1_data[12]), .Y(n3) );
  BUFX2 U16 ( .A(src1_data[4]), .Y(n4) );
  BUFX2 U17 ( .A(src1_data[8]), .Y(n5) );
  BUFX2 U18 ( .A(src1_data[2]), .Y(n12) );
  INVX1 U19 ( .A(n25), .Y(n6) );
  INVX2 U20 ( .A(src1_data[3]), .Y(n25) );
  INVX4 U21 ( .A(n25), .Y(n24) );
  INVX1 U22 ( .A(n33), .Y(n8) );
  INVX1 U23 ( .A(n18), .Y(n9) );
  INVX1 U24 ( .A(n23), .Y(n10) );
  INVX4 U25 ( .A(n23), .Y(n22) );
  INVX2 U26 ( .A(src1_data[1]), .Y(n23) );
  BUFX2 U27 ( .A(n34), .Y(n11) );
  INVX1 U28 ( .A(src1_data[5]), .Y(n26) );
  BUFX2 U29 ( .A(src1_data[6]), .Y(n13) );
  INVX1 U30 ( .A(n26), .Y(n14) );
  INVX2 U31 ( .A(n76), .Y(n71) );
  AND2X2 U32 ( .A(n40), .B(n39), .Y(n15) );
  AND2X2 U33 ( .A(alu_op[1]), .B(n39), .Y(n16) );
  AND2X2 U34 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n17) );
  BUFX2 U35 ( .A(src1_data[15]), .Y(n19) );
  BUFX2 U36 ( .A(n2), .Y(n20) );
  BUFX2 U37 ( .A(n4), .Y(n21) );
  INVX8 U38 ( .A(n32), .Y(n31) );
  INVX2 U39 ( .A(large_sum[16]), .Y(n75) );
  XOR2X1 U40 ( .A(n75), .B(large_sum[17]), .Y(n38) );
  INVX2 U41 ( .A(alu_op[1]), .Y(n40) );
  NAND2X1 U42 ( .A(alu_op[0]), .B(n40), .Y(n76) );
  INVX2 U43 ( .A(alu_op[0]), .Y(n39) );
  XOR2X1 U44 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n36) );
  AOI22X1 U45 ( .A(N26), .B(n17), .C(n16), .D(n36), .Y(n37) );
  OAI21X1 U46 ( .A(n38), .B(n76), .C(n37), .Y(overflow) );
  AOI22X1 U47 ( .A(n7), .B(n15), .C(full_mult[30]), .D(n17), .Y(n42) );
  AOI22X1 U48 ( .A(large_dif[0]), .B(n16), .C(large_sum[0]), .D(n71), .Y(n41)
         );
  NAND2X1 U49 ( .A(n42), .B(n41), .Y(result[0]) );
  AOI22X1 U50 ( .A(n10), .B(n15), .C(full_mult[31]), .D(n17), .Y(n44) );
  AOI22X1 U51 ( .A(large_dif[1]), .B(n16), .C(large_sum[1]), .D(n71), .Y(n43)
         );
  NAND2X1 U52 ( .A(n44), .B(n43), .Y(result[1]) );
  AOI22X1 U53 ( .A(n12), .B(n15), .C(full_mult[32]), .D(n17), .Y(n46) );
  AOI22X1 U54 ( .A(large_dif[2]), .B(n16), .C(large_sum[2]), .D(n71), .Y(n45)
         );
  NAND2X1 U55 ( .A(n46), .B(n45), .Y(result[2]) );
  AOI22X1 U56 ( .A(n6), .B(n15), .C(full_mult[33]), .D(n17), .Y(n48) );
  AOI22X1 U57 ( .A(large_dif[3]), .B(n16), .C(large_sum[3]), .D(n71), .Y(n47)
         );
  NAND2X1 U58 ( .A(n48), .B(n47), .Y(result[3]) );
  AOI22X1 U59 ( .A(n21), .B(n15), .C(full_mult[34]), .D(n17), .Y(n50) );
  AOI22X1 U60 ( .A(large_dif[4]), .B(n16), .C(large_sum[4]), .D(n71), .Y(n49)
         );
  NAND2X1 U61 ( .A(n50), .B(n49), .Y(result[4]) );
  AOI22X1 U62 ( .A(n14), .B(n15), .C(full_mult[35]), .D(n17), .Y(n52) );
  AOI22X1 U63 ( .A(large_dif[5]), .B(n16), .C(large_sum[5]), .D(n71), .Y(n51)
         );
  NAND2X1 U64 ( .A(n52), .B(n51), .Y(result[5]) );
  AOI22X1 U65 ( .A(n13), .B(n15), .C(full_mult[36]), .D(n17), .Y(n54) );
  AOI22X1 U66 ( .A(large_dif[6]), .B(n16), .C(large_sum[6]), .D(n71), .Y(n53)
         );
  NAND2X1 U67 ( .A(n54), .B(n53), .Y(result[6]) );
  AOI22X1 U68 ( .A(n29), .B(n15), .C(full_mult[37]), .D(n17), .Y(n56) );
  AOI22X1 U69 ( .A(large_dif[7]), .B(n16), .C(large_sum[7]), .D(n71), .Y(n55)
         );
  NAND2X1 U70 ( .A(n56), .B(n55), .Y(result[7]) );
  AOI22X1 U71 ( .A(n5), .B(n15), .C(full_mult[38]), .D(n17), .Y(n58) );
  AOI22X1 U72 ( .A(large_dif[8]), .B(n16), .C(large_sum[8]), .D(n71), .Y(n57)
         );
  NAND2X1 U73 ( .A(n58), .B(n57), .Y(result[8]) );
  AOI22X1 U74 ( .A(n31), .B(n15), .C(full_mult[39]), .D(n17), .Y(n60) );
  AOI22X1 U75 ( .A(large_dif[9]), .B(n16), .C(large_sum[9]), .D(n71), .Y(n59)
         );
  NAND2X1 U76 ( .A(n60), .B(n59), .Y(result[9]) );
  AOI22X1 U77 ( .A(n20), .B(n15), .C(full_mult[40]), .D(n17), .Y(n62) );
  AOI22X1 U78 ( .A(large_dif[10]), .B(n16), .C(large_sum[10]), .D(n71), .Y(n61) );
  NAND2X1 U79 ( .A(n62), .B(n61), .Y(result[10]) );
  AOI22X1 U80 ( .A(n8), .B(n15), .C(full_mult[41]), .D(n17), .Y(n64) );
  AOI22X1 U81 ( .A(large_dif[11]), .B(n16), .C(large_sum[11]), .D(n71), .Y(n63) );
  NAND2X1 U82 ( .A(n63), .B(n64), .Y(result[11]) );
  AOI22X1 U83 ( .A(n3), .B(n15), .C(full_mult[42]), .D(n17), .Y(n66) );
  AOI22X1 U84 ( .A(large_dif[12]), .B(n16), .C(large_sum[12]), .D(n71), .Y(n65) );
  NAND2X1 U85 ( .A(n66), .B(n65), .Y(result[12]) );
  AOI22X1 U86 ( .A(n11), .B(n15), .C(full_mult[43]), .D(n17), .Y(n68) );
  AOI22X1 U87 ( .A(large_dif[13]), .B(n16), .C(large_sum[13]), .D(n71), .Y(n67) );
  NAND2X1 U88 ( .A(n68), .B(n67), .Y(result[13]) );
  AOI22X1 U89 ( .A(n9), .B(n15), .C(full_mult[44]), .D(n17), .Y(n70) );
  AOI22X1 U90 ( .A(large_dif[14]), .B(n16), .C(large_sum[14]), .D(n71), .Y(n69) );
  NAND2X1 U91 ( .A(n69), .B(n70), .Y(result[14]) );
  AOI22X1 U92 ( .A(n19), .B(n15), .C(full_mult[45]), .D(n17), .Y(n73) );
  AOI22X1 U93 ( .A(large_dif[15]), .B(n16), .C(large_sum[15]), .D(n71), .Y(n72) );
  NAND2X1 U94 ( .A(n73), .B(n72), .Y(result[15]) );
  AOI22X1 U95 ( .A(src1_data[16]), .B(n15), .C(large_dif[16]), .D(n16), .Y(n74) );
  OAI21X1 U96 ( .A(n76), .B(n75), .C(n74), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n7), .Y(n53) );
  INVX1 U3 ( .A(n8), .Y(n52) );
  INVX1 U4 ( .A(n11), .Y(n46) );
  INVX1 U5 ( .A(n13), .Y(n42) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX1 U8 ( .A(n17), .Y(n34) );
  INVX1 U9 ( .A(n15), .Y(n38) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n9), .Y(n50) );
  INVX1 U12 ( .A(n20), .Y(n30) );
  INVX1 U13 ( .A(n12), .Y(n44) );
  INVX2 U14 ( .A(n1), .Y(n2) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n22), .Y(n28) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U30 ( .A(n14), .Y(n40) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n22), .Y(n28) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n22), .Y(n28) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n22), .Y(n28) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n22), .Y(n28) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n22), .Y(n28) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n22), .Y(n28) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n22), .Y(n28) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, n722, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n85, n86, n87, n88, n90, n91, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n719), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n721), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n720), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n719), .Y(n10) );
  NOR2X1 U29 ( .A(n718), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n721), .B(n720), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n717), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n71, n706, 
        n704, n701, n698, n695, n692, n689, n686, n683, n680, n676, n674, n671, 
        n668, n665}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n710), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n708, n706, 
        n703, n76, n80, n78, n85, n688, n87, n682, n679, n677, n673, n670, 
        n667, n665}), .current_value({\regs_matrix[1][16] , 
        \regs_matrix[1][15] , \regs_matrix[1][14] , \regs_matrix[1][13] , 
        \regs_matrix[1][12] , \regs_matrix[1][11] , \regs_matrix[1][10] , 
        \regs_matrix[1][9] , \regs_matrix[1][8] , \regs_matrix[1][7] , 
        \regs_matrix[1][6] , \regs_matrix[1][5] , \regs_matrix[1][4] , 
        \regs_matrix[1][3] , \regs_matrix[1][2] , \regs_matrix[1][1] , 
        \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n710), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n709, n706, 
        n704, n701, n698, n695, n692, n689, n686, n683, n680, n676, n674, n671, 
        n668, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n711), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n708, n706, 
        n703, n700, n697, n694, n691, n688, n685, n682, n679, n677, n673, n670, 
        n667, n665}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n711), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n709, n706, 
        n704, n701, n698, n695, n692, n689, n686, n683, n680, n676, n674, n671, 
        n668, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n712), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n708, n706, 
        n703, n77, n81, n79, n86, n688, n88, n682, n679, n677, n673, n670, 
        n667, n665}), .current_value({\regs_matrix[5][16] , 
        \regs_matrix[5][15] , \regs_matrix[5][14] , \regs_matrix[5][13] , 
        \regs_matrix[5][12] , \regs_matrix[5][11] , \regs_matrix[5][10] , 
        \regs_matrix[5][9] , \regs_matrix[5][8] , \regs_matrix[5][7] , 
        \regs_matrix[5][6] , \regs_matrix[5][5] , \regs_matrix[5][4] , 
        \regs_matrix[5][3] , \regs_matrix[5][2] , \regs_matrix[5][1] , 
        \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n712), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n709, n706, 
        n704, n701, n698, n695, n692, n689, n686, n683, n680, n676, n674, n671, 
        n668, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n713), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n708, n706, 
        n703, n76, n80, n78, n85, n688, n87, n682, n679, n677, n673, n670, 
        n667, n665}), .current_value({\regs_matrix[7][16] , 
        \regs_matrix[7][15] , \regs_matrix[7][14] , \regs_matrix[7][13] , 
        \regs_matrix[7][12] , \regs_matrix[7][11] , \regs_matrix[7][10] , 
        \regs_matrix[7][9] , \regs_matrix[7][8] , \regs_matrix[7][7] , 
        \regs_matrix[7][6] , \regs_matrix[7][5] , \regs_matrix[7][4] , 
        \regs_matrix[7][3] , \regs_matrix[7][2] , \regs_matrix[7][1] , 
        \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n713), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n709, n706, 
        n704, n77, n81, n79, n86, n689, n88, n683, n680, n676, n674, n671, 
        n668, w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n714), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n708, n706, 
        n703, n700, n697, n694, n691, n688, n685, n682, n679, n677, n673, n670, 
        n667, n665}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n714), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n709, n706, 
        n704, n76, n80, n78, n85, n689, n87, n683, n680, n676, n674, n671, 
        n668, w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n715), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n708, n706, 
        n703, n77, n81, n79, n86, n688, n88, n682, n679, n677, n673, n670, 
        n667, n665}), .current_value({\regs_matrix[11][16] , 
        \regs_matrix[11][15] , \regs_matrix[11][14] , \regs_matrix[11][13] , 
        \regs_matrix[11][12] , \regs_matrix[11][11] , \regs_matrix[11][10] , 
        \regs_matrix[11][9] , \regs_matrix[11][8] , \regs_matrix[11][7] , 
        \regs_matrix[11][6] , \regs_matrix[11][5] , \regs_matrix[11][4] , 
        \regs_matrix[11][3] , \regs_matrix[11][2] , \regs_matrix[11][1] , 
        \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n715), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n709, n706, 
        n704, n700, n697, n694, n691, n689, n685, n683, n680, n676, n674, n671, 
        n668, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n716), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n708, n706, 
        n703, n76, n80, n78, n85, n688, n87, n682, n679, n677, n673, n670, 
        n667, n665}), .current_value({\regs_matrix[13][16] , 
        \regs_matrix[13][15] , \regs_matrix[13][14] , \regs_matrix[13][13] , 
        \regs_matrix[13][12] , \regs_matrix[13][11] , \regs_matrix[13][10] , 
        \regs_matrix[13][9] , \regs_matrix[13][8] , \regs_matrix[13][7] , 
        \regs_matrix[13][6] , \regs_matrix[13][5] , \regs_matrix[13][4] , 
        \regs_matrix[13][3] , \regs_matrix[13][2] , \regs_matrix[13][1] , 
        \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n716), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n709, n706, 
        n704, n77, n81, n79, n86, n689, n88, n683, n680, n676, n674, n671, 
        n668, w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n717), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n708, n706, 
        n703, n700, n697, n694, n691, n688, n685, n682, n679, n677, n673, n670, 
        n667, n665}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  INVX4 U2 ( .A(w_data[11]), .Y(n696) );
  INVX4 U3 ( .A(n658), .Y(n1) );
  INVX4 U4 ( .A(n1), .Y(n2) );
  INVX4 U5 ( .A(n1), .Y(n3) );
  INVX4 U31 ( .A(n641), .Y(n642) );
  INVX4 U32 ( .A(n652), .Y(n654) );
  INVX4 U33 ( .A(n398), .Y(n652) );
  INVX4 U34 ( .A(n636), .Y(n639) );
  INVX4 U35 ( .A(n352), .Y(n355) );
  INVX2 U36 ( .A(n393), .Y(n641) );
  INVX4 U37 ( .A(n635), .Y(n640) );
  INVX4 U38 ( .A(n637), .Y(n638) );
  BUFX2 U39 ( .A(n96), .Y(n14) );
  INVX2 U40 ( .A(n722), .Y(n83) );
  AND2X2 U41 ( .A(N15), .B(N14), .Y(n98) );
  INVX4 U42 ( .A(N14), .Y(n626) );
  INVX2 U43 ( .A(n96), .Y(n4) );
  BUFX2 U44 ( .A(n96), .Y(n15) );
  BUFX2 U45 ( .A(n96), .Y(n16) );
  BUFX2 U46 ( .A(n96), .Y(n17) );
  INVX2 U47 ( .A(n14), .Y(n18) );
  INVX2 U48 ( .A(n14), .Y(n19) );
  INVX1 U49 ( .A(n14), .Y(n20) );
  INVX1 U50 ( .A(n14), .Y(n21) );
  INVX1 U51 ( .A(n14), .Y(n22) );
  INVX1 U52 ( .A(n15), .Y(n23) );
  INVX1 U53 ( .A(n15), .Y(n24) );
  INVX1 U54 ( .A(n15), .Y(n25) );
  INVX1 U55 ( .A(n15), .Y(n26) );
  INVX1 U56 ( .A(n15), .Y(n27) );
  INVX1 U57 ( .A(n16), .Y(n28) );
  INVX1 U58 ( .A(n16), .Y(n29) );
  INVX1 U59 ( .A(n16), .Y(n30) );
  INVX1 U60 ( .A(n16), .Y(n31) );
  INVX1 U61 ( .A(n16), .Y(n32) );
  INVX1 U62 ( .A(n17), .Y(n33) );
  INVX1 U63 ( .A(n17), .Y(n34) );
  INVX1 U64 ( .A(n17), .Y(n35) );
  INVX1 U65 ( .A(n17), .Y(n36) );
  INVX1 U66 ( .A(n17), .Y(n37) );
  INVX2 U67 ( .A(n4), .Y(n38) );
  INVX2 U68 ( .A(n4), .Y(n39) );
  INVX2 U69 ( .A(n4), .Y(n40) );
  INVX1 U70 ( .A(n38), .Y(n41) );
  INVX1 U71 ( .A(n38), .Y(n42) );
  INVX1 U72 ( .A(n38), .Y(n43) );
  INVX1 U73 ( .A(n38), .Y(n44) );
  INVX1 U74 ( .A(n38), .Y(n45) );
  INVX1 U75 ( .A(n39), .Y(n46) );
  INVX1 U76 ( .A(n39), .Y(n47) );
  INVX1 U77 ( .A(n39), .Y(n48) );
  INVX1 U78 ( .A(n39), .Y(n49) );
  INVX1 U79 ( .A(n39), .Y(n50) );
  INVX1 U80 ( .A(n40), .Y(n51) );
  INVX1 U81 ( .A(n40), .Y(n52) );
  INVX1 U82 ( .A(n40), .Y(n53) );
  INVX1 U83 ( .A(n40), .Y(n54) );
  INVX2 U84 ( .A(N16), .Y(n625) );
  AND2X2 U85 ( .A(N12), .B(N10), .Y(n55) );
  INVX2 U86 ( .A(n631), .Y(n632) );
  INVX2 U87 ( .A(n111), .Y(n359) );
  INVX2 U88 ( .A(n397), .Y(n649) );
  INVX4 U89 ( .A(n630), .Y(n633) );
  AND2X2 U90 ( .A(n105), .B(n104), .Y(n377) );
  INVX2 U91 ( .A(n352), .Y(n56) );
  AND2X2 U92 ( .A(n61), .B(n67), .Y(n57) );
  AND2X2 U93 ( .A(n61), .B(n67), .Y(n58) );
  BUFX2 U94 ( .A(n624), .Y(n59) );
  INVX2 U95 ( .A(n62), .Y(n63) );
  INVX2 U96 ( .A(n345), .Y(n60) );
  MUX2X1 U97 ( .B(n313), .A(n312), .S(n376), .Y(r1_data[15]) );
  INVX1 U98 ( .A(n62), .Y(n61) );
  INVX2 U99 ( .A(N12), .Y(n62) );
  INVX4 U100 ( .A(n641), .Y(n643) );
  INVX8 U101 ( .A(n649), .Y(n651) );
  INVX2 U102 ( .A(n350), .Y(n64) );
  MUX2X1 U103 ( .B(n137), .A(n136), .S(n376), .Y(r1_data[2]) );
  INVX2 U104 ( .A(n97), .Y(n65) );
  INVX4 U105 ( .A(n345), .Y(n66) );
  INVX2 U106 ( .A(n345), .Y(n346) );
  INVX4 U107 ( .A(n645), .Y(n647) );
  INVX4 U108 ( .A(n645), .Y(n648) );
  INVX4 U109 ( .A(n645), .Y(n646) );
  INVX4 U110 ( .A(n68), .Y(r1_data[8]) );
  AND2X2 U111 ( .A(N11), .B(N10), .Y(n67) );
  INVX8 U112 ( .A(n705), .Y(n706) );
  INVX4 U113 ( .A(n649), .Y(n650) );
  MUX2X1 U114 ( .B(n69), .A(n70), .S(n374), .Y(n68) );
  AND2X2 U115 ( .A(n224), .B(n225), .Y(n69) );
  AND2X2 U116 ( .A(n218), .B(n219), .Y(n70) );
  INVX1 U117 ( .A(n707), .Y(n71) );
  INVX4 U118 ( .A(n359), .Y(n95) );
  MUX2X1 U119 ( .B(n123), .A(n122), .S(n376), .Y(r1_data[1]) );
  BUFX2 U120 ( .A(n372), .Y(n72) );
  AND2X2 U121 ( .A(n338), .B(n67), .Y(n73) );
  AND2X2 U122 ( .A(n338), .B(n67), .Y(n74) );
  INVX4 U123 ( .A(n675), .Y(n677) );
  INVX4 U124 ( .A(n675), .Y(n676) );
  INVX1 U125 ( .A(n346), .Y(n75) );
  INVX4 U126 ( .A(n641), .Y(n644) );
  INVX4 U127 ( .A(n652), .Y(n655) );
  INVX4 U128 ( .A(n652), .Y(n653) );
  INVX4 U129 ( .A(N15), .Y(n624) );
  AND2X2 U130 ( .A(N16), .B(n98), .Y(n97) );
  INVX2 U131 ( .A(n699), .Y(n76) );
  INVX2 U132 ( .A(n699), .Y(n77) );
  INVX4 U133 ( .A(w_data[12]), .Y(n699) );
  INVX2 U134 ( .A(n693), .Y(n78) );
  INVX2 U135 ( .A(n693), .Y(n79) );
  INVX4 U136 ( .A(w_data[10]), .Y(n693) );
  INVX2 U137 ( .A(n696), .Y(n80) );
  INVX2 U138 ( .A(n696), .Y(n81) );
  NAND2X1 U139 ( .A(n337), .B(n55), .Y(n115) );
  INVX2 U140 ( .A(n97), .Y(n82) );
  INVX8 U141 ( .A(n83), .Y(r2_data[15]) );
  INVX2 U142 ( .A(n359), .Y(n362) );
  INVX4 U143 ( .A(w_data[14]), .Y(n705) );
  INVX2 U144 ( .A(n690), .Y(n85) );
  INVX2 U145 ( .A(n690), .Y(n86) );
  INVX4 U146 ( .A(w_data[9]), .Y(n690) );
  INVX2 U147 ( .A(n684), .Y(n87) );
  INVX2 U148 ( .A(n684), .Y(n88) );
  INVX4 U149 ( .A(w_data[7]), .Y(n684) );
  INVX8 U150 ( .A(n356), .Y(n357) );
  BUFX4 U151 ( .A(n634), .Y(n637) );
  INVX2 U152 ( .A(n394), .Y(n645) );
  INVX2 U153 ( .A(N17), .Y(n660) );
  INVX2 U154 ( .A(N13), .Y(n376) );
  MUX2X1 U155 ( .B(n90), .A(n91), .S(n374), .Y(r1_data[6]) );
  NAND2X1 U156 ( .A(n198), .B(n199), .Y(n90) );
  NAND2X1 U157 ( .A(n192), .B(n193), .Y(n91) );
  MUX2X1 U158 ( .B(n93), .A(n94), .S(n374), .Y(r1_data[12]) );
  NAND2X1 U159 ( .A(n279), .B(n278), .Y(n93) );
  NAND2X1 U160 ( .A(n273), .B(n272), .Y(n94) );
  INVX2 U161 ( .A(w_data[5]), .Y(n678) );
  INVX2 U162 ( .A(w_data[2]), .Y(n669) );
  INVX2 U163 ( .A(w_data[3]), .Y(n672) );
  INVX2 U164 ( .A(w_data[4]), .Y(n675) );
  INVX2 U165 ( .A(w_data[1]), .Y(n666) );
  INVX2 U166 ( .A(w_data[0]), .Y(n664) );
  BUFX2 U167 ( .A(n629), .Y(n631) );
  AND2X2 U168 ( .A(n98), .B(n625), .Y(n96) );
  INVX2 U169 ( .A(n97), .Y(n658) );
  INVX2 U170 ( .A(n97), .Y(n657) );
  INVX2 U171 ( .A(n359), .Y(n361) );
  INVX2 U172 ( .A(n97), .Y(n656) );
  INVX2 U173 ( .A(n359), .Y(n360) );
  BUFX2 U174 ( .A(n634), .Y(n635) );
  BUFX2 U175 ( .A(n634), .Y(n636) );
  INVX2 U176 ( .A(n392), .Y(n634) );
  INVX2 U177 ( .A(n660), .Y(n659) );
  INVX2 U178 ( .A(n376), .Y(n375) );
  INVX2 U179 ( .A(n376), .Y(n374) );
  INVX2 U180 ( .A(n699), .Y(n701) );
  INVX2 U181 ( .A(n699), .Y(n700) );
  INVX2 U182 ( .A(n696), .Y(n698) );
  INVX2 U183 ( .A(n693), .Y(n695) );
  INVX2 U184 ( .A(n684), .Y(n686) );
  INVX2 U185 ( .A(n696), .Y(n697) );
  INVX2 U186 ( .A(n693), .Y(n694) );
  INVX2 U187 ( .A(n690), .Y(n692) );
  INVX4 U188 ( .A(n379), .Y(r1_data[0]) );
  INVX4 U189 ( .A(n687), .Y(n689) );
  INVX4 U190 ( .A(n681), .Y(n683) );
  INVX4 U191 ( .A(n687), .Y(n688) );
  INVX4 U192 ( .A(n681), .Y(n682) );
  INVX4 U193 ( .A(n702), .Y(n704) );
  INVX4 U194 ( .A(n702), .Y(n703) );
  INVX4 U195 ( .A(n707), .Y(n708) );
  INVX4 U196 ( .A(n707), .Y(n709) );
  INVX2 U197 ( .A(n684), .Y(n685) );
  INVX2 U198 ( .A(n690), .Y(n691) );
  INVX2 U199 ( .A(n678), .Y(n680) );
  INVX2 U200 ( .A(n678), .Y(n679) );
  INVX2 U201 ( .A(n669), .Y(n671) );
  INVX2 U202 ( .A(n669), .Y(n670) );
  INVX2 U203 ( .A(n672), .Y(n674) );
  INVX2 U204 ( .A(n672), .Y(n673) );
  INVX2 U205 ( .A(n666), .Y(n668) );
  INVX2 U206 ( .A(n666), .Y(n667) );
  INVX2 U207 ( .A(n664), .Y(n665) );
  BUFX2 U208 ( .A(n_reset), .Y(n710) );
  BUFX2 U209 ( .A(n_reset), .Y(n711) );
  BUFX2 U210 ( .A(n_reset), .Y(n712) );
  BUFX2 U211 ( .A(n_reset), .Y(n713) );
  BUFX2 U212 ( .A(n_reset), .Y(n714) );
  BUFX2 U213 ( .A(n_reset), .Y(n715) );
  BUFX2 U214 ( .A(n_reset), .Y(n716) );
  BUFX2 U215 ( .A(n_reset), .Y(n717) );
  AOI22X1 U216 ( .A(n102), .B(n101), .C(n100), .D(n99), .Y(n103) );
  INVX2 U217 ( .A(n103), .Y(r1_data[16]) );
  NOR2X1 U218 ( .A(n106), .B(n107), .Y(n105) );
  OAI22X1 U219 ( .A(\regs_matrix[8][0] ), .B(n66), .C(\regs_matrix[10][0] ), 
        .D(n353), .Y(n107) );
  OAI22X1 U220 ( .A(\regs_matrix[12][0] ), .B(n358), .C(\regs_matrix[14][0] ), 
        .D(n362), .Y(n106) );
  NOR2X1 U221 ( .A(n112), .B(n113), .Y(n104) );
  OAI22X1 U222 ( .A(\regs_matrix[11][0] ), .B(n365), .C(\regs_matrix[9][0] ), 
        .D(n368), .Y(n113) );
  OAI22X1 U223 ( .A(\regs_matrix[13][0] ), .B(n370), .C(\regs_matrix[15][0] ), 
        .D(n373), .Y(n112) );
  NOR2X1 U224 ( .A(n118), .B(n119), .Y(n117) );
  OAI22X1 U225 ( .A(outreg_data[0]), .B(n66), .C(\regs_matrix[2][0] ), .D(n353), .Y(n119) );
  OAI22X1 U226 ( .A(\regs_matrix[4][0] ), .B(n358), .C(\regs_matrix[6][0] ), 
        .D(n95), .Y(n118) );
  NOR2X1 U227 ( .A(n120), .B(n121), .Y(n116) );
  OAI22X1 U228 ( .A(\regs_matrix[3][0] ), .B(n363), .C(\regs_matrix[1][0] ), 
        .D(n368), .Y(n121) );
  OAI22X1 U229 ( .A(\regs_matrix[5][0] ), .B(n371), .C(\regs_matrix[7][0] ), 
        .D(n373), .Y(n120) );
  NAND2X1 U230 ( .A(n124), .B(n125), .Y(n123) );
  NOR2X1 U231 ( .A(n126), .B(n127), .Y(n125) );
  OAI22X1 U232 ( .A(\regs_matrix[8][1] ), .B(n347), .C(\regs_matrix[10][1] ), 
        .D(n353), .Y(n127) );
  OAI22X1 U233 ( .A(\regs_matrix[12][1] ), .B(n357), .C(\regs_matrix[14][1] ), 
        .D(n95), .Y(n126) );
  NOR2X1 U234 ( .A(n129), .B(n128), .Y(n124) );
  OAI22X1 U235 ( .A(\regs_matrix[11][1] ), .B(n364), .C(\regs_matrix[9][1] ), 
        .D(n367), .Y(n129) );
  OAI22X1 U236 ( .A(\regs_matrix[13][1] ), .B(n370), .C(\regs_matrix[15][1] ), 
        .D(n373), .Y(n128) );
  NAND2X1 U237 ( .A(n130), .B(n131), .Y(n122) );
  NOR2X1 U238 ( .A(n133), .B(n132), .Y(n131) );
  OAI22X1 U239 ( .A(outreg_data[1]), .B(n346), .C(\regs_matrix[2][1] ), .D(
        n353), .Y(n133) );
  OAI22X1 U240 ( .A(\regs_matrix[4][1] ), .B(n357), .C(\regs_matrix[6][1] ), 
        .D(n95), .Y(n132) );
  NOR2X1 U241 ( .A(n134), .B(n135), .Y(n130) );
  OAI22X1 U242 ( .A(\regs_matrix[3][1] ), .B(n364), .C(\regs_matrix[1][1] ), 
        .D(n367), .Y(n135) );
  OAI22X1 U243 ( .A(\regs_matrix[5][1] ), .B(n370), .C(\regs_matrix[7][1] ), 
        .D(n372), .Y(n134) );
  NAND2X1 U244 ( .A(n139), .B(n138), .Y(n137) );
  NOR2X1 U245 ( .A(n140), .B(n141), .Y(n139) );
  OAI22X1 U246 ( .A(\regs_matrix[8][2] ), .B(n66), .C(\regs_matrix[10][2] ), 
        .D(n353), .Y(n141) );
  OAI22X1 U247 ( .A(\regs_matrix[12][2] ), .B(n358), .C(\regs_matrix[14][2] ), 
        .D(n360), .Y(n140) );
  NOR2X1 U248 ( .A(n143), .B(n142), .Y(n138) );
  OAI22X1 U249 ( .A(\regs_matrix[11][2] ), .B(n365), .C(\regs_matrix[9][2] ), 
        .D(n368), .Y(n143) );
  OAI22X1 U250 ( .A(\regs_matrix[13][2] ), .B(n371), .C(\regs_matrix[15][2] ), 
        .D(n373), .Y(n142) );
  NAND2X1 U251 ( .A(n144), .B(n145), .Y(n136) );
  NOR2X1 U252 ( .A(n147), .B(n146), .Y(n145) );
  OAI22X1 U253 ( .A(outreg_data[2]), .B(n66), .C(\regs_matrix[2][2] ), .D(n353), .Y(n147) );
  OAI22X1 U254 ( .A(\regs_matrix[4][2] ), .B(n358), .C(\regs_matrix[6][2] ), 
        .D(n95), .Y(n146) );
  NOR2X1 U255 ( .A(n148), .B(n149), .Y(n144) );
  OAI22X1 U256 ( .A(\regs_matrix[3][2] ), .B(n365), .C(\regs_matrix[1][2] ), 
        .D(n367), .Y(n149) );
  OAI22X1 U257 ( .A(\regs_matrix[5][2] ), .B(n371), .C(\regs_matrix[7][2] ), 
        .D(n372), .Y(n148) );
  MUX2X1 U258 ( .B(n150), .A(n151), .S(n375), .Y(r1_data[3]) );
  NAND2X1 U259 ( .A(n152), .B(n153), .Y(n151) );
  NOR2X1 U260 ( .A(n154), .B(n155), .Y(n153) );
  OAI22X1 U261 ( .A(\regs_matrix[8][3] ), .B(n66), .C(\regs_matrix[10][3] ), 
        .D(n353), .Y(n155) );
  OAI22X1 U262 ( .A(\regs_matrix[12][3] ), .B(n357), .C(\regs_matrix[14][3] ), 
        .D(n360), .Y(n154) );
  NOR2X1 U263 ( .A(n156), .B(n157), .Y(n152) );
  OAI22X1 U264 ( .A(\regs_matrix[11][3] ), .B(n365), .C(\regs_matrix[9][3] ), 
        .D(n368), .Y(n157) );
  OAI22X1 U265 ( .A(\regs_matrix[13][3] ), .B(n370), .C(\regs_matrix[15][3] ), 
        .D(n372), .Y(n156) );
  NAND2X1 U266 ( .A(n158), .B(n159), .Y(n150) );
  NOR2X1 U267 ( .A(n160), .B(n161), .Y(n159) );
  OAI22X1 U268 ( .A(outreg_data[3]), .B(n66), .C(\regs_matrix[2][3] ), .D(n353), .Y(n161) );
  OAI22X1 U269 ( .A(\regs_matrix[4][3] ), .B(n357), .C(\regs_matrix[6][3] ), 
        .D(n361), .Y(n160) );
  NOR2X1 U270 ( .A(n162), .B(n163), .Y(n158) );
  OAI22X1 U271 ( .A(\regs_matrix[3][3] ), .B(n364), .C(\regs_matrix[1][3] ), 
        .D(n367), .Y(n163) );
  OAI22X1 U272 ( .A(\regs_matrix[5][3] ), .B(n370), .C(\regs_matrix[7][3] ), 
        .D(n373), .Y(n162) );
  MUX2X1 U273 ( .B(n164), .A(n165), .S(n374), .Y(r1_data[4]) );
  NAND2X1 U274 ( .A(n167), .B(n166), .Y(n165) );
  NOR2X1 U275 ( .A(n169), .B(n168), .Y(n167) );
  OAI22X1 U276 ( .A(\regs_matrix[8][4] ), .B(n60), .C(\regs_matrix[10][4] ), 
        .D(n64), .Y(n169) );
  OAI22X1 U277 ( .A(\regs_matrix[12][4] ), .B(n358), .C(\regs_matrix[14][4] ), 
        .D(n362), .Y(n168) );
  NOR2X1 U278 ( .A(n170), .B(n171), .Y(n166) );
  OAI22X1 U279 ( .A(\regs_matrix[11][4] ), .B(n363), .C(\regs_matrix[9][4] ), 
        .D(n368), .Y(n171) );
  OAI22X1 U280 ( .A(\regs_matrix[13][4] ), .B(n371), .C(\regs_matrix[15][4] ), 
        .D(n373), .Y(n170) );
  NAND2X1 U281 ( .A(n172), .B(n173), .Y(n164) );
  NOR2X1 U282 ( .A(n175), .B(n174), .Y(n173) );
  OAI22X1 U283 ( .A(outreg_data[4]), .B(n347), .C(\regs_matrix[2][4] ), .D(n64), .Y(n175) );
  OAI22X1 U284 ( .A(\regs_matrix[4][4] ), .B(n358), .C(\regs_matrix[6][4] ), 
        .D(n95), .Y(n174) );
  NOR2X1 U285 ( .A(n176), .B(n177), .Y(n172) );
  OAI22X1 U286 ( .A(\regs_matrix[3][4] ), .B(n365), .C(\regs_matrix[1][4] ), 
        .D(n368), .Y(n177) );
  OAI22X1 U287 ( .A(\regs_matrix[5][4] ), .B(n371), .C(\regs_matrix[7][4] ), 
        .D(n373), .Y(n176) );
  MUX2X1 U288 ( .B(n178), .A(n179), .S(n375), .Y(r1_data[5]) );
  NAND2X1 U289 ( .A(n181), .B(n180), .Y(n179) );
  NOR2X1 U290 ( .A(n183), .B(n182), .Y(n181) );
  OAI22X1 U291 ( .A(\regs_matrix[8][5] ), .B(n60), .C(\regs_matrix[10][5] ), 
        .D(n354), .Y(n183) );
  OAI22X1 U292 ( .A(\regs_matrix[12][5] ), .B(n358), .C(\regs_matrix[14][5] ), 
        .D(n361), .Y(n182) );
  NOR2X1 U293 ( .A(n184), .B(n185), .Y(n180) );
  OAI22X1 U294 ( .A(\regs_matrix[11][5] ), .B(n365), .C(\regs_matrix[9][5] ), 
        .D(n367), .Y(n185) );
  OAI22X1 U295 ( .A(\regs_matrix[13][5] ), .B(n371), .C(\regs_matrix[15][5] ), 
        .D(n373), .Y(n184) );
  NAND2X1 U296 ( .A(n187), .B(n186), .Y(n178) );
  NOR2X1 U297 ( .A(n188), .B(n189), .Y(n187) );
  OAI22X1 U298 ( .A(outreg_data[5]), .B(n60), .C(\regs_matrix[2][5] ), .D(n354), .Y(n189) );
  OAI22X1 U299 ( .A(\regs_matrix[4][5] ), .B(n358), .C(\regs_matrix[6][5] ), 
        .D(n362), .Y(n188) );
  NOR2X1 U300 ( .A(n190), .B(n191), .Y(n186) );
  OAI22X1 U301 ( .A(\regs_matrix[3][5] ), .B(n364), .C(\regs_matrix[1][5] ), 
        .D(n367), .Y(n191) );
  OAI22X1 U302 ( .A(\regs_matrix[5][5] ), .B(n371), .C(\regs_matrix[7][5] ), 
        .D(n372), .Y(n190) );
  NOR2X1 U303 ( .A(n195), .B(n194), .Y(n193) );
  OAI22X1 U304 ( .A(\regs_matrix[8][6] ), .B(n348), .C(\regs_matrix[10][6] ), 
        .D(n64), .Y(n195) );
  OAI22X1 U305 ( .A(\regs_matrix[12][6] ), .B(n358), .C(\regs_matrix[14][6] ), 
        .D(n360), .Y(n194) );
  NOR2X1 U306 ( .A(n196), .B(n197), .Y(n192) );
  OAI22X1 U307 ( .A(\regs_matrix[11][6] ), .B(n363), .C(\regs_matrix[9][6] ), 
        .D(n368), .Y(n197) );
  OAI22X1 U308 ( .A(\regs_matrix[13][6] ), .B(n371), .C(\regs_matrix[15][6] ), 
        .D(n372), .Y(n196) );
  NOR2X1 U309 ( .A(n200), .B(n201), .Y(n199) );
  OAI22X1 U310 ( .A(outreg_data[6]), .B(n347), .C(\regs_matrix[2][6] ), .D(n64), .Y(n201) );
  OAI22X1 U311 ( .A(\regs_matrix[4][6] ), .B(n358), .C(\regs_matrix[6][6] ), 
        .D(n95), .Y(n200) );
  NOR2X1 U312 ( .A(n202), .B(n203), .Y(n198) );
  OAI22X1 U313 ( .A(\regs_matrix[3][6] ), .B(n364), .C(\regs_matrix[1][6] ), 
        .D(n368), .Y(n203) );
  OAI22X1 U314 ( .A(\regs_matrix[5][6] ), .B(n371), .C(\regs_matrix[7][6] ), 
        .D(n373), .Y(n202) );
  MUX2X1 U315 ( .B(n204), .A(n205), .S(n375), .Y(r1_data[7]) );
  NAND2X1 U316 ( .A(n206), .B(n207), .Y(n205) );
  NOR2X1 U317 ( .A(n209), .B(n208), .Y(n207) );
  OAI22X1 U318 ( .A(\regs_matrix[8][7] ), .B(n347), .C(\regs_matrix[10][7] ), 
        .D(n354), .Y(n209) );
  OAI22X1 U319 ( .A(\regs_matrix[12][7] ), .B(n358), .C(\regs_matrix[14][7] ), 
        .D(n362), .Y(n208) );
  NOR2X1 U320 ( .A(n210), .B(n211), .Y(n206) );
  OAI22X1 U321 ( .A(\regs_matrix[11][7] ), .B(n363), .C(\regs_matrix[9][7] ), 
        .D(n367), .Y(n211) );
  OAI22X1 U322 ( .A(\regs_matrix[13][7] ), .B(n370), .C(\regs_matrix[15][7] ), 
        .D(n372), .Y(n210) );
  NAND2X1 U323 ( .A(n213), .B(n212), .Y(n204) );
  NOR2X1 U324 ( .A(n214), .B(n215), .Y(n213) );
  OAI22X1 U325 ( .A(outreg_data[7]), .B(n347), .C(\regs_matrix[2][7] ), .D(
        n354), .Y(n215) );
  OAI22X1 U326 ( .A(\regs_matrix[4][7] ), .B(n357), .C(\regs_matrix[6][7] ), 
        .D(n362), .Y(n214) );
  NOR2X1 U327 ( .A(n216), .B(n217), .Y(n212) );
  OAI22X1 U328 ( .A(\regs_matrix[3][7] ), .B(n364), .C(\regs_matrix[1][7] ), 
        .D(n367), .Y(n217) );
  OAI22X1 U329 ( .A(\regs_matrix[5][7] ), .B(n370), .C(\regs_matrix[7][7] ), 
        .D(n372), .Y(n216) );
  NOR2X1 U330 ( .A(n220), .B(n221), .Y(n219) );
  OAI22X1 U331 ( .A(\regs_matrix[8][8] ), .B(n347), .C(\regs_matrix[10][8] ), 
        .D(n354), .Y(n221) );
  OAI22X1 U332 ( .A(\regs_matrix[12][8] ), .B(n357), .C(\regs_matrix[14][8] ), 
        .D(n361), .Y(n220) );
  NOR2X1 U333 ( .A(n222), .B(n223), .Y(n218) );
  OAI22X1 U334 ( .A(\regs_matrix[11][8] ), .B(n363), .C(\regs_matrix[9][8] ), 
        .D(n368), .Y(n223) );
  OAI22X1 U335 ( .A(\regs_matrix[13][8] ), .B(n371), .C(\regs_matrix[15][8] ), 
        .D(n372), .Y(n222) );
  NOR2X1 U336 ( .A(n226), .B(n227), .Y(n225) );
  OAI22X1 U337 ( .A(outreg_data[8]), .B(n347), .C(\regs_matrix[2][8] ), .D(
        n354), .Y(n227) );
  OAI22X1 U338 ( .A(\regs_matrix[4][8] ), .B(n357), .C(\regs_matrix[6][8] ), 
        .D(n95), .Y(n226) );
  NOR2X1 U339 ( .A(n228), .B(n229), .Y(n224) );
  OAI22X1 U340 ( .A(\regs_matrix[3][8] ), .B(n363), .C(\regs_matrix[1][8] ), 
        .D(n368), .Y(n229) );
  OAI22X1 U341 ( .A(\regs_matrix[5][8] ), .B(n371), .C(\regs_matrix[7][8] ), 
        .D(n372), .Y(n228) );
  MUX2X1 U342 ( .B(n230), .A(n231), .S(n375), .Y(r1_data[9]) );
  NAND2X1 U343 ( .A(n232), .B(n233), .Y(n231) );
  NOR2X1 U344 ( .A(n235), .B(n234), .Y(n233) );
  OAI22X1 U345 ( .A(\regs_matrix[8][9] ), .B(n347), .C(\regs_matrix[10][9] ), 
        .D(n354), .Y(n235) );
  OAI22X1 U346 ( .A(\regs_matrix[12][9] ), .B(n357), .C(\regs_matrix[14][9] ), 
        .D(n360), .Y(n234) );
  NOR2X1 U347 ( .A(n236), .B(n237), .Y(n232) );
  OAI22X1 U348 ( .A(\regs_matrix[11][9] ), .B(n365), .C(\regs_matrix[9][9] ), 
        .D(n367), .Y(n237) );
  OAI22X1 U349 ( .A(\regs_matrix[13][9] ), .B(n370), .C(\regs_matrix[15][9] ), 
        .D(n373), .Y(n236) );
  NAND2X1 U350 ( .A(n238), .B(n239), .Y(n230) );
  NOR2X1 U351 ( .A(n240), .B(n241), .Y(n239) );
  OAI22X1 U352 ( .A(outreg_data[9]), .B(n347), .C(\regs_matrix[2][9] ), .D(
        n354), .Y(n241) );
  OAI22X1 U353 ( .A(\regs_matrix[4][9] ), .B(n357), .C(\regs_matrix[6][9] ), 
        .D(n361), .Y(n240) );
  NOR2X1 U354 ( .A(n243), .B(n242), .Y(n238) );
  OAI22X1 U355 ( .A(\regs_matrix[3][9] ), .B(n363), .C(\regs_matrix[1][9] ), 
        .D(n368), .Y(n243) );
  OAI22X1 U356 ( .A(\regs_matrix[5][9] ), .B(n370), .C(\regs_matrix[7][9] ), 
        .D(n373), .Y(n242) );
  MUX2X1 U357 ( .B(n244), .A(n245), .S(n374), .Y(r1_data[10]) );
  NAND2X1 U358 ( .A(n246), .B(n247), .Y(n245) );
  NOR2X1 U359 ( .A(n248), .B(n249), .Y(n247) );
  OAI22X1 U360 ( .A(\regs_matrix[8][10] ), .B(n348), .C(\regs_matrix[10][10] ), 
        .D(n56), .Y(n249) );
  OAI22X1 U361 ( .A(\regs_matrix[12][10] ), .B(n358), .C(\regs_matrix[14][10] ), .D(n361), .Y(n248) );
  NOR2X1 U362 ( .A(n250), .B(n251), .Y(n246) );
  OAI22X1 U363 ( .A(\regs_matrix[11][10] ), .B(n364), .C(\regs_matrix[9][10] ), 
        .D(n368), .Y(n251) );
  OAI22X1 U364 ( .A(\regs_matrix[13][10] ), .B(n371), .C(\regs_matrix[15][10] ), .D(n372), .Y(n250) );
  NAND2X1 U365 ( .A(n252), .B(n253), .Y(n244) );
  NOR2X1 U366 ( .A(n254), .B(n255), .Y(n253) );
  OAI22X1 U367 ( .A(n348), .B(outreg_data[10]), .C(\regs_matrix[2][10] ), .D(
        n56), .Y(n255) );
  OAI22X1 U368 ( .A(\regs_matrix[4][10] ), .B(n358), .C(\regs_matrix[6][10] ), 
        .D(n95), .Y(n254) );
  NOR2X1 U369 ( .A(n256), .B(n257), .Y(n252) );
  OAI22X1 U370 ( .A(\regs_matrix[3][10] ), .B(n364), .C(\regs_matrix[1][10] ), 
        .D(n367), .Y(n257) );
  OAI22X1 U371 ( .A(\regs_matrix[5][10] ), .B(n371), .C(\regs_matrix[7][10] ), 
        .D(n372), .Y(n256) );
  MUX2X1 U372 ( .B(n258), .A(n259), .S(n375), .Y(r1_data[11]) );
  NAND2X1 U373 ( .A(n261), .B(n260), .Y(n259) );
  NOR2X1 U374 ( .A(n262), .B(n263), .Y(n261) );
  OAI22X1 U375 ( .A(\regs_matrix[8][11] ), .B(n348), .C(\regs_matrix[10][11] ), 
        .D(n355), .Y(n263) );
  OAI22X1 U376 ( .A(\regs_matrix[12][11] ), .B(n357), .C(\regs_matrix[14][11] ), .D(n360), .Y(n262) );
  NOR2X1 U377 ( .A(n264), .B(n265), .Y(n260) );
  OAI22X1 U378 ( .A(\regs_matrix[11][11] ), .B(n363), .C(\regs_matrix[9][11] ), 
        .D(n368), .Y(n265) );
  OAI22X1 U379 ( .A(\regs_matrix[13][11] ), .B(n370), .C(\regs_matrix[15][11] ), .D(n372), .Y(n264) );
  NAND2X1 U380 ( .A(n266), .B(n267), .Y(n258) );
  NOR2X1 U381 ( .A(n268), .B(n269), .Y(n267) );
  OAI22X1 U382 ( .A(outreg_data[11]), .B(n347), .C(\regs_matrix[2][11] ), .D(
        n355), .Y(n269) );
  OAI22X1 U383 ( .A(\regs_matrix[4][11] ), .B(n357), .C(\regs_matrix[6][11] ), 
        .D(n360), .Y(n268) );
  NOR2X1 U384 ( .A(n270), .B(n271), .Y(n266) );
  OAI22X1 U385 ( .A(\regs_matrix[3][11] ), .B(n365), .C(\regs_matrix[1][11] ), 
        .D(n367), .Y(n271) );
  OAI22X1 U386 ( .A(\regs_matrix[5][11] ), .B(n370), .C(\regs_matrix[7][11] ), 
        .D(n372), .Y(n270) );
  NOR2X1 U387 ( .A(n274), .B(n275), .Y(n273) );
  OAI22X1 U388 ( .A(\regs_matrix[8][12] ), .B(n348), .C(\regs_matrix[10][12] ), 
        .D(n355), .Y(n275) );
  OAI22X1 U389 ( .A(\regs_matrix[12][12] ), .B(n357), .C(\regs_matrix[14][12] ), .D(n95), .Y(n274) );
  NOR2X1 U390 ( .A(n276), .B(n277), .Y(n272) );
  OAI22X1 U391 ( .A(\regs_matrix[11][12] ), .B(n364), .C(\regs_matrix[9][12] ), 
        .D(n368), .Y(n277) );
  OAI22X1 U392 ( .A(\regs_matrix[13][12] ), .B(n371), .C(\regs_matrix[15][12] ), .D(n372), .Y(n276) );
  NOR2X1 U393 ( .A(n280), .B(n281), .Y(n279) );
  OAI22X1 U394 ( .A(outreg_data[12]), .B(n348), .C(\regs_matrix[2][12] ), .D(
        n355), .Y(n281) );
  OAI22X1 U395 ( .A(\regs_matrix[4][12] ), .B(n358), .C(\regs_matrix[6][12] ), 
        .D(n95), .Y(n280) );
  NOR2X1 U396 ( .A(n282), .B(n283), .Y(n278) );
  OAI22X1 U397 ( .A(\regs_matrix[3][12] ), .B(n363), .C(\regs_matrix[1][12] ), 
        .D(n368), .Y(n283) );
  OAI22X1 U398 ( .A(\regs_matrix[5][12] ), .B(n371), .C(\regs_matrix[7][12] ), 
        .D(n373), .Y(n282) );
  MUX2X1 U399 ( .B(n284), .A(n285), .S(n375), .Y(r1_data[13]) );
  NAND2X1 U400 ( .A(n286), .B(n287), .Y(n285) );
  NOR2X1 U401 ( .A(n288), .B(n289), .Y(n287) );
  OAI22X1 U402 ( .A(\regs_matrix[8][13] ), .B(n348), .C(\regs_matrix[10][13] ), 
        .D(n355), .Y(n289) );
  OAI22X1 U403 ( .A(\regs_matrix[12][13] ), .B(n357), .C(\regs_matrix[14][13] ), .D(n361), .Y(n288) );
  NOR2X1 U404 ( .A(n291), .B(n290), .Y(n286) );
  OAI22X1 U405 ( .A(\regs_matrix[11][13] ), .B(n365), .C(\regs_matrix[9][13] ), 
        .D(n367), .Y(n291) );
  OAI22X1 U406 ( .A(\regs_matrix[13][13] ), .B(n371), .C(\regs_matrix[15][13] ), .D(n372), .Y(n290) );
  NAND2X1 U407 ( .A(n292), .B(n293), .Y(n284) );
  NOR2X1 U408 ( .A(n294), .B(n295), .Y(n293) );
  OAI22X1 U409 ( .A(outreg_data[13]), .B(n348), .C(\regs_matrix[2][13] ), .D(
        n355), .Y(n295) );
  OAI22X1 U410 ( .A(\regs_matrix[4][13] ), .B(n357), .C(\regs_matrix[6][13] ), 
        .D(n95), .Y(n294) );
  NOR2X1 U411 ( .A(n297), .B(n296), .Y(n292) );
  OAI22X1 U412 ( .A(\regs_matrix[3][13] ), .B(n364), .C(\regs_matrix[1][13] ), 
        .D(n367), .Y(n297) );
  OAI22X1 U413 ( .A(\regs_matrix[5][13] ), .B(n371), .C(\regs_matrix[7][13] ), 
        .D(n373), .Y(n296) );
  MUX2X1 U414 ( .B(n298), .A(n299), .S(n374), .Y(r1_data[14]) );
  NAND2X1 U415 ( .A(n300), .B(n301), .Y(n299) );
  NOR2X1 U416 ( .A(n303), .B(n302), .Y(n301) );
  OAI22X1 U417 ( .A(\regs_matrix[8][14] ), .B(n348), .C(\regs_matrix[10][14] ), 
        .D(n56), .Y(n303) );
  OAI22X1 U418 ( .A(\regs_matrix[12][14] ), .B(n358), .C(\regs_matrix[14][14] ), .D(n362), .Y(n302) );
  NOR2X1 U419 ( .A(n304), .B(n305), .Y(n300) );
  OAI22X1 U420 ( .A(\regs_matrix[11][14] ), .B(n365), .C(\regs_matrix[9][14] ), 
        .D(n367), .Y(n305) );
  OAI22X1 U421 ( .A(\regs_matrix[13][14] ), .B(n371), .C(\regs_matrix[15][14] ), .D(n373), .Y(n304) );
  NAND2X1 U422 ( .A(n307), .B(n306), .Y(n298) );
  NOR2X1 U423 ( .A(n308), .B(n309), .Y(n307) );
  OAI22X1 U424 ( .A(outreg_data[14]), .B(n348), .C(\regs_matrix[2][14] ), .D(
        n56), .Y(n309) );
  OAI22X1 U425 ( .A(\regs_matrix[4][14] ), .B(n358), .C(\regs_matrix[6][14] ), 
        .D(n95), .Y(n308) );
  NOR2X1 U426 ( .A(n310), .B(n311), .Y(n306) );
  OAI22X1 U427 ( .A(\regs_matrix[3][14] ), .B(n363), .C(\regs_matrix[1][14] ), 
        .D(n367), .Y(n311) );
  OAI22X1 U428 ( .A(\regs_matrix[5][14] ), .B(n371), .C(\regs_matrix[7][14] ), 
        .D(n372), .Y(n310) );
  NAND2X1 U429 ( .A(n314), .B(n315), .Y(n313) );
  NOR2X1 U430 ( .A(n317), .B(n316), .Y(n315) );
  OAI22X1 U431 ( .A(\regs_matrix[8][15] ), .B(n348), .C(\regs_matrix[10][15] ), 
        .D(n355), .Y(n317) );
  OAI22X1 U432 ( .A(\regs_matrix[12][15] ), .B(n357), .C(\regs_matrix[14][15] ), .D(n362), .Y(n316) );
  NOR2X1 U433 ( .A(n318), .B(n319), .Y(n314) );
  OAI22X1 U434 ( .A(\regs_matrix[11][15] ), .B(n365), .C(\regs_matrix[9][15] ), 
        .D(n368), .Y(n319) );
  OAI22X1 U435 ( .A(\regs_matrix[13][15] ), .B(n370), .C(\regs_matrix[15][15] ), .D(n373), .Y(n318) );
  NAND2X1 U436 ( .A(n320), .B(n321), .Y(n312) );
  NOR2X1 U437 ( .A(n322), .B(n323), .Y(n321) );
  OAI22X1 U438 ( .A(outreg_data[15]), .B(n348), .C(\regs_matrix[2][15] ), .D(
        n355), .Y(n323) );
  OAI22X1 U439 ( .A(\regs_matrix[4][15] ), .B(n358), .C(\regs_matrix[6][15] ), 
        .D(n361), .Y(n322) );
  NOR2X1 U440 ( .A(n324), .B(n325), .Y(n320) );
  OAI22X1 U441 ( .A(\regs_matrix[3][15] ), .B(n364), .C(\regs_matrix[1][15] ), 
        .D(n367), .Y(n325) );
  OAI22X1 U442 ( .A(\regs_matrix[5][15] ), .B(n370), .C(\regs_matrix[7][15] ), 
        .D(n373), .Y(n324) );
  NOR2X1 U443 ( .A(n326), .B(n327), .Y(n99) );
  OAI21X1 U444 ( .A(\regs_matrix[6][16] ), .B(n95), .C(n328), .Y(n327) );
  AOI22X1 U445 ( .A(n352), .B(n329), .C(n75), .D(n330), .Y(n328) );
  INVX2 U446 ( .A(outreg_data[16]), .Y(n330) );
  INVX2 U447 ( .A(\regs_matrix[2][16] ), .Y(n329) );
  OAI21X1 U448 ( .A(\regs_matrix[4][16] ), .B(n358), .C(n376), .Y(n326) );
  NOR2X1 U449 ( .A(n331), .B(n332), .Y(n100) );
  OAI22X1 U450 ( .A(\regs_matrix[3][16] ), .B(n363), .C(\regs_matrix[1][16] ), 
        .D(n368), .Y(n332) );
  OAI22X1 U451 ( .A(\regs_matrix[5][16] ), .B(n371), .C(\regs_matrix[7][16] ), 
        .D(n72), .Y(n331) );
  NOR2X1 U452 ( .A(n333), .B(n334), .Y(n101) );
  OAI21X1 U453 ( .A(\regs_matrix[12][16] ), .B(n358), .C(n335), .Y(n334) );
  AOI22X1 U454 ( .A(n350), .B(n336), .C(n75), .D(n623), .Y(n335) );
  NAND3X1 U455 ( .A(n337), .B(n338), .C(n339), .Y(n108) );
  INVX2 U456 ( .A(\regs_matrix[10][16] ), .Y(n336) );
  NAND3X1 U457 ( .A(N11), .B(n338), .C(n339), .Y(n109) );
  NAND3X1 U458 ( .A(n337), .B(n63), .C(n339), .Y(n110) );
  OAI22X1 U459 ( .A(\regs_matrix[9][16] ), .B(n368), .C(\regs_matrix[14][16] ), 
        .D(n360), .Y(n333) );
  NAND3X1 U460 ( .A(N11), .B(N12), .C(n339), .Y(n111) );
  INVX2 U461 ( .A(N10), .Y(n339) );
  NAND3X1 U462 ( .A(N10), .B(n337), .C(n338), .Y(n114) );
  NOR2X1 U463 ( .A(n340), .B(n341), .Y(n102) );
  OAI21X1 U464 ( .A(\regs_matrix[11][16] ), .B(n364), .C(n374), .Y(n341) );
  OAI22X1 U465 ( .A(\regs_matrix[15][16] ), .B(n72), .C(\regs_matrix[13][16] ), 
        .D(n370), .Y(n340) );
  INVX2 U466 ( .A(N11), .Y(n337) );
  BUFX4 U467 ( .A(n342), .Y(n343) );
  BUFX4 U468 ( .A(n342), .Y(n344) );
  BUFX4 U469 ( .A(n342), .Y(n345) );
  INVX8 U470 ( .A(n344), .Y(n347) );
  INVX8 U471 ( .A(n343), .Y(n348) );
  BUFX4 U472 ( .A(n349), .Y(n350) );
  BUFX4 U473 ( .A(n349), .Y(n351) );
  BUFX4 U474 ( .A(n349), .Y(n352) );
  INVX8 U475 ( .A(n351), .Y(n353) );
  INVX8 U476 ( .A(n350), .Y(n354) );
  INVX8 U477 ( .A(n356), .Y(n358) );
  INVX8 U478 ( .A(n366), .Y(n367) );
  INVX8 U479 ( .A(n366), .Y(n368) );
  INVX8 U480 ( .A(n369), .Y(n371) );
  INVX8 U481 ( .A(n57), .Y(n372) );
  INVX8 U482 ( .A(n58), .Y(n373) );
  INVX2 U483 ( .A(n108), .Y(n342) );
  INVX2 U484 ( .A(n109), .Y(n349) );
  AND2X1 U485 ( .A(n116), .B(n117), .Y(n378) );
  MUX2X1 U486 ( .B(n378), .A(n377), .S(n374), .Y(n379) );
  INVX4 U487 ( .A(n115), .Y(n369) );
  INVX4 U488 ( .A(n110), .Y(n356) );
  INVX4 U489 ( .A(n74), .Y(n363) );
  INVX8 U490 ( .A(n369), .Y(n370) );
  INVX4 U491 ( .A(n114), .Y(n366) );
  INVX4 U492 ( .A(n73), .Y(n364) );
  INVX4 U493 ( .A(n74), .Y(n365) );
  INVX4 U494 ( .A(N12), .Y(n338) );
  AOI22X1 U495 ( .A(n383), .B(n382), .C(n381), .D(n380), .Y(n384) );
  INVX2 U496 ( .A(n384), .Y(r2_data[16]) );
  MUX2X1 U497 ( .B(n385), .A(n386), .S(n659), .Y(r2_data[0]) );
  NAND2X1 U498 ( .A(n388), .B(n387), .Y(n386) );
  NOR2X1 U499 ( .A(n389), .B(n390), .Y(n388) );
  OAI22X1 U500 ( .A(\regs_matrix[8][0] ), .B(n663), .C(\regs_matrix[10][0] ), 
        .D(n638), .Y(n390) );
  OAI22X1 U501 ( .A(\regs_matrix[12][0] ), .B(n642), .C(\regs_matrix[14][0] ), 
        .D(n647), .Y(n389) );
  NOR2X1 U502 ( .A(n396), .B(n395), .Y(n387) );
  OAI22X1 U503 ( .A(\regs_matrix[11][0] ), .B(n19), .C(\regs_matrix[9][0] ), 
        .D(n651), .Y(n396) );
  OAI22X1 U504 ( .A(\regs_matrix[13][0] ), .B(n655), .C(\regs_matrix[15][0] ), 
        .D(n657), .Y(n395) );
  NAND2X1 U505 ( .A(n399), .B(n400), .Y(n385) );
  NOR2X1 U506 ( .A(n402), .B(n401), .Y(n400) );
  OAI22X1 U507 ( .A(outreg_data[0]), .B(n662), .C(\regs_matrix[2][0] ), .D(
        n638), .Y(n402) );
  OAI22X1 U508 ( .A(\regs_matrix[4][0] ), .B(n642), .C(\regs_matrix[6][0] ), 
        .D(n647), .Y(n401) );
  NOR2X1 U509 ( .A(n404), .B(n403), .Y(n399) );
  OAI22X1 U510 ( .A(\regs_matrix[3][0] ), .B(n18), .C(\regs_matrix[1][0] ), 
        .D(n651), .Y(n404) );
  OAI22X1 U511 ( .A(\regs_matrix[5][0] ), .B(n653), .C(\regs_matrix[7][0] ), 
        .D(n82), .Y(n403) );
  MUX2X1 U512 ( .B(n405), .A(n406), .S(N17), .Y(r2_data[1]) );
  NAND2X1 U513 ( .A(n407), .B(n408), .Y(n406) );
  NOR2X1 U514 ( .A(n409), .B(n410), .Y(n408) );
  OAI22X1 U515 ( .A(\regs_matrix[8][1] ), .B(n663), .C(\regs_matrix[10][1] ), 
        .D(n638), .Y(n410) );
  OAI22X1 U516 ( .A(\regs_matrix[12][1] ), .B(n642), .C(\regs_matrix[14][1] ), 
        .D(n647), .Y(n409) );
  NOR2X1 U517 ( .A(n411), .B(n412), .Y(n407) );
  OAI22X1 U518 ( .A(\regs_matrix[11][1] ), .B(n41), .C(\regs_matrix[9][1] ), 
        .D(n651), .Y(n412) );
  OAI22X1 U519 ( .A(\regs_matrix[13][1] ), .B(n653), .C(\regs_matrix[15][1] ), 
        .D(n2), .Y(n411) );
  NAND2X1 U520 ( .A(n413), .B(n414), .Y(n405) );
  NOR2X1 U521 ( .A(n415), .B(n416), .Y(n414) );
  OAI22X1 U522 ( .A(outreg_data[1]), .B(n662), .C(\regs_matrix[2][1] ), .D(
        n638), .Y(n416) );
  OAI22X1 U523 ( .A(\regs_matrix[4][1] ), .B(n642), .C(\regs_matrix[6][1] ), 
        .D(n647), .Y(n415) );
  NOR2X1 U524 ( .A(n417), .B(n418), .Y(n413) );
  OAI22X1 U525 ( .A(\regs_matrix[3][1] ), .B(n43), .C(\regs_matrix[1][1] ), 
        .D(n651), .Y(n418) );
  OAI22X1 U526 ( .A(\regs_matrix[5][1] ), .B(n655), .C(\regs_matrix[7][1] ), 
        .D(n2), .Y(n417) );
  MUX2X1 U527 ( .B(n419), .A(n420), .S(n659), .Y(r2_data[2]) );
  NAND2X1 U528 ( .A(n421), .B(n422), .Y(n420) );
  NOR2X1 U529 ( .A(n423), .B(n424), .Y(n422) );
  OAI22X1 U530 ( .A(\regs_matrix[8][2] ), .B(n663), .C(\regs_matrix[10][2] ), 
        .D(n638), .Y(n424) );
  OAI22X1 U531 ( .A(\regs_matrix[12][2] ), .B(n642), .C(\regs_matrix[14][2] ), 
        .D(n646), .Y(n423) );
  NOR2X1 U532 ( .A(n425), .B(n426), .Y(n421) );
  OAI22X1 U533 ( .A(\regs_matrix[11][2] ), .B(n23), .C(\regs_matrix[9][2] ), 
        .D(n651), .Y(n426) );
  OAI22X1 U534 ( .A(\regs_matrix[13][2] ), .B(n653), .C(\regs_matrix[15][2] ), 
        .D(n656), .Y(n425) );
  NAND2X1 U535 ( .A(n427), .B(n428), .Y(n419) );
  NOR2X1 U536 ( .A(n429), .B(n430), .Y(n428) );
  OAI22X1 U537 ( .A(outreg_data[2]), .B(n662), .C(\regs_matrix[2][2] ), .D(
        n638), .Y(n430) );
  OAI22X1 U538 ( .A(\regs_matrix[4][2] ), .B(n642), .C(\regs_matrix[6][2] ), 
        .D(n646), .Y(n429) );
  NOR2X1 U539 ( .A(n431), .B(n432), .Y(n427) );
  OAI22X1 U540 ( .A(\regs_matrix[3][2] ), .B(n20), .C(\regs_matrix[1][2] ), 
        .D(n651), .Y(n432) );
  OAI22X1 U541 ( .A(\regs_matrix[5][2] ), .B(n655), .C(\regs_matrix[7][2] ), 
        .D(n2), .Y(n431) );
  MUX2X1 U542 ( .B(n433), .A(n434), .S(N17), .Y(r2_data[3]) );
  NAND2X1 U543 ( .A(n435), .B(n436), .Y(n434) );
  NOR2X1 U544 ( .A(n437), .B(n438), .Y(n436) );
  OAI22X1 U545 ( .A(\regs_matrix[8][3] ), .B(n663), .C(\regs_matrix[10][3] ), 
        .D(n638), .Y(n438) );
  OAI22X1 U546 ( .A(\regs_matrix[12][3] ), .B(n642), .C(\regs_matrix[14][3] ), 
        .D(n647), .Y(n437) );
  NOR2X1 U547 ( .A(n439), .B(n440), .Y(n435) );
  OAI22X1 U548 ( .A(\regs_matrix[11][3] ), .B(n50), .C(\regs_matrix[9][3] ), 
        .D(n651), .Y(n440) );
  OAI22X1 U549 ( .A(\regs_matrix[13][3] ), .B(n655), .C(\regs_matrix[15][3] ), 
        .D(n656), .Y(n439) );
  NAND2X1 U550 ( .A(n441), .B(n442), .Y(n433) );
  NOR2X1 U551 ( .A(n443), .B(n444), .Y(n442) );
  OAI22X1 U552 ( .A(outreg_data[3]), .B(n662), .C(\regs_matrix[2][3] ), .D(
        n638), .Y(n444) );
  OAI22X1 U553 ( .A(\regs_matrix[4][3] ), .B(n642), .C(\regs_matrix[6][3] ), 
        .D(n647), .Y(n443) );
  NOR2X1 U554 ( .A(n445), .B(n446), .Y(n441) );
  OAI22X1 U555 ( .A(\regs_matrix[3][3] ), .B(n45), .C(\regs_matrix[1][3] ), 
        .D(n651), .Y(n446) );
  OAI22X1 U556 ( .A(\regs_matrix[5][3] ), .B(n655), .C(\regs_matrix[7][3] ), 
        .D(n3), .Y(n445) );
  MUX2X1 U557 ( .B(n447), .A(n448), .S(n659), .Y(r2_data[4]) );
  NAND2X1 U558 ( .A(n449), .B(n450), .Y(n448) );
  NOR2X1 U559 ( .A(n451), .B(n452), .Y(n450) );
  OAI22X1 U560 ( .A(\regs_matrix[8][4] ), .B(n632), .C(\regs_matrix[10][4] ), 
        .D(n639), .Y(n452) );
  OAI22X1 U561 ( .A(\regs_matrix[12][4] ), .B(n643), .C(\regs_matrix[14][4] ), 
        .D(n647), .Y(n451) );
  NOR2X1 U562 ( .A(n453), .B(n454), .Y(n449) );
  OAI22X1 U563 ( .A(\regs_matrix[11][4] ), .B(n35), .C(\regs_matrix[9][4] ), 
        .D(n651), .Y(n454) );
  OAI22X1 U564 ( .A(\regs_matrix[13][4] ), .B(n654), .C(\regs_matrix[15][4] ), 
        .D(n82), .Y(n453) );
  NAND2X1 U565 ( .A(n455), .B(n456), .Y(n447) );
  NOR2X1 U566 ( .A(n457), .B(n458), .Y(n456) );
  OAI22X1 U567 ( .A(outreg_data[4]), .B(n632), .C(\regs_matrix[2][4] ), .D(
        n639), .Y(n458) );
  OAI22X1 U568 ( .A(\regs_matrix[4][4] ), .B(n643), .C(\regs_matrix[6][4] ), 
        .D(n647), .Y(n457) );
  NOR2X1 U569 ( .A(n459), .B(n460), .Y(n455) );
  OAI22X1 U570 ( .A(\regs_matrix[3][4] ), .B(n44), .C(\regs_matrix[1][4] ), 
        .D(n651), .Y(n460) );
  OAI22X1 U571 ( .A(\regs_matrix[5][4] ), .B(n654), .C(\regs_matrix[7][4] ), 
        .D(n656), .Y(n459) );
  MUX2X1 U572 ( .B(n461), .A(n462), .S(N17), .Y(r2_data[5]) );
  NAND2X1 U573 ( .A(n463), .B(n464), .Y(n462) );
  NOR2X1 U574 ( .A(n465), .B(n466), .Y(n464) );
  OAI22X1 U575 ( .A(\regs_matrix[8][5] ), .B(n633), .C(\regs_matrix[10][5] ), 
        .D(n639), .Y(n466) );
  OAI22X1 U576 ( .A(\regs_matrix[12][5] ), .B(n643), .C(\regs_matrix[14][5] ), 
        .D(n646), .Y(n465) );
  NOR2X1 U577 ( .A(n467), .B(n468), .Y(n463) );
  OAI22X1 U578 ( .A(\regs_matrix[11][5] ), .B(n46), .C(\regs_matrix[9][5] ), 
        .D(n651), .Y(n468) );
  OAI22X1 U579 ( .A(\regs_matrix[13][5] ), .B(n654), .C(\regs_matrix[15][5] ), 
        .D(n65), .Y(n467) );
  NAND2X1 U580 ( .A(n469), .B(n470), .Y(n461) );
  NOR2X1 U581 ( .A(n471), .B(n472), .Y(n470) );
  OAI22X1 U582 ( .A(outreg_data[5]), .B(n632), .C(\regs_matrix[2][5] ), .D(
        n639), .Y(n472) );
  OAI22X1 U583 ( .A(\regs_matrix[4][5] ), .B(n643), .C(\regs_matrix[6][5] ), 
        .D(n646), .Y(n471) );
  NOR2X1 U584 ( .A(n473), .B(n474), .Y(n469) );
  OAI22X1 U585 ( .A(\regs_matrix[3][5] ), .B(n36), .C(\regs_matrix[1][5] ), 
        .D(n651), .Y(n474) );
  OAI22X1 U586 ( .A(\regs_matrix[5][5] ), .B(n654), .C(\regs_matrix[7][5] ), 
        .D(n82), .Y(n473) );
  MUX2X1 U587 ( .B(n475), .A(n476), .S(n659), .Y(r2_data[6]) );
  NAND2X1 U588 ( .A(n477), .B(n478), .Y(n476) );
  NOR2X1 U589 ( .A(n479), .B(n480), .Y(n478) );
  OAI22X1 U590 ( .A(\regs_matrix[8][6] ), .B(n632), .C(\regs_matrix[10][6] ), 
        .D(n639), .Y(n480) );
  OAI22X1 U591 ( .A(\regs_matrix[12][6] ), .B(n643), .C(\regs_matrix[14][6] ), 
        .D(n646), .Y(n479) );
  NOR2X1 U592 ( .A(n481), .B(n482), .Y(n477) );
  OAI22X1 U593 ( .A(\regs_matrix[11][6] ), .B(n31), .C(\regs_matrix[9][6] ), 
        .D(n650), .Y(n482) );
  OAI22X1 U594 ( .A(\regs_matrix[13][6] ), .B(n654), .C(\regs_matrix[15][6] ), 
        .D(n82), .Y(n481) );
  NAND2X1 U595 ( .A(n483), .B(n484), .Y(n475) );
  NOR2X1 U596 ( .A(n485), .B(n486), .Y(n484) );
  OAI22X1 U597 ( .A(outreg_data[6]), .B(n633), .C(\regs_matrix[2][6] ), .D(
        n639), .Y(n486) );
  OAI22X1 U598 ( .A(\regs_matrix[4][6] ), .B(n643), .C(\regs_matrix[6][6] ), 
        .D(n646), .Y(n485) );
  NOR2X1 U599 ( .A(n487), .B(n488), .Y(n483) );
  OAI22X1 U600 ( .A(\regs_matrix[3][6] ), .B(n25), .C(\regs_matrix[1][6] ), 
        .D(n650), .Y(n488) );
  OAI22X1 U601 ( .A(\regs_matrix[5][6] ), .B(n654), .C(\regs_matrix[7][6] ), 
        .D(n65), .Y(n487) );
  MUX2X1 U602 ( .B(n489), .A(n490), .S(N17), .Y(r2_data[7]) );
  NAND2X1 U603 ( .A(n491), .B(n492), .Y(n490) );
  NOR2X1 U604 ( .A(n493), .B(n494), .Y(n492) );
  OAI22X1 U605 ( .A(\regs_matrix[8][7] ), .B(n632), .C(\regs_matrix[10][7] ), 
        .D(n639), .Y(n494) );
  OAI22X1 U606 ( .A(\regs_matrix[12][7] ), .B(n643), .C(\regs_matrix[14][7] ), 
        .D(n648), .Y(n493) );
  NOR2X1 U607 ( .A(n495), .B(n496), .Y(n491) );
  OAI22X1 U608 ( .A(\regs_matrix[11][7] ), .B(n33), .C(\regs_matrix[9][7] ), 
        .D(n650), .Y(n496) );
  OAI22X1 U609 ( .A(\regs_matrix[13][7] ), .B(n653), .C(\regs_matrix[15][7] ), 
        .D(n657), .Y(n495) );
  NAND2X1 U610 ( .A(n497), .B(n498), .Y(n489) );
  NOR2X1 U611 ( .A(n499), .B(n500), .Y(n498) );
  OAI22X1 U612 ( .A(outreg_data[7]), .B(n633), .C(\regs_matrix[2][7] ), .D(
        n639), .Y(n500) );
  OAI22X1 U613 ( .A(\regs_matrix[4][7] ), .B(n643), .C(\regs_matrix[6][7] ), 
        .D(n648), .Y(n499) );
  NOR2X1 U614 ( .A(n501), .B(n502), .Y(n497) );
  OAI22X1 U615 ( .A(\regs_matrix[3][7] ), .B(n34), .C(\regs_matrix[1][7] ), 
        .D(n650), .Y(n502) );
  OAI22X1 U616 ( .A(\regs_matrix[5][7] ), .B(n655), .C(\regs_matrix[7][7] ), 
        .D(n657), .Y(n501) );
  MUX2X1 U617 ( .B(n503), .A(n504), .S(n659), .Y(r2_data[8]) );
  NAND2X1 U618 ( .A(n505), .B(n506), .Y(n504) );
  NOR2X1 U619 ( .A(n507), .B(n508), .Y(n506) );
  OAI22X1 U620 ( .A(\regs_matrix[8][8] ), .B(n663), .C(\regs_matrix[10][8] ), 
        .D(n639), .Y(n508) );
  OAI22X1 U621 ( .A(\regs_matrix[12][8] ), .B(n643), .C(\regs_matrix[14][8] ), 
        .D(n646), .Y(n507) );
  NOR2X1 U622 ( .A(n509), .B(n510), .Y(n505) );
  OAI22X1 U623 ( .A(\regs_matrix[11][8] ), .B(n37), .C(\regs_matrix[9][8] ), 
        .D(n650), .Y(n510) );
  OAI22X1 U624 ( .A(\regs_matrix[13][8] ), .B(n653), .C(\regs_matrix[15][8] ), 
        .D(n65), .Y(n509) );
  NAND2X1 U625 ( .A(n511), .B(n512), .Y(n503) );
  NOR2X1 U626 ( .A(n513), .B(n514), .Y(n512) );
  OAI22X1 U627 ( .A(outreg_data[8]), .B(n633), .C(\regs_matrix[2][8] ), .D(
        n639), .Y(n514) );
  OAI22X1 U628 ( .A(\regs_matrix[4][8] ), .B(n643), .C(\regs_matrix[6][8] ), 
        .D(n648), .Y(n513) );
  NOR2X1 U629 ( .A(n515), .B(n516), .Y(n511) );
  OAI22X1 U630 ( .A(\regs_matrix[3][8] ), .B(n30), .C(\regs_matrix[1][8] ), 
        .D(n650), .Y(n516) );
  OAI22X1 U631 ( .A(\regs_matrix[5][8] ), .B(n654), .C(\regs_matrix[7][8] ), 
        .D(n656), .Y(n515) );
  MUX2X1 U632 ( .B(n517), .A(n518), .S(N17), .Y(r2_data[9]) );
  NAND2X1 U633 ( .A(n519), .B(n520), .Y(n518) );
  NOR2X1 U634 ( .A(n521), .B(n522), .Y(n520) );
  OAI22X1 U635 ( .A(\regs_matrix[8][9] ), .B(n632), .C(\regs_matrix[10][9] ), 
        .D(n639), .Y(n522) );
  OAI22X1 U636 ( .A(\regs_matrix[12][9] ), .B(n643), .C(\regs_matrix[14][9] ), 
        .D(n646), .Y(n521) );
  NOR2X1 U637 ( .A(n523), .B(n524), .Y(n519) );
  OAI22X1 U638 ( .A(\regs_matrix[11][9] ), .B(n27), .C(\regs_matrix[9][9] ), 
        .D(n650), .Y(n524) );
  OAI22X1 U639 ( .A(\regs_matrix[13][9] ), .B(n653), .C(\regs_matrix[15][9] ), 
        .D(n65), .Y(n523) );
  NAND2X1 U640 ( .A(n525), .B(n526), .Y(n517) );
  NOR2X1 U641 ( .A(n527), .B(n528), .Y(n526) );
  OAI22X1 U642 ( .A(outreg_data[9]), .B(n633), .C(\regs_matrix[2][9] ), .D(
        n639), .Y(n528) );
  OAI22X1 U643 ( .A(\regs_matrix[4][9] ), .B(n643), .C(\regs_matrix[6][9] ), 
        .D(n648), .Y(n527) );
  NOR2X1 U644 ( .A(n529), .B(n530), .Y(n525) );
  OAI22X1 U645 ( .A(\regs_matrix[3][9] ), .B(n28), .C(\regs_matrix[1][9] ), 
        .D(n650), .Y(n530) );
  OAI22X1 U646 ( .A(\regs_matrix[5][9] ), .B(n655), .C(\regs_matrix[7][9] ), 
        .D(n3), .Y(n529) );
  MUX2X1 U647 ( .B(n531), .A(n532), .S(n659), .Y(r2_data[10]) );
  NAND2X1 U648 ( .A(n533), .B(n534), .Y(n532) );
  NOR2X1 U649 ( .A(n535), .B(n536), .Y(n534) );
  OAI22X1 U650 ( .A(\regs_matrix[8][10] ), .B(n632), .C(\regs_matrix[10][10] ), 
        .D(n640), .Y(n536) );
  OAI22X1 U651 ( .A(\regs_matrix[12][10] ), .B(n643), .C(\regs_matrix[14][10] ), .D(n648), .Y(n535) );
  NOR2X1 U652 ( .A(n537), .B(n538), .Y(n533) );
  OAI22X1 U653 ( .A(\regs_matrix[11][10] ), .B(n52), .C(\regs_matrix[9][10] ), 
        .D(n650), .Y(n538) );
  OAI22X1 U654 ( .A(\regs_matrix[13][10] ), .B(n653), .C(\regs_matrix[15][10] ), .D(n656), .Y(n537) );
  NAND2X1 U655 ( .A(n539), .B(n540), .Y(n531) );
  NOR2X1 U656 ( .A(n541), .B(n542), .Y(n540) );
  OAI22X1 U657 ( .A(outreg_data[10]), .B(n633), .C(\regs_matrix[2][10] ), .D(
        n640), .Y(n542) );
  OAI22X1 U658 ( .A(\regs_matrix[4][10] ), .B(n644), .C(\regs_matrix[6][10] ), 
        .D(n646), .Y(n541) );
  NOR2X1 U659 ( .A(n543), .B(n544), .Y(n539) );
  OAI22X1 U660 ( .A(\regs_matrix[3][10] ), .B(n48), .C(\regs_matrix[1][10] ), 
        .D(n650), .Y(n544) );
  OAI22X1 U661 ( .A(\regs_matrix[5][10] ), .B(n655), .C(\regs_matrix[7][10] ), 
        .D(n3), .Y(n543) );
  MUX2X1 U662 ( .B(n545), .A(n546), .S(N17), .Y(r2_data[11]) );
  NAND2X1 U663 ( .A(n547), .B(n548), .Y(n546) );
  NOR2X1 U664 ( .A(n549), .B(n550), .Y(n548) );
  OAI22X1 U665 ( .A(\regs_matrix[8][11] ), .B(n633), .C(\regs_matrix[10][11] ), 
        .D(n640), .Y(n550) );
  OAI22X1 U666 ( .A(\regs_matrix[12][11] ), .B(n644), .C(\regs_matrix[14][11] ), .D(n646), .Y(n549) );
  NOR2X1 U667 ( .A(n551), .B(n552), .Y(n547) );
  OAI22X1 U668 ( .A(\regs_matrix[11][11] ), .B(n24), .C(\regs_matrix[9][11] ), 
        .D(n650), .Y(n552) );
  OAI22X1 U669 ( .A(\regs_matrix[13][11] ), .B(n653), .C(\regs_matrix[15][11] ), .D(n656), .Y(n551) );
  NAND2X1 U670 ( .A(n553), .B(n554), .Y(n545) );
  NOR2X1 U671 ( .A(n555), .B(n556), .Y(n554) );
  OAI22X1 U672 ( .A(outreg_data[11]), .B(n633), .C(\regs_matrix[2][11] ), .D(
        n640), .Y(n556) );
  OAI22X1 U673 ( .A(\regs_matrix[4][11] ), .B(n644), .C(\regs_matrix[6][11] ), 
        .D(n648), .Y(n555) );
  NOR2X1 U674 ( .A(n557), .B(n558), .Y(n553) );
  OAI22X1 U675 ( .A(\regs_matrix[3][11] ), .B(n21), .C(\regs_matrix[1][11] ), 
        .D(n650), .Y(n558) );
  OAI22X1 U676 ( .A(\regs_matrix[5][11] ), .B(n655), .C(\regs_matrix[7][11] ), 
        .D(n65), .Y(n557) );
  MUX2X1 U677 ( .B(n559), .A(n560), .S(n659), .Y(r2_data[12]) );
  NAND2X1 U678 ( .A(n561), .B(n562), .Y(n560) );
  NOR2X1 U679 ( .A(n563), .B(n564), .Y(n562) );
  OAI22X1 U680 ( .A(\regs_matrix[8][12] ), .B(n633), .C(\regs_matrix[10][12] ), 
        .D(n640), .Y(n564) );
  OAI22X1 U681 ( .A(\regs_matrix[12][12] ), .B(n644), .C(\regs_matrix[14][12] ), .D(n648), .Y(n563) );
  NOR2X1 U682 ( .A(n565), .B(n566), .Y(n561) );
  OAI22X1 U683 ( .A(\regs_matrix[11][12] ), .B(n42), .C(\regs_matrix[9][12] ), 
        .D(n651), .Y(n566) );
  OAI22X1 U684 ( .A(\regs_matrix[13][12] ), .B(n653), .C(\regs_matrix[15][12] ), .D(n657), .Y(n565) );
  NAND2X1 U685 ( .A(n567), .B(n568), .Y(n559) );
  NOR2X1 U686 ( .A(n569), .B(n570), .Y(n568) );
  OAI22X1 U687 ( .A(outreg_data[12]), .B(n633), .C(\regs_matrix[2][12] ), .D(
        n640), .Y(n570) );
  OAI22X1 U688 ( .A(\regs_matrix[4][12] ), .B(n644), .C(\regs_matrix[6][12] ), 
        .D(n648), .Y(n569) );
  NOR2X1 U689 ( .A(n571), .B(n572), .Y(n567) );
  OAI22X1 U690 ( .A(\regs_matrix[3][12] ), .B(n47), .C(\regs_matrix[1][12] ), 
        .D(n651), .Y(n572) );
  OAI22X1 U691 ( .A(\regs_matrix[5][12] ), .B(n655), .C(\regs_matrix[7][12] ), 
        .D(n656), .Y(n571) );
  MUX2X1 U692 ( .B(n573), .A(n574), .S(n659), .Y(r2_data[13]) );
  NAND2X1 U693 ( .A(n575), .B(n576), .Y(n574) );
  NOR2X1 U694 ( .A(n577), .B(n578), .Y(n576) );
  OAI22X1 U695 ( .A(\regs_matrix[8][13] ), .B(n633), .C(\regs_matrix[10][13] ), 
        .D(n640), .Y(n578) );
  OAI22X1 U696 ( .A(\regs_matrix[12][13] ), .B(n644), .C(\regs_matrix[14][13] ), .D(n646), .Y(n577) );
  NOR2X1 U697 ( .A(n579), .B(n580), .Y(n575) );
  OAI22X1 U698 ( .A(\regs_matrix[11][13] ), .B(n22), .C(\regs_matrix[9][13] ), 
        .D(n651), .Y(n580) );
  OAI22X1 U699 ( .A(\regs_matrix[13][13] ), .B(n655), .C(\regs_matrix[15][13] ), .D(n82), .Y(n579) );
  NAND2X1 U700 ( .A(n581), .B(n582), .Y(n573) );
  NOR2X1 U701 ( .A(n583), .B(n584), .Y(n582) );
  OAI22X1 U702 ( .A(outreg_data[13]), .B(n633), .C(\regs_matrix[2][13] ), .D(
        n640), .Y(n584) );
  OAI22X1 U703 ( .A(\regs_matrix[4][13] ), .B(n644), .C(\regs_matrix[6][13] ), 
        .D(n647), .Y(n583) );
  NOR2X1 U704 ( .A(n585), .B(n586), .Y(n581) );
  OAI22X1 U705 ( .A(\regs_matrix[3][13] ), .B(n26), .C(\regs_matrix[1][13] ), 
        .D(n651), .Y(n586) );
  OAI22X1 U706 ( .A(\regs_matrix[5][13] ), .B(n653), .C(\regs_matrix[7][13] ), 
        .D(n657), .Y(n585) );
  MUX2X1 U707 ( .B(n587), .A(n588), .S(n659), .Y(r2_data[14]) );
  NAND2X1 U708 ( .A(n589), .B(n590), .Y(n588) );
  NOR2X1 U709 ( .A(n591), .B(n592), .Y(n590) );
  OAI22X1 U710 ( .A(\regs_matrix[8][14] ), .B(n632), .C(\regs_matrix[10][14] ), 
        .D(n640), .Y(n592) );
  OAI22X1 U711 ( .A(\regs_matrix[12][14] ), .B(n644), .C(\regs_matrix[14][14] ), .D(n648), .Y(n591) );
  NOR2X1 U712 ( .A(n593), .B(n594), .Y(n589) );
  OAI22X1 U713 ( .A(\regs_matrix[11][14] ), .B(n32), .C(\regs_matrix[9][14] ), 
        .D(n651), .Y(n594) );
  OAI22X1 U714 ( .A(\regs_matrix[13][14] ), .B(n653), .C(\regs_matrix[15][14] ), .D(n65), .Y(n593) );
  NAND2X1 U715 ( .A(n595), .B(n596), .Y(n587) );
  NOR2X1 U716 ( .A(n597), .B(n598), .Y(n596) );
  OAI22X1 U717 ( .A(outreg_data[14]), .B(n633), .C(\regs_matrix[2][14] ), .D(
        n640), .Y(n598) );
  OAI22X1 U718 ( .A(\regs_matrix[4][14] ), .B(n644), .C(\regs_matrix[6][14] ), 
        .D(n648), .Y(n597) );
  NOR2X1 U719 ( .A(n599), .B(n600), .Y(n595) );
  OAI22X1 U720 ( .A(\regs_matrix[3][14] ), .B(n29), .C(\regs_matrix[1][14] ), 
        .D(n651), .Y(n600) );
  OAI22X1 U721 ( .A(\regs_matrix[5][14] ), .B(n653), .C(\regs_matrix[7][14] ), 
        .D(n82), .Y(n599) );
  MUX2X1 U722 ( .B(n601), .A(n602), .S(N17), .Y(n722) );
  NAND2X1 U723 ( .A(n604), .B(n603), .Y(n602) );
  NOR2X1 U724 ( .A(n605), .B(n606), .Y(n604) );
  OAI22X1 U725 ( .A(\regs_matrix[8][15] ), .B(n663), .C(\regs_matrix[10][15] ), 
        .D(n640), .Y(n606) );
  OAI22X1 U726 ( .A(\regs_matrix[12][15] ), .B(n644), .C(\regs_matrix[14][15] ), .D(n648), .Y(n605) );
  NOR2X1 U727 ( .A(n607), .B(n608), .Y(n603) );
  OAI22X1 U728 ( .A(\regs_matrix[11][15] ), .B(n51), .C(\regs_matrix[9][15] ), 
        .D(n651), .Y(n608) );
  OAI22X1 U729 ( .A(\regs_matrix[13][15] ), .B(n654), .C(\regs_matrix[15][15] ), .D(n82), .Y(n607) );
  NAND2X1 U730 ( .A(n610), .B(n609), .Y(n601) );
  NOR2X1 U731 ( .A(n611), .B(n612), .Y(n610) );
  OAI22X1 U732 ( .A(outreg_data[15]), .B(n662), .C(\regs_matrix[2][15] ), .D(
        n640), .Y(n612) );
  OAI22X1 U733 ( .A(\regs_matrix[4][15] ), .B(n644), .C(\regs_matrix[6][15] ), 
        .D(n648), .Y(n611) );
  NOR2X1 U734 ( .A(n613), .B(n614), .Y(n609) );
  OAI22X1 U735 ( .A(\regs_matrix[3][15] ), .B(n49), .C(\regs_matrix[1][15] ), 
        .D(n651), .Y(n614) );
  OAI22X1 U736 ( .A(\regs_matrix[5][15] ), .B(n654), .C(\regs_matrix[7][15] ), 
        .D(n657), .Y(n613) );
  NOR2X1 U737 ( .A(n615), .B(n616), .Y(n380) );
  OAI21X1 U738 ( .A(\regs_matrix[6][16] ), .B(n648), .C(n617), .Y(n616) );
  AOI22X1 U739 ( .A(n637), .B(n329), .C(n661), .D(n330), .Y(n617) );
  OAI21X1 U740 ( .A(\regs_matrix[4][16] ), .B(n644), .C(n660), .Y(n615) );
  NOR2X1 U741 ( .A(n618), .B(n619), .Y(n381) );
  OAI22X1 U742 ( .A(\regs_matrix[3][16] ), .B(n53), .C(\regs_matrix[1][16] ), 
        .D(n651), .Y(n619) );
  OAI22X1 U743 ( .A(\regs_matrix[5][16] ), .B(n653), .C(\regs_matrix[7][16] ), 
        .D(n3), .Y(n618) );
  NOR2X1 U744 ( .A(n620), .B(n621), .Y(n382) );
  OAI21X1 U745 ( .A(\regs_matrix[12][16] ), .B(n644), .C(n622), .Y(n621) );
  AOI22X1 U746 ( .A(n637), .B(n336), .C(n661), .D(n623), .Y(n622) );
  INVX2 U747 ( .A(\regs_matrix[8][16] ), .Y(n623) );
  NAND3X1 U748 ( .A(n624), .B(n625), .C(n626), .Y(n391) );
  NAND3X1 U749 ( .A(n625), .B(N15), .C(n626), .Y(n392) );
  NAND3X1 U750 ( .A(N16), .B(n624), .C(n626), .Y(n393) );
  OAI22X1 U751 ( .A(\regs_matrix[9][16] ), .B(n650), .C(\regs_matrix[14][16] ), 
        .D(n646), .Y(n620) );
  NAND3X1 U752 ( .A(N16), .B(N15), .C(n626), .Y(n394) );
  NAND3X1 U753 ( .A(N14), .B(n625), .C(n624), .Y(n397) );
  NOR2X1 U754 ( .A(n627), .B(n628), .Y(n383) );
  OAI21X1 U755 ( .A(\regs_matrix[11][16] ), .B(n54), .C(n659), .Y(n628) );
  OAI22X1 U756 ( .A(\regs_matrix[15][16] ), .B(n65), .C(\regs_matrix[13][16] ), 
        .D(n655), .Y(n627) );
  NAND3X1 U757 ( .A(N16), .B(N14), .C(n624), .Y(n398) );
  BUFX4 U758 ( .A(n629), .Y(n630) );
  INVX2 U759 ( .A(n391), .Y(n629) );
  INVX1 U760 ( .A(n633), .Y(n661) );
  NAND3X1 U761 ( .A(n59), .B(n625), .C(n626), .Y(n662) );
  NAND3X1 U762 ( .A(n59), .B(n625), .C(n626), .Y(n663) );
  INVX4 U763 ( .A(w_data[13]), .Y(n702) );
  INVX4 U764 ( .A(w_data[6]), .Y(n681) );
  INVX4 U765 ( .A(w_data[8]), .Y(n687) );
  INVX4 U766 ( .A(w_data[15]), .Y(n707) );
  INVX2 U767 ( .A(w_en), .Y(n718) );
  INVX2 U768 ( .A(w_sel[3]), .Y(n719) );
  INVX2 U769 ( .A(w_sel[2]), .Y(n720) );
  INVX2 U770 ( .A(w_sel[1]), .Y(n721) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  AND2X2 U2 ( .A(w_data_sel[0]), .B(n36), .Y(n1) );
  AND2X2 U3 ( .A(n36), .B(n3), .Y(n2) );
  INVX2 U4 ( .A(w_data_sel[1]), .Y(n36) );
  AND2X2 U5 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U6 ( .A(alu_result[15]), .Y(n5) );
  INVX2 U7 ( .A(w_data_sel[0]), .Y(n3) );
  AOI22X1 U8 ( .A(ext_data2[15]), .B(n1), .C(ext_data1[15]), .D(n2), .Y(n4) );
  OAI21X1 U9 ( .A(n36), .B(n5), .C(n4), .Y(dest_data[15]) );
  INVX2 U10 ( .A(alu_result[14]), .Y(n7) );
  AOI22X1 U11 ( .A(ext_data2[14]), .B(n1), .C(ext_data1[14]), .D(n2), .Y(n6)
         );
  OAI21X1 U12 ( .A(n36), .B(n7), .C(n6), .Y(dest_data[14]) );
  INVX2 U13 ( .A(alu_result[13]), .Y(n9) );
  AOI22X1 U14 ( .A(ext_data2[13]), .B(n1), .C(ext_data1[13]), .D(n2), .Y(n8)
         );
  OAI21X1 U15 ( .A(n36), .B(n9), .C(n8), .Y(dest_data[13]) );
  INVX2 U16 ( .A(alu_result[12]), .Y(n11) );
  AOI22X1 U17 ( .A(ext_data2[12]), .B(n1), .C(ext_data1[12]), .D(n2), .Y(n10)
         );
  OAI21X1 U18 ( .A(n36), .B(n11), .C(n10), .Y(dest_data[12]) );
  INVX2 U19 ( .A(alu_result[11]), .Y(n13) );
  AOI22X1 U20 ( .A(ext_data2[11]), .B(n1), .C(ext_data1[11]), .D(n2), .Y(n12)
         );
  OAI21X1 U21 ( .A(n36), .B(n13), .C(n12), .Y(dest_data[11]) );
  INVX2 U22 ( .A(alu_result[10]), .Y(n15) );
  AOI22X1 U23 ( .A(ext_data2[10]), .B(n1), .C(ext_data1[10]), .D(n2), .Y(n14)
         );
  OAI21X1 U24 ( .A(n36), .B(n15), .C(n14), .Y(dest_data[10]) );
  INVX2 U25 ( .A(alu_result[9]), .Y(n17) );
  AOI22X1 U26 ( .A(ext_data2[9]), .B(n1), .C(ext_data1[9]), .D(n2), .Y(n16) );
  OAI21X1 U27 ( .A(n36), .B(n17), .C(n16), .Y(dest_data[9]) );
  INVX2 U28 ( .A(alu_result[8]), .Y(n19) );
  AOI22X1 U29 ( .A(ext_data2[8]), .B(n1), .C(ext_data1[8]), .D(n2), .Y(n18) );
  OAI21X1 U30 ( .A(n36), .B(n19), .C(n18), .Y(dest_data[8]) );
  INVX2 U31 ( .A(alu_result[7]), .Y(n21) );
  AOI22X1 U32 ( .A(ext_data2[7]), .B(n1), .C(ext_data1[7]), .D(n2), .Y(n20) );
  OAI21X1 U33 ( .A(n36), .B(n21), .C(n20), .Y(dest_data[7]) );
  INVX2 U34 ( .A(alu_result[6]), .Y(n23) );
  AOI22X1 U35 ( .A(ext_data2[6]), .B(n1), .C(ext_data1[6]), .D(n2), .Y(n22) );
  OAI21X1 U36 ( .A(n36), .B(n23), .C(n22), .Y(dest_data[6]) );
  INVX2 U37 ( .A(alu_result[5]), .Y(n25) );
  AOI22X1 U38 ( .A(ext_data2[5]), .B(n1), .C(ext_data1[5]), .D(n2), .Y(n24) );
  OAI21X1 U39 ( .A(n36), .B(n25), .C(n24), .Y(dest_data[5]) );
  INVX2 U40 ( .A(alu_result[4]), .Y(n27) );
  AOI22X1 U41 ( .A(ext_data2[4]), .B(n1), .C(ext_data1[4]), .D(n2), .Y(n26) );
  OAI21X1 U42 ( .A(n36), .B(n27), .C(n26), .Y(dest_data[4]) );
  INVX2 U43 ( .A(alu_result[3]), .Y(n29) );
  AOI22X1 U44 ( .A(ext_data2[3]), .B(n1), .C(ext_data1[3]), .D(n2), .Y(n28) );
  OAI21X1 U45 ( .A(n36), .B(n29), .C(n28), .Y(dest_data[3]) );
  INVX2 U46 ( .A(alu_result[2]), .Y(n31) );
  AOI22X1 U47 ( .A(ext_data2[2]), .B(n1), .C(ext_data1[2]), .D(n2), .Y(n30) );
  OAI21X1 U48 ( .A(n36), .B(n31), .C(n30), .Y(dest_data[2]) );
  INVX2 U49 ( .A(alu_result[1]), .Y(n33) );
  AOI22X1 U50 ( .A(ext_data2[1]), .B(n1), .C(ext_data1[1]), .D(n2), .Y(n32) );
  OAI21X1 U51 ( .A(n36), .B(n33), .C(n32), .Y(dest_data[1]) );
  INVX2 U52 ( .A(alu_result[0]), .Y(n35) );
  AOI22X1 U53 ( .A(ext_data2[0]), .B(n1), .C(ext_data1[0]), .D(n2), .Y(n34) );
  OAI21X1 U54 ( .A(n36), .B(n35), .C(n34), .Y(dest_data[0]) );
endmodule


module magnitude_DW01_dec_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;
  wire   n1, n2, n3, n5, n7, n9, n11, n13, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;

  INVX2 U1 ( .A(A[13]), .Y(n1) );
  INVX2 U2 ( .A(n32), .Y(n2) );
  INVX2 U3 ( .A(A[12]), .Y(n3) );
  INVX2 U4 ( .A(n34), .Y(SUM[11]) );
  INVX2 U5 ( .A(A[10]), .Y(n5) );
  INVX2 U6 ( .A(n16), .Y(SUM[9]) );
  INVX2 U7 ( .A(A[8]), .Y(n7) );
  INVX2 U8 ( .A(n20), .Y(SUM[7]) );
  INVX2 U9 ( .A(A[6]), .Y(n9) );
  INVX2 U10 ( .A(n23), .Y(SUM[5]) );
  INVX2 U11 ( .A(A[4]), .Y(n11) );
  INVX2 U12 ( .A(n26), .Y(SUM[3]) );
  INVX2 U13 ( .A(A[2]), .Y(n13) );
  INVX2 U14 ( .A(n29), .Y(SUM[1]) );
  INVX2 U15 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U16 ( .A(n17), .B(A[9]), .C(n18), .Y(n16) );
  OAI21X1 U17 ( .A(n19), .B(n7), .C(n17), .Y(SUM[8]) );
  AOI21X1 U18 ( .A(n21), .B(A[7]), .C(n19), .Y(n20) );
  OAI21X1 U19 ( .A(n22), .B(n9), .C(n21), .Y(SUM[6]) );
  AOI21X1 U20 ( .A(n24), .B(A[5]), .C(n22), .Y(n23) );
  OAI21X1 U21 ( .A(n25), .B(n11), .C(n24), .Y(SUM[4]) );
  AOI21X1 U22 ( .A(n27), .B(A[3]), .C(n25), .Y(n26) );
  OAI21X1 U23 ( .A(n28), .B(n13), .C(n27), .Y(SUM[2]) );
  AOI21X1 U24 ( .A(A[0]), .B(A[1]), .C(n28), .Y(n29) );
  XOR2X1 U25 ( .A(A[15]), .B(n30), .Y(SUM[15]) );
  NOR2X1 U26 ( .A(A[14]), .B(n31), .Y(n30) );
  XNOR2X1 U27 ( .A(A[14]), .B(n31), .Y(SUM[14]) );
  OAI21X1 U28 ( .A(n2), .B(n1), .C(n31), .Y(SUM[13]) );
  NAND2X1 U29 ( .A(n2), .B(n1), .Y(n31) );
  OAI21X1 U30 ( .A(n33), .B(n3), .C(n32), .Y(SUM[12]) );
  NAND2X1 U31 ( .A(n33), .B(n3), .Y(n32) );
  AOI21X1 U32 ( .A(n35), .B(A[11]), .C(n33), .Y(n34) );
  NOR2X1 U33 ( .A(n35), .B(A[11]), .Y(n33) );
  OAI21X1 U34 ( .A(n18), .B(n5), .C(n35), .Y(SUM[10]) );
  NAND2X1 U35 ( .A(n18), .B(n5), .Y(n35) );
  NOR2X1 U36 ( .A(n17), .B(A[9]), .Y(n18) );
  NAND2X1 U37 ( .A(n19), .B(n7), .Y(n17) );
  NOR2X1 U38 ( .A(n21), .B(A[7]), .Y(n19) );
  NAND2X1 U39 ( .A(n22), .B(n9), .Y(n21) );
  NOR2X1 U40 ( .A(n24), .B(A[5]), .Y(n22) );
  NAND2X1 U41 ( .A(n25), .B(n11), .Y(n24) );
  NOR2X1 U42 ( .A(n27), .B(A[3]), .Y(n25) );
  NAND2X1 U43 ( .A(n28), .B(n13), .Y(n27) );
  NOR2X1 U44 ( .A(A[1]), .B(A[0]), .Y(n28) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n1;

  OAI21X1 U3 ( .A(N11), .B(n1), .C(n2), .Y(out[9]) );
  NAND2X1 U4 ( .A(in[9]), .B(n1), .Y(n2) );
  OAI21X1 U5 ( .A(N10), .B(n1), .C(n3), .Y(out[8]) );
  NAND2X1 U6 ( .A(in[8]), .B(n1), .Y(n3) );
  OAI21X1 U7 ( .A(N9), .B(n1), .C(n4), .Y(out[7]) );
  NAND2X1 U8 ( .A(in[7]), .B(n1), .Y(n4) );
  OAI21X1 U9 ( .A(N8), .B(n1), .C(n5), .Y(out[6]) );
  NAND2X1 U10 ( .A(in[6]), .B(n1), .Y(n5) );
  OAI21X1 U11 ( .A(N7), .B(n1), .C(n6), .Y(out[5]) );
  NAND2X1 U12 ( .A(in[5]), .B(n1), .Y(n6) );
  OAI21X1 U13 ( .A(N6), .B(n1), .C(n7), .Y(out[4]) );
  NAND2X1 U14 ( .A(in[4]), .B(n1), .Y(n7) );
  OAI21X1 U15 ( .A(N5), .B(n1), .C(n8), .Y(out[3]) );
  NAND2X1 U16 ( .A(in[3]), .B(n1), .Y(n8) );
  OAI21X1 U17 ( .A(N4), .B(n1), .C(n9), .Y(out[2]) );
  NAND2X1 U18 ( .A(in[2]), .B(n1), .Y(n9) );
  OAI21X1 U19 ( .A(N3), .B(n1), .C(n10), .Y(out[1]) );
  NAND2X1 U20 ( .A(in[1]), .B(n1), .Y(n10) );
  OAI21X1 U21 ( .A(N17), .B(n1), .C(n11), .Y(out[15]) );
  NAND2X1 U22 ( .A(in[15]), .B(n1), .Y(n11) );
  OAI21X1 U23 ( .A(N16), .B(n1), .C(n12), .Y(out[14]) );
  NAND2X1 U24 ( .A(in[14]), .B(n1), .Y(n12) );
  OAI21X1 U25 ( .A(N15), .B(n1), .C(n13), .Y(out[13]) );
  NAND2X1 U26 ( .A(in[13]), .B(n1), .Y(n13) );
  OAI21X1 U27 ( .A(N14), .B(n1), .C(n14), .Y(out[12]) );
  NAND2X1 U28 ( .A(in[12]), .B(n1), .Y(n14) );
  OAI21X1 U29 ( .A(N13), .B(n1), .C(n15), .Y(out[11]) );
  NAND2X1 U30 ( .A(in[11]), .B(n1), .Y(n15) );
  OAI21X1 U31 ( .A(N12), .B(n1), .C(n16), .Y(out[10]) );
  NAND2X1 U32 ( .A(in[10]), .B(n1), .Y(n16) );
  OAI21X1 U33 ( .A(N2), .B(n1), .C(n17), .Y(out[0]) );
  NAND2X1 U34 ( .A(in[0]), .B(n1), .Y(n17) );
  magnitude_DW01_dec_0 sub_19 ( .A(in[15:0]), .SUM({N17, N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2}) );
  INVX2 U2 ( .A(in[16]), .Y(n1) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N16, N19, N20, N21,
         N22, N23, N24, N25, N26, N27, N28, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118;

  DFFSR \current_count_reg[0]  ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR current_rollover_flag_reg ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rollover_flag) );
  DFFSR \current_count_reg[1]  ( .D(n76), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \current_count_reg[2]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \current_count_reg[3]  ( .D(n74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \current_count_reg[4]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \current_count_reg[5]  ( .D(n72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \current_count_reg[6]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \current_count_reg[7]  ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \current_count_reg[8]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \current_count_reg[9]  ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  AND2X2 U17 ( .A(n34), .B(n49), .Y(n48) );
  OAI21X1 U30 ( .A(n117), .B(n34), .C(n35), .Y(n67) );
  NAND2X1 U31 ( .A(rollover_flag), .B(n36), .Y(n35) );
  OAI21X1 U32 ( .A(n116), .B(n118), .C(n37), .Y(n68) );
  NAND2X1 U33 ( .A(N28), .B(n38), .Y(n37) );
  OAI21X1 U34 ( .A(n103), .B(n118), .C(n39), .Y(n69) );
  NAND2X1 U35 ( .A(N27), .B(n38), .Y(n39) );
  OAI21X1 U36 ( .A(n115), .B(n118), .C(n40), .Y(n70) );
  NAND2X1 U37 ( .A(N26), .B(n38), .Y(n40) );
  OAI21X1 U38 ( .A(n105), .B(n118), .C(n41), .Y(n71) );
  NAND2X1 U39 ( .A(N25), .B(n38), .Y(n41) );
  OAI21X1 U40 ( .A(n114), .B(n118), .C(n42), .Y(n72) );
  NAND2X1 U41 ( .A(N24), .B(n38), .Y(n42) );
  OAI21X1 U42 ( .A(n107), .B(n118), .C(n43), .Y(n73) );
  NAND2X1 U43 ( .A(N23), .B(n38), .Y(n43) );
  OAI21X1 U44 ( .A(n113), .B(n118), .C(n44), .Y(n74) );
  NAND2X1 U45 ( .A(N22), .B(n38), .Y(n44) );
  OAI21X1 U46 ( .A(n112), .B(n118), .C(n45), .Y(n75) );
  NAND2X1 U47 ( .A(N21), .B(n38), .Y(n45) );
  OAI21X1 U48 ( .A(n111), .B(n118), .C(n46), .Y(n76) );
  NAND2X1 U49 ( .A(N20), .B(n38), .Y(n46) );
  OAI21X1 U50 ( .A(n110), .B(n118), .C(n47), .Y(n77) );
  AOI22X1 U51 ( .A(n48), .B(N16), .C(N19), .D(n38), .Y(n47) );
  AOI21X1 U52 ( .A(n34), .B(N16), .C(n117), .Y(n38) );
  NOR2X1 U53 ( .A(n36), .B(clear), .Y(n49) );
  NAND3X1 U54 ( .A(n50), .B(n51), .C(n52), .Y(n34) );
  NOR2X1 U55 ( .A(n53), .B(n54), .Y(n52) );
  NAND3X1 U56 ( .A(n55), .B(n56), .C(n57), .Y(n54) );
  XNOR2X1 U57 ( .A(count_out[3]), .B(N7), .Y(n57) );
  XNOR2X1 U58 ( .A(count_out[8]), .B(N12), .Y(n56) );
  XNOR2X1 U59 ( .A(count_out[5]), .B(N9), .Y(n55) );
  NAND2X1 U60 ( .A(n58), .B(n59), .Y(n53) );
  XNOR2X1 U61 ( .A(count_out[9]), .B(N13), .Y(n59) );
  NOR2X1 U62 ( .A(N14), .B(n60), .Y(n58) );
  XNOR2X1 U63 ( .A(n115), .B(N11), .Y(n60) );
  NOR2X1 U64 ( .A(n61), .B(n62), .Y(n51) );
  NAND2X1 U65 ( .A(n63), .B(n64), .Y(n62) );
  XNOR2X1 U66 ( .A(count_out[4]), .B(N8), .Y(n64) );
  XNOR2X1 U67 ( .A(count_out[6]), .B(N10), .Y(n63) );
  XNOR2X1 U68 ( .A(n112), .B(N6), .Y(n61) );
  NOR2X1 U69 ( .A(n65), .B(n66), .Y(n50) );
  XNOR2X1 U70 ( .A(n110), .B(N4), .Y(n66) );
  XNOR2X1 U71 ( .A(n111), .B(N5), .Y(n65) );
  NOR2X1 U72 ( .A(clear), .B(count_enable), .Y(n36) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 r305 ( .A(count_out), .SUM({N28, N27, 
        N26, N25, N24, N23, N22, N21, N20, N19}) );
  INVX2 U5 ( .A(n36), .Y(n118) );
  NOR2X1 U6 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n2) );
  NAND2X1 U9 ( .A(n2), .B(n26), .Y(n3) );
  NOR2X1 U18 ( .A(n3), .B(rollover_val[3]), .Y(n5) );
  NAND2X1 U19 ( .A(n5), .B(n25), .Y(n6) );
  NOR2X1 U20 ( .A(n6), .B(rollover_val[5]), .Y(n8) );
  NAND2X1 U21 ( .A(n8), .B(n28), .Y(n9) );
  NOR2X1 U22 ( .A(n9), .B(rollover_val[7]), .Y(n22) );
  NAND2X1 U23 ( .A(n22), .B(n27), .Y(n23) );
  NOR2X1 U24 ( .A(n23), .B(rollover_val[9]), .Y(N14) );
  AOI21X1 U25 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n2), .Y(n1) );
  OAI21X1 U26 ( .A(n2), .B(n26), .C(n3), .Y(N6) );
  AOI21X1 U27 ( .A(n3), .B(rollover_val[3]), .C(n5), .Y(n4) );
  OAI21X1 U28 ( .A(n5), .B(n25), .C(n6), .Y(N8) );
  AOI21X1 U29 ( .A(n6), .B(rollover_val[5]), .C(n8), .Y(n7) );
  OAI21X1 U73 ( .A(n8), .B(n28), .C(n9), .Y(N10) );
  AOI21X1 U74 ( .A(n9), .B(rollover_val[7]), .C(n22), .Y(n10) );
  OAI21X1 U75 ( .A(n22), .B(n27), .C(n23), .Y(N12) );
  AOI21X1 U76 ( .A(n23), .B(rollover_val[9]), .C(N14), .Y(n24) );
  INVX2 U77 ( .A(rollover_val[4]), .Y(n25) );
  INVX2 U78 ( .A(rollover_val[2]), .Y(n26) );
  INVX2 U79 ( .A(rollover_val[0]), .Y(N4) );
  INVX2 U80 ( .A(n1), .Y(N5) );
  INVX2 U81 ( .A(rollover_val[8]), .Y(n27) );
  INVX2 U82 ( .A(rollover_val[6]), .Y(n28) );
  INVX2 U83 ( .A(n7), .Y(N9) );
  INVX2 U84 ( .A(n10), .Y(N11) );
  INVX2 U85 ( .A(n24), .Y(N13) );
  INVX2 U86 ( .A(n4), .Y(N7) );
  NAND2X1 U87 ( .A(count_out[9]), .B(n98), .Y(n92) );
  NAND3X1 U88 ( .A(n92), .B(n103), .C(rollover_val[8]), .Y(n29) );
  OAI21X1 U89 ( .A(count_out[9]), .B(n98), .C(n29), .Y(n96) );
  NAND2X1 U90 ( .A(count_out[3]), .B(n101), .Y(n31) );
  OAI21X1 U91 ( .A(n112), .B(rollover_val[2]), .C(n31), .Y(n30) );
  NAND3X1 U92 ( .A(n31), .B(n112), .C(rollover_val[2]), .Y(n32) );
  OAI21X1 U93 ( .A(count_out[3]), .B(n101), .C(n32), .Y(n82) );
  NAND2X1 U94 ( .A(count_out[5]), .B(n100), .Y(n85) );
  OAI21X1 U95 ( .A(n107), .B(rollover_val[4]), .C(n85), .Y(n33) );
  OAI21X1 U96 ( .A(n109), .B(n82), .C(n108), .Y(n91) );
  AOI21X1 U97 ( .A(count_out[1]), .B(n97), .C(count_out[0]), .Y(n78) );
  NAND2X1 U98 ( .A(n78), .B(rollover_val[0]), .Y(n79) );
  OAI21X1 U99 ( .A(count_out[1]), .B(n97), .C(n79), .Y(n81) );
  NAND2X1 U100 ( .A(count_out[7]), .B(n99), .Y(n83) );
  OAI21X1 U101 ( .A(rollover_val[6]), .B(n105), .C(n83), .Y(n80) );
  OAI21X1 U102 ( .A(n82), .B(n81), .C(n106), .Y(n90) );
  NAND3X1 U103 ( .A(n83), .B(n105), .C(rollover_val[6]), .Y(n84) );
  OAI21X1 U104 ( .A(count_out[7]), .B(n99), .C(n84), .Y(n88) );
  NAND3X1 U105 ( .A(n85), .B(n107), .C(rollover_val[4]), .Y(n86) );
  OAI21X1 U106 ( .A(count_out[5]), .B(n100), .C(n86), .Y(n87) );
  OAI22X1 U107 ( .A(n88), .B(n87), .C(n106), .D(n88), .Y(n89) );
  OAI21X1 U108 ( .A(n91), .B(n90), .C(n89), .Y(n95) );
  NOR2X1 U109 ( .A(rollover_val[8]), .B(n103), .Y(n93) );
  OAI21X1 U110 ( .A(n102), .B(n93), .C(n104), .Y(n94) );
  OAI21X1 U111 ( .A(n96), .B(n95), .C(n94), .Y(N16) );
  INVX2 U112 ( .A(rollover_val[1]), .Y(n97) );
  INVX2 U113 ( .A(rollover_val[9]), .Y(n98) );
  INVX2 U114 ( .A(rollover_val[7]), .Y(n99) );
  INVX2 U115 ( .A(rollover_val[5]), .Y(n100) );
  INVX2 U116 ( .A(rollover_val[3]), .Y(n101) );
  INVX2 U117 ( .A(n92), .Y(n102) );
  INVX2 U118 ( .A(count_out[8]), .Y(n103) );
  INVX2 U119 ( .A(n96), .Y(n104) );
  INVX2 U120 ( .A(count_out[6]), .Y(n105) );
  INVX2 U121 ( .A(n80), .Y(n106) );
  INVX2 U122 ( .A(count_out[4]), .Y(n107) );
  INVX2 U123 ( .A(n33), .Y(n108) );
  INVX2 U124 ( .A(n30), .Y(n109) );
  INVX2 U125 ( .A(count_out[0]), .Y(n110) );
  INVX2 U126 ( .A(count_out[1]), .Y(n111) );
  INVX2 U127 ( .A(count_out[2]), .Y(n112) );
  INVX2 U128 ( .A(count_out[3]), .Y(n113) );
  INVX2 U129 ( .A(count_out[5]), .Y(n114) );
  INVX2 U130 ( .A(count_out[7]), .Y(n115) );
  INVX2 U131 ( .A(count_out[9]), .Y(n116) );
  INVX2 U132 ( .A(n49), .Y(n117) );
endmodule


module counter ( clk, n_reset, cnt_up, clear, one_k_samples );
  input clk, n_reset, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 counter ( .clk(clk), .n_rst(n_reset), .clear(
        clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, data_ready, 
        load_coeff, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, data_ready, load_coeff;
  output one_k_samples, modwait, err;
  wire   dataready, loadcoeff, overflow_temp, cnt_up_temp, clear_temp;
  wire   [2:0] op_temp;
  wire   [3:0] src1_temp;
  wire   [3:0] src2_temp;
  wire   [3:0] dest_temp;
  wire   [16:0] mag_in_temp;

  sync_low_1 A ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(
        dataready) );
  sync_low_0 B ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), .sync_out(
        loadcoeff) );
  controller control ( .clk(clk), .n_rst(n_reset), .dr(dataready), .lc(
        loadcoeff), .overflow(overflow_temp), .cnt_up(cnt_up_temp), .clear(
        clear_temp), .modwait(modwait), .op(op_temp), .src1(src1_temp), .src2(
        src2_temp), .dest(dest_temp), .err(err) );
  datapath data ( .clk(clk), .n_reset(n_reset), .op(op_temp), .src1(src1_temp), 
        .src2(src2_temp), .dest(dest_temp), .ext_data1(sample_data), 
        .ext_data2(fir_coefficient), .outreg_data(mag_in_temp), .overflow(
        overflow_temp) );
  magnitude get_pos ( .in(mag_in_temp), .out(fir_out) );
  counter count ( .clk(clk), .n_reset(n_reset), .cnt_up(cnt_up_temp), .clear(
        clear_temp), .one_k_samples(one_k_samples) );
endmodule

