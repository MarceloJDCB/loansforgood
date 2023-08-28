from unittest.mock import patch

import pytest

from apps.credit_proposal.tasks import submit_proposal_for_loan
from apps.credit_proposal.models import CreditProposal
from apps.credit_proposal.tests.conftest import MockLoanResponse


@pytest.mark.django_db
@patch('apps.credit_proposal.tasks.requests.post', return_value=MockLoanResponse('{"approved": "False"}', 200))
def test_submit_proposal_for_loan_approved_false(db, credit_proposal):
    submit_proposal_for_loan(credit_proposal.id)
    credit_proposal = CreditProposal.objects.get(id=credit_proposal.id)
    assert not credit_proposal.approved


@pytest.mark.django_db
@patch('apps.credit_proposal.tasks.requests.post', return_value=MockLoanResponse('{"approved": "True"}', 200))
def test_submit_proposal_for_loan_approved_true(db, credit_proposal):
    submit_proposal_for_loan(credit_proposal.id)
    credit_proposal = CreditProposal.objects.get(id=credit_proposal.id)
    assert credit_proposal.approved
    assert credit_proposal.human_analysis
