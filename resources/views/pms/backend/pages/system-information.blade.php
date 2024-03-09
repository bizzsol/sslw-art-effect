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
                    <form  method="post" action="{{ route('pms.update-system-information') }}" enctype="multipart/form-data">
                        @csrf
                        <div class="panel-body">
                            <div class="row">
                              <div class="col-md-12">
                                  <div class="form-group row">
                                    <div class="col-md-3">
                                        <label for="name"><strong>Name <span class="text-danger">*</span></strong></label>
                                      <input type="text" class="form-control" name="name" value="{{$systemInformation->name}}" id="name" required>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="organization"><strong>Organization Name <span class="text-danger">*</span></strong></label>
                                      <input type="text" class="form-control" name="organization" value="{{$systemInformation->organization}}" id="organization" required>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="email"><strong>Email <span class="text-danger">*</span></strong></label>
                                      <input type="text" class="form-control" name="email" value="{{$systemInformation->email}}" id="email" required>
                                    </div>
                                      <div class="col-md-3">
                                      <label for="resend_limit"><strong>Max Resend Limit <span class="text-danger">*</span></strong></label>
                                      <input type="number" class="form-control" name="resend_limit" value="{{$systemInformation->resend_limit}}" id="resend_limit" required>
                                    </div>
                                  </div>
                                  <div class="form-group row mb-1">
                                    <div class="col-md-6">
                                      <div class="form-group">
                                        <label for="description"><strong>Description :</strong></label>
                                        <textarea rows="5" class="form-control" name="description" id="description" style="resize: none">{{$systemInformation->description}}</textarea>
                                      </div>
                                    </div>
                                    <div class="col-md-6">
                                      <div class="form-group">
                                        <label for="address"><strong>Address :</strong></label>
                                        <textarea rows="5" class="form-control" name="address" id="address" style="resize: none">{{$systemInformation->address}}</textarea>
                                      </div>
                                    </div>
                                  </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group row">
                                  <div class="col-md-3 mb-3">
                                    <label for="twitter"><strong>Twitter :</strong></label>
                                    <input type="text" class="form-control" name="twitter" value="{{$systemInformation->twitter}}" id="twitter">
                                  </div>
                                  <div class="col-md-3 mb-3">
                                    <label for="facebook"><strong>Facebook :</strong></label>
                                    <input type="text" class="form-control" name="facebook" value="{{$systemInformation->facebook}}" id="facebook">
                                  </div>
                                  <div class="col-md-3 mb-3">
                                    <label for="instagram"><strong>Instagram :</strong></label>
                                    <input type="text" class="form-control" name="instagram" value="{{$systemInformation->instagram}}" id="instagram">
                                  </div>
                                  <div class="col-md-3 mb-3">
                                    <label for="skype"><strong>Skype :</strong></label>
                                    <input type="text" class="form-control" name="skype" value="{{$systemInformation->skype}}" id="skype">
                                  </div>
                                  <div class="col-md-3 mb-3">
                                    <label for="linked_in"><strong>Linked In :</strong></label>
                                    <input type="text" class="form-control" name="linked_in" value="{{$systemInformation->linked_in}}" id="linked_in">
                                  </div>
                                  <div class="col-md-3 mb-3">
                                    <label for="website"><strong>Website :</strong></label>
                                    <input type="text" class="form-control" name="website" value="{{$systemInformation->website}}" id="linked_in">
                                  </div>
                                  <div class="col-md-3 mb-3">
                                    <label for="phone"><strong>Phone :</strong></label>
                                    <input type="text" class="form-control" name="phone" value="{{$systemInformation->phone}}" id="phone">
                                  </div>
                                  <div class="col-md-3 mb-3">
                                    <label for="mobile"><strong>Mobile :</strong></label>
                                    <input type="text" class="form-control" name="mobile" value="{{$systemInformation->mobile}}" id="mobile">
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-12">
                                  <div class="form-group row">
                                    <div class="col-md-12">
                                      <div class="row">
                                        <div class="col-md-3">
                                          <label for="logo"><strong>Current Logo :</strong></label>
                                          <br>
                                          <img src="{{ asset($systemInformation->logo) }}" class="img img-fluid">
                                        </div>
                                        <div class="col-md-3">
                                          <label for="secondary_logo"><strong>Current Secondary Logo :</strong></label>
                                          <br>
                                          <img src="{{ asset($systemInformation->secondary_logo) }}" class="img img-fluid">
                                        </div>
                                        <div class="col-md-3">
                                          <label for="icon"><strong>Current Icon :</strong></label>
                                          <br>
                                          <img src="{{ asset($systemInformation->icon) }}" class="img img-fluid">
                                        </div>
                                        <div class="col-md-3">
                                          <label for="icon"><strong>Pad :</strong></label>
                                          <br>
                                          <img src="{{ asset($systemInformation->pad) }}" class="img img-fluid">
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="form-group row">
                                    <div class="col-md-12">
                                      <div class="row">
                                        <div class="col-md-3">
                                          <label for="logo_file"><strong>New Logo :</strong></label>
                                          <input type="file" class="form-control" name="logo_file" id="logo_file">
                                        </div>
                                        <div class="col-md-3">
                                          <label for="secondary_logo_file"><strong>New Secondary Logo :</strong></label>
                                          <input type="file" class="form-control" name="secondary_logo_file" id="secondary_logo_file">
                                        </div>
                                        <div class="col-md-3">
                                          <label for="icon_file"><strong>New Icon :</strong></label>
                                          <input type="file" class="form-control" name="icon_file" id="icon_file">
                                        </div>
                                        <div class="col-md-3">
                                          <label for="pad_file"><strong>New Pad :</strong></label>
                                          <input type="file" class="form-control" name="pad_file" id="pad_file">
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                              </div>
                            </div>
                            <button type="submit" class="mt-2 btn btn-success rounded">
                                <i class="la la-check"></i>&nbsp;{{ __('Update System Information') }}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
