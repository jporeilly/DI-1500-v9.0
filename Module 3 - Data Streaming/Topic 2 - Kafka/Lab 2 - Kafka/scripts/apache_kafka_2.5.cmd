@echo off
cls
:start
echo.
echo. This script starts the required services using the
echo. Apache Kafka v2.5.0 Scala v2.13 platform
echo.
echo. Zookeeper needs to started before Kafka in order
echo. to register the Broker(s)
echo.
echo.
echo. 1. Zookeeper
echo. 2. Kafka - Single Broker
echo.
echo.
echo. 3. Create Topic - test
echo. 4. List Topics
echo. 5. Consumer - test-group
echo. 6. Producer
echo.
echo. 7. Stop Kafka Broker
echo. 8. Exit
echo.
echo.
set /p x= Select an Option:
IF '%x%' == '%x%' GOTO Item_%x%

:Item_1
CD \kafka_2.13-2.5.0\bin\windows\
start  zookeeper-server-start.bat  C:\kafka_2.13-2.5.0\config\zookeeper.properties
GOTO Start

:Item_2
CD \kafka_2.13-2.5.0\bin\windows\
start kafka-server-start.bat  C:\kafka_2.13-2.5.0\config\server.properties
GOTO Start

:Item_3
CD \kafka_2.13-2.5.0\bin\windows\
start kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
GOTO Start

:Item_4
CD \kafka_2.13-2.5.0\bin\windows\
start kafka-topics.bat --list --zookeeper localhost:2181 
GOTO Start

:Item_5
CD \kafka_2.13-2.5.0\bin\windows\
start kafka-console-consumer.bat --topic test  --from-beginning  --bootstrap-server localhost:9092 --consumer-property group.id=test-group 
GOTO Start

:Item_6
CD \kafka_2.13-2.5.0\bin\windows\
start kafka-console-producer.bat --broker-list localhost:9092 --topic test
GOTO Start



:Item_7
CD \kafka_2.13-2.5.0\bin\windows\
start kafka-server-stop.bat
GOTO Start

:Item_8
exit
