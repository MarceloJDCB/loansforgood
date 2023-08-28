<template>
  <h1>Proposta de crédito</h1>
  <div class="form-container">
    <form @submit.prevent="submitForm" class="dynamic-form">
      <div class="form-field">
        <label for="name">Nome</label>
        <input
          type="text"
          id="name"
          name="name"
          v-model="formData.name"
          class="input-field"
        />
      </div>
      <div v-for="(field, index) in formFields" :key="index" class="form-field">
        <label :for="field.name" class="form-label">{{ field.label }}: </label>
        <input
          :step="field.type === 'decimal' ? 'any' : ''"
          :type="field.type === 'decimal' ? 'number' : field.type"
          :id="field.name"
          :name="field.name"
          :value="formData.document[field.name]"
          @input="updateDocumentField(field.name, $event.target.value)"
          class="input-field"
        />
      </div>
      <button type="submit" class="form-button">Enviar</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      formFields: [],
      formData: {
        name: '',
        document: {}
      },
    };
  },
  mounted() {
    this.fetchFormData();
  },
  methods: {
    async fetchFormData() {
      try {
        console.log(this.formData)
        const response = await axios.get('http://localhost:8000/api/credit_proposal/proposal-requirements/');
        const fieldString = response.data.proposal_required_fields;
        const fieldObject = JSON.parse(fieldString.replace(/'/g, '"')); // Converte aspas simples para aspas duplas
        this.formFields = Object.entries(fieldObject).map(([name, type]) => ({
          name,
          type,
          label: name.charAt(0).toUpperCase() + name.slice(1), // Converte a primeira letra para maiúscula
        }));

        this.formFields.forEach(field => {
          this.formData[field] = '';
        });
      } catch (error) {
        console.error('Error fetching form data:', error);
      }
    },
    updateDocumentField(fieldName, value) {
      this.formData.document[fieldName] = value;
    },
    async submitForm() {
      try {
        const response = await axios.post('http://localhost:8000/api/credit_proposal/creditproposalset/', this.formData);
        console.log('Form submitted successfully:', response.data);
      } catch (error) {
        console.error('Error submitting form:', error);
      }
    },
  },
};
</script>

<style>
.form-container {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: left;
}

.dynamic-form {
  width: 30vh;
  padding: 5vh;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  
  
}

.form-field {
  margin-bottom: 15px;
}
.form-label{
  margin-left:0;
}
.input-field {
  
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
  color:white;
  background-color: #151a1a;
}

.form-button{
  width:100%;
  padding: 8px;
  border-radius: 5px;
  border: 1px solid white;
  background-color: white;
}
.form-button:active{
  background-color: #151a1a;
  color:white;
}
</style>
