/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))


import VueRouter from 'vue-router';
Vue.use(VueRouter);

import VueAxios from 'vue-axios';
import axios from 'axios';

import App from './App.vue';
Vue.use(VueAxios, axios);

import VueSession from 'vue-session';
Vue.use(VueSession);


import VueHtmlToPaper from 'vue-html-to-paper';
const options = {
  name: '_blank',
  specs: [
    'fullscreen=yes',
    'titlebar=yes',
    'scrollbars=yes'
  ],
  styles: [
    'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css',
    'https://unpkg.com/kidlat-css/css/kidlat.css'
  ]
}
Vue.use(VueHtmlToPaper, options);


import IndexComponent from './components/posts/Index.vue';
import CreateComponent from './components/posts/Create.vue';
import EditComponent from './components/posts/Edit.vue';
import mentahComponent from './components/posts/barangMentah.vue';

import IndexSupComponent from './components/supplier/Index.vue';
import CreateSupComponent from './components/supplier/Create.vue';
import EditSupComponent from './components/supplier/Edit.vue';

import IndexKatComponent from './components/kategori/Index.vue';
import CreateKatComponent from './components/kategori/Create.vue';
import EditKatComponent from './components/kategori/Edit.vue';

import IndexMejaComponent from './components/meja/Index.vue';
import CreateMejaComponent from './components/meja/Create.vue';
import EditMejaComponent from './components/meja/Edit.vue';
import DetailMejaComponent from './components/meja/Detail.vue';

import IndexMenuComponent from './components/menu/Index.vue';
import CreateMenuComponent from './components/menu/Create.vue';
import EditMenuComponent from './components/menu/Edit.vue';

import CreatePembelian from './components/PembelianCreate.vue';
import liveorder from './components/LiveOrder.vue';

import homeComponent from './components/Home.vue';

import LaporanPenjualanComponent from './components/laporan/laporanPenjualan.vue';
import LaporanPembelianComponent from './components/laporan/laporanPembelian.vue';
import StokOpnameComponent from './components/laporan/laporanStokOpname.vue';

import InputStokOpnameComponent from './components/stokOpname/StokOpname.vue';

import VueCurrencyFilter from 'vue-currency-filter'
Vue.use(VueCurrencyFilter,
    {
      symbol : 'Rp.',
      thousandsSeparator: '.',
      fractionCount: 0,
      fractionSeparator: ',',
      symbolPosition: 'front',
      symbolSpacing: true
    })

const routes = [
    {
        name: 'posts',
        path: '/barang',
        component: IndexComponent
    },
    {
        name: 'barangmentah',
        path: '/barangmentah',
        component: mentahComponent
    },
    {
        name: 'create',
        path: '/barang/create',
        component: CreateComponent
    },
    {
        name: 'edit',
        path: '/barang/edit/:id',
        component: EditComponent
    },
    //supplier
    {
        name: 'supplier',
        path: '/supplier',
        component: IndexSupComponent
    },
    {
        name: 'createSupplier',
        path: '/supplier/create',
        component: CreateSupComponent
    },
    {
        name: 'editSupplier',
        path: '/supplier/edit/:id',
        component: EditSupComponent
    },
    //Kategori
    {
        name: 'kategori',
        path: '/kategori',
        component: IndexKatComponent
    },
    {
        name: 'createKategori',
        path: '/kategori/create',
        component: CreateKatComponent
    },
    {
        name: 'editKategori',
        path: '/kategori/edit/:id',
        component: EditKatComponent
    },
    //meja
    {
        name: 'meja',
        path: '/meja',
        component: IndexMejaComponent
    },
    {
        name: 'createMeja',
        path: '/meja/create',
        component: CreateMejaComponent
    },
    {
        name: 'editMeja',
        path: '/meja/edit/:id',
        component: EditMejaComponent
    },
    {
        name: 'detailMeja',
        path: '/meja/detail/:id',
        component: DetailMejaComponent
    },
    //menu
    {
        name: 'menu',
        path: '/menu',
        component: IndexMenuComponent
    },
    {
        name: 'createMenu',
        path: '/menu/create',
        component: CreateMenuComponent
    },
    {
        name: 'editMenu',
        path: '/menu/edit/:id',
        component: EditMenuComponent
    },
    //=======Pembelian
    {
        name: 'pembelian',
        path: '/pembelian',
        component: CreatePembelian
    },
    //=======Pembelian
    {
        name: 'liveorder',
        path: '/liveorder',
        component: liveorder
    },

    //=======Laporan
    {
        name: 'laporanpenjualan',
        path: '/laporanpenjualan',
        component: LaporanPenjualanComponent
    },
    {
        name: 'laporanpembelian',
        path: '/laporanpembelian',
        component: LaporanPembelianComponent
    },
    {
        name: 'laporanstokopname',
        path: '/laporanstokopname',
        component: StokOpnameComponent
    },

    //=========Stok Opname
    {
        name: 'stokopname',
        path: '/stokopname',
        component: InputStokOpnameComponent
    }
];



const router = new VueRouter({
    mode: 'history',
    routes: routes
});

const app = new Vue(Vue.util.extend({ router }, App)).$mount('#app');

