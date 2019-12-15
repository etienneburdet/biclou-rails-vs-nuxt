require('dotenv').config()

export default {
  mode: 'universal',
  /*
  ** Headers of the page
  */
  head: {
    title: process.env.npm_package_name || '',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: process.env.npm_package_description || '' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },
  /*
  ** Global CSS
  */
  css: [
  ],
  /*
  ** Plugins to load before mounting the App
  */
  plugins: [
  ],
  /*
  ** Nuxt.js dev-modules
  */
  buildModules: [
    '@nuxtjs/dotenv'
  ],
  // env
  env: {
    CLOUDANT_TOKEN: process.env.CLOUDANT_TOKEN
  },
  /*
  ** Nuxt.js modules
  */
  modules: [
    // Doc: https://bootstrap-vue.js.org
    'bootstrap-vue/nuxt',
    '@nuxtjs/axios',
    '@nuxtjs/auth'
  ],

  auth: {
    strategies: {
      auth0: {
        domain: 'dev-23dd-ysw.eu.auth0.com',
        client_id: '89i8fWQ0zLwE2NdvgrjxW5AE6MzShxOI',
        audience: 'http://localhost:3000'
      }
    }
  },

  router: {
    middleware: ['auth']
  },

  axios: {
    // proxyHeaders: false
    baseURL: 'https://9cc819eb-31e4-4d0b-b5a2-b47068260a3c-bluemix.cloudantnosqldb.appdomain.cloud/bicloud'
  },

  /*
  ** Build configuration
  */
  // generate: {
  //   dir: "public"
  // },

  build: {
    /*
    ** You can extend webpack config here
    */
    extend (config, ctx) {
    }
  },
}
