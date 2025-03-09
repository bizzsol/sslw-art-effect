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
                    <form  method="post" action="{{ route('pms.locations.update', $location->hr_location_id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="panel-body">
                          <div class="form-group row">
                            <div class="col-md-4">
                              <label for="hr_location_unit_id"><strong>SBU <span class="text-danger">&nbsp;*</span> </strong></label>
                              <select name="hr_location_unit_id" id="hr_location_unit_id" class="form-control">
                                @if(isset($units[0]))
                                @foreach($units as $key => $unit)
                                <option value="{{ $unit->hr_unit_id }}" {{ $unit->hr_unit_id == $location->hr_location_unit_id ? 'selected' : '' }}>{{ $unit->hr_unit_name }}</option>
                                @endforeach
                                @endif
                              </select>
                            </div>
                            <div class="col-md-2">
                              <label for="hr_location_code"><strong>Location  Code <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="hr_location_code" value="{{ old('hr_location_code', $location->hr_location_code) }}" id="hr_location_code">
                            </div>
                            <div class="col-md-3">
                              <label for="hr_location_short_name"><strong>Location Short  Name <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="hr_location_short_name" value="{{ old('hr_location_short_name', $location->hr_location_short_name) }}" id="hr_location_short_name">
                            </div>
                            <div class="col-md-3">
                              <label for="hr_location_name"><strong>Location  Name <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="hr_location_name" value="{{ old('hr_location_name', $location->hr_location_name) }}" id="hr_location_name">
                            </div>
                          </div>
                          <div class="form-group">
                              <label for="hr_location_address"><strong>Address <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="hr_location_address" value="{{ old('hr_location_address', $location->hr_location_address) }}" id="hr_location_address">
                          </div>
                          <button type="submit" class="mt-2 btn btn-success rounded">
                              <i class="la la-check"></i>&nbsp;{{ __('Update Location') }}
                          </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
