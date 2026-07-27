
#------------------------------------------------------------------------------
# Project 'PCS167_v5' make using the 'Intel(R) Visual Fortran Compiler XE 14.0.1.139' compiler.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# All project
#------------------------------------------------------------------------------

all: targets
	@echo !--Make: succeeded.



#------------------------------------------------------------------------------
# Directories, Platform, and Version
#------------------------------------------------------------------------------

Arch        = windows
EmtdcDir    = D:\Qingsong\APP\PSCAD5\emtdc\if12
EmtdcInc    = $(EmtdcDir)\inc
EmtdcBin    = $(EmtdcDir)\$(Arch)
EmtdcMain   = $(EmtdcBin)\main.obj
EmtdcLib    = $(EmtdcBin)\emtdc.lib
SolverLib    = $(EmtdcBin)\Solver.lib


#------------------------------------------------------------------------------
# Fortran Compiler
#------------------------------------------------------------------------------

FC_Name         = ifort.exe
FC_Suffix       = obj
FC_Args         = /nologo /c /free /real_size:64 /fpconstant /warn:declarations /iface:default /align:dcommons /fpe:0
FC_Debug        =  /O2
FC_Preprocess   = 
FC_Preproswitch = 
FC_Warn         = 
FC_Checks       = /check:bounds
FC_Includes     = /include:"$(EmtdcInc)" /include:"$(EmtdcDir)" /include:"$(EmtdcBin)"
FC_Compile      = $(FC_Name) $(FC_Args) $(FC_Includes) $(FC_Debug) $(FC_Warn) $(FC_Checks)

#------------------------------------------------------------------------------
# C Compiler
#------------------------------------------------------------------------------

CC_Name     = cl.exe
CC_Suffix   = obj
CC_Args     = /nologo /MT /W3 /EHsc /c
CC_Debug    =  /O2
CC_Includes = 
CC_Compile  = $(CC_Name) $(CC_Args) $(CC_Includes) $(CC_Debug)

#------------------------------------------------------------------------------
# Linker
#------------------------------------------------------------------------------

Link_Name   = link.exe
Link_Debug  = 
Link_Args   = /out:$@ /nologo /nodefaultlib:libc.lib /nodefaultlib:libcmtd.lib /subsystem:console
Link        = $(Link_Name) $(Link_Args) $(Link_Debug)

#------------------------------------------------------------------------------
# Build rules for generated files
#------------------------------------------------------------------------------


.f.$(FC_Suffix):
	@echo !--Compile: $<
	$(FC_Compile) $<



.c.$(CC_Suffix):
	@echo !--Compile: $<
	$(CC_Compile) $<



#------------------------------------------------------------------------------
# Build rules for file references
#------------------------------------------------------------------------------


pcs_itff_F1.$(FC_Suffix): 
	@echo !--Compile: "D:\PSCAD_simulink\8 stringPCS_GFL\PCS167_PSCAD5.0_240726\PCS167\Resources\pcs_itff.f"
	$(FC_Compile) "D:\PSCAD_simulink\8 stringPCS_GFL\PCS167_PSCAD5.0_240726\PCS167\Resources\pcs_itff.f" -o pcs_itff_F1.$(FC_Suffix)

Q_Initial_Conditions_F2.$(FC_Suffix): 
	@echo !--Compile: "D:\PSCAD_simulink\8 stringPCS_GFL\PCS167_PSCAD5.0_240726\PCS167\Resources\Q_Initial_Conditions.f"
	$(FC_Compile) "D:\PSCAD_simulink\8 stringPCS_GFL\PCS167_PSCAD5.0_240726\PCS167\Resources\Q_Initial_Conditions.f" -o Q_Initial_Conditions_F2.$(FC_Suffix)

pcs_itfc_C1.$(CC_Suffix): 
	@echo !--Compile: "D:\PSCAD_simulink\8 stringPCS_GFL\PCS167_PSCAD5.0_240726\PCS167\Resources\pcs_itfc.c"
	$(CC_Compile) "D:\PSCAD_simulink\8 stringPCS_GFL\PCS167_PSCAD5.0_240726\PCS167\Resources\pcs_itfc.c" /Fopcs_itfc_C1.$(CC_Suffix)

ETRAN_IF12_1.lib: 
	@echo !--Copy: "D:\PSCAD_simulink\8 stringPCS_GFL\PCS167_PSCAD5.0_240726\PCS167\Resources\ETRAN_IF12.lib"
	copy "D:\PSCAD_simulink\8 stringPCS_GFL\PCS167_PSCAD5.0_240726\PCS167\Resources\ETRAN_IF12.lib" "ETRAN_IF12_1.lib"

pcs_adds_on_2.lib: 
	@echo !--Copy: "D:\PSCAD_simulink\8 stringPCS_GFL\PCS167_PSCAD5.0_240726\PCS167\Resources\pcs_adds_on.lib"
	copy "D:\PSCAD_simulink\8 stringPCS_GFL\PCS167_PSCAD5.0_240726\PCS167\Resources\pcs_adds_on.lib" "pcs_adds_on_2.lib"

#------------------------------------------------------------------------------
# Dependencies
#------------------------------------------------------------------------------


FC_Objects = \
 Station.$(FC_Suffix) \
 Main.$(FC_Suffix) \
 BESS_1.$(FC_Suffix) \
 break.$(FC_Suffix) \
 FFT_Mod.$(FC_Suffix) \
 PWM_3Level.$(FC_Suffix) \
 pcs_itff_F1.$(FC_Suffix) \
 Q_Initial_Conditions_F2.$(FC_Suffix)

FC_ObjectsLong = \
 "Station.$(FC_Suffix)" \
 "Main.$(FC_Suffix)" \
 "BESS_1.$(FC_Suffix)" \
 "break.$(FC_Suffix)" \
 "FFT_Mod.$(FC_Suffix)" \
 "PWM_3Level.$(FC_Suffix)" \
 "pcs_itff_F1.$(FC_Suffix)" \
 "Q_Initial_Conditions_F2.$(FC_Suffix)"

CC_Objects = \
  pcs_itfc_C1.$(CC_Suffix)

CC_ObjectsLong = \
  "pcs_itfc_C1.$(CC_Suffix)"

LK_Objects = \
  ETRAN_IF12_1.lib \
  pcs_adds_on_2.lib

LK_ObjectsLong = \
  "ETRAN_IF12_1.lib" \
  "pcs_adds_on_2.lib"

SysLibs  = wsock32.lib

Binary   = PCS167_v5.exe

$(Binary): $(FC_Objects) $(CC_Objects) $(LK_Objects) 
	@echo !--Link: $@
	$(Link) "$(EmtdcMain)" $(FC_ObjectsLong) $(CC_ObjectsLong) $(LK_ObjectsLong) "$(EmtdcLib)" "$(SolverLib)" $(SysLibs)

targets: $(Binary)


clean:
	-del EMTDC_V*
	-del *.obj
	-del *.o
	-del *.exe
	@echo !--Make clean: succeeded.



