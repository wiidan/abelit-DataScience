# 1. API

# 2. API Test

# 2.1 User

This class is designed to work with users.

Object references:

```bash
curl -H "Content-Type: application/json" -X POST -d '{"username": "chenying","password": "123"}'  http://127.0.0.1:5000/api/auth/login

{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQ0MzIzNzQsIm5iZiI6MTU4NDQzMjM3NCwianRpIjoiMDdjODI4ZmItMTdkMS00MjNhLTkzZmEtMmE3ZjBlYjU5MTBjIiwiZXhwIjoxNTg0NDM1OTc0LCJpZGVudGl0eSI6ImNoZW55aW5nIiwiZnJlc2giOmZhbHNlLCJ0eXBlIjoiYWNjZXNzIn0.EgwTUPFzmAUbrSZWfcn2AnG3dyaNF8GFLIIY9kgLoNI",
  "refresh_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQ0MzIzNzQsIm5iZiI6MTU4NDQzMjM3NCwianRpIjoiYWQyMGFlN2ItZGJmMC00NWFjLWI3ZGItY2JmMmJiN2ZkYzM5IiwiZXhwIjoxNTg0NTE4Nzc0LCJpZGVudGl0eSI6ImNoZW55aW5nIiwidHlwZSI6InJlZnJlc2gifQ.1smeazNPyjjfWF-XRKnKXreWEf2CxvIk46y55lFchsI"
}

```

# 2.2 flask_jwt_extended

```bash
$ curl http://localhost:5000/protected
{
  "msg": "Missing Authorization Header"
}

$ curl -H "Content-Type: application/json" -X POST \
  -d '{"username":"test","password":"test"}' http://localhost:5000/login
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6dHJ1ZSwianRpIjoiZjhmNDlmMjUtNTQ4OS00NmRjLTkyOWUtZTU2Y2QxOGZhNzRlIiwidXNlcl9jbGFpbXMiOnt9LCJuYmYiOjE0NzQ0NzQ3OTEsImlhdCI6MTQ3NDQ3NDc5MSwiaWRlbnRpdHkiOiJ0ZXN0IiwiZXhwIjoxNDc0NDc1NjkxLCJ0eXBlIjoiYWNjZXNzIn0.vCy0Sec61i9prcGIRRCbG8e9NV6_wFH2ICFgUGCLKpc"
}

$ export ACCESS="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6dHJ1ZSwianRpIjoiZjhmNDlmMjUtNTQ4OS00NmRjLTkyOWUtZTU2Y2QxOGZhNzRlIiwidXNlcl9jbGFpbXMiOnt9LCJuYmYiOjE0NzQ0NzQ3OTEsImlhdCI6MTQ3NDQ3NDc5MSwiaWRlbnRpdHkiOiJ0ZXN0IiwiZXhwIjoxNDc0NDc1NjkxLCJ0eXBlIjoiYWNjZXNzIn0.vCy0Sec61i9prcGIRRCbG8e9NV6_wFH2ICFgUGCLKpc"

$ curl -H "Authorization: Bearer $ACCESS" http://localhost:5000/protected
{
  "logged_in_as": "test"
}
```
