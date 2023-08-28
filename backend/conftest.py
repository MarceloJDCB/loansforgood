import pytest
from pytest_factoryboy import register
from django.core.management import call_command

from apps.credit_proposal.tests.factories import CreditProposalFactory, ProposalRequirementsFactory

pytest_plugins = ("celery.contrib.pytest", )

# Credit Proposal
register(CreditProposalFactory)
register(ProposalRequirementsFactory)


@pytest.fixture(scope='session')
def django_db_setup(django_db_setup, django_db_blocker):
    with django_db_blocker.unblock():
        # Chama o comando "migrate" apenas na primeira execuÃ§Ã£o
        call_command('migrate')


@pytest.fixture
def user_credentials(user):
    password = "test_password"
    user.set_password(password)
    user.save()
    return user, password


@pytest.fixture
def headers():
    """default headers on make request"""
    return {"content_type": "application/json"}


@pytest.fixture
def authenticated_client(client, user):
    client.force_login(user)
    return client
