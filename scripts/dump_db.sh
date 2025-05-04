#!/bin/bash

if [ -f .env ]; then
  export $(cat .env | xargs)
fi

DATE=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="${OUTPUT_DIR}/dump_${DB_NAME}_${DATE}.sql"

mkdir -p "$OUTPUT_DIR"

mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
  echo "✅ Dump do banco '$DB_NAME' gerado com sucesso em: $OUTPUT_FILE"
else
  echo "❌ Erro ao gerar o dump do banco."
fi
