FROM node:18-alpine

WORKDIR /app

RUN npm install -g @taazkareem/clickup-mcp-server

EXPOSE 8000

CMD ["npx", "-y", "@taazkareem/clickup-mcp-server", \
     "--env", "CLICKUP_API_KEY=${CLICKUP_API_KEY}", \
     "--env", "CLICKUP_TEAM_ID=${CLICKUP_TEAM_ID}", \
     "--env", "DOCUMENT_SUPPORT=${DOCUMENT_SUPPORT:-false}", \
     "--env", "LOG_LEVEL=${LOG_LEVEL:-info}"]
