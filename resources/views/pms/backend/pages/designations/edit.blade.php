@extends('pms.backend.layouts.master-layout')
@section('title', session()->get('system-information')['name']. ' | '.$title)
@section('main-content')
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="{{  route('pms.dashboard') }}">{{ __('Home') }}</a>
                </li>
                <li>
                    <a href="#">PMS</a>
                </li>
                <li class="active">{{__($title)}}</li>
                <li class="top-nav-btn">
                    <a href="javascript:history.back()" class="btn btn-sm btn-warning text-white" data-toggle="tooltip" title="Back" > <i class="las la-chevron-left"></i>Back</a>
                </li>
            </ul>
        </div>

        <div class="page-content">
            <div class="">
                <div class="panel panel-info">
                    <form  method="post" action="{{ route('pms.designations.update', $designation->hr_designation_id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="panel-body">
                          <div class="form-group row">
                            <div class="col-md-4">
                              <label for="designation_short_name"><strong>Short Name <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="designation_short_name" value="{{ old('designation_short_name', $designation->designation_short_name) }}" id="designation_short_name" required>
                            </div>
                            <div class="col-md-8">
                              <label for="hr_designation_name"><strong>Designation Name <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="hr_designation_name" value="{{ old('hr_designation_name', $designation->hr_designation_name) }}" id="hr_designation_name" required>
                            </div>
                          </div>
                          <button type="submit" class="mt-2 btn btn-success rounded">
                              <i class="la la-check"></i>&nbsp;{{ __('Update Designation') }}
                          </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
