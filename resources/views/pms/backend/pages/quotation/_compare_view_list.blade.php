@extends('pms.backend.layouts.master-layout')
@section('title', session()->get('system-information')['name']. ' | '.$title)
@section('page-css')
<style type="text/css">
    .form-check-input{
        margin-top: -4px !important;
    }

    @if($quotations->count() > 2)
        thead, tbody tr {
            display:table;
            width: 2000px;
            table-layout:fixed;
        }
        thead {
            width: calc( 2000px)
        } 
        ul {
            list-style: none;
        }
    @endif
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
                <li>
                    <a href="#">PMS</a>
                </li>
                <li class="active">{{__($title)}}</li>
                <li class="top-nav-btn">
                    <a href="javascript:history.back()" class="btn btn-sm btn-warning text-white" data-toggle="tooltip" title="Back" > <i class="las la-chevron-left"></i>Back</a>
                </li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="">
                <div class="panel panel-body">
                   {!! Form::open(['route' => 'pms.quotation.quotations.cs.compare.approved',  'files'=> false, 'id'=>'', 'class' => 'cs-from']) !!}
                   <div class="row">

                    <div class="col-md-12">

                        <div class="panel panel-info">
                            <div class="col-lg-12 invoiceBody">
                                <div class="invoice-details mt25 row">
                                    @if($quotations)
                                    @foreach($quotations as $key=>$quotation)
                                    @if($key==0)

                                    <div class="col-md-6 well">
                                        <ul class="list-unstyled mb0">
                                            <li><strong>{{__('Request Proposal No')}} :</strong> {{$quotation->relRequestProposal->reference_no}}</li>
                                            <li><strong>Project Name:</strong></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6 well">
                                        <ul class="list-unstyled mb0">
                                            <li><strong>{{__('RFP Provide By')}} :</strong> {{$quotation->relRequestProposal->createdBy->name}}</li>
                                            <li><strong>{{__('RFP Date')}} :</strong> {{date('d-m-Y h:i:s A',strtotime($quotation->relRequestProposal->request_date))}}</li>
                                        </ul>
                                    </div>
                                    @endif
                                    @endforeach
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover ">
                                    <thead>
                                        <tr>
                                            <th colspan="5">Party Name</th>
                                            @foreach($quotations as $q_key => $quotation)
                                            @php 
                                                $TS = number_format($quotation->relSuppliers->SupplierRatings->sum('total_score'), 2);
                                                $TC = $quotation->relSuppliers->SupplierRatings->count();

                                                $totalScore = isset($TS)?$TS:0;
                                                $totalCount = isset($TC)?$TC:0;
                                            @endphp
                                            <th class="invoiceBody" colspan="{{ $systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : '') ? 4 : 3 }}">
                                                <p class="ratings text-dark">
                                                    <a href="{{route('pms.supplier.profile',$quotation->relSuppliers->id)}}" target="_blank"><span>{{$quotation->relSuppliers->name}} ({{$quotation->relSuppliers->code}})</span></a> 
                                                    @if(in_array($quotation->type,['manual','online']))
                                                    ({!! ratingGenerate($totalScore,$totalCount) !!})
                                                    @endif
                                                </p>
                                                <p class="text-dark"><strong>{{__('Q:Ref:No')}}:</strong> {{$quotation->reference_no}}</p>
                                                <input type="hidden" name="request_proposal_id" value="{{$quotation->request_proposal_id}}">
                                                {{-- <p>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="quotation_id" id="is_approved_{{$quotation->id}}" value="{{$quotation->id}}" required>
                                                        
                                                        <label class="form-check-label" for="is_approved_{{$quotation->id}}">
                                                            <strong>Approval</strong>
                                                        </label>
                                                    </div>
                                                </p> --}}
                                            </th>
                                            @endforeach
                                        </tr>
                                        <tr class="text-center">
                                            <th>SL</th>
                                            <th>Category</th>
                                            <th>Product</th>
                                            <th>UOM</th>
                                            <th class="text-center">Qty</th>
                                            @foreach($quotations as $quotation)
                                            <th class="text-center" style="width: 25px">
                                                <input type="checkbox" name="quotaion_radios" value="{{ $quotation->id }}" class="quotation-radios quotation-radio-{{ $quotation->id }}" data-quotation-id="{{ $quotation->id }}" style="cursor: pointer;transform: scale(1.5, 1.5)">
                                            </th>
                                            <th class="text-center">Unit Price ({{ $quotation->exchangeRate ? $quotation->exchangeRate->currency->code : '' }})</th>
                                            <th class="text-center">Item Total ({{ $quotation->exchangeRate ? $quotation->exchangeRate->currency->code : '' }})</th>
                                            @if($systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : ''))
                                            <th class="text-center">Item Total ({{ $systemCurrency->code }})</th>
                                            @endif
                                            @endforeach
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php $total_qty = 0; @endphp
                                        @if(isset($quotation->id))
                                        @foreach($quotation->relQuotationItems as $key=>$item)
                                        <tr>
                                            <td class="text-right">{{$key+1}}</td>
                                            <td>{{isset($item->relProduct->category->name)?$item->relProduct->category->name:''}}</td>
                                            <td>{{isset($item->relProduct->name)?$item->relProduct->name:''}} {{isset($item->relProduct->id)? getProductAttributesFaster($item->relProduct):''}}</td>
                                            <td>{{isset($item->relProduct->productUnit->unit_name)?$item->relProduct->productUnit->unit_name:''
                                            }}</td>
                                            <td class="text-center">{{$item->qty}}</td>

                                            @foreach($quotations as $key=>$quotation)
                                            @php
                                                $this_prices = ($quotation->relQuotationItems->where('product_id', $item->product_id)->count() > 0 ? collect($quotation->relQuotationItems->where('product_id', $item->product_id)->first()) : false);
                                                $item_id = $quotation->relQuotationItems->where('product_id', $item->product_id)->first()->id;
                                            @endphp
                                            <td class="text-center">
                                                <input type="checkbox" name="item_radios[{{ $item->id }}]" value="{{ $item_id }}" class="item-radios item-radio-{{ $quotation->id }} itemized-radio-{{ $item->id }}" data-quotation-id="{{ $quotation->id }}" data-item-id="{{ $item->id }}" style="cursor: pointer;transform: scale(1.5, 1.5);">
                                            </td>
                                            <td class="text-right">{{number_format(isset($this_prices['unit_price']) ? $this_prices['unit_price'] : 0, 2)}}</td>
                                            <td class="text-right">{{number_format(isset($this_prices['sub_total_price']) ? $this_prices['sub_total_price'] : 0,2)}}</td>
                                            @if($systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : ''))
                                            <td class="text-right">{{number_format(isset($this_prices['sub_total_price']) ? $this_prices['sub_total_price']*exchangeRate($quotation->exchangeRate, $systemCurrency->id) : 0,2)}}</td>
                                            @endif
                                            @endforeach

                                        </tr>
                                        @php $total_qty += $item->qty; @endphp
                                        @endforeach
                                        @endif
                                        
                                        <tr>
                                            <td colspan="4" class="text-right"><strong>Total</strong></td>
                                            <td class="text-right"><strong>{{$total_qty}}</strong></td>
                                            @foreach($quotations as $key => $quotation)
                                            <td colspan="2"><strong>Sub Total</strong></td>
                                            <td class="text-right"><strong>{{number_format($quotation->relQuotationItems->sum('sub_total_price'),2)}}</strong></td>
                                            @if($systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : ''))
                                            <td class="text-right"><strong>{{number_format($quotation->relQuotationItems->sum('sub_total_price')*exchangeRate($quotation->exchangeRate, $systemCurrency->id),2)}}</strong></td>
                                            @endif
                                            @endforeach
                                        </tr>

                                        <tr>
                                            <td colspan="5" class="text-right"></td>
                                            @foreach($quotations as $key=>$quotation)
                                            <td colspan="2"><strong>(-) Discount</strong></td>
                                            <td class="text-right"><strong>{{number_format($quotation->discount,2)}}</strong>
                                            </td>
                                            @if($systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : ''))
                                            <td class="text-right"><strong>{{number_format($quotation->discount*exchangeRate($quotation->exchangeRate, $systemCurrency->id),2)}}</strong>
                                            </td>
                                            @endif
                                            @endforeach
                                        </tr>

                                        <tr>
                                            <td colspan="5" class="text-right"></td>

                                            @foreach($quotations as $key=>$quotation)
                                            <td colspan="2"><strong>(+) Vat </strong></td>
                                            <td class="text-right"><strong>{{$quotation->vat}}</strong>
                                            </td>
                                            @if($systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : ''))
                                            <td class="text-right"><strong>{{$quotation->vat*exchangeRate($quotation->exchangeRate, $systemCurrency->id)}}</strong>
                                            </td>
                                            @endif
                                            @endforeach
                                        </tr>
                                        <tr>
                                            <td colspan="5" class="text-right"></td>

                                            @foreach($quotations as $key=>$quotation)
                                            <td colspan="2"><strong>Gross Total</strong></td>
                                            <td class="text-right"><strong><?= number_format($quotation->gross_price,2); ?> </strong>
                                            </td>
                                            @if($systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : ''))
                                            <td class="text-right"><strong><?= number_format($quotation->gross_price*exchangeRate($quotation->exchangeRate, $systemCurrency->id),2); ?> </strong>
                                            </td>
                                            @endif
                                            @endforeach
                                        </tr>

                                        <tr>
                                            <td colspan="5"></td>
                                            @foreach($quotations as $key=>$quotation)
                                            <td colspan="{{ $systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : '') ? 4 : 3 }}" class="text-left">
                                                Payment Term: 
                                                <strong>{{ makePaymentTermsString($quotation->supplier_payment_terms_id)}}</strong>
                                            </td>
                                            @endforeach
                                        </tr>
                                        <tr>
                                            <td colspan="5" class="text-right"></td>
                                            @foreach($quotations as $key => $quotation)
                                            <td colspan="{{ $systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : '') ? 4 : 3 }}">
                                                Delivery Date: <span><strong>{!! date('l d M Y', strtotime($quotation->delivery_date)) !!}</strong></span></td>
                                            @endforeach
                                        </tr>
                                        <tr>
                                            <td colspan="5" class="text-right">Notes</td>
                                            @foreach($quotations as $key => $quotation)
                                            <td colspan="{{ $systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : '') ? 4 : 3 }}"><span><strong>@if(!empty($quotation->note)) {{ $quotation->creator->name }}: @endif</strong>{!! $quotation->note !!}</span></td>
                                            @endforeach
                                        </tr>
                                        <tr>
                                            <td colspan="5" class="text-right">Remarks</td>
                                            @foreach($quotations as $key=>$quotation)
                                            <td colspan="{{ $systemCurrency->code != ($quotation->exchangeRate ? $quotation->exchangeRate->currency->code : '') ? 4 : 3 }}"><textarea class="form-control" name="remarks" rows="1" id="remarks" placeholder="What is the reason for choosing this supplier?">{!! $quotation->remarks?$quotation->remarks:'' !!}</textarea></td>
                                            @endforeach
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success cs-button"><i class="la la-check"></i>&nbsp;Approve</button>
                        <a type="button" class="btn btn-warning" onclick="rejectAllQuotation('{{route('pms.quotation.quotations.reject.all',$requestProposalId)}}?type={{ request()->get('type') }}')"><i class="la la-ban"></i>&nbsp;Reject All</a>
                        <a type="button" class="btn btn-danger" href="{{route('pms.quotation.approval.list')}}"><i class="la la-times"></i>&nbsp;Close</a>
                    </div>
                </div>
            </div>
        @endif

        {!! Form::close() !!}
    </div>
</div>
</div>
</div>
</div>
@endsection

@section('page-script')
<script type="text/javascript">
    function rejectAllQuotation(link){
        swal({
            title: "Are you sure ?",
            text: "Once you Reject, All these quotation will be rejected.",
            icon: "warning",
            dangerMode: true,
            buttons: {
                cancel: true,
                confirm: {
                    text: "Reject All",
                    value: true,
                    visible: true,
                    closeModal: true
                },
            },
        }).then((value) => {
            if(value){
                window.open(link, "_parent");
            }
        });
    }

    $(document).ready(function() {
        $.each($('.quotation-radios'), function(index, val) {
            var radio = $(this);
            radio.click(function(event) {
                $.each($('.quotation-radios'), function(index, val) {
                    if($(this).val() == radio.attr('data-quotation-id')){
                        $(this).prop('checked', radio.is(':checked'));
                    }else{
                        $(this).prop('checked', false);
                    }
                });

                $('.item-radios').prop('checked', false);
                $('.item-radio-'+radio.attr('data-quotation-id')).prop('checked', radio.is(':checked'));
            });
        });

        $.each($('.item-radios'), function(index, val) {
            var radio = $(this);

            radio.click(function(event) {
                $.each($('.itemized-radio-'+radio.attr('data-item-id')), function(index, val) {
                    if($(this).attr('data-quotation-id') == radio.attr('data-quotation-id')){
                        $(this).prop('checked', radio.is(':checked'));
                    }else{
                        $(this).prop('checked', false);
                    }
                });

                $.each($('.quotation-radios'), function(index, val) {
                    var quotation_id = $(this).attr('data-quotation-id');
                    var total_radios = 0;
                    var checked_radios = 0;
                    $.each($('.item-radio-'+quotation_id), function(index, val) {
                        total_radios++;
                        if($(this).is(':checked')){
                            checked_radios++;
                        }
                    });
                    $('.quotation-radio-'+quotation_id).prop('checked', (checked_radios > 0 && (total_radios - checked_radios == 0)));
                });
            });
        });

        var form = $('.cs-from');
        var button = $('.cs-button');
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
                    window.open(response.url, "_parent");
                }else{
                   toastr.error(response.message); 
                }
                button.html(button_content).prop('disabled', false);
            })
            .fail(function(response) {
                $.each(response.responseJSON.errors, function(index, val) {
                    toastr.error(val[0]);
                });
            });
        });
    });
</script>
@endsection