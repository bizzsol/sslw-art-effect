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
                    <form  method="post" action="{{ route('pms.departments.store') }}" enctype="multipart/form-data">
                        @csrf
                        <div class="panel-body">
                          <div class="form-group row">
                            <div class="col-md-4">
                              <label for="hr_unit_id"><strong>SBU <span class="text-danger">&nbsp;*</span> </strong></label>
                              <select name="hr_unit_id" id="hr_unit_id" class="form-control">
                                <option value="{{ null }}">Choose SBU</option>
                                  @if(isset($units[0]))
                                  @foreach($units as $key => $unit)
                                  <option value="{{ $unit->hr_unit_id }}">[{{ $unit->hr_unit_code }}] {{ $unit->hr_unit_name }}</option>
                                  @endforeach
                                  @endif
                              </select>
                            </div>
                            <div class="col-md-3">
                              <label for="hr_department_code"><strong>Department Code <span class="text-danger">&nbsp;*</span></strong></label>
                              <input type="text" class="form-control" name="hr_department_code" value="{{ old('hr_department_code') }}" id="hr_department_code">
                            </div>
                            <div class="col-md-5">
                              <label for="hr_department_name"><strong>Department Name <span class="text-danger">&nbsp;*</span></strong></label>
                              <input type="text" class="form-control" name="hr_department_name" value="{{ old('hr_department_name') }}" id="hr_department_name">
                            </div>
                            <div class="col-md-6 mt-3">
                              <label for="hr_department_min_range"><strong>Minimum Range <span class="text-danger">&nbsp;*</span></strong></label>
                              <input type="number" class="form-control" name="hr_department_min_range" value="{{ old('hr_department_min_range', 0) }}" id="hr_department_min_range">
                            </div>
                            <div class="col-md-6 mt-3">
                              <label for="hr_department_max_range"><strong>Maximum Range <span class="text-danger">&nbsp;*</span></strong></label>
                              <input type="number" class="form-control" name="hr_department_max_range" value="{{ old('hr_department_max_range', 10000000) }}" id="hr_department_max_range">
                            </div>
                          </div>
                          <button type="submit" class="mt-2 btn btn-success rounded">
                              <i class="la la-check"></i>&nbsp;{{ __('Create Department') }}
                          </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
