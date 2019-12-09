<template lang="html">
  <div>
    <h1>{{ bike.name }}</h1>
    {{ bike.Description }}
  </div>
</template>

<script>

export default {
  async asyncData({ $axios, params }) {
    const query = params.id;
    $axios.setHeader('Authorization', 'Basic OWNjODE5ZWItMzFlNC00ZDBiLWI1YTItYjQ3MDY4MjYwYTNjLWJsdWVtaXg6OWMzMDhhM2ZhMTNkN2IwY2YyOGQ1ODUzOWRiNjI3NzNhZWNkNmQ0ZGY5ZjgwNWIzZjNhODFiMDI3MjVlMTJhZA==')
    const bike = await $axios.$get(query);
    return { bike };
  }
}
</script>

<style lang="css" scoped>
</style>
