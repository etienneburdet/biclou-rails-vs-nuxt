<template lang="html">
  <div>
    <h1>{{ bike.name }}</h1>
    {{ bike.Description }}
    <nuxt-link :to="{ path: '../rentals/new', query: { bike_id: bike._id }}">
      Rent this bike
    </nuxt-link>
  </div>
</template>

<script>

export default {
  async asyncData({ $axios, params }) {
    const query = params.id;
    $axios.setToken(process.env.CLOUDANT_TOKEN, 'Basic ');
    const bike = await $axios.$get(query);
    return { bike };
  }
}
</script>

<style lang="css" scoped>
</style>
