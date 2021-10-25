import sys
import os

def getTimes(path):
	times = list()
	with open(path, "r") as file:
		for line in file:
			time = float(line.strip().split(" ")[-1][:-1])
			times.append(time)
	return times

def toCSV(times, path):
	with open(path, "w") as file:
		for i in range(len(times)):
			file.write("Query " + str(i + 1) + ", " + str(times[i]) + "\n")

toCSV(getTimes(sys.argv[1]), sys.argv[2])
