from unittest.mock import patch

from django.urls import reverse


def test_get_proposal_requirements_detail(db, client):
    url = reverse("api:credit_proposal:proposal-requirements-detail")
    response = client.get(url)
    proposal_required_fields = response.data.get('proposal_required_fields')
    assert proposal_required_fields == "{'cpf': 'number', 'cnpj': 'number', 'reason': 'text'}"


def test_credit_proposal_wrong_fields(db, client, headers):
    url = reverse("api:credit_proposal:credit-proposal-list")

    payload = {
        "document": {
            "cpf": "123",
            "cnpj": "abc",
            "reason": "123"
        },
        "name": "Marcelo"
    }
    response = client.post(url, data=payload, **headers)
    assert response.data.get('cnpj')
    assert response.status_code == 400


@patch(
    "apps.credit_proposal.api.serializers.submit_proposal_for_loan.apply_async", lambda data: data
)
def test_credit_proposal(db, client, headers):
    url = reverse("api:credit_proposal:credit-proposal-list")

    payload = {
        "document": {
            "cpf": "123",
            "cnpj": "123",
            "reason": "Texto"
        },
        "name": "Marcelo"
    }
    response = client.post(url, data=payload, **headers)
    assert response.status_code == 201
