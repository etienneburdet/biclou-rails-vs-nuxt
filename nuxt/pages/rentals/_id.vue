<template lang="html">
  <div>
    <h1>{{ bike.name }}</h1>
    {{ rental.startDate }} - {{ rental.endDate }}
  </div>
</template>

<script>

export default {
  data() {
    return
  },
  async asyncData({ $axios, params }) {
    $axios.setToken(process.env.CLOUDANT_TOKEN, 'Basic ');
    const rental = await $axios.$get(params.id);
    const bike = await $axios.$get(rental.bikeId)
    return { bike, rental };
  }
}
</script>

<style lang="css" scoped>
</style>
