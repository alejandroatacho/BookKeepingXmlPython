// function to generate Excel file
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

// function to show income and loss transactions separately
function showTransactionData() {
  // Get the table rows from the recent transactions table
  const rows = document.querySelectorAll('table tr');

  // Initialize empty arrays for income and loss transactions
  const incomeTransactions = [];
  const lossTransactions = [];

  // Loop through the rows, and add the income and loss transactions to the respective arrays
  for (let i = 1; i < rows.length; i++) {
    const flow = rows[i].querySelector('td:last-child').textContent;
    if (flow === 'Income') {
      incomeTransactions.push(rows[i].cloneNode(true));
    } else if (flow === 'Loss') {
      lossTransactions.push(rows[i].cloneNode(true));
    }
  }

  // Create a new container div to hold the income and loss tables
  const dataContainer = document.createElement('div');
  dataContainer.classList.add('data-container');

  // Create the income table
  const incomeTable = document.createElement('table');
  const incomeHeader = document.createElement('tr');
  incomeHeader.innerHTML = '<th>ID</th><th>Amount</th><th>Date</th><th>Description</th><th>Flow</th>';
  incomeTable.appendChild(incomeHeader);

  for (let i = 0; i < incomeTransactions.length; i++) {
    incomeTable.appendChild(incomeTransactions[i]);
  }

  // Create the loss table
  const lossTable = document.createElement('table');
  const lossHeader = document.createElement('tr');
  lossHeader.innerHTML = '<th>ID</th><th>Amount</th><th>Date</th><th>Description</th><th>Flow</th>';
  lossTable.appendChild(lossHeader);

  for (let i = 0; i < lossTransactions.length; i++) {
    lossTable.appendChild(lossTransactions[i]);
  }

  // Add the income and loss tables to the container div
  dataContainer.appendChild(incomeTable);
  dataContainer.appendChild(lossTable);

  // Add the container div to the DOM, next to the recent transactions table
  const container = document.querySelector('.container');
  container.insertBefore(dataContainer, container.querySelector('h3').nextSibling);
}
