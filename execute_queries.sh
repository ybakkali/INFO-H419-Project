queries_path=$1;
answers_path=$2;

rm $answers_path/ans_time.txt &> /dev/null;

for i in {1..99};
do ./impala-shell.sh -f $queries_path/query_$i.sql -d TPC_DS 2>&1 > $answers_path/ans_$i.txt | tail -1 >> $answers_path/ans_time.txt;
done
