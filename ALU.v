// Comprobaciones
module TestBench;
    reg [31:0] A, B;
    reg [0:3] code;
    wire [31:0] out;
    wire [3:0] st;
    ALU A00(A, B, code, out, st);
    initial begin
        //A = 32'b00000000000000000000000000000001;
        // A = 32'b11111111111111111111111111111111;
        //B = 32'b000000000000000000000000000011111;
        //B = 32'b000000000000000000000000000000001;
        A = 4;
        B = 6;
        //A = 32'b10101011010111001101011111011010;
        //B = 32'b11010100101111100010111000101111;
        code = 4'b0111;
        #1000
        $display("---------------------");
        $display("RESULTADO: %b", out);
        $display("STATUS: %b", st);
        $finish;
    end
endmodule

// Unidad central de la Unidad Lógica Aritmética (ALU).
module ALU(op1, op2, codigo, out, status);
    // Entradas
    input [31:0] op1, op2;
    input [3:0] codigo;
    // Salidas
    output [3:0] status;
    output [31:0] out;
    // Cables
    wire c0, status_condition;
    wire c_out;
    wire [31:0] out1, out2, out3;
    wire [31:0] flash_out;
    wire [3:0] status1, status2;
    //---------------------------
    // ALU
    // Componente aritmético.
    Aritmetico A00(op1, op2, codigo[0], codigo[1], out1, c_out);
    // Componente booleano.
    Booleano B00(op1, op2, codigo[0], codigo[1], out2);
    // Componente desplazamiento.
    Desplazamiento D00(op1, op2[4:0], codigo[0], codigo[1], out3);
    // STATUS
    ArithmeticStatus AS00(op1[31], op2[31], flash_out, c_out, status1);
    OtherStatus OS00(flash_out, status2);
    // CONDICIÓN DE STATUS
    not #(2) g1(c0, codigo[3]);
    and #(2) g2(status_condition, c0, codigo[2]);
    // DECISIÓN DE SALIDA SEǴUN EL CÓDIGO
    MUX4x1_32 M00(codigo[3], codigo[2], 32'b0, out1, out2, out3, flash_out);
    // Asignar el valor del "flash out" al out.
    OR_32 X00(32'b0 , flash_out, out);
    // DECISION DE FINAL DE STATUS (OI, ZI, NI, CI).
    MUX2x1_4 M01(status_condition, status2, status1, status);
endmodule


// ARITMETICO

// Unidad central del operador aritmético.
module Aritmetico(A, B, f0, f1, S, C);
    // Entradas 
    input [31:0] A, B;
    input f0, f1;
    // Salidas
    output [31:0] S;
    output C;
    // Cables
    wire [31:0] mux_a, inv_b, mux_b;
    wire xor_code, or_code;
    //----------------------------
    MUX2x1_32 M1(f1, A, 0, mux_a);
    Inversor_32 I1(B, inv_b);
    xor #(3) g1 (xor_code, f0, f1);
    MUX2x1_32 M2(xor_code, B, inv_b, mux_b);
    or #(2) g2(or_code, f0, f1);
    Adder32 A1(mux_b, mux_a, or_code, S, C);
endmodule

// Obtener inverso para 32 bits.
module Inversor_32(entry, out);
    // Entradas
    input [31:0] entry;
    // Salidas
    output [31:0] out;
    //---------------
    //Buscar los resultados individualmente
    //Llamar a un nuevo modulo 
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

// Obtener inverso individualmente.
module Inversor(A, out);
    // Entradas
    input A;
    // Salidas
    output out;
    //--------------------
    // Inversor hecho con "XOR".
    xor g1(out, 1'b1, A);
endmodule


//Sumador de 32 bits para proyecto TECic
module Adder32(A, B, c_in,  S, C);
    //Entradas
    input  [31:0] A, B;
    input   c_in;
	//Salidas
    output [31:0] S;
	output C;
    //Almacenamiento
    wire
	c31,c30,c29,c28,c27,c26,c25,c24,c23,c22,c21,c20,c19,c18,   c17,c16,
		c15,c14,c13,c12,c11,c10,c09,c08,c07,c06,c05,c04,c03,c02,c01,c00;
    //Obtener resultados de todos los bits
    //Llamar a un nuevo modulo 
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


// BOOLEANO

//Unidad central del operador booleano.
module Booleano(A, B, f0, f1, Out);
    // Entradas
    input [31:0] A, B;
    input f0, f1;
    // Salidas
    output [31:0] Out;
    // Cables
    wire [31:0] and_code, or_code, xor_code;
    //--------------------------------------
    AND_32 A0(A, B, and_code);
    OR_32 O0(A, B, or_code);
    XOR_32 X0(A, B, xor_code);
    MUX4x1_32 MO(f1, f0, 0, and_code, or_code, xor_code, Out);
endmodule

// AND para 32 bits.
module AND_32(A, B, out);
    // Entradas
    input [31:0] A,B;
    // Salidas
    output [31:0] out;
    //---------------
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

// OR para 32 bits.
module OR_32(A, B, out);
    // Entradas
    input [31:0] A,B;
    // Salidas
    output [31:0] out;
    //----------------
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

// XOR para 32 bits.
module XOR_32(A, B, out);
    // Entradas
    input [31:0] A,B;
    // Salidas
    output [31:0] out;
    //----------------
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


// DESPLAZAMIENTO

//Unidad central del operador de desplazamiento.
module Desplazamiento(num, select, f0, f1, Out);
    // Entradas
    // La entrada la cual se le aplicará desplazamiento.
    input [31:0] num;
    // La cantidad de veces a desplazar.
    input [4:0] select;
    input f0,f1;
    // Cables
    wire [31:0] shl_code, slr_code, sar_code, ror_code;
    // Salidas
    output [31:0] Out;
    //--------------------------------------
    SHL_32 SHL00(select, num, shl_code);
    SLR_32 SLR00(select, num, slr_code);
    SAR_32 SAR00(select, num, sar_code);
    ROR_32 ROR00(select, num, ror_code);
    MUX4x1_32 M0(f1, f0, shl_code, slr_code, sar_code, ror_code, Out);
endmodule

// Trasladar a la derecha para 32 bits.
module SLR_32(select, entry, out);
    // Entradas
    input [4:0] select;
    input [31:0] entry;
    // Salidas
    output [31:0] out;
    // Cables
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

// Trasladar a la izquierda para 32 bits.
module SHL_32(select, entry, out);
    // Entradas
    input [4:0] select;
    input [31:0] entry;
    // Salidas
    output [31:0] out;
    // Cables
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

// Trasladar a la izquierda aritmético para 32 bits.
module SAR_32(select, entry, out);
    // Entradas
    input [4:0] select;
    input [31:0] entry;
    // Salidas
    output [31:0] out;
    // Cables
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


// Rotar a la derecha para 32 bits.
module ROR_32(select, entry, out);
    // Entradas
    input [4:0] select;
    input [31:0] entry;
    // Salidas
    output [31:0] out;
    // Cables
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

// Trasladar a la derecha.
module SLR(select, entry, out);
    // Entradas
    input [31:0]entry;
    input select;
    // Salidas
    output [31:0]out;
    //---------------
    // Shift de un bit a derecha.
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

// Trasladar a la izquierda.
module SHL(select, entry, out);
    // Entradas
    input [31:0]entry;
    input select;
    // Salidas
    output [31:0]out;
    //---------------
    // Shift de un bit a derecha.
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

// Trasladar a la derecha aritmético.
module SAR(select, entry, out);
    // Entradas
    input [31:0]entry;
    input select;
    // Salidas
    output [31:0]out;
    //---------------
    // Shift de un bit a derecha.
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

// Rotar a la derecha.
module ROR(select, entry, out);
    // Entradas
    input [31:0]entry;
    input select;
    // Salidas
    output [31:0]out;
    //---------------
    // Shift de un bit a derecha.
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


// MULTIPLEXORES

// MUX4x1 para entradas de 32 bits.
module MUX4x1_32(S0, S1, I0, I1, I2, I3, Out);
    // Entradas
    input [31:0] I0, I1, I2, I3;
    input S0, S1;
    // Salidas
    output [31:0] Out;
    //----------------
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


// MUX2x1 para entradas de 32 bits.
module MUX2x1_32(S, I0, I1, Out);
    //Entradas
    input [31:0] I0, I1;
    input S;
    //Salidas
    output [31:0] Out;
    //Obtener resultados de todos los bits
    //Llamar a un nuevo modulo 
    //------------------
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

// MUX2x1 para entradas de 4 bits.
module MUX2x1_4(S, I0, I1, Out);
    // Entradas
    input [3:0] I0, I1;
    input S;
    // Salidas
    output [3:0] Out;
    //----------------
    MUX2x1 M00(S, I0[0], I1[0], Out[0]);
    MUX2x1 M01(S, I0[1], I1[1], Out[1]);
    MUX2x1 M02(S, I0[2], I1[2], Out[2]);
    MUX2x1 M03(S, I0[3], I1[3], Out[3]);
endmodule

// Obtiene los resultados individuales de MUX2x1_32 y MUX2x1_4 (Multiplexor de 2 entradas).
module MUX2x1(S, I0, I1, Out);
    // Entradas
    input I0, I1, S;
    // Salidas
    output Out;
    // Cables
    wire c1, c2, c3;
    //---------------------
    and #(2) g1(c1, I1, S);
    not #(2) g2(c3, S);
    and #(2) g3(c2, I0, c3);
    or #(2) g4(Out, c1, c2);
endmodule

// Se usa en MUX4x1_32 (Multiplexor de 4 entradas).
module MUX4x1(S0, S1, I0, I1, I2, I3, Out);
    // Entradas
    input I0,  I1, I2, I3, S0, S1;
    // Salidas
    output Out;
    // Cables
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


// STATUS

// Status para operaciones aritméticas.
module ArithmeticStatus(last_bit1, last_bit2, result, c_out, out);
    // Entradas
    input last_bit1, last_bit2, c_out;
    input [31:0] result;
    // Salidas
    output [3:0] out;
    //----------------------------------
    OverFlowStatus OF00(last_bit1, last_bit2, result[31], out[3]);
    ZeroStatus Z00(result, out[2]);
    xor #(3) g1(out[1], 1'b0, result[31]);
    xor #(3) g2(out[0], 1'b0, c_out);
endmodule

// Circuto para revisar si hubo overflow en una operación aritmética.
module OverFlowStatus(sign_1, sign_2, sign_3, out);
    // Entradas
    input sign_1, sign_2, sign_3;
    // Salidas
    output out;
    // Cables
    wire c1, c2, c3, c4, c5;
    //----------------------------------------
    not #(2) (c1, sign_1);
    not #(2) (c2, sign_2);
    not #(2) (c3, sign_3);
    and #(2) (c4, c1, c2, sign_3);
    and #(2) (c5, sign_1, sign_2, c3);
    or #(2) (out, c4, c5);
endmodule

// Verificación para saber si el resultado es igual a cero.
module ZeroStatus(entry, out);
    // Entradas
    input [31:0] entry;
    // Salidas
    output out;
    // Cables
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

// Status para operaciones booleanas y desplazamiento.
module OtherStatus(result, out);
    // Entradas
    input [31:0] result;
    // Salidas
    output [3:0] out;
    //----------------------------------
    or #(2) g1(out[3], 1'b0, 1'b0);
    ZeroStatus Z00(result, out[2]);
    or #(2) g2(out[1], 1'b0, result[31]);
    or #(2) g3(out[0], 1'b0, 1'b0);
endmodule