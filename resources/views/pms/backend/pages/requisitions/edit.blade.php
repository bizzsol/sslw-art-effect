@extends('pms.backend.layouts.master-layout')

@section('title', session()->get('system-information')['name']. ' | '.$title)

@section('page-css')

@endsection

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
                <li class="active">{{__($title)}} List</li>
                <li class="top-nav-btn">
                   <a href="javascript:history.back()" class="btn btn-sm btn-warning text-white" data-toggle="tooltip" title="Back" > <i class="las la-chevron-left"></i>Back</a>
               </li>
           </ul>
       </div>

       <div class="page-content">
        <div class="">
            <div class="panel panel-info">

                <form action="{{ route('pms.requisition.requisition.update',$requisition->id) }}?redirect={{ request()->get('redirect') }}&editor={{ request()->get('editor') }}" method="POST" id="editRequisitionForm" enctype="multipart/form-data" class="formInputValidation">
                    <input type="hidden" name="_method" value="PUT">
                    @csrf
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3 col-sm-6">
                                <p class="mb-1 font-weight-bold"><label for="reference">{{ __('Reference No.') }}:</label></p>
                                <div class="input-group input-group-md mb-3 d-">
                                    <input type="text" name="reference_no" id="reference" class="form-control rounded" aria-label="Large" aria-describedby="inputGroup-sizing-sm" required readonly value="{{ old('reference_no',$requisition->reference_no) }}">
                                    @if ($errors->has('reference_no'))
                                    <span class="help-block">
                                        <strong class="text-danger">{{ $errors->first('reference_no') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-6">
                                <p class="mb-1 font-weight-bold"><label for="date">{{ __('Date') }}:</label> </p>
                                <div class="input-group input-group-md mb-3 d-">
                                    <input type="text" name="requisition_date" id="date" class="form-control rounded air-datepicker" aria-label="Large" aria-describedby="inputGroup-sizing-sm" required value="{{ date('Y-m-d',strtotime($requisition->requisition_date)) }}" >
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-6">
                                <p class="mb-1 font-weight-bold"><label for="category_id">{{ __('Category') }}:</label> </p>
                                <div class="input-group input-group-md mb-3 d-">
                                    @if($requisition->status==1)
                                        <input type="text" name="category_id" value="{{isset($requisition->items[0]->product->category->category->name)?$requisition->items[0]->product->category->category->name:''}}" class="form-control" readonly>
                                    @else
                                    
                                    <select name="category_id" id="category_id" class="form-control category" onchange="getSubCategories()">
                                        @if(isset($categories[0]))
                                        <optgroup label="Products">
                                            @foreach($categories as $category)
                                            <option value="{{ $category->id }}" {{ $category_id == $category->id ? 'selected' : '' }} data-sub-category-ids="{{ $category->subCategory->pluck('id')->implode(',') }}" data-sub-category-names="{{ $category->subCategory->pluck('name')->implode(',') }}"  data-sub-category-codes="{{ $category->subCategory->pluck('code')->implode(',') }}">{{
                                                $category->name.'('.$category->code.')'}}
                                            </option>
                                            @endforeach
                                        </optgroup>
                                        @endif

                                        @if(isset($fixedAssetCategories[0]))
                                        <optgroup label="Fixed Assets">
                                            @foreach($fixedAssetCategories as $category)
                                            <option value="{{ $category->id }}" {{ $category_id == $category->id ? 'selected' : '' }} data-sub-category-ids="{{ $category->subCategory->pluck('id')->implode(',') }}" data-sub-category-names="{{ $category->subCategory->pluck('name')->implode(',') }}"  data-sub-category-codes="{{ $category->subCategory->pluck('code')->implode(',') }}">{{
                                                $category->name.'('.$category->code.')'}}
                                            </option>
                                            @endforeach
                                        </optgroup>
                                        @endif

                                        @if(isset($cwipCategories[0]))
                                        <optgroup label="CWIP">
                                            @foreach($cwipCategories as $category)
                                            <option value="{{ $category->id }}" {{ $category_id == $category->id ? 'selected' : '' }} data-sub-category-ids="{{ $category->subCategory->pluck('id')->implode(',') }}" data-sub-category-names="{{ $category->subCategory->pluck('name')->implode(',') }}"  data-sub-category-codes="{{ $category->subCategory->pluck('code')->implode(',') }}">{{
                                                $category->name.'('.$category->code.')'}}
                                            </option>
                                            @endforeach
                                        </optgroup>
                                        @endif
                                    </select>
                                    @endif
                                </div>
                            </div>

                            @if(isset($task->id))
                            <div class="col-md-3 col-sm-6">
                                <p class="mb-1 font-weight-bold"><label for="project_task_id">{{ __('Project Information') }}:</label> </p>
                                <div class="input-group input-group-md mb-3 d-">
                                    <ul>
                                        <li>Project : {{$task->subDeliverable->deliverable->project->name}}</li>
                                        <li>Phase : {{$task->subDeliverable->deliverable->name}}</li>
                                        <li>Milestone : {{$task->subDeliverable->name}}</li>
                                        <li>Task : {{$task->name}}</li>
                                    </ul>
                                    <input type="hidden" name="project_task_id" value="{{$task->id}}">
                                </div>
                            </div> 
                            @endif

                            <div class="col-md-12  table-responsive style-scroll">

                                <table class="table table-striped table-bordered miw-500 dac_table" cellspacing="0" width="100%" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>{{__('Sub Category')}}</th>
                                            <th width="50%">{{__('Product')}}</th>
                                            <th width="10%">{{__('UOM')}}</th>
                                            <th width="10%">{{__('Qty')}}</th>
                                            @can('department-requisition-edit')
                                            <th width="10%">{{__('Approved Qty')}}</th>
                                            @php 
                                            $modifiedName=true;
                                            @endphp
                                            @endcan

                                            <th class="text-center">{{__('Action')}}</th>
                                        </tr>
                                    </thead>
                                    <tbody class="field_wrapper">

                                        @php
                                        $oldProductIds=[];
                                        @endphp
                                        @forelse($requisition->requisitionItems as $key=>$requisitionItem)
                                        <tr>
                                            <td>
                                                <div class="input-group input-group-md mb-3 d-">
                                                    @if($requisition->status==1)
                                                    <input type="text" name="category_id" value="{{isset($requisitionItem->product->category->name)?$requisitionItem->product->category->name:''}}" class="form-control" readonly>
                                                    @else
                                                    <select name="sub_category_id[]" id="subCategoryId_{{$key}}" class="form-control subcategory" onchange="getProduct($(this))">
                                                    @endif
                                                    </select>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group input-group-md mb-3 d-">
                                                    @if($requisition->status==1)
                                                    <input type="text" name="category_id" value="{{isset($requisitionItem->product->name)?$requisitionItem->product->name:''}}" class="form-control" readonly>
                                                    @else
                                                    <select name="product_id[]" id="product_{{$key}}" class="form-control product existing-products requisition-products" data-selected-product="{{ $requisitionItem->product_id }}" data-selected-sub-category="{{ $requisitionItem->product->category_id }}" onchange="getUOM()" required>
                                                        
                                                    </select>
                                                    @endif
                                                </div>
                                            </td>
                                            <td class="product-uom text-center">
                                                 @if($requisition->status==1)
                                                    <input type="text" name="category_id" value="{{isset($requisitionItem->product->productUnit->unit_name)?$requisitionItem->product->productUnit->unit_name:''}}" class="form-control" readonly>
                                                    @endif
                                            </td>
                                            <td>
                                                <div class="input-group input-group-md mb-3 d-">
                                                    <input type="number" @if($modifiedName) readonly name="old_qty[]" value="{{ old('qty',$requisitionItem->requisition_qty) }}" @else name="qty[]" value="{{ old('qty',$requisitionItem->qty) }}" @endif  min="1" max="99999999" id="qty_{{$key}}" onKeyPress="if(this.value.length==6) return false;" class="form-control {{ !$modifiedName ? 'requisition-qty' : ''  }}" aria-label="Large" aria-describedby="inputGroup-sizing-sm" required {{($requisition->status==1)?'readonly':''}}>
                                                </div>
                                            </td>

                                            @can('department-requisition-edit')
                                            <td>
                                                <div class="input-group input-group-md mb-3 d-">
                                                    <input type="number" name="qty[]" min="1" max="99999999" id="qty_{{$key}}" onKeyPress="if(this.value.length==6) return false;" class="form-control requisition-qty" aria-label="Large" aria-describedby="inputGroup-sizing-sm" required value="{{ old('qty',$requisitionItem->qty) }}">
                                                </div>
                                            </td>
                                            @endcan

                                            <td>
                                                @if($requisition->status !=1)

                                                <a href="javascript:void(0);" id="remove_{{$key}}" class="remove_button btn btn-danger btn-sm" style="margin-right:17px;" title="Remove" >
                                                    <i class="las la-trash"></i>
                                                </a>
                                                @endif
                                            </td>
                                        </tr>
                                        @empty
                                        @endforelse

                                    </tbody>
                                </table>
                                @if(auth::user()->id ==$requisition->author_id)
                                     @if($requisition->status !=1)
                                    <a href="javascript:void(0);" style="margin-right:27px;" class="add_button btn btn-sm btn-primary pull-right" title="Add More Product">
                                        <i class="las la-plus"></i>
                                    </a>
                                    @endif
                                @endif
                            </div>

                            <div class="col-md-12">
                                <p class="mb-1 font-weight-bold"><label for="remarks">{{ __('Notes') }}:</label> {!! $errors->has('remarks')? '<span class="text-danger text-capitalize">'. $errors->first('remarks').'</span>':'' !!}</p>
                                <div class="form-group form-group-lg mb-3 d-">
                                    <textarea rows="3" name="remarks" id="remarks" class="form-control rounded word-restrictions" aria-label="Large" aria-describedby="inputGroup-sizing-sm" data-input="recommended">{!! old('remarks',$requisition->remarks) !!}</textarea>
                                </div>

                                <input type="hidden" name="status" value="{{$requisition->status}}">

                                @if($modifiedName)
                                <input type="hidden" name="approval_qty" value="true">
                                <input type="hidden" name="project_id" value="{{$requisition->project_id}}">
                                <input type="hidden" name="deliverable_id" value="{{$requisition->deliverable_id}}">
                                @else
                                <input type="hidden" name="approval_qty" value="false">
                                @endif
                                <input type="hidden" name="hr_unit_id" value="{{$requisition->hr_unit_id}}">
                                <input type="hidden" name="author_id" value="{{$requisition->author_id}}">
                                <input type="hidden" name="created_by" value="{{$requisition->created_by}}">
                            </div>

                            <div class="col-md-4">
                                <p class="mb-1 font-weight-bold">
                                    <label for="edit_file">{{ __('Attachment') }}:</label>
                                    @if(!empty($requisition->attachment) && file_exists(public_path($requisition->attachment)))
                                        <a class="text-primary" href="{{ url($requisition->attachment) }}" target="_blank">View Existing Attachment</a>
                                    @endif 
                                    {!! $errors->has('edit_file')? '<span class="text-danger text-capitalize">'. $errors->first('edit_file').'</span>':'' !!}
                                </p>
                                <div class="form-group form-group-lg mb-3 d-">
                                    <input type="file" name="edit_file" id="edit_file" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    Notes History
                                </button>
                                
                            </div>
                            <div class="col-6">
                                <button type="button" onclick="updateRequisition()" class="btn btn-danger rounded pull-right">{{ __('Update Requisition') }}</button>
                            </div>

                        </div>
                    </div>
                </form>

            </div>

            <div class="panel-body">
                <div class="collapse" id="collapseExample">
                  <div class="row">
                    @foreach($requisition->requisitionNoteLogs as $key => $log)
                    <div class="col-md-6 {{ in_array($log->type, ['department-head']) ? 'offset-md-6' : '' }}">
                        <div class="panel">
                            <div class="panel-body">
                                <p>{{ $log->notes }}</p>
                                <br>
                                <small>{{$log->createdBy->name}}&nbsp;&nbsp;|&nbsp;&nbsp;{{ ucwords(implode(' ', explode('-', $log->type))) }}&nbsp;&nbsp;|&nbsp;&nbsp;{{ date('Y-m-d g:i a', strtotime($log->created_at))}}</small>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>

@endsection
@section('page-script')
<script type="text/javascript">


    var selectedProductIds=["{{ implode(",",$oldProductIds) }}"];

    function changeSelectedProductIds() {
        selectedProductIds=[];
        $('.product').each(function () {
            selectedProductIds.push($(this).val());
        })
    }

    $(document).ready(function(){
        getSubCategories();

        var maxField = 500;
        var addButton = $('.add_button');
        var x = parseInt("{{ $requisition->requisitionItems->count()+1 }}"); 
        var wrapper = $('.field_wrapper');
        $(addButton).click(function(){
            x++;

            var fieldHTML = '<tr>\n' +
            '                                            <td>\n' +
            '                                                    <div class="input-group input-group-md mb-3 d-">\n' +
            '                                                        <select name="sub_category_id[]" id="subCategoryId_'+x+'" class="form-control subcategory" onchange="getProduct($(this))"></select>\n' +
            '                                                    </div>\n' +
            '\n' +
            '                                                </td>'+

            '                                            <td>\n' +
            '\n' +
            '                                                <div class="input-group input-group-md mb-3 d-">\n' +
            '                                                    <select name="product_id[]" id="product_'+x+'" class="form-control select2 product requisition-products" onchange="getUOM()" required>\n' +
            '                                                        <option value="{{ null }}">{{ __("--Select Product--") }}</option>\n' +
            '                                                    </select>\n' +
            '                                                </div>\n' +
            '\n' +
            '                                            </td><td class="product-uom text-center"></td>\n' +
            '                                            <td>\n' +
            '                                                <div class="input-group input-group-md mb-3 d-">\n' +
            '                                                    <input type="number" name="qty[]" min="1" max="99999999" id="qty_'+x+'" onKeyPress="if(this.value.length==6) return false;" class="form-control requisition-qty" aria-label="Large" aria-describedby="inputGroup-sizing-sm" required value="{{ old("qty") }}">\n' +
            '                                                </div>\n' +
            '                                            </td>\n'+'@if($modifiedName)\n' +
            '<td></td>\n'+'@endif\n' +
            '                                            <td>\n' +
            '                                                <a href="javascript:void(0);" id="remove_'+x+'" class="remove_button btn btn-sm btn-danger" title="Remove" >\n' +
            '                                                    <i class="las la-trash"></i>\n' +
            '                                                </a>\n' +
            '                                            </td>\n' +
            '\n' +
            '                                        </tr>';

            $(wrapper).append(fieldHTML);
            $('#subCategoryId_'+x, wrapper).select2();
            $('#product_'+x, wrapper).select2();
            generateSubCategories($('#subCategoryId_'+x, wrapper))
            // getProduct($('#subCategoryId_'+x, wrapper));
        });


            //Once remove button is clicked
            $(wrapper).on('click', '.remove_button', function(e){
                e.preventDefault();
                x--;

                var incrementNumber = $(this).attr('id').split("_")[1];
                var productVal=$('#product_'+incrementNumber).val()

                const index = selectedProductIds.indexOf(productVal);
                if (index > -1) {
                    selectedProductIds.splice(index, 1);
                }
                $(this).parent('td').parent('tr').remove();
                
            });


        });

        function getSubCategories() {
            $.each($('.subcategory'), function(index, val) {
                generateSubCategories($(this));
            });
        }

        function generateSubCategories(element) {
            var category = $('#category_id').find(':selected');
            var ids = (category.attr('data-sub-category-ids') ? category.attr('data-sub-category-ids').split(',') : []);
            var names = (category.attr('data-sub-category-names') ? category.attr('data-sub-category-names').split(',') : []);
            var codes = (category.attr('data-sub-category-codes') ? category.attr('data-sub-category-codes').split(',') : []);

            var value = element.val();
            var subCategories = '<option value="">Select Subcategory</option>';
            $.each(ids, function(index, val) {
                if(val > 0){
                    subCategories += '<option value="'+(val)+'" '+(val == value ? 'selected' : '')+'>'+(names[index])+' ('+(codes[index])+')</option>';
                }
            });

            element.html(subCategories).change();
        }
    </script>

    <script>
        $(document).ready(function() {
            var wrapper = $('.field_wrapper');
            $(wrapper).on('change','.product', function (e) {
                changeSelectedProductIds();
                var incrementNumber = $(this).attr('id').split("_")[1];
                $(this).parent().parent().parent().find('.subcategory').val(parseInt($(this).find(':selected').attr('data-sub-category-id'))).select2();
            });



        });

        function getProduct(element){
            var incrementNumber = element.attr('id').split("_")[1];

            changeSelectedProductIds();

            var subcategory_id = $('#subCategoryId_' + incrementNumber).val();
            var selected_category = $('#product_' + incrementNumber).attr('data-selected-sub-category');
            var selected_product = $('#product_' + incrementNumber).attr('data-selected-product');

            if (subcategory_id.length === 0) {
                subcategory_id = 0;
            }

            $('#product_' + incrementNumber).html('<option value="">Please Wait...</option>');
            $.ajax({
                url: '{{url(request()->route()->getPrefix()."requisition/load-category-wise-product")}}/'+subcategory_id+'?parent_id='+$('#category_id').val()+'&products_id='+selectedProductIds+'&selected='+selected_product,
                type: 'GET',
                data: {},
            })
            .done(function(response) {
                $('#product_' + incrementNumber).html(response).change();
            });
        }


        (function ($){
            "use script";
            $("#project_id").on('change', (e)=> {
                let project = e.target.value;
                $("#deliverable_id").empty();
                if(project) {
                    $.ajax({
                        type: 'get',
                        url: `${e.target.getAttribute("data-url")}/${project}`,
                        success: (data) => {
                            $("#deliverable_id").empty().append(data)
                        },
                    })
                }
            });
        })(jQuery);

        getUOM();
        function getUOM() {
            $.each($('.product'), function(index, val) {
                $(this).parent().parent().next().html($(this).find(':selected').attr('data-uom'));
            });
        }

        function updateRequisition() {
            var error_count = 0;
            if($('#remarks').val() == ""){
                error_count++;
                toastr.error("Please write a Remarks.");
            }

            if($('#category_id').find(':selected').val() == ""){
                error_count++;
                toastr.error("Please Choose Category");
            }

            $.each($('.requisition-products'), function(index, val) {
                if($(this).val() == "" || parseInt($(this).val()) <= 0){
                    error_count++;
                    toastr.error("Please choose Product");
                }
            });

            $.each($('.requisition-qty'), function(index, val) {
                if($(this).val() == "" || parseInt($(this).val()) <= 0){
                    error_count++;
                    toastr.error("Please write Product Quantity");
                }
            });

            if(error_count == 0){
                $('#editRequisitionForm').submit();
            }
        }
    </script>
    @endsection
