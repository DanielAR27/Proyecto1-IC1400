module TestBench;
    reg [31:0] A, B;
    reg f0,f1;
    wire [31:0] Out;
    Logico L0 (A, B, f0, f1, Out);
    initial begin
        A = 30;
        B = 40;
        f0 = 1;
        f1 = 1;
        #1000
        $display("---------------------");
        $display("RESULT: %b", Out);
        $finish;
    end
endmodule

module Logico(A, B, f0, f1, Out);
    input [31:0] A, B;
    input f0, f1;
    wire [31:0] and_code, or_code, xor_code;
    output [31:0] Out;
    //--------------------------------------
    AND_32 A0(A, B, and_code);
    OR_32 O0(A, B, or_code);
    XOR_32 X0(A, B, xor_code);
    MUX4x1_32 MO(f0, f1, 0, and_code, or_code, xor_code, Out);
endmodule

module AND_32(A, B, out);
    input [31:0] A,B;
    output [31:0] out;

    and #(2) AND00(out[0], A[0], B[0]);
    and #(2) AND01(out[1], A[1], B[1]);
    and #(2) AND02(out[2], A[2], B[2]);
    and #(2) AND03(out[3], A[3], B[3]);
    and #(2) AND04(out[4], A[4], B[4]);
    and #(2) AND05(out[5], A[5], B[5]);
    and #(2) AND06(out[6], A[6], B[6]);
    and #(2) AND07(out[7], A[7], B[7]);
    and #(2) AND08(out[8], A[8], B[8]);
    and #(2) AND09(out[9], A[9], B[9]);
    and #(2) AND10(out[10], A[10], B[10]);
    and #(2) AND11(out[11], A[11], B[11]);
    and #(2) AND12(out[12], A[12], B[12]);
    and #(2) AND13(out[13], A[13], B[13]);
    and #(2) AND14(out[14], A[14], B[14]);
    and #(2) AND15(out[15], A[15], B[15]);
    and #(2) AND16(out[16], A[16], B[16]);
    and #(2) AND17(out[17], A[17], B[17]);
    and #(2) AND18(out[18], A[18], B[18]);
    and #(2) AND19(out[19], A[19], B[19]);
    and #(2) AND20(out[20], A[20], B[20]);
    and #(2) AND21(out[21], A[21], B[21]);
    and #(2) AND22(out[22], A[22], B[22]);
    and #(2) AND23(out[23], A[23], B[23]);
    and #(2) AND24(out[24], A[24], B[24]);
    and #(2) AND25(out[25], A[25], B[25]);
    and #(2) AND26(out[26], A[26], B[26]);
    and #(2) AND27(out[27], A[27], B[27]);
    and #(2) AND28(out[28], A[28], B[28]);
    and #(2) AND29(out[29], A[29], B[29]);
    and #(2) AND30(out[30], A[30], B[30]);
    and #(2) AND31(out[31], A[31], B[31]);
endmodule

module OR_32(A, B, out);
    input [31:0] A,B;
    output [31:0] out;

    or #(2) OR00(out[0], A[0], B[0]);
    or #(2) OR01(out[1], A[1], B[1]);
    or #(2) OR02(out[2], A[2], B[2]);
    or #(2) OR03(out[3], A[3], B[3]);
    or #(2) OR04(out[4], A[4], B[4]);
    or #(2) OR05(out[5], A[5], B[5]);
    or #(2) OR06(out[6], A[6], B[6]);
    or #(2) OR07(out[7], A[7], B[7]);
    or #(2) OR08(out[8], A[8], B[8]);
    or #(2) OR09(out[9], A[9], B[9]);
    or #(2) OR10(out[10], A[10], B[10]);
    or #(2) OR11(out[11], A[11], B[11]);
    or #(2) OR12(out[12], A[12], B[12]);
    or #(2) OR13(out[13], A[13], B[13]);
    or #(2) OR14(out[14], A[14], B[14]);
    or #(2) OR15(out[15], A[15], B[15]);
    or #(2) OR16(out[16], A[16], B[16]);
    or #(2) OR17(out[17], A[17], B[17]);
    or #(2) OR18(out[18], A[18], B[18]);
    or #(2) OR19(out[19], A[19], B[19]);
    or #(2) OR20(out[20], A[20], B[20]);
    or #(2) OR21(out[21], A[21], B[21]);
    or #(2) OR22(out[22], A[22], B[22]);
    or #(2) OR23(out[23], A[23], B[23]);
    or #(2) OR24(out[24], A[24], B[24]);
    or #(2) OR25(out[25], A[25], B[25]);
    or #(2) OR26(out[26], A[26], B[26]);
    or #(2) OR27(out[27], A[27], B[27]);
    or #(2) OR28(out[28], A[28], B[28]);
    or #(2) OR29(out[29], A[29], B[29]);
    or #(2) OR30(out[30], A[30], B[30]);
    or #(2) OR31(out[31], A[31], B[31]);
endmodule

module XOR_32(A, B, out);
    input [31:0] A,B;
    output [31:0] out;

    xor #(3) XOR00(out[0], A[0], B[0]);
    xor #(3) XOR01(out[1], A[1], B[1]);
    xor #(3) XOR02(out[2], A[2], B[2]);
    xor #(3) XOR03(out[3], A[3], B[3]);
    xor #(3) XOR04(out[4], A[4], B[4]);
    xor #(3) XOR05(out[5], A[5], B[5]);
    xor #(3) XOR06(out[6], A[6], B[6]);
    xor #(3) XOR07(out[7], A[7], B[7]);
    xor #(3) XOR08(out[8], A[8], B[8]);
    xor #(3) XOR09(out[9], A[9], B[9]);
    xor #(3) XOR10(out[10], A[10], B[10]);
    xor #(3) XOR11(out[11], A[11], B[11]);
    xor #(3) XOR12(out[12], A[12], B[12]);
    xor #(3) XOR13(out[13], A[13], B[13]);
    xor #(3) XOR14(out[14], A[14], B[14]);
    xor #(3) XOR15(out[15], A[15], B[15]);
    xor #(3) XOR16(out[16], A[16], B[16]);
    xor #(3) XOR17(out[17], A[17], B[17]);
    xor #(3) XOR18(out[18], A[18], B[18]);
    xor #(3) XOR19(out[19], A[19], B[19]);
    xor #(3) XOR20(out[20], A[20], B[20]);
    xor #(3) XOR21(out[21], A[21], B[21]);
    xor #(3) XOR22(out[22], A[22], B[22]);
    xor #(3) XOR23(out[23], A[23], B[23]);
    xor #(3) XOR24(out[24], A[24], B[24]);
    xor #(3) XOR25(out[25], A[25], B[25]);
    xor #(3) XOR26(out[26], A[26], B[26]);
    xor #(3) XOR27(out[27], A[27], B[27]);
    xor #(3) XOR28(out[28], A[28], B[28]);
    xor #(3) XOR29(out[29], A[29], B[29]);
    xor #(3) XOR30(out[30], A[30], B[30]);
    xor #(3) XOR31(out[31], A[31], B[31]);
endmodule

module MUX4x1_32(S0, S1, I0, I1, I2, I3, Out);
    input [31:0] I0, I1, I2, I3;
    input S0, S1;
    output [31:0] Out;

    MUX4x1 M00(S0, S1, I0[0], I1[0], I2[0], I3[0], Out[0]);
    MUX4x1 M01(S0, S1, I0[1], I1[1], I2[1], I3[1], Out[1]);
    MUX4x1 M02(S0, S1, I0[2], I1[2], I2[2], I3[2], Out[2]);
    MUX4x1 M03(S0, S1, I0[3], I1[3], I2[3], I3[3], Out[3]);
    MUX4x1 M04(S0, S1, I0[4], I1[4], I2[4], I3[4], Out[4]);
    MUX4x1 M05(S0, S1, I0[5], I1[5], I2[5], I3[5], Out[5]);
    MUX4x1 M06(S0, S1, I0[6], I1[6], I2[6], I3[6], Out[6]);
    MUX4x1 M07(S0, S1, I0[7], I1[7], I2[7], I3[7], Out[7]);
    MUX4x1 M08(S0, S1, I0[8], I1[8], I2[8], I3[8], Out[8]);
    MUX4x1 M09(S0, S1, I0[9], I1[9], I2[9], I3[9], Out[9]);
    MUX4x1 M10(S0, S1, I0[10], I1[10], I2[10], I3[10], Out[10]);
    MUX4x1 M11(S0, S1, I0[11], I1[11], I2[11], I3[11], Out[11]);
    MUX4x1 M12(S0, S1, I0[12], I1[12], I2[12], I3[12], Out[12]);
    MUX4x1 M13(S0, S1, I0[13], I1[13], I2[13], I3[13], Out[13]);
    MUX4x1 M14(S0, S1, I0[14], I1[14], I2[14], I3[14], Out[14]);
    MUX4x1 M15(S0, S1, I0[15], I1[15], I2[15], I3[15], Out[15]);
    MUX4x1 M16(S0, S1, I0[16], I1[16], I2[16], I3[16], Out[16]);
    MUX4x1 M17(S0, S1, I0[17], I1[17], I2[17], I3[17], Out[17]);
    MUX4x1 M18(S0, S1, I0[18], I1[18], I2[18], I3[18], Out[18]);
    MUX4x1 M19(S0, S1, I0[19], I1[19], I2[19], I3[19], Out[19]);
    MUX4x1 M20(S0, S1, I0[20], I1[20], I2[20], I3[20], Out[20]);
    MUX4x1 M21(S0, S1, I0[21], I1[21], I2[21], I3[21], Out[21]);
    MUX4x1 M22(S0, S1, I0[22], I1[22], I2[22], I3[22], Out[22]);
    MUX4x1 M23(S0, S1, I0[23], I1[23], I2[23], I3[23], Out[23]);
    MUX4x1 M24(S0, S1, I0[24], I1[24], I2[24], I3[24], Out[24]);
    MUX4x1 M25(S0, S1, I0[25], I1[25], I2[25], I3[25], Out[25]);
    MUX4x1 M26(S0, S1, I0[26], I1[26], I2[26], I3[26], Out[26]);
    MUX4x1 M27(S0, S1, I0[27], I1[27], I2[27], I3[27], Out[27]);
    MUX4x1 M28(S0, S1, I0[28], I1[28], I2[28], I3[28], Out[28]);
    MUX4x1 M29(S0, S1, I0[29], I1[29], I2[29], I3[29], Out[29]);
    MUX4x1 M30(S0, S1, I0[30], I1[30], I2[30], I3[30], Out[30]);
    MUX4x1 M31(S0, S1, I0[31], I1[31], I2[31], I3[31], Out[31]);
endmodule

module MUX4x1(S0, S1, I0, I1, I2, I3, Out);
    input I0,  I1, I2, I3, S0, S1;
    output Out;
    wire c1, c2, c3, c4, c5, c6;
    //--------------------------------
    not #(2) g1(c1, S0);
    not #(2) g2 (c2, S1);
    // AND de 3 variables
    and #(2) g3 (c3, I0, c1, c2);
    and #(2) g4 (c4, I1, c1, S1);
    and #(2) g5 (c5, I2, S0, c2);
    and #(2) g6 (c6, I3, S0, S1);
    or #(2) g7 (Out, c3, c4, c5, c6);
endmodule