from os import listdir
from os.path import isfile, join

path = "Data/Batch1"
finwire_lst = [f for f in listdir(path) if isfile(join(path, f)) and "FINWIRE" in f and ".csv" not in f]

with open("merged_finwire.csv","w") as fout:
    for finwire in finwire_lst:
        with open(path + '/' + finwire) as f:
            for line in f:
                fout.write(line)
