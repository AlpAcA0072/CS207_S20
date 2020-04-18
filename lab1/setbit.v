// module setbit(output A);
// wire A;
// assign A = 1;
// endmodule

module setbit_tb;
wire A;
setbit SetBit (.A (A));

initial begin 

    # 10 if (A != 1)
        $display("error! output is not 1")
    else 
        $display("it works");
        
    # 10 $finish;

end
endmodule