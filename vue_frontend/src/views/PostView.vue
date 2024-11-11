<script setup lang="ts">
  import {ref, onMounted} from 'vue'
  const posts = ref<Post[]>([])
  const loading = ref(true)
  const error = ref(null)

  type Post = {
    id: number;
    title: string;
    body: string;
  }

  onMounted(() => {
    console.log('Component is mounted');

    fetch('http://localhost:3000/api/v1/posts')
    .then(response => {
      if (!response.ok) {
        console.log('Network response was not ok', response.statusText);
      }
      return response.json()
      })
      .then(data => {
        console.log('Posts data fetched successfully', data);

        posts.value = data
        loading.value = false
      })
      .catch(err => {
        error.value = err.message
        loading.value = false
        console.log('Fetch error:', err.message);
      })
  })
</script>

<template>
  <div class="about">
    <h1>This is the Posts page</h1>
    <div v-for="post in posts" :key="post.id">
        {{ post.title }}
        {{ post.body }}
    </div>
  </div>
</template>

<style>
@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>
