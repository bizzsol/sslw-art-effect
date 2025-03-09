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
                        <form method="post" action="{{ route('pms.sections.update', $section->hr_section_id) }}"
                              enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="panel-body">
                                <div class="form-group row">
                                    <div class="col-md-3">
                                        <label for="hr_unit_id"><strong>SBU <span class="text-danger">&nbsp;*</span></strong></label>
                                        <select name="hr_unit_id" id="hr_unit_id" class="form-control" required onchange="getDepartments()">
                                            @if(isset($units[0]))
                                            @foreach($units as $key => $unit)
                                                <option value="{{ $unit->hr_unit_id }}" {{ $section->department->hr_unit_id == $unit->hr_unit_id ? 'selected' : '' }}>[{{ $unit->hr_unit_code }}] {{ $unit->hr_unit_name }}</option>
                                            @endforeach
                                            @endif
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="hr_section_department_id"><strong>Department <span class="text-danger">&nbsp;*</span></strong></label>
                                        <select name="hr_section_department_id" id="hr_section_department_id"
                                                class="form-control" required>
                                            
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="hr_section_code"><strong>Section Code <span class="text-danger">&nbsp;*</span></strong></label>
                                        <input type="text" class="form-control" name="hr_section_code"
                                               value="{{ old('hr_section_code', $section->hr_section_code) }}"
                                               id="hr_section_code" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="hr_section_name"><strong>Section Name <span class="text-danger">&nbsp;*</span></strong></label>
                                        <input type="text" class="form-control" name="hr_section_name"
                                               value="{{ old('hr_section_name', $section->hr_section_name) }}"
                                               id="hr_section_name" required>
                                    </div>
                                </div>
                                <button type="submit" class="mt-2 btn btn-success rounded">
                                    <i class="la la-check"></i>&nbsp;{{ __('Update Department') }}
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
    getDepartments();
    function getDepartments() {
        $('#hr_section_department_id').html('<option value="{{ null }}">Please wait...</option>');
        $.ajax({
            url: "{{ url('pms/sections/create') }}?get-departments&hr_unit_id="+$('#hr_unit_id').val(),
            type: 'GET',
            data: {},
        })
        .done(function(response) {
            var departments = '';
            var hr_department_id = "{{ $section->hr_section_department_id }}";
            $.each(response, function(index, val) {
                departments += '<option value="'+val.hr_department_id+'" '+(hr_department_id == val.hr_department_id ? 'selected' : '')+'>['+val.hr_department_code+'] '+val.hr_department_name+'</option>';
            });

            $('#hr_section_department_id').html(departments);
        });
    }
</script>
@endsection

