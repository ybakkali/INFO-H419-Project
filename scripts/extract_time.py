import sys
import os

def getTimes(path):
    times = list()
    with open(path, "r") as file:
        for line in file:
            time = float(line.strip().split(" ")[-1][:-1])
            times.append(time)
    return times

def toCSV(input_path, output_path):
    times = [getTimes(input_path + "/ans_time_" + str(i+1) + ".txt") for i in range(6)]
    with open(output_path, "w") as file:
        for i in range(len(times[0])):
            file.write("Query " + str(i + 1) + ", " + ", ".join([str(times[j][i]) for j in range(6)]) + "\n")

toCSV(sys.argv[1], sys.argv[2])
