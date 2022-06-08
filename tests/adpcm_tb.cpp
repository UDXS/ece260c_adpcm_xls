#include <cstdio>
#include <cstdio>
#include <verilated.h>
#include "Vadpcm_xls.h"

#define VERBOSE 0

#if VERBOSE
#define verbprintf(...) printf(__VA_ARGS__)
#else
#define verbprintf(...)
#endif


int main(int argc, char** argv) {
    puts("Lab 2 - ADPCM Testbench - Davit Margarian");

    Verilated::commandArgs(argc, argv);
    FILE* wave = fopen("wave.dat", "r");
    if(wave == NULL) {
        puts("Couldn't open wave.dat");
        return 0;
    }


    FILE* out = fopen("out.dat", "w");
    if(out == NULL) {
        puts("Couldn't open out.dat");
        return 0;
    }

    fflush(stdout);
    if(wave == NULL)
        return 1;

    Vadpcm_xls* dut = new Vadpcm_xls;
    dut->in_sample = 0;
    dut->in_sample_vld = 0;
    dut->out_pred_rdy = 0;
    dut->clk = 0;
    dut->rst = 1;
    dut->eval();
    dut->clk = 1;
    dut->rst = 1;
    dut->eval();
    dut->clk = 0;
    dut->rst = 0;
    dut->eval();

    fflush(stdout);
    int sample = 0;
    while(fscanf(wave, "%X", &sample) != -1) {
        verbprintf("Pushing sample %X... ", sample);
        int16_t samp_quant = sample << 8;
        dut->in_sample = samp_quant;
        dut->in_sample_vld = 1;
        dut->out_pred_rdy = 1;
        verbprintf("PUSHED\n");

            dut->clk = 1;
            dut->eval();
            dut->clk = 0;
            dut->eval();
        dut->in_sample_vld = 0;

        verbprintf("Wait(Ready for Sample)... ");
        int ready_wait_cyc = 0;
        while(!dut->out_pred_vld) {
            dut->clk = 1;
            dut->eval();
            dut->clk = 0;
            dut->eval();
            ready_wait_cyc++;
        }
        int16_t predicted = dut->out_pred;
        verbprintf("READY after %d cycles.\n", ready_wait_cyc);        
        printf("s_in = %d, s_out = %d\n", samp_quant, predicted);
        fprintf(out, "%hX\n", predicted);
    }

    dut->final();
}