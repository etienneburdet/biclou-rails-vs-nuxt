<template lang="html">
 <div class="">
   {{ bikeId}}
 </div>
</template>

<script>
export default {
  data() {
    return {
      bikeId: this.$route.query.bike_id
    }
  },
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
