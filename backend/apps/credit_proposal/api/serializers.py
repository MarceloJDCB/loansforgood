from rest_framework import serializers

from apps.credit_proposal.tasks import submit_proposal_for_loan
from apps.credit_proposal.models import CreditProposal, ProposalRequirements


class ProposalRequirementsSerializer(serializers.ModelSerializer):

    class Meta:
        model = ProposalRequirements
        fields = ["proposal_required_fields"]


class CreditProposalSerializer(serializers.ModelSerializer):

    class Meta:
        model = CreditProposal
        fields = ["name", "document"]

    def save(self, **kwargs):
        instance = super().save(**kwargs)
        submit_proposal_for_loan.apply_async(
            args=[instance.id],
            queue='credit_tasks',
            routing_key='credit.submit_proposal'
        )
        return instance
