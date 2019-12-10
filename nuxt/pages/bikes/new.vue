<template>
<b-container>
  <div>
    <b-form @submit="onSubmit" @reset="onReset" v-if="show">
      <b-form-group
        id="input-group-1"
        label="Bike name"
        label-for="input-1"
      >
        <b-form-input
          id="input-1"
          v-model="form.name"
          type="text"
          required
          placeholder="Enter email"
        ></b-form-input>
      </b-form-group>

      <b-form-group
        id="input-group-2"
        label="Bike description"
        label-for="input-2"
      >
        <b-form-textarea
          id="input-2"
          v-model="form.desrciption"
          type="text"
          required
          placeholder="Desrcibe your bike"
        ></b-form-textarea>
      </b-form-group>

      <b-button type="submit" variant="primary">Submit</b-button>
      <b-button type="reset" variant="danger">Reset</b-button>
    </b-form>
    <b-card class="mt-3" header="Form Data Result">
      <pre class="m-0">{{ form }}</pre>
    </b-card>
  </div>
</b-container>
</template>

<script>
  export default {
    data() {
      return {
        form: {
          name: '',
          desrciption: '',
          type: 'bike'
        },
        show: true
      }
    },
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        this.$axios.setToken(process.env.CLOUDANT_TOKEN, 'Basic ')
        const _id = `${this.form.name}-${Date.now()}`
        this.form._id = _id
        const bike = JSON.stringify(this.form)
        this.$axios.$put(_id, bike)
          .then((res) => console.log(res))
          .catch((err) => console.log(err));
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
