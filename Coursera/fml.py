def countNumbersWithUniqueDigits(n):
    """
    :type n: int
    :rtype: int
    """
    if n == 0:
        return 1
    elif n == 1:
        return (1*9) + 1
    elif n == 2:
        return (9*9) + (1*9) + 1
    elif n == 3:
        return (72*9) + (9*9) + (1*9) + 1
    elif n == 4:
        return (504*9) + (72*9) + (9*9) + (1*9) + 1
    elif n == 5:
        return (3024*9) + (504*9) + (72*9) + (9*9) + (1*9) + 1
    elif n == 6:
        return (15120*9) + (3024*9) + (504*9) + (72*9) + (9*9) + (1*9) + 1
    elif n == 7:
        return (60480*9) + (15120*9) + (3024*9) + (504*9) + (72*9) + (9*9) + (1*9) + 1
    elif n == 8:
        return (181440*9) + (60480*9) + (15120*9) + (3024*9) + (504*9) + (72*9) + (9*9) + (1*9) + 1
    elif n == 9:
        return (362880*2) + (181440*9) + (60480*9) + (15120*9) + (3024*9) + (504*9) + (72*9) + (9*9) + (1*9) + 1

        
print countNumbersWithUniqueDigits(1)