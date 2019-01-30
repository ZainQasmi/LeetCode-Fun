def bracket_match(bracket_string):
    count = 0
    tempStk = []
    iter = 0
    for letter in bracket_string:
        if letter == '(':
            print iter, '('
            tempStk.append(letter)
        elif letter == ')':
            if tempStk == []:
                print iter, ')'
                count += 1
            elif tempStk[-1] == '(':
                tempStk.pop()
                print iter, ')-'
        iter +=1

        print tempStk,count
    count += len(tempStk)
    return count

def bracket_match2(S):
    left = right = 0
    for i in S:
        if right == 0 and i == ')': 
            left += 1

        elif i == '(':
            right +=1
        else:
            right -=1

    return left + right

print bracket_match2('()))((')
print bracket_match2('((())(((((()')
