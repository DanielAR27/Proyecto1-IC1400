module TestBench;
    reg [4:0] seleccion;
    reg [31:0] entrada;
    wire [31:0] salida;
    ROR_32 S00(seleccion, entrada, salida);
    initial begin
        seleccion = 5'b00010;
        entrada = 32'b01000000000000000000000000000001;
        #10000
        $display("entrada: %b", entrada);
        #10000
        $display("RESULTADO: %b", salida);
    end
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
    MUX2X1  M31(select,entry[31],1'b0,out[31]);
    MUX2X1  M30 (select,entry[30],entry[31],out[30]);
    MUX2X1  M29 (select,entry[29],entry[30],out[29]);
    MUX2X1  M28 (select,entry[28],entry[29],out[28]);
    MUX2X1  M27 (select,entry[27],entry[28],out[27]);
    MUX2X1  M26 (select,entry[26],entry[27],out[26]);
    MUX2X1  M25 (select,entry[25],entry[26],out[25]);
    MUX2X1  M24 (select,entry[24],entry[25],out[24]);
    MUX2X1  M23 (select,entry[23],entry[24],out[23]);
    MUX2X1  M22 (select,entry[22],entry[23],out[22]);
    MUX2X1  M21 (select,entry[21],entry[22],out[21]);
    MUX2X1  M20 (select,entry[20],entry[21],out[20]);
    MUX2X1  M19 (select,entry[19],entry[20],out[19]);
    MUX2X1  M18 (select,entry[18],entry[19],out[18]);
    MUX2X1  M17 (select,entry[17],entry[18],out[17]);
    MUX2X1  M16 (select,entry[16],entry[17],out[16]);
    MUX2X1  M15 (select,entry[15],entry[16],out[15]);
    MUX2X1  M14 (select,entry[14],entry[15],out[14]);
    MUX2X1  M13 (select,entry[13],entry[14],out[13]);
    MUX2X1  M12 (select,entry[12],entry[13],out[12]);
    MUX2X1  M11 (select,entry[11],entry[12],out[11]);
    MUX2X1  M10 (select,entry[10],entry[11],out[10]);
    MUX2X1  M9 (select,entry[9],entry[10],out[9]);
    MUX2X1  M8 (select,entry[8],entry[9],out[8]);
    MUX2X1  M7 (select,entry[7],entry[8],out[7]);
    MUX2X1  M6 (select,entry[6],entry[7],out[6]);
    MUX2X1  M5 (select,entry[5],entry[6],out[5]);
    MUX2X1  M4 (select,entry[4],entry[5],out[4]);
    MUX2X1  M3 (select,entry[3],entry[4],out[3]);
    MUX2X1  M2 (select,entry[2],entry[3],out[2]);
    MUX2X1  M1 (select,entry[1],entry[2],out[1]);
    MUX2X1  M0 (select,entry[0],entry[1],out[0]);
endmodule

module SHL(select, entry, out);
    input [31:0]entry;
    input select;
    output [31:0]out;
    
    //1 bit shift right
    MUX2X1  M31(select,entry[31],entry[30],out[31]);
    MUX2X1  M30 (select,entry[30],entry[29],out[30]);
    MUX2X1  M29 (select,entry[29],entry[28],out[29]);
    MUX2X1  M28 (select,entry[28],entry[27],out[28]);
    MUX2X1  M27 (select,entry[27],entry[26],out[27]);
    MUX2X1  M26 (select,entry[26],entry[25],out[26]);
    MUX2X1  M25 (select,entry[25],entry[24],out[25]);
    MUX2X1  M24 (select,entry[24],entry[23],out[24]);
    MUX2X1  M23 (select,entry[23],entry[22],out[23]);
    MUX2X1  M22 (select,entry[22],entry[21],out[22]);
    MUX2X1  M21 (select,entry[21],entry[20],out[21]);
    MUX2X1  M20 (select,entry[20],entry[19],out[20]);
    MUX2X1  M19 (select,entry[19],entry[18],out[19]);
    MUX2X1  M18 (select,entry[18],entry[17],out[18]);
    MUX2X1  M17 (select,entry[17],entry[16],out[17]);
    MUX2X1  M16 (select,entry[16],entry[15],out[16]);
    MUX2X1  M15 (select,entry[15],entry[14],out[15]);
    MUX2X1  M14 (select,entry[14],entry[13],out[14]);
    MUX2X1  M13 (select,entry[13],entry[12],out[13]);
    MUX2X1  M12 (select,entry[12],entry[11],out[12]);
    MUX2X1  M11 (select,entry[11],entry[10],out[11]);
    MUX2X1  M10 (select,entry[10],entry[9],out[10]);
    MUX2X1  M9 (select,entry[9],entry[8],out[9]);
    MUX2X1  M8 (select,entry[8],entry[7],out[8]);
    MUX2X1  M7 (select,entry[7],entry[6],out[7]);
    MUX2X1  M6 (select,entry[6],entry[5],out[6]);
    MUX2X1  M5 (select,entry[5],entry[4],out[5]);
    MUX2X1  M4 (select,entry[4],entry[3],out[4]);
    MUX2X1  M3 (select,entry[3],entry[2],out[3]);
    MUX2X1  M2 (select,entry[2],entry[1],out[2]);
    MUX2X1  M1 (select,entry[1],entry[0],out[1]);
    MUX2X1  M0 (select,entry[0],1'b0,out[0]);
endmodule

module SAR(select, entry, out);
    input [31:0]entry;
    input select;
    output [31:0]out;
    
    //1 bit shift right
    MUX2X1  M31(select,entry[31],entry[31],out[31]);
    MUX2X1  M30 (select,entry[30],entry[31],out[30]);
    MUX2X1  M29 (select,entry[29],entry[30],out[29]);
    MUX2X1  M28 (select,entry[28],entry[29],out[28]);
    MUX2X1  M27 (select,entry[27],entry[28],out[27]);
    MUX2X1  M26 (select,entry[26],entry[27],out[26]);
    MUX2X1  M25 (select,entry[25],entry[26],out[25]);
    MUX2X1  M24 (select,entry[24],entry[25],out[24]);
    MUX2X1  M23 (select,entry[23],entry[24],out[23]);
    MUX2X1  M22 (select,entry[22],entry[23],out[22]);
    MUX2X1  M21 (select,entry[21],entry[22],out[21]);
    MUX2X1  M20 (select,entry[20],entry[21],out[20]);
    MUX2X1  M19 (select,entry[19],entry[20],out[19]);
    MUX2X1  M18 (select,entry[18],entry[19],out[18]);
    MUX2X1  M17 (select,entry[17],entry[18],out[17]);
    MUX2X1  M16 (select,entry[16],entry[17],out[16]);
    MUX2X1  M15 (select,entry[15],entry[16],out[15]);
    MUX2X1  M14 (select,entry[14],entry[15],out[14]);
    MUX2X1  M13 (select,entry[13],entry[14],out[13]);
    MUX2X1  M12 (select,entry[12],entry[13],out[12]);
    MUX2X1  M11 (select,entry[11],entry[12],out[11]);
    MUX2X1  M10 (select,entry[10],entry[11],out[10]);
    MUX2X1  M9 (select,entry[9],entry[10],out[9]);
    MUX2X1  M8 (select,entry[8],entry[9],out[8]);
    MUX2X1  M7 (select,entry[7],entry[8],out[7]);
    MUX2X1  M6 (select,entry[6],entry[7],out[6]);
    MUX2X1  M5 (select,entry[5],entry[6],out[5]);
    MUX2X1  M4 (select,entry[4],entry[5],out[4]);
    MUX2X1  M3 (select,entry[3],entry[4],out[3]);
    MUX2X1  M2 (select,entry[2],entry[3],out[2]);
    MUX2X1  M1 (select,entry[1],entry[2],out[1]);
    MUX2X1  M0 (select,entry[0],entry[1],out[0]);
endmodule

module ROR(select, entry, out);
    input [31:0]entry;
    input select;
    output [31:0]out;
    
    //1 bit shift right
    MUX2X1  M31(select,entry[31],entry[0],out[31]);
    MUX2X1  M30 (select,entry[30],entry[31],out[30]);
    MUX2X1  M29 (select,entry[29],entry[30],out[29]);
    MUX2X1  M28 (select,entry[28],entry[29],out[28]);
    MUX2X1  M27 (select,entry[27],entry[28],out[27]);
    MUX2X1  M26 (select,entry[26],entry[27],out[26]);
    MUX2X1  M25 (select,entry[25],entry[26],out[25]);
    MUX2X1  M24 (select,entry[24],entry[25],out[24]);
    MUX2X1  M23 (select,entry[23],entry[24],out[23]);
    MUX2X1  M22 (select,entry[22],entry[23],out[22]);
    MUX2X1  M21 (select,entry[21],entry[22],out[21]);
    MUX2X1  M20 (select,entry[20],entry[21],out[20]);
    MUX2X1  M19 (select,entry[19],entry[20],out[19]);
    MUX2X1  M18 (select,entry[18],entry[19],out[18]);
    MUX2X1  M17 (select,entry[17],entry[18],out[17]);
    MUX2X1  M16 (select,entry[16],entry[17],out[16]);
    MUX2X1  M15 (select,entry[15],entry[16],out[15]);
    MUX2X1  M14 (select,entry[14],entry[15],out[14]);
    MUX2X1  M13 (select,entry[13],entry[14],out[13]);
    MUX2X1  M12 (select,entry[12],entry[13],out[12]);
    MUX2X1  M11 (select,entry[11],entry[12],out[11]);
    MUX2X1  M10 (select,entry[10],entry[11],out[10]);
    MUX2X1  M9 (select,entry[9],entry[10],out[9]);
    MUX2X1  M8 (select,entry[8],entry[9],out[8]);
    MUX2X1  M7 (select,entry[7],entry[8],out[7]);
    MUX2X1  M6 (select,entry[6],entry[7],out[6]);
    MUX2X1  M5 (select,entry[5],entry[6],out[5]);
    MUX2X1  M4 (select,entry[4],entry[5],out[4]);
    MUX2X1  M3 (select,entry[3],entry[4],out[3]);
    MUX2X1  M2 (select,entry[2],entry[3],out[2]);
    MUX2X1  M1 (select,entry[1],entry[2],out[1]);
    MUX2X1  M0 (select,entry[0],entry[1],out[0]);
endmodule

module MUX2X1(S, I0, I1, Out);
    input I0, I1, S;
    output Out;
    wire c1, c2, c3;
    //---------------------
    and #(2) g1(c1, I1, S);
    not #(2) g2(c3, S);
    and #(2) g3(c2, I0, c3);
    or #(2) g4(Out, c1, c2);
endmodule