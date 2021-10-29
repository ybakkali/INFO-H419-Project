queries_path=$1;
answers_path=$2;
iteration_number=$3;

rm $answers_path/ans_time_*.txt &> /dev/null;
cd ~/Impala;

for k in {1..$iteration_number};
do
for i in {1..99};
do bin/impala-shell.sh -f $queries_path/query_$i.sql -d TPC_DS 2>&1 > $answers_path/ans_$i.txt | tail -1 >> $answers_path/ans_time_$k.txt;
done
done
