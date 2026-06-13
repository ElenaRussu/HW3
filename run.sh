case "$1" in
  build_generator)
    echo "Сборка образа generator..."
    docker build -t generator .
    echo "Образ собран."
    ;;

  run_generator)
    echo "Запуск контейнера, файл появится в data/data.csv..."
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" generator
    echo "Готово: data/data.csv"
    ;;

  create_local_data)
    echo "Локальная генерация, файл появится в local_data/data.csv..."
    mkdir -p local_data
    python3 generate.py local_data
    echo "Готово: local_data/data.csv"
    ;;

  build_reporter)
    echo "Сборка образа reporter..."
    docker build -t reporter ./reporter
    echo "Образ собран."
    ;;

  run_reporter)
    echo "Запуск контейнера, файл появится в data/report.html..."
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" reporter
    echo "Готово: data/report.html"
    ;;

  structure)
    find . -not -path './.git/*' | sort | sed 's|[^/]*/|  |g'
    ;;

  clear_data)
    rm -f data/*.csv data/*.html
    echo "data/ очищена"
    ;;

  inside_generator)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" generator ls -la /data
    ;;

  inside_reporter)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" reporter ls -la /data
    ;;

  report_server)
    docker run --rm -d -p 8080:80 -v "$(pwd)/data:/usr/share/nginx/html:ro" nginx
    echo "Сервер запущен: http://localhost:8080/report.html"
    ;;

  *)
    echo "Использование: ./run.sh <команда>"
    exit 1
    ;;
esac
