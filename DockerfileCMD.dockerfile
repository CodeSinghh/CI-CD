docker build -t todo-django-app .
docker run -p 8001:8001 -d todo-django-app
#These commands will build and run a Docker container for the Django application named "todo-django-app" on port 8001.
