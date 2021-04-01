<template>

    <router-view>
        <statusComponen></statusComponen>
    </router-view>

</template>

<script>
import statusComponent from './components/Status.vue';
    export default {
        components: statusComponent

    }
</script>