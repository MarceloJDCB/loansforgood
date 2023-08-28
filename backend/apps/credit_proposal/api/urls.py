# -*- coding: utf-8 -*-
from django.urls import path
from rest_framework.routers import DefaultRouter

from . import views

app_name = "credit_proposal"
router = DefaultRouter()

router.register(
    r"creditproposalset",
    views.CreditProposalViewset,
    basename="credit-proposal"
)

urlpatterns = [
    path("proposal-requirements/", views.ProposalRequirementsDetail.as_view(), name="proposal-requirements-detail"),
] + router.urls
