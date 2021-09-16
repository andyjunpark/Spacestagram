<template>
  <div class="search">
    <h2>SPACESTAGRAM</h2>
    <fas icon="fa-coffee" />
    <form v-on:submit.prevent="getResult(query)">
      <i class="fas fa-search"></i>
      <input type="text" placeholder="Search" v-model="query" />
    </form>
    <div class="results" v-if="results">
      <div v-for="result in results" :key="result">
        <img v-bind:src="result.links[0].href" />
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'search',
  data() {
    return {
      msg:'Search',
      query:'',
      results: ''
    }
  },
  methods: {
    getResult(query) {
      axios.get('https://images-api.nasa.gov/search?q=' + query + '&media_type=image')
      .then(response => {
        console.log(response.data.collection.items);
        this.results = response.data.collection.items;
      });
    }
  } 
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.results img {
  max-width:400px;
  margin:10px;
  border-radius:15px;
}

h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
