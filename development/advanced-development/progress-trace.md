---
description: Gather useful information for debugging and troubleshooting.
---

# Progress Trace

Progress tracing in NSO provides developers with useful information for debugging, diagnostics, and profiling. This information can be used both during development cycles and after the release of the software. The system overhead for progress tracing is usually negligible.

When a transaction or action is applied, NSO emits progress events. These events can be displayed and recorded in a number of different ways. The easiest way is to pipe an action to details in the CLI.

```bash
admin@ncs% commit | details
Possible completions:
  debug  verbose  very-verbose
admin@ncs% commit | details
```

As seen by the details output, all events are recorded with a timestamp and in some cases with the duration. All phases of the transaction, service, and device communication are printed.

```
applying transaction for running datastore usid=41 tid=1761 trace-id=d7f06482-41ad-4151-938d-7a8bc7b3ce33
entering validate phase
 2021-05-25T17:28:12.267 taking transaction lock... ok (0.000 s)
 2021-05-25T17:28:12.267 holding transaction lock...
 2021-05-25T17:28:12.268 creating rollback file... ok (0.004 s)
 2021-05-25T17:28:12.272 run transforms and transaction hooks...
 2021-05-25T17:28:12.273 run pre-transform validation... ok (0.000 s)
 2021-05-25T17:28:12.275 service-manager: service /ordserv[name='o2']: run service... ok (0.035 s)
 2021-05-25T17:28:12.311 run transforms and transaction hooks: ok (0.038 s)
 2021-05-25T17:28:12.311 mark inactive... ok (0.000 s)
 2021-05-25T17:28:12.311 pre validate... ok (0.000 s)
 2021-05-25T17:28:12.311 run validation over the changeset... ok (0.000 s)
 2021-05-25T17:28:12.312 run dependency-triggered validation... ok (0.000 s)
 2021-05-25T17:28:12.312 check configuration policies... ok (0.000 s)
leaving validate phase (0.045 s)
entering write-start phase
 2021-05-25T17:28:12.312 cdb: write-start
 2021-05-25T17:28:12.313 check data kickers... ok (0.000 s)
leaving write-start phase (0.001 s)
entering prepare phase
 2021-05-25T17:28:12.314 cdb: prepare
 2021-05-25T17:28:12.314 device-manager: prepare
leaving prepare phase (0.003 s)
entering commit phase
 2021-05-25T17:28:12.317 cdb: commit
 2021-05-25T17:28:12.318 service-manager: commit
 2021-05-25T17:28:12.318 device-manager: commit
 2021-05-25T17:28:12.320 holding transaction lock: ok (0.033 s)
leaving commit phase (0.002 s)
applying transaction for running datastore usid=41 tid=1761 trace-id=d7f06482-41ad-4151-938d-7a8bc7b3ce33 (0.053 s)
```

Some actions (usually those involving device communication) also produce progress data.

```cli
admin@ncs% request devices device ce0 sync-from dry-run | details very-verbose
running action /devices/device\[name='ce0'\]/sync-from usid=41 tid=1800 trace-id=fff4d4b0-5688-42f9-b5f7-53b7c3f70d35
 2021-05-25T17:31:31.222 device ce0: sync-from...
 2021-05-25T17:31:31.222 device ce0: taking device lock... ok (0.000 s)
 2021-05-25T17:28:12.267 device ce0: holding device lock...
 2021-05-25T17:31:31.227 device ce0: connect... ok (0.013 s)
 2021-05-25T17:31:31.240 device ce0: show... ok (0.001 s)
 2021-05-25T17:31:31.242 device ce0: get-trans-id... ok (0.000 s)
 2021-05-25T17:31:31.242 device ce0: close... ok (0.000 s)
...
 2021-05-25T17:28:12.320 device ce0: holding device lock: ok (0.033 s)
 2021-05-25T17:31:31.249 device ce0: sync-from: ok (0.026 s)
running action /devices/device\[name='ce0'\]/sync-from usid=41 tid=1800 trace-id=fff4d4b0-5688-42f9-b5f7-53b7c3f70d35 (0.053 s)
```

## Configuring Progress Trace <a href="#d5e9484" id="d5e9484"></a>

The pipe details in the CLI are useful during development cycles of, for example, a service, but not as useful when tracing calls from other northbound interfaces or events in a released running system. Then it's better to configure a progress trace to be outputted to a file or operational data, which can be retrieved through a northbound interface.

### Unhide Progress Trace <a href="#d5e9487" id="d5e9487"></a>

The top-level container `progress` is by default invisible due to a hidden attribute. To make `progress` visible in the CLI, two steps are required:

1.  First, the following XML snippet must be added to `ncs.conf`:

    ```xml
    <hide-group>
       <name>debug</name>
    </hide-group>
    ```
2.  Then, the `unhide` command is used in the CLI session:

    ```cli
    admin@ncs% unhide debug
    ```

### Log to File <a href="#d5e9498" id="d5e9498"></a>

Progress data can be outputted to a given file. This is useful when the data is to be analyzed in some third-party software like a spreadsheet application.

```bash
admin@ncs% set progress trace test destination file event.csv format csv
```

The file can be formatted as a comma-separated values file defined by RFC 4180 or in a pretty printed log file with each event on a single line.

The location of the file is the directory of `/ncs-config/logs/progress-trace/dir` in `ncs.conf`.

### Log as Operational Data

When the data is to be retrieved through a northbound interface, it is more useful to output the progress events as operational data.

```bash
admin@ncs% set progress trace test destination oper-data
```

This will log non-persistent operational data to the `/progress:progress/trace/event` list. As this list might grow rapidly there is a maximum size of it (defaults to 1000 entries). When the maximum size is reached, the oldest list entry is purged.

```bash
admin@ncs% set progress trace test max-size 2000
```

Using the `/progress:progress/trace/purge` action the event list can be purged.

```bash
admin# request progress trace test purge
```

### Log as Notification Events <a href="#d5e9521" id="d5e9521"></a>

Progress events can be subscribed to as Notifications events. See [NOTIF API](../core-concepts/api-overview/java-api-overview.md#ug.java_api_overview.notif) for further details.

### Verbosity <a href="#d5e9525" id="d5e9525"></a>

The `verbosity` parameter is used to control the level of output. The following levels are available:

<table><thead><tr><th width="175">Level</th><th>Description</th></tr></thead><tbody><tr><td><code>normal</code></td><td>Informational messages that highlight the progress of the system at a coarse-grained level. Used mainly to give a high-level overview. This is the default and the lowest verbosity level.</td></tr><tr><td><code>verbose</code></td><td>Detailed informational messages from the system. The various service and device phases and their duration will be traced. This is useful to get an overview of where time is spent in the system.</td></tr><tr><td><code>very-verbose</code></td><td>Very detailed informational messages from the system and its internal operations.</td></tr><tr><td><code>debug</code></td><td>The highest verbosity level with fine-grained informational messages usable for debugging the system and its internal operations. Internal system transactions as well as data kicker evaluation and CDB subscribers will traced. Setting this level could result in a large number of events being generated.</td></tr></tbody></table>

Additional debug tracing can be turned on for various parts. These are consciously left out of the normal debug level due to the high amount of output and should only be turned on during development.

### Using Filters <a href="#d5e9544" id="d5e9544"></a>

By default, all transaction and action events with the given verbosity level will be logged. To get a more selective choice of events, filters can be used.

```bash
admin@ncs% show progress trace filter
Possible completions:
  all-devices  - Only log events for devices.
  all-services - Only log events for services.
  context      - Only log events for the specified context.
  device       - Only log events for the specified device(s).
  device-group - Only log events for devices in this group.
  local-user   - Only log events for the specified local user.
  service-type - Only log events for the specified service type.
```

The context filter can be used to only log events that originate through a specific northbound interface. The context is either one of `netconf`, `cli`, `webui`, `snmp`, `rest`, `system` or it can be any other context string defined through the use of MAAPI.

```bash
admin@ncs% set progress trace test filter context netconf
```

## Report Progress Events from User Code

API methods to report progress events exist for Python, Java, Erlang, and C.

### Python `ncs.maapi` Example <a href="#d5e12711" id="d5e12711"></a>

```python
class ServiceCallbacks(Service):
    @Service.create
    def cb_create(self, tctx, root, service, proplist):
        maapi = ncs.maagic.get_maapi(root)
        trans = maapi.attach(tctx)

        with trans.start_progress_span("service create()", path=service._path):
            ipv4_addr = None
            with trans.start_progress_span("allocate IP address") as sp11:
                self.log.info('alloc trace-id: ' + sp11.trace_id + \
                    ' span-id: ' + sp11.span_id)
                ipv4_addr = alloc_ipv4_addr('192.168.0.0', 24)
                trans.progress_info('got IP address ' + ipv4_addr)
            with trans.start_progress_span("apply template",
                    attrs={'ipv4_addr':ipv4_addr}) as sp12:
                self.log.info('templ trace-id: ' + sp12.trace_id + \
                    ' span-id: ' + sp12.span_id)
                vars = ncs.template.Variables()
                vars.add('IPV4_ADDRESS', ipv4_addr)
                template = ncs.template.Template(service)
                template.apply('ipv4-addr-template', vars)
```

Further details can be found in the NSO Python API reference under `ncs.maapi.start_progress_span` and `ncs.maapi.progress_info`.

### Java `com.tailf.progress.ProgressTrace` Example <a href="#d5e12719" id="d5e12719"></a>

```java
    @ServiceCallback(servicePoint="...",
        callType=ServiceCBType.CREATE)
    public Properties create(ServiceContext context,
                             NavuNode service,
                             NavuNode ncsRoot,
                             Properties opaque)
                             throws DpCallbackException {
        try {
            Maapi maapi = service.context().getMaapi();
            int tid = service.context().getMaapiHandle();
            ProgressTrace progress = new ProgressTrace(maapi, tid,
                service.getConfPath());
            Span sp1 = progress.startSpan("service create()");

            Span sp11 = progress.startSpan("allocate IP address");
            LOGGER.info("alloc trace-id: " + sp11.getTraceId() +
                    " span-id: " + sp11.getSpanId());
            String ipv4Addr = allocIpv4Addr("192.168.0.0", 24);
            progress.event("got IP address " + ipv4Addr);
            progress.endSpan(sp11);

            Attributes attrs = new Attributes();
            attrs.set("ipv4_addr", ipv4Addr);
            Span sp12 = progress.startSpan(Maapi.Verbosity.NORMAL,
                "apply template", attrs, null);
            LOGGER.info("templ trace-id: " + sp12.getTraceId() +
                    " span-id: " + sp12.getSpanId());
            TemplateVariables ipVar = new TemplateVariables();
            ipVar.putQuoted("IPV4_ADDRESS", ipv4Addr);
            Template ipTemplate = new Template(context, "ipv4-addr-template");
            ipTemplate.apply(service, ipVar);
            progress.endSpan(sp12);

            progress.endSpan(sp1);
```

Further details can be found in the NSO Java API reference under `com.tailf.progress.ProgressTrace` and `com.tailf.progress.Span`.

## Correlating with OpenTelemetry Traces

[OpenTelemetry](https://opentelemetry.io/) is an observability SDK that instruments your code and libraries to collect telemetry data. NSO 6.3 and later by default generate span IDs that are compatible with W3C Trace Context and OpenTelemetry.

To simplify correlation of telemetry data when your NSO code uses libraries that are instrumented with OpenTelemetry, you can propagate parent span information from NSO to those libraries. To make the most use of this data, you need to export OpenTelemetry and NSO spans to a common system. You can export NSO span data with the Observability Exporter package.

To set up the trace context for OpenTelemetry:

1. Create a new NSO span to obtain a span ID `span_id`.
2. Create an OpenTelemetry span with the `span_id`.
3. Set the OpenTelemetry span as the current span for the OpenTelemetry `Context` of the execution unit.

The following listing shows the code necessary to achieve this in Python. It requires the `opentelemetry-api` package.

```python
    @Service.create
    def cb_create(self, tctx, root, service, proplist):
        maapi = ncs.maagic.get_maapi(root)
        trans = maapi.attach(tctx)

        with trans.start_progress_span(
            "service create()",
            path=service._path
        ) as parent_span:
            import opentelemetry.context
            import opentelemetry.trace as otr
            span_ctx = otr.SpanContext(
                trace_id=int(parent_span.trace_id, 16),
                span_id=int(parent_span.span_id, 16),
                is_remote=False,
                trace_flags=otr.TraceFlags(otr.TraceFlags.SAMPLED)
            )
            otel_span = otr.NonRecordingSpan(span_ctx)
            otel_ctx = otr.set_span_in_context(otel_span)
            opentelemetry.context.attach(otel_ctx)

            ... # code with OpenTelemetry tracing
```

The code uses OpenTelemetry tracing from the service create callback; however, you can use the same approach in any Maapi session.

For example, if your code uses Python `requests` package, you can easily instrument it by adding an additional `opentelemetry.instrumentation.requests` package:

```python
import requests
from opentelemetry.instrumentation.requests import RequestsInstrumentor

RequestsInstrumentor().instrument()
```

If you now invoke `requests` from service code as shown in the following snippet, it will produce OpenTelemetry spans, where top-most spans have parent `span-id` set to the service span produced by NSO, as well as a matching trace ID.

```python
            ... # code with OpenTelemetry tracing
            response = requests.get(url="https://www.cisco.com/")
```

```json
{
    "name": "GET",
    "context": {
        "trace_id": "0xd02769f6e5ce0dea81fe3b61644b5571",
        "span_id": "0x6de7e48e83dc1b13",
        "trace_state": "[]"
    },
    "kind": "SpanKind.CLIENT",
    "parent_id": "0x749a311a41fe9ba6",
    "start_time": "2024-06-14T09:57:30.488761Z",
    "end_time": "2024-06-14T09:57:31.290909Z",
    "status": {
        "status_code": "UNSET"
    },
    "attributes": {
        "http.method": "GET",
        "http.url": "https://www.cisco.com/",
        "http.status_code": 200
    }
}
```
