#the following is a chunk of code to upload an excel file and create a dataframe for each tab
getwd()

setwd("~/FNG")

excel_path <- "./FNG/FNG Test_Market_Test Version.xlsx"  # Replace with the path to your Excel file
sheet_names <- excel_sheets(excel_path)

list_of_dataframes <- lapply(sheet_names, function(sheet) {
  read_excel(excel_path, sheet = sheet)
})

# Name the list based on the sheet names
names(list_of_dataframes) <- sheet_names

list2env(list_of_dataframes, .GlobalEnv)

rm(list_of_dataframes)