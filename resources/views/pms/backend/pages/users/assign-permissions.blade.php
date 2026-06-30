@extends('pms.backend.layouts.master-layout')

@section('title', session()->get('system-information')['name']. ' | '.$title)

@section('page-css')
<style>
    .list-group-item {
        border-left: 4px solid transparent;
        transition: all 0.3s ease;
    }

    .list-group-item:hover {
        background-color: #f5f5f5;
        border-left-color: #007bff;
    }

    .list-group-item.active {
        background-color: #007bff;
        color: white;
        font-weight: bold;
        border-left-color: #0056b3;
    }

    .module-panel {
        display: block;
    }

    .module-panel.hide {
        display: none !important;
    }

    .panel-heading {
        padding: 12px 15px;
        border-bottom: 1px solid #ddd;
    }

    .table-sm th, .table-sm td {
        padding: 8px;
    }

    .module-select-all,
    .row-select-all,
    .action-checkbox {
        width: 18px;
        height: 18px;
        cursor: pointer;
    }

    .badge-light {
        background-color: #e9ecef;
        color: #333;
    }

    tbody tr:hover {
        background-color: #f9f9f9;
    }

    .perm-name-cell {
        font-weight: 500;
        vertical-align: middle;
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
                <li class="active">{{ $title }}</li>
                <li class="top-nav-btn">
                    <a href="javascript:history.back()" class="btn btn-sm btn-warning text-white" data-toggle="tooltip" title="Back"> <i class="las la-chevron-left"></i>Back</a>
                </li>
            </ul>
        </div>

        <div class="page-content">
            <div class="">
                <div class="panel panel-info">
                    <div class="panel-body">
                        @if(isset($user->employee))
                        <div class="alert alert-info">
                            <strong>{{ $user->name }}</strong>
                            @if($user->employee->associate_id) &mdash; UID: {{ $user->employee->associate_id }} @endif
                            @if(count($user->getRoleNames())) &mdash; Role(s): {{ implode(', ', $user->getRoleNames()->toArray()) }} @endif
                        </div>
                        @endif

                        {!! Form::open(array('route' => ['pms.admin.users.update.permissions', $user->id], 'method'=>'PUT', 'class'=>'user-form')) !!}

                        <div class="form-group row">
                            <div class="col-md-12">
                                <button type="submit" class="btn-sm btn btn-success user-from-button float-right"><i class="la la-save"></i>&nbsp;Assign Permissions</button>
                                <h4 class="text-center">Allow Permissions (&nbsp;<label for="check_all" style="cursor: pointer">
                                    <input type="checkbox" name="check_all" id="check_all">&nbsp;Check all Permissions
                                </label>)</h4>
                                <hr>
                            </div>

                            <div class="col-md-12 mt-4">
                                <div class="row">
                                    @php
                                        $allModules = \Spatie\Permission\Models\Permission::select('module')
                                            ->distinct()
                                            ->whereNotNull('module')
                                            ->orderBy('module')
                                            ->pluck('module');
                                    @endphp

                                    <!-- Module List Sidebar -->
                                    <div class="col-md-3">
                                        <div class="list-group" id="module-list" role="tablist" style="max-height: 600px; overflow-y: auto;">
                                            @foreach($allModules as $index => $module)
                                                <a class="list-group-item list-group-item-action {{ $index == 0 ? 'active' : '' }}"
                                                   id="module-{{ \Str::slug($module) }}-list"
                                                   data-toggle="list"
                                                   href="#module-{{ \Str::slug($module) }}"
                                                   role="tab">
                                                    <input type="checkbox" class="module-select-all"
                                                           data-module="{{ $module }}"
                                                           style="margin-right: 8px;">
                                                    <strong>{{ $module }}</strong>
                                                </a>
                                            @endforeach
                                        </div>
                                    </div>

                                    <!-- Permissions Panel -->
                                    <div class="col-md-9">
                                        <div class="list-group-content" id="module-content">
                                            @foreach($allModules as $index => $module)
                                                @php
                                                    $modulePerms = \Spatie\Permission\Models\Permission::where('module', $module)->get();
                                                @endphp
                                                <div class="module-panel {{ $index == 0 ? '' : 'hide' }}"
                                                     id="module-{{ \Str::slug($module) }}"
                                                     data-module="{{ $module }}">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading bg-info text-white">
                                                            <h4 class="panel-title">
                                                                <strong>{{ $module }}</strong>
                                                                <span class="badge badge-light" style="float: right;">{{ $modulePerms->count() }} permissions</span>
                                                            </h4>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="table-responsive">
                                                                <table class="table table-sm table-bordered">
                                                                    <thead class="bg-light">
                                                                        <tr>
                                                                            <th style="width: 5%; text-align: center;"><small><strong>Select</strong></small></th>
                                                                            <th style="width: 30%;">Permission Name</th>
                                                                            <th style="width: 13%; text-align: center;"><small>View</small></th>
                                                                            <th style="width: 13%; text-align: center;"><small>Create</small></th>
                                                                            <th style="width: 13%; text-align: center;"><small>Edit</small></th>
                                                                            <th style="width: 13%; text-align: center;"><small>Delete</small></th>
                                                                            <th style="width: 13%; text-align: center;"><small>Individual</small></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        @foreach($modulePerms->groupBy(function($item) {
                                                                            return preg_replace('/-(index|list|create|edit|delete|update|show|view|approve)$/', '', $item->name);
                                                                        }) as $group => $perms)
                                                                            @php
                                                                                $viewPerm = $perms->first(function($p) { return str_contains($p->name, 'index') || str_contains($p->name, 'list'); });
                                                                                $createPerm = $perms->first(function($p) { return str_contains($p->name, 'create'); });
                                                                                $editPerm = $perms->first(function($p) { return str_contains($p->name, 'edit') || str_contains($p->name, 'update'); });
                                                                                $deletePerm = $perms->first(function($p) { return str_contains($p->name, 'delete'); });
                                                                                $individualPerms = $perms->filter(function($p) {
                                                                                    return !str_contains($p->name, 'index') && !str_contains($p->name, 'list') &&
                                                                                           !str_contains($p->name, 'create') && !str_contains($p->name, 'edit') &&
                                                                                           !str_contains($p->name, 'update') && !str_contains($p->name, 'delete');
                                                                                });
                                                                            @endphp
                                                                            <tr class="permission-row" data-group="{{ $group }}">
                                                                                <td style="text-align: center;">
                                                                                    <input type="checkbox" class="row-select-all"
                                                                                           data-group="{{ $group }}"
                                                                                           data-module="{{ $module }}">
                                                                                </td>
                                                                                <td class="perm-name-cell">
                                                                                    <strong>{{ ucfirst(str_replace('-', ' ', $group)) }}</strong>
                                                                                </td>
                                                                                <td style="text-align: center;">
                                                                                    @if($viewPerm)
                                                                                        <input type="checkbox" name="permission[]"
                                                                                               value="{{ $viewPerm->id }}"
                                                                                               class="action-checkbox row-checkbox module-{{ \Str::slug($module) }} group-{{ $group }}"
                                                                                               {{ in_array($viewPerm->id, $userPermissions) ? 'checked' : '' }}>
                                                                                    @endif
                                                                                </td>
                                                                                <td style="text-align: center;">
                                                                                    @if($createPerm)
                                                                                        <input type="checkbox" name="permission[]"
                                                                                               value="{{ $createPerm->id }}"
                                                                                               class="action-checkbox row-checkbox module-{{ \Str::slug($module) }} group-{{ $group }}"
                                                                                               {{ in_array($createPerm->id, $userPermissions) ? 'checked' : '' }}>
                                                                                    @endif
                                                                                </td>
                                                                                <td style="text-align: center;">
                                                                                    @if($editPerm)
                                                                                        <input type="checkbox" name="permission[]"
                                                                                               value="{{ $editPerm->id }}"
                                                                                               class="action-checkbox row-checkbox module-{{ \Str::slug($module) }} group-{{ $group }}"
                                                                                               {{ in_array($editPerm->id, $userPermissions) ? 'checked' : '' }}>
                                                                                    @endif
                                                                                </td>
                                                                                <td style="text-align: center;">
                                                                                    @if($deletePerm)
                                                                                        <input type="checkbox" name="permission[]"
                                                                                               value="{{ $deletePerm->id }}"
                                                                                               class="action-checkbox row-checkbox module-{{ \Str::slug($module) }} group-{{ $group }}"
                                                                                               {{ in_array($deletePerm->id, $userPermissions) ? 'checked' : '' }}>
                                                                                    @endif
                                                                                </td>
                                                                                <td style="text-align: center;">
                                                                                    @if($individualPerms->count() > 0)
                                                                                        <div class="btn-group" role="group">
                                                                                            @foreach($individualPerms as $indPerm)
                                                                                                <label class="mb-0 mr-2" style="font-weight: normal; cursor: pointer;">
                                                                                                    <input type="checkbox" name="permission[]"
                                                                                                           value="{{ $indPerm->id }}"
                                                                                                           class="action-checkbox row-checkbox module-{{ \Str::slug($module) }} group-{{ $group }}"
                                                                                                           title="{{ $indPerm->name }}"
                                                                                                           {{ in_array($indPerm->id, $userPermissions) ? 'checked' : '' }}>
                                                                                                    {{ $indPerm->name }}
                                                                                                </label>
                                                                                            @endforeach
                                                                                        </div>
                                                                                    @endif
                                                                                </td>
                                                                            </tr>
                                                                        @endforeach
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-success user-from-button float-right"><i class="la la-save"></i>&nbsp;Assign Permissions</button>
                                @can('user-list')
                                    <a href="{{ route('pms.admin.users.index') }}" class="btn btn-danger"><i class="la la-times"></i>&nbsp;Cancel</a>
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
    $(document).ready(function () {
        // Show/hide permission panels based on module selection
        $('#module-list a').on('click', function (e) {
            e.preventDefault();
            const target = $(this).attr('href');
            $('.module-panel').addClass('hide');
            $(target).removeClass('hide');

            $('#module-list a').removeClass('active');
            $(this).addClass('active');
        });

        // Row-level select all checkbox - select all actions in that row
        $('.row-select-all').on('change', function () {
            const group = $(this).data('group');
            const module = $(this).data('module');
            const moduleSlug = module.replace(/\s+/g, '-').toLowerCase();
            const isChecked = $(this).is(':checked');
            $(`#module-${moduleSlug} .group-${group}`).prop('checked', isChecked);

            updateModuleCheckbox(module);
        });

        // Individual action checkbox
        $('.action-checkbox').on('change', function () {
            const group = $(this).attr('class').match(/group-(\S+)/)[1];
            const moduleSlug = $(this).attr('class').match(/module-(\S+)/)[1];

            updateRowCheckbox(group, moduleSlug);

            const modulePanel = $(`#module-${moduleSlug}`);
            const module = modulePanel.data('module');
            updateModuleCheckbox(module);
        });

        // Module select all checkbox - prevent tab switch when clicking checkbox
        $('.module-select-all').on('click', function (event) {
            event.stopPropagation();
        });

        $('.module-select-all').on('change', function () {
            const module = $(this).data('module');
            const moduleSlug = module.replace(/\s+/g, '-').toLowerCase();
            const isChecked = $(this).is(':checked');

            $(`#module-${moduleSlug} .row-select-all`).prop('checked', isChecked);
            $(`#module-${moduleSlug} .action-checkbox`).prop('checked', isChecked);
            updateModuleCheckbox(module);
        });

        // Check all permissions globally
        $('#check_all').on('change', function () {
            const isChecked = $(this).is(':checked');
            $('.module-select-all').prop('checked', isChecked);
            $('.row-select-all').prop('checked', isChecked);
            $('.action-checkbox').prop('checked', isChecked);
        });

        function updateRowCheckbox(group, moduleSlug) {
            const rowCheckbox = $(`#module-${moduleSlug} .row-select-all[data-group="${group}"]`);
            const groupCheckboxes = $(`#module-${moduleSlug} .group-${group}`);
            const checkedCheckboxes = $(`#module-${moduleSlug} .group-${group}:checked`);

            const allChecked = groupCheckboxes.length === checkedCheckboxes.length && groupCheckboxes.length > 0;
            rowCheckbox.prop('checked', allChecked);
        }

        function updateModuleCheckbox(module) {
            const moduleSlug = module.replace(/\s+/g, '-').toLowerCase();
            const allRowCheckboxes = $(`#module-${moduleSlug} .row-select-all`);
            const checkedRowCheckboxes = $(`#module-${moduleSlug} .row-select-all:checked`);

            const allChecked = allRowCheckboxes.length === checkedRowCheckboxes.length && allRowCheckboxes.length > 0;
            $(`.module-select-all[data-module="${module}"]`).prop('checked', allChecked);
        }

        // Initialise row/module checkbox states from pre-checked permissions
        $('.action-checkbox').each(function () {
            const group = $(this).attr('class').match(/group-(\S+)/)[1];
            const moduleSlug = $(this).attr('class').match(/module-(\S+)/)[1];
            updateRowCheckbox(group, moduleSlug);
        });
        $('.module-select-all').each(function () {
            updateModuleCheckbox($(this).data('module'));
        });

        const listGroupLink = document.querySelector('#module-list a.active') || document.querySelector('#module-list a');
        if (listGroupLink) {
            listGroupLink.click();
        }
    });

    $(document).ready(function () {
        var form = $('.user-form');
        var button = form.find('.user-from-button');
        var buttonContent = button.html();

        form.submit(function (event) {
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
            .done(function (response) {
                if (response.success) {
                    window.open("{{ route('pms.admin.users.index') }}", "_parent");
                } else {
                    toastr.error(response.message);
                }
                button.prop('disabled', false).html(buttonContent);
            })
            .fail(function (xhr) {
                if (xhr.responseJSON && xhr.responseJSON.errors) {
                    $.each(xhr.responseJSON.errors, function (field, msgs) {
                        toastr.error(msgs[0]);
                    });
                } else {
                    toastr.error('Something went wrong. Please try again.');
                }
                button.prop('disabled', false).html(buttonContent);
            });
        });
    });
</script>
@endsection
