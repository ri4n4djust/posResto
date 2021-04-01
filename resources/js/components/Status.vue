<template>
    <h5 class="box-title">
                  Login As {{ this.$session.get('user') }} | Role : {{ this.$session.get('roleID') }}
                  <button type="button" class="btn-sm btn-success" @click="logout()">Log Out</button>
              </h5>
</template>