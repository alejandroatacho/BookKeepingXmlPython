import xlsxwriter
import xml.etree.ElementTree as ET
import datetime

# opens the file #storage.xml is original file
tree = ET.parse('views/xml/transactions.xml')
root = tree.getroot()  # gets the root of the file
storage = "views/xml/transactions.xml"  # storage.xml original

# current_balance = 0.0
deposit = 0.0
withdraw = 0.0

# Find the balance element and transactions elements in the XML file
balance_element = root.find('balance')
current_balance = float(balance_element.text)
transactions_element = root.find('recent_transactions')
transactions = root.findall('.//transactions')
date = datetime.datetime.now()



def run():
    global current_balance
    global deposit
    global withdraw
    global transactions

    print("Welcome to the bank of Python!")
    print("Please select an option from the menu below:")
    print("1. Deposit")
    print("2. Withdraw")
    print("3. Check Balance")
    print("4. See Transactions")
    print("5. Exit")
    option = int(input("Option: "))
    if option == 1:  # deposit
        deposit = float(input("How much would you like to deposit? "))
        description = input("Please enter a description for this transaction: ")
        current_balance += deposit
        # Update the balance element in the XML file
        balance_element.text = str(current_balance)
        # Add a new transaction element to the recent_transactions element
        new_transaction = ET.SubElement(
            transactions_element, 'transactions', id=str(len(transactions)+1))
        ET.SubElement(new_transaction, 'amount').text = str(deposit)
        ET.SubElement(new_transaction, 'operator').text = '+'
        ET.SubElement(new_transaction, 'date').text = str(date)
        ET.SubElement(new_transaction, 'description').text = str(description)
        tree.write(storage)
        transactions = root.findall('.//transactions')  # Add this line
        print(f"Your current balance is: {balance_element.text}")
        run()
    elif option == 2:  # withdraw
        withdraw = float(input("How much would you like to withdraw? "))
        description = input("Please enter a description for this transaction: ")
        current_balance -= withdraw
        # Update the balance element in the XML file
        balance_element.text = str(float(balance_element.text) - withdraw)
        # Add a new transaction element to the recent_transactions element
        new_transaction = ET.SubElement(
            transactions_element, 'transactions', id=str(len(transactions)+1))
        ET.SubElement(new_transaction, 'amount').text = str(withdraw)
        ET.SubElement(new_transaction, 'operator').text = '-'
        ET.SubElement(new_transaction, 'date').text = str(date)
        ET.SubElement(new_transaction, 'description').text = str(description)
        tree.write(storage)
        transactions = root.findall('.//transactions')  # Add this line
        print(f"Your current balance is: {balance_element.text}")
        run()
    elif option == 3:  # Check Balance
        print(f"Your current balance is: {balance_element.text}")
        run()
    elif option == 4:  # See Transactions
        print("These are all your transactions:")
        for transaction in transactions:
            print(
                f"{transaction.attrib['id']}: {transaction.find('operator').text}{transaction.find('amount').text} ({transaction.find('description').text})")
        if float(balance_element.text) >= 0:
            print(f"Your balance is positive: {balance_element.text}")
        else:
            print(f"Your balance is negative: {balance_element.text}")
        run()
    elif option == 5:  # exit
        print("Thank you for banking with us!")
        exit()
    else:
        print("Invalid option")
        run()
# Makes an Excel file out of it, convert this to JS later
def outputXL():

    workbook = xlsxwriter.Workbook('data/transactions.xlsx')
    worksheet = workbook.add_worksheet()
    worksheet.write('A1', 'Transaction ID')
    worksheet.write('B1', 'Amount')
    worksheet.write('C1', 'Operator')
    worksheet.write('D1', 'Date')
    worksheet.write('E1', 'Description')
    row = 1
    col = 0
    for transaction in transactions:
        worksheet.write(row, col, transaction.attrib['id'])
        worksheet.write(row, col + 1, transaction.find('amount').text)
        worksheet.write(row, col + 2, transaction.find('operator').text)
        worksheet.write(row, col + 3, transaction.find('date').text)
        worksheet.write(row, col + 4, transaction.find('description').text)
        row += 1
    workbook.close()
# Run all the functions
if __name__ == '__main__':
    run()
    outputXL()
    input("Press any key to exit...")