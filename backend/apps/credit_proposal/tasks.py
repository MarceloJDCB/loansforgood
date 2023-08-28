import json

import requests
from celery import shared_task

from core import settings

from . import models


@shared_task()
def submit_proposal_for_loan(credit_proposal_id):
    credit_proposal = models.CreditProposal.objects.get(id=credit_proposal_id)
    url = f"{settings.LOAN_API}/loan/"
    headers = {"accept": "application/json"}
    data = {
        "name": credit_proposal.name,
        "document": credit_proposal.document
    }
    response = requests.post(url, data, headers=headers)
    if response.text:
        response_data = json.loads(response.text)
        approved = response_data.get("approved")
        credit_proposal.approved = approved
        credit_proposal.human_analysis = approved
        credit_proposal.save()

    return response.status_code, response.text
