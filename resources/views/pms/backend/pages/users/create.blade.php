@extends('pms.backend.layouts.master-layout')

@section('title', session()->get('system-information')['name']. ' | '.$title)

@section('page-css')
<style type="text/css" media="screen">
    .select2-container{
        width:  100% !important;
    }
</style>
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
                <li class="active">{{__($title)}}</li>
                <li class="top-nav-btn">
                    <a href="javascript:history.back()" class="btn btn-sm btn-warning text-white" data-toggle="tooltip" title="Back" > <i class="las la-chevron-left"></i>Back</a>
                </li>
            </ul>
        </div>

        <div class="page-content">
            <div class="">
                <div class="panel panel-info">
                    <div class="panel-body">
                        {!! Form::open(array('route' => 'pms.admin.users.store','method'=>'POST','class'=>'user-form','files'=>true)) !!}

                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <td style="width: 25%" class="pt-2 pb-2"><strong>UID</strong></td>
                                            <td style="width: 15%" class="pt-2 pb-2"><strong>Designation</strong></td>
                                            <td style="width: 15%" class="pt-2 pb-2"><strong>SBU</strong></td>
                                            <td style="width: 15%" class="pt-2 pb-2"><strong>Department</strong></td>
                                            <td style="width: 15%" class="pt-2 pb-2"><strong>Section</strong></td>
                                            <td style="width: 15% " class="pt-2 pb-2"><strong>Location</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="row mb-0">
                                                    <div class="col-md-8">
                                                        <div class="form-group mb-0">
                                                            {!! Form::text('associate_id', $value=old('associate_id'), array('placeholder' => 'UID','class' => 'form-control','id' => 'associate_id','required'=>false)) !!}
                                                            @if ($errors->has('associate_id'))
                                                            <span class="help-block">
                                                                <strong class="text-danger">{{ $errors->first('associate_id') }}</strong>
                                                            </span>
                                                            @endif
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 pl-0">
                                                        <a  class="btn btn-sm btn-success checkUsers btn-block" onclick="checkUsers()"><i class="las la-search" type="button"></i></a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td id="designation_id"></td>
                                            <td id="as_unit_id"></td>
                                            <td id="department_id"></td>
                                            <td id="section_id"></td>
                                            <td id="location_id"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                               <div class="form-group">
                                    <label><strong>Name <span class="text-danger">*</span></strong></label>
                                    {!! Form::text('name', $value=old('name'), array('placeholder' => 'Name','class' => 'form-control','required'=>true,'id'=>'name')) !!}

                                    @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong class="text-danger">{{ $errors->first('name') }}</strong>
                                    </span>
                                    @endif
                                </div> 
                            </div>
                            <div class="col-md-2">
                               <div class="form-group">
                                    <label><strong>Phone <sup class="text-danger">*</sup></strong></label>
                                    {!! Form::text('phone', $value=old('phone'), array('placeholder' => 'Phone','class' => 'form-control','required'=>true,'id'=>'phone')) !!}

                                    @if ($errors->has('phone'))
                                    <span class="help-block">
                                        <strong class="text-danger">{{ $errors->first('phone') }}</strong>
                                    </span>
                                    @endif
                                </div> 
                            </div>
                            <div class="col-md-2">
                               <div class="form-group">
                                    <label><strong>Email</strong></label>
                                    {!! Form::email('email', $value=old('email'), array('placeholder' => 'Email address','class' => 'form-control','required'=>false,'id'=>'email')) !!}

                                    @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong class="text-danger">{{ $errors->first('email') }}</strong>
                                    </span>
                                    @endif
                                </div> 
                            </div>
                            <div class="col-md-5">
                                <div class="row">
                                    <div class="col-md-6">
                                       <div class="form-group">
                                            <label><strong>Password  <sup class="text-danger">*</sup></strong></label>
                                            {!! Form::password('password', array('placeholder' => 'Password','class' => 'form-control','required'=>true)) !!}

                                            @if ($errors->has('password'))
                                            <span class="help-block">
                                                <strong class="text-danger">{{ $errors->first('password') }}</strong>
                                            </span>
                                            @endif
                                        </div> 
                                    </div>
                                    <div class="col-md-6">
                                       <div class="form-group">
                                            <label><strong>Confirm Password <sup class="text-danger">*</sup></strong></label>
                                            {!! Form::password('confirm_password', array('placeholder' => 'Confirm Password','class' => 'form-control','required'=>true)) !!}

                                            @if ($errors->has('confirm_password'))
                                            <span class="help-block">
                                                <strong class="text-danger">{{ $errors->first('confirm_password') }}</strong>
                                            </span>
                                            @endif
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><strong>Assign Role(s)</strong></label>
                                    <br>
                                    <div class="form-group">
                                      @if(isset($roles[0]))
                                      @foreach($roles as $role)
                                      <div class="icheck-primary d-inline">
                                        <input type="checkbox" id="role_{{ $role->id }}" name="roles[]" value="{{ $role->id }}">
                                        <label for="role_{{ $role->id }}" class="text-primary">
                                          {{ $role->name }}&nbsp;&nbsp;&nbsp;
                                        </label>
                                      </div>
                                      @endforeach
                                      @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><strong>Approvals</strong></label>
                                    <br>
                                    <div class="form-group">
                                      @if(isset($approvalLevels[0]))
                                      @foreach($approvalLevels as $level)
                                      <div class="icheck-primary d-inline">
                                        <input type="checkbox" id="level_{{ $level->id }}" name="approval_levels[]" value="{{ $level->id }}">
                                        <label for="level_{{ $level->id }}" class="text-primary">
                                          {{ $level->name }}&nbsp;&nbsp;&nbsp;
                                        </label>
                                      </div>
                                      @endforeach
                                      @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><strong>Assign Warehouse(s)</strong></label>
                                    <br>
                                    <div class="form-group">
                                      @if(isset($warehouses[0]))
                                      @foreach($warehouses as $warehouse)
                                      <div class="icheck-primary d-inline">
                                        <input type="checkbox" id="warehouse_{{ $warehouse->id }}" name="warehouse_id[]" value="{{ $warehouse->id }}">
                                        <label for="warehouse_{{ $warehouse->id }}" class="text-primary">
                                          {{ $warehouse->name }}&nbsp;&nbsp;&nbsp;
                                        </label>
                                      </div>
                                      @endforeach
                                      @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                  <label><strong>Companies</strong></label>
                                  <br>
                                  @if(isset($companies[0]))
                                  @foreach($companies as $company)
                                  <div class="icheck-primary d-inline">
                                    <input type="checkbox" id="company_{{ $company->id }}" name="companies[]" value="{{ $company->id }}" onchange="getCompanyInformation()" class="companies">
                                    <label for="company_{{ $company->id }}" class="text-primary">
                                      {{ $company->code }}&nbsp;&nbsp;&nbsp;
                                    </label>
                                  </div>
                                  @endforeach
                                  @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><strong>Assign Department(s)</strong></label>
                                    <br>
                                    <div id="departments-view">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="display: none">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><strong>Assign Section(s)</strong></label>
                                    <br>
                                    <div id="sections-view">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><strong>Assign Cost Centre(s)</strong></label>
                                    <select name="cost_centres[]" id="cost_centres" class="form-control rounded" multiple data-placeholder="Choose Cost Centres">
                                        
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label><strong>User Cost Centre</strong></label>
                                    <select name="cost_centre_id" id="cost_centre_id" class="form-control rounded">
                                        
                                    </select>

                                    @if ($errors->has('cost_centre_id'))
                                    <span class="help-block">
                                        <strong class="text-danger">{{ $errors->first('cost_centre_id') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="row">
                                    <div class="col-md-6 pt-4">
                                        <p class="mt-3"><strong>Upload Profile Photo:</strong></p>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="slide_upload" for="file"><img id="image_load" src="{{asset('assets/images/user/09.jpg')}}" style="width: 75px; height: 75px;cursor:pointer;">
                                        </label>
                                        <input id="file" style="display:none" name="profile_photo_path" type="file" onchange="photoLoad(this,this.id)" accept="image/*">

                                        @if ($errors->has('profile_photo_path'))
                                        <span class="help-block">
                                            <strong class="text-danger">{{ $errors->first('profile_photo_path') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            @if ($errors->has('permission'))
                                <span class="help-block"><strong class="text-danger">{{ $errors->first('permission') }}</strong></span>
                                <br>
                            @endif

                            <div class="col-md-12">
                                <h4 class="text-center">Allow Permissions (&nbsp;<label for="check_all" style="cursor: pointer">
                                    <input type="checkbox" name="check_all" id="check_all">&nbsp;Check all Permissions
                                </label>)</h4>
                                <hr>
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    @php
                                        $chunk_counter = 0;
                                    @endphp
                                    @if(isset($modules[0]))
                                    @foreach($modules as $key => $module)
                                        @php
                                            $modulePermissions = collect(Spatie\Permission\Models\Permission::where('module', $module)->get())->chunk(12)
                                        @endphp
                                        @foreach($modulePermissions as $chunk)
                                        @php
                                            $chunk_counter++;
                                        @endphp
                                        <div class="col-3">
                                            <h5 class="">
                                                <label for="check_all_module-{{ $chunk_counter  }}" style="cursor: pointer">
                                                    <input type="checkbox" class="check-all-module" data-counter="{{ $chunk_counter  }}" id="check_all_module-{{ $chunk_counter  }}" style="transform: scale(1.25, 1.25)">&nbsp;&nbsp;&nbsp;<strong>{{ $module }}</strong>
                                                </label>
                                            </h5>
                                            @foreach($chunk as $permission)
                                            <label>
                                                <input name="permission[]" type="checkbox" value="{{ $permission->id }}" class="name module-permissions-{{ $chunk_counter }} permissions">&nbsp;
                                                {{ $permission->name }}
                                            </label>
                                            <br/>
                                            @endforeach
                                        </div>
                                        @endforeach
                                    @endforeach
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    @php
                                        $chunk_counter = 0;
                                    @endphp
                                    @if(isset($permissions[0]))
                                    @foreach($permissions as $key => $chunk)
                                    @php
                                        $chunk_counter++;
                                    @endphp
                                        <div class="col-3">
                                            <h5 class="">
                                                <label for="check_all_permission-{{ $chunk_counter  }}" style="cursor: pointer">
                                                    <input type="checkbox" class="check-all-permission" data-counter="{{ $chunk_counter }}" id="check_all_permission-{{ $chunk_counter  }}" style="transform: scale(1.25, 1.25)">&nbsp;&nbsp;&nbsp;<strong>Allow Permissions</strong>
                                                </label>
                                            </h5>
                                            @foreach($chunk as $permission)
                                            <label>
                                                <input name="permission[]" type="checkbox" value="{{ $permission->id }}" class="name permission-permmissions-{{ $chunk_counter }} permissions">&nbsp;
                                                {{ $permission->name }}
                                            </label>
                                            <br/>
                                            @endforeach
                                        </div>
                                    @endforeach
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="row pt-3">
                            <div class="col-md-6 offset-md-3">
                                <button type="submit" class="btn btn-primary user-from-button"><i class="la la-check"></i>&nbsp;Save User</button>
                                @can('user-list')
                                <a href="{{route('pms.admin.users.index')}}" class="btn btn-secondary"><i class="la la-times"></i>&nbsp;Cancel </a>
                                @endcan
                            </div>
                        </div>

                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('page-script')
<script>
    $(document).ready(function() {
        $('#check_all').change(function () {
            if($('#check_all').is(':checked')){
                $('.permissions').prop('checked', true);
                $('.check-all-module').prop('checked', true);
            }else{
                $('.permissions').prop('checked', false);
                $('.check-all-module').prop('checked', false);
            }
        });

        $('.check-all-module').change(function(event) {
            if($(this).is(':checked')){
                $('.module-permissions-'+$(this).attr('data-counter')).prop('checked', true);
            }else{
                $('.module-permissions-'+$(this).attr('data-counter')).prop('checked', false);
            }
        });

        $('.check-all-permission').change(function(event) {
            if($(this).is(':checked')){
                $('.permission-permissions-'+$(this).attr('data-counter')).prop('checked', true);
            }else{
                $('.permission-permissions-'+$(this).attr('data-counter')).prop('checked', false);
            }
        });
    });

    function photoLoad(input,image_load) {
        var target_image='#'+$('#'+image_load).prev().children().attr('id');

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $(target_image).attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    function checkUsers() {
        var associateId = $('#associate_id').val();
        if (associateId !='') {
            $.ajax({
                url: '{{url('pms/admin/check-user')}}/'+associateId,
                type: 'get',
                success: (data) => {

                    if (data.status === 200) {
                        $('#name').val(data.employee.as_name);
                        $('#as_unit_id').html(data.employee.unit.hr_unit_name);
                        $('#location_id').html(data.employee.location.hr_location_name);
                        $('#department_id').html(data.employee.department.hr_department_name);
                        $('#section_id').html(data.employee.section.hr_section_name);
                        $('#designation_id').html(data.employee.designation.hr_designation_name);
                    }

                    if (data.status === 400) {
                        $('#name').val();
                        $('#as_unit_id').html('');
                        $('#location_id').html('');
                        $('#department_id').html('');
                        $('#designation_id').html('');
                        $('#phone').val();
                        $('#email').val();
                        $('#roles').select2().val().trigger('change');
                        $('#warehouse_id').select2().val().trigger('change');
                        notify('No user information found with this UID.','error');
                    }
                    if (data.exists_user !=null) {
                        $('#phone').val(data.exists_user.phone);
                        $('#email').val(data.exists_user.email);
                        $('#roles').select2().val(data.userRole).trigger('change');
                        $('#warehouse_id').select2().val(data.userWarehouse).trigger('change');
                        notify('An user already exists with this UID.','success');
                    }
                }
            });
        }else{
            notify('Please enter UID','error');
        }   
    }

    function getCompanyInformation() {
        var companies = $('input:checkbox.companies:checked').map(function () {
            return this.value;
        }).get();

        $.ajax({
            url: "{{ url('pms/admin/users/create') }}?get-company-information",
            type: 'GET',
            dataType: 'json',
            data: {
                companies: companies
            },
        })
        .done(function(response) {
            var departments = '';
            $.each(response.units, function(index, unit) {
                departments += '<div class="row mb-2"><div class="col-md-12 mb-2"><h6>['+unit.hr_unit_code+'] '+unit.hr_unit_name+'</h6></div><div class="col-md-12">';
                $.each(unit.departments, function(index, department) {
                    departments += '<div class="icheck-primary d-inline">'+
                                        '<input type="checkbox" id="user_department_id_'+department.hr_department_id+'" name="user_department_id[]" value="'+department.hr_department_id+'" onchange="getSections()" class="user_department_id">'+
                                        '<label for="user_department_id_'+department.hr_department_id+'" class="text-primary">['+department.hr_department_code+'] '+department.hr_department_name+'&nbsp;&nbsp;&nbsp;</label>'+
                                    '</div>';
                });
                departments += '</div></div>';
            });
            $('#departments-view').html(departments);

            var cost_centres = '';
            $.each(response.companies, function(index, company) {
                cost_centres += '<optgroup label="['+company.code+'] '+company.name+'">';
                $.each(company.profit_centres, function(index, profit_centre) {
                    cost_centres += '<optgroup label="&nbsp;&nbsp;['+profit_centre.code+'] '+profit_centre.name+'">';
                    $.each(profit_centre.cost_centres, function(index, cost_centre) {
                        cost_centres += '<option value="'+cost_centre.id+'">&nbsp;&nbsp;&nbsp;&nbsp;['+cost_centre.code+'] '+cost_centre.name+'</option>'
                    });
                    cost_centres += '</optgroup>';
                });
                cost_centres += '</optgroup>';
            });
            
            $('#cost_centres').html(cost_centres).select2();
            $('#cost_centre_id').html(cost_centres).select2();
        });
    }

    function getSections() {
        var departments = $('input:checkbox.user_department_id:checked').map(function () {
            return this.value;
        }).get();

        $.ajax({
            url: "{{ url('pms/admin/users/create') }}?get-department-information",
            type: 'GET',
            dataType: 'json',
            data: {
                departments: departments
            },
        })
        .done(function(response) {
            var sections = '<div class="row">';
            $.each(response.departments, function(index, department) {
                sections += '<div class="col-md-3 mb-2"><div class="col-md-12 mb-2"><h6>['+department.hr_department_code+'] '+department.hr_department_name+'</h6></div><div class="col-md-12">';
                $.each(department.sections, function(index, section) {
                    sections += '<div class="icheck-primary d-inline">'+
                                        '<input type="checkbox" id="user_section_id_'+section.hr_section_id+'" name="user_section_id[]" value="'+section.hr_section_id+'" class="user_section_id" checked>'+
                                        '<label for="user_section_id_'+section.hr_section_id+'" class="text-primary">['+section.hr_section_code+'] '+section.hr_section_name+'&nbsp;&nbsp;&nbsp;</label>'+
                                    '</div>';
                });
                sections += '</div></div>';
            });
            sections += '</div>';
            $('#sections-view').html(sections);
        });
    }

    $(document).ready(function() {
        var form = $('.user-form');
        var button = form.find('.user-form-button');
        var buttonContent = button.html();

        form.submit(function(event) {
            event.preventDefault();
            button.prop('disabled', true).html('<i class="las la-spinner la-spin"></i>&nbsp;Please wait...');

            $.ajax({
                url: form.attr('action'),
                type: form.attr('method'),
                dataType: 'json',
                processData: false,
                contentType: false,
                data: new FormData(form[0]),
            })
            .done(function(response) {
                if(response.success){
                    window.open("{{ route('pms.admin.users.index') }}", "_parent");
                }else{
                    notify(response.message, 'error');
                }
                button.prop('disabled', false).html(buttonContent);
            })
            .fail(function(response) {
                var errors = '<ul class="pl-3">';
                $.each(response.responseJSON.errors, function(index, val) {
                    errors += '<li>'+val[0]+'</li>';
                });
                errors += '</ul>';
                notify(response.message, 'errors');

                button.prop('disabled', false).html(buttonContent);
            });
        });
    });
</script>
@endsection