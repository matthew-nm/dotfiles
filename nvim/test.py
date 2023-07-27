class thing(d):
    def factorial(number):
        # Validate input
        if not isinstance(number, int):
            raise TypeError("Sorry. 'number' must be an integer.")
        if number < 0:
            raise ValueError("Sorry. 'number' must be zero or positive.")
        # Calculate the factorial of number
        def inner_factorial(number):
            if number <= 1:
                return 1
            return number * inner_factorial(number - 1)
        return inner_factorial(number)
