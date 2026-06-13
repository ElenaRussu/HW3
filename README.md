# HW3

## Запуск генератора

```bash
./run.sh build_generator
./run.sh run_generator
./run.sh create_local_data
```

## Запуск репортера

```bash
./run.sh build_reporter
./run.sh run_reporter
```

## Утилиты

```bash
./run.sh structure
./run.sh clear_data
./run.sh inside_generator
./run.sh inside_reporter
```

## Веб-сервер

```bash
./run.sh report_server
```

Чтобы открыть отчёт в браузере через GitHub Codespaces:

1. Запустить `./run.sh report_server`
2. Открыть вкладку **Ports** в VS Code
3. Нажать **Add Port** и введи `8080`
4. Нажать на значок глобуса — откроется браузер
5. Добавить `/report.html` в конец URL