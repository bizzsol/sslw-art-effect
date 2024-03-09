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
                    <form  method="post" action="{{ route('pms.modules.update', $module->id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="panel-body">
                          <div class="form-group row">
                            <div class="col-md-3">
                              <label for="slug"><strong>Slug <span class="text-danger">&nbsp;*</span></strong></label>
                              <input type="text" class="form-control" name="slug" value="{{ old('slug', $module->slug) }}" id="slug">
                            </div>
                            <div class="col-md-3">
                              <label for="name"><strong>Name <span class="text-danger">&nbsp;*</span></strong></label>
                              <input type="text" class="form-control" name="name" value="{{ old('name', $module->name) }}" id="name">
                            </div>
                            <div class="col-md-3">
                              <label for="url"><strong>URL <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="url" value="{{ old('url', $module->url) }}" id="url">
                            </div>
                            <div class="col-md-3">
                              <label for="icon"><strong>Icon <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="icon" value="{{ old('icon', $module->icon) }}" id="icon">
                            </div>
                          </div>
                          <div class="form-group row">
                            <div class="col-md-4">
                              <label for="dashboard"><strong>Dashboard <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="dashboard" value="{{ old('dashboard', $module->dashboard) }}" id="dashboard">
                            </div>
                            <div class="col-md-8">
                              <label for="description"><strong>Description <span class="text-danger">&nbsp;*</span> </strong></label>
                              <input type="text" class="form-control" name="description" value="{{ old('description', $module->description) }}" id="description">
                            </div>
                          </div>
                          <button type="submit" class="mt-2 btn btn-success rounded">
                              <i class="la la-check"></i>&nbsp;{{ __('Update Module') }}
                          </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
