@extends('layouts.default')

@section('content')

	<section class="content-header">
      <h3>Daftar Barang</h3>
    </section>

   <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h1 class="box-title">Daftar Barang</h1>
            </div>
            <!-- /.box-header -->


            <div class="box-body">

              <div id="app"></div>
              <script src="{{ mix('js/app.js') }}" type="text/javascript"></script>
              
            </div>
          <!-- /.box -->

          
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>

@stop