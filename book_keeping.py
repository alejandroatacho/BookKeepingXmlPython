import xml.etree.ElementTree as ET
import datetime

# opens the file #storage.xml is original file
tree = ET.parse('views/storage.xml')
root = tree.getroot()  # gets the root of the file
storage = "views/storage.xml"  # storage.xml original

current_balance = 0
deposit = 0
withdraw = 0

# Find the balance element and transactions elements in the XML file
balance_element = root.find('balance')
transactions_element = root.find('recent_transactions')
transactions = root.findall('.//transactions')
date = datetime.datetime.now()


def run():
    global current_balance
    global deposit
    global withdraw
    print("Welcome to the bank of Python!")
    print("Please select an option from the menu below:")
    print("1. Deposit")
    print("2. Withdraw")
    print("3. Check Balance")
    print("4. See Transactions")
    print("5. Exit")
    option = int(input("Option: "))
    if option == 1:  # deposit
        deposit = int(input("How much would you like to deposit? "))
        current_balance += deposit
        # Update the balance element in the XML file
        balance_element.text = str(current_balance)
        # Add a new transaction element to the recent_transactions element
        new_transaction = ET.SubElement(
            transactions_element, 'transactions', id=str(len(transactions)+1))
        ET.SubElement(new_transaction, 'amount').text = str(deposit)
        ET.SubElement(new_transaction, 'operator').text = '+'
        ET.SubElement(new_transaction, 'date').text = str(date)
        tree.write(storage)
        print(f"Your current balance is: {balance_element.text}")
        run()
    elif option == 2:  # withdraw
        withdraw = int(input("How much would you like to withdraw? "))
        current_balance -= withdraw
        # Update the balance element in the XML file
        balance_element.text = str(int(balance_element.text) - withdraw)
        # Add a new transaction element to the recent_transactions element
        new_transaction = ET.SubElement(
            transactions_element, 'transactions', id=str(len(transactions)+1))
        ET.SubElement(new_transaction, 'amount').text = str(withdraw)
        ET.SubElement(new_transaction, 'operator').text = '-'
        ET.SubElement(new_transaction, 'date').text = str(date)
        tree.write(storage)
        print(f"Your current balance is: {balance_element.text}")
        run()
    elif option == 3:  # Check Balance
        print(f"Your current balance is: {balance_element.text}")
        run()
    elif option == 4:  # See Transactions
        for transaction in transactions:
            print(transaction.attrib['id'], transaction.find(
                'operator').text, transaction.find('amount').text, transaction.find('date').text)
        run()
    elif option == 5:  # exit
        print("Thank you for banking with us!")
        exit()
    else:
        print("Invalid option")
        run()


# Run all the functions
if __name__ == '__main__':
    run()
    # This can be removed if running in a terminal
    input("Press any key to exit...")
