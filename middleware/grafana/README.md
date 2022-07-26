# grafana使用docker启动

## 启动

- [docker-compose](docker-compose.yml)启动grafana
- 如果是Mac,则直接访问对应端口,如果是服务器,使用nginx可以重定向,[nginx配置](grafana.conf)
- 默认用户和密码: admin&admin => 登入之后会要求用户修改密码
- 添加DataSource:Prometheus
- 添加监控规则
  - 如:添加接口QPS仪表盘 `sum(rate(http_server_requests_duration_ms_count{app="${app}"}[5m])) by (path)` ${app}替换成自己的(my-zero)
  - 添加接口状态码仪表盘 `sum(rate(http_server_requests_code_total{app="${app}"}[5m])) by (code)` ${app}替换成自己的(my-zero)
