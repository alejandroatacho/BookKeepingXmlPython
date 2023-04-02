//Make a JS file that converts to excel instead of python

// function excelPrinter() {
//    console.log("Begin your code")
  

// }
//check your browser console log in inspect tool :v
console.log('Hello I am connected!');

function generateExcel() {
  // Get the table element
  const table = document.querySelector('table');

  // Create a new workbook
  const workbook = XLSX.utils.book_new();

  // Convert the table to an array of arrays
  const tableData = XLSX.utils.table_to_sheet(table);

  // Add the worksheet to the workbook
  XLSX.utils.book_append_sheet(workbook, tableData, 'Transactions');

  // Generate the Excel file and download it
  XLSX.writeFile(workbook, 'transactions.xlsx');
}
function showTransactionData() {
  return 0;
}