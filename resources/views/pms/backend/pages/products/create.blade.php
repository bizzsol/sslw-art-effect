@extends('pms.backend.layouts.master-layout')
@section('title', session()->get('system-information')['name']. ' | '.$title)
@section('page-css')
<style type="text/css">
    .col-form-label{
        font-size: 14px;
        font-weight: 600;
    }
    .bordered{
        border: 1px #ccc solid
    }
    .floating-title{
        position: absolute;
        top: -13px;
        left: 15px;
        background: white;
        padding: 0px 5px 5px 5px;
        font-weight: 500;
    }

    .label{
        font-weight:  bold !important;
    }

    .tab-pane{
        padding-top: 15px;
    }

    .select2-container{
        width:  100% !important;
    }

    .select2-container--default .select2-results__option[aria-disabled=true]{
        color: black !important;
        font-weight: bold !important;
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
                    <a href="{{  route('pms.dashboard') }}">{{ __('Home') }}</a>
                </li>
                <li><a href="#">PMS</a></li>
                <li class="active">{{__($title)}}</li>
                <li class="top-nav-btn">
                    <a href="javascript:history.back()" class="btn btn-danger btn-sm"><i class="las la-arrow-left"></i> Back</a>
                </li>
            </ul>
        </div>

        <div class="page-content">
            <div class="panel panel-info mt-3">
                <div class="panel-boby p-3">

                        <form action="{{ route('pms.product-management.product.store') }}" method="post" id="productForm">
                        @csrf
                        <input type="hidden" name="where_to_go" id="where_to_go" value="save">
                            <div class="form-row">
                                <div class="col-md-2">
                                    <p class="mb-1 font-weight-bold"><label for="sku"><strong>
                                        {{ __('Code') }}<span class="text-danger">&nbsp;*</span>
                                    </strong></label> {!! $errors->has('sku')? '<span class="text-danger text-capitalize">'. $errors->first('sku').'</span>':'' !!}</p>
                                    <div class="input-group input-group-md mb-3 d-">
                                        <input type="text" name="sku" id="sku" class="form-control rounded" aria-label="Large" placeholder="{{__('Item Code')}}" aria-describedby="inputGroup-sizing-sm" required value="{{ old('sku')?old('sku'):$sku }}" data-sku="{{ old('sku')?old('sku'):$sku }}">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <p class="mb-1 font-weight-bold"><label for="name"><strong>{{ __('Name') }}<span class="text-danger">&nbsp;*</span></strong></label> {!! $errors->has('name')? '<span class="text-danger text-capitalize">'. $errors->first('name').'</span>':'' !!}</p>
                                    <div class="input-group input-group-md mb-3 d-">
                                        <input type="text" name="name" id="name" class="form-control rounded" aria-label="Large" placeholder="{{__('Item Name')}}" aria-describedby="inputGroup-sizing-sm" required value="{{ old('name') }}">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <p class="mb-1 font-weight-bold"><label for="category_id"><strong>{{ __('Sub Category') }}<span class="text-danger">&nbsp;*</span></strong></label> {!! $errors->has('category_id')? '<span class="text-danger text-capitalize">'. $errors->first('category_id').'</span>':'' !!}</p>
                                    <div class="select-search-group input-group input-group-md mb-3 d-">
                                        <select name="category_id" id="category_id" class="form-control rounded select2 sub-category" required onchange="checkAttributes()">
                                            <option selected disabled value="{{ null }}">{{ __('Select One') }}</option>
                                            {!! $categoryOptions !!}
                                        </select>
                                    </div>
                                </div>

                                {{-- <div class="col-md-3">
                                    <p class="mb-1 font-weight-bold"><label for="brand_id">{{ __('Brand') }}:</label> 
                                        {!! $errors->has('brand_id')? '<span class="text-danger text-capitalize">'. $errors->first('brand_id').'</span>':'' !!}</p>
                                        <div class="select-search-group  input-group input-group-md mb-3 d-">
                                           {!! Form::Select('brand_id',$brands,old('brand_id'),['id'=>'brand_id', 'class'=>'form-control selectheighttype select2']) !!}
                                       </div>
                                   </div> --}}

                                <div class="col-md-3 ledgers-div asset-div" style="display: none">
                                    <p class="mb-1 font-weight-bold"><label for="parent_id">{{ __('Main Asset') }}:</label> {!! $errors->has('parent_id')? '<span class="text-danger text-capitalize">'. $errors->first('parent_id').'</span>':'' !!}</p>
                                    <div class="select-search-group input-group input-group-md mb-3 d-">
                                        <select name="parent_id" id="parent_id" class="form-control rounded select2" required onchange="getSubAssetCode()">
                                            <option value="0" data-code=''>N/A</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-md-2">
                                    <p class="mb-1 font-weight-bold"><label for="supplier"><strong>{{ __('Safety Stock') }}</strong></label> {!! $errors->has('buffer_inventory')? '<span class="text-danger text-capitalize">'. $errors->first('buffer_inventory').'</span>':'' !!}</p>
                                    <div class="select-search-group input-group input-group-md mb-3 d-">
                                        <input type="number" name="buffer_inventory" id="bufferInventory" class="form-control rounded" aria-label="Large" placeholder="{{__('Safety Stock Limit')}}" aria-describedby="inputGroup-sizing-sm" value="{{ old('buffer_inventory') }}" oninput="this.value = Math.abs(this.value)">
                                    </div>
                                </div>

                                <div class="col-md-1">
                                    <p class="mb-1 font-weight-bold"><label for="product_unit_id"><strong>{{ __('UOM') }}<span class="text-danger">&nbsp;*</span></strong></label> 
                                        {!! $errors->has('product_unit_id')? '<span class="text-danger text-capitalize">'. $errors->first('product_unit_id').'</span>':'' !!}</p>
                                        <div class="select-search-group  input-group input-group-md mb-3 d-">
                                           {!! Form::Select('product_unit_id',$unit,old('product_unit_id'),['id'=>'product_unit_id', 'class'=>'form-control selectheighttype select2']) !!}
                                       </div>
                                   </div>
                                   <div class="col-md-3">
                                    <p class="mb-1 font-weight-bold"><label for="unit_price"><strong>{{ __('Unit Price') }}<span class="text-danger">&nbsp;*</span></strong></label> {!! $errors->has('unit_price')? '<span class="text-danger text-capitalize">'. $errors->first('unit_price').'</span>':'' !!}</p>
                                    <div class="input-group input-group-md mb-3 d-">
                                        <input type="text" name="unit_price" id="unit_price" class="form-control rounded mask-money" step="any" aria-label="Large" placeholder="{{__('Item unit price')}}" aria-describedby="inputGroup-sizing-sm" required value="{{ old('unit_price') }}">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <p class="mb-1 font-weight-bold"><label for="tax"><strong>{{ __('VAT') }}<span class="text-danger">&nbsp;*</span></strong></label> {!! $errors->has('tax')? '<span class="text-danger text-capitalize">'. $errors->first('tax').'</span>':'' !!}</p>
                                    <div class="input-group input-group-md mb-3 d-">
                                        <input type="text" name="tax" step="any" id="tax" class="form-control rounded mask-money" aria-label="Large" placeholder="{{__('Item VAT(%)')}}" aria-describedby="inputGroup-sizing-sm" required value="{{ old('tax') }}" >
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="attributes">Attributes:</label>
                                    <div class="input-group input-group-md mb-3 d-">
                                        <select name="productAttributes[]" id="attributes" class="form-control rounded product-attributes" multiple data-placeholder="Choose Item Attributes" onchange="updateAttributes()">
                                            @if(isset($attributes[0]))
                                            @foreach($attributes as $key => $attribute)
                                                <option value="{{ $attribute->id }}">{{ $attribute->name }}</attribute>
                                            @endforeach
                                            @endif
                                        </select>
                                    </div> 
                                </div>
                                <div class="col-md-12">
                                    <div class="row">
                                    @if(isset($attributes[0]))
                                    @foreach($attributes as $key => $attribute)
                                        <div class="col-md-2 mb-3 attributes attribute-{{ $attribute->id }}" style="display: none">
                                            <label for="attribute-{{ $attribute->id }}">{{ $attribute->name }}:</label>
                                            <div class="input-group input-group-md mb-3 d-">
                                                <select name="attribute_option_id[{{ $attribute->id }}]" id="attribute-{{ $attribute->id }}" class="form-control rounded attribute-options">
                                                    <option value="0">Not Required</option>
                                                    @if(isset($attribute->options[0]))
                                                    @foreach($attribute->options as $key => $option)
                                                        <option value="{{ $option->id }}">{{ $option->name }}</option>
                                                    @endforeach
                                                    @endif
                                                </select>
                                            </div> 
                                        </div>
                                        {{-- <div class="col-md-1 attributes attribute-{{ $attribute->id }}" style="display: none">
                                            <label for="serial_no{{ $attribute->id }}"><strong>{{ __('Serial') }}:<span class="text-danger">&nbsp;*</span></strong></label>
                                            <div class="input-group input-group-md mb-3 d-">
                                               <input min="0" type="number" id="serial_no-{{ $attribute->id }}" name="serial_no[{{ $attribute->id }}]" value="0" class="form-control serial_no">
                                            </div>
                                        </div> --}}
                                    @endforeach
                                    @endif
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <p class="mb-1 font-weight-bold"><label for="supplier">{{ __('Supplier') }}:</label> {!! $errors->has('supplier')? '<span class="text-danger text-capitalize">'. $errors->first('supplier').'</span>':'' !!}</p>
                                    <div class="select-search-group input-group input-group-md mb-3 d-">
                                        {!! Form::Select('supplier[]',$suppliers,old('supplier'),['id'=>'supplier', 'class'=>'form-control rounded select2','multiple'=>'multiple','style'=>'width:100%']) !!}
                                    </div>
                                </div>
                                {{-- <div class="col-md-12 mt-3">
                                    <div class="row pr-3">
                                        <div class="col-md-3">
                                            <label for="inventory_account_id"><strong>Inventory Accounts:<span class="text-danger">&nbsp;*</span></strong></label>
                                            <div class="input-group input-group-md mb-3 d-">
                                                <select name="inventory_account_id" id="inventory_account_id" class="form-control rounded">
                                                    {!! $accounts !!}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="cogs_account_id"><strong>{{ __('Consumption Account') }}:<span class="text-danger">&nbsp;*</span></strong></label>
                                            <div class="input-group input-group-md mb-3 d-">
                                                <select name="cogs_account_id" id="cogs_account_id" class="form-control rounded">
                                                    {!! $accounts !!}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="cwip_asset_account_id"><strong>{{ __('CWIP to Asset Account') }}:<span class="text-danger">&nbsp;*</span></strong></label>
                                            <div class="input-group input-group-md mb-3 d-">
                                                <select name="cwip_asset_account_id" id="cwip_asset_account_id" class="form-control rounded">
                                                    {!! $accounts !!}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="inventory_adjustments_account_id"><strong>Inventory Adjustments Account:<span class="text-danger">&nbsp;*</span></strong></label>
                                            <div class="input-group input-group-md mb-3 d-">
                                                <select name="inventory_adjustments_account_id" id="inventory_adjustments_account_id" class="form-control rounded">
                                                    {!! $accounts !!}
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div> --}}

                                <div class="col-md-12 mt-3">
                                    <div class="row pr-3">
                                        <div class="col-md-4 ledgers-div inventory-div">
                                            <label for="inventory_account_id"><strong><span id="inventory-title">Inventory Accounts</span>:<span class="text-danger">&nbsp;*</span></strong></label>
                                            <div class="input-group input-group-md mb-3 d-">
                                                <select name="inventory_account_id" id="inventory_account_id" class="form-control select-me rounded">
                                                    {!! $accounts !!}
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-4 ledgers-div consumption-div">
                                            <label for="cogs_account_id"><strong>{{ __('Consumption Account') }}:<span class="text-danger">&nbsp;*</span></strong></label>
                                            <div class="input-group input-group-md mb-3 d-">
                                                <select name="cogs_account_id" id="cogs_account_id" class="form-control select-me rounded">
                                                    {!! $accounts !!}
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-4 ledgers-div asset-div">
                                            <label for="cwip_asset_account_id"><strong>{{ __('Asset Account') }}:<span class="text-danger">&nbsp;*</span></strong></label>
                                            <div class="input-group input-group-md mb-3 d-">
                                                <select name="cwip_asset_account_id" id="cwip_asset_account_id" class="form-control select-me rounded">
                                                    {!! $accounts !!}
                                                </select>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>

                                <div class="col-md-12 mb-4 mt-4 fixed-asset-info" style="display: none">
                                    <div class="card">
                                        <div class="card-body bordered">
                                            <h5 class="floating-title">Fixed Asset Information</h5>
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <label for="depreciation_method_id"><strong>Depreciation Method</strong></label>
                                                    <select name="depreciation_method_id" id="depreciation_method_id" class="form-control rounded" onchange="getDepreciationMethodOptions()">
                                                        @if(isset($depreciationMethods[0]))
                                                        @foreach($depreciationMethods as $key => $depreciationMethod)
                                                        <option value="{{ $depreciationMethod->id }}" data-code="{{ $depreciationMethod->code }}" data-base-rate="{{ $depreciationMethod->base_rate }}" data-depreciation-rate="{{ $depreciationMethod->depreciation_rate }}">{{ $depreciationMethod->code }} - {{ $depreciationMethod->name}}</option>
                                                        @endforeach
                                                        @endif
                                                    </select>
                                                </div>
                                                <div class="col-md-10">
                                                    <div class="row">
                                                        {{-- <div class="col-md-4">
                                                            <label for="sales_account_id"><strong>{{ __('Sales Account') }}:<span class="text-danger">&nbsp;*</span></strong></label>
                                                            <div class="input-group input-group-md mb-3 d-">
                                                                <select name="sales_account_id" id="sales_account_id" class="form-control rounded">
                                                                    {!! $accounts !!}
                                                                </select>
                                                            </div>
                                                        </div> --}}
                                                        <div class="col-md-4">
                                                            <label for="depreciation_cost_account_id"><strong>{{ __('Depreciation Account') }}:<span class="text-danger">&nbsp;*</span></strong></label>
                                                            <div class="input-group input-group-md mb-3 d-">
                                                                <select name="depreciation_cost_account_id" id="depreciation_cost_account_id" class="form-control rounded">
                                                                    {!! $accounts !!}
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="inventory_adjustments_account_id"><strong>Accumulated Depreciation Account:<span class="text-danger">&nbsp;*</span></strong></label>
                                                            <div class="input-group input-group-md mb-3 d-">
                                                                <select name="inventory_adjustments_account_id" id="inventory_adjustments_account_id" class="form-control select-me rounded">
                                                                    {!! $accounts !!}
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="depreciation_disposal_account_id"><strong>{{ __('Disposal Account') }}:<span class="text-danger">&nbsp;*</span></strong></label>
                                                            <div class="input-group input-group-md mb-3 d-">
                                                                <select name="depreciation_disposal_account_id" id="depreciation_disposal_account_id" class="form-control rounded">
                                                                    {!! $accounts !!}
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-2 method-options base_rate" style="display: none">
                                                    <label for="base_rate"><strong>Base Rate (%)</strong></label>
                                                    <input type="text" name="base_rate" id="base_rate" value="0.00" step="0.01" class="form-control mask-money" >
                                                </div>

                                                <div class="col-md-2 method-options years" style="display: none">
                                                    <label for="years"><strong>Depreciation Years:</strong></label>
                                                    <input type="number" name="years" id="years" value="20" class="form-control" class="form-control" onchange="calculateDepreciationPercentage()" onkeyup="calculateDepreciationPercentage()" oninput="this.value = Math.abs(this.value)">
                                                </div>
                                                <div class="col-md-2 method-options depreciation_rate" style="display: none">
                                                    <label for="depreciation_rate"><strong>Depreciation Rate (%)</strong></label>
                                                    <input type="text" name="depreciation_rate" id="depreciation_rate" value="0.00" step="0.0001" class="form-control mask-money">
                                                </div>
                                                <div class="col-md-2 method-options rate_multiplier" style="display: none">
                                                    <label for="rate_multiplier"><strong>Rate Multiplier:</strong></label>
                                                    <input type="text" name="rate_multiplier" id="rate_multiplier" value="0.00" step="0.01" class="form-control mask-money">
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="is_final_asset"><strong>{{ __('Final Asset ? ') }}:<span class="text-danger">&nbsp;*</span></strong></label>
                                                    <div class="input-group input-group-md mb-3 d-">
                                                        <select name="is_final_asset" id="is_final_asset" class="form-control rounded">
                                                            <option value="0">No</option>
                                                            <option value="1">Yes</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                {{-- <div class="col-md-2">
                                                    <label for="depreciation_start_date"><strong>Depreciation Start:</strong></label>
                                                    <input type="date" name="depreciation_start_date" id="depreciation_start_date" value="{{ date('Y-m-d') }}" class="form-control">
                                                </div> --}}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 pb-5">
                                <a class="btn btn-danger rounded pull-right ml-2" href="{{ url('pms/product-management/product') }}"><i class="la la-times"></i>&nbsp;{{ __('Close') }}</a>
                                <button type="button" class="btn btn-success rounded pull-right ml-2 save-button" onclick="saveProduct('save')"><i class="fa fa-check"></i>&nbsp;Save Item</button>

                                <button type="button" class="btn btn-info rounded pull-right save-and-new-button" onclick="saveProduct('save-and-new')"><i class="fa fa-check"></i>&nbsp;Save & New Item</button>
                            </div>
                        </form>
                      {{-- </div>
                    </div> --}}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('page-script')
<script type="text/javascript">
    $(document).ready(function() {
        checkAttributes();

        var form = $('#productForm');
        var save_button = $('.save-button');
        var save_button_content = save_button.html();
        var save_and_new_button = $('.save-and-new-button');
        var save_and_new_button_content = save_and_new_button.html();

        form.submit(function(event) {
            event.preventDefault();

            save_button.prop('disabled', true).html('<i class="la la-spinner"></i>&nbsp;Please Wait...');
            save_and_new_button.prop('disabled', true).html('<i class="la la-spinner"></i>&nbsp;Please Wait...');

            $.ajax({
                url: form.attr('action'),
                type: form.attr('method'),
                dataType: 'json',
                data: form.serializeArray(),
            })
            .done(function(response) {
                if(response.success){
                    if(response.new){
                        $('#sku').val(response.sku);
                        toastr.success(response.message);
                    }else{
                        location.reload();
                    }
                }else{
                    toastr.error(response.message);
                }

                save_button.prop('disabled', false).html(save_button_content);
                save_and_new_button.prop('disabled', false).html(save_and_new_button_content);
            })
            .fail(function(response) {
                $.each(response.responseJSON.errors, function(index, val) {
                    toastr.error(val[0]);
                });
                save_button.prop('disabled', false).html(save_button_content);
                save_and_new_button.prop('disabled', false).html(save_and_new_button_content);
            });
        });
    });

    function saveProduct(where_to_go) {
        $('#where_to_go').val(where_to_go);
        $('#productForm').submit();
    }
    
    function checkAttributes() {
        if($('#category_id').find(':selected').attr('data-attributes') != undefined){
            var attributes = $('#category_id').find(':selected').attr('data-attributes').split(',');
            var attributeOptions = $('#category_id').find(':selected').attr('data-attribute-options').split(',');

            $.each($(".product-attributes"), function(name, attribute_id) {
              $.each($(this).find('option'), function(index, val) {
                   if($.inArray($(this).attr('value'), attributes) != -1){
                    $(".product-attributes option[value='" + $(this).attr('value') + "']").removeAttr('hidden');
                   }else{
                    $(".product-attributes option[value='" + $(this).attr('value') + "']").attr('hidden', 'hidden');
                   }
              });
              
              $(this).select2({
               templateResult: function(option) {
                  if(option.element && (option.element).hasAttribute('hidden')){
                     return null;
                  }
                  return option.text;
               }
              });
            });

            $.each($('.attribute-options'), function(index, val) {
                $.each($(this).find('option'), function(index, val) {
                   if($.inArray($(this).attr('value'), attributeOptions) != -1){
                    $(this).parent().find("option[value='" + $(this).attr('value') + "']").removeAttr('hidden');
                   }else{
                    $(this).parent().find("option[value='" + $(this).attr('value') + "']").attr('hidden', 'hidden');
                   }
                });

                $(this).select2({
                    templateResult: function(option) {
                      if(option.element && (option.element).hasAttribute('hidden')){
                         return null;
                      }
                      return option.text;
                    }
                });
            });

            $(".product-attributes").val("").select2();

            $('.product-attributes').select2({
                allowClear: true,
                templateResult: function(option) {
                  if(option.element && (option.element).hasAttribute('hidden')){
                    return null;
                  }

                  return option.text;
                },
            });
        }else{
            $.each($(".product-attributes"), function(name, attribute_id) {
              $.each($(this).find('option'), function(index, val) {
                $(".product-attributes option[value='" + $(this).attr('value') + "']").removeAttr('hidden');
              });
              
              $(this).select2({
               templateResult: function(option) {
                  return null;
               }
              });
            });
        }
    }

    function updateAttributes(){
        var attributes = $("#attributes :selected").map(function(i, el) {
            return $(el).val();
        }).get();

        $('.attributes').hide();
        $.each(attributes, function(index, attribute) {
            $('.attribute-'+attribute).show();
        });
    }

    (function ($) {
        "use script";

        const showAlert = (status, error) => {
            swal({
                icon: status,
                text: error,
                dangerMode: true,
                buttons: {
                    cancel: false,
                    confirm: {
                        text: "OK",
                        value: true,
                        visible: true,
                        closeModal: true
                    },
                },
            }).then((value) => {
                if(value) form.reset();
            });
        };

        $('.sub-category').on('change', function () {
            var inventory_account_id = $(this).find(':selected').attr('inventory_account_id');
            var cwip_asset_account_id = $(this).find(':selected').attr('cwip_asset_account_id');
            var cogs_account_id = $(this).find(':selected').attr('cogs_account_id');
            var inventory_adjustments_account_id = $(this).find(':selected').attr('inventory_adjustments_account_id');

            var sales_account_id = $(this).find(':selected').attr('sales_account_id');
            var depreciation_cost_account_id = $(this).find(':selected').attr('depreciation_cost_account_id');
            var depreciation_disposal_account_id = $(this).find(':selected').attr('depreciation_disposal_account_id');

            if(inventory_account_id && inventory_account_id != 0){
                $("#inventory_account_id").select2().val(inventory_account_id).trigger("change");
            }

            if(cwip_asset_account_id && cwip_asset_account_id != 0){
                $("#cwip_asset_account_id").select2().val(cwip_asset_account_id).trigger("change");
            }

            if(cogs_account_id && cogs_account_id != 0){
                $("#cogs_account_id").select2().val(cogs_account_id).trigger("change");
            }

            if(inventory_adjustments_account_id && inventory_adjustments_account_id != 0){
                $("#inventory_adjustments_account_id").select2().val(inventory_adjustments_account_id).trigger("change");
            }

            if(sales_account_id && sales_account_id != 0){
                $("#sales_account_id").select2().val(sales_account_id).trigger("change");
            }

            if(depreciation_cost_account_id && depreciation_cost_account_id != 0){
                $("#depreciation_cost_account_id").select2().val(depreciation_cost_account_id).trigger("change");
            }

            if(depreciation_disposal_account_id && depreciation_disposal_account_id != 0){
                $("#depreciation_disposal_account_id").select2().val(depreciation_disposal_account_id).trigger("change");
            }

            updateFinanceSection();
            getDepreciationMethodOptions();

            getSubAssets();
        });
    })(jQuery);

    getDepreciationMethodOptions();

    updateFinanceSection();
    function updateFinanceSection() {
        var product_type = $('.sub-category').find(':selected').attr('data-product-type');
        var is_service = $('.sub-category').find(':selected').attr('data-service');
        $('.ledgers-div').hide();

        if(product_type == 'products'){
            $('.fixed-asset-info').hide();
            
            if(is_service == 1){
                $('.inventory-div').hide();
            }else{
                $('.inventory-div').show();
            }
            
            $('.consumption-div').show();
            $('.service-div').show();
            $('.asset-div').hide();

            $('#inventory-title').html('Inventory Account');
        }else if(product_type == 'fixed_asset'){
            $('.fixed-asset-info').show();
            $('.inventory-div').show();
            $('.consumption-div').hide();
            $('.service-div').hide();
            $('.asset-div').hide();

            $('#inventory-title').html('Asset Account');
        }else if(product_type == 'cwip'){
            $('.fixed-asset-info').show();
            $('.inventory-div').show();
            $('.consumption-div').hide();
            $('.service-div').hide();
            $('.asset-div').show();

            $('#inventory-title').html('CWIP Account');
        }
    }

    function getDepreciationMethodOptions() {
        var depreciation_method = $('#depreciation_method_id');
        var id = depreciation_method.val();
        var code = depreciation_method.find(':selected').attr('data-code');
        var depreciation_rate = depreciation_method.find(':selected').attr('data-depreciation-rate');
        var base_rate = depreciation_method.find(':selected').attr('data-base-rate');
        
        $('.method-options').hide();
        if(code == "D"){
            $('#base_rate').val(base_rate);
            $('.base_rate').show();

            $('.rate_multiplier').show();
        }else if(code == "S"){
            $('.years').show();
            $('#depreciation_rate').val(depreciation_rate).removeAttr('readonly');
            $('.depreciation_rate').show();
        }else if(code == "N"){
            $('.years').show();
        }else if(code == "O"){
            $('#depreciation_rate').val(100).attr('readonly', 'readonly');
            $('.depreciation_rate').show();
        }
    }

    function calculateDepreciationPercentage() {
        if($('#depreciation_method_id').find(':selected').attr('data-code') == "S"){
            var years = $('#years').val();
            $('#depreciation_rate').val(parseFloat(years != "" && years > 0 ? (parseFloat(100)/parseFloat(years)) : parseFloat(0)).toFixed(4));
        }
    }

    function getSubAssets() {
        $.ajax({
            url: "{{ url('pms/cwip/product') }}/"+$('#category_id').val()+"/get-sub-assets",
            type: 'GET',
            data: {},
        })
        .done(function(response) {
            $('#parent_id').html(response).change();
        });
    }

    function getSubAssetCode() {
        var code = $('#parent_id').find(':selected').attr('data-code');
        if(code == ''){
            $('#sku').val($('#sku').attr('data-sku'));
        }else{
            $('#sku').val(code);
        }
    }
</script>
@endsection