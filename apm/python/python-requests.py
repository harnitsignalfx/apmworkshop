import requests
from time import sleep
import random
import json

url = 'http://localhost:5000/echo'

def pythonrequests():
    payload = {'key': 'value'}
    try:
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
