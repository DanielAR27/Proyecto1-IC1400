module TestBench;
    reg [31:0] A, B;
    reg f0, f1;
    wire [31:0] S;
    wire [3:0] status;
    wire C;
    Aritmetico A1(A, B, f0, f1, S, C);
    ArithmeticStatus AS1(A[31], B[31], S, C, status);
    initial begin
        f1 = 1'b0;
        f0 = 1'b0;
        A = 64;
        B = -64;
        #1000
        $display("---------------------");
        $display("SUM: %b", S);
        $display("CARRY OUT: %b", C);
        $display("STATUS: %b", status);
        $finish;
    end
endmodule

module Aritmetico(A, B, f0, f1, S, C);
    input [31:0] A, B;
    input f0, f1;
    wire [31:0] mux_a, inv_b, mux_b;
    wire xor_code, or_code;
    output [31:0] S;
    output C;
    //----------------------------
    MUX2x1_32 M1(f1, A, 0, mux_a);
    Inversor_32 I1(B, inv_b);
    xor #(3) g1 (xor_code, f0, f1);
    MUX2x1_32 M2(xor_code, B, inv_b, mux_b);
    or #(2) g2(or_code, f0, f1);
    Adder32 A1(mux_b, mux_a, or_code, S, C);
endmodule

module Inversor_32(entry, out);
    input [31:0] entry;
    output [31:0] out;

    Inversor N00(entry[0], out[0]);
    Inversor N01(entry[1], out[1]);
    Inversor N02(entry[2], out[2]);
    Inversor N03(entry[3], out[3]);
    Inversor N04(entry[4], out[4]);
    Inversor N05(entry[5], out[5]);
    Inversor N06(entry[6], out[6]);
    Inversor N07(entry[7], out[7]);
    Inversor N08(entry[8], out[8]);
    Inversor N09(entry[9], out[9]);
    Inversor N10(entry[10], out[10]);
    Inversor N11(entry[11], out[11]);
    Inversor N12(entry[12], out[12]);
    Inversor N13(entry[13], out[13]);
    Inversor N14(entry[14], out[14]);
    Inversor N15(entry[15], out[15]);
    Inversor N16(entry[16], out[16]);
    Inversor N17(entry[17], out[17]);
    Inversor N18(entry[18], out[18]);
    Inversor N19(entry[19], out[19]);
    Inversor N20(entry[20], out[20]);
    Inversor N21(entry[21], out[21]);
    Inversor N22(entry[22], out[22]);
    Inversor N23(entry[23], out[23]);
    Inversor N24(entry[24], out[24]);
    Inversor N25(entry[25], out[25]);
    Inversor N26(entry[26], out[26]);
    Inversor N27(entry[27], out[27]);
    Inversor N28(entry[28], out[28]);
    Inversor N29(entry[29], out[29]);
    Inversor N30(entry[30], out[30]);
    Inversor N31(entry[31], out[31]);
endmodule

module Inversor(A, out);
    input A;
    output out;
    //--------------------
    // Inversor hecho con "XOR".
    xor g1(out, 1'b1, A);
endmodule

//Sumador de 32 bits para proyecto TECic
// Efectivo, pero ineficiente

module Adder32(A, B, c_in,  S, C);
    input  [31:0] A, B;
    input   c_in;
	output [31:0] S;
	output C;
    wire
	c31,c30,c29,c28,c27,c26,c25,c24,c23,c22,c21,c20,c19,c18,   c17,c16,
		c15,c14,c13,c12,c11,c10,c09,c08,c07,c06,c05,c04,c03,c02,c01,c00;

    Full_Adder F00(A[0],B[0],c_in,c00,S[0]);
	Full_Adder F01(A[1],B[1],c00,c01,S[1]);
    Full_Adder F02(A[2],B[2],c01,c02,S[2]);
	Full_Adder F03(A[3],B[3],c02,c03,S[3]);
	Full_Adder F04(A[4],B[4],c03,c04,S[4]);
	Full_Adder F05(A[5],B[5],c04,c05,S[5]);
    Full_Adder F06(A[6],B[6],c05,c06,S[6]);
	Full_Adder F07(A[7],B[7],c06,c07,S[7]);
    Full_Adder F08(A[8],B[8],c07,c08,S[8]);
	Full_Adder F09(A[9],B[9],c08,c09,S[9]);
    Full_Adder F10(A[10],B[10],c09,c10,S[10]);
	Full_Adder F11(A[11],B[11],c10,c11,S[11]);
	Full_Adder F12(A[12],B[12],c11,c12,S[12]);
	Full_Adder F13(A[13],B[13],c12,c13,S[13]);
    Full_Adder F14(A[14],B[14],c13,c14,S[14]);
	Full_Adder F15(A[15],B[15],c14,c15,S[15]);
	Full_Adder F16(A[16],B[16],c15,c16,S[16]);
	Full_Adder F17(A[17],B[17],c16,c17,S[17]);
    Full_Adder F18(A[18],B[18],c17,c18,S[18]);
	Full_Adder F19(A[19],B[19],c18,c19,S[19]);
	Full_Adder F20(A[20],B[20],c19,c20,S[20]);
	Full_Adder F21(A[21],B[21],c20,c21,S[21]);
    Full_Adder F22(A[22],B[22],c21,c22,S[22]);
	Full_Adder F23(A[23],B[23],c22,c23,S[23]);
    Full_Adder F24(A[24],B[24],c23,c24,S[24]);
	Full_Adder F25(A[25],B[25],c24,c25,S[25]);
    Full_Adder F26(A[26],B[26],c25,c26,S[26]);
	Full_Adder F27(A[27],B[27],c26,c27,S[27]);
	Full_Adder F28(A[28],B[28],c27,c28,S[28]);
	Full_Adder F29(A[29],B[29],c28,c29,S[29]);
    Full_Adder F30(A[30],B[30],c29,c30,S[30]);
	Full_Adder F31(A[31],B[31],c30,C,S[31]);
endmodule

//Sumador completo para ALU de TECic
//Disenho generico

module Full_Adder (A,B,C,Carry,Sum);
   input A,B,C;
   output Carry,Sum;
   wire c1,c2,c3,c4,c5;
//---------------------
   and #(2) g1(c1,A,B);
   and #(2) g2(c2,A,C);
   and #(2) g3(c4,B,C);
   or  #(2) g4(c3,c1,c2);
   xor #(3) g5(c5,A,B);
   or  #(2) g6(Carry,c3,c4);
   xor #(3) g7(Sum,c5,C);
endmodule

module MUX2x1_32(S, I0, I1, Out);
    input [31:0] I0, I1;
    input S;
    output [31:0] Out;

    MUX2x1 M00(S, I0[0], I1[0], Out[0]);
    MUX2x1 M01(S, I0[1], I1[1], Out[1]);
    MUX2x1 M02(S, I0[2], I1[2], Out[2]);
    MUX2x1 M03(S, I0[3], I1[3], Out[3]);
    MUX2x1 M04(S, I0[4], I1[4], Out[4]);
    MUX2x1 M05(S, I0[5], I1[5], Out[5]);
    MUX2x1 M06(S, I0[6], I1[6], Out[6]);
    MUX2x1 M07(S, I0[7], I1[7], Out[7]);
    MUX2x1 M08(S, I0[8], I1[8], Out[8]);
    MUX2x1 M09(S, I0[9], I1[9], Out[9]);
    MUX2x1 M10(S, I0[10], I1[10], Out[10]);
    MUX2x1 M11(S, I0[11], I1[11], Out[11]);
    MUX2x1 M12(S, I0[12], I1[12], Out[12]);
    MUX2x1 M13(S, I0[13], I1[13], Out[13]);
    MUX2x1 M14(S, I0[14], I1[14], Out[14]);
    MUX2x1 M15(S, I0[15], I1[15], Out[15]);
    MUX2x1 M16(S, I0[16], I1[16], Out[16]);
    MUX2x1 M17(S, I0[17], I1[17], Out[17]);
    MUX2x1 M18(S, I0[18], I1[18], Out[18]);
    MUX2x1 M19(S, I0[19], I1[19], Out[19]);
    MUX2x1 M20(S, I0[20], I1[20], Out[20]);
    MUX2x1 M21(S, I0[21], I1[21], Out[21]);
    MUX2x1 M22(S, I0[22], I1[22], Out[22]);
    MUX2x1 M23(S, I0[23], I1[23], Out[23]);
    MUX2x1 M24(S, I0[24], I1[24], Out[24]);
    MUX2x1 M25(S, I0[25], I1[25], Out[25]);
    MUX2x1 M26(S, I0[26], I1[26], Out[26]);
    MUX2x1 M27(S, I0[27], I1[27], Out[27]);
    MUX2x1 M28(S, I0[28], I1[28], Out[28]);
    MUX2x1 M29(S, I0[29], I1[29], Out[29]);
    MUX2x1 M30(S, I0[30], I1[30], Out[30]);
    MUX2x1 M31(S, I0[31], I1[31], Out[31]);

endmodule


module MUX2x1(S, I0, I1, Out);
    input I0, I1, S;
    output Out;
    wire c1, c2, c3;
    //---------------------
    and #(2) g1(c1, I1, S);
    not #(2) g2(c3, S);
    and #(2) g3(c2, I0, c3);
    or #(2) g4(Out, c1, c2);
endmodule

module ArithmeticStatus(last_bit1, last_bit2, result, c_out, out);
    input last_bit1, last_bit2, c_out;
    input [31:0] result;
    output [3:0] out;
    //----------------------------------
    OverFlowStatus OF00(last_bit1, last_bit2, result[31], out[3]);
    ZeroStatus Z00(result, out[2]);
    xor #(3) g1(out[1], 1'b0, result[31]);
    xor #(3) g2(out[0], 1'b0, c_out);
endmodule


module OverFlowStatus(sign_1, sign_2, sign_3, out);
    input sign_1, sign_2, sign_3;
    output out;
    wire c1, c2, c3, c4, c5;
    //----------------------------------------
    not #(2) (c1, sign_1);
    not #(2) (c2, sign_2);
    not #(2) (c3, sign_3);
    and #(2) (c4, c1, c2, sign_3);
    and #(2) (c5, sign_1, sign_2, c3);
    or #(2) (out, c4, c5);
endmodule

module ZeroStatus(entry, out);
    input [31:0] entry;
    output out;
    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;
    //-----------------------------------------------
    not #(2) result(out, c11);
    or #(2) g11(c11, c10, entry[31]);
    or #(2) g10(c10, c9, entry[28], entry[29], entry[30]);
    or #(2) g9(c9, c8, entry[25], entry[26], entry[27]);
    or #(2) g8(c8, c7, entry[22], entry[23], entry[24]);
    or #(2) g7(c7, c6, entry[19], entry[20], entry[21]);
    or #(2) g6(c6, c5, entry[16], entry[17], entry[18]);
    or #(2) g5(c5, c4, entry[13], entry[14], entry[15]);
    or #(2) g4(c4, c3, entry[10], entry[11], entry[12]);
    or #(2) g3(c3, c2, entry[7], entry[8], entry[9]);
    or #(2) g2(c2, c1, entry[4], entry[5], entry[6]);
    or #(2) g1(c1, entry[0], entry[1], entry[2], entry[3]);
endmodule
