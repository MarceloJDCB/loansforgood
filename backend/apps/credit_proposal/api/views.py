from rest_framework import generics, viewsets, permissions

from apps.credit_proposal.models import CreditProposal, ProposalRequirements
from apps.credit_proposal.api.serializers import CreditProposalSerializer, ProposalRequirementsSerializer


class BaseView:
    permission_classes = [permissions.AllowAny]


class ProposalRequirementsDetail(generics.RetrieveAPIView, BaseView):
    queryset = ProposalRequirements.objects.all()
    serializer_class = ProposalRequirementsSerializer

    def get_object(self):
        return self.queryset.first()


class CreditProposalViewset(viewsets.ModelViewSet, BaseView):
    queryset = CreditProposal.objects.all()
    serializer_class = CreditProposalSerializer

    def make_document_conversion(self):
        proposal_requirements = ProposalRequirements.objects.first()
        document = self.request.data.get('document')
        proposal_requirements.validate_requirements(document)
        self.request.data['document'] = str(document)

    def create(self, request, *args, **kwargs):
        self.make_document_conversion()
        return super().create(request, *args, **kwargs)
