data_path=$1;
data_destination=/data;

cd ~/Impala;

hdfs dfs -rm -r -skipTrash $data_destination;
hdfs dfs -mkdir $data_destination;

hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/call_center.dat $data_destination/call_center;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/customer_address.dat $data_destination/customer_address;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/customer_demographics.dat $data_destination/customer_demographics;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/date_dim.dat $data_destination/date_dim;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/warehouse.dat $data_destination/warehouse;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/ship_mode.dat $data_destination/ship_mode;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/time_dim.dat $data_destination/time_dim;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/reason.dat $data_destination/reason;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/income_band.dat $data_destination/income_band;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/item.dat $data_destination/item;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/store.dat $data_destination/store;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/customer.dat $data_destination/customer;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/web_site.dat $data_destination/web_site;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/store_returns.dat $data_destination/store_returns;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/household_demographics.dat $data_destination/household_demographics;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/web_page.dat $data_destination/web_page;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/promotion.dat $data_destination/promotion;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/catalog_page.dat $data_destination/catalog_page;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/inventory.dat $data_destination/inventory;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/catalog_returns.dat $data_destination/catalog_returns;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/web_returns.dat $data_destination/web_returns;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/web_sales.dat $data_destination/web_sales;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/catalog_sales.dat $data_destination/catalog_sales;
hdfs dfs -D dfs.replication=1 -moveFromLocal $data_path/store_sales.dat $data_destination/store_sales;
