# User 

This class is designed to work with users.

Object references:

```
curl -H "Content-Type: application/json" -X POST -d '{"username": "chenying","password": "123"}'  http://127.0.0.1:5000/api/auth/login 

{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQ0MzIzNzQsIm5iZiI6MTU4NDQzMjM3NCwianRpIjoiMDdjODI4ZmItMTdkMS00MjNhLTkzZmEtMmE3ZjBlYjU5MTBjIiwiZXhwIjoxNTg0NDM1OTc0LCJpZGVudGl0eSI6ImNoZW55aW5nIiwiZnJlc2giOmZhbHNlLCJ0eXBlIjoiYWNjZXNzIn0.EgwTUPFzmAUbrSZWfcn2AnG3dyaNF8GFLIIY9kgLoNI", 
  "refresh_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1ODQ0MzIzNzQsIm5iZiI6MTU4NDQzMjM3NCwianRpIjoiYWQyMGFlN2ItZGJmMC00NWFjLWI3ZGItY2JmMmJiN2ZkYzM5IiwiZXhwIjoxNTg0NTE4Nzc0LCJpZGVudGl0eSI6ImNoZW55aW5nIiwidHlwZSI6InJlZnJlc2gifQ.1smeazNPyjjfWF-XRKnKXreWEf2CxvIk46y55lFchsI"
}

```