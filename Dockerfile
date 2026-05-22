# --- build stage ---
FROM node:lts-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

# --- runtime stage ---
FROM node:lts-alpine AS runtime

ENV NODE_ENV=production
ENV PORT=3000

# Run as non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app

COPY --from=build /app/node_modules ./node_modules
COPY src/ ./src/
COPY package.json ./

USER appuser

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD node -e "fetch('http://localhost:3000/health').then(r => r.ok ? process.exit(0) : process.exit(1)).catch(() => process.exit(1))"

CMD ["node", "src/index.js"]
