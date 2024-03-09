@extends('pms.backend.layouts.master-layout')
@section('title', session()->get('system-information')['name']. ' | '.$title)
@section('page-css')
    @include('yajra.css')
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
                    <a href="{{route('pms.departments.create')}}" class="btn btn-sm btn-primary text-white" data-toggle="tooltip" title="Add New Department"> <i class="las la-plus"></i>Add New Department</a>
                </li>
            </ul>
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
@endsection

@section('page-script')
    @include('yajra.js')
@endsection