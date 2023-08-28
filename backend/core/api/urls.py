from django.urls import path, include

app_name = "api"
urlpatterns = [
    path("credit_proposal/", include("apps.credit_proposal.api.urls", namespace="credit_proposal")),
]
