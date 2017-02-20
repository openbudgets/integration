#!/usr/bin/env bash
cd /microsite
wait 5
echo "from django.contrib.auth.models import User; User.objects.create_superuser('$SUPERUSER_MAIL', '$SUPERUSER_NAME', '$SUPERUSER_PW')" | python manage.py shell | tail -f