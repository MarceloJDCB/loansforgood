import ast

from django.db import models
from django.core.exceptions import ValidationError as DjangoValidationError
from django.utils.translation import ugettext_lazy as _
from rest_framework.exceptions import ValidationError
from rest_framework.serializers import CharField, DecimalField, IntegerField

from core.base_model import BaseModel


class ProposalRequirements(BaseModel):
    proposal_required_fields = models.TextField(
        "Campos da Proposta",
        help_text="""
        Define quais campos serão requisitados ao usuário no momento de cadastro de umanova proposta de crédito
        Porfavor respeite a formatação.:
        {"campo1": "number", "campo2": "text", campo3...}
        """
    )

    class Meta:
        verbose_name = _("Requisitos da Proposta de Crédito")

    def __str__(self) -> str:
        return self.proposal_required_fields

    @property
    def proposal_required_fields_dict(self) -> dict:
        return ast.literal_eval(self.proposal_required_fields)

    def validate_requirements(self, document_propose: dict):
        field_validators = {
            "number": IntegerField(),
            "text": CharField(),
            "decimal": DecimalField(max_digits=13, decimal_places=2),
        }
        for field, value in document_propose.items():
            field_type = self.proposal_required_fields_dict.get(field)
            validator = field_validators.get(field_type)
            if not validator:
                raise ValidationError({field: "Verique o formulário enviado com a administração!"})
            validator.field_name = field
            try:
                validator.run_validation(value)
            except ValidationError as err:
                raise ValidationError({field: err.detail})
            except DjangoValidationError as err:
                raise ValidationError({field: err.message})


class CreditProposal(BaseModel):
    document = models.TextField(
        "Documento / Proposta de crédito do cliente"
    )
    name = models.CharField(
        "Nome do Cliente",
        max_length=180
    )
    approved = models.BooleanField(
        "Aprovação",
        default=False,
    )
    human_analysis = models.BooleanField(
        "Análise humana",
        default=False,
        help_text="Destaca a necessidade de análise humana para uma proposta de crédito"
    )

    class Meta:
        verbose_name = _("Proposta de Crédito")
        verbose_name_plural = _("Propostas de Crédito")

    def __str__(self) -> str:
        return f"{self.id} - {self.name}"
