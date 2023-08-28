import factory

from apps.credit_proposal.models import CreditProposal, ProposalRequirements


class CreditProposalFactory(factory.django.DjangoModelFactory):
    """
    Define a CreditProposal Factory.
    """

    class Meta:
        model = CreditProposal

    document = factory.Faker("text")
    name = factory.Faker("name")
    approved = factory.Faker("boolean")
    human_analysis = factory.Faker("boolean")


class ProposalRequirementsFactory(factory.django.DjangoModelFactory):
    """
    Define a ProposalRequirements Factory.
    """

    class Meta:
        model = ProposalRequirements

    proposal_required_fields = """{
        "cpf": "number",
        "cnpj": "number",
        "reason": "text"
    }"""
