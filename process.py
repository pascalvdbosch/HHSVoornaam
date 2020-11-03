import re

with open('data.json', 'w', encoding="utf8") as fout:
    fout.write("{")
    first = True
    with open('data.txt', 'r', encoding="utf16") as f:
        for line in f.readlines():
            ma = re.search(r"\((\d\d\d\d\d*)\)", line)
            if ma is not None:
                id_ = ma.group(1)
                voornaam = line[line.rindex(":") + 1 : ].strip()
                if first: first = False
                else: fout.write(",")
                fout.write(f"\"id\": {id_}, \"first\": \"{voornaam}\"\n")
    fout.write("}")