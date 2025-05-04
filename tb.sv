
module tb ();

    parameter WIDTH    = 32;


      logic                   clk;
      logic                   rst_n;
      logic signed [WIDTH-1:0] a;
      logic signed [WIDTH-1:0] b;
      logic signed [WIDTH-1:0] c;
      logic signed [WIDTH-1:0] d;
     logic signed [WIDTH-1:0] q;
    test_yadro #(
        .WIDTH (WIDTH)
    ) DUT (
        .clk                 ( clk),
        .rst_n               ( rst_n),
        .a                   ( a    ),
        .b                   ( b    ),
        .c                   ( c    ),
        .d                   ( d    ),
        .q                   ( q    )
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb); 
    end

    initial begin
        clk <= 1'b0;
        forever begin
            #1 clk = ~clk;
        end
    end
    integer outfile;
    initial begin
        outfile = $fopen("output.txt", "w");
        rst_n = 0;
        #10;
        rst_n = 1;
        repeat(100) begin
        a = ($urandom_range(0,1)) ? $urandom_range(0,99999) : -$urandom_range(0,99999);
        b = ($urandom_range(0,1)) ? $urandom_range(0,99999) : -$urandom_range(0,99999);
        c = ($urandom_range(0,1)) ? $urandom_range(0,99999) : -$urandom_range(0,99999);
        d = ($urandom_range(0,1)) ? $urandom_range(0,99999) : -$urandom_range(0,99999);
        #10;
        $fdisplay(outfile, "time=%d|clk=%b|rst_n=%b|a=%d|b=%d|c=%d|d=%d|result=%d", $time, clk, rst_n, a, b, c, d, q);
    end
        $finish();
    end
endmodule