from django.contrib import admin

from apps.credit_proposal.models import CreditProposal, ProposalRequirements


@admin.register(ProposalRequirements)
class ProposalRequirementsAdmin(admin.ModelAdmin):
    fields = (
        "proposal_required_fields",
    )

    def has_add_permission(self, request) -> bool:
        return False

    def has_delete_permission(self, request, obj=None) -> bool:
        return False


@admin.register(CreditProposal)
class CreditProposalAdmin(admin.ModelAdmin):
    list_display = (
        "document",
        "name",
        "approved",
        "human_analysis"
    )
    readonly_fields = (
        "human_analysis",
    )
    fields = (
        "document",
        "name",
        "approved",
    )

    ordering = ("-created_at",)

    list_filter = ("human_analysis",)

    def has_change_permission(self, request, obj=None):
        if obj and obj.human_analysis:
            return True
        return False

    def save_model(self, request, obj, form, change):
        if change:
            obj.human_analysis = False
        super().save_model(request, obj, form, change)
