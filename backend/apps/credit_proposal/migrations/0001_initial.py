# Generated by Django 3.2 on 2023-08-27 02:10

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CreditProposal',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now_add=True)),
                ('deleted_at', models.DateTimeField(blank=True, db_index=True, null=True)),
                ('document', models.TextField(verbose_name='Documento / Proposta de crédito do cliente')),
                ('name', models.CharField(max_length=180, verbose_name='Nome do Cliente')),
                ('approved', models.BooleanField(default=False, verbose_name='Aprovação')),
                ('human_analysis', models.BooleanField(default=False, help_text='Destaca a necessidade de análise humana para uma proposta de crédito', verbose_name='Análise humana')),
            ],
            options={
                'verbose_name': 'Proposta de Crédito',
                'verbose_name_plural': 'Propostas de Crédito',
            },
        ),
        migrations.CreateModel(
            name='ProposalRequirements',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now_add=True)),
                ('deleted_at', models.DateTimeField(blank=True, db_index=True, null=True)),
                ('proposal_required_fields', models.TextField(help_text='\n        Define quais campos serão requisitados ao usuário no momento de cadastro de umanova proposta de crédito\n        Porfavor respeite a formatação.:\n        {"campo1": "number", "campo2": "text", campo3...}\n        ', verbose_name='Campos da Proposta')),
            ],
            options={
                'verbose_name': 'Requisitos da Proposta de Crédito',
            },
        ),
    ]
