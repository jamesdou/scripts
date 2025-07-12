@echo off
  curl -H "X-API-KEY: supersecret" -H "Content-Type: application/json" -X POST  http://localhost:8080/amcp/components/auto_tools/execute -d "{\"input\": {\"text\": \"Hello AMCP!\"}}"  pause