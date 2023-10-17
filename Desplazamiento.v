module TestBench;
    reg [4:0] seleccion;
    reg [31:0] entrada;
    reg f0, f1;
    wire [31:0] salida;
    Desplazamiento D00(entrada, seleccion, f0, f1, salida);
    initial begin
        seleccion = 5'b00001;
        f0 = 1;
        f1 = 1;
        entrada = 32'b01111111111111111111111111111111;
        #10000
        $display("entrada: %b", entrada);
        #10000
        $display("RESULTADO: %b", salida);
    end
endmodule

module Desplazamiento(num, select, f0, f1, Out);
    input [31:0] num;
    input [4:0] select;
    input f0,f1;
    wire [31:0] shl_code, slr_code, sar_code, ror_code;
    output [31:0] Out;
    //--------------------------------------
    SHL_32 SHL00(select, num, shl_code);
    SLR_32 SLR00(select, num, slr_code);
    SAR_32 SAR00(select, num, sar_code);
    ROR_32 ROR00(select, num, ror_code);
    MUX4x1_32 M0(f0, f1, shl_code, slr_code, sar_code, ror_code, Out);
endmodule

module SLR_32(select, entry, out);
    input [4:0] select;
    input [31:0] entry;
    output [31:0] out;
    wire [31:0] c1, c2, c3, c4, c5, c6,
    c7, c8, c9, c10, c11, c12, c13, c14, c15,
    c16, c17, c18, c19, c20, c21, c22, c23, c24,
    c25, c26, c27, c28, c29, c30;
    //-----------------------------------------
    // 16 bit shift
    SLR S30(select[4], c30, out);
    SLR S29(select[4], c29, c30);
    SLR S28(select[4], c28, c29);
    SLR S27(select[4], c27, c28);
    SLR S26(select[4], c26, c27);
    SLR S25(select[4], c25, c26);
    SLR S24(select[4], c24, c25);
    SLR S23(select[4], c23, c24);
    SLR S22(select[4], c22, c23);
    SLR S21(select[4], c21, c22);
    SLR S20(select[4], c20, c21);
    SLR S19(select[4], c19, c20);
    SLR S18(select[4], c18, c19);
    SLR S17(select[4], c17, c18);
    SLR S16(select[4], c16, c17);
    SLR S15(select[4], c15, c16);
    // 8 bit shift
    SLR S14(select[3], c14, c15);
    SLR S13(select[3], c13, c14);
    SLR S12(select[3], c12, c13);
    SLR S11(select[3], c11, c12);
    SLR S10(select[3], c10, c11);
    SLR S09(select[3], c9, c10);
    SLR S08(select[3], c8, c9);
    SLR S07(select[3], c7, c8);
    // 4 bit shift
    SLR S06(select[2], c6, c7);
    SLR S05(select[2], c5, c6);
    SLR S04(select[2], c4, c5);
    SLR S03(select[2], c3, c4);
    // 2 bit shift
    SLR S02(select[1], c2, c3);
    SLR S01(select[1], c1, c2);
    //1 bit shift
    SLR S00(select[0], entry, c1);
endmodule

module SHL_32(select, entry, out);
    input [4:0] select;
    input [31:0] entry;
    output [31:0] out;
    wire [31:0] c1, c2, c3, c4, c5, c6,
    c7, c8, c9, c10, c11, c12, c13, c14, c15,
    c16, c17, c18, c19, c20, c21, c22, c23, c24,
    c25, c26, c27, c28, c29, c30;
    //-----------------------------------------
    // 16 bit shift
    SHL S30(select[4], c30, out);
    SHL S29(select[4], c29, c30);
    SHL S28(select[4], c28, c29);
    SHL S27(select[4], c27, c28);
    SHL S26(select[4], c26, c27);
    SHL S25(select[4], c25, c26);
    SHL S24(select[4], c24, c25);
    SHL S23(select[4], c23, c24);
    SHL S22(select[4], c22, c23);
    SHL S21(select[4], c21, c22);
    SHL S20(select[4], c20, c21);
    SHL S19(select[4], c19, c20);
    SHL S18(select[4], c18, c19);
    SHL S17(select[4], c17, c18);
    SHL S16(select[4], c16, c17);
    SHL S15(select[4], c15, c16);
    // 8 bit shift
    SHL S14(select[3], c14, c15);
    SHL S13(select[3], c13, c14);
    SHL S12(select[3], c12, c13);
    SHL S11(select[3], c11, c12);
    SHL S10(select[3], c10, c11);
    SHL S09(select[3], c9, c10);
    SHL S08(select[3], c8, c9);
    SHL S07(select[3], c7, c8);
    // 4 bit shift
    SHL S06(select[2], c6, c7);
    SHL S05(select[2], c5, c6);
    SHL S04(select[2], c4, c5);
    SHL S03(select[2], c3, c4);
    // 2 bit shift
    SHL S02(select[1], c2, c3);
    SHL S01(select[1], c1, c2);
    //1 bit shift
    SHL S00(select[0], entry, c1);
endmodule

module SAR_32(select, entry, out);
    input [4:0] select;
    input [31:0] entry;
    output [31:0] out;
    wire [31:0] c1, c2, c3, c4, c5, c6,
    c7, c8, c9, c10, c11, c12, c13, c14, c15,
    c16, c17, c18, c19, c20, c21, c22, c23, c24,
    c25, c26, c27, c28, c29, c30;
    //-----------------------------------------
    // 16 bit shift
    SAR S30(select[4], c30, out);
    SAR S29(select[4], c29, c30);
    SAR S28(select[4], c28, c29);
    SAR S27(select[4], c27, c28);
    SAR S26(select[4], c26, c27);
    SAR S25(select[4], c25, c26);
    SAR S24(select[4], c24, c25);
    SAR S23(select[4], c23, c24);
    SAR S22(select[4], c22, c23);
    SAR S21(select[4], c21, c22);
    SAR S20(select[4], c20, c21);
    SAR S19(select[4], c19, c20);
    SAR S18(select[4], c18, c19);
    SAR S17(select[4], c17, c18);
    SAR S16(select[4], c16, c17);
    SAR S15(select[4], c15, c16);
    // 8 bit shift
    SAR S14(select[3], c14, c15);
    SAR S13(select[3], c13, c14);
    SAR S12(select[3], c12, c13);
    SAR S11(select[3], c11, c12);
    SAR S10(select[3], c10, c11);
    SAR S09(select[3], c9, c10);
    SAR S08(select[3], c8, c9);
    SAR S07(select[3], c7, c8);
    // 4 bit shift
    SAR S06(select[2], c6, c7);
    SAR S05(select[2], c5, c6);
    SAR S04(select[2], c4, c5);
    SAR S03(select[2], c3, c4);
    // 2 bit shift
    SAR S02(select[1], c2, c3);
    SAR S01(select[1], c1, c2);
    //1 bit shift
    SAR S00(select[0], entry, c1);
endmodule

module ROR_32(select, entry, out);
    input [4:0] select;
    input [31:0] entry;
    output [31:0] out;
    wire [31:0] c1, c2, c3, c4, c5, c6,
    c7, c8, c9, c10, c11, c12, c13, c14, c15,
    c16, c17, c18, c19, c20, c21, c22, c23, c24,
    c25, c26, c27, c28, c29, c30;
    //-----------------------------------------
    // 16 bit shift
    ROR R30(select[4], c30, out);
    ROR R29(select[4], c29, c30);
    ROR R28(select[4], c28, c29);
    ROR R27(select[4], c27, c28);
    ROR R26(select[4], c26, c27);
    ROR R25(select[4], c25, c26);
    ROR R24(select[4], c24, c25);
    ROR R23(select[4], c23, c24);
    ROR R22(select[4], c22, c23);
    ROR R21(select[4], c21, c22);
    ROR R20(select[4], c20, c21);
    ROR R19(select[4], c19, c20);
    ROR R18(select[4], c18, c19);
    ROR R17(select[4], c17, c18);
    ROR R16(select[4], c16, c17);
    ROR R15(select[4], c15, c16);
    // 8 bit shift
    ROR R14(select[3], c14, c15);
    ROR R13(select[3], c13, c14);
    ROR R12(select[3], c12, c13);
    ROR R11(select[3], c11, c12);
    ROR R10(select[3], c10, c11);
    ROR R09(select[3], c9, c10);
    ROR R08(select[3], c8, c9);
    ROR R07(select[3], c7, c8);
    // 4 bit shift
    ROR R06(select[2], c6, c7);
    ROR R05(select[2], c5, c6);
    ROR R04(select[2], c4, c5);
    ROR R03(select[2], c3, c4);
    // 2 bit shift
    ROR R02(select[1], c2, c3);
    ROR R01(select[1], c1, c2);
    //1 bit shift
    ROR R00(select[0], entry, c1);
endmodule

module SLR(select, entry, out);
    input [31:0]entry;
    input select;
    output [31:0]out;
    
    //1 bit shift right
    MUX2x1  M31(select,entry[31],1'b0,out[31]);
    MUX2x1  M30 (select,entry[30],entry[31],out[30]);
    MUX2x1  M29 (select,entry[29],entry[30],out[29]);
    MUX2x1  M28 (select,entry[28],entry[29],out[28]);
    MUX2x1  M27 (select,entry[27],entry[28],out[27]);
    MUX2x1  M26 (select,entry[26],entry[27],out[26]);
    MUX2x1  M25 (select,entry[25],entry[26],out[25]);
    MUX2x1  M24 (select,entry[24],entry[25],out[24]);
    MUX2x1  M23 (select,entry[23],entry[24],out[23]);
    MUX2x1  M22 (select,entry[22],entry[23],out[22]);
    MUX2x1  M21 (select,entry[21],entry[22],out[21]);
    MUX2x1  M20 (select,entry[20],entry[21],out[20]);
    MUX2x1  M19 (select,entry[19],entry[20],out[19]);
    MUX2x1  M18 (select,entry[18],entry[19],out[18]);
    MUX2x1  M17 (select,entry[17],entry[18],out[17]);
    MUX2x1  M16 (select,entry[16],entry[17],out[16]);
    MUX2x1  M15 (select,entry[15],entry[16],out[15]);
    MUX2x1  M14 (select,entry[14],entry[15],out[14]);
    MUX2x1  M13 (select,entry[13],entry[14],out[13]);
    MUX2x1  M12 (select,entry[12],entry[13],out[12]);
    MUX2x1  M11 (select,entry[11],entry[12],out[11]);
    MUX2x1  M10 (select,entry[10],entry[11],out[10]);
    MUX2x1  M9 (select,entry[9],entry[10],out[9]);
    MUX2x1  M8 (select,entry[8],entry[9],out[8]);
    MUX2x1  M7 (select,entry[7],entry[8],out[7]);
    MUX2x1  M6 (select,entry[6],entry[7],out[6]);
    MUX2x1  M5 (select,entry[5],entry[6],out[5]);
    MUX2x1  M4 (select,entry[4],entry[5],out[4]);
    MUX2x1  M3 (select,entry[3],entry[4],out[3]);
    MUX2x1  M2 (select,entry[2],entry[3],out[2]);
    MUX2x1  M1 (select,entry[1],entry[2],out[1]);
    MUX2x1  M0 (select,entry[0],entry[1],out[0]);
endmodule

module SHL(select, entry, out);
    input [31:0]entry;
    input select;
    output [31:0]out;
    
    //1 bit shift right
    MUX2x1  M31(select,entry[31],entry[30],out[31]);
    MUX2x1  M30 (select,entry[30],entry[29],out[30]);
    MUX2x1  M29 (select,entry[29],entry[28],out[29]);
    MUX2x1  M28 (select,entry[28],entry[27],out[28]);
    MUX2x1  M27 (select,entry[27],entry[26],out[27]);
    MUX2x1  M26 (select,entry[26],entry[25],out[26]);
    MUX2x1  M25 (select,entry[25],entry[24],out[25]);
    MUX2x1  M24 (select,entry[24],entry[23],out[24]);
    MUX2x1  M23 (select,entry[23],entry[22],out[23]);
    MUX2x1  M22 (select,entry[22],entry[21],out[22]);
    MUX2x1  M21 (select,entry[21],entry[20],out[21]);
    MUX2x1  M20 (select,entry[20],entry[19],out[20]);
    MUX2x1  M19 (select,entry[19],entry[18],out[19]);
    MUX2x1  M18 (select,entry[18],entry[17],out[18]);
    MUX2x1  M17 (select,entry[17],entry[16],out[17]);
    MUX2x1  M16 (select,entry[16],entry[15],out[16]);
    MUX2x1  M15 (select,entry[15],entry[14],out[15]);
    MUX2x1  M14 (select,entry[14],entry[13],out[14]);
    MUX2x1  M13 (select,entry[13],entry[12],out[13]);
    MUX2x1  M12 (select,entry[12],entry[11],out[12]);
    MUX2x1  M11 (select,entry[11],entry[10],out[11]);
    MUX2x1  M10 (select,entry[10],entry[9],out[10]);
    MUX2x1  M9 (select,entry[9],entry[8],out[9]);
    MUX2x1  M8 (select,entry[8],entry[7],out[8]);
    MUX2x1  M7 (select,entry[7],entry[6],out[7]);
    MUX2x1  M6 (select,entry[6],entry[5],out[6]);
    MUX2x1  M5 (select,entry[5],entry[4],out[5]);
    MUX2x1  M4 (select,entry[4],entry[3],out[4]);
    MUX2x1  M3 (select,entry[3],entry[2],out[3]);
    MUX2x1  M2 (select,entry[2],entry[1],out[2]);
    MUX2x1  M1 (select,entry[1],entry[0],out[1]);
    MUX2x1  M0 (select,entry[0],1'b0,out[0]);
endmodule

module SAR(select, entry, out);
    input [31:0]entry;
    input select;
    output [31:0]out;
    
    //1 bit shift right
    MUX2x1  M31(select,entry[31],entry[31],out[31]);
    MUX2x1  M30 (select,entry[30],entry[31],out[30]);
    MUX2x1  M29 (select,entry[29],entry[30],out[29]);
    MUX2x1  M28 (select,entry[28],entry[29],out[28]);
    MUX2x1  M27 (select,entry[27],entry[28],out[27]);
    MUX2x1  M26 (select,entry[26],entry[27],out[26]);
    MUX2x1  M25 (select,entry[25],entry[26],out[25]);
    MUX2x1  M24 (select,entry[24],entry[25],out[24]);
    MUX2x1  M23 (select,entry[23],entry[24],out[23]);
    MUX2x1  M22 (select,entry[22],entry[23],out[22]);
    MUX2x1  M21 (select,entry[21],entry[22],out[21]);
    MUX2x1  M20 (select,entry[20],entry[21],out[20]);
    MUX2x1  M19 (select,entry[19],entry[20],out[19]);
    MUX2x1  M18 (select,entry[18],entry[19],out[18]);
    MUX2x1  M17 (select,entry[17],entry[18],out[17]);
    MUX2x1  M16 (select,entry[16],entry[17],out[16]);
    MUX2x1  M15 (select,entry[15],entry[16],out[15]);
    MUX2x1  M14 (select,entry[14],entry[15],out[14]);
    MUX2x1  M13 (select,entry[13],entry[14],out[13]);
    MUX2x1  M12 (select,entry[12],entry[13],out[12]);
    MUX2x1  M11 (select,entry[11],entry[12],out[11]);
    MUX2x1  M10 (select,entry[10],entry[11],out[10]);
    MUX2x1  M9 (select,entry[9],entry[10],out[9]);
    MUX2x1  M8 (select,entry[8],entry[9],out[8]);
    MUX2x1  M7 (select,entry[7],entry[8],out[7]);
    MUX2x1  M6 (select,entry[6],entry[7],out[6]);
    MUX2x1  M5 (select,entry[5],entry[6],out[5]);
    MUX2x1  M4 (select,entry[4],entry[5],out[4]);
    MUX2x1  M3 (select,entry[3],entry[4],out[3]);
    MUX2x1  M2 (select,entry[2],entry[3],out[2]);
    MUX2x1  M1 (select,entry[1],entry[2],out[1]);
    MUX2x1  M0 (select,entry[0],entry[1],out[0]);
endmodule

module ROR(select, entry, out);
    input [31:0]entry;
    input select;
    output [31:0]out;
    
    //1 bit shift right
    MUX2x1  M31(select,entry[31],entry[0],out[31]);
    MUX2x1  M30 (select,entry[30],entry[31],out[30]);
    MUX2x1  M29 (select,entry[29],entry[30],out[29]);
    MUX2x1  M28 (select,entry[28],entry[29],out[28]);
    MUX2x1  M27 (select,entry[27],entry[28],out[27]);
    MUX2x1  M26 (select,entry[26],entry[27],out[26]);
    MUX2x1  M25 (select,entry[25],entry[26],out[25]);
    MUX2x1  M24 (select,entry[24],entry[25],out[24]);
    MUX2x1  M23 (select,entry[23],entry[24],out[23]);
    MUX2x1  M22 (select,entry[22],entry[23],out[22]);
    MUX2x1  M21 (select,entry[21],entry[22],out[21]);
    MUX2x1  M20 (select,entry[20],entry[21],out[20]);
    MUX2x1  M19 (select,entry[19],entry[20],out[19]);
    MUX2x1  M18 (select,entry[18],entry[19],out[18]);
    MUX2x1  M17 (select,entry[17],entry[18],out[17]);
    MUX2x1  M16 (select,entry[16],entry[17],out[16]);
    MUX2x1  M15 (select,entry[15],entry[16],out[15]);
    MUX2x1  M14 (select,entry[14],entry[15],out[14]);
    MUX2x1  M13 (select,entry[13],entry[14],out[13]);
    MUX2x1  M12 (select,entry[12],entry[13],out[12]);
    MUX2x1  M11 (select,entry[11],entry[12],out[11]);
    MUX2x1  M10 (select,entry[10],entry[11],out[10]);
    MUX2x1  M9 (select,entry[9],entry[10],out[9]);
    MUX2x1  M8 (select,entry[8],entry[9],out[8]);
    MUX2x1  M7 (select,entry[7],entry[8],out[7]);
    MUX2x1  M6 (select,entry[6],entry[7],out[6]);
    MUX2x1  M5 (select,entry[5],entry[6],out[5]);
    MUX2x1  M4 (select,entry[4],entry[5],out[4]);
    MUX2x1  M3 (select,entry[3],entry[4],out[3]);
    MUX2x1  M2 (select,entry[2],entry[3],out[2]);
    MUX2x1  M1 (select,entry[1],entry[2],out[1]);
    MUX2x1  M0 (select,entry[0],entry[1],out[0]);
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