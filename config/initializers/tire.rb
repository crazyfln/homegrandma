ENV['ELASTICSEARCH_URL'] = ENV['BONSAI_URL']
Tire.configure { logger 'log/elasticsearch.log' }
# Tire.configure { logger 'log/elasticsearch.log', :level => 'debug' }