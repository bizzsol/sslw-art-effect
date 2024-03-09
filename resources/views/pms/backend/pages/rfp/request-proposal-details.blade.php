<div class="col-md-12">
    <div class="panel panel-info">
        <div class="col-lg-12 invoiceBody">
            <div class="invoice-details mt25 row">
                <div class="well col-6">
                    <strong>Assign to suppliers:</strong>
                    <ul class="list-unstyled mb0">

                        <li><strong>{{__('Name') }} :</strong>
                        {{ $requestProposal->defineToSupplier->pluck('supplier.name')->implode(', ') }}
                        </li>
                    </ul>
                </div>
                <div class="col-6">
                    <ul class="list-unstyled mb0 pull-right">

                        <li><strong>{{__('Date')}} :</strong> {{date('d-m-Y',strtotime($requestProposal->request_date))}}</li>
                        <li><strong>{{__('Reference No')}}:</strong> {{$requestProposal->reference_no}}</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr class="text-center">
                        <th>SL</th>
                        <th>Category</th>
                        <th>Product</th>
                        <th>Qty</th>
                    </tr>
                </thead>

                <tbody>
                    @if(isset($requestProposal->requestProposalDetails[0]))
                    @php
                    $requestQty=0;
                    @endphp
                    @foreach($requestProposal->requestProposalDetails as $key => $requestProposalDetail)
                    <tr>
                        <td class="text-center">{{$key+1}}</td>
                        <td>{{isset($requestProposalDetail->product->category->name)?$requestProposalDetail->product->category->name:''}}</td>
                        <td>{{isset($requestProposalDetail->product->name)?$requestProposalDetail->product->name:''}} {{ isset($requestProposalDetail->product_id)? getProductAttributesFaster($requestProposalDetail->product) :''}}</td>
                        <td class="text-center">{{$requestProposalDetail->request_qty}}</td>
                    </tr>
                    @php
                    $requestQty+=$requestProposalDetail->request_qty;
                    @endphp
                    @endforeach
                    @endif
                    <tr class="text-center">
                        <td colspan="3">Total</td>
                        <td>{{$requestQty}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>