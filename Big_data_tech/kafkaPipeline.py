from kafka import KafkaProducer

producer = KafkaProducer(bootstrap_servers = 'localhost:9092',value_serializer=lambda v:v.encode('utf-8'))

def extract():
    print("Extracting...")
    return "Order1"

def process(data):
    print("Processing: ",data)
    return data.upper()

def store(data):
    print("Sending to kafka: ",data)
    future = producer.send('orders',data)
    future.get(timeout=10)

def alert():
    print("Alert Sent !!!")


#Pipeline
data = extract()
data = process(data)
store(data)
alert()

producer.close()