from pyspark import SparkConf, SparkContext

conf = SparkConf().setAppName('My App')
sc = SparkContext(conf=conf)

count = sc.range(1, 1000 * 1000 * 100).filter(lambda x: x > 100).count()
print('count: ', count)
