sym, lit = [], []
symAddr, litAddr = [], []
LC = 2000
file=open("abc.txt")
for line in file:
    line = line.strip()

    if "start" in line:
        LC = int(line.split()[1])

    elif "db" in line or ":" in line:
        sym.append(line.split()[0].replace(":", ""))
        LC += 1
        symAddr.append(LC)

    elif line.startswith("="):
        lit.append(line)
        litAddr.append(0)

    elif line in ["ltorg", "end"]:
        for i in range(len(lit)):
            if litAddr[i] == 0:
                LC += 1
                litAddr[i] = LC

# Output
print("SYMBOL:", list(zip(sym, symAddr)))
print("LITERAL:", list(zip(lit, litAddr)))

# create a separate abc.txt file
#start 2000
#A db 5
#LOOP: MOV A
#=5
#ltorg
#end
