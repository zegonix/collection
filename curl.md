# curl

# sending HTTP requests

```sh
# example of a GET request on topic `/status`
curl -X GET 127.0.0.1:8080/status

# example of a POST request with json data
curl -X POST -H "Content-Type: application/json" --data "$(cat ~/repositories/test-projects/rust/test-description.json)" 127.0.0.1:8080/start_test
```
