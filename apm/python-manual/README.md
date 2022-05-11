### This lab builds from the previous exercise [Python: traces from Flask server and Python requests client](../python)

#### Step #1 Modify the python-requests.py file and add manual instrumentation

1. Press `Ctrl+C` to shutdown the python client requests application
2. Add the following lines (in green) and remember to adjust the indentation! Also, don't put in the `+` sign in your code)

```diff
import requests
from time import sleep
import random
import json
+from opentelemetry import trace

url = 'http://localhost:5000/echo'

def pythonrequests():
    payload = {'key': 'value'}
    try:
+        tracer = trace.get_tracer(__name__)
+        with tracer.start_as_current_span("send request"):
+            with tracer.start_as_current_span("child span") as child:
+                child.set_attribute("operation.name","sleeping!")
+                sleep(2)

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
```

#### Step #2 Save the file and re-run the application:

```
splunk-py-trace python3 python-requests.py
```

NOTE: If you get stuck here, you can reference the [solved example](./python-requests-solved.py)

#### Step #3 Traces / services will now be viewable in the APM dashboard

A new service takes about 90 seconds to register for the first time, and then all data will be available in real time.  
Additionally span IDs will print in the terminal where flask-server.py is running.  
You can use `ctrl-c` to stop the requests and server any time.  

Navigate to `Splunk Overvability -> APM`  

<img src="../assets/07-apm.png" width="360"> 

Service map of this python demo  

<img src="../assets/08-python.png" width="360"> 

Click in the service dashboard requests and show sample traces, and then click the trace to see spans 

<img src="../assets/09-pythontraces.png" width="360">  
<img src="../assets/10-pythonspans.png" width="360">  

#### Step #4 Where is the manual-instrumentation?

If you open an example trace, you'll see 2 new spans - 
1. "send request" is our new parent span
2. "child span" is our new child span

The rest of the spans are auto-instrumented! 

3. If you expand on the "child span", you'll notice the operation.name tag set as "sleeping!" describing 
the action just as we specified in our code.


#### Step #5 Leave the flask server running for the next exercise

You'll need the flask server running but you can shutdown the manually instrumented client via `Ctrl+C` for the next 
exercise in the workshop.  

You can now go to the next step of the lab [Java: traces from OKHttp client](../java/README.md)

[Return to APM Instrumentation Workshop Labs](../workshop-steps/3-workshop-labs.md)
