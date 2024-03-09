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
                        <form method="post" action="{{ route('pms.employees.store') }}" enctype="multipart/form-data">
                            @csrf
                            <div class="panel-body">
                                <div class="form-group row">
                                    <div class="col-md-3">
                                        <label for="as_unit_id"><strong>SBU <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <select name="as_unit_id" id="as_unit_id" class="form-control"
                                                onchange="getLocations()" required>
                                            @if(isset($units[0]))
                                                @foreach($units as $key => $unit)
                                                    <option value="{{ $unit->hr_unit_id }}">{{ $unit->hr_unit_name }}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <label for="as_location"><strong>Location <span
                                                        class="text-danger">&nbsp;*</span> </strong></label>
                                        <select name="as_location" id="as_location" class="form-control" required>

                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <label for="as_department_id"><strong>Department <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <select name="as_department_id" id="as_department_id" class="form-control"
                                                onchange="getSections()" required>
                                            @if(isset($departments[0]))
                                                @foreach($departments as $key => $department)
                                                    <option value="{{ $department->hr_department_id }}">{{ $department->hr_department_name }}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <label for="as_section_id"><strong>Section <span
                                                        class="text-danger">&nbsp;*</span> </strong></label>
                                        <select name="as_section_id" id="as_section_id" class="form-control" required>

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label for="associate_id"><strong>Employee UID <span
                                                        class="text-danger">&nbsp;*</span> </strong></label>
                                        <input type="text" class="form-control" name="associate_id"
                                               value="{{ old('associate_id') }}" id="associate_id" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="as_name"><strong>Employee Name <span
                                                        class="text-danger">&nbsp;*</span> </strong></label>
                                        <input type="text" class="form-control" name="as_name"
                                               value="{{ old('as_name') }}" id="as_name" required>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="as_designation_id"><strong>Designation <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <select name="as_designation_id" id="as_designation_id" class="form-control">
                                            @if(isset($designations[0]))
                                                @foreach($designations as $key => $designation)
                                                    <option value="{{ $designation->hr_designation_id }}">{{ $designation->hr_designation_name }}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="as_doj"><strong>Joining Date <span
                                                        class="text-danger">&nbsp;*</span> </strong></label>
                                        <input type="date" class="form-control" name="as_doj"
                                               value="{{ old('as_doj') }}" id="as_doj" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-3">
                                        <label for="as_dob"><strong>Date of Birth <span
                                                        class="text-danger">&nbsp;*</span> </strong></label>
                                        <input type="date" class="form-control" name="as_dob"
                                               value="{{ old('as_dob') }}" id="as_dob" required>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="as_gender"><strong>Gender <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <select name="as_gender" id="as_gender" class="form-control" required>
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="as_contact"><strong>Contact <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <input type="text" class="form-control" name="as_contact"
                                               value="{{ old('as_contact') }}" id="as_contact" >
                                    </div>
                                    <div class="col-md-4">
                                        <label for="as_remarks"><strong>Remarks <span class="text-danger">&nbsp;*</span>
                                            </strong></label>
                                        <input type="text" class="form-control" name="as_remarks"
                                               value="{{ old('as_remarks') }}" id="as_remarks" >
                                    </div>
                                </div>
                                <button type="submit" class="mt-2 btn btn-success rounded">
                                    <i class="la la-check"></i>&nbsp;{{ __('Save Employee') }}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('page-script')
    <script type="text/javascript">
        getLocations();

        function getLocations() {
            var location = $('#as_location');
            location.html('<option>Please wait...</option>');

            $.ajax({
                url: "{{ url('pms/employees/create') }}?get-locations&unit=" + $('#as_unit_id').val(),
                type: 'GET',
                dataType: 'json',
                data: {},
            })
                .done(function (response) {
                    var locations = '';
                    $.each(response, function (index, val) {
                        locations += '<option value="' + (val.hr_location_id) + '">' + (val.hr_location_name) + '</option>';
                    });

                    location.html(locations);
                });
        }

        getSections();

        function getSections() {
            var section = $('#as_section_id');
            section.html('<option>Please wait...</option>');

            $.ajax({
                url: "{{ url('pms/employees/create') }}?get-sections&department=" + $('#as_department_id').val(),
                type: 'GET',
                dataType: 'json',
                data: {},
            })
                .done(function (response) {
                    var sections = '';
                    $.each(response, function (index, val) {
                        sections += '<option value="' + (val.hr_section_id) + '">' + (val.hr_section_name) + '</option>';
                    });

                    section.html(sections);
                });
        }
    </script>
@endsection
