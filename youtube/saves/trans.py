import os

file = os.listdir(".")

for i in file:
    new = i.replace("上半期号", "01").replace("下半期号", "02")
    os.rename(i, new)
    # print(new)