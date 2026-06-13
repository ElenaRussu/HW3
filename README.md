# HW3

## Просмотр отчёта в браузере через GitHub Codespaces

### Шаг 1 — клонируй репозиторий и открой в Codespaces

1. Открыть репозиторий на GitHub
2. Нажать **Code → Codespaces → Create codespace on main**
3. Подождать, пока среда загрузится

### Шаг 2 — сделай run.sh исполняемым

```bash
chmod +x run.sh
```

### Шаг 3 — сгенерируй данные и отчёт

```bash
./run.sh build_generator
./run.sh run_generator
./run.sh build_reporter
./run.sh run_reporter
```

После этого в папке `data/` появятся файлы `data.csv` и `report.html`.

### Шаг 4 — запусти веб-сервер

```bash
./run.sh report_server
```

Команда запускает контейнер nginx, который раздаёт файлы из папки `data/` на порту 8080.

### Шаг 5 — открой отчёт в браузере

1. В VS Code внизу появится уведомление **"Your application running on port 8080 is available"** — написать **Open in Browser**. Если уведомление не появилось — открыть вкладку **Ports** (Ctrl+Shift+P → "Ports: Focus on Ports View"), найти порт 8080 и нажать на значок глобуса.
2. В открывшейся вкладке браузера добавить `/report.html` в конец URL.
