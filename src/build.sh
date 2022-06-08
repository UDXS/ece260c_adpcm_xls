rm -rf build
mkdir build

rm -rf out
mkdir out

../bazel-bin/xls/tools/proto2bin channels.textproto --message xlscc.HLSBlock --output build/channels.pb

../bazel-bin/xls/contrib/xlscc/xlscc adpcm.cc \
	--clang_args_file clang.args \
	--block_pb build/channels.pb > build/test.ir

../bazel-bin/xls/tools/opt_main build/test.ir > build/test.opt.ir

../bazel-bin/xls/tools/codegen_main build/test.opt.ir \
  --generator=pipeline \
  --delay_model="asap7" \
  --output_verilog_path=out/adpcm_xls.v \
  --module_name=adpcm \
  --reset=rst \
  --reset_active_low=false \
  --reset_asynchronous=false \
  --reset_data_path=true \
  --clock_period_ps=8420 \
  --flop_inputs=true \
  --flop_outputs=true

sv2v out/adpcm_xls.v > out/adpcm_xls.sv2v.v
