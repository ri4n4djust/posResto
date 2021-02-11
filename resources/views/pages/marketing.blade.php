@extends('layouts.default')

@section('content')

  <section class="content-header">
      <h1>List News </h1>

    </section>

   <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><a href="/TambahBerita">Add New</a></h3>
            </div>
            <!-- /.box-header -->

            <div class="box-body">
             

            <div id="app"></div>
              <script src="{{ mix('js/app.js') }}" type="text/javascript"></script>
              
            </div>
            

            



            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>

@stop