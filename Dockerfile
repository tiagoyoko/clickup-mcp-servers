FROM node:18-alpine

# Define diretório de trabalho
WORKDIR /app

# Instala as dependências globais necessárias
RUN npm install -g @taazkareem/clickup-mcp-server supergateway

# Exponha a porta (Railway injeta a variável PORT automaticamente)
EXPOSE 8000

# Comando de inicialização padrão com todas as variáveis injetadas
CMD ["npx", "-y", "supergateway", \
     "--stdio", "npx -y @taazkareem/clickup-mcp-server --env CLICKUP_API_KEY=${CLICKUP_API_KEY} --env CLICKUP_TEAM_ID=${CLICKUP_TEAM_ID} --env DOCUMENT_SUPPORT=${DOCUMENT_SUPPORT:-false} --env LOG_LEVEL=${LOG_LEVEL:-info}", \
     "--port", "${PORT}", \
     "--baseUrl", "http://localhost:${PORT}", \
     "--ssePath", "/sse", \
     "--messagePath", "/message", \
     "--logLevel", "${LOG_LEVEL:-info}", \
     "--healthEndpoint", "/healthz", \
     "--cors"]