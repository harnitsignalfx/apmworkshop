### This lab requires starting from the main [APM Instrumentation Workshop](../workshop-steps/3-workshop-labs.md)

#### Step #1 Set up environment and run Python Flask server using auto-instrumentation

`multipass shell primary`

Each set of steps should be executed in a new terminal window.  

```
cd ~/apmworkshop/apm/python

# set up OTEL env variables
## set the service name and the APM environment name
export OTEL_RESOURCE_ATTRIBUTES=service.name=py-otel-flask-server,deployment.environment=apm-workshop

## send the traces to the otlp grpc port (4317) of the locally running otel-collector 
export OTEL_EXPORTER_OTLP_ENDPOINT=http://127.0.0.1:4317

# run and auto-instrument the python server application
splunk-py-trace python3 flask-server.py
```

You will see the server startup text when this is run.

#### Step #2 Run the client python app via the `splunk-py-trace` command to send requests to the Flask server

Open a new terminal window to your Linux instance and run the Python client to sent POST requests to the Flask server

```
cd ~/apmworkshop/apm/python

# set up OTEL env variables
## set the service name and the APM environment name
export OTEL_RESOURCE_ATTRIBUTES=service.name=py-otel-reqs-client,deployment.environment=apm-workshop

## send the traces to the otlp grpc port (4317) of the locally running otel-collector 
export OTEL_EXPORTER_OTLP_ENDPOINT=http://127.0.0.1:4317

# run and auto-instrument the python client application
splunk-py-trace python3 python-requests.py
```

The `python-requests.py` client will make calls to the flask server with a random short sleep time.
You can stop the requests with `ctrl-c`

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

Click on Troubleshooting to see the map with latency, errors, etc  

Try the Tag Spotlight view of Span Tags  

#### Step #5 Where is the auto-instrumentation?

`splunk-py-trace` is the auto instrumenting function that runs Python3 with the instrumentation that automatically emits spans from the Python app. No code changes are necessary.

Splunk Observability Cloud has a `Getting Data In` Wizard to guide through instrumentation setup.

OpenTelemetry repo for python is here: https://github.com/signalfx/splunk-otel-python


#### Step #6 Leave the Flask server running

You'll need need this process for the next client examples in the workshop.  

You can now go to the next step of [APM Instrumentation Workshop Labs](../workshop-steps/3-workshop-labs.md)
