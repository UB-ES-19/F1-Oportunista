from django.core.management.base import BaseCommand, CommandError
from django.conf import settings
import os
import subprocess
PROJECT_DIR = os.path.dirname(settings.BASE_DIR)


class Command(BaseCommand):
    help = 'Builds assets for project'

    def handle(self, *args, **options):
        p = subprocess.Popen(
            ['python3', 'build.py', '-m'], cwd=PROJECT_DIR
        )
        p.wait()
