# refactored_example.py
# Refactored program to eliminate unnecessary repetition (DRY principle)

def greet(name):
    """Print a greeting message"""
    print(f"Hello, {name}! How are you?")

def farewell(name):
    """Print a farewell message"""
    print(f"Goodbye, {name}! See you soon.")

people = ["Alice", "Bob", "Charlie"]

# Loop through people to greet and say goodbye
for person in people:
    greet(person)
    farewell(person)
