<template>
  <h1 class="title">Loans For Good</h1>
  <DynamicForm/>
</template>

<script>
import DynamicForm from './components/DynamicForm.vue'

export default {
  name: 'App',
  components: {
    DynamicForm
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: white;
  margin-top: 60px;
}
.title{
  font-family: 'Times New Roman', Times, serif;
  -webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: black;
  font-size: 15vh;
}
body{
  background-color: #151a1a;
}
</style>
