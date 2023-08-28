import os

from kombu import Queue
from celery import Celery

# Set the default Django settings module for the 'celery' program.
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'core.settings')

app = Celery('core')

# Using a string here means the worker doesn't have to serialize
# the configuration object to child processes.
# - namespace='CELERY' means all celery-related configuration keys
#   should have a `CELERY_` prefix.
app.config_from_object('django.conf:settings', namespace='CELERY')

# Load task modules from all registered Django apps.
app.autodiscover_tasks()

# Queues
app.conf.task_default_queue = 'default'
app.conf.task_queues = (
    Queue('default', routing_key='task.#'),
    Queue('credit_tasks', routing_key='credit.#'),
)
app.conf.task_default_exchange = 'tasks'
app.conf.task_default_exchange_type = 'topic'
app.conf.task_default_routing_key = 'task.default'

task_routes = {
    'credit_proposal.tasks.import_feed': {
        'queue': 'credit_tasks',
        'routing_key': 'credit.submit_proposal',
    },
}
