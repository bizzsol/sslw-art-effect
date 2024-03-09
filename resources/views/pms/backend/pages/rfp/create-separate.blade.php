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
                        {!! Form::open(['route' => 'pms.rfp.request-proposal.separate.store',  'files'=> false, 'id'=>'', 'class' => 'form-horizontal rfp-form']) !!}

                        <div class="row">

                            <div class="col-md-2">
                                <div class="form-group">
                                    <div class="form-line">
                                        {!! Form::label('request_date', 'Date', array('class' => 'mb-1 font-weight-bold')) !!} <strong><span class="text-danger">&nbsp;*</span></strong>
                                        {!! Form::text('request_date',request()->old('request_date')?request()->old('request_date'):date('d-m-Y'),['id'=>'request_date','class' => 'form-control rounded air-datepicker','placeholder'=>'','readonly'=>'readonly']) !!}

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-line">
                                        {!! Form::label('reference_no', 'Ref No', array('class' => 'mb-1 font-weight-bold')) !!} <strong><span class="text-danger">&nbsp;*</span></strong>
                                        {!! Form::text('reference_no',(request()->old('reference_no'))?request()->old('reference_no'):'',['id'=>'reference_no','required'=>true,'class' => 'form-control rounded','readonly'=>'readonly']) !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <div class="form-line">
                                        {!! Form::label('supplier_id', 'Select Supplier', array('class' => 'mb-1 font-weight-bold')) !!} <strong><span class="text-danger">&nbsp;*</span></strong>
                                        <select name="supplier_id[]" id="supplier_id" multiple required class="form-control rounded select2 select2-tags">
                                            
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <div class="form-line">
                                        <br>
                                        <a href="{{url('pms/rfp/request-proposal/create')}}" class="btn btn-block btn-sm btn-success text-white" data-toggle="tooltip" title="Crate Combine RFP">
                                            <i class="las la-object-group"></i>Crate Combine RFP
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive style-scroll">
                            <table class="table table-striped table-bordered miw-500 dac_table" cellspacing="0" width="100%" id="dataTable">
                                <thead>
                                    <tr class="text-center">
                                        <th width="5%">{{__('SL')}}</th>
                                        <th>{{__('Requisition No')}}</th>
                                        <th>{{__('Product Name')}}</th>
                                        <th width="10%">{{__('Approved Qty')}}</th>
                                        <th>{{__('UOM')}}</th>
                                        <th class="text-center">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="chkbx_all_first" id="checkAllProduct" onclick="return CheckAll()">
                                                <label class="form-check-label mt-8" for="checkAllProduct">
                                                    <strong>All</strong>
                                                </label>
                                            </div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                    $total_requisition_qty = 0;
                                    $total_approved_qty = 0;
                                    $total_sumOfRFP = 0;
                                    @endphp

                                    @if(count((array) $requisitions)>0)
                                    @foreach($requisitions as $key=>$requisition)
                                    @php $rsl = 0; @endphp
                                    @if($requisition->requisitionItems->where('is_send','no')->count() > 0)
                                    @foreach($requisition->requisitionItems->where('is_send','no') as $rkey => $values)
                                    @php
                                    $rsl++;
                                    $sumOfSendRFP = sumOfSendRFP($values->product_id, $values->requisition_id);
                                    $total_requisition_qty += $values->requisition_qty;
                                    $total_approved_qty += $values->qty;
                                    $total_sumOfRFP += ($values->qty-$sumOfSendRFP);
                                    @endphp
                                    <tr>
                                        @if($rsl == 1)
                                        <td class="text-center" rowspan="{{ $requisition->requisitionItems->where('is_send','no')->count()}}">
                                            {{$key + 1}} 
                                        </td>
                                        <td rowspan="{{ $requisition->requisitionItems->where('is_send','no')->count()}}">
                                           
                                            <a href="javascript:void(0)" data-src="{{route('pms.requisition.list.view.show',$requisition->id)}}" class="btn btn-link requisition m-1 rounded showRequistionDetails">{{ $requisition->reference_no }}</a>
                                        </td>
                                        @endif
                                        
                                        <td>
                                            {{isset($values->product->name)?$values->product->name:''}} {{ getProductAttributesFaster($values->product) }}
                                        </td>

                                        <td>
                                            <input type="number" name="request_qty[{{$values->product_id}}&{{$values->id}}][]" min="1" max="99999999" value="{{($sumOfSendRFP>0)?number_format($values->qty-$sumOfSendRFP,0): $values->qty}}" disabled class="form-control rounded request_qty text-center" onchange="calculateTotal()" readonly onkeyup="calculateTotal()">

                                            @if($sumOfSendRFP >0)
                                            <input type="hidden" name="qty[{{$values->product_id}}&{{$values->id}}][]" value="{{$values->qty-$sumOfSendRFP}}">
                                            @else
                                            <input type="hidden" name="qty[{{$values->product_id}}&{{$values->id}}][]" value="{{$values->qty}}">
                                            @endif
                                        </td>
                                        <td>
                                            {{isset($values->product->productUnit->unit_name)?$values->product->productUnit->unit_name:''}}
                                        </td>
                                        <td class="text-center">
                                            <input type="checkbox" name="requisition_item_id[]"
                                            class="element_first" value="{{$values->id}}" onclick="getRequestProposalCombineInfo()">
                                        </td>
                                    </tr>
                                    @endforeach
                                    @endif
                                    @endforeach
                                    @endif
                                    
                                    <tr>
                                        <td colspan="3">Total:</td>
                                        
                                        <td class="text-center" id="request_qty"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>

                        <div class="row">
                            <div class="col-md-6">

                            </div>
                            <div class="col-md-3 text-right pt-2">
                                <label class="btn btn-xs rounded font-5 mt-10 pull-right ">
                                    <input type="checkbox" name="type" class="" value='online'> Allow Online Quotation
                                </label>
                            </div>
                            <div class="col-md-3">
                                <button data-placement="top" data-content="click save changes button for send rfp" type="submit" class="btn-block btn btn-success rounded font-10 mt-10 submit-button"><i class="la la-check"></i>&nbsp;Send to supplier</button>
                            </div>
                        </div>

                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="requisitionDetailModal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Requisitions Details</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body" id="tableData"></div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
@endsection
@section('page-script')
<script>
    getRequestProposalCombineInfo();
    function getRequestProposalCombineInfo() {
        $('#supplier_id').html('');
        
        var items = [];
        $.each($("input.element_first:checked"), function (key, value) {    
            items.push(value.value);        
        });

        $.ajax({
            url: "{{ url('pms/rfp/request-proposal-separate-info') }}",
            type: 'POST',
            dataType: 'json',
            data: {_token: "{{ csrf_token() }}", items: items},
        })
        .done(function(response) {
            $('#reference_no').val(response.reference_no);
            var suppliers = '';
            $.each(response.suppliers, function(index, val) {
                suppliers += '<option value="'+(val.id)+'">'+(val.name)+' ('+(val.code)+')</option>';
            });
            $('#supplier_id').html(suppliers);
        })
        .fail(function(response) {
            $('#reference_no').val('');
            $('#supplier_id').html('');
        });
    }

    function CheckAll() {
        if ($('#checkAllProduct').is(':checked')) {
            $('input.element_first').prop('checked', true);
        } else {
            $('input.element_first').prop('checked', false);
        }

        $.each($('.element_first'), function(index, val) {
            updateElement($(this));
        });

        getRequestProposalCombineInfo();
    }

    $('.element_first').click(function(event) {
        updateElement($(this));
    });

    function updateElement(element){
        if(element.is(':checked')){
            element.parent().prev().find('input').prop('disabled', false);
            element.parent().prev().prev().find('input').prop('disabled', false);
            element.prop('checked', true);
        }else{
            element.parent().prev().find('input').prop('disabled', true);
            element.parent().prev().prev().find('input').prop('disabled', true);
            element.prop('checked', false);
        }

        calculateTotal();
    }

    calculateTotal();
    function calculateTotal(){
        var total = 0;
        $.each($('.request_qty'), function(index, val) {
            if(!$(this).prop('disabled')){
                total += ($(this).val() != "" ? parseInt($(this).val()) : 0);
            }
        });

        $('#request_qty').html(total);
    }

    $(document).ready(function() {
        var form = $('.rfp-form');
        var button = $('.submit-button');
        var button_content = button.html();
        form.submit(function(event) {
            event.preventDefault();
            button.html('<i class="las la-spinner"></i>&nbsp;Please wait...').prop('disabled', true);

            $.ajax({
                url: form.attr('action'),
                type: form.attr('method'),
                dataType: 'json',
                data: form.serializeArray(),
            })
            .done(function(response) {
                if(response.success){
                    location.reload();
                }else{
                    toastr.error(response.message);
                }
                button.html(button_content).prop('disabled', false);
            })
            .fail(function(response) {
                button.html(button_content).prop('disabled', false);
                $.each(response.responseJSON.errors, function(index, val) {
                    toastr.error(val[0]);
                });
            });
        });
    });

</script>
@endsection
