<template lang="html">
  <b-navbar fixed="bottom" variant="primary">
    <b-navbar-nav class="justify-content-center my-2 w-100">
      <b-nav-item href="/">Search</b-nav-item>
      <b-nav-item href="/bikes">Bikes</b-nav-item>
      <b-nav-item href="/rentals">Rentals</b-nav-item>
      <b-nav-item @click="login">Login</b-nav-item>
    </b-navbar-nav>
  </b-navbar>
</template>

<script type="text/javascript">
  export default {
    methods: {
      login: function() {
        this.$auth.loginWith('auth0')
      }
    }
  }
</script>
