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
                    <a href="javascript:history.back()" class="btn btn-sm btn-warning text-white" data-toggle="tooltip"
                    title="Back"> <i class="las la-chevron-left"></i>Back</a>
                </li>
            </ul>
        </div>

        <div class="page-content">
            <div class="">
                <div class="panel panel-info">
                    <form action="{{ route('pms.requisition.requisition.store') }}" method="post"
                    id="addRequisitionForm" data-src="{{ $requisition?$requisition->id:null }}"
                    enctype="multipart/form-data" class="formInputValidation">
                    @csrf
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3 col-sm-6">
                                <p class="mb-1 font-weight-bold"><label for="reference"><strong>{{ __('Reference No.')
                            }} <span class="text-danger">&nbsp;*</span></strong></label></p>
                            <div class="input-group input-group-md mb-3 d-">
                                <input type="text" name="reference_no" id="reference"
                                class="form-control rounded" aria-label="Large"
                                aria-describedby="inputGroup-sizing-sm" required readonly
                                value="{{ old('reference_no',$refNo) }}">
                                @if ($errors->has('reference_no'))
                                <span class="help-block">
                                    <strong class="text-danger">{{ $errors->first('reference_no') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <p class="mb-1 font-weight-bold"><label for="date"><strong>{{ __('Date') }}:<span class="text-danger">&nbsp;*</span></strong></label> </p>
                            <div class="input-group input-group-md mb-3 d-">
                                <input type="text" name="requisition_date" id="date"
                                class="form-control rounded air-datepicker" readonly aria-label="Large"
                                aria-describedby="inputGroup-sizing-sm" required
                                value="{{ old('date')?old('date'):date('d-m-Y h:i a', time()) }}">
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <p class="mb-1 font-weight-bold"><label for="category_id"><strong>
                                {{ __('Category')
                            }}:<span class="text-danger">&nbsp;*</span>
                        </strong></label> </p>
                        <div class="input-group input-group-md mb-3 d-">

                            <select name="category_id" id="category_id" class="form-control category" onchange="getSubCategories()">
                                <option value="{{ null }}" disabled {{ request()->has('category_id') &&
                                request()->get('category_id') > 0 ? '' : 'selected' }} data-sub-category-ids="" data-sub-category-names="" data-sub-category-codes="">{{ __('Select
                            Category') }}</option>


                            @if(isset($categories[0]) && !isset($task->id))
                            <optgroup label="Products">
                                @foreach($categories as $category)
                                <option value="{{ $category->id }}" {{ request()->has('category_id') &&
                                request()->get('category_id') == $category->id ? 'selected' : '' }} data-sub-category-ids="{{ $category->subCategory->pluck('id')->implode(',') }}" data-sub-category-names="{{ $category->subCategory->pluck('name')->implode(',') }}"  data-sub-category-codes="{{ $category->subCategory->pluck('code')->implode(',') }}">{{ $category->name.'('.$category->code.')'}}
                                </option>
                                @endforeach
                            </optgroup>
                            @endif

                            @if(isset($fixedAssetCategories[0]) && !isset($task->id))
                            <optgroup label="Fixed Assets">
                                @foreach($fixedAssetCategories as $category)
                                <option value="{{ $category->id }}" {{ request()->has('category_id') &&
                                request()->get('category_id') == $category->id ? 'selected' : '' }} data-sub-category-ids="{{ $category->subCategory->pluck('id')->implode(',') }}" data-sub-category-names="{{ $category->subCategory->pluck('name')->implode(',') }}"  data-sub-category-codes="{{ $category->subCategory->pluck('code')->implode(',') }}">{{ $category->name.'('.$category->code.')'}}
                                </option>
                                @endforeach
                            </optgroup>
                            @endif

                            @if(isset($cwipCategories[0]))
                            <optgroup label="CWIP">
                                @foreach($cwipCategories as $category)
                                <option value="{{ $category->id }}" {{ request()->has('category_id') &&
                                request()->get('category_id') == $category->id ? 'selected' : '' }} data-sub-category-ids="{{ $category->subCategory->pluck('id')->implode(',') }}" data-sub-category-names="{{ $category->subCategory->pluck('name')->implode(',') }}"  data-sub-category-codes="{{ $category->subCategory->pluck('code')->implode(',') }}">{{ $category->name.'('.$category->code.')'}}
                                </option>
                                @endforeach
                            </optgroup>
                            @endif

                        </select>
                    </div>
                </div>


                @if(!empty($task))
                <div class="col-md-3 col-sm-6">
                    <p class="mb-1 font-weight-bold"><label for="project_task_id">{{ __('Project Information') }}:</label> </p>
                    <div class="input-group input-group-md mb-3 d-">
                        <ul>
                            <li>Project : {{isset($task->subDeliverable->deliverable->project->name)?$task->subDeliverable->deliverable->project->name:''}}</li>
                            <li>Phase : {{isset($task->subDeliverable->deliverable->name)?$task->subDeliverable->deliverable->name:''}}</li>
                            <li>Milestone : {{isset($task->subDeliverable->name)?$task->subDeliverable->name:''}}</li>
                            <li>Task : {{$task->name}}</li>
                        </ul>
                        <input type="hidden" name="project_task_id" value="{{$task->id}}">
                    </div>
                </div> 
                @endif


                <div class="col-md-12 table-responsive style-scroll">

                    <table class="table table-striped table-bordered miw-500 dac_table" cellspacing="0"
                    width="100%" id="dataTable">
                    <thead>
                        <tr class="text-center">
                            <th>{{__('Sub Category')}}</th>
                            <th width="50%">{{__('Product')}}</th>
                            <th width="10%">{{__('UOM')}}</th>
                            <th width="10%">{{__('Quantity')}}</th>
                            <th class="text-center">{{__('Action')}}</th>
                        </tr>
                    </thead>
                    <tbody class="field_wrapper">
                        <tr>
                            <td>
                                <div class="input-group input-group-md mb-3 d-">
                                    <select name="sub_category_id[]" id="sub_category_id_1"
                                    style="width: 100%" class="form-control subcategory"
                                    onchange="getProduct($(this))">

                                </select>
                            </div>
                        </td>
                        <td class="product-td">
                            <div class="input-group input-group-md mb-3 d-">
                                <select name="product_id[]" id="product_1"
                                class="form-control product requisition-products" onchange="getUOM()" required>
                                <option value="{{ null }}" data-uom="">{{ __('Select
                            Product') }}</option>
                        </select>
                    </div>
                </td>
                <td class="product-uom text-center">

                </td>
                <td>
                    <div class="input-group input-group-md mb-3 d-">
                        <input type="number" name="qty[]" min="1" max="99999999"
                        id="qty_1" class="form-control requisition-qty" aria-label="Large"
                        aria-describedby="inputGroup-sizing-sm"
                        onKeyPress="if(this.value.length==6) return false;" min="1"
                        required data-input="recommended" oninput="this.value = Math.abs(this.value)">
                    </div>
                </td>
                <td>
                    <a href="javascript:void(0);" id="remove_1"
                    class="remove_button btn btn-sm btn-danger" title="Remove"
                    style="color:#fff;">
                    <i class="las la-trash"></i>
                </a>
            </td>
        </tr>

    </tbody>

</table>
<a href="javascript:void(0);" class="add_button btn btn-sm btn-success pull-right"
style="margin-right:17px;" title="Add More Product">
<i class="las la-plus"></i>
</a>

</div>

<div class="col-md-12">
    <p class="mb-1 font-weight-bold"><label for="remarks">{{ __('Notes') }}:&nbsp;<strong class="text-danger">*</strong></label> {!!
        $errors->has('remarks')? '<span class="text-danger text-capitalize">'.
        $errors->first('remarks').'</span>':'' !!}</p>
        <div class="form-group form-group-lg mb-3 d-">
            <textarea rows="3" name="remarks" id="remarks"
            class="form-control rounded word-restrictions" aria-label="Large"
            aria-describedby="inputGroup-sizing-sm" data-input="recommended" required>{!! old('remarks') !!}</textarea>
        </div>
    </div>

    <input type="hidden" name="hr_unit_id" value="{{$unitId}}">
</div>
<div class="row">
    <div class="col-md-4">
        <p class="mb-1 font-weight-bold"><label for="file">{{ __('Attachment') }}:</label>
            {!! $errors->has('file')? '<span class="text-danger text-capitalize">'.
            $errors->first('file').'</span>':'' !!}</p>
            <div class="form-group form-group-lg mb-3 d-">
                <input type="file" name="file" id="file" class="form-control">
            </div>
        </div>
        <div class="col-4"></div>
        <div class="col-4 mt-4">
            <input type="hidden" name="where_to_go" id="where_to_go" value="index">
            <button type="button" class="btn btn-primary rounded pull-right save-button" onclick="submitRequisition('index');"><i class="la la-plus"></i>{{ __('Save Requisition') }}</button>
            <button type="button" class="btn btn-info rounded pull-right mr-2 save-new-button" onclick="submitRequisition('back');"><i class="la la-plus"></i>{{ __('Save & New Requisition') }}</button>
        </div>
    </div>

</div>
</form>

</div>
</div>
</div>
</div>
</div>
<!-- END WRAPPER CONTENT ------------------------------------------------------------------------->
@endsection

@section('page-script')

<script type="text/javascript">

    "use strict";
    var selectedProductIds=[];

    function changeSelectedProductIds() {
        selectedProductIds=[];
            $('.product').each(function () { //
                selectedProductIds.push($(this).val());
            })
        }

        function formInputValidation(){
            let activeSection = document.querySelector(".formInputValidation");
            let inputs = activeSection.querySelectorAll("input");
            let textareas = activeSection.querySelectorAll("textarea");

            let inputBoxAlert = []
            inputs.forEach(input=>{
                if(input.getAttribute('data-input') === "recommended" && input.value === ""){
                    inputBoxAlert.push({
                        name: input.getAttribute('name')
                    })
                }
            })

            textareas.forEach(input=>{
                if(input.getAttribute('data-input') === "recommended" && input.value === ""){
                    inputBoxAlert.push({
                        name: input.getAttribute('name')
                    })
                }
            })

            if(inputBoxAlert.length > 0){
                inputBoxAlert.forEach(item=>{
                    toastr.error(`${item.name.replaceAll("[]","")} can't empty. Please fill that input field.`, 'Error!')
                });
                return false;
            }

            return true;
        }

        function submitRequisition(where_to_go) {
            $('#where_to_go').val(where_to_go);
            
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
                $('#addRequisitionForm').submit();
            }
        }


        $(document).ready(function(){

            var form = $('#addRequisitionForm');


            var maxField = 200;
            var addButton = $('.add_button');
            var x = 1;
            var wrapper = $('.field_wrapper');

            getSubCategories();

            $(addButton).click(function(){

                x++;

                var fieldHTML = '<tr>\n' +
                '                                            <td>\n' +
                '\n' +
                '                                                <div class="input-group input-group-md mb-3 d-">\n' +
                '                                                    <select name="sub_category_id[]" style="width: 100%" id="sub_category_id_'+x+'" class="form-control select2 subcategory" onchange="getProduct($(this))" required></select>\n' +
                '                                                </div>\n' +
                '\n' +
                '                                            </td>\n' +

                '                                            <td class="product-td">\n' +
                '\n' +
                '                                                <div class="input-group input-group-md mb-3 d-">\n' +
                '                                                    <select name="product_id[]" onchange="getUOM()" id="product_'+x+'" class="form-control select2 product requisition-products" required>\n' +
                '                                                        <option value="{{ null }}">{{ __("Select Product") }}</option>\n' +
                '                                                    </select>\n' +
                '                                                </div>\n' +
                '\n' +
                '                                            </td>\n' +
                '<td class="product-uom text-center"></td>'+
                '                                            <td>\n' +
                '                                                <div class="input-group input-group-md mb-3 d-">\n' +
                '                                                    <input type="number" name="qty[]" min="1" max="9999" onKeyPress="if(this.value.length==6) return false;" id="qty_'+x+'" class="form-control requisition-qty" aria-label="Large" aria-describedby="inputGroup-sizing-sm" oninput="this.value = Math.abs(this.value)" required>\n' +
                '                                                </div>\n' +
                '                                            </td>\n' +
                '\n' +
                '                                            <td>\n' +
                '                                                <a href="javascript:void(0);" id="remove_'+x+'" class="remove_button btn btn-sm btn-danger" title="Remove" style="color:#fff;">\n' +
                '                                                    <i class="las la-trash"></i>\n' +
                '                                                    \n' +
                '                                                </a>\n' +
                '                                            </td>\n' +
                '\n' +
                '                                        </tr>';

                $(wrapper).append(fieldHTML);
                $('#sub_category_id_'+x, wrapper).select2();
                $('#product_'+x, wrapper).select2();
                generateSubCategories($('#sub_category_id_'+x, wrapper))
                
            });

            $(wrapper).on('click', '.remove_button', function(e){
                e.preventDefault();
                if(x > 1){
                    x--;

                    var incrementNumber = $(this).attr('id').split("_")[1];
                    var productVal=$('#product_'+incrementNumber).val()

                    const index = selectedProductIds.indexOf(productVal);
                    if (index > -1) {
                        selectedProductIds.splice(index, 1);
                    }
                    $(this).parent('td').parent('tr').remove();
                }
            });

        });

$(document).ready(function() {
    $.each($('.subcategory'), function(index, val) {
        getProduct($(this))
    });

    var wrapper = $('.field_wrapper');
    $(wrapper).on('change','.product', function (e) {
        changeSelectedProductIds();

        var incrementNumber = $(this).attr('id').split("_")[1];
        $('#qty_'+incrementNumber).val('');

        $(this).parent().parent().parent().find('.subcategory').val(parseInt($(this).find(':selected').attr('data-sub-category-id'))).select2();
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


function getProduct(element){
    var incrementNumber = element.attr('id').split("_")[3];

    changeSelectedProductIds();

    var subcategory_id = $('#sub_category_id_' + incrementNumber).val();
    if (subcategory_id.length === 0) {
        subcategory_id = 0;
    }
    $('#qty_'+incrementNumber).val('')
    $('#product_' + incrementNumber).html('<option value="">Please Wait...</option>').load('{{URL::to(Request()->route()->getPrefix()."requisition/load-category-wise-product")}}/' + subcategory_id+'?parent_id='+$('#category_id').val()+'&selected='+($('#product_' + incrementNumber).val())+'&products_id='+selectedProductIds);
}

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

function getUOM() {
    $.each($('.product'), function(index, val) {
        $(this).parent().parent().next().html($(this).find(':selected').attr('data-uom'));
    });
}
</script>
@endsection