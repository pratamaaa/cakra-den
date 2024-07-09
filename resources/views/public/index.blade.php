@extends('public.public_layout')
@section('content')
   <div class="content">


      <!-- Offsetting columns -->
      <div class="panel panel-flat">
         <div class="panel-heading">
            <h5 class="panel-title">Offsetting columns</h5>
            <div class="heading-elements">
               <ul class="icons-list">
                  <li><a data-action="collapse"></a></li>
                  <li><a data-action="reload"></a></li>
                  <li><a data-action="close"></a></li>
               </ul>
            </div>
            <a class="heading-elements-toggle"><i class="icon-menu"></i></a>
         </div>

         <div class="panel-body">
            <p class="content-group">Move columns to the right using <code>.col-md-offset-*</code> classes. These classes increase the left margin of a column by <code>*</code> columns. For example, <code>.col-md-offset-4</code> moves <code>.col-md-4</code> over four columns.</p>

            <p class="text-semibold">Grid example</p>
            <div class="grid-demo">
               <div class="row">
                  <div class="col-md-4">
                     <div>.col-md-4</div>
                  </div>
                  <div class="col-md-4 col-md-offset-4">
                     <div>.col-md-4 .col-md-offset-4</div>
                  </div>
               </div>

               <div class="row">
                  <div class="col-md-3 col-md-offset-3">
                     <div>.col-md-3 .col-md-offset-3</div>
                  </div>
                  <div class="col-md-3 col-md-offset-3">
                     <div>.col-md-3 .col-md-offset-3</div>
                  </div>
               </div>

               <div class="row">
                  <div class="col-md-6 col-md-offset-3">
                     <div>.col-md-6 .col-md-offset-3</div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- /offsetting columns -->

   </div>
   <script type="text/javascript">
      $(document).ready(function() {

      });
   </script>
@endsection
