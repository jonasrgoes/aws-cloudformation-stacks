import locale

from aws_lambda_powertools.tracing import Tracer
from aws_lambda_powertools.logging.logger import Logger
from aws_lambda_powertools import Metrics
from aws_lambda_powertools.metrics import MetricUnit

locale.setlocale(locale.LC_ALL, 'pt_BR')

logger = Logger()
tracer = Tracer()
metrics = Metrics(namespace="Test", service="Function1")


@metrics.log_metrics(raise_on_empty_metrics=False, capture_cold_start_metric=True)
@logger.inject_lambda_context
@tracer.capture_lambda_handler
def lambda_handler(event, context):

    return {
        'statusCode': 200,
        'body': "Function1 Fired"
    }
