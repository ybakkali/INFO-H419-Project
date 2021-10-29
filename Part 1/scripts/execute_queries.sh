queries_path=$1;
answers_path=$2;

rm $answers_path/ans_time_*.txt &> /dev/null;
cd ~/Impala;

for k in {1..6};
do
for i in {1..99};
do bin/impala-shell.sh -f $queries_path/query_$i.sql -d TPC_DS 2>&1 > $answers_path/ans_$i.txt | tail -1 >> $answers_path/ans_time_$k.txt;
done
done
