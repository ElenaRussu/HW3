import csv
import random
import os
import sys

NUM_ROWS = 50

COLUMNS = ["product_name", "price", "quantity", "category"]

def generate_row():
    return {
        "product_name": random.choice(["Молоко", "Хлеб", "Масло", "Сыр", "Яйца", "Сок", "Вода", "Кефир", "Йогурт", "Творог"]),
        "price": round(random.uniform(30.0, 500.0), 2),
        "quantity": random.randint(1, 200),
        "category": random.choice(["Молочное", "Выпечка", "Напитки", "Заморозка"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)