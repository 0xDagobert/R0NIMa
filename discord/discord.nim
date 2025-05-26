import std/[httpclient], json


proc postData*(url: string) =
    let client = newHttpClient()
    client.headers = newHttpHeaders({ "Content-Type": "application/json" })
    let body = %*{
        "content": "some text",
        "username" : "stealer"
    }
    try:
        let response = client.request(url, httpMethod = HttpPost, body = $body)
        echo response.status
    finally:
        client.close()
