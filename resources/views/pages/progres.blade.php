@extends('adminpanel.layouts.default')

@section('content')


    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        
      </div>


  <section class="content-header">
      <h1>Repeater On Progres</h1>

    </section>

   <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Hover Data Table</h3>
            </div>
            <!-- /.box-header -->

            <div class="box-body">
              <table id="dtBasicExample" class="table responsive display nowrap">
                <thead>
                <tr>
                  <th>No. Reg</th>
                  <th>Full Name</th>
                  <th>Position</th>
                  
                  <th>Join Date</th>
                  <th>Port</th>
                  <th>Act</th>
                </tr>
                </thead>

                <tbody>
                @foreach($repeater as $n)
                <tr id="tr_{{$n->id_m}}">
                  <td>{{ $n->id_m }}</td>
                  <td>{{ $n->firstname }} {{ $n->lastname }}

                  <div class="progress">
                    <div class="progress-bar progress-bar-primary progress-bar-striped sm" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                      <span >40% Complete</span>
                    </div>
                  </div>
                  </td>
                  <td>{{ $n->posisi }}</td>
                  <td>{{ $n->joinDate }}</td>
                  <td>{{ $n->port }}</td>
                  <td>

                  @if(session('user') == $n->edit)
                  <?php
                  $use = DB::select("select * from pegawai where id_peg='$n->edit'");
                  foreach ($use as $u) {
                  ?>
                    <span class="direct-chat-name pull-left">edit by {{$u->nama_p}}</span>
                  <?php } ?>
                   <a href="{{url('/detailrepeater')}}/{{$n->id_m}}">Edit</a>
                  @elseif($n->edit == '')
                  <a href="{{url('/detailrepeater')}}/{{$n->id_m}}">det</a>
                  @else
                  <?php
                  $use = DB::select("select * from pegawai where id_peg='$n->edit'");
                  foreach ($use as $u) {
                  ?>
                    <span class="direct-chat-name pull-left">edit By {{$u->nama_p}}</span>
                  <?php } ?>
                  @endif


                  <a href="{{url('/detailprogres')}}/{{$n->id_m}}">Progres</a>
                  <a href="{{url('/setupjoin')}}/{{$n->id_m}}">Setup</a>   
                  <a href="{{url('/onlinedata')}}/{{$n->id_m}}" ></a>  
                  </td>
                </tr>
                @endforeach


                </tbody>
                <tfoot>
                <tr>
                 <th>No. Reg</th>
                  <th>Surname (s) / First name(s)</th>
                  <th>Position applied for</th>
                  <th>Join Date</th>
                  <th>Port</th>
                  <th>Act</th>
                </tr>
                </tfoot>
              </table>
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