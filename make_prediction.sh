#!/usr/bin/env bash

# Note: when using docker tools on windowns, port forwarding doesn't work without specifying the full IP.
# when using container created from run_docker, must use docker machine id (run docker-machine ip command)
# when using container created from run_kubernetes, use the ip specified in port forwarding output (e.g. Forwarding from 127.0.0.1:80 -> 80)
PORT=80
# IP=192.168.99.101
IP=127.0.0.1
echo "Port: $PORT"

# POST method predict
curl -d '{  
   "CHAS":{  
      "0":0
   },
   "RM":{  
      "0":6.575
   },
   "TAX":{  
      "0":296.0
   },
   "PTRATIO":{  
      "0":15.3
   },
   "B":{  
      "0":396.9
   },
   "LSTAT":{  
      "0":4.98
   }
}'\
     -H "Content-Type: application/json" \
     -X POST http://$IP:$PORT/predict
