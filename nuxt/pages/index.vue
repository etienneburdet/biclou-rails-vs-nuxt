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
        <li>
          <nuxt-link :to="'bikes/new'"> Ajouter un vélo </nuxt-link>
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

export default {
  components: {
    Logo
  },
  async asyncData({ $axios }) {
    try {
      const query = '_all_docs?startkey="bike:"&endkey="bike\\ufff0"&include_docs=true';
      $axios.setToken(process.env.CLOUDANT_TOKEN, 'Basic ');
      const res = await $axios.$get(query);
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
