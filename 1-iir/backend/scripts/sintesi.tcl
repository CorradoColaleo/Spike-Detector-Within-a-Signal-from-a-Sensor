# sintesi.tcl
# Script per la sintesi

#Qui sto settando delle variabili 
set VERILOG_FILES {src/iir_section1.sv  src/iir_section2.sv  src/iir.sv}
set TOP_MODULE iir
set LIB_FILE /vlsi/tech/nangate45/lib/NangateOpenCellLibrary_typical.lib
set CONSTRAINTS_FILE ./src/constraints.sdc

#Per leggere la libreria 
read_liberty $LIB_FILE 

#Per leggere i file system verilog
read_slang   {*}$VERILOG_FILES

# Sintesi generica. Il comando richiede un solo parametro:
# il nome del modulo top-level
syn_generic $TOP_MODULE

# Standard-cell mapping ed ottimizzazione.
# Il comando richiede un solo parametro:
# il nome del file di constraints
syn_map $CONSTRAINTS_FILE

report_area
report_timing
write_netlist results/iir_netlist.v
report_area   results/area_report.txt
report_timing results/timing_report.txt

#Posso anche fare report_power -> usa un approccio probabilistico per stimare la potenza

#Comandi senza commenti
set VERILOG_FILES {src/iir_section1.sv  src/iir_section2.sv  src/iir.sv}
set TOP_MODULE iir
set LIB_FILE /vlsi/tech/nangate45/lib/NangateOpenCellLibrary_typical.lib
set CONSTRAINTS_FILE ./src/constraints.sdc
read_liberty $LIB_FILE 
syn_generic $TOP_MODULE
syn_map $CONSTRAINTS_FILE
report_area
report_timing
write_netlist results/iir_netlist.v
report_area   results/area_report.txt
report_timing results/timing_report.txt

# Dopo aver fatto ciò, puoi fare una simulazione post sintesi andando nella cartella
# post_synt_simul e ci devo copiare il file iir_netlist.v
# Nel fare la simulazione, devo stare attento a dirgli qual è il top level sennò da errore
# Quindi serve il comando mdsim -T tb_iir cells.v iir_netflist.v tb_iir.sv