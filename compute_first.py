grammer={}
n=int(input("Enter the number of productions"))
for _ in range(n):
    l,r=input("Enter the production : ").split("=")
    grammer.setdefault(l,[]).append(r)

# first function
def FIRST(x):
    if not x.isupper():
     return {x}
    result=set()
    for prod in grammer[x]:
        result |= FIRST(prod[0])
    return result


# Output
while True:
    s = input("\nFind FIRST of: ")
    print("FIRST(", s, ") =", FIRST(s))
    if input("Again? (y/n): ") != 'y':
     break
