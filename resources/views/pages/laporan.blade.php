@extends('layouts.default')

@section('content')


   <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Laporan</h3>
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