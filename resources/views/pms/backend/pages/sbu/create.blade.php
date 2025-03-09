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
                    <form  method="post" action="{{ route('pms.sbu.store') }}" enctype="multipart/form-data">
                        @csrf
                        <div class="panel-body">
                          <div class="form-group row">
                            <div class="col-md-3">
                              <label for="company_id"><strong>Company <span class="text-danger">&nbsp;*</span> </strong></label>
                              <select name="company_id" id="company_id" class="form-control">
                                <option value="{{ null }}">Choose Company</option>
                                  @if(isset($companies[0]))
                                  @foreach($companies as $key => $company)
                                  <option value="{{ $company->id }}">[{{ $company->code }}] {{ $company->name }}</option>
                                  @endforeach
                                  @endif
                              </select>
                            </div>
                            <div class="col-md-2">
                              <label for="hr_unit_code"><strong>SBU Code <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="hr_unit_code" value="{{ old('hr_unit_code') }}" id="hr_unit_code">
                            </div>
                            <div class="col-md-2">
                              <label for="hr_unit_short_name"><strong>SBU Short Name <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="hr_unit_short_name" value="{{ old('hr_unit_short_name') }}" id="hr_unit_short_name">
                            </div>
                            <div class="col-md-5">
                              <label for="hr_unit_name"><strong>SBU Name <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="hr_unit_name" value="{{ old('hr_unit_name') }}" id="hr_unit_name">
                            </div>
                            <div class="col-md-3 mt-3">
                              <label for="hr_unit_telephone"><strong>SBU Telephone <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="hr_unit_telephone" value="{{ old('hr_unit_telephone') }}" id="hr_unit_telephone">
                            </div>
                            <div class="col-md-9 mt-3">
                                  <label for="hr_unit_address"><strong>SBU Address <span class="text-danger">&nbsp;*</span> </strong></label>
                                  <input type="text" class="form-control" name="hr_unit_address" value="{{ old('hr_unit_address') }}" id="hr_unit_address">
                            </div>
                            <div class="col-md-12 mt-3">
                                <label for="delivery_address"><strong>Delivery Address <span class="text-danger">&nbsp;*</span> </strong></label>
                                <textarea class="form-control summernote" name="delivery_address" id="delivery_address">{{ old('delivery_address') }}</textarea>
                            </div>
                          </div>
                          <button type="submit" class="mt-2 btn btn-success rounded">
                              <i class="la la-check"></i>&nbsp;{{ __('Create SBU') }}
                          </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
