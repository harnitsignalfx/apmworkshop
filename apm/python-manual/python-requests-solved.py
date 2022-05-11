import requests
from time import sleep
import random
import json
from opentelemetry import trace

url = 'http://localhost:5000/echo'

def pythonrequests():
    payload = {'key': 'value'}
    try:
        tracer = trace.get_tracer(__name__)
        with tracer.start_as_current_span("send request"):
            with tracer.start_as_current_span("child span") as child:
                child.set_attribute("operation.name","sleeping!")
                sleep(2)

            r=requests.post(url, params=payload)
            log_dict = {'httpMETHOD': "post",
                'httpURL': str(r.url),
                'httpSTATUS': str(r.status_code),
                'httpCONTENT': str(r.content)
                }
            print(json.dumps(log_dict,indent=2,separators=(',', ':')))

    except requests.exceptions.RequestException as err:
        log_dict = {'error': str(err),
            }
        print(json.dumps(log_dict,indent=2,separators=(',', ':')))

while True:
    pythonrequests()
    y = random.random()
    sleep(round(y,2))
