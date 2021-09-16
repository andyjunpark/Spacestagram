<template>
  <div class="search">
    <h2>SPACESTAGRAM</h2>
  
  <!-- Search Button -->
  <div class="boxContainer">
    <table class="elementsContainer">
      <tr>
        <td>
            <form v-on:submit.prevent="getResult(query)">
              <input type="text" placeholder="Search" class="search" v-model="query" />
              <a href="#">
                <i class="fas fa-search"></i>
              </a>
            </form>
        </td>
      </tr>
    </table>
  </div>

  <!-- Get Results-->
    <div class="results" v-if="results">
      <div v-for="result in results" :key="result">
        <div class="card">
          <img v-bind:src="result.links[0].href" />
          <h4>{{result.data[0].title}}</h4>
          <p>{{result.data[0].date_created}}</p>
        </div>
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
/* Texts*/
h2 {
  color:black;
}

h3 {
  margin: 40px 0 0;
}

h4 {
  margin: 20px 0 0;
  color:black;
  opacity:90%;
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
  color:#000000;
  opacity:70%;
}

p {
  padding:5%;
  color:black;
  opacity:90%;
}
/* Result Cards*/
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.4);
  transition: 0.5s;
  width:400px;
  margin-top:5%;
  margin-left:auto;
  margin-right:auto;
  border-radius:10px;
  background-color: white;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.4);
}

.results img {
  max-width:380px;
  margin:0px;
  padding:10px;
}

.boxContainer {
  margin:auto;
  margin-top:10%;
  position:relative;
  width:300px;
  height:42px;
  border: 2px solid #000000;
  padding:0px 10px;
  border-radius: 50px;
  opacity:80%;
}

.elementsContainer {
  width: 100%;
  height: 100%;
  vertical-align: middle;
}

.search {
  border: none;
  height: 100%;
  border-radius: 50px;
  font-size:18px;
  color: #424242;
  font-weight: 500;
}

.search:focus {
  outline:none;
}

</style>
