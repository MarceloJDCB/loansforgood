import pytest
from django.core.exceptions import ValidationError as DjangoValidationError
from rest_framework.exceptions import ValidationError

from apps.credit_proposal.models import CreditProposal


@pytest.mark.parametrize("credit_proposal__name", ["Marcelo"])
@pytest.mark.django_db
def test_credit_proposal(db, credit_proposal):
    credit_proposal = CreditProposal.objects.first()
    assert credit_proposal
    assert credit_proposal.name == "Marcelo"


@pytest.mark.django_db
def test_proposal_requirements(db, proposal_requirements):
    assert proposal_requirements


@pytest.mark.django_db
def test_proposal_requirements_cnpj(db, proposal_requirements):
    with pytest.raises(ValidationError):
        document_propose = {
            "cpf": "123",
            "cnpj": "abcdado",
            "reason": "Texto"
        }
        proposal_requirements.validate_requirements(document_propose)


@pytest.mark.django_db
def test_proposal_requirements_cpf(db, proposal_requirements):
    with pytest.raises(ValidationError):
        document_propose = {
            "cpf": "abcdado",
            "cnpj": "123",
            "reason": "Texto"
        }
        proposal_requirements.validate_requirements(document_propose)


@pytest.mark.django_db
def test_proposal_requirements_reason(db, proposal_requirements):
    with pytest.raises(ValidationError):
        document_propose = {
            "cpf": "123",
            "cnpj": "123",
            "reason": False
        }
        proposal_requirements.validate_requirements(document_propose)


@pytest.mark.django_db
def test_proposal_requirements_field_not_exist(db, proposal_requirements):
    with pytest.raises(ValidationError):
        document_propose = {
            "cpf": "123",
            "cnpj": "123",
            "not_exists": False
        }
        proposal_requirements.validate_requirements(document_propose)


@pytest.mark.django_db
def test_proposal_requirements_clean_type_not_exist(db, proposal_requirements):
    with pytest.raises(DjangoValidationError):
        proposal_requirements.proposal_required_fields = "{'preco': 'teste'}"
        proposal_requirements.clean()


@pytest.mark.django_db
def test_proposal_requirements_clean_with_wrong_format(
    db, proposal_requirements
):
    with pytest.raises(DjangoValidationError):
        proposal_requirements.proposal_required_fields = "um jacare banguela entrou no lago"
        proposal_requirements.clean()


@pytest.mark.django_db
def test_proposal_requirements_clean_with_correct_format(
    db, proposal_requirements
):
    proposal_requirements.proposal_required_fields = "{'texto': 'text'}"
    proposal_requirements.clean()
