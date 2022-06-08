export PLATFORM               = asap7

export DESIGN_NAME            = adpcm_xls

export VERILOG_FILES          = $(sort $(wildcard ./designs/src/$(DESIGN_NICKNAME)/*.v))
export SDC_FILE               = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export DIE_AREA               = 0 0 30 30
export CORE_AREA              = 1 1 29 29
export PLACE_DENSITY          = 0.75