test:
	go test -race ./..

fmt:
	goimports -l -w .
	golangci-lint run

tidy:
	go mod tidy