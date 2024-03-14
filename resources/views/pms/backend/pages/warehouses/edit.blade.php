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
                        <a href="javascript:history.back()" class="btn btn-sm btn-warning text-white"
                           data-toggle="tooltip" title="Back"> <i class="las la-chevron-left"></i>Back</a>
                    </li>
                </ul>
            </div>

            <div class="page-content">
                <div class="">
                    <div class="panel panel-info">
                        <form method="post" action="{{ route('pms.warehouses.update', $warehouse->id) }}" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="panel-body">
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label for="code"><strong>Warehouse Code <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <input type="text" class="form-control" name="code" value="{{ old('code', $warehouse->code) }}" id="code" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="name"><strong>Warehouse Name <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <input type="text" class="form-control" name="name" value="{{ old('name', $warehouse->name) }}" id="name" required>
                                    </div>

                                    <div class="col-md-2">
                                        <label for="phone"><strong>Warehouse Phone <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <input type="text" class="form-control" name="phone" value="{{ old('phone', $warehouse->phone) }}" id="phone" required>
                                    </div>

                                    <div class="col-md-2">
                                        <label for="email"><strong>Warehouse Email <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <input type="email" class="form-control" name="email" value="{{ old('email', $warehouse->email) }}" id="email" required>
                                    </div>

                                    <div class="col-md-2">
                                        <label for="location"><strong>Warehouse Location <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <input type="text" class="form-control" name="location" value="{{ old('location', $warehouse->location) }}" id="location" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="address"><strong>Address</strong></label>
                                    <input type="text" class="form-control" name="address" value="{{ old('address', $warehouse->address) }}" id="address">
                                </div>
                                <button type="submit" class="mt-2 btn btn-success rounded">
                                    <i class="la la-check"></i>&nbsp;{{ __('Update Warehouse') }}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
