- Collector:采集器
  - port

    |  Port  | Protocol | Function  |
      |----------| ----  | ----  |
    | 9411 | http     | Accepts Zipkin spans in Thrift, JSON and Proto (disabled by default). |
    | 14250 | gRPC     |Used by jaeger-agent to send spans in model.proto format. |
    | 14268 | http     |Accepts spans directly from clients in jaeger.thrift format with binary thrift protocol (POST to /api/traces). Also serves sampling policies at /api/sampling, similar to Agent’s port 5778. |
    | 14269 | http     |Admin port: health check at / and metrics at /metrics. |
    | 4317 | gRPC     |Accepts traces in OpenTelemetry OTLP format if --collector.otlp.enabled=true |
    | 4318  | http     |Accepts traces in OpenTelemetry OTLP format if --collector.otlp.enabled=true. |