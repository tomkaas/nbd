import riak

client = riak.RiakClient(pb_port=8087)
bucket = client.bucket('s15568')

laptop = {"manufacturer": "Dell", "model": "P88G", "price": 4000}
key = bucket.new('laptop', laptop).store()
print('Laptop has been added')

retrieved = bucket.get('laptop')
print('Laptop details: ' + str(retrieved.data))

retrieved.data["model"] = "P87G"
retrieved.store()

retrieved = bucket.get('laptop')
print('Updated laptop details: ' + str(retrieved.data))

retrieved.delete()

retrieved = bucket.get('laptop')
print('Deleted laptop: ' + str(retrieved.data))