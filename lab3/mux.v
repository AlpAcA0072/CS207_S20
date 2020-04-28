primitive mux(Y, A, B, C, D, S1, S2);

    output Y;
    input A, B, C, D, S1, S2;

    table
//      A   B   C   D   S1  S2  :   Y
        0   ?   ?   ?   0   0   :   0;   
        1   ?   ?   ?   0   0   :   1;
        ?   0   ?   ?   0   1   :   0;
        ?   1   ?   ?   0   1   :   1;
        ?   ?   0   ?   1   0   :   0;
        ?   ?   1   ?   1   0   :   1;
        ?   ?   ?   0   1   1   :   0;
        ?   ?   ?   1   1   1   :   1;

    endtable

endprimitive

//false, b should be replaced with ?

module mux_tb;
reg A, B, C, D, S1, S2;
wire Y;

mux mux_1(Y, A, B, C, D, S1, S2);

initial begin

        $monitor("current time is: %3t: S1 is %B, S2 is %B, A is %B, B is %B, C is %B, D is %B, Y is %B.", $time, S1, S2, A, B, C, D, Y);
        # 5 S1 = 0; S2 = 1; A = 0; B = 0; C = 0; D = 0;
        # 5 S1 = 0; S2 = 1; A = 0; B = 0; C = 0; D = 1;
        # 5 S1 = 0; S2 = 1; A = 0; B = 0; C = 1; D = 0;
        # 5 S1 = 0; S2 = 1; A = 0; B = 0; C = 1; D = 1;
        # 5 S1 = 0; S2 = 1; A = 0; B = 1; C = 0; D = 0;
        # 5 S1 = 0; S2 = 1; A = 0; B = 1; C = 0; D = 1;
        # 5 S1 = 0; S2 = 1; A = 0; B = 1; C = 1; D = 0;
        # 5 S1 = 0; S2 = 1; A = 0; B = 1; C = 1; D = 1;
        # 5 S1 = 0; S2 = 1; A = 1; B = 0; C = 0; D = 0;
        # 5 S1 = 0; S2 = 1; A = 1; B = 0; C = 0; D = 1;
        # 5 S1 = 0; S2 = 1; A = 1; B = 0; C = 1; D = 0;
        # 5 S1 = 0; S2 = 1; A = 1; B = 0; C = 1; D = 1;
        # 5 S1 = 0; S2 = 1; A = 1; B = 1; C = 0; D = 0;
        # 5 S1 = 0; S2 = 1; A = 1; B = 1; C = 0; D = 1;
        # 5 S1 = 0; S2 = 1; A = 1; B = 1; C = 1; D = 0;
        # 5 S1 = 0; S2 = 1; A = 1; B = 1; C = 1; D = 1;
        #10 $finish;

    end
endmodule