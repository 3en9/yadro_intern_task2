module test_yadro #(
    parameter WIDTH = 32
)(
    input  logic                   clk,
    input  logic                   rst_n,
    input  logic signed [WIDTH-1:0] a,
    input  logic signed [WIDTH-1:0] b,
    input  logic signed [WIDTH-1:0] c,
    input  logic signed [WIDTH-1:0] d,
    output logic signed [WIDTH-1:0] q
);

    logic signed [WIDTH-1:0] a_reg1, b_reg1, c_reg1, d_reg1;
    logic signed [WIDTH-1:0] ab_diff_reg2, c3add1_reg2, d4_reg2;
    logic signed [WIDTH-1:0] mul1_reg3, d4_reg3;
    logic signed [WIDTH-1:0] result_reg4;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_reg1 <= 0;
            b_reg1 <= 0;
            c_reg1 <= 0;
            d_reg1 <= 0;
        end else begin
            a_reg1 <= a;
            b_reg1 <= b;
            c_reg1 <= c;
            d_reg1 <= d;
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ab_diff_reg2 <= 0;
            c3add1_reg2 <= 0;
            d4_reg2 <= 0;
        end else begin
            ab_diff_reg2 <= a_reg1 - b_reg1;
            c3add1_reg2  <= 1 + 3 * c_reg1;
            d4_reg2      <= 4 * d_reg1;
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mul1_reg3 <= 0;
            d4_reg3 <= 0;
        end else begin
            mul1_reg3 <= ab_diff_reg2 * c3add1_reg2;
            d4_reg3 <= d4_reg2;
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            result_reg4 <= 0;
        else
            result_reg4 <= (mul1_reg3 - d4_reg3) >>> 1;
    end

    assign q = result_reg4;

endmodule
