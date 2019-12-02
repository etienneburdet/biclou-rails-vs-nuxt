<template>
  <div class="container">
    <div>
      <logo />
      <h1 class="title">
        biclou
      </h1>
      <h2 class="subtitle">
        bike sharing, rails vs nuxt
      </h2>
      <ul>
        <li v-for="bike in bikes">
          <nuxt-link :to="`bikes/${bike._id}`"> {{ bike.name }} </nuxt-link>
        </li>
      </ul>
      <div class="links">
        <a
          href="https://nuxtjs.org/"
          target="_blank"
          class="button--green"
        >
          Documentation
        </a>
        <a
          href="https://github.com/nuxt/nuxt.js"
          target="_blank"
          class="button--grey"
        >
          GitHub
        </a>
      </div>
    </div>
  </div>
</template>

<script>
import Logo from '~/components/Logo.vue'
const credentials = {
  "apikey": "GleF_QwQfutr1UTwI3uz09ci9pKnwyyVHTrhcOGQUt0L",
  "host": "9cc819eb-31e4-4d0b-b5a2-b47068260a3c-bluemix.cloudantnosqldb.appdomain.cloud",
  "iam_apikey_description": "Auto generated apikey during resource-key operation for Instance - crn:v1:bluemix:public:cloudantnosqldb:eu-gb:a/7ee0cc0da68c4579bab86aba1e78a1b4:357f058a-17e1-43d6-ac5d-6e4e028050d1::",
  "iam_apikey_name": "auto-generated-apikey-34985130-121e-4b36-8b7f-31b7395dce6e",
  "iam_role_crn": "crn:v1:bluemix:public:iam::::serviceRole:Manager",
  "iam_serviceid_crn": "crn:v1:bluemix:public:iam-identity::a/7ee0cc0da68c4579bab86aba1e78a1b4::serviceid:ServiceId-a478ddc2-07c0-438b-ad45-29df08951589",
  "password": "9c308a3fa13d7b0cf28d58539db62773aecd6d4df9f805b3f3a81b02725e12ad",
  "port": 443,
  "url": "https://9cc819eb-31e4-4d0b-b5a2-b47068260a3c-bluemix:9c308a3fa13d7b0cf28d58539db62773aecd6d4df9f805b3f3a81b02725e12ad@9cc819eb-31e4-4d0b-b5a2-b47068260a3c-bluemix.cloudantnosqldb.appdomain.cloud",
  "username": "9cc819eb-31e4-4d0b-b5a2-b47068260a3c-bluemix"
}

export default {
  components: {
    Logo
  },
  async asyncData({ $axios }) {
    try {
      $axios.setHeader('Content-type', 'application/json');
      const query = '_all_docs?include_docs=true';
      const url = credentials.url + '/bicloud/' + query;
      const res = await $axios.$get(url);
      console.log(res.rows);
      const bikes = res.rows.map(el => el.doc);
      return { bikes };
    } catch (error) {
      console.error(error);
    }
  }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
