
@extends('pms.backend.layouts.master-layout')

@section('title', session()->get('system-information')['name']. ' | '.$title)

@section('page-css')
<style type="text/css">
    .modal-backdrop{
        position: relative !important;
    }
</style>
@include('yajra.css')
@endsection

@section('main-content')
<!-- WRAPPER CONTENT ----------------------------------------------------------------------------->
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
                    <a href="{{route('pms.admin.users.create')}}" class="btn btn-sm btn-primary text-white" data-toggle="tooltip" title="Add New User"> <i class="las la-plus"></i>Add New User</a>

                    <a href="{{route('pms.admin.users.deleted')}}" class="btn btn-sm btn-danger text-white" data-toggle="tooltip" title="Active Users"> <i class="las la-ban"></i>View Deleted Users</a>
                </li>
            </ul><!-- /.breadcrumb -->

        </div>

        <div class="page-content">
            <div class="">
                <div class="panel panel-info">
                    <div class="panel-body table-responsive">
                        @include('yajra.datatable')
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END WRAPPER CONTENT ------------------------------------------------------------------------->
<!-- Modal ------------------------------------------------------------------------->
<div class="modal fade bd-example-modal-md" id="showUserDetailsModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center">Use Details Information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body" id="dataBody">

            </div>
        </div>
    </div>
</div>
<!-- END Modal ------------------------------------------------------------------------->
<!-- Reset Password Modal ------------------------------------------------------------------------->
<div class="modal fade bd-example-modal-md" id="resetPasswordModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Reset User Password</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="resetPasswordForm">
                <div class="modal-body">
                    @csrf
                    <input type="hidden" name="id" id="reset_user_id">
                    <div class="form-group">
                        <label for="new_password">New Password</label>
                        <input type="password" name="new_password" id="new_password" class="form-control" placeholder="Enter new password" required>
                    </div>
                    <div class="form-group">
                        <label for="new_confirm_password">Confirm Password</label>
                        <input type="password" name="new_confirm_password" id="new_confirm_password" class="form-control" placeholder="Confirm new password" required>
                    </div>
                    <div id="resetPasswordMessage"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="resetPasswordBtn">Reset Password</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- END Reset Password Modal ------------------------------------------------------------------------->
@endsection

@section('page-script')
@include('yajra.js')
<script>
    function showUserDetails(userId) {
        $('#dataBody').empty().load('{{URL::to(Request()->route()->getPrefix()."/users")}}/'+userId);
        $('#showUserDetailsModal').modal('show');
    }

    function resetUserPasswordModal(userId) {
        $('#reset_user_id').val(userId);
        $('#new_password').val('');
        $('#new_confirm_password').val('');
        $('#resetPasswordMessage').html('');
        $('#resetPasswordModal').modal('show');
    }

    $(document).ready(function() {
        $('#resetPasswordForm').on('submit', function(e) {
            e.preventDefault();
            var btn = $('#resetPasswordBtn');
            btn.html('<i class="la la-spinner la-spin"></i> Processing...').prop('disabled', true);

            $.ajax({
                url: '{{ route("pms.admin.users.resetPassword") }}',
                type: 'POST',
                data: $(this).serialize(),
                success: function(response) {
                    if (response.success) {
                        $('#resetPasswordMessage').html('<div class="alert alert-success">' + response.message + '</div>');
                        setTimeout(function() {
                            $('#resetPasswordModal').modal('hide');
                        }, 1500);
                    } else {
                        $('#resetPasswordMessage').html('<div class="alert alert-danger">' + response.message + '</div>');
                    }
                },
                error: function(xhr) {
                    $('#resetPasswordMessage').html('<div class="alert alert-danger">Something went wrong. Please try again.</div>');
                },
                complete: function() {
                    btn.html('Reset Password').prop('disabled', false);
                }
            });
        });
    });
</script>
@endsection