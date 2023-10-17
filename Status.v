module TestBench;
    reg A, B, C;
    wire salida;
    OverFlowStatus O00(A, B, C, salida);
    initial begin
        A = 1;
        B = 1;
        C = 1;
        #1000
        $display("RESULTADO: %b", salida);
    end
endmodule

module OtherStatus(result, out);
    input [31:0] result;
    output [3:0] out;
    //----------------------------------
    xor #(3) g1(out[1], 1'b0, 1'b0);
    ZeroStatus Z00(result, out[2]);
    xor #(3) g2(out[1], 1'b0, result[31]);
    xor #(3) g3(out[0], 1'b0, 1'b0);
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
