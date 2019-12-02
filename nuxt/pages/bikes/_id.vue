<template lang="html">
  <div>
    <h1>{{ bike.name }}</h1>
    {{ bike.Description }}
  </div>
</template>

<script>

export default {
  async asyncData({ $axios, params }) {
    try {
      const query = params.id;
      const url = process.env.cloudantUrl + '/bicloud/' + query;
      const bike = await $axios.$get(url);
      return { bike };
    } catch (error) {
      console.error(error);
    }
  }
}
</script>

<style lang="css" scoped>
</style>
