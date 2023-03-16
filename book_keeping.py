import xml.etree.ElementTree as ET

# opens the file #storage.xml is original file
tree = ET.parse('views/storage.xml')
root = tree.getroot()  # gets the root of the file
storage = "views/storage.xml"  # storage.xml original

current_balance = 0
deposit = 0
withdraw = 0

# Find the balance element in the XML file
balance_element = root.find('balance')
transactions_element = root.find('transactions')


def run():
    global current_balance
    global deposit
    global withdraw
    print("Welcome to the bank of Python!")
    print("Please select an option from the menu below:")
    print("1. Deposit")
    print("2. Withdraw")
    print("3. Check balance")
    print("4. Exit")
    option = int(input("Option: "))
    if option == 1:  # deposit
        deposit = int(input("How much would you like to deposit? "))
        current_balance += deposit
        # Update the balance element in the XML file
        balance_element.text = str(current_balance)
        tree.write(storage)
        print(f"Your current balance is: {current_balance}")
        run()
    elif option == 2:  # withdraw
        withdraw = int(input("How much would you like to withdraw? "))
        current_balance -= withdraw
        # Update the balance element in the XML file
        balance_element.text = str(current_balance)
        tree.write(storage)
        print(f"Your current balance is: {current_balance}")
        run()
    elif option == 3:  # Check Balance
        print(f"Your current balance is: {current_balance}")
        run()
    elif option == 4:  # exit
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
