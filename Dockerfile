# Используем последнюю версию Go на легковесном Alpine Linux
FROM golang:1.25.4-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы модулей
COPY go.mod go.sum ./
RUN go mod download

# Копируем исходный код
COPY . .

# Собираем приложение
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .

# Запускаем приложение
CMD ["./main"]