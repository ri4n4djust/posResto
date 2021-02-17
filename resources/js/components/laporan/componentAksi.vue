<template>
    <div >
        <button class="btn btn-outline-success" @click="ViewAction('view')">
            <i class="fa fa-eye"></i>
        </button>
        <button class="btn btn-outline-primary" @click="EditAction('edit')">
            <i class="fa fa-edit"></i>
        </button>
        <button class="btn btn-outline-dark" @click="DeleteAction('delete')">
            <i class="fa fa-trash"></i>
        </button>
    </div>
</template>
<script>
export default {
    name: "ActionButtons",
    data() {
            return {
                posts: [],
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

            loadData:function(){
                let uri = '/api/posts';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                
            });
            },
            
            EditAction() {
                const path = '/barang/edit/' + this.data.id
                this.$router.push(path)
                //alert('edit' + this.data.id)
                //this.$store.commit(edit, this.data)
            },
            ViewAction() {
                alert('View' + this.data.id)
                //this.$store.commit(edit, this.data)
            },
            DeleteAction(index) {
                this.axios.delete('/api/posts/'+ this.data.id)
                //this.posts = response.data.data;
                //this.loadData()
                this.posts.splice(index, 1);
                alert('Sukses Delete' + this.data.nmbarang)
                //this.$store.commit(edit, this.data)
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