Kafka local installation:

wget https://www.apache.org/dyn/mirrors/mirrors.cgi\?action\=download\&filename\=kafka/2.6.0/kafka_2.13-2.6.0.tgz -O kafka_2.13-2.6.0.tgz && tar -xf kafka*.tgz && rm -fr kafka*.tgz && ln -s kafka_2.13-2.6.0 kafka
PATH=$PWD/kafka/bin:$PATH
kafka/bin/zookeeper-server-start.sh kafka/config/zookeeper.properties
kafka/bin/kafka-server-start.sh kafka/config/server.properties


	kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 2 --partitions 5 --topic test_topic

	kafka-consumer-groups.sh --bootstrap-server localhost:9092 --all-groups --describe --all-topics

	docker exec -it cscie88_kafka_lab_2020_kafka_1 kafka-topics.sh --bootstrap-server localhost:9092 --list

	kafka-run-class.sh kafka.tools.DumpLogSegments --files /kafka/kafka-logs-0e7aae7c1610/click_events-0/00000000000000000000.log --print-data-log --deep-iteration |less

	docker exec -i kafkademo_kafka_1 kafka-console-producer.sh --broker-list localhost:9092 --topic console_test_topic --property "parse.key=true" --property "key.separator=:"

	docker exec kafkademo_kafka_1 kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic console_test_topic --property print.key=true --property key.separator="-"


docker-compose -f kafka-docker-compose.yaml up -d --scale kafka=3
docker exec kafka_lab_kafka_1 kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 2 --partitions 5 --topic test_topic
docker exec -t kafka_lab_python-example_1 python /python/python-producer.py
docker exec  kafka_lab_python-example_1 python /python/python-consumer.py



docker-compose -f kafka-flume-docker-compose.yaml up -d
docker exec -it docker-flume-setup_kafka_1 kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic click_events
curl localhost:8080/temp
