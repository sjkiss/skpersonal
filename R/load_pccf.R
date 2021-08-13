
library(data.table)
library(readr)

column_widths <- c(6,3,2,4,7,70,3,3,3,1,7,2,4,5,4,1,8,3,1,11,13,1,1,30,1,1,8,8,1,3,1,1)

pccf_fwf <- read_fwf("/Users/skiss/OneDrive - Wilfrid Laurier University/PCCF/Michael Steeleworthy - 20210223-kiss-pccf-plus/PCCF/pccf_2020_08_fccp/pccfNat_fccpNat_082020.txt", col_positions = fwf_widths(column_widths))

#Names follow order of PCCF Reference Guide (PCCF_202011-eng.pdf); some names include additional "_" ; "DAuid" renamed to "PRCDDA" to match CIMD nomenclature
column_names <- c("Postal_code", "FSA", "PR", "CDuid", "CSDuid", "CSDname", "CSDtype", "CCScode", "SAC", "SACtype", "Ctname","ER", "DPL", "FED13iud", "POP_CNTR_RA", "POP_CNTR_RA_type", "PRCDDA", "Dissemination_block", "Rep_Pt_Type", "LAT", "LONG", "SLI","PCtype", "Comm_Name", "DMT", "H_DMT", "Birth_Date", "Ret_Date", "PO", "QI", "Source", "POP_CENTR_RA_SIZE_CLASS")

names(pccf_fwf) = column_names
library(usethis)
use_data(pccf_fwf, overwrite=T)

