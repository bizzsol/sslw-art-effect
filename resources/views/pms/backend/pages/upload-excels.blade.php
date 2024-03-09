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
                    <form  method="post" action="{{ route('pms.upload-excels.store') }}" enctype="multipart/form-data">
                    @csrf
                      <div class="panel-body">
                        <div class="form-group row">
                          <div class="col-md-3">
                            <label for="module"><strong>Module :</strong></label>
                            <select class="form-control" name="module" id="module">
                              <option value="employees">Employees</option>
                            </select>
                          </div>
                          <div class="col-md-6">
                            <label for="excel_file"><strong>Excel File :</strong></label>
                            <input type="file" name="excel_file" id="excel_file" class="form-control">
                          </div>
                          <div class="col-md-3 pt-4">
                            <button type="submit" class="mt-2 btn btn-success rounded btn-block"><i class="la la-check"></i>&nbsp;Upload Excel</button>
                          </div>
                        </div>
                      </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
