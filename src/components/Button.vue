<template>
  <div class="starButton">
    <button
class="ui button big toggle"
:class="{active:isActive}"
@click="toggle"
>{{isActive ? 'ON' : 'OFF'}}</button>
  </div>
</template>

<script>
export default {
  name: 'starButton',
  data() {
    return {
      isActive: false,
    }
  },
  toggle() {
   this.isActive = !this.enable;
}}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
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