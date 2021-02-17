<template>
    <div >
        <button class="btn btn-outline-success" @click="handleAction('view')">
            <i class="fa fa-eye"></i>
        </button>
        <button class="btn btn-outline-primary" @click="handleAction('edit')">
            <i class="fa fa-edit"></i>
        </button>
        <button class="btn btn-outline-dark" @click="handleAction('delete')">
            <i class="fa fa-trash"></i>
        </button>
    </div>
</template>
<script>
export default {
    name: "ActionButtons",
    data() {
            return {
                posts: posts,
                data: this.posts,
            }

        },
    created() {
            let uri = '/api/posts';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
        },
    methods: {
            PostDelete(id, index)
            {
                this.axios.delete(`/api/posts/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            },
            
            handleAction(actionName, data) {
            console.log(actionName, data);
            window.alert("check out the console to see the logs" + this.posts.id);
            }
        },
    props: {
        data: {
            type: Object,
            required: true,
        },
    },
};
</script>