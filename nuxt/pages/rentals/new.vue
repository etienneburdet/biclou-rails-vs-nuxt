<template lang="html">
 <b-container>
   <b-form @submit="onSubmit" @reset="onReset" v-if="show">
     <b-form-group
       id="input-group-1"
       label="Start date"
       label-for="input-1"
     >
       <b-form-input
         id="input-1"
         v-model="form.startDate"
         type="date"
         required
         placeholder="Start date"
       ></b-form-input>
     </b-form-group>

     <b-form-group
       id="input-group-1"
       label="Start date"
       label-for="input-1"
     >
       <b-form-input
         id="input-1"
         v-model="form.endDate"
         type="date"
         required
         placeholder="End date"
       ></b-form-input>

       <b-button type="submit" variant="primary">Submit</b-button>
       <b-button type="reset" variant="danger">Reset</b-button>
     </b-form-group>
   </b-form>
   <b-card class="mt-3" header="Form Data Result">
     <pre class="m-0">{{ form }}</pre>
   </b-card>
 </b-container>
</template>

<script>
export default {
  data() {
    return {
      show: true,
      form: {
        startDate: new Date,
        endDate: new Date,
        bikeId: this.$route.query.bike_id,
        type: 'rental'
      }
    }
  },
  async asyncData({ $axios, params }) {
    const query = params.id;
    $axios.setToken(process.env.CLOUDANT_TOKEN, 'Basic ');
    const bike = await $axios.$get(query);
    return { bike };
  },
  methods: {
    onSubmit(evt) {
      evt.preventDefault()
      this.$axios.setToken(process.env.CLOUDANT_TOKEN, 'Basic ')
      const _id = `rent-${Date.now()}`
      this.form._id = _id
      const rental = JSON.stringify(this.form)
      this.$axios.$put(_id, rental)
        .then((res) => console.log(res))
        .then(() => this.$router.push({ name: 'rentals-id', params: { id: _id } }))
        .catch((err) => console.log(err))
    },
    onReset(evt) {
      evt.preventDefault()
      // Reset our form values
      this.form.description = ''
      this.form.name = ''
      // Trick to reset/clear native browser form validation state
      this.show = false
      this.$nextTick(() => {
        this.show = true
      })
    }
  }
}
</script>

<style lang="css" scoped>
</style>
