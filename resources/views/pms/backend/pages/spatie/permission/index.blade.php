
@extends('pms.backend.layouts.master-layout')

@section('title', session()->get('system-information')['name']. ' | '.$title)

@section('page-css')
    <style type="text/css">
        .modal-backdrop{
            position: relative !important;
        }

    </style>
@endsection

@section('main-content')
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li>
                        <a href="#">PMS</a>
                    </li>
                    <li class="active">{{__($title)}} List</li>
                    <li class="top-nav-btn">
                        @can('permission-create')
                        <a href="javascript:void(0)" class="btn btn-sm btn-primary text-white" data-toggle="tooltip" title="Add New Permission" id="addPermissionBtn"> <i class="las la-plus"></i>Add</a>
                        @endcan
                    </li>
                </ul>

            </div>

            <div class="page-content">
                <div class="">
                    <div class="panel panel-info">
                        <div class="panel-body table-responsive">
                            <table  id="dataTable" class="table table-striped table-bordered table-head" border="1">
                                <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>Permission Name</th>
                                    <th>Guard name</th>
                                    <th>Module</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bd-example-modal-md" id="permissionModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Permission</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                {!! Form::open(array('route' => 'pms.acl.permission.store','id'=>'permissionForm','class'=>'form-horizontal','method'=>'POST','role'=>'form')) !!}

                <div class="modal-body">
                    <div class="form-group row">
                        <label for="module" class="control-label col-md-12"><strong>Module <span class="text-danger">&nbsp;*</span></strong></label>
                        <div class="col-md-12">
                            <input type="text" list="modules" name="module" id="module" class="form-control">
                            <datalist id="modules">
                                @if(isset($modules[0]))
                                @foreach($modules as $key => $module)
                                    <option value="{{ $module }}">
                                @endforeach
                                @endif
                            </datalist>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="permission" class="control-label col-md-12"><strong>Permissions <span class="text-danger">&nbsp;*</span></strong></label>
                        <div class="col-md-12">
                            {!! Form::Select('name[]', [] ,old('name'),['id'=>'permission','multiple' => true, 'required'=>true,'class'=>'form-control rounded select2-tags','style'=>'width:100%']) !!}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-sm btn-primary text-white rounded" id="requisitionTypeFormSubmit">{{ __('Save') }}</button>
                </div>
                {!! Form::close(); !!}
            </div>
        </div>
    </div>
@endsection

@section('page-script')

    <script>
        $(document).ready(function() {

            $("#permission").select2({
                tags: true,
                placeholder: "Type permission name and hit enter",
                allowClear: true
            });
        });
    </script>

    <script>
        $(function() {
            $('#dataTable').DataTable( {
                processing: true,
                serverSide: true,
                "lengthMenu": [[50, 100, 200,500, -1], [50, 100, 200, 500,1000,"All"]],
                ajax: '{{ URL::to("pms/acl/permission/create") }}',
                columns: [
                    { data: 'DT_RowIndex',orderable:true},
                    { data: 'name',name:'permissions.name'},
                    { data: 'guard_name',name:'permissions.guard_name'},
                    { data: 'module',name:'permissions.module'},
                    { data: 'action'},
                ]
            });

        });

        function deleteConfirm(id){
            swal({
                title: "{{__('Are you sure?')}}",
                text: "You won't be able to revert this!",
                icon: "warning",
                dangerMode: true,
                buttons: {
                    cancel: true,
                    confirm: {
                        text: "Yes, delete it!",
                        value: true,
                        visible: true,
                        closeModal: true
                    },
                },
            }).then((result) => {
                if (result) {
                $("#"+id).submit();
            }
        })
        }
    </script>

    <script>
        (function ($) {
            "use script";
            $('[data-toggle="tooltip"]').tooltip();
            const form = document.getElementById('permissionForm');
            const tableContainer = document.getElementById('dataTable').querySelector('tbody');

            const showAlert = (status, error) => {
                swal({
                    icon: status,
                    text: error,
                    dangerMode: true,
                    buttons: {
                        cancel: false,
                        confirm: {
                            text: "OK",
                            value: true,
                            visible: true,
                            closeModal: true
                        },
                    },
                }).then((value) => {
                    if(value)form.reset();
            });
            };


            $('#addPermissionBtn').on('click', function () {
                $('#permissionModal').modal('show');
//                form.setAttribute('data-type', 'post');
            });

        })(jQuery)
    </script>
@endsection