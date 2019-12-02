<template lang="html">
  <div>
    <h1>{{ bike.name }}</h1>
    {{ bike.Description }}
  </div>
</template>

<script>
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
  async asyncData({ $axios, params }) {
    try {
      $axios.setHeader('Content-type', 'application/json');
      const query = params.id;
      const url = credentials.url + '/bicloud/' + query;
      console.log(url);
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
